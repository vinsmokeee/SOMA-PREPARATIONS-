-- ME Paper III (Technical, Statistics): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'statistics', 'Statistics' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'statistics') is null then raise exception 'unknown specialisation statistics'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'statistics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'statistics'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Statistics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'statistics'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Statistics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'statistics'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Statistics');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If X1, X2, ..., Xn are independent and identically distributed (iid) normal(µ, σ), then the sample mean X̄ is distributed as', null, 'The mean of n iid N(µ, σ) variables is N(µ, σ/√n) (standard deviation σ/√n).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'X̄ ~ normal(µ, σ²)', false, 1), ('B', 'X̄ ~ normal(µ, σ/n)', false, 2), ('C', 'X̄ ~ normal(µ, σ/√n)', true, 3), ('D', 'X̄ ~ normal(µ, σ)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A company’s monthly profits (in Ngultrums millions) over six months are: 20, 25, 30, 35, 40, 150. Which statement is TRUE?', null, 'The outlier 150 pulls the mean (50) above the median (32.5).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The mean is greater than the median.', true, 1), ('B', 'The mode is the best measure.', false, 2), ('C', 'The median is greater than the mean.', false, 3), ('D', 'The range is not affected by outliers.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey shows 70% of people like tea, 40% like coffee, and 20% like both. What is the probability someone likes neither?', null, 'P(neither) = 1 - (0.7 + 0.4 - 0.2) = 0.1.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0%', false, 1), ('B', '30%', false, 2), ('C', '10%', true, 3), ('D', '50%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A sample statistic is used to estimate', null, 'A sample statistic estimates a population parameter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'population parameter.', true, 1), ('B', 'sample statistic.', false, 2), ('C', 'sampling error.', false, 3), ('D', 'population statistic.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A customer service team has a 70% success rate in resolving complaints. If they handle 10 cases today, how many are expected to be resolved successfully?', null, 'Expected value = np = 10 x 0.7 = 7.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7', true, 1), ('B', '5', false, 2), ('C', '10', false, 3), ('D', '3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the key difference between Bayesian and Frequentist approaches to unknown parameters?', null, 'Bayesians treat parameters as random with a prior; frequentists treat them as fixed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Bayesian approach treats the parameter as a fixed value, while the Frequentist treats it as a random variable.', false, 1), ('B', 'The Frequentist approach requires prior beliefs, while the Bayesian approach relies only on the observed data.', false, 2), ('C', 'The Frequentist approach updates the parameter as new data becomes available, while the Bayesian approach does not.', false, 3), ('D', 'The Bayesian approach treats the parameter as a random variable with a probability distribution, while the Frequentist treats it as a fixed but unknown constant.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A researcher computes the interquartile range (IQR) to study variability. What does the IQR represent?', null, 'IQR = Q3 - Q1 (75th minus 25th percentile).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The difference between the 75th percentile and the 25th percentile values.', true, 1), ('B', 'The total spread of the data excluding the top and bottom 25% values.', false, 2), ('C', 'The average deviation of all values from the median.', false, 3), ('D', 'The range covering the middle 50% of the observations including extreme values.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT an assumption of the classical linear regression model?', null, 'Multicollinearity is a problem, not an assumption (the assumption is no perfect multicollinearity).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'No autocorrelation', false, 1), ('B', 'Multicollinearity', true, 2), ('C', 'Linearity', false, 3), ('D', 'Homoscedasticity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose a multiple linear regression model shows an R-squared = 0.92 and Adjusted R-squared = 0.45. What is the best interpretation?', null, 'A big gap between R² and adjusted R² suggests too many predictors (overfitting).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Model is perfect.', false, 1), ('B', 'Overfitting due to too many predictors.', true, 2), ('C', 'Residuals are normally distributed.', false, 3), ('D', 'Predictors are uncorrelated.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a constant is multiplied to every value in a dataset, how does the standard deviation change?', null, 'SD is multiplied by the (absolute value of the) constant.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It stays the same.', false, 1), ('B', 'It increases by the square of the constant.', false, 2), ('C', 'It becomes zero.', false, 3), ('D', 'It increases by the same constant.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The distribution of wealth in a country is highly right-skewed. Which combination best describes it?', null, 'Right skew: mean > median > mode.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mean < Median < Mode', false, 1), ('B', 'Mode > Mean > Median', false, 2), ('C', 'Mean > Median > Mode', true, 3), ('D', 'Median = Mode < Mean', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose consumer price index rose from 130 to 143 in a year. What is the approximate annual inflation rate?', null, '(143 - 130)/130 = 10%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7%', false, 1), ('B', '8%', false, 2), ('C', '9%', false, 3), ('D', '10%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a company, 70% of employees know Excel, 40% know Python, and 30% know both. What is the probability that a randomly chosen employee knows Python given that they know Excel?', null, 'P(Python | Excel) = 0.30/0.70 = 0.43.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.40', false, 1), ('B', '0.43', true, 2), ('C', '0.70', false, 3), ('D', '0.30', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey reports a 95% confidence interval for a proportion as [0.45, 0.55]. What is the approximate standard error?', null, 'Half-width 0.05 = 1.96 x SE, so SE ≈ 0.025.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.05', false, 1), ('B', '0.10', false, 2), ('C', '0.025', true, 3), ('D', '0.50 House rent varies considerably across regions and housing characteristics. A study is carried out to understand how house rent (in Ngultrum) is influenced by two key factors:', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does the intercept term of approximately 3007 Ngultrum represent in this model?', null, 'The intercept is predicted rent for rural (reference) houses with zero rooms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Starting value for urban houses.', false, 1), ('B', 'Average rent for all areas combined.', false, 2), ('C', 'Predicted rent in rural areas when number of rooms is zero.', true, 3), ('D', 'Average rent in semi-urban areas with 1 room.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If we increase the number of rooms by 3 in a house located in an urban area, what is the expected change in predicted rent compared to a rural house with the same original number of rooms?', null, '3 x 1012.8 + 3971.4 = 7009.8.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10,017.0', false, 1), ('B', '7,009.8', true, 2), ('C', '3971.4', false, 3), ('D', '933.0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the average number of rooms in semi-urban areas is 4.5, what is the expected mean house rent in semi-urban areas?', null, '3007.2 + 1012.8 x 4.5 + 1968.6 ≈ 9533.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10,150 Ngultrums', false, 1), ('B', '8,450 Ngultrumss', false, 2), ('C', '9,533 Ngultrums', true, 3), ('D', '12,000 Ngultrums', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the regression model output, what is the estimated difference in average house rent between urban and rural areas, holding the number of rooms constant?', null, 'The areaUrban coefficient: 3971.4 more than rural.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3007.2 Ngultrums', false, 1), ('B', '3971.4 Ngultrums', true, 2), ('C', '1968.6 Ngultrums', false, 3), ('D', '1012.8 Ngultrums', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is NOT part of time series components?', null, 'Components are trend, seasonal, cyclical and irregular; outliers are not a component.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Seasonal', false, 1), ('B', 'Trend', false, 2), ('C', 'Irregular', false, 3), ('D', 'Outliers', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A boxplot comparing exam scores for two classes shows one box much wider than the other. What does this imply?', null, 'A wider box (larger IQR) means more variability.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The class with the wider box had higher average scores.', false, 1), ('B', 'The class with the wider box had more students.', false, 2), ('C', 'The class with the wider box had greater variability in scores.', true, 3), ('D', 'The class with the wider box had more outliers.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a survey estimate has a coefficient of variation (CV) of 10%, what does this indicate?', null, 'CV of an estimate = SE / estimate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The sampling design has no effect on variance (design effect equals 1.0).', false, 1), ('B', 'The estimate deviates from the true value by approximately ±10%.', false, 2), ('C', 'The total width of the confidence interval equals 10% of the estimate.', false, 3), ('D', 'The standard error amounts to 10% of the estimate value.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A researcher increases the significance level (from 0.01 to 0.10). What is the most likely consequence?', null, 'A higher alpha increases the risk of Type I error.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increased risk of Type I error', true, 1), ('B', 'Increased risk of Type II error', false, 2), ('C', 'Decreased chance of detecting real effect', false, 3), ('D', 'Decrease in power of the test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A car manufacturer tests the fuel efficiency (in km/L) of a new model. A sample of 25 cars shows a mean of 18 km/L with a standard deviation of 3 km/L. The company claims the true efficiency exceeds 16 km/L. Which hypothesis test conclusion aligns with a 95% confidence interval?', null, '95% CI = 18 ± 2.064 x 0.6 = 16.8 to 19.2, entirely above 16: support the claim.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Insufficient data to conclude', false, 1), ('B', 'Accept the claim', true, 2), ('C', 'Reject the claim', false, 3), ('D', 'The CI is irrelevant for hypothesis testing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A policy analyst uses multivariate regression to assess the impact of education level on income, controlling for gender and location. What is the primary advantage of this approach?', null, 'Multiple regression controls for confounders.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Allows extrapolation beyond the sample', false, 1), ('B', 'Controls for confounding variables', true, 2), ('C', 'Avoids the need for sampling weights', false, 3), ('D', 'Ensures normal distribution of residuals', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a logistic regression predicting program participation (yes/no), What does an odds ratio of 2.0 for income indicate?', null, 'OR 2: odds of participation double per unit increase in income (higher income, about twice the odds).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Higher income groups are twice as likely to participate.', true, 1), ('B', 'Doubling income doubles participation probability.', false, 2), ('C', 'Income has no effect.', false, 3), ('D', 'The model is linear.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'ZheyGo observes that delivery times follow a normal distribution with a mean 30 minutes and standard deviation of 10 minutes. What is the chance that a delivery exceeds 50 minutes?', null, 'z = (50 - 30)/10 = 2; P ≈ 2.3%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'About 2.5%', true, 1), ('B', 'About 16%', false, 2), ('C', 'About 32%', false, 3), ('D', 'About 5%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A survey uses stratified sampling to improve precision. What is a key assumption for stratification to be effective?', null, 'Stratification works best when strata are internally homogeneous.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Strata should be as heterogeneous as possible.', false, 1), ('B', 'Strata should have equal sample sizes.', false, 2), ('C', 'Strata should be selected using PPS sampling.', false, 3), ('D', 'Strata should be as homogeneous as possible internally.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If P(A) = 0.4 and P(B) = 0.5, and A and B are mutually exclusive, then P(A ∪ B) is', null, 'Mutually exclusive: 0.4 + 0.5 = 0.9.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.0', false, 1), ('B', '0.9', true, 2), ('C', '0.4', false, 3), ('D', '0.2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A sampling expert was designing a national household survey is to measure unemployment rates. If urban and rural areas are treated as separate domains, what is the main implication for sample size?', null, 'Each domain needs its own adequate sample, roughly doubling the total.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The sample size can be reduced by 50%.', false, 1), ('B', 'Only urban areas need to be sampled.', false, 2), ('C', 'The total sample size remains unchanged.', false, 3), ('D', 'The sample size must be doubled.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the advantages and disadvantages of stratified sampling compared with simple random sampling. Each supporting point earns 1 mark.', 'Advantages: 1. Greater precision (smaller standard errors) than SRS of the same size when strata are internally homogeneous. 2. Ensures every important subgroup (e.g. dzongkhag, urban/rural) is represented. 3. Gives separate estimates for each stratum (domain estimates). 4. Administrative convenience - fieldwork can be organised by stratum, and different sampling methods can be used in different strata.
Disadvantages: 1. Needs a sampling frame with information on the stratification variable for every unit. 2. More complex design and analysis (weights for disproportionate allocation). 3. Little or no gain if strata are not homogeneous, and errors if units are misclassified.', null, '[{"point": "Advantages (e.g. more precise estimates when strata homogeneous, separate estimates for strata/ domains, ensures representation of subgroups, administrative convenience, different methods per stratum)", "marks": 3}, {"point": "Disadvantages (needs a sampling frame with stratification information, more complex design/ analysis and weighting, misclassification, poor gain if strata not homogeneous, costly)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure was published in The New York Times. The data were from an online survey of 1495 young adults aged 18 to 34. Young adults who said they were not in contact with their living parents were screened out of the survey. The figure shows the percentage of young people who say they reach out to a parent at least once a day or a few times a week, by method (send texts, phone or video-chat, visit in person), for young men and young women.

a) What do you notice? (2 marks)', 'a) Texting is the most common way young adults contact parents frequently (about 50% of young men and about 70% of young women), then phone or video calls (about 35% and 55%), while in-person visits are least common (about 20% and 26%). Young women reach out more than young men by every method, and the gap is largest for texting and calls, smallest for visits. Limitations: an online, self-reported survey that excluded those not in contact with parents, so it overstates contact for all young adults.', null, '[{"point": "Observations: texting most common (~50% men, ~70% women), then calls (~35% vs 55%), visits least (~20% vs 26%); women contact more by every method; gender gap largest for texting/calls; note survey limitations (online, screened out no-contact)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s2', 1, null, null, (select id from public.specialisations where code = 'statistics'), '/papers/me/tech3-stat-2025-parents-contact.png')
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure was published in The New York Times. The data were from an online survey of 1495 young adults aged 18 to 34. Young adults who said they were not in contact with their living parents were screened out of the survey. The figure shows the percentage of young people who say they reach out to a parent at least once a day or a few times a week, by method (send texts, phone or video-chat, visit in person), for young men and young women.

b) How does this relate to you and your community? (2 marks)', 'b) Many young Bhutanese live away from parents - in Thimphu, other towns or abroad (e.g. Australia) - so they rely on WeChat, WhatsApp and calls rather than visits; daughters often keep closer contact than sons, while family values encourage regular contact; a similar survey here could inform programmes for elderly parents living alone.', null, '[{"point": "Relating to own community: Bhutanese young people, migration to Thimphu/abroad (Australia), digital communication, family values, gender roles", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s2', 2, null, null, (select id from public.specialisations where code = 'statistics'), '/papers/me/tech3-stat-2025-parents-contact.png')
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure was published in The New York Times. The data were from an online survey of 1495 young adults aged 18 to 34. Young adults who said they were not in contact with their living parents were screened out of the survey. The figure shows the percentage of young people who say they reach out to a parent at least once a day or a few times a week, by method (send texts, phone or video-chat, visit in person), for young men and young women.

c) Create a catchy headline that captures the figure''s main idea. (1 mark)', 'c) Example: "Thumbs over doorsteps: young women text Mum and Dad far more than young men - but few visit."', null, '[{"point": "Catchy headline capturing gender gap/ texting", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s2', 3, null, null, (select id from public.specialisations where code = 'statistics'), '/papers/me/tech3-stat-2025-parents-contact.png')
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A total of 3000 graduates sat the Bhutan Civil Service Examination 2024. Assuming the exam marks followed a normal distribution with mean 55 and standard deviation 8:

a) What proportion of graduates scored less than 60? (1 mark)', 'a) z = (60 - 55)/8 = 0.625; P(Z < 0.625) ≈ 0.734, so about 73.4% scored below 60.', null, '[{"point": "z = 0.625, P ≈ 0.734 (73.4%)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s3', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A total of 3000 graduates sat the Bhutan Civil Service Examination 2024. Assuming the exam marks followed a normal distribution with mean 55 and standard deviation 8:

b) What proportion of graduates scored between 45 and 65? (2 marks)', 'b) z1 = (45 - 55)/8 = -1.25, z2 = (65 - 55)/8 = 1.25; P(-1.25 < Z < 1.25) = 2 x 0.8944 - 1 ≈ 0.789, so about 78.9%.', null, '[{"point": "z = ±1.25, P ≈ 0.789 (78.9%)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s3', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A total of 3000 graduates sat the Bhutan Civil Service Examination 2024. Assuming the exam marks followed a normal distribution with mean 55 and standard deviation 8:

c) If a ''High Achiever'' tag is awarded to graduates scoring at least 70, how many examinees will receive it? (2 marks)', 'c) z = (70 - 55)/8 = 1.875; P(Z ≥ 1.875) ≈ 0.0304; number = 0.0304 x 3000 ≈ 91 graduates.', null, '[{"point": "z = 1.875, P ≈ 0.0304, number ≈ 91", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s3', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Consider a simple random sample of size n drawn from a large population in which the true proportion with a certain characteristic is p. Let p̂ = X/n be the sample proportion, where X is the number in the sample with the characteristic.

a) Derive E(p̂). (2 marks)', 'a) X is the number of successes in n independent trials with probability p, so X ~ Binomial(n, p) with E(X) = np (sum of n Bernoulli variables each with mean p). Then E(p̂) = E(X/n) = E(X)/n = np/n = p, so p̂ is an unbiased estimator of p.', null, '[{"point": "X ~ Binomial(n, p), E(X) = np, so E(p̂) = np/n = p (unbiased)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s4', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Consider a simple random sample of size n drawn from a large population in which the true proportion with a certain characteristic is p. Let p̂ = X/n be the sample proportion, where X is the number in the sample with the characteristic.

b) Derive Var(p̂). (2 marks)', 'b) Var(X) = np(1 - p) (sum of n independent Bernoulli variances p(1 - p)). Var(p̂) = Var(X/n) = Var(X)/n² = np(1 - p)/n² = p(1 - p)/n.', null, '[{"point": "Var(X) = np(1 - p), Var(p̂) = Var(X)/n² = p(1 - p)/n", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s4', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Consider a simple random sample of size n drawn from a large population in which the true proportion with a certain characteristic is p. Let p̂ = X/n be the sample proportion, where X is the number in the sample with the characteristic.

c) If p = 0.3 and n = 200, calculate the standard error of p̂. (1 mark)', 'c) SE(p̂) = √(p(1 - p)/n) = √(0.3 x 0.7 / 200) = √0.00105 ≈ 0.0324.', null, '[{"point": "SE = √(0.3 x 0.7/200) = √0.00105 ≈ 0.0324", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-s4', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

a) Formulate hypotheses for testing whether less than 60% of the population supports the ban. Is this a one-sided or two-sided test? Justify. (2 + 2 marks) (4 marks)', 'H0: p = 0.60 (support is at least 60%) versus H1: p < 0.60. It is a one-sided (left-tailed) test, because we only want to know whether support is lower than the Department''s claim; values above 60% would not challenge it.', null, '[{"point": "H0: p = 0.60 (or ≥ 0.60); H1: p < 0.60", "marks": 2}, {"point": "One-sided (left-tailed) because the question is only whether support is less than 60%", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

b) Use the survey data to test the hypotheses at the 5% significance level. Calculate the test statistic and compare it with its sampling distribution under H0 by calculating the p-value. (6 + 2 marks) (8 marks)', 'Sample proportion p̂ = 226/400 = 0.565. Under H0, SE = √(p0(1 - p0)/n) = √(0.6 x 0.4 / 400) = √0.0006 = 0.0245. Test statistic z = (p̂ - p0)/SE = (0.565 - 0.600)/0.0245 = -1.43. (np0 = 240 and n(1 - p0) = 160 are large, so the normal approximation is valid.) p-value = P(Z < -1.43) ≈ 0.0766. Since 0.077 > 0.05, the result is not significant at 5%.', null, '[{"point": "p̂ = 226/400 = 0.565", "marks": 1}, {"point": "SE under H0 = √(0.6 x 0.4/400) = 0.0245", "marks": 2}, {"point": "z = (0.565 - 0.60)/0.0245 = -1.43", "marks": 3}, {"point": "p-value = P(Z < -1.43) ≈ 0.077 > 0.05", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

c) Based on (b), what do you conclude? Explain in plain language what this means for public support. (1 + 2 marks) (3 marks)', 'We fail to reject H0 at the 5% level. Although only 56.5% of the sample supported the ban, this shortfall from 60% could easily happen by chance in a sample of 400, so the survey does not give strong enough evidence that support is below 60%. The Department''s claim is not disproved - but neither is it proven; the evidence is borderline (p ≈ 0.08).', null, '[{"point": "Fail to reject H0 at 5%", "marks": 1}, {"point": "Plain language: the survey (56.5%) is lower than 60% but the difference could be due to chance; not enough evidence that support is below 60%; claim not disproved (though not proven)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

d) If the critical region approach is used, what do you conclude? Show your results. (3 marks) (3 marks)', 'For a left-tailed test at α = 0.05 the critical value is z = -1.645, so the rejection region is z < -1.645. The calculated z = -1.43 does not fall in this region (-1.43 > -1.645), so we fail to reject H0 - the same conclusion as the p-value approach.', null, '[{"point": "Critical value z = -1.645 for left-tailed 5%; rejection region z < -1.645", "marks": 1.5}, {"point": "z = -1.43 > -1.645, not in rejection region, fail to reject H0", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 4, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

e) Construct a 95% confidence interval for the true population proportion supporting the ban. Interpret it. Does it support or contradict your decision in (c)? (6 + 3 + 1 marks) (10 marks)', 'SE = √(p̂(1 - p̂)/n) = √(0.565 x 0.435 / 400) = √0.000614 = 0.0248. 95% CI = 0.565 ± 1.96 x 0.0248 = 0.565 ± 0.0486 → (0.516, 0.614), i.e. about 51.6% to 61.4%. Interpretation: we are 95% confident that between about 52% and 61% of all residents support the ban - if we repeated the survey many times, 95% of such intervals would contain the true proportion. Since the interval includes 0.60, it supports the decision not to reject the claim (a majority supports the ban, but it may be below 60%).', null, '[{"point": "SE = √(0.565 x 0.435/400) = 0.0248", "marks": 2}, {"point": "CI = 0.565 ± 1.96 x 0.0248 = 0.565 ± 0.049 → (0.516, 0.614)", "marks": 4}, {"point": "Interpretation: 95% confident true support between about 51.6% and 61.4% (method captures p in 95% of samples)", "marks": 3}, {"point": "Contains 0.60 so consistent with failing to reject", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 5, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

f) Suppose a policymaker believes that actual support differs from 60%. Formulate the null and alternative hypotheses, recalculate the test statistic and p-value at the 5% level, and draw a conclusion. (2 + 6 + 2 marks) (10 marks)', 'H0: p = 0.60; H1: p ≠ 0.60 (two-sided). The test statistic is unchanged: z = (0.565 - 0.60)/0.0245 = -1.43. Two-sided p-value = 2 x P(Z < -1.43) = 2 x 0.0766 ≈ 0.153 (critical values ±1.96). Since 0.153 > 0.05 (and |z| < 1.96), we fail to reject H0: there is no significant evidence that support differs from 60%.', null, '[{"point": "H0: p = 0.60; H1: p ≠ 0.60 (two-sided)", "marks": 2}, {"point": "z = -1.43 (same); two-sided p-value = 2 x 0.0766 ≈ 0.153; critical ±1.96", "marks": 6}, {"point": "Fail to reject H0 - no evidence support differs from 60%", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 6, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Public support for a ban on single-use plastics
The Department of Environment and Climate Change under the Ministry of Energy and Natural Resources (MoENR) has been advocating a nationwide ban on single-use plastics. It claims that at least 60% of residents support the measure. A local researcher surveyed 400 randomly selected residents, and only 226 supported the ban. The Department wants to check whether the survey data challenge its belief. Use the standard normal distribution where necessary.

g) The sample of 400 was drawn from a small region with only 2000 adult residents (a 20% sampling fraction), so a finite population correction (FPC) should be applied to the standard error. Test again whether the true proportion is less than 60% at the 5% level.
(i) Recalculate the standard error using the FPC. (3 marks)
(ii) Compute the new z-statistic using the corrected standard error. (5 marks)
(iii) Does this change the decision to reject or fail to reject H0? (1 mark)
(iv) Briefly explain how the FPC changes the interpretation or reliability of the results. (3 marks) (12 marks)', '(i) FPC = √((N - n)/(N - 1)) = √((2000 - 400)/1999) = √0.8004 = 0.8947. Corrected SE = 0.0245 x 0.8947 = 0.0219.
(ii) z = (0.565 - 0.600)/0.0219 = -1.60.
(iii) p-value = P(Z < -1.60) ≈ 0.055 (and -1.60 > -1.645), so we still fail to reject H0 at 5%, though it is now very close to the boundary.
(iv) When a large share of a small population is sampled, there is less uncertainty about the population, so the FPC reduces the standard error and gives a more precise, more reliable test; the z-statistic becomes larger in magnitude and the p-value smaller, making the evidence against the 60% claim stronger (borderline) even though the decision does not change. Ignoring the FPC overstates uncertainty (a conservative test).', null, '[{"point": "(i) FPC = √((N - n)/(N - 1)) = √(1600/1999) = 0.8947; SE = 0.0245 x 0.8947 = 0.0219", "marks": 3}, {"point": "(ii) z = (0.565 - 0.60)/0.0219 = -1.60", "marks": 5}, {"point": "(iii) p ≈ 0.055 > 0.05 (or -1.60 > -1.645): still fail to reject, but borderline", "marks": 1}, {"point": "(iv) FPC reduces SE because a large fraction sampled gives more information; more precise, stronger evidence (p smaller), but decision unchanged; ignoring FPC is conservative", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case1', 7, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

a) What are the estimated coefficients of the regression model? Write the regression equation based on the fitted model. (2 + 5 marks) (7 marks)', 'Estimated intercept β0 = 50.9485; estimated slope β1 = 7.9352. Fitted equation: Ŷ (predicted number of crimes) = 50.9485 + 7.9352 X, where X is the unemployment rate (%).', null, '[{"point": "Intercept 50.9485, slope 7.9352", "marks": 2}, {"point": "Equation: predicted crimes = 50.9485 + 7.9352 x unemployment rate (%)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

b) Interpret the estimated regression coefficients. Is the intercept meaningful in this context? (4 + 4 + 2 marks) (10 marks)', 'Slope (7.9352): for each one-percentage-point increase in the unemployment rate, the number of crimes reported increases by about 7.9 on average (association, not necessarily causation). Intercept (50.9485): the predicted number of crimes in a region with 0% unemployment is about 51. Meaningfulness: the intercept is only meaningful if regions with near-zero unemployment exist in the data; since zero unemployment is unrealistic and likely outside the observed range, it is mainly a mathematical anchor for the line and should be interpreted with caution (extrapolation).', null, '[{"point": "Slope: each 1 percentage point increase in unemployment is associated with about 7.94 more crimes on average", "marks": 4}, {"point": "Intercept: predicted about 51 crimes when unemployment is 0%", "marks": 4}, {"point": "Meaningful? Only if 0% unemployment is within/near the data range; usually extrapolation, so limited meaning; association not causation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

c) How well does the model fit? Explain briefly in layperson''s terms. (3 + 2 marks) (5 marks)', 'R-squared = 0.8078 (adjusted 0.8076): about 81% of the variation in crimes reported across regions is explained by the unemployment rate - a strong fit; the residual standard error is about 20 crimes. In plain words: regions with higher unemployment clearly tend to have more crime, and knowing a region''s unemployment rate lets us predict its crime level fairly well, typically within about 20 crimes; the remaining 19% of differences are due to other factors.', null, '[{"point": "R² = 0.808: about 81% of variation in crimes explained by unemployment; adjusted 0.8076; residual SE 20 crimes", "marks": 3}, {"point": "Layperson: unemployment is a strong predictor - knowing it lets us predict crime fairly well, though about 19% depends on other factors; typical prediction error about 20 crimes", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

d) You wish to test whether there is a statistically significant relationship between unemployment and crime.
(i) State the null and alternative hypotheses for the slope. (2 marks)
(ii) Using the summary output, give the p-value and interpret it at the 5% level. (2 marks)
(iii) State your conclusion. (1 mark) (5 marks)', '(i) H0: β1 = 0 (no linear relationship); H1: β1 ≠ 0. (ii) The p-value for the slope is < 2 x 10^-16 (t = 64.77), far below 0.05 - such a strong relationship would almost never be seen by chance if there were truly none. (iii) Reject H0: there is a statistically significant positive relationship between unemployment rate and crimes reported.', null, '[{"point": "(i) H0: β1 = 0; H1: β1 ≠ 0", "marks": 2}, {"point": "(ii) p < 2e-16 (t = 64.77), far below 0.05 - extremely unlikely if no relationship", "marks": 2}, {"point": "(iii) Reject H0: significant positive relationship", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 4, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

e) Predict the number of crimes in region A with a 10% unemployment rate. If the actual number of crimes was 130, calculate the residual and interpret it. (3 + 5 marks) (8 marks)', 'Predicted Ŷ = 50.9485 + 7.9352 x 10 = 130.30 crimes. Residual = actual - predicted = 130 - 130.30 = -0.30. The region had about 0.3 fewer crimes than the model predicts - a very small error, so the model fits this region very well (it is almost exactly on the regression line).', null, '[{"point": "Prediction: 50.9485 + 7.9352 x 10 = 130.30", "marks": 3}, {"point": "Residual = 130 - 130.30 = -0.30", "marks": 3}, {"point": "Interpretation: actual crimes slightly fewer (by 0.3) than predicted - model very accurate for this region", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 5, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

f) List any two key assumptions of simple linear regression. Explain briefly how you would check them using diagnostic plots. (7 marks)', '1. Linearity and constant variance (homoscedasticity): the relationship between X and Y is linear and the residual spread is the same at all fitted values. Check with a residuals-versus-fitted plot (and scale-location plot): residuals should scatter randomly around zero with no curve and no funnel shape. 2. Normality of residuals: check with a normal Q-Q plot - points should lie close to the straight line (or a histogram of residuals should be bell-shaped). (Also independence of errors - residuals vs order/Durbin-Watson; and influential points - residuals vs leverage with Cook''s distance.)', null, '[{"point": "Two assumptions named (linearity, independence, homoscedasticity, normality of residuals)", "marks": 3}, {"point": "Diagnostic checks explained: residuals vs fitted (no pattern = linear, constant spread), normal Q-Q plot (points on line), scale-location plot, residuals vs leverage/ order for independence", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 6, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Unemployment and crime
The National Statistics Bureau is studying whether unemployment in regions is related to the number of crimes reported, where Y = number of crimes reported and X = unemployment rate (%) in the region. A simple linear regression model is used at α = 0.05. Summary output (R):
lm(formula = crime_reported ~ unemployment_rate, data = data)
Residuals: Min -56.862, 1Q -14.015, Median 0.271, 3Q 13.115, Max 68.145
Coefficients: (Intercept) estimate 50.9485, SE 1.4837, t 34.34, p < 2e-16; unemployment_rate estimate 7.9352, SE 0.1225, t 64.77, p < 2e-16
Residual standard error: 20.04 on 998 degrees of freedom. Multiple R-squared: 0.8078, adjusted R-squared: 0.8076. F-statistic: ? on ? and ? DF, p-value < 2.2e-16.

g) Fill in the ANOVA table using the summary output (hint: use the summary output). Response: crime_reported.
Source | Degrees of freedom | Sum of squares | Mean square | F statistic
Model (regression) | i | iv | vi | viii
Residual (error) | ii | v | vii |
Total | iii | 2 085 123 | | (8 marks)', 'i) Model df = 1 (one predictor); ii) residual df = 998 (given); iii) total df = 999 (n = 1000).
iv) Model SS = R² x total SS = 0.8078 x 2 085 123 ≈ 1 684 362.
v) Residual SS = 2 085 123 - 1 684 362 ≈ 400 761 (check: 20.04² x 998 ≈ 400 798).
vi) Model MS = 1 684 362 / 1 = 1 684 362.
vii) Residual MS = 400 761 / 998 ≈ 401.6 (= 20.04²).
viii) F = 1 684 362 / 401.6 ≈ 4195 on 1 and 998 df (equal to t² = 64.77² ≈ 4195), p < 2.2e-16.', null, '[{"point": "df: i = 1, ii = 998, iii = 999", "marks": 2}, {"point": "SS: iv (model) = R² x SST ≈ 1 684 362; v (residual) ≈ 400 761 (or 20.04² x 998 ≈ 400 798)", "marks": 3}, {"point": "MS: vi = 1 684 362; vii ≈ 401.6", "marks": 2}, {"point": "F: viii ≈ 4195 (= t² = 64.77²)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Statistics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2025-case2', 7, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a two-stage cluster sample, selecting clusters with probability proportional to size (PPS) and then a fixed number of households per cluster gives', null, 'PPS at stage 1 with a fixed take at stage 2 gives every household about the same overall probability and a fixed workload per cluster.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'An approximately self-weighting sample with equal workload per cluster', true, 1), ('B', 'A sample with no design effect', false, 2), ('C', 'A simple random sample of clusters', false, 3), ('D', 'Unequal probabilities for households in large clusters', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
