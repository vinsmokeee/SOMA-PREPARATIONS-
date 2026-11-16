-- =============================================================================
-- Soma Preparations — Migration 0018: Commerce, subscriptions and account
-- security (Milestone 8). Additive: existing packages, orders and entitlements
-- are kept and extended.
--
-- Payments are provider-independent: every payment method (manual transfer,
-- the test sandbox, a future bank gateway) records payment_transactions and
-- payment_events; ONLY confirm_payment() (server key or an approving admin)
-- turns a paid order into access. It is idempotent.
-- =============================================================================

alter type public.order_status add value if not exists 'failed';
alter type public.order_status add value if not exists 'expired';

-- -----------------------------------------------------------------------------
-- Settings
-- -----------------------------------------------------------------------------
insert into public.app_settings (key, value, is_public) values
  ('payments.config', jsonb_build_object(
     'manual_enabled', true,
     'gateway_provider', null,              -- e.g. 'bank_xyz' once an adapter is live
     'sandbox_enabled', false,               -- test gateway: admins only
     'order_expiry_hours', 72,
     'manual_instructions', 'Pay the exact amount shown using one of the methods below, then submit the transaction (journal) number and a screenshot. Access starts after Soma verifies the payment, usually within one working day.',
     'manual_methods', '[]'::jsonb,          -- [{label, details}] e.g. bank account, mBoB / mPay details — set in admin
     'expiry_reminder_days', jsonb_build_array(7, 1)
   ), false),
  ('security.config', jsonb_build_object(
     'max_concurrent_sessions', 2,
     'new_device_window_days', 7,
     'max_devices_per_window', 4,
     'failed_login_threshold', 8,
     'flag_after_elevated_events', 3
   ), false)
on conflict (key) do nothing;

create or replace function public.setting(_key text)
returns jsonb language sql stable security definer set search_path = '' as $$
  select coalesce((select value from public.app_settings where key = _key), '{}'::jsonb)
$$;
revoke all on function public.setting(text) from public, anon, authenticated;
grant execute on function public.setting(text) to service_role;

-- -----------------------------------------------------------------------------
-- Packages (configurable; nothing hardcoded)
-- -----------------------------------------------------------------------------
alter table public.packages
  add column programme text not null default 'bcse' check (programme ~ '^[a-z0-9_-]+$'),
  add column category_id uuid references public.exam_categories (id) on delete set null,   -- ME entry group, optional
  add column feature_keys text[] not null default '{}',        -- e.g. {pe_practice, me_practice, mock_exams, ca_archive, ai_evaluation}
  add column ai_evaluations int check (ai_evaluations is null or ai_evaluations >= 0),
  add column renewable boolean not null default true,
  add column promo_allowed boolean not null default true;

-- -----------------------------------------------------------------------------
-- Orders, transactions, events, refunds
-- -----------------------------------------------------------------------------
alter table public.orders
  add column subtotal numeric(10, 2),
  add column discount numeric(10, 2) not null default 0 check (discount >= 0),
  add column coupon_id uuid,
  add column provider text,
  add column kind text not null default 'new' check (kind in ('new', 'renewal')),
  add column expires_at timestamptz,
  add column paid_at timestamptz,
  add column entitlement_id uuid references public.entitlements (id) on delete set null;
create unique index orders_one_open_per_package on public.orders (user_id, package_id)
  where status in ('pending_payment', 'awaiting_verification');

create table public.payment_transactions (
  id              uuid primary key default gen_random_uuid(),
  order_id        uuid not null references public.orders (id) on delete restrict,
  provider        text not null check (provider ~ '^[a-z0-9_]+$'),
  provider_ref    text check (provider_ref is null or char_length(provider_ref) <= 200),
  amount          numeric(10, 2) not null check (amount >= 0),
  currency        text not null default 'BTN',
  status          text not null default 'initiated'
                  check (status in ('initiated', 'pending', 'submitted', 'succeeded', 'failed', 'cancelled', 'refunded', 'rejected')),
  payer_reference text check (payer_reference is null or char_length(payer_reference) <= 120),  -- manual: journal number
  proof_path      text check (proof_path is null or proof_path ~ '^[0-9a-f-]{36}/[A-Za-z0-9_-]+\.(jpg|jpeg|png|webp|pdf)$'),
  failure_reason  text,
  raw             jsonb,
  reviewed_by     uuid references auth.users (id) on delete set null,
  reviewed_at     timestamptz,
  review_note     text,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);
create unique index payment_transactions_provider_ref_uniq on public.payment_transactions (provider, provider_ref) where provider_ref is not null;
create index payment_transactions_order_idx on public.payment_transactions (order_id);
create index payment_transactions_status_idx on public.payment_transactions (status, created_at desc);
create index payment_transactions_payer_ref_idx on public.payment_transactions (lower(payer_reference)) where payer_reference is not null;
create trigger payment_transactions_updated_at before update on public.payment_transactions for each row execute function public.set_updated_at();
create trigger audit_payment_transactions after insert or update or delete on public.payment_transactions for each row execute function public.audit_row_change();

create table public.payment_events (
  id             uuid primary key default gen_random_uuid(),
  provider       text not null,
  event_id       text not null,
  transaction_id uuid references public.payment_transactions (id) on delete set null,
  event_type     text,
  signature_ok   boolean not null default false,
  payload        jsonb,
  outcome        text,
  received_at    timestamptz not null default now(),
  unique (provider, event_id)
);

create table public.refunds (
  id             uuid primary key default gen_random_uuid(),
  order_id       uuid not null references public.orders (id) on delete restrict,
  transaction_id uuid references public.payment_transactions (id) on delete set null,
  amount         numeric(10, 2) not null check (amount > 0),
  reason         text not null check (char_length(reason) between 3 and 1000),
  status         text not null default 'requested' check (status in ('requested', 'processing', 'succeeded', 'failed')),
  provider_ref   text,
  created_by     uuid references auth.users (id) on delete set null,
  created_at     timestamptz not null default now(),
  completed_at   timestamptz
);
create trigger audit_refunds after insert or update or delete on public.refunds for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Coupons
-- -----------------------------------------------------------------------------
create table public.coupons (
  id              uuid primary key default gen_random_uuid(),
  code            text not null check (code ~ '^[A-Z0-9_-]{3,40}$'),
  description     text,
  kind            text not null check (kind in ('percent', 'fixed')),
  value           numeric(10, 2) not null check (value > 0),
  package_ids     uuid[],                 -- null = all packages
  user_id         uuid references auth.users (id) on delete cascade,   -- student-specific offer
  max_redemptions int check (max_redemptions is null or max_redemptions > 0),
  per_user_limit  int not null default 1 check (per_user_limit > 0),
  starts_at       timestamptz,
  ends_at         timestamptz,
  is_active       boolean not null default true,
  created_by      uuid references auth.users (id) on delete set null,
  created_at      timestamptz not null default now(),
  check (kind <> 'percent' or value <= 100)
);
create unique index coupons_code_uniq on public.coupons (code);
create trigger audit_coupons after insert or update or delete on public.coupons for each row execute function public.audit_row_change();

create table public.coupon_redemptions (
  id         uuid primary key default gen_random_uuid(),
  coupon_id  uuid not null references public.coupons (id) on delete cascade,
  user_id    uuid not null references auth.users (id) on delete cascade,
  order_id   uuid not null unique references public.orders (id) on delete cascade,
  status     text not null default 'reserved' check (status in ('reserved', 'used', 'released')),
  created_at timestamptz not null default now()
);
create index coupon_redemptions_coupon_idx on public.coupon_redemptions (coupon_id, status);
alter table public.orders add constraint orders_coupon_fk foreign key (coupon_id) references public.coupons (id) on delete set null;

