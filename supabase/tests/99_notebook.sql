begin;
-- "Your notebook": questions answered correctly, with their answers; only the student's own; nothing unseen.
select tests.create_user('nb-stu@test.bt', 'Student') as s \gset
select tests.create_user('nb-oth@test.bt', 'Other') as o \gset
select tests.create_user('nb-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (n int, id uuid);
grant all on qq to authenticated;
insert into qq select n, public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Notebook test question ' || n,'explanation','Because ' || n,'is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 3) n;
select public.review_question(id, 'submit'), public.review_question(id, 'verify'), public.review_question(id, 'publish') from qq;
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('nb-sample', 'NB test', 'PE', 'practice', 10, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) select :'ex', id, n from qq;
update public.exams set status = 'published' where id = :'ex';
create temp table eqs as select q.n, eq.id as eq_id,
  (select o.id from public.question_options o where o.question_id = q.id and o.is_correct) as right_id,
  (select o.id from public.question_options o where o.question_id = q.id and not o.is_correct) as wrong_id
  from qq q join public.exam_questions eq on eq.question_id = q.id and eq.exam_id = :'ex';
grant all on eqs to authenticated;

select tests.login(:'s');
select public.start_attempt(:'ex') as a \gset
-- Q1 right, Q2 wrong, Q3 not answered
select public.save_answer(:'a', eq_id, case when n = 1 then right_id else wrong_id end) from eqs where n <= 2;
select tests.assert(jsonb_array_length(public.my_notebook('PE')) = 0, 'nothing before the test is submitted');
select public.submit_attempt(:'a');
select public.my_notebook('PE') as nb \gset
select tests.assert(jsonb_array_length(:'nb'::jsonb) = 1, 'only the correct answer becomes a note');
select tests.assert(:'nb'::jsonb -> 0 ->> 'stem' = 'Notebook test question 1' and :'nb'::jsonb -> 0 ->> 'answer' = 'Right'
  and :'nb'::jsonb -> 0 ->> 'explanation' = 'Because 1' and :'nb'::jsonb -> 0 ->> 'kind' = 'mcq', 'the note has the question, its answer and why');
select tests.assert(:'nb'::jsonb -> 0 ->> 'subject' = (select name from public.subjects where slug = 'data-interpretation'), 'notes are grouped by subject');
select tests.assert(jsonb_array_length(public.my_notebook('ME')) = 0, 'PE notes are not in the ME notebook');
-- Answering it right again does not duplicate the note
select public.start_attempt(:'ex') as a2 \gset
select public.save_answer(:'a2', eq_id, right_id) from eqs where n = 1;
select public.submit_attempt(:'a2');
select tests.assert(jsonb_array_length(public.my_notebook('PE')) = 1, 'one note per question');
select tests.login(:'o');
select tests.assert(jsonb_array_length(public.my_notebook('PE')) = 0, 'another student sees only their own notebook');
reset role;
select tests.assert_fails($$set local role anon; select public.my_notebook('PE')$$, 'signed-out visitors have no notebook');
rollback;
