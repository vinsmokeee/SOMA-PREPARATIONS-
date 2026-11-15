-- The sample content file applies cleanly, twice, and nothing is published.
\i supabase/content/m2_sample_content.sql
\i supabase/content/m2_sample_content.sql
begin;
select tests.assert((select count(*) from public.questions where status = 'awaiting_review' and origin = 'original') = 18, '18 sample questions awaiting review');
select tests.assert((select count(*) from public.questions where status = 'published') = 0, 'nothing published automatically');
select tests.assert(not exists (select 1 from public.questions q where q.question_type = 'mcq' and (select count(*) filter (where is_correct) from public.question_options o where o.question_id = q.id) <> 1), 'every MCQ has exactly one correct option');
select tests.assert(not exists (select 1 from public.questions where subject_id is null), 'every sample question has a subject');
select tests.assert((select count(*) from public.exam_questions eq join public.exams e on e.id = eq.exam_id where e.slug = 'pe-sample-1') = 16, 'PE sample has 16 questions');
select tests.assert((select count(*) from public.exams where status = 'draft' and slug in ('pe-sample-1', 'me-sample-1')) = 2, 'sample exams are drafts');
select tests.assert(not exists (select 1 from public.questions q where q.question_type <> 'mcq' and (select sum(max_marks) from public.rubric_criteria r where r.question_id = q.id) <> q.marks), 'rubric totals match marks');
rollback;
