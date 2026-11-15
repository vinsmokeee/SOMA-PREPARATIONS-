begin;
select tests.create_user('buyer@test.bt') as s \gset
select tests.create_user('else@test.bt') as e \gset
select tests.create_user('fin@test.bt') as f \gset
insert into public.user_roles (user_id, role) values (:'f', 'admin');

-- An order + payment created server-side
insert into public.orders (id, user_id, package_id, amount)
values ('20000000-0000-4000-8000-000000000001', :'s', (select id from public.packages where slug = 'pe-premium'), 499);
insert into public.payments (id, order_id, method, amount)
values ('20000000-0000-4000-8000-000000000002', '20000000-0000-4000-8000-000000000001', 'manual_bank_transfer', 499);

set local role authenticated;
select tests.login(:'s');
select tests.assert((select count(*) from public.orders) = 1, 'buyer sees own order');
select tests.assert(not public.has_stage_access('PE'), 'no access before verification');
-- Buyer cannot mark own payment verified or grant entitlement
update public.payments set status = 'verified', verified_by = :'s' where id = '20000000-0000-4000-8000-000000000002';
select tests.assert((select status from public.payments where id = '20000000-0000-4000-8000-000000000002') = 'submitted', 'buyer cannot verify payment');
select tests.assert_fails(format($$insert into public.entitlements (user_id, package_id) values (%L, (select id from public.packages where slug = 'pe-premium'))$$, :'s'), 'buyer cannot self-grant');
select tests.assert_fails(format($$insert into public.orders (user_id, package_id, amount) values (%L, (select id from public.packages limit 1), 0)$$, :'s'), 'buyer cannot insert orders directly');

-- Another student sees nothing
select tests.login(:'e');
select tests.assert((select count(*) from public.orders) = 0, 'other student cannot see order');
select tests.assert((select count(*) from public.payments) = 0, 'other student cannot see payment');

-- Admin verifies and grants
select tests.login(:'f');
update public.payments set status = 'verified', verified_by = :'f', verified_at = now() where id = '20000000-0000-4000-8000-000000000002';
insert into public.entitlements (user_id, package_id, order_id, ends_at, granted_by)
values (:'s', (select id from public.packages where slug = 'pe-premium'), '20000000-0000-4000-8000-000000000001', now() + interval '180 days', :'f');
select tests.login(:'s');
select tests.assert(public.has_stage_access('PE'), 'PE access after verification');
select tests.assert(not public.has_stage_access('ME'), 'no ME access from PE package');

-- Attempts: students cannot create or tamper directly
reset role;
insert into public.exams (id, slug, title, stage, duration_minutes, status)
values ('30000000-0000-4000-8000-000000000001', 'sample-pe', 'Sample PE', 'PE', 60, 'draft');
insert into public.exam_attempts (id, exam_id, user_id, deadline_at)
values ('30000000-0000-4000-8000-000000000002', '30000000-0000-4000-8000-000000000001', :'s', now() + interval '60 minutes');
-- one open attempt per exam per user
select tests.assert_fails(format($$insert into public.exam_attempts (exam_id, user_id, deadline_at) values ('30000000-0000-4000-8000-000000000001', %L, now() + interval '1 hour')$$, :'s'), 'single open attempt');
set local role authenticated;
select tests.login(:'s');
select tests.assert((select count(*) from public.exam_attempts) = 1, 'student sees own attempt');
update public.exam_attempts set deadline_at = deadline_at + interval '5 hours', score = 100;
reset role;
select tests.assert((select score is null from public.exam_attempts where id = '30000000-0000-4000-8000-000000000002'), 'student cannot alter attempt');
set local role authenticated;
select tests.login(:'e');
select tests.assert((select count(*) from public.exam_attempts) = 0, 'other student cannot see attempt');
-- Draft exams invisible to students
select tests.assert((select count(*) from public.exams) = 0, 'draft exam hidden');

-- Contact form: anon may insert, not read
select tests.login(null);
set local role anon;
insert into public.contact_messages (name, email, message) values ('Karma', 'karma@example.bt', 'Hello, I have a question about PE.');
select tests.assert((select count(*) from public.contact_messages) = 0, 'anon cannot read messages');
select tests.assert_fails($$insert into public.contact_messages (name, email, message, status) values ('x', 'x@x.bt', 'spam spam spam', 'resolved')$$, 'anon cannot set status');
rollback;
