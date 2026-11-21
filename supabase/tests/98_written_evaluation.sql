begin;
-- ME is Premium only (free_total 0 live); this test checks the allowance mechanics with 3 free.
update public.app_settings set value = jsonb_set(value, '{free_total}', '3') where key = 'evaluation.config';
select tests.create_user('we-stu@test.bt', 'Writer') as s \gset
select tests.create_user('we-oth@test.bt', 'Other') as o \gset
select tests.create_user('we-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.subjects (stage, slug, name, paper_id) values ('ME', 'we-governance', 'Governance', '00000000-0000-4000-8000-000000000412');

set local role authenticated;
select tests.login(:'b');
-- A published free-sample essay with a rubric and an answer guide
select public.save_question(null, jsonb_build_object('stage','ME','question_type','essay','stem','Explain the importance of a constitutional monarchy.',
  'model_answer','A model answer of sufficient length for the test.','marks','10','is_free_sample',true,
  'subject_id',(select id from public.subjects where slug='we-governance'),'paper_id','00000000-0000-4000-8000-000000000412'),
  '[]'::jsonb, '[{"label":"Content","description":"d","max_marks":6},{"label":"Structure","description":"d","max_marks":4}]'::jsonb) as q \gset
select public.save_question_guide(:'q', '[{"point":"Separation of powers","marks":2},{"point":"  "}]'::jsonb, 'Any well-argued view');
select tests.assert((select jsonb_array_length(key_points) from public.questions where id = :'q') = 1, 'blank key points dropped');
select public.review_question(:'q', 'submit'); select public.review_question(:'q', 'verify'); select public.review_question(:'q', 'publish');
-- Premium (not free) question
select public.save_question(null, jsonb_build_object('stage','ME','question_type','short_answer','stem','Describe the role of the National Council briefly.',
  'model_answer','A model answer of sufficient length for the test.','marks','5',
  'subject_id',(select id from public.subjects where slug='we-governance'),'paper_id','00000000-0000-4000-8000-000000000412'), '[]'::jsonb, '[{"label":"Content","description":"d","max_marks":5}]'::jsonb) as q2 \gset
select public.review_question(:'q2', 'submit'); select public.review_question(:'q2', 'verify'); select public.review_question(:'q2', 'publish');

-- Students cannot read the answer guide (questions table is closed to them)
select tests.login(:'s');
-- The paper belongs to the General Graduates entry; the student chooses it first.
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'administrative') where id = auth.uid();
select tests.assert((select count(*) from public.questions) = 0, 'students cannot read questions or answer guides');
select tests.assert((select count(*) from public.written_practice_questions()) = 2, 'both written questions listed');
select tests.assert((select has_access from public.written_practice_questions() where id = :'q2') = false, 'premium question locked for free account');
select tests.assert_fails(format($$select public.create_written_practice(%L)$$, :'q2'), 'free account cannot practise premium question');

-- Untimed written practice (one-question personal exam)
select public.create_written_practice(:'q', null) as att \gset
select tests.assert((select untimed from public.exams e join public.exam_attempts a on a.exam_id = e.id where a.id = :'att'), 'untimed practice');
select (public.get_attempt_paper(:'att') -> 'questions' -> 0 ->> 'exam_question_id') as eq \gset

-- Handwritten: switch mode, register pages, path checks
select public.set_answer_mode(:'att', :'eq', 'handwritten') as ans \gset
select tests.assert_fails(format($$select public.add_answer_page(%L, %L)$$, :'ans', :'o' || '/' || :'ans' || '/p1.jpg'), 'cannot register a page in another user''s folder');
select public.add_answer_page(:'ans', :'s' || '/' || :'ans' || '/p1.jpg', 1200, 1600, 300000, '{"blur":0.1}') as p1 \gset
select public.add_answer_page(:'ans', :'s' || '/' || :'ans' || '/p2.jpg', 1200, 1600, 300000) as p2 \gset
select tests.assert_fails(format($$select public.add_answer_page(%L, %L, null, null, 99999999)$$, :'ans', :'s' || '/' || :'ans' || '/big.jpg'), 'oversized page rejected');
select public.arrange_answer_pages(:'ans', array[:'p2', :'p1']::uuid[]);
select tests.assert((select position from public.answer_pages where id = :'p2') = 1, 'pages reordered');
select tests.assert(public.arrange_answer_pages(:'ans', array[:'p2']::uuid[]) = array[:'s' || '/' || :'ans' || '/p1.jpg'], 'removed page path returned for deletion');
-- Storage: own folder only
insert into storage.objects (bucket_id, name) values ('answer-sheets', :'s' || '/' || :'ans' || '/p3.jpg');
select tests.assert_fails(format($$insert into storage.objects (bucket_id, name) values ('answer-sheets', %L)$$, :'o' || '/' || :'ans' || '/x.jpg'), 'cannot upload into another folder');

