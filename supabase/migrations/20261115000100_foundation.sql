-- =============================================================================
-- Soma Preparations — Migration 0001: Foundation
-- Roles, permissions, profiles, authorisation helpers, audit logging, settings.
--
-- Design notes (see docs/DATABASE.md for the full rationale):
--  * Identity lives in Supabase Auth (auth.users). public.profiles holds the
--    application-facing profile, 1:1 with auth.users.
--  * Roles are assigned through public.user_roles (a user may hold several).
--    Roles map to permissions through public.role_permissions so that new
--    contributor roles can be introduced later without code changes.
--  * super_admin implicitly holds every permission.
--  * Authorisation helpers are SECURITY DEFINER with an empty search_path so
--    they can be used safely inside RLS policies without recursion.
-- =============================================================================

create extension if not exists pg_trgm with schema extensions;

-- -----------------------------------------------------------------------------
-- Shared enums
-- -----------------------------------------------------------------------------
create type public.app_role as enum (
  'student',
  'super_admin',
  'admin',
  'content_reviewer',
  'question_developer',
  'researcher',
  'subject_specialist',
  'content_writer',
  'evaluator'
);

create type public.exam_stage as enum ('PE', 'ME');

-- Lifecycle shared by all reviewable content (questions, notes, CA items...).
-- AI content must pass: ai_generated -> awaiting_review -> verified -> published.
create type public.content_status as enum (
  'draft',
  'ai_generated',
  'awaiting_review',
  'revision_requested',
  'verified',
  'published',
  'rejected',
  'archived'
);

-- How trustworthy a piece of *official examination information* is.
create type public.verification_status as enum (
  'official_verified',   -- checked against a primary RCSC document (source recorded)
  'unverified',          -- entered but not yet checked against a primary source
  'superseded'           -- was official, replaced by a newer rule/announcement
);

-- -----------------------------------------------------------------------------
-- updated_at helper
-- -----------------------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- -----------------------------------------------------------------------------
-- Profiles
-- -----------------------------------------------------------------------------
create table public.profiles (
  id            uuid primary key references auth.users (id) on delete cascade,
  full_name     text not null default '' check (char_length(full_name) <= 120),
  phone         text check (phone is null or phone ~ '^[0-9+ ()-]{6,20}$'),
  dzongkhag     text check (dzongkhag is null or char_length(dzongkhag) <= 60),
  target_cycle  text check (target_cycle is null or char_length(target_cycle) <= 40),
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
comment on table public.profiles is 'Application profile, 1:1 with auth.users. Contains no role information (roles live in user_roles).';

create trigger profiles_updated_at before update on public.profiles
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- Roles & permissions
-- -----------------------------------------------------------------------------
create table public.permissions (
  key          text primary key check (key ~ '^[a-z_]+\.[a-z_]+$'),
  description  text not null
);

create table public.role_permissions (
  role        public.app_role not null,
  permission  text not null references public.permissions (key) on delete cascade,
  primary key (role, permission)
);

create table public.user_roles (
  user_id     uuid not null references auth.users (id) on delete cascade,
  role        public.app_role not null,
  granted_by  uuid references auth.users (id) on delete set null,
  granted_at  timestamptz not null default now(),
  primary key (user_id, role)
);
create index user_roles_role_idx on public.user_roles (role);

-- -----------------------------------------------------------------------------
-- Authorisation helpers (used by RLS and by the server)
-- -----------------------------------------------------------------------------
create or replace function public.has_role(_role public.app_role)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.user_roles ur
    where ur.user_id = auth.uid() and ur.role = _role
  );
$$;

create or replace function public.is_super_admin()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select public.has_role('super_admin');
$$;

create or replace function public.has_permission(_permission text)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.user_roles ur
    where ur.user_id = auth.uid()
      and (
        ur.role = 'super_admin'
        or exists (
          select 1 from public.role_permissions rp
          where rp.role = ur.role and rp.permission = _permission
        )
      )
  );
$$;

-- Any non-student role. Used to gate the admin area.
create or replace function public.is_staff()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.user_roles ur
    where ur.user_id = auth.uid() and ur.role <> 'student'
  );
$$;

