begin;
select tests.create_user('qb-boss@test.bt') as b \gset
select tests.create_user('qb-stu@test.bt', 'Student') as s \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (id uuid);
grant all on qq to authenticated;
insert into qq select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Batch test question ' || n,'explanation','x','subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 3) n;
select public.review_question(id, 'submit') from qq;
reset role;
update public.questions set ai_review = jsonb_build_object('batch', 'test-batch') where id in (select id from qq);
set local role authenticated;
select tests.login(:'s');
select tests.assert_fails($$select public.publish_question_batch('test-batch')$$, 'students cannot publish a batch');
select tests.login(:'b');
select tests.assert((select waiting from public.question_batches_waiting() where batch = 'test-batch') = 3, 'the waiting batch is listed with its size');
select tests.assert(public.publish_question_batch('test-batch') = 3, 'the whole batch is published in one go');
select tests.assert((select bool_and(status = 'published' and verified_by = :'b'::uuid) from public.questions where id in (select id from qq)), 'every question is published, with the approver recorded');
select tests.assert(not exists (select 1 from public.question_batches_waiting() where batch = 'test-batch'), 'nothing is left waiting');
rollback;
