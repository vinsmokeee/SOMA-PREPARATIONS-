-- =============================================================================
-- Soma Preparations — Migration 0005: Packages, orders, payments, entitlements,
-- support messages.
--
-- Prices are data, never code. Access is granted ONLY by an entitlement row,
-- and an entitlement is created only after a payment has been verified by a
-- holder of payments.verify (or, later, by a verified gateway callback running
-- with the service role). A client can never mark its own payment as paid.
-- =============================================================================

create type public.package_status as enum ('draft', 'coming_soon', 'available', 'retired');
create type public.order_status as enum ('pending_payment', 'awaiting_verification', 'paid', 'cancelled', 'refunded');
create type public.payment_status as enum ('submitted', 'verified', 'rejected');

create table public.packages (
  id                 uuid primary key default gen_random_uuid(),
  slug               text not null unique check (slug ~ '^[a-z0-9-]+$'),
  name               text not null,
  tagline            text,
  description        text,
  currency           text not null default 'BTN' check (currency = 'BTN'),
  price              numeric(10, 2) not null check (price >= 0),
  promo_price        numeric(10, 2) check (promo_price is null or promo_price >= 0),
  promo_starts_at    timestamptz,
  promo_ends_at      timestamptz,
  features           jsonb not null default '[]'::jsonb check (jsonb_typeof(features) = 'array'),
  includes_pe        boolean not null default false,
  includes_me        boolean not null default false,
  cycle_id           uuid references public.exam_cycles (id) on delete set null,
  access_days        int check (access_days is null or access_days > 0),  -- relative access
  access_ends_at     timestamptz,                                          -- or fixed end date
  sale_starts_at     timestamptz,
  sale_ends_at       timestamptz,
  status             public.package_status not null default 'draft',
  terms              text,             -- what the student receives and for how long
  sort_order         int not null default 0,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now(),
  check (promo_price is null or promo_price < price),
  check (promo_ends_at is null or promo_starts_at is null or promo_ends_at > promo_starts_at),
  -- A package must define how long access lasts before it can be sold.
  check (status <> 'available' or access_days is not null or access_ends_at is not null)
);
create trigger packages_updated_at before update on public.packages
  for each row execute function public.set_updated_at();
create trigger audit_packages after insert or update or delete on public.packages
  for each row execute function public.audit_row_change();

-- What a package unlocks (beyond the includes_pe / includes_me shortcuts).
create table public.package_items (
  id          uuid primary key default gen_random_uuid(),
  package_id  uuid not null references public.packages (id) on delete cascade,
  item_type   text not null check (item_type in ('exam', 'historical_library', 'current_affairs', 'study_resources', 'expert_evaluation')),
  exam_id     uuid references public.exams (id) on delete cascade,
  stage       public.exam_stage,
  quantity    int check (quantity is null or quantity > 0),   -- e.g. number of expert evaluations
  check (item_type <> 'exam' or exam_id is not null)
);
create index package_items_package_idx on public.package_items (package_id);

create table public.orders (
  id            uuid primary key default gen_random_uuid(),
  reference     text not null unique default ('SOMA-' || upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 10))),
  user_id       uuid not null references auth.users (id) on delete restrict,
  package_id    uuid not null references public.packages (id) on delete restrict,
  amount        numeric(10, 2) not null check (amount >= 0),    -- price snapshot at order time
  currency      text not null default 'BTN',
  status        public.order_status not null default 'pending_payment',
  notes         text,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
create index orders_user_idx on public.orders (user_id, created_at desc);
create index orders_status_idx on public.orders (status, created_at desc);
create trigger orders_updated_at before update on public.orders
  for each row execute function public.set_updated_at();
create trigger audit_orders after insert or update or delete on public.orders
  for each row execute function public.audit_row_change();

create table public.payments (
  id                uuid primary key default gen_random_uuid(),
  order_id          uuid not null references public.orders (id) on delete restrict,
  method            text not null check (method in ('manual_bank_transfer', 'mobile_banking', 'gateway')),
  provider          text,                 -- e.g. bank / wallet name; gateway id later
  payer_reference   text check (payer_reference is null or char_length(payer_reference) <= 120), -- journal no. entered by student
  amount            numeric(10, 2) not null check (amount >= 0),
  proof_storage_path text,
  status            public.payment_status not null default 'submitted',
  verified_by       uuid references auth.users (id) on delete set null,
  verified_at       timestamptz,
  review_note       text,
  created_at        timestamptz not null default now(),
  check (status = 'submitted' or verified_by is not null)
);
create index payments_order_idx on public.payments (order_id);
create trigger audit_payments after insert or update or delete on public.payments
  for each row execute function public.audit_row_change();

