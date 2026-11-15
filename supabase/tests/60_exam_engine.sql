begin;
-- People
select tests.create_user('cand@test.bt', 'Candidate') as s \gset
select tests.create_user('other2@test.bt', 'Other') as o \gset
select tests.create_user('boss2@test.bt', 'Founder') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');

-- Content (as service): 3 published MCQs + 1 published essay, 1 draft MCQ
insert into public.questions (id, stage, question_type, stem, explanation, status, verified_by, marks) values
  ('40000000-0000-4000-8000-000000000001', 'PE', 'mcq', 'Question one stem', 'Because A.', 'verified', :'b', 1),
  ('40000000-0000-4000-8000-000000000002', 'PE', 'mcq', 'Question two stem', 'Because B.', 'verified', :'b', 1),
  ('40000000-0000-4000-8000-000000000003', 'PE', 'mcq', 'Question three stem', 'Because C.', 'verified', :'b', 2),
  ('40000000-0000-4000-8000-000000000004', 'ME', 'essay', 'Discuss an essay topic', null, 'verified', :'b', 10),
  ('40000000-0000-4000-8000-000000000005', 'PE', 'mcq', 'Draft question stem', null, 'draft', null, 1);
update public.questions set model_answer = 'A model answer.' where id = '40000000-0000-4000-8000-000000000004';
update public.questions set status = 'published' where status = 'verified';
insert into public.question_options (id, question_id, label, body, is_correct, position) values
  ('41000000-0000-4000-8000-000000000011', '40000000-0000-4000-8000-000000000001', 'A', 'Right', true, 1),
  ('41000000-0000-4000-8000-000000000012', '40000000-0000-4000-8000-000000000001', 'B', 'Wrong', false, 2),
  ('41000000-0000-4000-8000-000000000021', '40000000-0000-4000-8000-000000000002', 'A', 'Wrong', false, 1),
  ('41000000-0000-4000-8000-000000000022', '40000000-0000-4000-8000-000000000002', 'B', 'Right', true, 2),
  ('41000000-0000-4000-8000-000000000031', '40000000-0000-4000-8000-000000000003', 'A', 'Right', true, 1),
  ('41000000-0000-4000-8000-000000000032', '40000000-0000-4000-8000-000000000003', 'B', 'Wrong', false, 2),
  ('41000000-0000-4000-8000-000000000051', '40000000-0000-4000-8000-000000000005', 'A', 'x', true, 1);

insert into public.exams (id, slug, title, stage, kind, duration_minutes, is_free, status, negative_mark_per_wrong) values
  ('42000000-0000-4000-8000-000000000001', 'free-sample', 'Free sample', 'PE', 'sample', 30, true, 'draft', 0.25),
  ('42000000-0000-4000-8000-000000000002', 'premium-mock', 'Premium mock', 'PE', 'mock', 30, false, 'draft', 0);
insert into public.exam_questions (id, exam_id, question_id, position) values
  ('43000000-0000-4000-8000-000000000001', '42000000-0000-4000-8000-000000000001', '40000000-0000-4000-8000-000000000001', 1),
  ('43000000-0000-4000-8000-000000000002', '42000000-0000-4000-8000-000000000001', '40000000-0000-4000-8000-000000000002', 2),
  ('43000000-0000-4000-8000-000000000003', '42000000-0000-4000-8000-000000000001', '40000000-0000-4000-8000-000000000003', 3),
  ('43000000-0000-4000-8000-000000000004', '42000000-0000-4000-8000-000000000001', '40000000-0000-4000-8000-000000000004', 4),
  ('43000000-0000-4000-8000-000000000009', '42000000-0000-4000-8000-000000000002', '40000000-0000-4000-8000-000000000005', 1);

-- Publishing rules: an exam containing an unpublished question cannot be published
select tests.assert_fails($$update public.exams set status = 'published' where id = '42000000-0000-4000-8000-000000000002'$$, 'exam with draft question cannot be published');
update public.exams set status = 'published' where id = '42000000-0000-4000-8000-000000000001';

set local role authenticated;

-- Anonymous visitors cannot start
select tests.login(null);
set local role anon;
select tests.assert_fails($$select public.start_attempt('42000000-0000-4000-8000-000000000001')$$, 'anon cannot start');
set local role authenticated;

