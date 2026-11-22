begin;
-- Pause an exam: the timer stops, nothing can be saved or submitted, it is never auto-submitted, Continue
-- gives back the same time, and another mock cannot be started meanwhile.
select tests.create_user('pz-stu@test.bt', 'Student') as s \gset
select tests.create_user('pz-oth@test.bt', 'Other') as o \gset
select tests.create_user('pz-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (n int, id uuid);
grant all on qq to authenticated;
insert into qq select n, public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Pause test question ' || n,'explanation','Because','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 2) n;
select public.review_question(id, 'submit'), public.review_question(id, 'verify'), public.review_question(id, 'publish') from qq;
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('pz-mock-1', 'Pause mock 1', 'PE', 'mock', 60, true, 'draft') returning id as e1 \gset
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('pz-mock-2', 'Pause mock 2', 'PE', 'mock', 60, true, 'draft') returning id as e2 \gset
insert into public.exam_questions (exam_id, question_id, position) select e, id, n from qq, unnest(array[:'e1', :'e2']::uuid[]) e;
update public.exams set status = 'published' where id in (:'e1', :'e2');
reset role;
update public.profiles set entry_category_id = null where id = :'s';
insert into public.entitlements (user_id, package_id) values (:'s', (select id from public.packages where slug = 'pe-premium'));
set local role authenticated;

select tests.login(:'s');
select public.start_attempt(:'e1') as a \gset
select (public.get_attempt_paper(:'a') -> 'questions' -> 0 ->> 'exam_question_id') as q1 \gset
select public.save_answer(:'a', :'q1', null, false, null, true);
select public.pause_attempt(:'a') as left1 \gset
select tests.assert(:'left1'::int between 3590 and 3600, 'pausing keeps the time left');
select tests.assert((select paused_at is not null from public.exam_attempts where id = :'a'), 'the exam is paused');
select tests.assert(jsonb_array_length(public.my_paused_exams()) = 1 and (public.my_paused_exams() -> 0 ->> 'paused')::boolean, 'it is listed under Paused exam');
select tests.assert_fails(format($$select public.save_answer(%L, %L, null, false, null, false)$$, :'a', :'q1'), 'no answers while paused');
select tests.assert_fails(format($$select public.submit_attempt(%L)$$, :'a'), 'no submitting while paused');
select tests.assert_fails(format($$select public.start_attempt(%L)$$, :'e2'), 'another mock cannot start while one is paused');
select tests.assert(public.start_attempt(:'e1') = :'a'::uuid, 'opening the same exam returns the paused attempt');
select tests.login(:'o');
select tests.assert_fails(format($$select public.resume_attempt(%L)$$, :'a'), 'only the student can continue');
select tests.assert_fails(format($$select public.pause_attempt(%L)$$, :'a'), 'only the student can pause');
reset role;
-- Hours later the deadline has passed, but a paused exam is never auto-submitted
update public.exam_attempts set paused_at = now() - interval '5 hours', deadline_at = now() - interval '4 hours', started_at = now() - interval '5 hours 10 minutes' where id = :'a';
set local role authenticated;
select tests.login(:'s');
select tests.assert(public.start_attempt(:'e1') = :'a'::uuid and (select status = 'in_progress' from public.exam_attempts where id = :'a'), 'a paused exam is not closed for time');
select public.resume_attempt(:'a');
select tests.assert((select paused_at is null and deadline_at > now() + interval '59 minutes' from public.exam_attempts where id = :'a'), 'Continue gives back the same time');
select tests.assert((select started_at > now() - interval '15 minutes' from public.exam_attempts where id = :'a'), 'the start moves forward by the paused time (reading time is kept)');
select public.save_answer(:'a', :'q1', null, false, null, false);
select tests.assert(public.start_attempt(:'e2') is not null, 'after continuing, other mocks can start again');
select public.submit_attempt(:'a');
select tests.assert((select time_spent_seconds < 3600 from public.exam_attempts where id = :'a'), 'time spent leaves out the paused hours');
select tests.assert(jsonb_array_length(public.my_paused_exams()) = 0, 'a running (not paused) exam is not listed under Paused exam');
rollback;
