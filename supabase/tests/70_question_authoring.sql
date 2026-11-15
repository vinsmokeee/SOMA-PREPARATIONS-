begin;
select tests.create_user('qdev@test.bt') as d \gset
select tests.create_user('qrev@test.bt') as r \gset
select tests.create_user('qstu@test.bt') as s \gset
select tests.create_user('qboss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'d', 'question_developer'), (:'r', 'content_reviewer'), (:'b', 'super_admin');
set local role authenticated;

-- Developer creates an MCQ with three options
select tests.login(:'d');
select public.save_question(null,
  jsonb_build_object('stage', 'PE', 'question_type', 'mcq', 'stem', 'Sample stem for authoring tests', 'explanation', 'Because.',
                     'subject_id', (select id from public.subjects where slug = 'english-communication')),
  '[{"body":"One","is_correct":false},{"body":"Two","is_correct":true},{"body":"Three","is_correct":false}]'::jsonb) as q \gset
select tests.assert((select status from public.questions where id = :'q') = 'draft', 'new questions are drafts');
select tests.assert((select string_agg(label || ':' || body, ',' order by position) from public.question_options where question_id = :'q') = 'A:One,B:Two,C:Three', 'options lettered by position');

-- Reorder + remove + add in one save (re-lettering without unique conflicts); existing ids kept
select id as opt_two from public.question_options where question_id = :'q' and body = 'Two' \gset
select public.save_question(:'q',
  jsonb_build_object('stage', 'PE', 'question_type', 'mcq', 'stem', 'Sample stem for authoring tests', 'explanation', 'Because.',
                     'subject_id', (select id from public.subjects where slug = 'english-communication')),
  jsonb_build_array(jsonb_build_object('id', :'opt_two', 'body', 'Two', 'is_correct', true), jsonb_build_object('body', 'Four', 'is_correct', false)));
select tests.assert((select string_agg(label || ':' || body, ',' order by position) from public.question_options where question_id = :'q') = 'A:Two,B:Four', 'reordered and re-lettered');
select tests.assert((select label from public.question_options where id = :'opt_two') = 'A', 'option id preserved');

-- Workflow
select tests.assert(public.review_question(:'q', 'submit') = 'awaiting_review', 'developer submits for review');
select tests.assert_fails(format($$select public.review_question(%L, 'verify')$$, :'q'), 'developer cannot verify');
select tests.assert_fails(format($$select public.review_question(%L, 'publish')$$, :'q'), 'cannot publish before verification');

select tests.login(:'r');
select tests.assert_fails(format($$select public.review_question(%L, 'request_revision')$$, :'q'), 'revision request needs a comment');
select tests.assert(public.review_question(:'q', 'verify') = 'verified', 'reviewer verifies');
select tests.assert_fails(format($$select public.review_question(%L, 'publish')$$, :'q'), 'reviewer cannot publish');

select tests.login(:'b');
select tests.assert(public.review_question(:'q', 'publish') = 'published', 'founder publishes');
select tests.assert((select count(*) from public.content_reviews where entity_id = :'q') = 3, 'review history recorded');

-- Completeness check: an MCQ without a correct option cannot be verified
select tests.login(:'d');
select public.save_question(null,
  jsonb_build_object('stage', 'PE', 'question_type', 'mcq', 'stem', 'Incomplete question stem here', 'explanation', 'x',
                     'subject_id', (select id from public.subjects where slug = 'english-communication')),
  '[{"body":"A","is_correct":false},{"body":"B","is_correct":false}]'::jsonb) as q2 \gset
select public.review_question(:'q2', 'submit');
select tests.login(:'r');
select tests.assert_fails(format($$select public.review_question(%L, 'verify')$$, :'q2'), 'mcq needs exactly one correct option');

-- Written question with rubric
select tests.login(:'d');
select public.save_question(null,
  jsonb_build_object('stage', 'ME', 'question_type', 'essay', 'stem', 'Write an essay about public service', 'model_answer', 'A model.',
                     'word_limit', '500', 'marks', '20'),
  '[]'::jsonb,
  '[{"label":"Structure","description":"Clear introduction and conclusion","max_marks":5},{"label":"Content","description":"Relevant arguments","max_marks":15}]'::jsonb,
  '[{"citation":"Constitution of Bhutan, Article 26","url":"https://example.org"}]'::jsonb) as q3 \gset
select tests.assert((select count(*) from public.rubric_criteria where question_id = :'q3') = 2, 'rubric saved');
select tests.assert((select count(*) from public.question_references where question_id = :'q3') = 1, 'reference saved');

-- Students cannot author
select tests.login(:'s');
select tests.assert_fails($$select public.save_question(null, '{"stage":"PE","question_type":"mcq","stem":"Student attempt at a question"}'::jsonb)$$, 'students cannot create questions');
select tests.assert_fails(format($$select public.review_question(%L, 'archive')$$, :'q'), 'students cannot review');
rollback;

-- Exam builder
begin;
select tests.create_user('eb@test.bt') as b \gset
select tests.create_user('ebs@test.bt') as s \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
set local role authenticated;
select tests.login(:'b');
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','Builder question number one','explanation','x','subject_id',(select id from public.subjects where slug='data-interpretation')),
  '[{"body":"a","is_correct":true},{"body":"b","is_correct":false}]'::jsonb) as q1 \gset
select public.save_question(null, jsonb_build_object('stage','PE','question_type','mcq','stem','Builder question number two','explanation','x','subject_id',(select id from public.subjects where slug='data-interpretation')),
  '[{"body":"a","is_correct":true},{"body":"b","is_correct":false}]'::jsonb) as q2 \gset
select public.save_question(null, jsonb_build_object('stage','ME','question_type','essay','stem','An ME essay for the builder','model_answer','m'), '[]'::jsonb) as q3 \gset
insert into public.exams (id, slug, title, stage, duration_minutes) values ('45000000-0000-4000-8000-000000000001', 'builder', 'Builder', 'PE', 10);
select public.add_exam_question('45000000-0000-4000-8000-000000000001', :'q1') as e1 \gset
select public.add_exam_question('45000000-0000-4000-8000-000000000001', :'q2', 'Data') as e2 \gset
select tests.assert_fails(format($$select public.add_exam_question('45000000-0000-4000-8000-000000000001', %L)$$, :'q3'), 'ME question cannot go in a PE exam');
select tests.assert_fails(format($$select public.add_exam_question('45000000-0000-4000-8000-000000000001', %L)$$, :'q1'), 'same question twice rejected');
select public.move_exam_question(:'e2', -1);
select tests.assert((select position from public.exam_questions where id = :'e2') = 1, 'moved up (swap without conflict)');
select public.remove_exam_question(:'e2');
select tests.assert((select position from public.exam_questions where id = :'e1') = 1, 'positions closed up after removal');
select tests.login(:'s');
select tests.assert_fails(format($$select public.add_exam_question('45000000-0000-4000-8000-000000000001', %L)$$, :'q2'), 'students cannot build exams');
rollback;