-- Transcription must be confirmed before evaluation
select public.submit_attempt(:'att');
select tests.assert_fails(format($$select public.request_answer_evaluation(%L)$$, :'ans'), 'unconfirmed handwriting cannot be evaluated');
select public.begin_transcription(:'ans');
select tests.assert_fails(format($$select public.begin_transcription(%L)$$, :'ans'), 'no double reading');
reset role;  -- the server (secret key) stores the transcript
update public.attempt_answers set transcript_status = 'needs_review', transcript_text = 'The monarchy guides the nation and the constitution limits power.', transcript_confidence = 'medium' where id = :'ans';
-- Re-reads: the first reading and 2 re-reads are free; the next one uses one AI evaluation.
insert into public.ai_jobs (kind, provider, model, status, requested_by, input)
select 'answer_transcription', 'anthropic', 'm', 'succeeded', :'s', jsonb_build_object('answer_id', :'ans') from generate_series(1, 2);
set local role authenticated;
select tests.login(:'s');
select tests.assert((public.answer_read_info(:'ans') ->> 'free_rereads_left')::int = 1, 'one free re-read left after two readings');
select tests.assert(public.begin_transcription(:'ans') ->> 'charge_id' is null, 'a free re-read uses nothing');
reset role;
insert into public.ai_jobs (kind, provider, model, status, requested_by, input) values ('answer_transcription', 'anthropic', 'm', 'succeeded', :'s', jsonb_build_object('answer_id', :'ans'));
update public.attempt_answers set transcript_status = 'needs_review' where id = :'ans';
set local role authenticated;
select tests.login(:'s');
select tests.assert((public.answer_read_info(:'ans') ->> 'free_rereads_left')::int = 0, 'no free re-reads left');
select tests.assert(public.begin_transcription(:'ans') ->> 'charge_id' is not null, 'an extra re-read uses one AI evaluation');
select tests.assert((public.my_evaluation_allowance() ->> 'used')::int = 1, 'the extra re-read is counted');
select tests.login(:'o');
select tests.assert_fails(format($$select public.answer_read_info(%L)$$, :'ans'), 'others cannot see read info');
reset role;
update public.attempt_answers set transcript_status = 'needs_review' where id = :'ans';
set local role authenticated;
select tests.login(:'s');
select public.confirm_transcript(:'ans', 'The monarchy guides the nation and the constitution limits power.') as c \gset
select tests.assert(((:'c'::jsonb) ->> 'edit_ratio')::numeric = 0, 'unchanged transcript has zero edit ratio');
select public.confirm_transcript(:'ans', 'Completely different essay text written afterwards to gain more marks.') as c2 \gset
select tests.assert(((:'c2'::jsonb) ->> 'edit_ratio')::numeric > 0.5, 'heavy rewrite measured');

-- Evaluation request: queued, idempotent, counted, locks the answer
select public.request_answer_evaluation(:'ans') as ev \gset
select tests.assert(public.request_answer_evaluation(:'ans') = :'ev'::uuid, 'request is idempotent');
select tests.assert(((public.my_evaluation_allowance()) ->> 'used')::int = 2 and ((public.my_evaluation_allowance()) ->> 'limit')::int = 3, 'allowance counts the request (and the extra re-read)');
select tests.assert_fails(format($$select public.confirm_transcript(%L, 'x y z')$$, :'ans'), 'answer locked after evaluation request');
select tests.assert_fails(format($$select public.add_answer_page(%L, %L)$$, :'ans', :'s' || '/' || :'ans' || '/late.jpg'), 'no pages after evaluation request');
-- Students cannot write marks
select tests.assert((select status from public.evaluations where id = :'ev') = 'queued', 'student sees queued evaluation');
update public.evaluations set score = 10 where id = :'ev';
reset role;
select tests.assert((select score from public.evaluations where id = :'ev') is null, 'student update had no effect');
-- Server completes the evaluation
insert into public.ai_jobs (id, kind, provider, model, status) values ('4b000000-0000-4000-8000-000000000001', 'answer_feedback', 'anthropic', 'm', 'succeeded');
update public.evaluations set status = 'completed', ai_job_id = '4b000000-0000-4000-8000-000000000001', score = 7, scored = true,
  weakness_tags = '{lacks_examples}', details = '{"strengths":["x"]}', completed_at = now() where id = :'ev';
