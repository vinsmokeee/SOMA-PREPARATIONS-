begin;
-- Founder, 22 Nov 2026: an ME Premium student confirms their subject once; then all other subjects are locked.
select tests.create_user('cf-stu@test.bt', 'Confirmer') as s \gset
select tests.create_user('cf-boss@test.bt', 'Boss') as b \gset
select id as tech from public.exam_categories where code = 'technical' \gset
select id as p3 from public.exam_papers where code = 'me-technical-3' \gset
select id as civil from public.specialisations where code = 'civil-engineering' \gset
select id as dental from public.specialisations where code = 'dental-surgery' \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.entitlements (user_id, package_id) values (:'s', (select id from public.packages where slug = 'me-premium'));
create temp table qs as select gen_random_uuid() as id, n from generate_series(1, 2) n;
grant select on qs to authenticated;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, specialisation_id, status, origin, verified_by, verified_at)
select id, 'ME', 'mcq', 'Confirmation test question ' || n, 1, :'p3', :'civil', 'verified', 'original', :'b', now() from qs;
insert into public.question_options (question_id, label, body, is_correct, position)
select id, l, 'Option ' || l, l = 'A', p from qs, (values ('A', 1), ('B', 2)) v(l, p);
update public.questions set status = 'published' where id in (select id from qs);
insert into public.paper_blueprint_sections (paper_id, specialisation_id, sort_order, title, question_type, question_count, marks_each, source)
values (:'p3', :'civil', 1, 'MCQ', 'mcq', 1, 1, 'test');

set local role authenticated;
select tests.login(:'s');
-- Before confirming, a Premium student can still choose again, but cannot start a paper.
update public.profiles set entry_category_id = :'tech', specialisation_id = :'dental' where id = auth.uid();
update public.profiles set specialisation_id = :'civil' where id = auth.uid();
select tests.assert((select specialisation_id = :'civil'::uuid from public.profiles where id = auth.uid()), 'an unconfirmed Premium student can choose again');
select tests.assert_fails(format($$select public.start_paper_mock(%L)$$, :'p3'), 'no ME paper before the subject is confirmed');
select tests.assert_fails($$update public.profiles set entry_confirmed_at = now() where id = auth.uid()$$, 'the confirmation cannot be set directly');
select tests.assert_fails(format($$select public.confirm_me_entry(%L, %L)$$, :'tech', :'dental'), 'a stale screen cannot confirm another subject');
select public.confirm_me_entry(:'tech', :'civil');
select tests.assert((select entry_confirmed_at is not null from public.profiles where id = auth.uid()), 'the subject is confirmed');
-- After confirming: locked, and papers open.
select tests.assert_fails(format($$update public.profiles set specialisation_id = %L where id = auth.uid()$$, :'dental'), 'the subject is locked after confirming');
select tests.assert_fails($$update public.profiles set subject_group_id = (select id from public.subject_groups limit 1) where id = auth.uid()$$, 'the Paper II group is locked too');
select tests.assert_fails($$update public.profiles set entry_confirmed_at = null where id = auth.uid()$$, 'the student cannot undo the confirmation');
select public.start_paper_mock(:'p3') as m \gset
select tests.assert(:'m' is not null, 'a confirmed student can start their paper');
-- Staff can still correct a mistake.
select tests.login(:'b');
update public.profiles set specialisation_id = :'dental' where id = :'s';
reset role;
select tests.assert((select specialisation_id = :'dental'::uuid and entry_confirmed_at is not null from public.profiles where id = :'s'), 'staff can change a confirmed subject');
rollback;
