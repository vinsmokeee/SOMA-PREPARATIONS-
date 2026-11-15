begin;
-- Users
select tests.create_user('student@test.bt', 'Pema Student') as s \gset
select tests.create_user('admin@test.bt', 'Founder') as a \gset
select tests.create_user('other@test.bt') as o \gset

-- New users get a profile + student role automatically
select tests.assert((select count(*) from public.profiles where id = :'s') = 1, 'profile created');
select tests.assert((select full_name from public.profiles where id = :'s') = 'Pema Student', 'full_name copied from metadata');
select tests.assert(exists (select 1 from public.user_roles where user_id = :'s' and role = 'student'), 'student role assigned');

-- Bootstrap super admin (service-level operation)
insert into public.user_roles (user_id, role) values (:'a', 'super_admin');

set local role authenticated;

-- Student cannot see other profiles and has no staff permissions
select tests.login(:'s');
select tests.assert((select count(*) from public.profiles) = 1, 'student sees only own profile');
select tests.assert(not public.is_staff(), 'student is not staff');
select tests.assert(not public.has_permission('admin.access'), 'student lacks admin.access');
select tests.assert((select count(*) from public.my_permissions()) = 0, 'student has no permissions');

-- Student cannot escalate their own role
select tests.assert_fails(format($$insert into public.user_roles (user_id, role) values (%L, 'super_admin')$$, :'s'), 'student self-escalation to super_admin');
select tests.assert_fails(format($$insert into public.user_roles (user_id, role) values (%L, 'admin')$$, :'s'), 'student self-escalation to admin');

-- Student can update own profile but not others
update public.profiles set full_name = 'Pema D.' where id = :'s';
update public.profiles set full_name = 'hacked' where id = :'o';
reset role;
select tests.assert((select full_name from public.profiles where id = :'s') = 'Pema D.', 'own profile updated');
select tests.assert((select full_name from public.profiles where id = :'o') <> 'hacked', 'other profile unchanged');
set local role authenticated;

-- Super admin holds every permission and can manage roles
select tests.login(:'a');
select tests.assert(public.is_super_admin(), 'super admin recognised');
select tests.assert(public.has_permission('settings.manage'), 'super admin has settings.manage');
select tests.assert((select count(*) from public.my_permissions()) = (select count(*) from public.permissions), 'super admin has all permissions');
select tests.assert((select count(*) from public.profiles) = 3, 'super admin sees all profiles');
insert into public.user_roles (user_id, role) values (:'o', 'content_reviewer');
delete from public.user_roles where user_id = :'a' and role = 'super_admin';
select tests.assert(public.is_super_admin(), 'super admin cannot remove own role (lock-out guard)');

-- Reviewer: limited permissions, cannot grant roles
select tests.login(:'o');
select tests.assert(public.is_staff(), 'reviewer is staff');
select tests.assert(public.has_permission('questions.review'), 'reviewer can review');
select tests.assert(not public.has_permission('payments.verify'), 'reviewer cannot verify payments');
select tests.assert_fails(format($$insert into public.user_roles (user_id, role) values (%L, 'admin')$$, :'s'), 'reviewer cannot grant roles');

-- Audit log recorded the role grant and is not readable by reviewer
reset role;
select tests.assert(exists (select 1 from public.audit_logs where entity_type = 'user_roles' and actor_id = :'a' and action = 'INSERT'), 'role grant audited with actor');
set local role authenticated;
select tests.assert((select count(*) from public.audit_logs) = 0, 'reviewer cannot read audit logs');
select tests.assert_fails($$insert into public.audit_logs (action, entity_type) values ('x','y')$$, 'clients cannot write audit logs');
rollback;
