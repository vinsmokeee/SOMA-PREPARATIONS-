begin;
select tests.create_user('stu@test.bt', 'Student One') as s \gset
select tests.create_user('root@test.bt', 'Founder') as a \gset
insert into public.user_roles (user_id, role) values (:'a', 'super_admin');
set local role authenticated;

select tests.login(:'s');
select tests.assert_fails($$select * from public.admin_list_users()$$, 'student cannot list users');
select tests.assert_fails($$select public.admin_overview_counts()$$, 'student cannot read admin counts');

select tests.login(:'a');
select tests.assert((select count(*) from public.admin_list_users()) = 2, 'admin lists users');
select tests.assert((select email from public.admin_list_users('Student')) = 'stu@test.bt', 'search by name');
select tests.assert((select 'super_admin'::public.app_role = any(roles) from public.admin_list_users('root')), 'roles aggregated');
select tests.assert((public.admin_overview_counts() ->> 'students')::int = 2, 'overview counts students');
rollback;
-- Privilege hardening (migration 0009)
select tests.assert(not has_function_privilege('anon', 'public.admin_list_users(text,int,int)', 'execute'), 'anon cannot execute admin_list_users');
select tests.assert(not has_function_privilege('authenticated', 'public.handle_new_user()', 'execute'), 'clients cannot execute trigger functions');
select tests.assert(has_function_privilege('anon', 'public.get_official_citations()', 'execute'), 'anon can read citations');
