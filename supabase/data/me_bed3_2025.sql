-- ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'teacher-aptitude'), 'basic-data-interpretation', 'Basic data interpretation' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'teacher-aptitude'), 'general-awareness', 'General awareness' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'teacher-aptitude'), 'logical-reasoning', 'Logical reasoning' on conflict (subject_id, slug) do nothing;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'teacher-aptitude'), 'problem-solving', 'Problem solving' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-bed-3') and subject_group_id is not distinct from null;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-3'), null, 'logical-reasoning', 1, 'Section A: Logical reasoning', 'mcq', 25, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-3'), null, 'basic-data-interpretation', 2, 'Section B: Basic data interpretation', 'mcq', 25, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-3'), null, 'problem-solving', 3, 'Section C: Problem solving', 'mcq', 25, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-bed-3'), null, 'general-awareness', 4, 'Section D: General awareness', 'mcq', 25, 1, null, 'BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which 3 of the 8 letter bits can be combined to create a word to describe a large reptile that lives throughout the tropics in Africa and Asia? i. ILE, ii. DRE, iii. CRO, iv. FIS, v. HUN, vi. COD, vii. MET, viii. HER', null, 'CRO + COD + ILE = CROCODILE.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ii, iv and v', false, 1), ('B', 'i, iii and viii', false, 2), ('C', 'v, vi and viii', false, 3), ('D', 'i, iii and vi', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A clock reads 3:00 AM. How many degrees will the short (hour) hand have turned when the time reaches 6:00 AM?', null, 'The hour hand turns 30 degrees an hour: 3 x 30 = 90.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '90 degrees', true, 1), ('B', '30 degrees', false, 2), ('C', '1,080 degrees', false, 3), ('D', '360 degrees', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What decimal of an hour is a second?', null, '1/3600 = 0.000277...', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.000126', false, 1), ('B', '0.0025', false, 2), ('C', '0.00027', true, 3), ('D', '0.0256', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Select the correctly spelled word.', null, 'Necessary: one c, double s.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Necesary', false, 1), ('B', 'Necessary', true, 2), ('C', 'Neccessary', false, 3), ('D', 'Necesssary', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A glass of oil and water is left untouched for a while. How will they settle?', null, 'Oil is less dense than water and does not mix with it, so it floats as a layer on top. (Picture options of the RCSC paper written as words.)', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oil on top, water at the bottom', true, 1), ('B', 'Oil droplets collected at the bottom of the water', false, 2), ('C', 'Oil at the bottom, water on top', false, 3), ('D', 'Oil spread as droplets all through the water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'If today''s date is January 25th, what date will it be in 14 days'' time?', null, 'January has 31 days: 6 days to Jan 31, then 8 more = February 8.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'February 7th', false, 1), ('B', 'February 4th', false, 2), ('C', 'February 8th', true, 3), ('D', 'February 5th', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What is the number that is one half of one quarter of one tenth of 800?', null, '800/10 = 80; 80/4 = 20; 20/2 = 10.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5', false, 1), ('B', '12', false, 2), ('C', '20', false, 3), ('D', '10', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Select the statement that logically follows: ''He drinks Pepsi, only if she drinks Coke.''', null, '''P only if Q'' means P implies Q.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'He drinks Pepsi implies she drinks Coke', true, 1), ('B', 'Both (a) and (b)', false, 2), ('C', 'She drinks Coke implies he does not drink Pepsi', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A flight leaves the airport at 9:10 am. It is a 3 hour 55 minute flight. The destination is 1 hour ahead. What time will the flight arrive (local time)?', null, '9:10 + 3:55 = 1:05 pm; + 1 hour = 2:05 pm.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '11:10 pm', false, 1), ('B', '02:10 pm', false, 2), ('C', '11:05 pm', false, 3), ('D', '02:05 pm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A sequence goes 2, 4, 8, 16, 32, __. What is the next number?', null, 'Each number doubles.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '48', false, 1), ('B', '40', false, 2), ('C', '64', true, 3), ('D', '36', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'If all Bloops are Razzies and all Razzies are Lazzies, then', null, 'All Bloops are Razzies, all Razzies are Lazzies, so all Bloops are Lazzies.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Some Bloops are Lazzies.', false, 1), ('B', 'No Lazzies are Bloops.', false, 2), ('C', 'Some Razzies are not Lazzies.', false, 3), ('D', 'All Bloops are definitely Lazzies.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A coat and a hat cost Nu 110 in total. The coat costs Nu 100 more than the hat. How much does the hat cost?', null, 'h + (h + 100) = 110, so h = 5.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu 105', false, 1), ('B', 'Nu 5', true, 2), ('C', 'Nu 10', false, 3), ('D', 'Nu 100', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '''Import'' is related to ''Export'' in the same way as ''Expenditure'' is related to', null, 'Opposites: money going out vs coming in.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Debt', false, 1), ('B', 'Deficit', false, 2), ('C', 'Tax', false, 3), ('D', 'Income', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not a millennial (internet slang) word?', null, 'lit, ootd and trolls are slang words; ''slang'' is the name for such language.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'trolls', false, 1), ('B', 'lit', false, 2), ('C', 'slang', true, 3), ('D', 'ootd', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Karma started from point A and walked 15 m south. He turned left and walked 20 m, turned left and walked 15 m, then turned left again and walked 35 m to reach point B. How far is B from A?', null, 'After the first three legs he is 20 m east of A; 35 m west puts him 15 m west of A.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '15 metres', true, 1), ('B', '30 metres', false, 2), ('C', '10 metres', false, 3), ('D', '20 metres', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Karma started from point A and walked 15 m south. He turned left and walked 20 m, turned left and walked 15 m, then turned left again and walked 35 m to reach point B. In which direction is B from A?', null, 'B is 15 m west of A.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'South', false, 1), ('B', 'East', false, 2), ('C', 'West', true, 3), ('D', 'North', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'If it takes Chencho 3.5 minutes to walk 0.5 km, how long does it take him to walk 12 km?', null, '12/0.5 = 24; 24 x 3.5 = 84 min = 1 h 24 min.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 hour 21 mins', false, 1), ('B', '1 hour', false, 2), ('C', '1 hour 24 mins', true, 3), ('D', '42 mins', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What fraction makes up the shaded parts? (see the diagram)', null, 'Three whole circles and one quarter are shaded.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-shaded-circles.png')
  returning id
)
insert into me_q select 'A22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', false, 1), ('B', '3 1/2', false, 2), ('C', '3 3/4', false, 3), ('D', '3 1/4', true, 4)) as v(label, body, ok, pos) where me_q.key = 'A22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'You own a restaurant and receive complaints about slow service. What should you prioritise to improve customer satisfaction?', null, 'More servers address slow service directly.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Offering more menu choices', false, 1), ('B', 'Hiring additional servers', true, 2), ('C', 'Cutting food costs', false, 3), ('D', 'Redecorating the restaurant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Express a speed of 36 km/h in metres per second.', null, '36 x 1000 / 3600 = 10.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'A24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10 m/s', true, 1), ('B', '17 m/s', false, 2), ('C', '12 m/s', false, 3), ('D', '14 m/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Who is located at north-east? (see the diagram; note where N is marked)', null, 'N is at the bottom of the diagram, so north is down and east is to the left: north-east is bottom-left, Tsheyang. Claude''s reading of the figure: please check.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-compass.png')
  returning id
)
insert into me_q select 'A25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kinley', false, 1), ('B', 'Tandin', false, 2), ('C', 'Tsheyang', true, 3), ('D', 'Yoedsel', false, 4)) as v(label, body, ok, pos) where me_q.key = 'A25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows global temperature anomalies from 1900 to 2025 (how much the global temperature deviates from a long-term average). The chart shows', null, 'The anomaly rises over the whole period with ups and downs.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-temperature.png')
  returning id
)
insert into me_q select 'B26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a gradual increase in global temperature anomaly.', true, 1), ('B', 'a sudden increase followed by a return to normal.', false, 2), ('C', 'a decrease in global temperature anomaly.', false, 3), ('D', 'a sudden rise in global temperature anomaly.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows global temperature anomalies from 1900 to 2025 (how much the global temperature deviates from a long-term average). Which 30-year period experienced the highest increase in temperature anomaly?', null, 'From about 0.4 to about 1.0 between 1960 and 1990.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-temperature.png')
  returning id
)
insert into me_q select 'B27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1900-1930', false, 1), ('B', '1990-2010', false, 2), ('C', '1960-1990', true, 3), ('D', '1930-1960', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The pie chart shows the average IQ scores of five schools: Phuntsholing HSS 115, Mongar HSS 98, Nangkhor HSS 102, Yangchenphu HSS 105, Zhemgang HSS 110. What percentage of the total average IQ score does Phuntsholing HSS contribute?', null, 'Total 530; 115/530 = 21.7%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-iq-pie.png')
  returning id
)
insert into me_q select 'B29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21.7%', true, 1), ('B', '20.7%', false, 2), ('C', '24.0%', false, 3), ('D', '22.8%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The pie chart shows the average IQ scores of five schools: Phuntsholing HSS 115, Mongar HSS 98, Nangkhor HSS 102, Yangchenphu HSS 105, Zhemgang HSS 110. What is the difference between the percentage shares of the school with the highest IQ score and the one with the lowest?', null, '115/530 = 21.7% and 98/530 = 18.5%: about 3 percentage points.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-iq-pie.png')
  returning id
)
insert into me_q select 'B30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'About 7%', false, 1), ('B', 'About 3%', true, 2), ('C', 'About 10%', false, 3), ('D', 'About 12%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The pie chart shows the average IQ scores of five schools: Phuntsholing HSS 115, Mongar HSS 98, Nangkhor HSS 102, Yangchenphu HSS 105, Zhemgang HSS 110. If the average IQ scores of all schools increase by 5 points, what will be the new percentage contribution of Nangkhor HSS?', null, '107/555 = 19.3%, closest 19.2%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-iq-pie.png')
  returning id
)
insert into me_q select 'B31', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20.2%', false, 1), ('B', '18.9%', false, 2), ('C', '19.2%', true, 3), ('D', '20.0%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The box plot shows the distribution of annual exam marks by gender. Which gender demonstrates better overall performance?', null, 'The female median is higher.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-boxplot.png')
  returning id
)
insert into me_q select 'B32', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Male, because their marks have fewer outliers.', false, 1), ('B', 'Female, because they have no outliers.', false, 2), ('C', 'Male, because their interquartile range is larger.', false, 3), ('D', 'Female, because their median marks are higher.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'B32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Group summary statistics: Group A mean 72, median 74, standard deviation 5; Group B mean 70, median 65, standard deviation 12. Which conclusion is most accurate?', null, 'Higher mean and smaller standard deviation.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B33', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Group A shows greater variability in performance due to the higher median.', false, 1), ('B', 'Group B is more consistent since the standard deviation is higher.', false, 2), ('C', 'Group A performed better on average, and the scores are more consistent.', true, 3), ('D', 'Group B performed better overall because their median is lower.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The bar plot shows the population of Bhutan by region and gender (total 810,000): Central female 60%, Eastern female 43.75%, Southern male 50%, Western male 46.67%. Which region has the highest proportion of male population?', null, 'Male shares: Central 40%, Eastern 56.25%, Southern 50%, Western 46.67%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-population-bar.png')
  returning id
)
insert into me_q select 'B34', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Central', false, 1), ('B', 'Eastern', true, 2), ('C', 'Southern', false, 3), ('D', 'Western', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The bar plot shows the population of Bhutan by region and gender (total 810,000): Central female 60%, Eastern female 43.75%, Southern male 50%, Western male 46.67%. If the population of the western region is 3 lakhs, the number of females there is', null, 'Female 53.33% of 300,000 = 159,990.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-population-bar.png')
  returning id
)
insert into me_q select 'B35', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '140,010', false, 1), ('B', '159,990', true, 2), ('C', '426,640', false, 3), ('D', '271,983', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'CoE enrolment (Annual Education Statistics 2024), F = female, M = male:
Year | Samtse F | Samtse M | Samtse total | Paro F | Paro M | Paro total
2020 | 457 | 456 | 913 | 856 | 733 | 1,589
2021 | 336 | 413 | 749 | 861 | 669 | 1,530
2022 | 303 | 277 | 580 | 889 | 646 | 1,535
2023 | 176 | 244 | 420 | 587 | 711 | 1,298
2024 | 325 | 185 | 581 | 692 | 525 | 1,217
In which year was the difference between female enrolment in Paro and Samtse the greatest?', null, 'Differences: 399, 525, 586, 411, 367 - greatest in 2022.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B39', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2023', false, 1), ('B', '2020', false, 2), ('C', '2022', true, 3), ('D', '2024', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'CoE enrolment (Annual Education Statistics 2024), F = female, M = male:
Year | Samtse F | Samtse M | Samtse total | Paro F | Paro M | Paro total
2020 | 457 | 456 | 913 | 856 | 733 | 1,589
2021 | 336 | 413 | 749 | 861 | 669 | 1,530
2022 | 303 | 277 | 580 | 889 | 646 | 1,535
2023 | 176 | 244 | 420 | 587 | 711 | 1,298
2024 | 325 | 185 | 581 | 692 | 525 | 1,217
The ratio of female to male students enrolled in Samtse in 2024 is', null, '325/185 = 1.76.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B40', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.92', false, 1), ('B', '0.57', false, 2), ('C', '1.33', false, 3), ('D', '1.76', true, 4)) as v(label, body, ok, pos) where me_q.key = 'B40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. True or false: the findings suggest that schools where students study more tend to achieve higher academic performance.', null, 'The points rise from left to right. (RCSC gave only True/False; two options added.)', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-study-hours.png')
  returning id
)
insert into me_q select 'B41', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'False', false, 1), ('B', 'Cannot be told from a plot', false, 2), ('C', 'Only for schools above 20 hours', false, 3), ('D', 'True', true, 4)) as v(label, body, ok, pos) where me_q.key = 'B41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. Which school appears to perform better than expected based on study hours?', null, 'School J has about 99% with only about 15 hours, well above the trend.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-study-hours.png')
  returning id
)
insert into me_q select 'B42', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'School O', false, 1), ('B', 'School J', true, 2), ('C', 'School D', false, 3), ('D', 'School C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. Which school has both the highest study hours and one of the highest academic performances?', null, 'School L is furthest right (about 22 hours) at about 102%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-study-hours.png')
  returning id
)
insert into me_q select 'B43', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'School L', true, 1), ('B', 'School I', false, 2), ('C', 'School A', false, 3), ('D', 'School G', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The plot shows average study hours per week (x-axis) against average academic performance (y-axis) across 15 schools. Which statement best describes the correlation between average study hours and academic performance?', null, 'Points rise together but do not lie on a line.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-study-hours.png')
  returning id
)
insert into me_q select 'B44', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'There is a strong negative correlation.', false, 1), ('B', 'There is no observable correlation.', false, 2), ('C', 'There is a moderate to strong positive correlation.', true, 3), ('D', 'The correlation is perfectly positive.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A survey of 100 teachers found that two-fifths prefer online training and three-fifths prefer in-person training. How many more teachers prefer in-person to online training?', null, '60 - 40 = 20.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B45', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10', false, 1), ('B', '20', true, 2), ('C', '40', false, 3), ('D', '60', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In a class survey 40% chose videos, 30% textbooks, 20% group discussions and 10% games as their preferred learning method. Which conclusion is most accurate?', null, '40% is twice 20%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B46', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Videos are twice as popular as group discussions.', true, 1), ('B', 'Most students dislike games as a learning method.', false, 2), ('C', 'Students prefer videos and textbooks equally.', false, 3), ('D', 'Textbooks are the least preferred learning method.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The map shows literacy rates by dzongkhag in Bhutan (darker patterns = higher literacy rates). Which statement is most accurate?', null, 'The darkest patterns are in the west.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-literacy-map.png')
  returning id
)
insert into me_q select 'B47', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Some western dzongkhags show higher literacy rates compared to eastern dzongkhags.', true, 1), ('B', 'Literacy rates are uniform across all dzongkhags.', false, 2), ('C', 'All northern dzongkhags have the lowest literacy rates.', false, 3), ('D', 'All eastern dzongkhags have the highest literacy rates.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The map shows literacy rates by dzongkhag in Bhutan (darker patterns = higher literacy rates). After 10 years, if an eastern dzongkhag shows a pattern as dark as the darkest pattern on the map, which conclusion is most likely true?', null, 'The darkest pattern is the highest literacy band.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-literacy-map.png')
  returning id
)
insert into me_q select 'B48', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The district has very few schools.', false, 1), ('B', 'The district has a literacy rate below 50%.', false, 2), ('C', 'The district has a literacy rate of more than 90%.', true, 3), ('D', 'The district has a very low population.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The map shows literacy rates by dzongkhag in Bhutan (darker patterns = higher literacy rates). What does the density of the pattern on the map represent?', null, 'The legend: darker patterns = higher literacy rates.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-literacy-map.png')
  returning id
)
insert into me_q select 'B49', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The literacy rate in the dzongkhag', true, 1), ('B', 'The average age of teachers in the dzongkhag', false, 2), ('C', 'The population density of the dzongkhag', false, 3), ('D', 'The size of the dzongkhag', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'As of 2024, the median age of Bhutan is about 29.9 years. What does this mean?', null, 'The median splits the population into two halves.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'B50', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Half of Bhutan''s population is younger than 29.9 years and half is older.', true, 1), ('B', 'The average age of all people in Bhutan is 29.9 years.', false, 2), ('C', 'The most common age in Bhutan is 29.9 years.', false, 3), ('D', 'Everyone in Bhutan is exactly 29.9 years old.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'B50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which one of the following fractions is greatest?', null, '0.5, 0.67, 0.75, 0.8.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C51', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4/5', true, 1), ('B', '3/4', false, 2), ('C', '2/3', false, 3), ('D', '1/2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following numbers is farthest from 1 on the number line?', null, 'Distance 11.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C52', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '-5', false, 1), ('B', '5', false, 2), ('C', '10', false, 3), ('D', '-10', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'If n = 2^3, what is the value of n^n?', null, '8^8 = (2^3)^8 = 2^24.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C53', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2^24', true, 1), ('B', '2^9', false, 2), ('C', '2^11', false, 3), ('D', '2^6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'There are 40 students; 25 of them are girls. What percent of the class is boys?', null, '15/40 = 37.5%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C54', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '62.5%', false, 1), ('B', '25.0%', false, 2), ('C', '37.5%', true, 3), ('D', '62.0%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Arjun borrowed Nu 12,000 at simple interest for 5 years and paid Nu 3,600 interest. What is the rate per annum?', null, '3600 / (12000 x 5) = 6%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C55', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5%', false, 1), ('B', '4%', false, 2), ('C', '6%', true, 3), ('D', '8%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '40% of a number is 1,992. What is 95% of that number?', null, 'Number 4,980; 95% = 4,731.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C56', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4,800', false, 1), ('B', '4,731', true, 2), ('C', '4,900', false, 3), ('D', '4,980', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C56';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Pema, who is 16, is four times as old as her brother Sonam. How old will Pema be when she is twice as old as Sonam?', null, 'Sonam 4, gap 12: Pema is twice Sonam when Sonam is 12, Pema 24.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C57', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20', false, 1), ('B', '22', false, 2), ('C', '18', false, 3), ('D', '24', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'How many minutes does Dechen take to cover 400 m running at 20 km/h?', null, '20 km/h = 333.3 m/min; 400/333.3 = 1.2.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C58', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.5 minutes', false, 1), ('B', '1.0 minute', false, 2), ('C', '2.0 minutes', false, 3), ('D', '1.2 minutes', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'x < 0. Compare Quantity A: 0.2% of x, and Quantity B: (1/5)x.', null, '0.002x > 0.2x when x is negative.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C59', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quantity A is greater.', true, 1), ('B', 'Quantity B is greater.', false, 2), ('C', 'The two quantities are equal.', false, 3), ('D', 'The relationship cannot be determined.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What percentage of 2/7 is 1/35?', null, '(1/35)/(2/7) = 1/10.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C60', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '14%', false, 1), ('B', '10%', true, 2), ('C', '12%', false, 3), ('D', '16%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C60';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'About 1/7 of Bhutan''s population lives in Punakha. Haa has about 3/4 of Punakha''s population. What fraction of Bhutan''s population lives in Haa?', null, '1/7 x 3/4 = 3/28.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C61', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1/4', false, 1), ('B', '3/28', true, 2), ('C', '21/28', false, 3), ('D', '3/11', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A shopkeeper sells a watch for Nu 3,800 at a 5% loss. At what price should it be sold for a 5% profit?', null, 'Cost 4,000; +5% = 4,200.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C62', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu 4,200', true, 1), ('B', 'Nu 4,000', false, 2), ('C', 'Nu 4,400', false, 3), ('D', 'Nu 3,980', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C62';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The average of 4 and A is 12 and the average of 6 and B is 20. What is the average of A and B?', null, 'A = 20, B = 34, average 27.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C63', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '27', true, 1), ('B', '30', false, 2), ('C', '28', false, 3), ('D', '29', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In the figure, the area of triangle ABC is 20 cm^2, BD = 4 cm is the height, and AD = BD. What is the length of DC?', null, 'AC = 2 x 20 / 4 = 10; AD = 4, so DC = 6.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, '/papers/me/bed3-2025-triangle.png')
  returning id
)
insert into me_q select 'C64', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4√2 cm', false, 1), ('B', '2√2 cm', false, 2), ('C', '6 cm', true, 3), ('D', '2 cm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A fast car leaves Thimphu for Paro at 80 km/h. At the same time a slow car leaves Paro for Thimphu at 30 km/h. When they meet, which one is farther from Thimphu?', null, 'When they meet they are at the same place.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C65', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cannot be determined', false, 1), ('B', 'Both are equally far from Thimphu', true, 2), ('C', 'The fast car', false, 3), ('D', 'The slow car', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The sum of the ages of 5 children born at intervals of 3 years is 50 years. What is the age of the eldest child?', null, '5x + 30 = 50, x = 4; eldest 4 + 12 = 16.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C66', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '18 years', false, 1), ('B', '15 years', false, 2), ('C', '17 years', false, 3), ('D', '16 years', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C66';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'How many bricks of 25 cm x 11.25 cm x 6 cm are needed for a wall 8 m x 6 m x 22.5 cm?', null, '10,800,000 / 1,687.5 = 6,400.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C67', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6,400', true, 1), ('B', '5,600', false, 2), ('C', '6,000', false, 3), ('D', '7,200', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C67';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'At a factory in Pasakha, the ratio of workers who take the bus to those who drive is 2:5. If 120 drive, how many workers are there in total?', null, 'Bus 48, total 168.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C68', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '140', false, 1), ('B', '168', true, 2), ('C', '180', false, 3), ('D', '150', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C68';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A phone costs Nu 17,500. The shopkeeper gives a 20% discount and then increases the price by 10%. What is the new price?', null, '17,500 x 0.8 x 1.1 = 15,400.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C69', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu 16,000', false, 1), ('B', 'Nu 15,600', false, 2), ('C', 'Nu 15,400', true, 3), ('D', 'Nu 16,200', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Dorji and Dema can do a piece of work in 10 days; Dorji alone in 12 days. In how many days can Dema alone do it?', null, '1/10 - 1/12 = 1/60.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C70', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '65 days', false, 1), ('B', '55 days', false, 2), ('C', '50 days', false, 3), ('D', '60 days', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C70';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '10 roommates share a monthly rent of Nu x equally. If y of them move out, what is the additional rent paid by each remaining roommate?', null, 'x/(10-y) - x/10 = xy/(10(10-y)).', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C71', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'x/(10(10-y))', false, 1), ('B', 'xy/(10(10-y))', true, 2), ('C', '10x/y', false, 3), ('D', 'x/(10-y)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C71';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Norbu, Sharmila and Tenzin can do a piece of work in 20, 30 and 60 days. In how many days can Norbu do the work if helped by the other two every third day?', null, 'Every 3 days: 2/20 + 1/10 = 1/5 of the work; 15 days.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C72', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12 days', false, 1), ('B', '18 days', false, 2), ('C', '20 days', false, 3), ('D', '15 days', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C72';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A rectangular prism has a square base of side 8 cm and height 21 cm. What is one-fourth of its volume in cm^3?', null, '8 x 8 x 21 = 1,344; /4 = 336.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C73', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '348', false, 1), ('B', '312', false, 2), ('C', '336', true, 3), ('D', '324', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C73';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Money was deposited in a bank at simple interest for 2 years. At 1% higher rate it would have earned Nu 24 more. What is the principal?', null, 'P x 1% x 2 = 24, P = 1,200.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C74', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu 1,600', false, 1), ('B', 'Nu 1,000', false, 2), ('C', 'Nu 1,400', false, 3), ('D', 'Nu 1,200', true, 4)) as v(label, body, ok, pos) where me_q.key = 'C74';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A bus takes 6 hours from Thimphu to Bumthang at 50 km/h and 7 hours 30 minutes for the return trip. What is the average speed for the whole trip?', null, '600 km / 13.5 h = 44.4.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'problem-solving'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'C75', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '48.2 km/h', false, 1), ('B', '44.4 km/h', true, 2), ('C', '45.3 km/h', false, 3), ('D', '46.8 km/h', false, 4)) as v(label, body, ok, pos) where me_q.key = 'C75';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In which year did Bhutan introduce the New Approach to Primary Education (NAPE)?', null, 'NAPE began in 1986.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D77', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2003', false, 1), ('B', '1990', false, 2), ('C', '1968', false, 3), ('D', '1986', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D77';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which Nobel Peace Prize laureate worked for children''s right to education?', null, 'Kailash Satyarthi, Nobel Peace Prize 2014.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D79', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Albert Einstein', false, 1), ('B', 'Nelson Mandela', false, 2), ('C', 'Amartya Sen', false, 3), ('D', 'Kailash Satyarthi', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D79';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'According to Bronfenbrenner (1989), which ecological system is ''a pattern of activities, roles, and interpersonal relations experienced by the developing person in a given face-to-face setting''?', null, 'Face-to-face settings form the microsystem.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D82', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mesosystem', false, 1), ('B', 'Macrosystem', false, 2), ('C', 'Microsystem', true, 3), ('D', 'Exosystem', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D82';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'When teachers in Bhutan emphasise Tha Damtsi (trustworthiness) and Ley Judrey (cause and effect) in class, which approach are they reinforcing?', null, 'These are moral and ethical values.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D83', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Constructivist pedagogy', false, 1), ('B', 'Behaviorist approach', false, 2), ('C', 'Moral education', true, 3), ('D', 'Holistic education', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D83';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In 2024 MoESD revised guidelines introduced selective and functional learning pathways so that students with significant learning challenges can study a mix of general curriculum and functional, interest-aligned subjects, with IEPs and equivalency certification (Kuensel). Which principle of inclusive education does this reflect?', null, 'Flexible pathways matched to ability and interest.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D84', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Segregating students with special needs.', false, 1), ('B', 'Focusing on academic readiness for board exams.', false, 2), ('C', 'Ensuring all students follow the same curriculum for equality and equity.', false, 3), ('D', 'Creating alternative pathways suited to students'' abilities and interests.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D84';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The Bhutan Professional Standards for Teachers (BPST) aims to', null, 'BPST sets standards to guide professional practice.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D85', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ensure discipline among teachers.', false, 1), ('B', 'guide teachers in improving practice and quality.', true, 2), ('C', 'assess teachers'' proficiency.', false, 3), ('D', 'enhance teacher workforce.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D85';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '''Schools are restructuring curriculum, pedagogy and assessment to prepare students for a knowledge-based society, creating globally competent, locally rooted citizens grounded in Bhutan''s culture and values.'' This aligns with', null, 'The education transformation launched in 2021.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D86', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Education Transformation Initiative 2021', true, 1), ('B', 'Bhutan Education Blueprint (2014-2024)', false, 2), ('C', 'Teacher Professional Standards (2019)', false, 3), ('D', 'National Education Policy 2020', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D86';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A teacher lets students submit assignments as essays, videos or podcasts. Which UDL principle is this?', null, 'Different ways for students to show learning.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D87', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Multiple means of representation', false, 1), ('B', 'Multiple means of action and expression', true, 2), ('C', 'Multiple means of engagement', false, 3), ('D', 'Universal means of standardization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D87';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A teacher gives a student with hearing difficulties visual aids and peer support to take part fully in group work. Which principle is shown?', null, 'Adjustments that let the learner participate.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D88', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reasonable accommodations', true, 1), ('B', 'Uniform teaching method', false, 2), ('C', 'Integrated instruction', false, 3), ('D', 'Segregated instruction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D88';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A teacher asks students to explore objects of different shapes and classify them. Which Piagetian strategy is this?', null, 'Learning by active exploration.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D89', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rote learning', false, 1), ('B', 'Guided discovery', true, 2), ('C', 'Direct instruction', false, 3), ('D', 'Lecture-based teaching', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D89';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A Grade III student cannot solve two-step word problems alone but succeeds with the teacher''s guiding questions. This is an example of', null, 'Support within the zone of proximal development.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D90', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Guided memorization', false, 1), ('B', 'Operant conditioning', false, 2), ('C', 'Independent practice', false, 3), ('D', 'ZPD scaffolding', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D90';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Teacher A: ''I repeat important information several times.'' Teacher B: ''I make sure my first explanation is accurate, because students retain what they learn first.'' Which laws of learning are these?', null, 'First impressions = primacy; repetition = exercise.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D91', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'B: Law of Effect; A: Law of Readiness', false, 1), ('B', 'B: Law of Readiness; A: Law of Effect', false, 2), ('C', 'B: Law of Exercise; A: Law of Primacy', false, 3), ('D', 'B: Law of Primacy; A: Law of Exercise', true, 4)) as v(label, body, ok, pos) where me_q.key = 'D91';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Asking students to compare evaporation with condensation promotes which cognitive process?', null, 'Comparing is analysing.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D92', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Remembering', false, 1), ('B', 'Analyzing', true, 2), ('C', 'Creating', false, 3), ('D', 'Applying', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D92';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which scenario best distinguishes the actual and potential developmental levels in the ZPD?', null, 'Alone vs. with support.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D93', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Solving multiplication alone vs. solving division alone', false, 1), ('B', 'Memorizing a poem vs. writing an original poem', false, 2), ('C', 'Reading a simple story independently vs. reading a complex story with a peer''s support', true, 3), ('D', 'Taking a test vs. preparing for the test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D93';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which activity BEST promotes active citizenship in a civic education curriculum?', null, 'Active participation and problem solving.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D94', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Organizing debates on local governance issues and proposing solutions.', true, 1), ('B', 'Assigning textbook readings without reflection.', false, 2), ('C', 'Conducting multiple-choice tests on democracy.', false, 3), ('D', 'Memorizing articles of the Constitution.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D94';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'MoESD proposes replacing high-stakes examinations with more continuous assessment. Which argument supports this MOST strongly?', null, 'Holistic, fair assessment.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D95', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It aligns with the holistic values of GNH and promotes equity in learning.', true, 1), ('B', 'Continuous assessment guarantees higher scores.', false, 2), ('C', 'Continuous assessment reduces teacher workload.', false, 3), ('D', 'Exams are less stressful than projects.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D95';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '''The State shall provide free education to all children of school going age up to tenth standard ...'' is in which Article of the Constitution of Bhutan?', null, 'Article 9, Section 16.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D97', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Article 34: National Referendum', false, 1), ('B', 'Article 6: Citizenship', false, 2), ('C', 'Article 9: Principles of State Policy', true, 3), ('D', 'Article 7: Fundamental Rights', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D97';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'All of the following zorig chusum terms are correct EXCEPT', null, 'Blacksmithing is Garzo; Troeko is gold and silver smithing.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D98', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Painting - Lhazo', false, 1), ('B', 'Blacksmithing - Troeko', true, 2), ('C', 'Carpentry - Shingzo', false, 3), ('D', 'Sculpting - Jinzo', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D98';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What does PISA (the OECD study of 15-year-olds) stand for?', null, 'Programme for International Student Assessment.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D99', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Programme for International Student Assessment', true, 1), ('B', 'Percentage for International Student''s Assessment', false, 2), ('C', 'Problems for International Student''s Assessment', false, 3), ('D', 'Performance for International Student Assessment', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D99';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The author of the book ''To Live or Not to Live'' is', null, 'Nirad C. Chaudhuri.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, B.Ed. Paper III - Teacher Aptitude Test", "year": 2025, "url": "https://rcsc.gov.bt/bcse-past-question-papers/"}}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'D100', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Alexandre Dumas', false, 1), ('B', 'Nirad C. Chaudhuri', true, 2), ('C', 'George Eliot', false, 3), ('D', 'V S Naipaul', false, 4)) as v(label, body, ok, pos) where me_q.key = 'D100';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'If CAT is coded as DBU, how is DOG coded?', null, 'Each letter moves one place forward.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'AN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'EPH', true, 1), ('B', 'DPH', false, 2), ('C', 'EPG', false, 3), ('D', 'FPH', false, 4)) as v(label, body, ok, pos) where me_q.key = 'AN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Find the next number: 3, 6, 11, 18, 27, ?', null, 'Differences 3, 5, 7, 9, 11: 27 + 11 = 38.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'AN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '39', false, 1), ('B', '38', true, 2), ('C', '40', false, 3), ('D', '36', false, 4)) as v(label, body, ok, pos) where me_q.key = 'AN2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Pointing to a man, Sonam said, ''He is the son of my mother''s only brother.'' How is the man related to Sonam?', null, 'Mother''s brother is Sonam''s uncle; his son is Sonam''s cousin.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'AN3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Uncle', false, 1), ('B', 'Cousin', true, 2), ('C', 'Brother', false, 3), ('D', 'Nephew', false, 4)) as v(label, body, ok, pos) where me_q.key = 'AN3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Book : Library :: Painting : ?', null, 'Books are kept in a library; paintings in a gallery.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'logical-reasoning'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'AN4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Canvas', false, 1), ('B', 'Frame', false, 2), ('C', 'Gallery', true, 3), ('D', 'Artist', false, 4)) as v(label, body, ok, pos) where me_q.key = 'AN4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A class''s test scores are 45, 52, 60, 60 and 73. What is the median?', null, 'Middle value of the ordered list.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'BN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '73', false, 1), ('B', '52', false, 2), ('C', '58', false, 3), ('D', '60', true, 4)) as v(label, body, ok, pos) where me_q.key = 'BN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A class''s test scores are 45, 52, 60, 60 and 73. What is the mean?', null, '290/5 = 58.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'BN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '56', false, 1), ('B', '58', true, 2), ('C', '62', false, 3), ('D', '60', false, 4)) as v(label, body, ok, pos) where me_q.key = 'BN2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A school''s enrolment rose from 400 to 460. What is the percentage increase?', null, '60/400 = 15%.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'BN3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6%', false, 1), ('B', '12%', false, 2), ('C', '60%', false, 3), ('D', '15%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'BN3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In a pie chart, a category that is 25% of the data has a central angle of', null, '25% of 360 = 90.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'basic-data-interpretation'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'BN4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '45 degrees', false, 1), ('B', '100 degrees', false, 2), ('C', '90 degrees', true, 3), ('D', '25 degrees', false, 4)) as v(label, body, ok, pos) where me_q.key = 'BN4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In the revised Bloom''s taxonomy, the highest level is', null, 'Creating is at the top.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'DN1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Applying', false, 1), ('B', 'Analysing', false, 2), ('C', 'Creating', true, 3), ('D', 'Evaluating', false, 4)) as v(label, body, ok, pos) where me_q.key = 'DN1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', '''Assessment for learning'' is mainly', null, 'Ongoing feedback during learning.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'DN2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'placement testing', false, 1), ('B', 'summative assessment', false, 2), ('C', 'norm-referenced testing', false, 3), ('D', 'formative assessment', true, 4)) as v(label, body, ok, pos) where me_q.key = 'DN2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The Zone of Proximal Development was proposed by', null, 'Vygotsky.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'DN3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lev Vygotsky', true, 1), ('B', 'Jean Piaget', false, 2), ('C', 'B. F. Skinner', false, 3), ('D', 'Jerome Bruner', false, 4)) as v(label, body, ok, pos) where me_q.key = 'DN3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Operant conditioning is most associated with', null, 'Skinner.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'DN4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Albert Bandura', false, 1), ('B', 'B. F. Skinner', true, 2), ('C', 'Edward Thorndike', false, 3), ('D', 'Ivan Pavlov', false, 4)) as v(label, body, ok, pos) where me_q.key = 'DN4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'How many pillars does Gross National Happiness have?', null, 'Four pillars, nine domains, 33 indicators.', '[]'::jsonb, (select id from public.subjects where slug = 'teacher-aptitude'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'teacher-aptitude') and t.slug = 'general-awareness'), (select id from public.exam_papers where code = 'me-bed-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME B.Ed. Paper III (Teacher Aptitude): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, null)
  returning id
)
insert into me_q select 'DN5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '9', false, 1), ('B', '3', false, 2), ('C', '33', false, 3), ('D', '4', true, 4)) as v(label, body, ok, pos) where me_q.key = 'DN5';
commit;
