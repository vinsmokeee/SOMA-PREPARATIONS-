-- =============================================================================
-- Soma Preparations — Migration 0008: Admin helper functions
-- Email addresses live in auth.users, which clients cannot read. This function
-- exposes a minimal user directory to holders of users.manage only.
-- =============================================================================
create or replace function public.admin_list_users(_search text default null, _limit int default 50, _offset int default 0)
returns table (
  id uuid,
  email text,
  full_name text,
  is_active boolean,
  roles public.app_role[],
  created_at timestamptz
)
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not public.has_permission('users.manage') then
    raise exception 'Missing permission users.manage' using errcode = '42501';
  end if;
  return query
    select u.id, u.email::text, p.full_name, p.is_active,
           coalesce(array_agg(ur.role order by ur.role) filter (where ur.role is not null), '{}')::public.app_role[],
           u.created_at
    from auth.users u
    left join public.profiles p on p.id = u.id
    left join public.user_roles ur on ur.user_id = u.id
    where _search is null or _search = ''
       or u.email ilike '%' || _search || '%'
       or p.full_name ilike '%' || _search || '%'
    group by u.id, u.email, p.full_name, p.is_active, u.created_at
    order by u.created_at desc
    limit least(greatest(_limit, 1), 200) offset greatest(_offset, 0);
end;
$$;
revoke all on function public.admin_list_users(text, int, int) from public;
grant execute on function public.admin_list_users(text, int, int) to authenticated, service_role;

-- Dashboard counters for the admin overview (staff only).
create or replace function public.admin_overview_counts()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not public.has_permission('admin.access') then
    raise exception 'Missing permission admin.access' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'students', (select count(*) from public.user_roles where role = 'student'),
    'staff', (select count(distinct user_id) from public.user_roles where role <> 'student'),
    'questions_published', (select count(*) from public.questions where status = 'published'),
    'questions_in_review', (select count(*) from public.questions where status in ('ai_generated', 'awaiting_review', 'revision_requested')),
    'source_documents', (select count(*) from public.source_documents),
    'messages_new', (select count(*) from public.contact_messages where status = 'new'),
    'orders_awaiting', (select count(*) from public.orders where status = 'awaiting_verification')
  );
end;
$$;
revoke all on function public.admin_overview_counts() from public;
grant execute on function public.admin_overview_counts() to authenticated, service_role;
