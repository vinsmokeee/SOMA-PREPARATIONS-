begin;
-- Founder, 23 Nov 2026: a student who changes subject must never get the old subject's paper. "Start mock" may reopen
-- a running mock only when it was built for the student's current subject.
select tests.create_user('sw-stu@test.bt', 'Switcher') as s \gset
select tests.create_user('sw-boss@test.bt', 'Boss') as b \gset
select id as tech from public.exam_categories where code = 'technical' \gset
select id as p3 from public.exam_papers where code = 'me-technical-3' \gset
select id as civil from public.specialisations where code = 'civil-engineering' \gset
select id as dental from public.specialisations where code = 'dental-surgery' \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.entitlements (user_id, package_id) values (:'s', (select id from public.packages where slug = 'me-premium'));
create temp table qs as
  select gen_random_uuid() as id, sp, n from unnest(array[:'civil', :'dental']::uuid[]) sp, generate_series(1, 2) n;
grant select on qs to authenticated;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, specialisation_id, status, origin, verified_by, verified_at)
select id, 'ME', 'mcq', 'Subject switch test question ' || sp || ' ' || n, 1, :'p3', sp, 'verified', 'original', :'b', now() from qs;
insert into public.question_options (question_id, label, body, is_correct, position)
select id, l, 'Option ' || l, l = 'A', p from qs, (values ('A', 1), ('B', 2)) v(l, p);
update public.questions set status = 'published' where id in (select id from qs);
insert into public.paper_blueprint_sections (paper_id, specialisation_id, sort_order, title, question_type, question_count, marks_each, source)
select :'p3', sp, 1, 'MCQ', 'mcq', 1, 1, 'test' from unnest(array[:'civil', :'dental']::uuid[]) sp;
update public.profiles set entry_category_id = :'tech', specialisation_id = :'civil', entry_confirmed_at = now() where id = :'s';

set local role authenticated;
select tests.login(:'s');
select public.start_paper_mock(:'p3') as m1 \gset
reset role;
select tests.assert((select count(*) = 1 and bool_and(q.specialisation_id = :'civil'::uuid) from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id
  join public.questions q on q.id = eq.question_id where a.id = :'m1'), 'a Civil student gets a Civil Paper III');
set local role authenticated;
select tests.login(:'s');
select public.pause_attempt(:'m1');
select tests.assert(jsonb_array_length(public.my_paused_exams()) = 1, 'the paused Civil mock is listed while the student is Civil');
-- An admin changes the student's subject (students with ME Premium cannot change it themselves)
select tests.login(:'b');
update public.profiles set specialisation_id = :'dental' where id = :'s';
set local role authenticated;
select tests.login(:'s');
select tests.assert(not public.exam_fits_me((select exam_id from public.exam_attempts where id = :'m1')), 'the old Civil mock does not fit a Dental student');
select tests.assert(jsonb_array_length(public.my_paused_exams()) = 0, 'the paused Civil mock is not listed for a Dental student');
select public.start_paper_mock(:'p3') as m2 \gset
select tests.assert(:'m2'::uuid <> :'m1'::uuid, 'after switching subject, Start mock builds a new paper instead of reopening the old one');
select tests.assert(public.start_paper_mock(:'p3') = :'m2'::uuid, 'the Dental mock is reopened while it runs');
reset role;
select tests.assert((select count(*) = 1 and bool_and(q.specialisation_id = :'dental'::uuid) from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id
  join public.questions q on q.id = eq.question_id where a.id = :'m2'), 'the new Paper III has only Dental Surgery questions');
select tests.assert((select status = 'in_progress' from public.exam_attempts where id = :'m1'), 'the old attempt and its answers are kept');
rollback;