-- Candidate starts the free sample
select tests.login(:'s');
select public.start_attempt('42000000-0000-4000-8000-000000000001') as att \gset
select tests.assert(public.start_attempt('42000000-0000-4000-8000-000000000001') = :'att'::uuid, 'starting again resumes the same attempt');
select tests.assert_fails($$select public.start_attempt('42000000-0000-4000-8000-000000000002')$$, 'draft exam cannot be started by a student');

-- The paper never contains answer keys or explanations
select public.get_attempt_paper(:'att') as paper \gset
select tests.assert(jsonb_array_length((:'paper'::jsonb) -> 'questions') = 4, 'paper has 4 questions');
select tests.assert(position('is_correct' in :'paper') = 0, 'paper has no is_correct');
select tests.assert(position('Because' in :'paper') = 0, 'paper has no explanations');
select tests.assert(position('model answer' in lower(:'paper')) = 0, 'paper has no model answer');
select tests.assert_fails(format($$select public.get_attempt_result(%L)$$, :'att'), 'results hidden until submission');

-- Autosave: correct Q1, wrong Q2, Q3 unanswered but flagged, essay text
select public.save_answer(:'att', '43000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000012', false, null, null, 20);
select public.save_answer(:'att', '43000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000011', false, null, null, 5); -- change answer
select public.save_answer(:'att', '43000000-0000-4000-8000-000000000002', '41000000-0000-4000-8000-000000000021', false, null, null, 15);
select public.save_answer(:'att', '43000000-0000-4000-8000-000000000003', null, false, null, true, 9999); -- flag only; time capped
select public.save_answer(:'att', '43000000-0000-4000-8000-000000000004', null, false, 'Bhutan  pursues   Gross National Happiness.', null, 60);
select tests.assert((select time_spent_seconds from public.attempt_answers where exam_question_id = '43000000-0000-4000-8000-000000000001') = 25, 'time accumulates');
select tests.assert((select time_spent_seconds from public.attempt_answers where exam_question_id = '43000000-0000-4000-8000-000000000003') = 600, 'time delta capped');
select tests.assert((select word_count from public.attempt_answers where exam_question_id = '43000000-0000-4000-8000-000000000004') = 5, 'word count computed on server');
select tests.assert((select selected_option_id from public.attempt_answers where exam_question_id = '43000000-0000-4000-8000-000000000003') is null, 'flag without selection');

-- Invalid saves
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000031')$$, :'att'), 'option from another question rejected');
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000009', null)$$, :'att'), 'question outside attempt rejected');
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000001', null, false, 'text')$$, :'att'), 'text answer on MCQ rejected');

-- Another student cannot see or touch the attempt
select tests.login(:'o');
select tests.assert_fails(format($$select public.get_attempt_paper(%L)$$, :'att'), 'other student cannot read paper');
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000002', '41000000-0000-4000-8000-000000000022')$$, :'att'), 'other student cannot save');
select tests.assert_fails(format($$select public.submit_attempt(%L)$$, :'att'), 'other student cannot submit');

-- Submit (twice — idempotent)
select tests.login(:'s');
select public.submit_attempt(:'att');
select tests.assert((select status from public.exam_attempts where id = :'att') = 'submitted', 'submitted');
select tests.assert(((public.submit_attempt(:'att')) ->> 'status') = 'submitted', 'second submit is a no-op');
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000002', '41000000-0000-4000-8000-000000000022')$$, :'att'), 'no saving after submission');

-- Marking: Q1 correct (+1), Q2 wrong (-0.25), Q3 unanswered (0), essay pending
select tests.assert((select score from public.exam_attempts where id = :'att') = 0.75, 'score with negative marking');
select tests.assert((select max_score from public.exam_attempts where id = :'att') = 14, 'max score includes all questions');
select tests.assert((select correct_count from public.exam_attempts where id = :'att') = 1, 'correct count');
select tests.assert((select incorrect_count from public.exam_attempts where id = :'att') = 1, 'incorrect count');
select tests.assert((select unanswered_count from public.exam_attempts where id = :'att') = 1, 'unanswered count (essay answered)');

