begin;
select tests.create_user('ai-boss@test.bt') as b \gset
select tests.create_user('ai-stu@test.bt') as s \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
-- An AI job and an AI-drafted question are recorded with their provenance
insert into public.ai_jobs (id, kind, provider, model, status, input, requested_by)
values ('4a000000-0000-4000-8000-000000000001', 'question_generation', 'anthropic', 'claude-opus-5-5', 'succeeded', '{}'::jsonb, :'b');
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','An AI drafted question about data','explanation','x','origin','ai_generated',
  'subject_id',(select id from public.subjects where slug='data-interpretation')), '[{"body":"a","is_correct":true},{"body":"b","is_correct":false}]'::jsonb) as q \gset
update public.questions set status = 'ai_generated', ai_job_id = '4a000000-0000-4000-8000-000000000001' where id = :'q';
-- AI drafts can never be published without review
select tests.assert_fails(format($$update public.questions set status = 'published' where id = %L$$, :'q'), 'AI draft cannot be published directly');
select tests.assert_fails(format($$select public.review_question(%L, 'publish')$$, :'q'), 'AI draft cannot skip verification');
select tests.assert(public.review_question(:'q', 'submit') = 'awaiting_review', 'AI draft enters review');
-- Analysis reports it
select tests.assert(((public.question_bank_analysis('PE')) -> 'subjects') @> '[{"name":"Data Interpretation","ai_drafted":1}]'::jsonb, 'analysis counts AI drafts');
-- Students cannot run analysis or see AI jobs
select tests.login(:'s');
select tests.assert_fails($$select public.question_bank_analysis()$$, 'students cannot read bank analysis');
select tests.assert((select count(*) from public.ai_jobs) = 0, 'students cannot see AI jobs');
rollback;