create table public.entitlements (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references auth.users (id) on delete cascade,
  package_id   uuid not null references public.packages (id) on delete restrict,
  order_id     uuid references public.orders (id) on delete set null,
  starts_at    timestamptz not null default now(),
  ends_at      timestamptz,
  revoked_at   timestamptz,
  granted_by   uuid references auth.users (id) on delete set null,
  note         text,
  created_at   timestamptz not null default now(),
  check (ends_at is null or ends_at > starts_at)
);
create index entitlements_user_idx on public.entitlements (user_id);
create trigger audit_entitlements after insert or update or delete on public.entitlements
  for each row execute function public.audit_row_change();

-- Does the current user hold active access to a stage?
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
      and e.starts_at <= now()
      and (e.ends_at is null or e.ends_at > now())
      and ((_stage = 'PE' and p.includes_pe) or (_stage = 'ME' and p.includes_me))
  );
$$;
revoke all on function public.has_stage_access(public.exam_stage) from public;
grant execute on function public.has_stage_access(public.exam_stage) to authenticated, service_role;

-- -----------------------------------------------------------------------------
-- Support / contact messages
-- -----------------------------------------------------------------------------
create table public.contact_messages (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid references auth.users (id) on delete set null,
  name        text not null check (char_length(name) between 1 and 120),
  email       text not null check (email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$' and char_length(email) <= 200),
  topic       text not null default 'general' check (topic in ('general', 'payment', 'technical', 'content', 'partnership')),
  message     text not null check (char_length(message) between 10 and 5000),
  status      text not null default 'new' check (status in ('new', 'in_progress', 'resolved', 'spam')),
  created_at  timestamptz not null default now(),
  handled_by  uuid references auth.users (id) on delete set null,
  handled_at  timestamptz
);
create index contact_messages_status_idx on public.contact_messages (status, created_at desc);

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------
alter table public.packages enable row level security;
alter table public.package_items enable row level security;
alter table public.orders enable row level security;
alter table public.payments enable row level security;
alter table public.entitlements enable row level security;
alter table public.contact_messages enable row level security;

create policy packages_public on public.packages for select to anon, authenticated
  using (status in ('available', 'coming_soon') or public.has_permission('packages.manage'));
create policy packages_write on public.packages for all to authenticated
  using (public.has_permission('packages.manage')) with check (public.has_permission('packages.manage'));

create policy package_items_public on public.package_items for select to anon, authenticated
  using (exists (select 1 from public.packages p where p.id = package_id and p.status in ('available', 'coming_soon'))
         or public.has_permission('packages.manage'));
create policy package_items_write on public.package_items for all to authenticated
  using (public.has_permission('packages.manage')) with check (public.has_permission('packages.manage'));

-- Orders: students read their own; creation is done by a server action that
-- snapshots the authoritative price (Milestone 8). Staff manage all.
create policy orders_read on public.orders for select to authenticated
  using (user_id = auth.uid() or public.has_permission('orders.manage'));
create policy orders_staff_write on public.orders for update to authenticated
  using (public.has_permission('orders.manage')) with check (public.has_permission('orders.manage'));

create policy payments_read on public.payments for select to authenticated
  using (public.has_permission('payments.verify')
         or exists (select 1 from public.orders o where o.id = order_id and o.user_id = auth.uid()));
create policy payments_verify on public.payments for update to authenticated
  using (public.has_permission('payments.verify')) with check (public.has_permission('payments.verify'));

create policy entitlements_read on public.entitlements for select to authenticated
  using (user_id = auth.uid() or public.has_permission('payments.verify') or public.has_permission('users.manage'));
create policy entitlements_write on public.entitlements for all to authenticated
  using (public.has_permission('payments.verify')) with check (public.has_permission('payments.verify'));

-- Contact: anyone may submit (server action adds spam protection); staff read.
create policy contact_insert on public.contact_messages for insert to anon, authenticated
  with check (status = 'new' and handled_by is null and (user_id is null or user_id = auth.uid()));
create policy contact_staff on public.contact_messages for select to authenticated
  using (public.has_permission('support.manage'));
create policy contact_staff_update on public.contact_messages for update to authenticated
  using (public.has_permission('support.manage')) with check (public.has_permission('support.manage'));

-- -----------------------------------------------------------------------------
-- Table privileges. Supabase grants ALL to anon/authenticated by default and
-- relies on RLS; we additionally revoke what no client role should ever do.
-- -----------------------------------------------------------------------------
revoke insert, update, delete on public.audit_logs from anon, authenticated;
revoke update, delete on public.contact_messages from anon;
