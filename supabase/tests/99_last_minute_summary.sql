begin;
select tests.create_user('lm-stu@test.bt', 'Student') as s \gset
select tests.create_user('lm-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (n int, id uuid);
grant all on qq to authenticated;
insert into qq select n, public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Last-minute test question ' || n,'explanation','Because ' || n,'is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 3) n;
select public.review_question(id, 'submit'), public.review_question(id, 'verify'), public.review_question(id, 'publish') from qq;
reset role;
update public.questions set origin = 'historical_official', source_year = 2011 where id in (select id from qq where n in (1, 3));
set local role authenticated;
select tests.login(:'b');
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('lm-sample', 'LM test', 'PE', 'practice', 10, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) select :'ex', id, n from qq where n <= 2;
update public.exams set status = 'published' where id = :'ex';
create temp table eqs as select q.n, eq.id as eq_id,
  (select o.id from public.question_options o where o.question_id = q.id and not o.is_correct) as wrong_id
  from qq q join public.exam_questions eq on eq.question_id = q.id and eq.exam_id = :'ex';
grant all on eqs to authenticated;

select tests.login(:'s');
select public.start_attempt(:'ex') as a \gset
select public.save_answer(:'a', eq_id, wrong_id) from eqs;
select public.submit_attempt(:'a');
select public.my_last_minute_summary('PE') as sm \gset
select tests.assert((:'sm'::jsonb ->> 'answered')::int = 2, 'counts the questions answered');
select tests.assert(jsonb_array_length(:'sm'::jsonb -> 'mistakes') = 2, 'lists both mistakes');
select tests.assert((:'sm'::jsonb -> 'mistakes' -> 0 ->> 'past_paper')::boolean, 'past-paper mistakes come first');
select tests.assert(:'sm'::jsonb -> 'mistakes' -> 0 ->> 'answer' = 'Right', 'each mistake shows the right answer');
select tests.assert(jsonb_array_length(:'sm'::jsonb -> 'key_past') = 0, 'free accounts do not get unseen past-paper answers');
rollback;