-- -----------------------------------------------------------------------------
-- Subscriptions (entitlements) and their history
-- -----------------------------------------------------------------------------
alter table public.entitlements
  add column status text not null default 'active' check (status in ('active', 'suspended', 'refunded', 'revoked')),
  add column source text not null default 'purchase' check (source in ('purchase', 'renewal', 'complimentary', 'promotional', 'manual')),
  add column suspended_at timestamptz,
  add column status_reason text,
  add column updated_at timestamptz not null default now();
create trigger entitlements_updated_at before update on public.entitlements for each row execute function public.set_updated_at();

create table public.subscription_events (
  id             uuid primary key default gen_random_uuid(),
  entitlement_id uuid references public.entitlements (id) on delete cascade,
  user_id        uuid not null references auth.users (id) on delete cascade,
  kind           text not null check (kind in ('created', 'renewed', 'extended', 'suspended', 'restored', 'refunded', 'revoked', 'expired', 'complimentary')),
  detail         jsonb not null default '{}'::jsonb,
  actor_id       uuid references auth.users (id) on delete set null,
  created_at     timestamptz not null default now()
);
create index subscription_events_user_idx on public.subscription_events (user_id, created_at desc);

-- -----------------------------------------------------------------------------
-- Profiles: pathway and account status
-- -----------------------------------------------------------------------------
alter table public.profiles
  add column pathway text check (pathway in ('PE', 'ME', 'both')),
  add column entry_category_id uuid references public.exam_categories (id) on delete set null,
  add column onboarded_at timestamptz,
  add column account_status text not null default 'active' check (account_status in ('active', 'restricted')),
  add column restricted_reason text,
  add column restricted_at timestamptz;

-- Profiles may be edited by their owner except the account-status fields.
create or replace function public.guard_profile_status()
returns trigger language plpgsql set search_path = '' as $$
begin
  if (new.account_status is distinct from old.account_status or new.restricted_reason is distinct from old.restricted_reason
      or new.restricted_at is distinct from old.restricted_at)
     and auth.uid() is not null and not public.has_permission('users.manage') then
    raise exception 'Only administrators can change account status';
  end if;
  return new;
end;
$$;
create trigger profiles_status_guard before update on public.profiles for each row execute function public.guard_profile_status();
revoke execute on function public.guard_profile_status() from public, anon, authenticated;

-- -----------------------------------------------------------------------------
-- Devices, sessions, sign-in activity, security flags
-- -----------------------------------------------------------------------------
create table public.user_devices (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users (id) on delete cascade,
  device_key  text not null check (device_key ~ '^[0-9a-f]{64}$'),   -- sha-256 of the device cookie
  label       text check (label is null or char_length(label) <= 120),
  first_seen  timestamptz not null default now(),
  last_seen   timestamptz not null default now(),
  last_country text check (last_country is null or last_country ~ '^[A-Z]{2}$'),
  trusted     boolean not null default false,
  revoked_at  timestamptz,
  unique (user_id, device_key)
);

create table public.user_sessions (
  id                     uuid primary key,          -- Supabase Auth session id (JWT session_id)
  user_id                uuid not null references auth.users (id) on delete cascade,
  device_id              uuid references public.user_devices (id) on delete set null,
  country                text,
  user_agent             text check (user_agent is null or char_length(user_agent) <= 300),
  created_at             timestamptz not null default now(),
  last_seen_at           timestamptz not null default now(),
  verification_required  boolean not null default false,
  revoked_at             timestamptz,
  revoked_reason         text
);
create index user_sessions_user_idx on public.user_sessions (user_id, last_seen_at desc);

create table public.login_events (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid references auth.users (id) on delete cascade,
  email_hash text,
  kind       text not null check (kind in ('sign_in', 'sign_in_failed', 'new_device', 'session_revoked', 'session_limit', 'verification_required', 'verified', 'risk_elevated')),
  device_id  uuid references public.user_devices (id) on delete set null,
  country    text,
  detail     jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create index login_events_user_idx on public.login_events (user_id, created_at desc);
create index login_events_email_idx on public.login_events (email_hash, created_at desc) where email_hash is not null;

create table public.security_flags (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users (id) on delete cascade,
  kind        text not null,
  detail      jsonb not null default '{}'::jsonb,
  status      text not null default 'open' check (status in ('open', 'dismissed', 'actioned')),
  created_at  timestamptz not null default now(),
  reviewed_by uuid references auth.users (id) on delete set null,
  reviewed_at timestamptz,
  note        text
);
create index security_flags_status_idx on public.security_flags (status, created_at desc);

-- -----------------------------------------------------------------------------
-- Notifications (in-app; e-mail when a provider is configured)
-- -----------------------------------------------------------------------------
create table public.notifications (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references auth.users (id) on delete cascade,
  kind         text not null,
  title        text not null check (char_length(title) <= 200),
  body         text check (body is null or char_length(body) <= 2000),
  link         text check (link is null or link ~ '^/'),
  dedupe_key   text,
  email_status text not null default 'none' check (email_status in ('none', 'queued', 'sent', 'failed')),
  read_at      timestamptz,
  created_at   timestamptz not null default now()
);
create index notifications_user_idx on public.notifications (user_id, created_at desc);
create unique index notifications_dedupe_uniq on public.notifications (user_id, dedupe_key) where dedupe_key is not null;
create index notifications_email_idx on public.notifications (email_status) where email_status = 'queued';

create or replace function public.notify(_user uuid, _kind text, _title text, _body text, _link text, _dedupe text default null, _email boolean default true)
returns void language plpgsql security definer set search_path = '' as $$
begin
  insert into public.notifications (user_id, kind, title, body, link, dedupe_key, email_status)
  values (_user, _kind, _title, _body, _link, _dedupe, case when _email then 'queued' else 'none' end)
  on conflict (user_id, dedupe_key) where dedupe_key is not null do nothing;
end;
$$;
revoke all on function public.notify(uuid, text, text, text, text, text, boolean) from public, anon, authenticated;

-- -----------------------------------------------------------------------------
-- RLS
-- -----------------------------------------------------------------------------
alter table public.payment_transactions enable row level security;
alter table public.payment_events enable row level security;
alter table public.refunds enable row level security;
alter table public.coupons enable row level security;
alter table public.coupon_redemptions enable row level security;
alter table public.subscription_events enable row level security;
alter table public.user_devices enable row level security;
alter table public.user_sessions enable row level security;
alter table public.login_events enable row level security;
alter table public.security_flags enable row level security;
alter table public.notifications enable row level security;

create policy payment_transactions_read on public.payment_transactions for select to authenticated
  using (public.has_permission('payments.verify') or public.has_permission('orders.manage')
         or exists (select 1 from public.orders o where o.id = order_id and o.user_id = auth.uid()));
create policy payment_events_staff on public.payment_events for select to authenticated using (public.has_permission('payments.verify'));
create policy refunds_read on public.refunds for select to authenticated
  using (public.has_permission('payments.verify') or exists (select 1 from public.orders o where o.id = order_id and o.user_id = auth.uid()));
create policy coupons_staff on public.coupons for all to authenticated
  using (public.has_permission('packages.manage')) with check (public.has_permission('packages.manage'));
create policy coupon_redemptions_read on public.coupon_redemptions for select to authenticated
  using (user_id = auth.uid() or public.has_permission('packages.manage'));
create policy subscription_events_read on public.subscription_events for select to authenticated
  using (user_id = auth.uid() or public.has_permission('payments.verify') or public.has_permission('users.manage'));
create policy user_devices_read on public.user_devices for select to authenticated
  using (user_id = auth.uid() or public.has_permission('users.manage'));
create policy user_sessions_read on public.user_sessions for select to authenticated
  using (user_id = auth.uid() or public.has_permission('users.manage'));
create policy login_events_read on public.login_events for select to authenticated
  using (user_id = auth.uid() or public.has_permission('users.manage'));
create policy security_flags_staff on public.security_flags for all to authenticated
  using (public.has_permission('users.manage')) with check (public.has_permission('users.manage'));
create policy notifications_own on public.notifications for select to authenticated using (user_id = auth.uid());
create policy notifications_mark_read on public.notifications for update to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());
-- Students may only change read_at on their notifications.
revoke update on public.notifications from authenticated;
grant update (read_at) on public.notifications to authenticated;

