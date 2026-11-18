begin;
select tests.create_user('omr-stu@test.bt', 'Student') as s \gset
select tests.create_user('omr-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
create temp table qq (n int, id uuid);
grant all on qq to authenticated;
insert into qq select n, public.save_question(null,
  jsonb_build_object('stage','PE','question_type','mcq','stem','OMR shading test question ' || n,'explanation','x','is_free_sample', true,'subject_id',(select id from public.subjects where slug = 'data-interpretation')),
  '[{"body":"Right","is_correct":true},{"body":"Wrong","is_correct":false}]'::jsonb) from generate_series(1, 4) n;
select public.review_question(id, 'submit'), public.review_question(id, 'verify'), public.review_question(id, 'publish') from qq;
insert into public.exams (slug, title, stage, kind, duration_minutes, is_free, omr_mode, status) values ('omr-sample', 'OMR test', 'PE', 'practice', 10, true, true, 'draft') returning id as ex \gset
insert into public.exam_questions (exam_id, question_id, position) select :'ex', id, n from qq;
update public.exams set status = 'published' where id = :'ex';
-- Answer key prepared by staff (students cannot read it).
create temp table eqs as
  select q.n, eq.id as eq_id, (select o.id from public.question_options o where o.question_id = q.id and o.is_correct) as right_id
  from qq q join public.exam_questions eq on eq.question_id = q.id and eq.exam_id = :'ex';
grant all on eqs to authenticated;

select tests.login(:'s');
select public.start_attempt(:'ex') as a \gset
-- 1: right answer, well shaded. 2: right but too light. 3: right but outside the circle. 4: left blank.
select public.save_answer(:'a', eq_id, right_id, false, null, null, 5, case n when 1 then 'good' when 2 then 'too_light' else 'outside' end) from eqs where n <= 3;
select tests.assert_fails(format($$select public.save_answer(%L, %L, null, false, null, null, 0, 'smudged')$$, :'a', (select eq_id from eqs where n = 4)), 'unknown shading values are refused');
select tests.assert((select (aa -> 'mark_quality') #>> '{}' from jsonb_array_elements(public.get_attempt_paper(:'a') -> 'answers') aa where (aa ->> 'exam_question_id')::uuid = (select eq_id from eqs where n = 2)) = 'too_light', 'the paper remembers how each circle was shaded');
select public.submit_attempt(:'a');
select tests.assert((select score from public.exam_attempts where id = :'a') = 1, 'only the well-shaded right answer scores');
select tests.assert((select correct_count from public.exam_attempts where id = :'a') = 1, 'one correct');
select tests.assert((select incorrect_count from public.exam_attempts where id = :'a') = 0, 'badly shaded answers are not counted as wrong');
select tests.assert((select unanswered_count from public.exam_attempts where id = :'a') = 3, 'badly shaded answers count as not answered, like on the real scanner');
select tests.assert((select count(*) from jsonb_array_elements(public.get_attempt_result(:'a') -> 'questions') x where x -> 'answer' ->> 'mark_quality' in ('too_light', 'outside')) = 2, 'the result shows which answers were shaded badly');
-- Erasing clears the shading too.
rollback;
