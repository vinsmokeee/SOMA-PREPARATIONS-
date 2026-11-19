begin;
select tests.create_user('pg-free@test.bt', 'Free') as f \gset
select tests.create_user('pg-paid@test.bt', 'Paid') as p \gset
select tests.create_user('pg-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
do $$
declare i int; qid uuid;
begin
  for i in 1..40 loop
    qid := public.save_question(null,
      jsonb_build_object('stage','PE','question_type','mcq','stem','Passage group test question ' || i,'explanation','x',
        'subject_id',(select id from public.subjects where slug = 'english-communication')),
      '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb);
    perform public.review_question(qid, 'submit'); perform public.review_question(qid, 'verify'); perform public.review_question(qid, 'publish');
  end loop;
end $$;
reset role;
-- Two passages of five questions each.
update public.questions set passage_group = 'test-passage-a', passage_position = (regexp_replace(stem, '\D', '', 'g'))::int
where stem ~ '^Passage group test question ([1-5])$';
update public.questions set passage_group = 'test-passage-b' where stem ~ '^Passage group test question (6|7|8|9|10)$';
set local role authenticated;
select tests.login(:'b');
select public.admin_grant_subscription(:'p', (select id from public.packages where slug = 'pe-premium'), 45, 'complimentary', 'test');

select tests.login(:'p');
select public.create_mock_test('PE') as a \gset
reset role;
create temp table got as
  select q.passage_group, q.passage_position, o.n
  from public.exam_attempts at join unnest(at.question_order) with ordinality as o(eq_id, n) on true
  join public.exam_questions eq on eq.id = o.eq_id join public.questions q on q.id = eq.question_id
  where at.id = :'a' and q.stem like 'Passage group test question%';
select tests.assert((select count(distinct passage_group) from got where passage_group is not null) = 1, 'a full mock test has exactly one passage per language section');
select tests.assert((select count(*) from got where passage_group is not null) = 5, 'all five questions of that passage are included');
select tests.assert((select max(n) - min(n) from got where passage_group is not null) = 4, 'the passage questions come together, one after another');

set local role authenticated;
select tests.login(:'f');
select public.create_mock_test('PE') as fa \gset
reset role;
select tests.assert(not exists (
  select 1 from public.exam_attempts at join unnest(at.question_order) as o(eq_id) on true
  join public.exam_questions eq on eq.id = o.eq_id join public.questions q on q.id = eq.question_id
  where at.id = :'fa' and q.passage_group is not null), 'free 25-question tests leave passages out');
rollback;
