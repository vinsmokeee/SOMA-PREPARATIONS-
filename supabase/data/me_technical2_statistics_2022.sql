-- ME Paper II (Technical, Statistics): BCSE 2022, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'statistics-general-subject-knowledge', 'Statistics: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is TRUE about the Statistics?', null, 'Statistics is the science of collecting, organising, presenting, analysing and interpreting data to help make better decisions - all five stages.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is the science of collecting and organizing data to assist in making more effective decisions.', false, 1), ('B', 'It is the science of collecting, organizing and presenting data to assist in making more effective decisions.', false, 2), ('C', 'It is the science of collecting data to assist in making more effective decisions.', false, 3), ('D', 'It is the science of collecting, organizing, presenting, analysing and interpreting data to assist in making more effective decisions.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '240 adults and children attended a show organized by Film Association of Bhutan in Thimphu. The ratio of adults to children was 5 to 1. How many children attended the show?', null, 'Adults : children = 5 : 1, so children are 1/6 of 240 = 40.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '192', false, 1), ('B', '48', false, 2), ('C', '200', false, 3), ('D', '40', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Every month Sonam reads two new books and add them to her library. Which of the following types of functions best models the number of books in Sonam’s library as a function of time?', null, 'Two books are added every month - a constant amount per unit time - so the number grows as an increasing linear function.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increasing exponential', false, 1), ('B', 'Decreasing exponential', false, 2), ('C', 'Increasing linear', true, 3), ('D', 'Decreasing linear', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Maths test, the mean score is between 3 and 4. The large majority of scores are 3 and 4 with only a few scores of 0, 1, 2 and 5. In English test, the mean score is 2.5, and scores are evenly distributed across all possible scores, with many scores not close to the mean score. Which of the following is TRUE about the Maths and English test?', null, 'Maths scores cluster tightly around the mean (mostly 3 and 4), while English scores are spread evenly with many far from the mean, so Maths has the smaller SD.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The standard deviation of test scores in Maths is less than that of test scores in English.', true, 1), ('B', 'The standard deviation of test scores in Maths is equal to that of test scores in English.', false, 2), ('C', 'There is no enough information to compare the standard deviations.', false, 3), ('D', 'The standard deviation of test scores in Maths is greater than that of test scores in English.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A school offers a Dzongkhag course. This year, all students in the course were offered additional grammar lessons. The students who took additional grammar lessons did better in the course than students who didn’t take the additional grammar lessons. Based on these results, which of the following is the most appropriate conclusion?', null, 'This is an observational comparison - students chose whether to take the lessons - so other factors could explain the difference; no cause-and-effect conclusion can be made.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Taking additional grammar lessons will cause an improvement for any student who takes any foreign language course.', false, 1), ('B', 'No conclusion about cause and effect can be made regarding students who took the additional grammar lessons and their performance in the Dzongkhag course.', true, 2), ('C', 'Taking additional grammar lessons was the cause of the improvement for the students who took Dzongkhag course.', false, 3), ('D', 'Taking additional grammar lessons will cause an improvement for any student who takes dzongkhag course.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the process called if you are using information from a sample to make generalization about the larger population?', null, 'Using a sample to generalise about a larger population is statistical inference.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Statistical inference', true, 1), ('B', 'None of the above', false, 2), ('C', 'Statistical data', false, 3), ('D', 'Statistical information', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The average age of the students in the class is 22 years. Which of the following is TRUE about the statement?', null, 'The statement only summarises the class it describes - descriptive statistics.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The statement gives no detailed information.', false, 1), ('B', 'The statement describes descriptive statistics.', true, 2), ('C', 'The statement describes inferential statistics.', false, 3), ('D', 'The statement does not describe inferential nor descriptive statistics.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the mean, median and mode of the observations: 9,6,10,8,10,8,4,8,3,8?', null, 'Sum = 74, so mean = 7.4. Sorted: 3, 4, 6, 8, 8, 8, 8, 9, 10, 10 - median = (8 + 8)/2 = 8; 8 occurs most often, so mode = 8.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7.4, 8, 8', true, 1), ('B', '7.1, 8, 7', false, 2), ('C', '7, 8, 8', false, 3), ('D', '7.5, 8, 0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT TRUE about the descriptive statistical problem?', null, 'Making predictions about a larger set of data is inferential, not descriptive, statistics.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Information revealed in a data set is summarised.', false, 1), ('B', 'Data are displayed visually in graphs.', false, 2), ('C', 'Predictions are made about a larger set of data.', true, 3), ('D', 'Patterns in the data set are identified.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Wangmo secured 89 on her history exam and 81 on her maths exam. The mean score for history paper was 82 with a standard deviation of 5 while for maths the mean score was 76 with a standard deviation of 3. On which exam did she do better compare to the rest of the class?', null, 'Compare z-scores: history (89 − 82)/5 = 1.4; maths (81 − 76)/3 = 1.67. Her maths score is further above the class, so she did better in maths.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She did better on her history exam.', false, 1), ('B', 'None of the above', false, 2), ('C', 'Her scores for maths and history were same although the mean scores and standard deviations were different.', false, 3), ('D', 'She did better on her maths exam.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are taller than 65 inches?', null, 'The normal distribution is symmetric about the mean (65), so 50% are taller than 65 inches.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10%', false, 1), ('B', '20%', false, 2), ('C', '50%', true, 3), ('D', '25%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are between 62.5 inches and 67.5 inches?', null, '62.5 to 67.5 is the mean ± 1 SD, which covers about 68% (empirical rule).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '65%', false, 1), ('B', '68%', true, 2), ('C', '75%', false, 3), ('D', '50%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Assume that the heights of Statistics graduates of 2022 are normally distributed, with a mean of 65 inches and standard deviation of 2.5 inches. What percentage of Statistics graduates are between 60 inches and 70 inches?', null, '60 to 70 is the mean ± 2 SD, which covers about 95%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '50%', false, 1), ('B', '68%', false, 2), ('C', '95%', true, 3), ('D', '100% Questions 15, 16 and 17. Given the following z-scores on a standard normal distribution, find the percent of the total area under the standard normal curve.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Using the standard normal distribution, what percent of the total area under the standard normal curve is to the left of z = 1.45?', null, 'From the z-table, Φ(1.45) = 0.92647, i.e. about 92.65%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '68.65%', false, 1), ('B', '99.65%', false, 2), ('C', '92.65%', true, 3), ('D', '50.65%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Using the standard normal distribution, what percent of the total area under the standard normal curve is to the right of z = −0.13?', null, 'Area to the right of −0.13 = area to the left of +0.13 = 0.55172, i.e. 55.17%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '56.00%', false, 1), ('B', '55.17%', true, 2), ('C', '50.00%', false, 3), ('D', '45.00%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Using the standard normal distribution, what percent of the total area under the standard normal curve is between z = 1.37 and z = 2.98?', null, 'Φ(2.98) − Φ(1.37) = 0.99856 − 0.91466 = 0.0839, i.e. 8.39%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7.39%', false, 1), ('B', '8.39%', true, 2), ('C', '5.39%', false, 3), ('D', '8.49%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'There were 60 Dzongkha graduates, 56 Maths graduates, 40 Bio-science graduates and x Statistics graduates sitting for a free PE coaching class in Thimphu. The corresponding relative frequency for Dzongkha is 0.3, Maths 0.3, Bio-science 0.2 and Statistics 0.2. How many Statistics graduates were there in the PE coaching?', null, 'Dzongkha: 60 = 0.3 × N, so N = 200. x = 200 − (60 + 56 + 40) = 44 (≈ 0.2 × 200).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '48', false, 1), ('B', '52', false, 2), ('C', '44', true, 3), ('D', '22', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey was conducted in the civil service to determine how subordinates feel about the leadership quality of their supervisor. Subordinates rated the overall quality from 0 (no quality at all) to 100 (extremely good quality); the ratings are shown in the stem-and-leaf plot. What percentage of the subordinates rated their supervisor as very good leadership (ratings 80 and above)?', null, 'The plot has 25 ratings (2 + 8 + 7 + 5 + 2 + 0 + 1); only 96 is 80 or above: 1/25 = 4%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-stemleaf.png')
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '24%', false, 1), ('B', '6%', false, 2), ('C', '1 %', false, 3), ('D', '4%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a measure of central tendency?', null, 'Range is a measure of dispersion (spread), not of central tendency.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Median', false, 1), ('B', 'Range', true, 2), ('C', 'Mean', false, 3), ('D', 'Mode', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The summary statistics of high school dropout rates: 1998 - N = 51, mean = 28.15, median = 27.43; 2002 - N = 51, mean = 26.75, median = 25.65. Which of the following statements is TRUE about the shape of the distributions of the dropout rates in 1998 and 2002?', null, 'In both years the mean is greater than the median (28.15 > 27.43; 26.75 > 25.65), which indicates right (positive) skew.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'The 1998 high school dropout rate has distribution skewed to the left and the 2002 has distribution skewed to the right.', false, 2), ('C', 'The 1998 high school dropout rate has distribution skewed to the right and the 2002 has distribution skewed to the left.', false, 3), ('D', 'Both the 1998 and 2002 high school dropout rates have distributions that are skewed to the right.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements is TRUE about the mean and median?', null, 'Mean and median need numerical values, so they are useful only for quantitative data; qualitative data use the mode.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The mean and median are not useful measures of central tendency for both qualitative and quantitative data.', false, 1), ('B', 'The mean and median are useful measures of central tendency for only quantitative data.', true, 2), ('C', 'The mean and median are useful measures of central tendency for only qualitative data.', false, 3), ('D', 'The mean and median are useful measures of central tendency for both qualitative and quantitative data.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The following are the standardized test scores of 5 students in a class with a mean score of 500 points and a standard deviation of 100 points: Nima 575, Dawa 690, Karma 750, Sonam 280, Wangmo 440. Which of the students have scores within 2 standard deviations of the mean?', null, 'Within 2 SD means 300 to 700: Nima 575, Dawa 690 and Wangmo 440. Karma (750) and Sonam (280) are outside.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Karma, Sonam', false, 1), ('B', 'Nima, Dawa, Karma, Wangmo', false, 2), ('C', 'Nima, Dawa', false, 3), ('D', 'Nima, Dawa, Wangmo', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the range of the observations?', null, 'Range = largest − smallest = 21 − 0 = 21.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21', true, 1), ('B', '9', false, 2), ('C', '7', false, 3), ('D', '6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the interquartile range of the observations?', null, 'Sorted: 0, 2, 2, 5, 6, 7, 9, 21. Q1 = median of 0, 2, 2, 5 = 2; Q3 = median of 6, 7, 9, 21 = 8. IQR = 8 − 2 = 6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21', false, 1), ('B', '9', false, 2), ('C', '6', true, 3), ('D', '7', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the observations: 21, 9, 7, 6, 5, 2, 2, 0. What is the standard deviation of the observations? Consider these observations as a population.', null, 'Mean = 52/8 = 6.5. Σ(x − 6.5)² = 302; population variance = 302/8 = 37.75; SD = √37.75 = 6.14.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6.50', false, 1), ('B', '6.54', false, 2), ('C', '6.14', true, 3), ('D', '5.69', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Summary statistics of 1,000 randomly sampled taxis in Thimphu, with the total number of passengers carried in 2021: Min 4,005; Q1 5,605; Average 7,005; Q3 8,605; Max 10,605; Std. dev. 1,400. What is the percentage of taxis in Thimphu with a total number of passengers between 5,605 and 8,605?', null, '5,605 is Q1 and 8,605 is Q3, and the middle 50% of the data lies between the quartiles.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100%', false, 1), ('B', '50%', true, 2), ('C', '75%', false, 3), ('D', '25%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The weights of pregnant women were measured in kg. The mean weight was obtained with 83 kg and the standard deviation was 5 kg. Which of the following weights would be classified as an outlier?', null, '99 kg is (99 − 83)/5 = 3.2 SD above the mean - beyond 3 SD, so it is an outlier. The others are within 2 SD (73 kg is exactly −2 SD).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '99 kg', true, 1), ('B', '91 kg', false, 2), ('C', '78 kg', false, 3), ('D', '73 kg', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements is TRUE about the presence of outlier in the data?', null, 'An outlier can be a genuine rare value, come from a different population, or be an error in measuring or recording - all are possible explanations.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The measurement belongs to a population different from that from which the rest of the same was drawn.', false, 1), ('B', 'All of the above are explanations for outliers', true, 2), ('C', 'The measurement is incorrect. It may have been observed, recorded, or entered incorrectly.', false, 3), ('D', 'The measurement may be correct and from the same population as the rest but represent a rare event.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The weights of pregnant women were measured in kg. The lower quartile of the weights was recorded at 88 kg. Which of the following statements is TRUE?', null, 'The lower quartile (Q1) has 25% of values below it, so 75% of the weights were greater than 88 kg.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M31' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '75% of the pregnant women’s weights were greater than 88 kg.', true, 1), ('B', '88% of the pregnant women’s mean weight was 88 kg.', false, 2), ('C', '75% of the pregnant women’s weights were less than 88 kg.', false, 3), ('D', '25% of the pregnant women’s weights were 88 kg.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A, B, C and D are sample points and the only possible outcomes of an experiment. P(A) = 1/8, P(B) = 1/8 and P(C) = 1/8. What is the probability of the sample point D?', null, 'Probabilities of all sample points sum to 1: P(D) = 1 − 3/8 = 5/8.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M32' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5/8', true, 1), ('B', '1/8', false, 2), ('C', '1/4', false, 3), ('D', '3/8', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An experiment was conducted: two dice were rolled and the resulting values were summed. Which of the following is NOT a sample point for this experiment?', null, 'The sum of two dice ranges from 2 to 12, so 1 cannot occur.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M33', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M33' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6', false, 1), ('B', '2', false, 2), ('C', '7', false, 3), ('D', '1', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):
Gold, Gold, Silver, Gold, Bronze, Silver, Silver,
Bronze, Gold, Silver, Silver, Bronze, Silver, Gold,
Gold, Silver, Silver, Bronze, Bronze, Gold, Silver,
Gold, Gold, Bronze, Bronze
What is the sample space for the above championship?', null, 'The distinct possible outcomes are Gold, Silver and Bronze: S = {Gold, Silver, Bronze}.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M34' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '{Gold, Silver, Silver, Bronze}', false, 1), ('B', '{Gold, Gold, Silver, Bronze}', false, 2), ('C', '{Gold, Silver, Bronze}', true, 3), ('D', '{Gold, Silver, Bronze, Bronze}', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):
Gold, Gold, Silver, Gold, Bronze, Silver, Silver,
Bronze, Gold, Silver, Silver, Bronze, Silver, Gold,
Gold, Silver, Silver, Bronze, Bronze, Gold, Silver,
Gold, Gold, Bronze, Bronze
What is the probability of offering the gold medal to the winning participants of the national open championship by BoC?', null, 'The table has 25 entries: 9 Gold, 9 Silver and 7 Bronze. P(Gold) = 9/25 = 0.36.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M35' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.33', false, 1), ('B', '0.50', false, 2), ('C', '0.25', false, 3), ('D', '0.36', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Use the following table. It shows the types of medals offered to winning participants of the national open championship by the Bhutan Olympic Committee (BoC):
Gold, Gold, Silver, Gold, Bronze, Silver, Silver,
Bronze, Gold, Silver, Silver, Bronze, Silver, Gold,
Gold, Silver, Silver, Bronze, Bronze, Gold, Silver,
Gold, Gold, Bronze, Bronze
What is the probability of offering the gold or silver medal to the winning participants of the national open championship by BoC?', null, 'P(Gold or Silver) = (9 + 9)/25 = 18/25 = 0.72.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M36' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.66', false, 1), ('B', '0.75', false, 2), ('C', '0.72', true, 3), ('D', '0.50', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'There are two bags containing sweets. Bag A contains 72 sweets with an estimated total mass of 852.4g while bag B contains 24 sweets with an estimated total mass of 282.8g. Using the information provided, what would be the mean mass of the sweets altogether?', null, 'Total mass ÷ total number = (852.4 + 282.8)/(72 + 24) = 1,135.2/96 = 11.825 g.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M37' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '11.825 g', true, 1), ('B', '11.783 g', false, 2), ('C', '11.839 g', false, 3), ('D', '15.767 g', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years'' time will be 351 years. What is the mean age of the 10 boys today?', null, 'Each boy is 5 years older now: 127 + 10 × 5 = 177, so the mean age = 177/10 = 17.7 years.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M38' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7.7 years', false, 1), ('B', '27.7 years', false, 2), ('C', '10.7 years', false, 3), ('D', '17.7 years', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years'' time will be 351 years. What is the mean age of the 15 girls today?', null, 'Each girl is 5 years younger now than in 5 years: 351 − 15 × 5 = 276, so the mean age = 276/15 = 18.4 years.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M39' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '28.4 years', false, 1), ('B', '10.4 years', false, 2), ('C', '11.4 years', false, 3), ('D', '18.4 years', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey of graduates in one of the universities in Bhutan revealed that the sum of the ages of 10 boys was 127 years 5 years ago, while the sum of the ages of 15 girls in 5 years'' time will be 351 years. What is the mean age of the 10 boys and 15 girls combined?', null, 'Combined mean = (177 + 276)/25 = 453/25 = 18.12 years.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M40' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '18.12 years', true, 1), ('B', '28.40 years', false, 2), ('C', '18.40 years', false, 3), ('D', '17.70 years', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother''s invitations to lunch. What is the probability that Dorji invites his sister Pema to lunch?', null, '70% of invitations are to the cinema, so 30% (0.30) are to lunch.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M42' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.30', true, 1), ('B', '0.70', false, 2), ('C', '0.20', false, 3), ('D', '0.50', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother''s invitations to lunch. What is the probability that Dorji invites Pema to lunch and she rejects the invitation?', null, 'P(lunch and rejected) = 0.30 × 0.40 = 0.12.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M43' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.15', false, 1), ('B', '0.14', false, 2), ('C', '0.12', true, 3), ('D', '0.13', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Every Saturday, Dorji invites his sister Pema to the cinema or to lunch. 70% of his invitations are to the cinema and 90% of these are accepted. Pema rejects 40% of her brother''s invitations to lunch. What is the probability that Dorji invites Pema to the cinema and she rejects the invitation?', null, 'P(cinema and rejected) = 0.70 × (1 − 0.90) = 0.70 × 0.10 = 0.07.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M44' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.05', false, 1), ('B', '0.07', true, 2), ('C', '0.02', false, 3), ('D', '0.04', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the expectation of the distribution?', null, 'E(X) = Σx·p = (0 × 1 + 5 × 3 + 15 × 5 + 20 × 3)/12 = 150/12 = 12.5.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M45' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '14.5', false, 1), ('B', '11.5', false, 2), ('C', '12.5', true, 3), ('D', '13.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the variance of the distribution?', null, 'E(X²) = (0 + 25 × 3 + 225 × 5 + 400 × 3)/12 = 2,400/12 = 200. Var = 200 − 12.5² = 200 − 156.25 = 43.75.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M46' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '42.75', false, 1), ('B', '44.75', false, 2), ('C', '41.75', false, 3), ('D', '43.75', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The probability distribution of X is: x = 0, 5, 15, 20 with P(X = x) = 1/12, 3/12, 5/12, 3/12. What is the standard deviation of the distribution?', null, 'SD = √43.75 = 6.61.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M47' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6.69', false, 1), ('B', '6.46', false, 2), ('C', '6.61', true, 3), ('D', '6.54', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The weight of newborn babies recorded by JDWNRH, Thimphu was found to be normally distributed with mean 3.35 kg and variance 0.085 kg². About how many of the 1,356 babies born last year had a weight of less than 3.5 kg?', null, 'SD = √0.085 = 0.2915; z = (3.5 − 3.35)/0.2915 = 0.51; Φ(0.51) ≈ 0.695; 0.695 × 1,356 ≈ 943 babies.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M48' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '943 newborn babies', true, 1), ('B', '743 newborn babies', false, 2), ('C', '643 newborn babies', false, 3), ('D', '843 newborn babies', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Given that X ~ N(11, 25), what is P(X < 18)?', null, 'σ = √25 = 5; z = (18 − 11)/5 = 1.4; P(Z < 1.4) = 0.919.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M49' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.919', true, 1), ('B', '0.819', false, 2), ('C', '0.619', false, 3), ('D', '0.719', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Given that X ~ N(20, 7), where 7 is the variance, what is P(X ≤ 16.6)?', null, 'σ = √7 = 2.646; z = (16.6 − 20)/2.646 = −1.29; P(Z ≤ −1.29) ≈ 0.0994.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M50' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.0884', false, 1), ('B', '0.0664', false, 2), ('C', '0.0774', false, 3), ('D', '0.0994', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). Which of the following statements about the median ages is TRUE?', null, 'Male ages: 20, 25, 30, 35, 40, 45, 50, 55, 60 - median 40. Female ages: 15, 15, 20, 25, 25, 30, 30, 35, 40 - median 25. The male median is greater.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-stemplot.png')
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M51' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The median age of male is greater than that of female', true, 1), ('B', 'The median age of male is 25 years while that of female is 40 years', false, 2), ('C', 'The median age of male is less than that of female', false, 3), ('D', 'The median age of male is almost equal to that of female', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). What is the range of ages for male and female?', null, 'Male range = 60 − 20 = 40 years; female range = 40 − 15 = 25 years.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-stemplot.png')
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M52' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Male=40 years; Female=25 years', true, 1), ('B', 'Male=40 years; Female=26 years', false, 2), ('C', 'Male=40 years; Female=28 years', false, 3), ('D', 'Male=40 years; Female=27 years', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The back-to-back stem plot shows the recorded ages of students by gender in a school (stem = tens, leaf = units). Which of the following statements about the mean and median ages is TRUE?', null, 'Male mean = 360/9 = 40 = male median 40. Female mean = 235/9 ≈ 26.1, which differs from both medians.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-stemplot.png')
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M53' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The mean age of male is equal to the median age of female.', false, 1), ('B', 'The mean age of male is equal to the median age of male.', true, 2), ('C', 'The mean age of female is equal to the median age of male.', false, 3), ('D', 'The mean age of female is equal to the median age of female.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A regression of milk output on the number of milking cows gave: Intercept - estimate 3.415, t = 4.932, p = 0.0004, SE 0.613; No. of milking cows - estimate 0.36, t = 0.84, p = 0.041, SE 0.028. Which of the following is the best-fit regression line?', null, 'The fitted line uses the estimates: intercept 3.415 and slope 0.36, so y = 3.415 + 0.36x. (t values and SEs are not coefficients.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M54' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'y = 4.932 + 0.84x', false, 1), ('B', 'y = 0.36 + 3.415x', false, 2), ('C', 'y = 3.415 + 0.36x', true, 3), ('D', 'y = 3.415 + 3.6x', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose a simple random sample of size 50 is selected from a population. Which of the following is TRUE about the sample?', null, 'In simple random sampling every possible set of 50 subjects has the same chance of being the sample (so every individual also has an equal chance).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M55', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M55' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Some members of the population have no chance of being selected, but those that can be selected have the same change of being selected.', false, 1), ('B', 'It is not drawn in such a way that every subject has the same chance of being selected.', false, 2), ('C', 'It is selected so that every set of 50 subjects in the population has an equal chance of being the sample chosen.', true, 3), ('D', 'None of the members have equal chance of being selected.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An accountant in the National Statistics Bureau investigated the association between GDP (million Nu.) and the population (million) of the country for 2009-2017, with the regression output shown. What is the equation of the regression line (x = population)?', null, 'The coefficients are −694,532.7 (constant) and 1,110,086 (population): ŷ = −694,533 + 1,110,086x.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-regression.png')
  returning id
)
insert into me_q select 'M57', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M57' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ŷ = −694,533 + 1,110,086x', true, 1), ('B', 'ŷ = 228,729 + 315,562x', false, 2), ('C', 'ŷ = −3.04 + 3.52x', false, 3), ('D', 'ŷ = −694,533 + 228,729x', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An accountant in the National Statistics Bureau investigated the association between GDP (million Nu.) and the population (million) of the country for 2009-2017, with the regression output shown. Using the fitted line, what will be the value of GDP when the population is close to 1 million in 2025?', null, 'ŷ = −694,532.7 + 1,110,086 × 1 = 415,553.3 million Nu.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, '/papers/me/tech2-stat-2022-regression.png')
  returning id
)
insert into me_q select 'M58', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M58' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '415,553.30 million', true, 1), ('B', '0.48 million', false, 2), ('C', '465,804.00 million', false, 3), ('D', '544,290.80 million', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is TRUE about the Central Limit Theorem for a sample of size n?', null, 'E(X̄) = μ (true for any n). The SD of X̄ is σ/√n, smaller than σ, and X̄ is only approximately normal for large n unless the population is normal.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M59', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M59' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The standard deviation of the sample mean is greater than the population standard deviation.', false, 1), ('B', 'The expectation of the sample mean is equal to the population mean μ when n is large.', true, 2), ('C', 'The standard deviation of the sample mean is equal to the population standard deviation σ.', false, 3), ('D', 'The sampling distribution of the sample mean is always normal for any sample size n.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 95% confidence interval for the difference (treatment – control) in the mean activity levels were 2.5 and 4.7. Which of the following is TRUE about this interval?', null, 'A confidence interval is about the population parameter: we are 95% confident the true mean difference lies between 2.5 and 4.7.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M60', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M60' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'We are 5% confident that the increase in the mean decrease lies between 2.5 and 4.7', false, 1), ('B', 'We are 95% confident that the average decrease in activity level in the sample is 3.6 hours.', false, 2), ('C', 'The activity level of 95% decreased between 2.5 and 4.7', false, 3), ('D', 'We are 95% confident that the increase in the mean decrease lies between 2.5 and 4.7', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M60';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 95% confidence interval for the difference (treatment – control) in the mean activity levels were 2.5 and 4.7. What will happen to the confidence interval if a 90% confidence interval is applied instead?', null, 'A lower confidence level needs a smaller critical value, so the interval is narrower but has a larger risk (10%) of missing the true value.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M61', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M61' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Confidence interval would be narrower and involve a smaller risk of being incorrect.', false, 1), ('B', 'Confidence interval would be narrower and involve a larger risk of being incorrect.', true, 2), ('C', 'Confidence interval would be wider and involve a smaller risk of being incorrect.', false, 3), ('D', 'Confidence interval would be wider and involve a larger risk of being incorrect.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the case of income distribution study, central tendency measure such as that of median is used instead of others. Which of the following statements is TRUE?', null, 'Income distributions are usually right-skewed by a few very high incomes, so the median represents a typical income better than the mean.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M62', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M62' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The income distributions are generally symmetrical.', false, 1), ('B', 'The income distributions generally have unequal class intervals.', false, 2), ('C', 'The income distributions are generally bimodal.', false, 3), ('D', 'Income distributions are generally skewed.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M62';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best describes the data?', null, 'In a left (negatively) skewed distribution the long left tail pulls the mean below the median. In a symmetric distribution mean = median. (The paper printed option c twice; option d is shown as ''less than''.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M63', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M63' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'For the case of right skewed distribution data, mean is less than median.', false, 1), ('B', 'For the case of left skewed distribution data, mean is less than median.', true, 2), ('C', 'For the case of symmetric distribution data, mean is greater than median.', false, 3), ('D', 'For the case of symmetric distribution data, mean is less than median.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The correlation coefficient between the variables x and y is -0.94. Which of the following statements is TRUE?', null, 'r = −0.94 is a strong negative association: low x goes with high y. Correlation does not show causation.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M64', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M64' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'x causes y', false, 1), ('B', 'low scores on x are associated with low scores on y', false, 2), ('C', 'y causes x', false, 3), ('D', 'low scores on x are associated with high scores on y', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The average height of men is 71 inches with a standard deviation of 4 inches, while the average height of women is 66 inches with a standard deviation of 3 inches. What will be the mean and standard deviation for the difference in heights if we look at pairing up one man with one woman?', null, 'Mean difference = 71 − 66 = 5 inches. For independent pairs, Var = 4² + 3² = 25, so SD = 5 inches.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M65', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M65' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mean of 5 inches with a standard deviation of 1 inch', false, 1), ('B', 'Mean of 5 inches with a standard deviation of 5 inch', true, 2), ('C', 'Mean of 5 inches with a standard deviation of 3.5 inch', false, 3), ('D', 'Mean of 68.5 inches with a standard deviation of 1 inch', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The table shows the probability distribution of two characteristics: age and traffic violations in the last 12 months.
Age | None | One | Two+
Under 18 | 0.23 | 0.12 | 0.05
18 or older | 0.45 | 0.14 | 0.01
What is the probability that a randomly selected person had no traffic violations in the last 12 months, given that he/she is 18 or older?', null, 'P(none | 18+) = 0.45/(0.45 + 0.14 + 0.01) = 0.45/0.60 = 0.75.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M67', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M67' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.60', false, 1), ('B', '0.75', true, 2), ('C', '0.45', false, 3), ('D', '0.65', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M67';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The table shows the probability distribution of two characteristics: age and traffic violations in the last 12 months.
Age | None | One | Two+
Under 18 | 0.23 | 0.12 | 0.05
18 or older | 0.45 | 0.14 | 0.01
What is the probability of being under 18 or having one violation?', null, 'P(under 18 or one) = P(under 18) + P(one) − P(both) = 0.40 + 0.26 − 0.12 = 0.54.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M68', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M68' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.66', false, 1), ('B', '0.12', false, 2), ('C', '0.26', false, 3), ('D', '0.54', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M68';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A distribution which is skewed to the right has mean 19 and mode 16. What would be value of median?', null, 'Empirical relation: mean − mode = 3(mean − median): 19 − 16 = 3(19 − median), so median = 18.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M69', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M69' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '14', false, 1), ('B', '20', false, 2), ('C', '25', false, 3), ('D', '18', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following measures will be useful in deciding if a group of individuals varies more with respect to height or varies more with respect to weight?', null, 'Height and weight have different units, so compare relative spread with the coefficient of variation (SD/mean × 100).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'M70', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M70' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inter-quartile range', false, 1), ('B', 'Correlation coefficient', false, 2), ('C', 'Coefficient of variation', true, 3), ('D', 'Standard deviation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M70';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

Is this a sample or a population? Give a reason. (5 marks)', 'It is a sample. The data are the monthly prices of a random sample of 12 two-bedded houses, not of every 2-bedded house in Thimphu (which would be the population). Measures calculated from these data (mean, SD, etc.) are therefore sample statistics, used to estimate the corresponding population parameters for all 2-bedded houses in Thimphu.', null, '[{"point": "It is a sample", "marks": 2}, {"point": "Reason: only 12 randomly selected 2-bedded houses are included, not all 2-bedded houses in Thimphu", "marks": 2}, {"point": "So any mean or SD computed is a statistic used to estimate the population parameter", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The paper''s introduction says the prices are ''in hundreds'' while its questions ask for answers ''in thousands''; the stem uses thousands, as the questions do."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

What is the range of the monthly prices for 2-bedded houses (in thousands) in Thimphu? (5 marks)', 'Highest price = 9 thousand; lowest price = 5 thousand.
Range = maximum − minimum = 9 − 5 = 4.
The range of monthly prices is 4 thousand, i.e. Nu. 4,000.', null, '[{"point": "Highest value = 9 and lowest value = 5", "marks": 2}, {"point": "Range = highest − lowest = 9 − 5 = 4", "marks": 2}, {"point": "Range = 4 thousand, i.e. Nu. 4,000", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The paper''s introduction says the prices are ''in hundreds'' while its questions ask for answers ''in thousands''; the stem uses thousands, as the questions do."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

What is the mean monthly price for 2-bedded houses (in thousands) in Thimphu? (5 marks)', 'x̄ = Σx/n.
Σx = 7 + 9 + 6 + 6 + 8 + 8 + 8 + 8 + 6 + 9 + 7 + 5 = 87; n = 12.
x̄ = 87/12 = 7.25.
The mean monthly price is 7.25 thousand, i.e. Nu. 7,250.', null, '[{"point": "Formula x̄ = Σx/n", "marks": 1}, {"point": "Σx = 87 and n = 12", "marks": 2}, {"point": "x̄ = 87/12 = 7.25 thousand, i.e. Nu. 7,250", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The paper''s introduction says the prices are ''in hundreds'' while its questions ask for answers ''in thousands''; the stem uses thousands, as the questions do."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

What can you say about the median monthly price for 2-bedded houses (in thousands) in Thimphu? (5 marks)', 'Ordered data: 5, 6, 6, 6, 7, 7, 8, 8, 8, 8, 9, 9 (n = 12).
Since n is even, the median is the average of the 6th and 7th values = (7 + 8)/2 = 7.5.
The median monthly price is 7.5 thousand (Nu. 7,500): half of the sampled houses rent for Nu. 7,500 or less and half for more. The median is a little higher than the mean (7.25), so the data are slightly skewed to the left (a few cheaper houses pull the mean down).', null, '[{"point": "Data arranged in order: 5, 6, 6, 6, 7, 7, 8, 8, 8, 8, 9, 9", "marks": 1.5}, {"point": "n = 12 is even, so the median is the mean of the 6th and 7th values: (7 + 8)/2 = 7.5", "marks": 2}, {"point": "Interpretation: half the houses cost Nu. 7,500 or less and half cost more; the median (7.5) is slightly above the mean (7.25), suggesting a slight left skew", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The paper''s introduction says the prices are ''in hundreds'' while its questions ask for answers ''in thousands''; the stem uses thousands, as the questions do."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

Calculate the sample standard deviation using the given monthly prices of 2-bedded houses (in thousands) in Thimphu. (5 marks)', 'Sample SD: s = √[Σ(x − x̄)²/(n − 1)], x̄ = 7.25, n = 12.
Deviations squared: 5 → 5.0625; 6 (three times) → 3 × 1.5625 = 4.6875; 7 (twice) → 2 × 0.0625 = 0.125; 8 (four times) → 4 × 0.5625 = 2.25; 9 (twice) → 2 × 3.0625 = 6.125.
Σ(x − x̄)² = 5.0625 + 4.6875 + 0.125 + 2.25 + 6.125 = 18.25.
(Check: Σx² = 649 and (Σx)²/n = 87²/12 = 630.75; 649 − 630.75 = 18.25.)
s² = 18.25/11 = 1.659; s = √1.659 = 1.288.
The sample standard deviation is about 1.29 thousand, i.e. about Nu. 1,288.', null, '[{"point": "Formula s = √[Σ(x − x̄)²/(n − 1)] with x̄ = 7.25", "marks": 1}, {"point": "Σ(x − x̄)² = 18.25 (or Σx² − (Σx)²/n = 649 − 630.75)", "marks": 2}, {"point": "s² = 18.25/11 = 1.659", "marks": 1}, {"point": "s = √1.659 ≈ 1.29 thousand (about Nu. 1,288)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The paper''s introduction says the prices are ''in hundreds'' while its questions ask for answers ''in thousands''; the stem uses thousands, as the questions do."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Statistics", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The mean of 5 observations is 12. Four of them are 10, 14, 9 and 15. The fifth observation is', null, 'Total = 5 × 12 = 60; the four known values sum to 48, so the fifth is 60 − 48 = 12.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '11', false, 1), ('B', '12', true, 2), ('C', '14', false, 3), ('D', '10', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For two events, P(A) = 0.6, P(B) = 0.5 and P(A ∩ B) = 0.3. What is P(A | B)?', null, 'P(A | B) = P(A ∩ B)/P(B) = 0.3/0.5 = 0.6 (here A and B happen to be independent).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.6', true, 1), ('B', '0.18', false, 2), ('C', '0.3', false, 3), ('D', '0.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If every value in a data set is multiplied by 3, the standard deviation is', null, 'Multiplying every value by a constant multiplies the SD by that constant (and the variance by its square, 9).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increased by 3', false, 1), ('B', 'Multiplied by 3', true, 2), ('C', 'Multiplied by 9', false, 3), ('D', 'Unchanged', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The number of degrees of freedom for a chi-square test of independence on a 3 × 4 contingency table is', null, 'df = (rows − 1)(columns − 1) = (3 − 1)(4 − 1) = 6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7', false, 1), ('B', '5', false, 2), ('C', '6', true, 3), ('D', '12', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The mean of a continuous uniform distribution on the interval [2, 10] is', null, 'For a uniform distribution on [a, b], the mean = (a + b)/2 = (2 + 10)/2 = 6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6', true, 1), ('B', '4', false, 2), ('C', '8', false, 3), ('D', '5.33', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following are the monthly prices (in thousands of Ngultrum) of a random sample of 2-bedded houses in Thimphu:
7, 9, 6, 6, 8, 8, 8, 8, 6, 9, 7, 5

Find the mode and the interquartile range of the monthly prices, and comment on the shape of the distribution using the mean (7.25) and median (7.5). (5 marks)', 'Ordered data: 5, 6, 6, 6, 7, 7 | 8, 8, 8, 8, 9, 9.
Mode = 8 (it occurs most often - four times).
Q1 = median of the lower half (5, 6, 6, 6, 7, 7) = (6 + 6)/2 = 6; Q3 = median of the upper half (8, 8, 8, 8, 9, 9) = (8 + 8)/2 = 8.
IQR = 8 − 6 = 2 thousand (Nu. 2,000): the middle half of the houses rent within a Nu. 2,000 band.
Shape: mean (7.25) < median (7.5) < mode (8), so the distribution is slightly negatively (left) skewed - a few cheaper houses (such as the one at 5) pull the mean down.', null, '[{"point": "Mode = 8 (occurs four times)", "marks": 1}, {"point": "Q1 = 6 and Q3 = 8 (medians of the lower and upper halves)", "marks": 2}, {"point": "IQR = Q3 − Q1 = 2 thousand (Nu. 2,000)", "marks": 1}, {"point": "Mean (7.25) < median (7.5) < mode (8): the distribution is slightly negatively (left) skewed", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'statistics-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Statistics): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'statistics'), null, null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S6';
commit;