-- Entitlements are written only by functions below from now on.
drop policy if exists entitlements_write on public.entitlements;
-- Orders: students never write directly (functions only).

-- -----------------------------------------------------------------------------
-- Access check: active, in date, not suspended, account not restricted
-- -----------------------------------------------------------------------------
create or replace function public.has_stage_access(_stage public.exam_stage)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1
    from public.entitlements e
    join public.packages p on p.id = e.package_id
    where e.user_id = auth.uid()
      and e.revoked_at is null
      and e.status = 'active'
      and e.starts_at <= now()
      and (e.ends_at is null or e.ends_at > now())
      and ((_stage = 'PE' and p.includes_pe) or (_stage = 'ME' and p.includes_me))
  ) and not exists (select 1 from public.profiles pr where pr.id = auth.uid() and pr.account_status = 'restricted');
$$;

create or replace function public.has_feature(_feature text)
returns boolean language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.entitlements e join public.packages p on p.id = e.package_id
    where e.user_id = auth.uid() and e.revoked_at is null and e.status = 'active'
      and e.starts_at <= now() and (e.ends_at is null or e.ends_at > now())
      and _feature = any (p.feature_keys)
  ) and not exists (select 1 from public.profiles pr where pr.id = auth.uid() and pr.account_status = 'restricted');
$$;
revoke all on function public.has_feature(text) from public;
grant execute on function public.has_feature(text) to authenticated, service_role;

-- AI evaluation allowance (M5) now prefers the package's own number when set.
create or replace function public.my_evaluation_allowance()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _cfg jsonb := public.evaluation_config();
  _since timestamptz;
  _limit int;
  _pkg_limit int;
  _used int;
  _paid boolean;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select min(e.starts_at), max(p.ai_evaluations) into _since, _pkg_limit
  from public.entitlements e join public.packages p on p.id = e.package_id
  where e.user_id = _uid and e.revoked_at is null and e.status = 'active' and p.includes_me and e.starts_at <= now()
    and (e.ends_at is null or e.ends_at > now());
  _paid := _since is not null;
  _limit := case when _paid then coalesce(_pkg_limit, (_cfg ->> 'me_package_total')::int, 100)
                 else coalesce((_cfg ->> 'free_total')::int, 3) end;
  select count(*) into _used from public.evaluations ev
  where ev.requested_by = _uid and ev.method = 'ai_feedback' and ev.status not in ('failed', 'withdrawn')
    and (not _paid or ev.assigned_at >= _since);
  return jsonb_build_object('limit', _limit, 'used', _used, 'remaining', greatest(_limit - _used, 0), 'plan', case when _paid then 'me' else 'free' end);
end;
$$;

-- =============================================================================
-- Prices and coupons
-- =============================================================================
create or replace function public.package_price(_p public.packages)
returns numeric language sql stable set search_path = '' as $$
  select case when _p.promo_price is not null
                and (_p.promo_starts_at is null or _p.promo_starts_at <= now())
                and (_p.promo_ends_at is null or _p.promo_ends_at > now())
              then _p.promo_price else _p.price end
$$;

-- Validates a coupon for the caller and package; returns (coupon id, discount, message).
create or replace function public.coupon_check(_code text, _package public.packages, _uid uuid, _subtotal numeric)
returns table (coupon_id uuid, discount numeric, message text)
language plpgsql stable security definer set search_path = '' as $$
#variable_conflict use_column
declare _c public.coupons%rowtype; _used int; _mine int;
begin
  if _code is null or btrim(_code) = '' then return query select null::uuid, 0::numeric, null::text; return; end if;
  select * into _c from public.coupons where code = upper(btrim(_code));
  if _c.id is null or not _c.is_active then return query select null::uuid, 0::numeric, 'This code is not valid.'::text; return; end if;
  if _c.starts_at is not null and _c.starts_at > now() then return query select null::uuid, 0::numeric, 'This code is not active yet.'::text; return; end if;
  if _c.ends_at is not null and _c.ends_at <= now() then return query select null::uuid, 0::numeric, 'This code has expired.'::text; return; end if;
  if not _package.promo_allowed then return query select null::uuid, 0::numeric, 'Codes cannot be used for this package.'::text; return; end if;
  if _c.package_ids is not null and not (_package.id = any (_c.package_ids)) then return query select null::uuid, 0::numeric, 'This code does not apply to this package.'::text; return; end if;
  if _c.user_id is not null and _c.user_id is distinct from _uid then return query select null::uuid, 0::numeric, 'This code is not valid.'::text; return; end if;
  select count(*) into _used from public.coupon_redemptions where coupon_id = _c.id and status in ('reserved', 'used');
  if _c.max_redemptions is not null and _used >= _c.max_redemptions then return query select null::uuid, 0::numeric, 'This code has been fully used.'::text; return; end if;
  select count(*) into _mine from public.coupon_redemptions where coupon_id = _c.id and user_id = _uid and status = 'used';
  if _mine >= _c.per_user_limit then return query select null::uuid, 0::numeric, 'You have already used this code.'::text; return; end if;
  return query select _c.id,
    least(_subtotal, round(case when _c.kind = 'percent' then _subtotal * _c.value / 100 else _c.value end, 2)),
    null::text;
end;
$$;
revoke all on function public.coupon_check(text, public.packages, uuid, numeric) from public, anon, authenticated;

-- Price preview for checkout (no reservation).
create or replace function public.quote_order(_package_id uuid, _code text default null)
returns jsonb language plpgsql stable security definer set search_path = '' as $$
declare _p public.packages%rowtype; _sub numeric; _c record;
begin
  select * into _p from public.packages where id = _package_id and status = 'available';
  if _p.id is null then raise exception 'PACKAGE_NOT_AVAILABLE' using errcode = 'P0001'; end if;
  _sub := public.package_price(_p);
  select * into _c from public.coupon_check(_code, _p, auth.uid(), _sub);
  return jsonb_build_object('subtotal', _sub, 'discount', coalesce(_c.discount, 0), 'total', _sub - coalesce(_c.discount, 0),
                            'coupon_ok', _c.coupon_id is not null, 'message', _c.message);
end;
$$;
revoke all on function public.quote_order(uuid, text) from public, anon;
grant execute on function public.quote_order(uuid, text) to authenticated;

