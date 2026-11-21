begin;
select tests.create_user('rq-boss@test.bt') as b \gset
select tests.create_user('rq-stu@test.bt', 'Student') as s \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (id uuid);
grant all on qq to authenticated;
insert into qq select public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','Repeat test question ' || n,'explanation','x','subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 2) n;
insert into public.question_appearances (question_id, year) select id, 2019 from qq;
insert into public.question_appearances (question_id, year) select id, 2023 from qq limit 1;
select tests.assert((select count(*) from public.repeated_questions()) >= 1, 'a question asked in two years is listed');
select tests.assert((select years from public.repeated_questions() r join qq on qq.id = r.question_id) = array[2019, 2023], 'its years are listed in order');
select tests.login(:'s');
select tests.assert((select count(*) from public.question_appearances where question_id in (select id from qq)) = 3, 'students can read the years');
select tests.assert_fails($$insert into public.question_appearances (question_id, year) select id, 2024 from qq limit 1$$, 'students cannot add years');
select tests.assert_fails($$select * from public.repeated_questions()$$, 'students cannot open the founder list');
select tests.assert(not exists (select 1 from public.attempt_repeat_years(gen_random_uuid())), 'no years for an attempt that is not yours');
rollback;