-- Returns the permission keys held by the current user (for UI gating; the
-- database still enforces every permission independently through RLS).
create or replace function public.my_permissions()
returns setof text
language sql
stable
security definer
set search_path = ''
as $$
  select p.key from public.permissions p
  where public.is_super_admin()
  union
  select rp.permission
  from public.user_roles ur
  join public.role_permissions rp on rp.role = ur.role
  where ur.user_id = auth.uid();
$$;

revoke all on function public.has_role(public.app_role) from public;
revoke all on function public.is_super_admin() from public;
revoke all on function public.has_permission(text) from public;
revoke all on function public.is_staff() from public;
revoke all on function public.my_permissions() from public;
grant execute on function public.has_role(public.app_role) to authenticated, service_role;
grant execute on function public.is_super_admin() to authenticated, service_role;
grant execute on function public.has_permission(text) to anon, authenticated, service_role;
grant execute on function public.is_staff() to anon, authenticated, service_role;
grant execute on function public.my_permissions() to authenticated, service_role;

-- -----------------------------------------------------------------------------
-- New-user bootstrap: create profile + student role
-- -----------------------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.profiles (id, full_name)
  values (
    new.id,
    left(coalesce(new.raw_user_meta_data ->> 'full_name', ''), 120)
  )
  on conflict (id) do nothing;

  insert into public.user_roles (user_id, role)
  values (new.id, 'student')
  on conflict do nothing;

  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- -----------------------------------------------------------------------------
-- Audit log (append-only)
-- -----------------------------------------------------------------------------
create table public.audit_logs (
  id           bigint generated always as identity primary key,
  actor_id     uuid references auth.users (id) on delete set null,
  action       text not null,          -- e.g. INSERT / UPDATE / DELETE / role.grant
  entity_type  text not null,          -- table or domain name
  entity_id    text,
  before_data  jsonb,
  after_data   jsonb,
  created_at   timestamptz not null default now()
);
create index audit_logs_entity_idx on public.audit_logs (entity_type, entity_id);
create index audit_logs_actor_idx on public.audit_logs (actor_id, created_at desc);
create index audit_logs_created_idx on public.audit_logs (created_at desc);

-- Generic row-change auditing. Attach to tables whose changes matter.
create or replace function public.audit_row_change()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  _id text;
begin
  if tg_op = 'DELETE' then
    _id := (to_jsonb(old) ->> 'id');
  else
    _id := (to_jsonb(new) ->> 'id');
  end if;

  insert into public.audit_logs (actor_id, action, entity_type, entity_id, before_data, after_data)
  values (
    auth.uid(),
    tg_op,
    tg_table_name,
    coalesce(
      _id,
      to_jsonb(coalesce(new, old)) ->> 'user_id',
      to_jsonb(coalesce(new, old)) ->> 'key'
    ),
    case when tg_op in ('UPDATE', 'DELETE') then to_jsonb(old) end,
    case when tg_op in ('INSERT', 'UPDATE') then to_jsonb(new) end
  );
  return coalesce(new, old);
end;
$$;

create trigger audit_user_roles
  after insert or update or delete on public.user_roles
  for each row execute function public.audit_row_change();

create trigger audit_role_permissions
  after insert or update or delete on public.role_permissions
  for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Application settings (key/value, admin-editable)
-- -----------------------------------------------------------------------------
create table public.app_settings (
  key         text primary key check (key ~ '^[a-z0-9_.]+$'),
  value       jsonb not null,
  is_public   boolean not null default false,
  updated_by  uuid references auth.users (id) on delete set null,
  updated_at  timestamptz not null default now()
);
create trigger app_settings_updated_at before update on public.app_settings
  for each row execute function public.set_updated_at();
create trigger audit_app_settings
  after insert or update or delete on public.app_settings
  for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------
alter table public.profiles enable row level security;
alter table public.permissions enable row level security;
alter table public.role_permissions enable row level security;
alter table public.user_roles enable row level security;
alter table public.audit_logs enable row level security;
alter table public.app_settings enable row level security;

-- profiles: owner reads/updates own; staff with users.manage read/update all.
create policy profiles_select on public.profiles for select to authenticated
  using (id = auth.uid() or public.has_permission('users.manage'));
create policy profiles_update_own on public.profiles for update to authenticated
  using (id = auth.uid()) with check (id = auth.uid());