-- =============================================================================
-- Orders
-- =============================================================================
create or replace function public.create_order(_package_id uuid, _code text default null)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _p public.packages%rowtype;
  _sub numeric; _c record; _id uuid; _existing uuid; _renewal boolean;
  _hours int := coalesce((public.setting('payments.config') ->> 'order_expiry_hours')::int, 72);
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if exists (select 1 from public.profiles where id = _uid and account_status = 'restricted') then
    raise exception 'ACCOUNT_RESTRICTED' using errcode = '42501';
  end if;
  select * into _p from public.packages where id = _package_id and status = 'available'
    and (sale_starts_at is null or sale_starts_at <= now()) and (sale_ends_at is null or sale_ends_at > now());
  if _p.id is null then raise exception 'PACKAGE_NOT_AVAILABLE' using errcode = 'P0001'; end if;
  _renewal := exists (select 1 from public.entitlements where user_id = _uid and package_id = _p.id and status = 'active'
                       and revoked_at is null and (ends_at is null or ends_at > now()));
  if _renewal and not _p.renewable then raise exception 'ALREADY_ACTIVE' using errcode = 'P0001'; end if;

  -- One open order per package: replace an unpaid one (never one awaiting verification).
  select id into _existing from public.orders where user_id = _uid and package_id = _p.id and status in ('pending_payment', 'awaiting_verification');
  if _existing is not null then
    if (select status from public.orders where id = _existing) = 'awaiting_verification' then
      raise exception 'AWAITING_VERIFICATION' using errcode = 'P0001';
    end if;
    update public.coupon_redemptions set status = 'released' where order_id = _existing and status = 'reserved';
    update public.orders set status = 'cancelled', notes = 'Replaced by a new order' where id = _existing;
  end if;

  _sub := public.package_price(_p);
  select * into _c from public.coupon_check(_code, _p, _uid, _sub);
  if _code is not null and btrim(_code) <> '' and _c.coupon_id is null then
    raise exception 'COUPON_INVALID: %', _c.message using errcode = 'P0001';
  end if;

  insert into public.orders (user_id, package_id, amount, subtotal, discount, coupon_id, kind, expires_at, status)
  values (_uid, _p.id, _sub - coalesce(_c.discount, 0), _sub, coalesce(_c.discount, 0), _c.coupon_id,
          case when _renewal then 'renewal' else 'new' end, now() + make_interval(hours => _hours), 'pending_payment')
  returning id into _id;
  if _c.coupon_id is not null then
    insert into public.coupon_redemptions (coupon_id, user_id, order_id) values (_c.coupon_id, _uid, _id);
  end if;
  -- Fully discounted: activate straight away (no payment to verify).
  if _sub - coalesce(_c.discount, 0) <= 0 then
    perform public.activate_order(_id, null, null);
  end if;
  return _id;
end;
$$;
revoke all on function public.create_order(uuid, text) from public, anon;
grant execute on function public.create_order(uuid, text) to authenticated;

create or replace function public.cancel_my_order(_order_id uuid)
returns void language plpgsql security definer set search_path = '' as $$
begin
  update public.orders set status = 'cancelled', notes = 'Cancelled by student'
  where id = _order_id and user_id = auth.uid() and status = 'pending_payment';
  if not found then raise exception 'ORDER_NOT_CANCELLABLE' using errcode = 'P0001'; end if;
  update public.coupon_redemptions set status = 'released' where order_id = _order_id and status = 'reserved';
end;
$$;
revoke all on function public.cancel_my_order(uuid) from public, anon;
grant execute on function public.cancel_my_order(uuid) to authenticated;

