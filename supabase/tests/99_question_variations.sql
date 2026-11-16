begin;
select tests.create_user('qv-boss@test.bt') as b \gset
select tests.create_user('qv-stu@test.bt') as s \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
-- A published source question and an AI variation of it
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','Source question about percentages','explanation','x',
  'subject_id',(select id from public.subjects where slug='data-interpretation'),'is_free_sample',true),
  '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb) as src \gset
select public.review_question(:'src', 'submit'); select public.review_question(:'src', 'verify'); select public.review_question(:'src', 'publish');
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','A variation testing percentages differently','explanation','x',
  'subject_id',(select id from public.subjects where slug='data-interpretation'),'is_free_sample',true,'origin','ai_variation'),
  '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb) as v \gset
update public.questions set status = 'ai_generated', parent_question_id = :'src', variation_type = 'new_scenario',
  ai_review = '{"verdict":"flag","issues":["Weak distractors"]}' where id = :'v';

-- AI variations still need human verification before publishing
select tests.assert_fails(format($$update public.questions set status = 'published' where id = %L$$, :'v'), 'variation cannot be published directly');
select tests.assert_fails(format($$select public.review_question(%L, 'publish')$$, :'v'), 'variation cannot skip verification');
select tests.assert(((public.ai_question_overview()) ->> 'flagged')::int = 1 and ((public.ai_question_overview()) ->> 'variations')::int = 1, 'overview counts flagged drafts and variations');
select public.review_question(:'v', 'submit'); select public.review_question(:'v', 'verify'); select public.review_question(:'v', 'publish');

-- Students see where each question comes from in their results
select tests.login(:'s');
select tests.assert_fails($$select public.ai_question_overview()$$, 'students cannot see the AI overview');
select public.create_practice_set('PE', null, null, null, 5, null, 'mixed') as att \gset
select public.submit_attempt(:'att');
select tests.assert((select count(*) from jsonb_array_elements(public.get_attempt_result(:'att') -> 'questions') q where q ->> 'origin' = 'ai_variation') = 1, 'result shows the AI variation origin');
select tests.assert((select count(*) from jsonb_array_elements(public.get_attempt_result(:'att') -> 'questions') q where q ->> 'origin' = 'original') = 1, 'result shows the original origin');
rollback;