create policy profiles_update_admin on public.profiles for update to authenticated
  using (public.has_permission('users.manage')) with check (public.has_permission('users.manage'));

-- permissions catalogue: readable by staff; managed by super admin only.
create policy permissions_select on public.permissions for select to authenticated
  using (public.is_staff());
create policy role_permissions_select on public.role_permissions for select to authenticated
  using (public.is_staff());
create policy role_permissions_write on public.role_permissions for all to authenticated
  using (public.is_super_admin()) with check (public.is_super_admin());

-- user_roles: users see their own roles; roles.manage holders see/manage all.
-- Only the super admin may grant or revoke super_admin.
create policy user_roles_select on public.user_roles for select to authenticated
  using (user_id = auth.uid() or public.has_permission('roles.manage'));
create policy user_roles_insert on public.user_roles for insert to authenticated
  with check (
    public.has_permission('roles.manage')
    and (role <> 'super_admin' or public.is_super_admin())
  );
create policy user_roles_delete on public.user_roles for delete to authenticated
  using (
    public.has_permission('roles.manage')
    and (role <> 'super_admin' or public.is_super_admin())
    and user_id <> auth.uid() -- cannot remove your own roles (prevents lock-out)
  );

-- audit logs: read-only for audit.read; no client inserts (triggers only).
create policy audit_logs_select on public.audit_logs for select to authenticated
  using (public.has_permission('audit.read'));

-- settings: public keys readable by anyone; all keys by settings.manage.
create policy app_settings_select_public on public.app_settings for select to anon, authenticated
  using (is_public or public.has_permission('settings.manage'));
create policy app_settings_write on public.app_settings for all to authenticated
  using (public.has_permission('settings.manage')) with check (public.has_permission('settings.manage'));

-- -----------------------------------------------------------------------------
-- Seed: permission catalogue and default role mappings
-- -----------------------------------------------------------------------------
insert into public.permissions (key, description) values
  ('admin.access',        'Open the administration dashboard'),
  ('users.manage',        'View and manage student and user accounts'),
  ('roles.manage',        'Grant and revoke roles'),
  ('exam_config.manage',  'Manage examination cycles, categories, papers and templates'),
  ('syllabus.manage',     'Manage subjects and topics'),
  ('questions.create',    'Create and edit draft questions'),
  ('questions.review',    'Review, verify, reject or request revision of questions'),
  ('questions.publish',   'Publish verified questions'),
  ('exams.manage',        'Build and publish mock examinations'),
  ('papers.manage',       'Manage the historical paper library'),
  ('imports.run',         'Run RCSC document imports'),
  ('packages.manage',     'Manage packages and pricing'),
  ('orders.manage',       'View and manage orders'),
  ('payments.verify',     'Verify or reject payments and grant access'),
  ('ca.manage',           'Manage current-affairs sources and items'),
  ('resources.manage',    'Manage study resources'),
  ('ai.run',              'Run AI generation jobs'),
  ('evaluations.assign',  'Assign written answers to evaluators'),
  ('evaluations.perform', 'Evaluate written answers'),
  ('support.manage',      'Read and manage contact/support messages'),
  ('reports.view',        'View business and content reports'),
  ('audit.read',          'Read audit logs'),
  ('settings.manage',     'Manage application settings');

insert into public.role_permissions (role, permission)
select 'admin', key from public.permissions where key not in ('roles.manage', 'settings.manage');

insert into public.role_permissions (role, permission) values
  ('content_reviewer',   'admin.access'),
  ('content_reviewer',   'questions.review'),
  ('content_reviewer',   'syllabus.manage'),
  ('question_developer', 'admin.access'),
  ('question_developer', 'questions.create'),
  ('researcher',         'admin.access'),
  ('researcher',         'papers.manage'),
  ('researcher',         'imports.run'),
  ('subject_specialist', 'admin.access'),
  ('subject_specialist', 'questions.create'),
  ('subject_specialist', 'questions.review'),
  ('content_writer',     'admin.access'),
  ('content_writer',     'resources.manage'),
  ('content_writer',     'ca.manage'),
  ('evaluator',          'admin.access'),
  ('evaluator',          'evaluations.perform');