-- =============================================================================
-- Activation — the ONLY path from payment to access (internal)
-- =============================================================================
create or replace function public.activate_order(_order_id uuid, _tx_id uuid, _actor uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _o public.orders%rowtype; _p public.packages%rowtype; _e public.entitlements%rowtype; _end timestamptz; _ent uuid;
begin
  select * into _o from public.orders where id = _order_id for update;
  if _o.id is null then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0002'; end if;
  if _o.status = 'paid' then return _o.entitlement_id; end if;            -- idempotent
  if _o.status not in ('pending_payment', 'awaiting_verification', 'expired', 'failed') then
    raise exception 'ORDER_NOT_PAYABLE' using errcode = 'P0001';
  end if;
  select * into _p from public.packages where id = _o.package_id;

  select * into _e from public.entitlements
  where user_id = _o.user_id and package_id = _p.id and status = 'active' and revoked_at is null and (ends_at is null or ends_at > now())
  order by ends_at desc nulls first limit 1 for update;

  if _e.id is not null then
    -- Renewal: extend from the current expiry so no days are lost.
    _end := case when _p.access_days is not null then greatest(coalesce(_e.ends_at, now()), now()) + make_interval(days => _p.access_days)
                 else greatest(coalesce(_p.access_ends_at, _e.ends_at), _e.ends_at) end;
    update public.entitlements set ends_at = _end, order_id = _o.id where id = _e.id;
    _ent := _e.id;
    insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
    values (_ent, _o.user_id, 'renewed', jsonb_build_object('order', _o.reference, 'ends_at', _end), _actor);
  else
    _end := case when _p.access_days is not null then now() + make_interval(days => _p.access_days) else _p.access_ends_at end;
    insert into public.entitlements (user_id, package_id, order_id, starts_at, ends_at, granted_by, source, note)
    values (_o.user_id, _p.id, _o.id, now(), _end, _actor, case when _o.kind = 'renewal' then 'renewal' else 'purchase' end, 'Order ' || _o.reference)
    returning id into _ent;
    insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
    values (_ent, _o.user_id, 'created', jsonb_build_object('order', _o.reference, 'ends_at', _end), _actor);
  end if;

  update public.orders set status = 'paid', paid_at = now(), entitlement_id = _ent where id = _o.id;
  if _tx_id is not null then update public.payment_transactions set status = 'succeeded' where id = _tx_id; end if;
  update public.coupon_redemptions set status = 'used' where order_id = _o.id;
  perform public.notify(_o.user_id, 'subscription_active', 'Your ' || _p.name || ' access is active',
    'Payment ' || _o.reference || ' is confirmed. Access ' || case when _end is null then 'has no end date.' else 'lasts until ' || to_char(_end at time zone 'Asia/Thimphu', 'DD Mon YYYY') || '.' end,
    '/dashboard/subscription', 'order-paid-' || _o.id::text);
  return _ent;
end;
$$;
revoke all on function public.activate_order(uuid, uuid, uuid) from public, anon, authenticated;

-- =============================================================================
-- Manual payments (bank transfer / mobile banking with proof)
-- =============================================================================
create or replace function public.submit_manual_payment(_order_id uuid, _payer_reference text, _proof_path text, _amount numeric)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _o public.orders%rowtype; _id uuid; _dup boolean;
begin
  if coalesce((public.setting('payments.config') ->> 'manual_enabled')::boolean, true) is not true then
    raise exception 'MANUAL_DISABLED' using errcode = 'P0001';
  end if;
  select * into _o from public.orders where id = _order_id and user_id = auth.uid() for update;
  if _o.id is null then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0002'; end if;
  if _o.status <> 'pending_payment' then raise exception 'ORDER_NOT_PAYABLE' using errcode = 'P0001'; end if;
  if _o.expires_at is not null and _o.expires_at < now() then raise exception 'ORDER_EXPIRED' using errcode = 'P0001'; end if;
  if _payer_reference is null or char_length(btrim(_payer_reference)) < 4 or char_length(_payer_reference) > 120 then
    raise exception 'REFERENCE_REQUIRED' using errcode = 'P0001';
  end if;
  if _proof_path is not null and split_part(_proof_path, '/', 1) <> auth.uid()::text then
    raise exception 'INVALID_PROOF' using errcode = 'P0001';
  end if;
  _dup := exists (select 1 from public.payment_transactions where lower(payer_reference) = lower(btrim(_payer_reference))
                  and status in ('submitted', 'succeeded'));
  insert into public.payment_transactions (order_id, provider, amount, status, payer_reference, proof_path, raw)
  values (_o.id, 'manual', coalesce(_amount, _o.amount), 'submitted', btrim(_payer_reference), _proof_path,
          jsonb_build_object('duplicate_reference', _dup, 'amount_entered', _amount))
  returning id into _id;
  update public.orders set status = 'awaiting_verification', provider = 'manual' where id = _o.id;
  return _id;
end;
$$;
revoke all on function public.submit_manual_payment(uuid, text, text, numeric) from public, anon;
grant execute on function public.submit_manual_payment(uuid, text, text, numeric) to authenticated;

create or replace function public.review_manual_payment(_tx_id uuid, _approve boolean, _note text default null)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare _t public.payment_transactions%rowtype; _o public.orders%rowtype;
begin
  if not public.has_permission('payments.verify') then raise exception 'Missing permission' using errcode = '42501'; end if;
  select * into _t from public.payment_transactions where id = _tx_id for update;
  if _t.id is null or _t.provider <> 'manual' then raise exception 'TRANSACTION_NOT_FOUND' using errcode = 'P0002'; end if;
  if _t.status <> 'submitted' then raise exception 'ALREADY_REVIEWED' using errcode = 'P0001'; end if;
  select * into _o from public.orders where id = _t.order_id;
  update public.payment_transactions set reviewed_by = auth.uid(), reviewed_at = now(), review_note = nullif(btrim(coalesce(_note, '')), '')
  where id = _t.id;
  if _approve then
    perform public.activate_order(_o.id, _t.id, auth.uid());
  else
    if _note is null or char_length(btrim(_note)) < 3 then raise exception 'NOTE_REQUIRED' using errcode = 'P0001'; end if;
    update public.payment_transactions set status = 'rejected' where id = _t.id;
    update public.orders set status = 'pending_payment', expires_at = greatest(coalesce(expires_at, now()), now() + interval '48 hours') where id = _o.id;
    perform public.notify(_o.user_id, 'payment_rejected', 'Payment ' || _o.reference || ' could not be verified',
      'Reason: ' || btrim(_note) || ' You can submit the payment details again from your subscription page.', '/dashboard/subscription', 'tx-rejected-' || _t.id::text);
  end if;
end;
$$;
revoke all on function public.review_manual_payment(uuid, boolean, text) from public, anon;
grant execute on function public.review_manual_payment(uuid, boolean, text) to authenticated;

-- =============================================================================
-- Gateway payments (server-side adapters call these with the server key)
-- =============================================================================
-- Student starts a gateway payment for their order (provider must be enabled).
create or replace function public.start_gateway_payment(_order_id uuid, _provider text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _o public.orders%rowtype; _cfg jsonb := public.setting('payments.config'); _id uuid;
begin
  if not (_provider = coalesce(_cfg ->> 'gateway_provider', '')
          or (_provider = 'sandbox' and coalesce((_cfg ->> 'sandbox_enabled')::boolean, false) and public.has_permission('payments.verify'))) then
    raise exception 'PROVIDER_NOT_ENABLED' using errcode = 'P0001';
  end if;
  select * into _o from public.orders where id = _order_id and user_id = auth.uid() for update;
  if _o.id is null then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0002'; end if;
  if _o.status <> 'pending_payment' then raise exception 'ORDER_NOT_PAYABLE' using errcode = 'P0001'; end if;
  update public.payment_transactions set status = 'cancelled' where order_id = _o.id and status in ('initiated', 'pending');
  insert into public.payment_transactions (order_id, provider, amount, status) values (_o.id, _provider, _o.amount, 'initiated') returning id into _id;
  update public.orders set provider = _provider where id = _o.id;
  return jsonb_build_object('transaction_id', _id, 'amount', _o.amount, 'currency', _o.currency, 'reference', _o.reference);
end;
$$;
revoke all on function public.start_gateway_payment(uuid, text) from public, anon;
grant execute on function public.start_gateway_payment(uuid, text) to authenticated;

-- Records a provider notification once. Returns false for duplicates.
create or replace function public.record_payment_event(_provider text, _event_id text, _type text, _payload jsonb, _signature_ok boolean, _tx_id uuid)
returns boolean language plpgsql security definer set search_path = '' as $$
begin
  insert into public.payment_events (provider, event_id, event_type, payload, signature_ok, transaction_id)
  values (_provider, _event_id, _type, _payload, _signature_ok, _tx_id)
  on conflict (provider, event_id) do nothing;
  return found;
end;
$$;

-- Confirms a provider payment after server-side verification. Idempotent.
create or replace function public.confirm_payment(_tx_id uuid, _provider_ref text, _amount numeric)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _t public.payment_transactions%rowtype; _o public.orders%rowtype;
begin
  select * into _t from public.payment_transactions where id = _tx_id for update;
  if _t.id is null then raise exception 'TRANSACTION_NOT_FOUND' using errcode = 'P0002'; end if;
  select * into _o from public.orders where id = _t.order_id;
  if _t.status = 'succeeded' or _o.status = 'paid' then return _o.entitlement_id; end if;
  if _amount is null or _amount + 0.005 < _o.amount then
    update public.payment_transactions set status = 'failed', failure_reason = 'Amount paid (' || coalesce(_amount::text, 'unknown') || ') is less than the order total', provider_ref = coalesce(_provider_ref, provider_ref) where id = _t.id;
    raise exception 'AMOUNT_MISMATCH' using errcode = 'P0001';
  end if;
  update public.payment_transactions set provider_ref = coalesce(_provider_ref, provider_ref), amount = _amount where id = _t.id;
  return public.activate_order(_o.id, _t.id, null);
end;
$$;

create or replace function public.fail_payment(_tx_id uuid, _reason text)
returns void language plpgsql security definer set search_path = '' as $$
declare _o public.orders%rowtype;
begin
  update public.payment_transactions set status = 'failed', failure_reason = left(_reason, 500)
  where id = _tx_id and status in ('initiated', 'pending') returning order_id into _o.id;
  if _o.id is null then return; end if;
  select * into _o from public.orders where id = _o.id;
  perform public.notify(_o.user_id, 'payment_failed', 'Payment ' || _o.reference || ' did not go through',
    coalesce(_reason, 'The payment was not completed.') || ' No money was taken by Soma. You can try again.', '/dashboard/subscription', 'tx-failed-' || _tx_id::text);
end;
$$;

revoke all on function public.record_payment_event(text, text, text, jsonb, boolean, uuid) from public, anon, authenticated;
revoke all on function public.confirm_payment(uuid, text, numeric) from public, anon, authenticated;
revoke all on function public.fail_payment(uuid, text) from public, anon, authenticated;
grant execute on function public.record_payment_event(text, text, text, jsonb, boolean, uuid) to service_role;
grant execute on function public.confirm_payment(uuid, text, numeric) to service_role;
grant execute on function public.fail_payment(uuid, text) to service_role;

-- =============================================================================
-- Refunds
-- =============================================================================
-- Staff record a refund. Manual payments are refunded outside Soma, so they are
-- recorded as completed; gateway refunds start "processing" and the server
-- completes them after the provider confirms.
create or replace function public.request_refund(_order_id uuid, _amount numeric, _reason text)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _o public.orders%rowtype; _t public.payment_transactions%rowtype; _done numeric; _id uuid;
begin
  if not (public.has_permission('payments.verify') and public.has_permission('orders.manage')) then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  select * into _o from public.orders where id = _order_id for update;
  if _o.id is null or _o.status <> 'paid' then raise exception 'ORDER_NOT_REFUNDABLE' using errcode = 'P0001'; end if;
  select coalesce(sum(amount), 0) into _done from public.refunds where order_id = _o.id and status in ('requested', 'processing', 'succeeded');
  if _amount is null or _amount <= 0 or _amount > _o.amount - _done then raise exception 'INVALID_AMOUNT' using errcode = 'P0001'; end if;
  select * into _t from public.payment_transactions where order_id = _o.id and status = 'succeeded' order by created_at desc limit 1;
  insert into public.refunds (order_id, transaction_id, amount, reason, status, created_by)
  values (_o.id, _t.id, _amount, _reason, case when coalesce(_t.provider, 'manual') = 'manual' then 'requested' else 'processing' end, auth.uid())
  returning id into _id;
  if coalesce(_t.provider, 'manual') = 'manual' then perform public.complete_refund(_id, true, null); end if;
  return _id;
end;
$$;
revoke all on function public.request_refund(uuid, numeric, text) from public, anon;
grant execute on function public.request_refund(uuid, numeric, text) to authenticated;

create or replace function public.complete_refund(_refund_id uuid, _success boolean, _provider_ref text)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare _r public.refunds%rowtype; _o public.orders%rowtype; _total numeric;
begin
  if auth.uid() is not null and not public.has_permission('payments.verify') then raise exception 'Missing permission' using errcode = '42501'; end if;
  select * into _r from public.refunds where id = _refund_id for update;
  if _r.id is null or _r.status in ('succeeded', 'failed') then return; end if;
  update public.refunds set status = case when _success then 'succeeded' else 'failed' end, provider_ref = _provider_ref, completed_at = now() where id = _r.id;
  if not _success then return; end if;
  select * into _o from public.orders where id = _r.order_id for update;
  select coalesce(sum(amount), 0) into _total from public.refunds where order_id = _o.id and status = 'succeeded';
  if _total + 0.005 >= _o.amount then
    update public.orders set status = 'refunded' where id = _o.id;
    update public.payment_transactions set status = 'refunded' where order_id = _o.id and status = 'succeeded';
    update public.entitlements set status = 'refunded', status_reason = _r.reason where id = _o.entitlement_id;
    insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
    values (_o.entitlement_id, _o.user_id, 'refunded', jsonb_build_object('amount', _total, 'reason', _r.reason), auth.uid());
  end if;
  perform public.notify(_o.user_id, 'refund', 'Refund of Nu. ' || _r.amount || ' for ' || _o.reference,
    case when _total + 0.005 >= _o.amount then 'The order was fully refunded and its access has ended.' else 'A partial refund was recorded; your access continues.' end,
    '/dashboard/subscription', 'refund-' || _r.id::text);
end;
$$;
revoke all on function public.complete_refund(uuid, boolean, text) from public, anon;
grant execute on function public.complete_refund(uuid, boolean, text) to authenticated, service_role;

-- =============================================================================
-- Subscription administration
-- =============================================================================
create or replace function public.admin_grant_subscription(_user uuid, _package_id uuid, _days int, _source text, _note text)
returns uuid language plpgsql security definer set search_path = '' as $$
declare _id uuid; _p public.packages%rowtype;
begin
  if not public.has_permission('payments.verify') then raise exception 'Missing permission' using errcode = '42501'; end if;
  if _source not in ('complimentary', 'promotional', 'manual') then raise exception 'INVALID_SOURCE' using errcode = 'P0001'; end if;
  if _days is null or _days < 1 or _days > 1000 then raise exception 'INVALID_DAYS' using errcode = 'P0001'; end if;
  if _note is null or char_length(btrim(_note)) < 3 then raise exception 'NOTE_REQUIRED' using errcode = 'P0001'; end if;
  select * into _p from public.packages where id = _package_id;
  if _p.id is null then raise exception 'PACKAGE_NOT_FOUND' using errcode = 'P0002'; end if;
  insert into public.entitlements (user_id, package_id, starts_at, ends_at, granted_by, source, note)
  values (_user, _p.id, now(), now() + make_interval(days => _days), auth.uid(), _source, _note) returning id into _id;
  insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
  values (_id, _user, 'complimentary', jsonb_build_object('days', _days, 'source', _source, 'note', _note), auth.uid());
  perform public.notify(_user, 'subscription_active', 'You have been given ' || _p.name || ' access',
    'Access for ' || _days || ' days, courtesy of Soma Preparations.', '/dashboard/subscription', 'grant-' || _id::text);
  return _id;
end;
$$;

create or replace function public.admin_extend_subscription(_ent uuid, _days int, _note text)
returns void language plpgsql security definer set search_path = '' as $$
declare _e public.entitlements%rowtype;
begin
  if not public.has_permission('payments.verify') then raise exception 'Missing permission' using errcode = '42501'; end if;
  if _days is null or _days < 1 or _days > 1000 or _note is null or char_length(btrim(_note)) < 3 then raise exception 'INVALID_INPUT' using errcode = 'P0001'; end if;
  update public.entitlements set ends_at = greatest(coalesce(ends_at, now()), now()) + make_interval(days => _days) where id = _ent returning * into _e;
  if _e.id is null then raise exception 'NOT_FOUND' using errcode = 'P0002'; end if;
  insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
  values (_e.id, _e.user_id, 'extended', jsonb_build_object('days', _days, 'note', _note, 'ends_at', _e.ends_at), auth.uid());
  perform public.notify(_e.user_id, 'subscription_extended', 'Your access was extended by ' || _days || ' days', _note, '/dashboard/subscription', null, true);
end;
$$;

create or replace function public.admin_set_subscription_status(_ent uuid, _status text, _reason text)
returns void language plpgsql security definer set search_path = '' as $$
declare _e public.entitlements%rowtype;
begin
  if not public.has_permission('payments.verify') then raise exception 'Missing permission' using errcode = '42501'; end if;
  if _status not in ('active', 'suspended', 'revoked') or _reason is null or char_length(btrim(_reason)) < 3 then
    raise exception 'INVALID_INPUT' using errcode = 'P0001';
  end if;
  update public.entitlements set status = _status, status_reason = _reason,
    suspended_at = case when _status = 'suspended' then now() else suspended_at end,
    revoked_at = case when _status = 'revoked' then now() else revoked_at end
  where id = _ent returning * into _e;
  if _e.id is null then raise exception 'NOT_FOUND' using errcode = 'P0002'; end if;
  insert into public.subscription_events (entitlement_id, user_id, kind, detail, actor_id)
  values (_e.id, _e.user_id, case _status when 'active' then 'restored' when 'suspended' then 'suspended' else 'revoked' end,
          jsonb_build_object('reason', _reason), auth.uid());
  perform public.notify(_e.user_id, 'subscription_' || _status,
    case _status when 'active' then 'Your access has been restored' when 'suspended' then 'Your access has been paused' else 'Your access has ended' end,
    _reason, '/dashboard/subscription', null, true);
end;
$$;
revoke all on function public.admin_grant_subscription(uuid, uuid, int, text, text) from public, anon;
revoke all on function public.admin_extend_subscription(uuid, int, text) from public, anon;
revoke all on function public.admin_set_subscription_status(uuid, text, text) from public, anon;
grant execute on function public.admin_grant_subscription(uuid, uuid, int, text, text) to authenticated;
grant execute on function public.admin_extend_subscription(uuid, int, text) to authenticated;
grant execute on function public.admin_set_subscription_status(uuid, text, text) to authenticated;

-- =============================================================================
-- Reports (collected revenue = confirmed payments minus refunds)
-- =============================================================================
create or replace function public.commerce_report(_days int default 30)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _since timestamptz := now() - make_interval(days => least(greatest(coalesce(_days, 30), 1), 730));
begin
  if not (public.has_permission('payments.verify') or public.has_permission('reports.view')) then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'collected', (select coalesce(sum(amount), 0) from public.orders where status in ('paid', 'refunded') and paid_at >= _since),
    'refunded', (select coalesce(sum(amount), 0) from public.refunds where status = 'succeeded' and completed_at >= _since),
    'pending_amount', (select coalesce(sum(amount), 0) from public.orders where status in ('pending_payment', 'awaiting_verification')),
    'awaiting_verification', (select count(*) from public.orders where status = 'awaiting_verification'),
    'failed_payments', (select count(*) from public.payment_transactions where status in ('failed', 'rejected') and created_at >= _since),
    'paid_orders', (select count(*) from public.orders where status in ('paid', 'refunded') and paid_at >= _since),
    'renewals', (select count(*) from public.orders where kind = 'renewal' and status = 'paid' and paid_at >= _since),
    'students', (select count(*) from public.profiles),
    'active_subscribers', (select count(distinct user_id) from public.entitlements where status = 'active' and revoked_at is null and starts_at <= now() and (ends_at is null or ends_at > now())),
    'expiring_14d', (select count(distinct user_id) from public.entitlements where status = 'active' and revoked_at is null and ends_at between now() and now() + interval '14 days'),
    'expired_30d', (select count(distinct user_id) from public.entitlements where ends_at between now() - interval '30 days' and now()),
    'by_day', coalesce((select jsonb_agg(jsonb_build_object('day', d, 'amount', a, 'orders', n) order by d)
       from (select (paid_at at time zone 'Asia/Thimphu')::date d, sum(amount) a, count(*) n from public.orders
             where status in ('paid', 'refunded') and paid_at >= _since group by 1) x), '[]'::jsonb),
    'by_package', coalesce((select jsonb_agg(jsonb_build_object('package', name, 'orders', n, 'amount', a) order by a desc)
       from (select p.name, count(*) n, sum(o.amount) a from public.orders o join public.packages p on p.id = o.package_id
             where o.status in ('paid', 'refunded') and o.paid_at >= _since group by p.name) x), '[]'::jsonb)
  );
end;
$$;
revoke all on function public.commerce_report(int) from public, anon;
grant execute on function public.commerce_report(int) to authenticated;

-- =============================================================================
-- Scheduled maintenance (server key; called by the 3-hourly scheduler)
-- =============================================================================
create or replace function public.run_commerce_maintenance()
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _expired_orders int; _reminders int := 0; _expired int := 0; _d int; r record;
begin
  -- Unpaid orders past their deadline.
  with x as (
    update public.orders set status = 'expired' where status = 'pending_payment' and expires_at < now() returning id
  ) select count(*) into _expired_orders from x;
  update public.coupon_redemptions cr set status = 'released' from public.orders o
  where o.id = cr.order_id and cr.status = 'reserved' and o.status in ('expired', 'cancelled');

  -- Expiry reminders (once per subscription and threshold).
  for _d in select (jsonb_array_elements_text(coalesce(public.setting('payments.config') -> 'expiry_reminder_days', '[7,1]'::jsonb)))::int loop
    for r in select e.id, e.user_id, e.ends_at, p.name from public.entitlements e join public.packages p on p.id = e.package_id
             where e.status = 'active' and e.revoked_at is null and e.ends_at between now() and now() + make_interval(days => _d) loop
      perform public.notify(r.user_id, 'expiry_soon', 'Your ' || r.name || ' access ends on ' || to_char(r.ends_at at time zone 'Asia/Thimphu', 'DD Mon YYYY'),
        'Renew before it ends to keep practising without interruption. Your progress is always kept.', '/dashboard/subscription', 'expiry-' || _d || '-' || r.id::text);
      _reminders := _reminders + 1;
    end loop;
  end loop;

  -- Record expiries (access already ends by date; this records history and tells the student).
  for r in select e.id, e.user_id, p.name from public.entitlements e join public.packages p on p.id = e.package_id
           where e.status = 'active' and e.ends_at < now() and e.ends_at > now() - interval '30 days'
             and not exists (select 1 from public.subscription_events s where s.entitlement_id = e.id and s.kind = 'expired') loop
    insert into public.subscription_events (entitlement_id, user_id, kind) values (r.id, r.user_id, 'expired');
    perform public.notify(r.user_id, 'expired', 'Your ' || r.name || ' access has ended',
      'Your results and progress are kept. Renew any time to continue.', '/dashboard/subscription', 'expired-' || r.id::text);
    _expired := _expired + 1;
  end loop;
  return jsonb_build_object('orders_expired', _expired_orders, 'reminders', _reminders, 'subscriptions_expired', _expired);
end;
$$;
revoke all on function public.run_commerce_maintenance() from public, anon, authenticated;
grant execute on function public.run_commerce_maintenance() to service_role;

-- =============================================================================
-- Account security
-- =============================================================================
-- Ends a Supabase Auth session for real (refresh tokens stop working) and marks it revoked.
create or replace function public.end_session(_session_id uuid, _reason text)
returns void language plpgsql security definer set search_path = '' as $$
begin
  update public.user_sessions set revoked_at = coalesce(revoked_at, now()), revoked_reason = coalesce(revoked_reason, _reason) where id = _session_id;
  if to_regclass('auth.sessions') is not null then
    execute 'delete from auth.sessions where id = $1' using _session_id;
  end if;
end;
$$;
revoke all on function public.end_session(uuid, text) from public, anon, authenticated;

-- Called on every signed-in page view (throttled). Records the device and
-- session, applies the session limit and risk rules, and tells the app whether
-- the session may continue.
create or replace function public.touch_session(_session_id uuid, _device_key text, _label text, _country text, _user_agent text, _verified_method boolean)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _cfg jsonb := public.setting('security.config');
  _dev public.user_devices%rowtype;
  _s public.user_sessions%rowtype;
  _new_device boolean := false;
  _devices int; _countries int; _failed int; _elevated int; _over int; _revoked int := 0;
  _verify boolean := false;
  r record;
begin
  if _uid is null or _session_id is null then return jsonb_build_object('status', 'none'); end if;
  if exists (select 1 from public.profiles where id = _uid and account_status = 'restricted') then
    return jsonb_build_object('status', 'restricted');
  end if;
  if _device_key !~ '^[0-9a-f]{64}$' then _device_key := encode(sha256(convert_to(_session_id::text, 'UTF8')), 'hex'); end if;
  _country := case when _country ~ '^[A-Z]{2}$' then _country else null end;

  select * into _s from public.user_sessions where id = _session_id;
  if _s.id is not null then
    if _s.revoked_at is not null then return jsonb_build_object('status', 'revoked', 'reason', _s.revoked_reason); end if;
    if _s.verification_required and _verified_method then
      update public.user_sessions set verification_required = false where id = _s.id;
      update public.user_devices set trusted = true where id = _s.device_id;
      insert into public.login_events (user_id, kind, device_id, country) values (_uid, 'verified', _s.device_id, _country);
      _s.verification_required := false;
    end if;
    if _s.last_seen_at < now() - interval '5 minutes' then
      update public.user_sessions set last_seen_at = now(), country = coalesce(_country, country) where id = _s.id;
      update public.user_devices set last_seen = now(), last_country = coalesce(_country, last_country) where id = _s.device_id;
    end if;
    return jsonb_build_object('status', case when _s.verification_required then 'verify' else 'ok' end);
  end if;

  -- First sight of this session: device, sign-in record, limits, risk.
  select * into _dev from public.user_devices where user_id = _uid and device_key = _device_key;
  if _dev.id is null then
    insert into public.user_devices (user_id, device_key, label, last_country, trusted)
    values (_uid, _device_key, left(_label, 120), _country, coalesce(_verified_method, false)) returning * into _dev;
    _new_device := true;
  else
    update public.user_devices set last_seen = now(), last_country = coalesce(_country, last_country), revoked_at = null,
      trusted = trusted or coalesce(_verified_method, false) where id = _dev.id returning * into _dev;
  end if;
  insert into public.user_sessions (id, user_id, device_id, country, user_agent) values (_session_id, _uid, _dev.id, _country, left(_user_agent, 300))
  on conflict (id) do nothing;
  insert into public.login_events (user_id, kind, device_id, country) values (_uid, case when _new_device then 'new_device' else 'sign_in' end, _dev.id, _country);

  -- Risk signals (never a single-signal suspension).
  select count(*) into _devices from public.user_devices where user_id = _uid
    and first_seen > now() - make_interval(days => coalesce((_cfg ->> 'new_device_window_days')::int, 7));
  select count(distinct country) into _countries from public.login_events where user_id = _uid and country is not null and created_at > now() - interval '24 hours';
  select count(*) into _failed from public.login_events where user_id = _uid and kind = 'sign_in_failed' and created_at > now() - interval '1 hour';
  if not _dev.trusted and (_devices > coalesce((_cfg ->> 'max_devices_per_window')::int, 4) or _countries > 1
                           or _failed >= coalesce((_cfg ->> 'failed_login_threshold')::int, 8)) then
    _verify := true;
    update public.user_sessions set verification_required = true where id = _session_id;
    insert into public.login_events (user_id, kind, device_id, country, detail)
    values (_uid, 'risk_elevated', _dev.id, _country, jsonb_build_object('devices_recent', _devices, 'countries_24h', _countries, 'failed_1h', _failed));
    select count(*) into _elevated from public.login_events where user_id = _uid and kind = 'risk_elevated' and created_at > now() - interval '30 days';
    if _elevated >= coalesce((_cfg ->> 'flag_after_elevated_events')::int, 3)
       and not exists (select 1 from public.security_flags where user_id = _uid and status = 'open') then
      insert into public.security_flags (user_id, kind, detail)
      values (_uid, 'possible_account_sharing', jsonb_build_object('elevated_events_30d', _elevated, 'devices_recent', _devices, 'countries_24h', _countries));
    end if;
  end if;

  -- Concurrent-session limit: sign out the oldest sessions beyond the limit.
  select count(*) - coalesce((_cfg ->> 'max_concurrent_sessions')::int, 2) into _over from public.user_sessions
  where user_id = _uid and revoked_at is null and last_seen_at > now() - interval '14 days';
  if _over > 0 then
    for r in select id from public.user_sessions where user_id = _uid and revoked_at is null and id <> _session_id
             and last_seen_at > now() - interval '14 days' order by last_seen_at asc limit _over loop
      perform public.end_session(r.id, 'Signed out because the account was used on another device (device limit).');
      _revoked := _revoked + 1;
    end loop;
    insert into public.login_events (user_id, kind, device_id, detail) values (_uid, 'session_limit', _dev.id, jsonb_build_object('signed_out', _revoked));
    perform public.notify(_uid, 'security', 'Signed out on another device',
      'Your account was opened on a new device, so the oldest session was signed out. If this was not you, change your password.', '/dashboard/security', null, true);
  end if;
  if _new_device and not _verify then
    perform public.notify(_uid, 'security', 'New sign-in to your Soma account',
      'If this was not you, change your password and sign out other devices.', '/dashboard/security', null, false);
  end if;
  return jsonb_build_object('status', case when _verify then 'verify' else 'ok' end, 'signed_out_others', _revoked);
end;
$$;
revoke all on function public.touch_session(uuid, text, text, text, text, boolean) from public, anon;
grant execute on function public.touch_session(uuid, text, text, text, text, boolean) to authenticated;

-- Failed sign-ins are recorded by the server (by e-mail hash; the account is not revealed).
create or replace function public.record_failed_login(_email_hash text, _country text)
returns void language plpgsql security definer set search_path = '' as $$
declare _uid uuid;
begin
  select id into _uid from auth.users where encode(sha256(convert_to(lower(email), 'UTF8')), 'hex') = _email_hash limit 1;
  insert into public.login_events (user_id, email_hash, kind, country) values (_uid, _email_hash, 'sign_in_failed', case when _country ~ '^[A-Z]{2}$' then _country end);
end;
$$;
revoke all on function public.record_failed_login(text, text) from public, anon, authenticated;
grant execute on function public.record_failed_login(text, text) to service_role;

create or replace function public.revoke_my_sessions(_keep uuid, _only uuid default null)
returns int language plpgsql security definer set search_path = '' as $$
declare r record; _n int := 0;
begin
  if auth.uid() is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  for r in select id from public.user_sessions where user_id = auth.uid() and revoked_at is null
           and id is distinct from _keep and (_only is null or id = _only) loop
    perform public.end_session(r.id, 'Signed out by the account holder.');
    _n := _n + 1;
  end loop;
  return _n;
end;
$$;
revoke all on function public.revoke_my_sessions(uuid, uuid) from public, anon;
grant execute on function public.revoke_my_sessions(uuid, uuid) to authenticated;

create or replace function public.admin_security_action(_user uuid, _action text, _reason text)
returns void language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  if not public.has_permission('users.manage') then raise exception 'Missing permission' using errcode = '42501'; end if;
  if _reason is null or char_length(btrim(_reason)) < 3 then raise exception 'NOTE_REQUIRED' using errcode = 'P0001'; end if;
  if _action = 'revoke_sessions' then
    for r in select id from public.user_sessions where user_id = _user and revoked_at is null loop
      perform public.end_session(r.id, 'Signed out by Soma: ' || _reason);
    end loop;
  elsif _action = 'require_verification' then
    update public.user_sessions set verification_required = true where user_id = _user and revoked_at is null;
    update public.user_devices set trusted = false where user_id = _user;
  elsif _action = 'restrict' then
    update public.profiles set account_status = 'restricted', restricted_reason = _reason, restricted_at = now() where id = _user;
    for r in select id from public.user_sessions where user_id = _user and revoked_at is null loop
      perform public.end_session(r.id, 'Account restricted.');
    end loop;
    perform public.notify(_user, 'security', 'Your account has been restricted', _reason || ' Contact Soma support to resolve this.', '/contact', null, true);
  elsif _action = 'restore' then
    update public.profiles set account_status = 'active', restricted_reason = null, restricted_at = null where id = _user;
    perform public.notify(_user, 'security', 'Your account has been restored', _reason, '/dashboard', null, true);
  else
    raise exception 'INVALID_ACTION' using errcode = 'P0001';
  end if;
  insert into public.login_events (user_id, kind, detail) values (_user, case when _action = 'revoke_sessions' then 'session_revoked' else 'verification_required' end,
    jsonb_build_object('admin_action', _action, 'reason', _reason, 'by', auth.uid()));
end;
$$;
revoke all on function public.admin_security_action(uuid, text, text) from public, anon;
grant execute on function public.admin_security_action(uuid, text, text) to authenticated;

-- Admin-only: audit of security actions is in login_events / audit_logs.
create trigger audit_profiles_status after update of account_status on public.profiles for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Private storage for payment proofs
-- -----------------------------------------------------------------------------
do $$
begin
  if to_regclass('storage.buckets') is not null then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('payment-proofs', 'payment-proofs', false, 5242880, array['image/jpeg', 'image/png', 'image/webp', 'application/pdf'])
    on conflict (id) do update set public = false, file_size_limit = excluded.file_size_limit, allowed_mime_types = excluded.allowed_mime_types;
    execute $p$
      create policy "payment proofs: owner or staff read" on storage.objects for select to authenticated
      using (bucket_id = 'payment-proofs' and (split_part(name, '/', 1) = auth.uid()::text or public.has_permission('payments.verify')))
    $p$;
    execute $p$
      create policy "payment proofs: owner upload" on storage.objects for insert to authenticated
      with check (bucket_id = 'payment-proofs' and split_part(name, '/', 1) = auth.uid()::text)
    $p$;
  end if;
end;
$$;

-- What a signed-in student may see of the payment configuration.
create or replace function public.payment_options()
returns jsonb language sql stable security definer set search_path = '' as $$
  select jsonb_build_object(
    'manual_enabled', coalesce((c ->> 'manual_enabled')::boolean, true),
    'manual_instructions', c ->> 'manual_instructions',
    'manual_methods', coalesce(c -> 'manual_methods', '[]'::jsonb),
    'gateway_provider', c ->> 'gateway_provider',
    'sandbox', coalesce((c ->> 'sandbox_enabled')::boolean, false) and public.has_permission('payments.verify'))
  from (select public.setting('payments.config') as c) x
$$;
revoke all on function public.payment_options() from public, anon;
grant execute on function public.payment_options() to authenticated;