set local role authenticated;
select tests.login(:'s');
select tests.assert((select count(*) from public.evaluations where id = :'ev') = 1, 'student sees own completed evaluation');
select tests.assert((select count(*) from public.evaluations where status = 'queued') = 0, 'nothing else queued');
select tests.assert(((public.my_written_performance()) ->> 'avg_pct')::numeric = 70, 'written analytics average');
select tests.assert(((public.my_written_performance()) -> 'weaknesses' -> 0 ->> 'tag') = 'lacks_examples', 'weakness tags aggregated');
select tests.assert(jsonb_array_length(public.my_written_answers()) = 1, 'history lists the answer');
select tests.assert(jsonb_array_length(public.my_notebook('ME')) = 1 and (public.my_notebook('ME') -> 0 ->> 'score')::numeric = 7
  and public.my_notebook('ME') -> 0 ->> 'kind' = 'written' and public.my_notebook('ME') -> 0 ->> 'model_answer' is not null, 'a written answer marked 70% is a notebook note with the model answer');
select tests.assert(public.my_notebook('ME') -> 0 ->> 'subject' = 'Governance', 'without a topic, an ME note is grouped by its subject');
reset role;
insert into public.topics (subject_id, slug, name) values ((select id from public.subjects where slug = 'we-governance'), 'we-constitution', 'Constitution and governance');
update public.questions set topic_id = (select id from public.topics where slug = 'we-constitution') where id = :'q';
set local role authenticated;
select tests.login(:'s');
select tests.assert(public.my_notebook('ME') -> 0 ->> 'subject' = 'Constitution and governance', 'ME notes are grouped by topic inside each paper');
select tests.assert(public.request_improved_answer(:'ev') = true, 'improved answer requested');
select tests.assert(public.request_improved_answer(:'ev') = false, 'improved answer not requested twice');
select tests.assert((public.my_evaluation_allowance() ->> 'remaining')::int = 0, 'the improved answer uses one AI evaluation');
reset role;
update public.evaluations set improved_requested_at = now() - interval '10 minutes' where id = :'ev';
set local role authenticated;
select tests.login(:'s');
select tests.assert(public.request_improved_answer(:'ev') = true, 'a retry after a failure is not charged again');
select tests.assert((select count(*) from public.ai_allowance_uses where kind = 'improved_answer') = 1, 'charged once per evaluation');
insert into public.evaluation_reports (evaluation_id, user_id, reason, message) values (:'ev', :'s', 'marks_unfair', 'I covered the separation of powers.');

-- Another student sees nothing
select tests.login(:'o');
select tests.assert((select count(*) from public.answer_pages) = 0, 'other student cannot see pages');
select tests.assert((select count(*) from public.evaluations) = 0, 'other student cannot see evaluations');
select tests.assert((select count(*) from storage.objects where bucket_id = 'answer-sheets') = 0, 'other student cannot read answer sheets');
select tests.assert_fails(format($$select public.request_answer_evaluation(%L)$$, :'ans'), 'other student cannot request evaluation');
select tests.assert_fails(format($$insert into public.evaluation_reports (evaluation_id, user_id, reason, message) values (%L, %L, 'other', 'not mine at all')$$, :'ev', :'o'), 'cannot report others'' evaluations');
select tests.assert_fails($$select public.evaluation_usage()$$, 'students cannot see usage');

-- Allowance: free accounts are limited
select tests.login(:'s');
reset role;
update public.app_settings set value = jsonb_set(value, '{free_total}', '1') where key = 'evaluation.config';
set local role authenticated;
select tests.login(:'s');
select public.create_written_practice(:'q', 30) as att2 \gset
select (public.get_attempt_paper(:'att2') -> 'questions' -> 0 ->> 'exam_question_id') as eq2 \gset
select public.save_answer(:'att2', :'eq2', null, false, 'A typed answer about the constitution and the monarchy.');
select tests.assert_fails(format($$select public.request_answer_evaluation((select id from public.attempt_answers where attempt_id = %L))$$, :'att2'), 'must submit before evaluation');
select public.submit_attempt(:'att2');
select tests.assert_fails(format($$select public.request_answer_evaluation((select id from public.attempt_answers where attempt_id = %L))$$, :'att2'), 'allowance exhausted');

-- Staff see reports and usage
select tests.login(:'b');
select tests.assert((select count(*) from public.evaluation_reports where status = 'open') = 1, 'staff see open report');
select tests.assert(((public.evaluation_usage()) ->> 'open_reports')::int = 1, 'usage counts reports');
select tests.assert((select count(*) from storage.objects where bucket_id = 'answer-sheets') = 1, 'staff can read answer sheets');
rollback;
