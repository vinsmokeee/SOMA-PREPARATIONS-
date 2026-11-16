begin;
select tests.create_user('mt-free@test.bt', 'Free') as f \gset
select tests.create_user('mt-paid@test.bt', 'Paid') as p \gset
select tests.create_user('mt-boss@test.bt') as b \gset
select tests.create_user('mt-free2@test.bt', 'Free two') as f2 \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
do $$
declare i int; qid uuid;
begin
  for i in 1..12 loop
    qid := public.save_question(null,
      jsonb_build_object('stage','PE','question_type','mcq','stem','Mock question number ' || i,'explanation','x',
        'subject_id',(select id from public.subjects where slug = case when i <= 6 then 'data-interpretation' else 'english-communication' end),
        'is_free_sample', true),
      '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb);
    perform public.review_question(qid, 'submit'); perform public.review_question(qid, 'verify'); perform public.review_question(qid, 'publish');
  end loop;
end $$;
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('mt-sample', 'Sample PE test', 'PE', 'sample', 20, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) select :'ex', id, row_number() over () from public.questions where stem like 'Mock question%';
update public.exams set status = 'published' where id = :'ex';
select public.admin_grant_subscription(:'p', (select id from public.packages where slug = 'pe-premium'), 45, 'complimentary', 'test');

-- Free: one shared test a day; continuing an open attempt is always allowed
select tests.login(:'f');
select public.start_attempt(:'ex') as a1 \gset
select tests.assert(public.start_attempt(:'ex') = :'a1'::uuid, 'resuming the open attempt is allowed');
select public.submit_attempt(:'a1');
select tests.assert_fails(format($$select public.start_attempt(%L)$$, :'ex'), 'second free test on the same day asks for Premium');
select tests.assert_fails($$select public.create_mock_test('PE')$$, 'free accounts cannot create new mock tests');
select tests.assert_fails($$select public.create_practice_set('PE')$$, 'free practice after today''s test asks for Premium');

-- Free practice: the first practice of the day works, the next asks for Premium
select tests.login(:'f2');
select public.create_practice_set('PE', _count => 5) as fp \gset
select public.submit_attempt(:'fp');
select tests.assert_fails($$select public.create_practice_set('PE', _count => 5)$$, 'second free practice on the same day asks for Premium');
select tests.assert_fails(format($$select public.start_attempt(%L)$$, :'ex'), 'and so does a free mock test after it');

-- Premium: unlimited, and new tests start with unseen questions
select tests.login(:'p');
select public.start_attempt(:'ex') as p1 \gset
select public.submit_attempt(:'p1');
select tests.assert(public.start_attempt(:'ex') is not null, 'premium can retake the same day');
select tests.assert(public.create_practice_set('PE', _count => 5) is not null, 'premium practice is unlimited');
select public.create_mock_test('PE') as m1 \gset
select tests.assert(jsonb_array_length(public.get_attempt_paper(:'m1') -> 'questions') = 12, 'new mock uses the available questions');
select tests.assert((select kind from public.exams e join public.exam_attempts a on a.exam_id = e.id where a.id = :'m1') = 'mock', 'it is a mock test');
select tests.assert((select duration_minutes from public.exams e join public.exam_attempts a on a.exam_id = e.id where a.id = :'m1') = 18, 'timed in proportion to the real paper (150 min for 100)');
rollback;