-- Result now available with keys and explanations
select public.get_attempt_result(:'att') as res \gset
select tests.assert(position('Because A.' in :'res') > 0, 'result includes explanations');
select tests.assert(position('A model answer.' in :'res') > 0, 'result includes model answer');
select tests.assert(((:'res'::jsonb) -> 'questions' -> 0 -> 'answer' ->> 'is_correct')::boolean, 'Q1 marked correct');

-- A new attempt can be started after submission
select public.start_attempt('42000000-0000-4000-8000-000000000001') as att2 \gset
select tests.assert(:'att2'::uuid <> :'att'::uuid, 'new attempt after submission');

-- Time limit: once the deadline (plus grace) has passed, the attempt closes automatically
reset role;
update public.exam_attempts set started_at = now() - interval '40 minutes', deadline_at = now() - interval '1 minute' where id = :'att2';
set local role authenticated;
select tests.login(:'s');
select tests.assert_fails(format($$select public.save_answer(%L, '43000000-0000-4000-8000-000000000001', '41000000-0000-4000-8000-000000000011')$$, :'att2'), 'save rejected after deadline');
select tests.assert(((public.get_attempt_paper(:'att2')) -> 'attempt' ->> 'status') = 'auto_submitted', 'opening an expired attempt auto-submits it');
select tests.assert((select time_spent_seconds from public.exam_attempts where id = :'att2') <= 39 * 60 + 1, 'time spent capped at the deadline');

-- Students still cannot write attempts directly
update public.exam_attempts set score = 999 where id = :'att';
reset role;
select tests.assert((select score from public.exam_attempts where id = :'att') = 0.75, 'direct tampering has no effect');

-- Premium exams need access; staff may preview drafts
select tests.login(null);
update public.questions set status = 'verified', verified_by = :'b' where id = '40000000-0000-4000-8000-000000000005';
update public.questions set status = 'published' where id = '40000000-0000-4000-8000-000000000005';
update public.exams set status = 'published' where id = '42000000-0000-4000-8000-000000000002';
set local role authenticated;
select tests.login(:'s');
select tests.assert_fails($$select public.start_attempt('42000000-0000-4000-8000-000000000002')$$, 'premium exam requires access');
reset role;
insert into public.entitlements (user_id, package_id, ends_at) values (:'s', (select id from public.packages where slug = 'pe-premium'), now() + interval '30 days');
set local role authenticated;
select tests.login(:'s');
select tests.assert(public.start_attempt('42000000-0000-4000-8000-000000000002') is not null, 'premium exam starts with access');

-- Guard: non-reviewers cannot change the answer key of a published question
reset role;
select tests.create_user('dev2@test.bt') as d \gset
insert into public.user_roles (user_id, role) values (:'d', 'question_developer');
set local role authenticated;
select tests.login(:'d');
select tests.assert_fails($$update public.question_options set is_correct = true where id = '41000000-0000-4000-8000-000000000012'$$, 'developer cannot change answer key of published question');

-- Housekeeping function is not callable by clients
select tests.assert_fails($$select public.finalize_expired_attempts()$$, 'clients cannot run housekeeping');
select tests.assert_fails(format($$select public.finalize_attempt(%L, false)$$, :'att2'), 'clients cannot call finalize directly');
rollback;

-- Catalogue, duplicates (separate transaction)
begin;
select tests.create_user('cat@test.bt') as s \gset
select tests.create_user('rev3@test.bt') as r \gset
insert into public.user_roles (user_id, role) values (:'r', 'super_admin');
select tests.login(:'r');
insert into public.questions (id, stage, question_type, stem, status) values
  ('44000000-0000-4000-8000-000000000001', 'PE', 'mcq', 'Which body conducts the Bhutan Civil Service Examination?', 'draft');
-- exact duplicate (different spacing/case) is rejected
select tests.assert_fails($$insert into public.questions (stage, question_type, stem) values ('PE', 'mcq', '  which body conducts the   Bhutan Civil Service Examination? ')$$, 'exact duplicate rejected');
set local role authenticated;
select tests.assert((select count(*) from public.find_similar_questions('Which body conducts the Bhutan Civil Service Exam?')) = 1, 'near duplicate found');
select tests.login(:'s');
select tests.assert_fails($$select * from public.find_similar_questions('x')$$, 'students cannot search the bank');
select tests.assert((select count(*) from public.exam_catalogue()) = 0, 'catalogue lists only published exams');
rollback;
