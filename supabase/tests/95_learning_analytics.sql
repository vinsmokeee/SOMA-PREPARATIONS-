begin;
select tests.create_user('la-stu@test.bt', 'Learner') as s \gset
select tests.create_user('la-oth@test.bt', 'Other') as o \gset
select tests.create_user('la-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');

-- Publish 6 MCQs in "data-interpretation": 2 free samples, 4 premium
set local role authenticated;
select tests.login(:'b');
do $$
declare i int; qid uuid;
begin
  for i in 1..6 loop
    qid := public.save_question(null,
      jsonb_build_object('stage','PE','question_type','mcq','stem','Analytics question number ' || i,'explanation','x',
        'subject_id',(select id from public.subjects where slug='data-interpretation'),
        'is_free_sample', i <= 2),
      '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb);
    perform public.review_question(qid, 'submit');
    perform public.review_question(qid, 'verify');
    perform public.review_question(qid, 'publish');
  end loop;
end $$;

-- Free student: only the 2 free-sample questions are available
select tests.login(:'s');
select tests.assert(((public.practice_options('PE')) ->> 'total')::int = 2, 'free account sees free-sample questions only');
select tests.assert(((public.practice_options('PE')) ->> 'full_access')::boolean = false, 'free account flagged');
select public.create_practice_set('PE', (select id from public.subjects where slug='data-interpretation'), null, null, 10, null, 'mixed') as att \gset
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'att') -> 'questions') = 2, 'practice set limited to available questions');
select tests.assert((select count(*) from public.exam_catalogue()) = 0, 'personal practice sets are not in the catalogue');

-- Answer one right and one wrong, submit
do $$
declare a uuid := (select id from public.exam_attempts where user_id = auth.uid() and status = 'in_progress' limit 1);
        r record; first boolean := true;
begin
  for r in select (q ->> 'exam_question_id')::uuid as eqid, q -> 'options' as opts
           from jsonb_array_elements(public.get_attempt_paper(a) -> 'questions') q loop
    -- option bodies are "right"/"wrong"; pick by body (the paper never reveals the key)
    perform public.save_answer(a, r.eqid,
      (select (o ->> 'id')::uuid from jsonb_array_elements(r.opts) o where o ->> 'body' = case when first then 'right' else 'wrong' end), false, null, null, 30);
    first := false;
  end loop;
  perform public.submit_attempt(a);
end $$;

-- Analytics reflect exactly that
select public.my_performance('PE') as perf \gset
select tests.assert(((:'perf'::jsonb) -> 'totals' ->> 'answered')::int = 2, 'two answered');
select tests.assert(((:'perf'::jsonb) -> 'totals' ->> 'correct')::int = 1, 'one correct');
select tests.assert(((:'perf'::jsonb) ->> 'mistakes')::int = 1, 'one mistake pending');
select tests.assert(((:'perf'::jsonb) -> 'by_subject' -> 0 ->> 'answered')::int = 2, 'subject breakdown');
select tests.assert(jsonb_array_length((:'perf'::jsonb) -> 'trend') = 1, 'trend has the attempt');

-- (free accounts get one practice a day: move the first one to yesterday)
reset role;
update public.exam_attempts set started_at = started_at - interval '1 day' where id = :'att';
set local role authenticated;
select tests.login(:'s');
-- Mistakes mode builds a set from the wrong answer only
select public.create_practice_set('PE', null, null, null, 10, null, 'mistakes') as att2 \gset
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'att2') -> 'questions') = 1, 'mistakes set contains the one wrong question');
select tests.assert_fails($$select public.create_practice_set('PE', null, null, null, 10, null, 'hack')$$, 'invalid mode rejected');

-- Another student cannot start or see this student's practice sets, and has no analytics
select (select exam_id from public.exam_attempts where id = :'att2') as pexam \gset
select tests.login(:'o');
select tests.assert_fails(format($$select public.start_attempt(%L)$$, :'pexam'), 'cannot start another student''s practice set');
select tests.assert((select count(*) from public.exams where id = :'pexam') = 0, 'cannot see another student''s practice set');
select tests.assert(((public.my_performance()) -> 'totals' ->> 'answered')::int = 0, 'analytics are per student');
select tests.assert_fails($$select public.create_practice_set('PE', null, null, null, 10, null, 'mistakes')$$, 'no mistakes -> no questions');

-- With premium access all 6 are available
reset role;
select tests.login(null);
insert into public.entitlements (user_id, package_id, ends_at) values (:'o', (select id from public.packages where slug = 'pe-premium'), now() + interval '30 days');
set local role authenticated;
select tests.login(:'o');
select tests.assert(((public.practice_options('PE')) ->> 'total')::int = 6, 'premium sees all published questions');

-- Anonymous visitors get nothing
select tests.login(null);
set local role anon;
select tests.assert_fails($$select public.my_performance()$$, 'anon has no analytics');
select tests.assert_fails($$select public.practice_options('PE')$$, 'anon cannot list practice options');
rollback;
