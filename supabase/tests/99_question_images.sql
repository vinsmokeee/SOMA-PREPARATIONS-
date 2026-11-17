begin;
select tests.create_user('qi-stu@test.bt', 'Student') as s \gset
select tests.create_user('qi-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Which flag figure completes this test series?','explanation','x','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"A","is_correct":true},{"body":"B","is_correct":false}]'::jsonb) as q \gset
reset role;
update public.questions set image_url = '/papers/pe-2011/fig-test.webp' where id = :'q';
select tests.assert_fails(format($$update public.questions set image_url = 'https://evil.example/x.png' where id = %L$$, :'q'), 'only site images under /papers/ are allowed');
set local role authenticated;
select tests.login(:'b');
select public.review_question(:'q', 'submit'); select public.review_question(:'q', 'verify'); select public.review_question(:'q', 'publish');
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, status) values ('qi-sample', 'Image test', 'PE', 'practice', 10, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) values (:'ex', :'q', 1);
update public.exams set status = 'published' where id = :'ex';
select tests.login(:'s');
select public.start_attempt(:'ex') as a \gset
select tests.assert((public.get_attempt_paper(:'a') -> 'questions' -> 0 ->> 'image_url') = '/papers/pe-2011/fig-test.webp', 'the paper includes the picture');
select public.submit_attempt(:'a');
select tests.assert((public.get_attempt_result(:'a') -> 'questions' -> 0 ->> 'image_url') = '/papers/pe-2011/fig-test.webp', 'the result includes the picture');
rollback;
