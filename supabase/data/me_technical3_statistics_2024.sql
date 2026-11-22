-- ME Paper III (Technical, Statistics): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'statistics', 'Statistics' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'statistics') is null then raise exception 'unknown specialisation statistics'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Given a dataset with a mean of 100 and a variance of 100, what is the z-score for a value of 90?', null, 'SD = √100 = 10; z = (90 - 100)/10 = -1.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '-1', true, 1), ('B', '-2', false, 2), ('C', '2', false, 3), ('D', '1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the value of variance if the sample mean is 80 and the coefficient of variation (CV) is 5%?', null, 'SD = CV x mean = 0.05 x 80 = 4; variance = 16.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5', false, 1), ('B', '4', false, 2), ('C', '16', true, 3), ('D', '25', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a simple linear regression model, which of the following is true if the slope β1 is zero?', null, 'A zero slope means the predictor has no (linear) effect on the response.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The predictor variable is perfectly correlated with the response variable.', false, 1), ('B', 'The response variable has no variation.', false, 2), ('C', 'The predictor variable has no impact on the response variable.', true, 3), ('D', 'The intercept β0 must also be zero.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose the average income of civil servants in Bhutan is Nu. 30,000 with a standard deviation of Nu 3,000. If all civil servants receive a 10% raise in the coming year, what will be the new mean income and standard deviation?', null, 'Multiplying by 1.1 multiplies both the mean and the SD by 1.1: Nu 33,000 and Nu 3,300.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu 33,000 and Nu 3,000', false, 1), ('B', 'Nu 30,000 and Nu 3,300', false, 2), ('C', 'Nu 30,000 and Nu 3,000', false, 3), ('D', 'Nu 33,000 and Nu 3,300', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If X is normally distributed with mean 8 and standard deviation 4, what is P(5 ≤ X ≤ 10)?', null, 'z = (5 - 8)/4 = -0.75 and (10 - 8)/4 = 0.5; P = 0.6915 - 0.2266 = 0.4649.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.6915', false, 1), ('B', '0.9181', false, 2), ('C', '0.4649', true, 3), ('D', '0.2266', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a hypothesis test for the difference between two means, what does a 95% confidence interval that includes zero imply about the null hypothesis?', null, 'If the 95% CI for the difference includes 0, the difference is not significant at 5%: do not reject H0.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The null hypothesis should not be rejected.', true, 1), ('B', 'There is strong evidence against the null hypothesis.', false, 2), ('C', 'The null hypothesis should be rejected.', false, 3), ('D', 'There is weak evidence against the null hypothesis.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a multiple regression analysis, which of the following scenarios is most likely to lead to multicollinearity?', null, 'Multicollinearity is high correlation among the independent variables.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High correlation among the independent variables', true, 1), ('B', 'Use of too many dummy variables Suppose the following data were collected from household survey. Use the information in the table to answer Questions 8 and 9. Primary Sampling Unit Household serial number y Base Weight (W) 1 1 1 120 1 2 1 120 2 1 1 40 2 2 1 40 3 1 0 50 3 2 1 50 4 1 1 80 4 2 0 80 4 3 1 80', false, 2), ('C', 'Inclusion of a categorical variable with many levels', false, 3), ('D', 'High correlation between the dependent variable and independent variables', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose the following data were collected from a household survey (Y = 1 if the household has at least one smart phone, 0 otherwise):
PSU 1: household 1, y = 1, W = 120; household 2, y = 1, W = 120
PSU 2: household 1, y = 1, W = 40; household 2, y = 1, W = 40
PSU 3: household 1, y = 0, W = 50; household 2, y = 1, W = 50
PSU 4: household 1, y = 1, W = 80; household 2, y = 0, W = 80; household 3, y = 1, W = 80
(W = base weight)

What is the estimated total households from the survey?', null, 'Estimated total = sum of weights = 2(120) + 2(40) + 2(50) + 3(80) = 660.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '530', false, 1), ('B', '660', true, 2), ('C', '9', false, 3), ('D', '15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose the following data were collected from a household survey (Y = 1 if the household has at least one smart phone, 0 otherwise):
PSU 1: household 1, y = 1, W = 120; household 2, y = 1, W = 120
PSU 2: household 1, y = 1, W = 40; household 2, y = 1, W = 40
PSU 3: household 1, y = 0, W = 50; household 2, y = 1, W = 50
PSU 4: household 1, y = 1, W = 80; household 2, y = 0, W = 80; household 3, y = 1, W = 80
(W = base weight)

What is the estimated proportion of household having at least one smart phone?', null, 'Weighted proportion = (120 + 120 + 40 + 40 + 50 + 80 + 80)/660 = 530/660 = 80.3%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '77.8%', false, 1), ('B', '80.3%', true, 2), ('C', '81.6%', false, 3), ('D', '79.5%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the CPI for the current year is 120 and the CPI for the previous year was 115, what is the inflation rate?', null, 'Inflation = (120 - 115)/115 x 100 = 4.35%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5.00%', false, 1), ('B', '4.17%', false, 2), ('C', '4.35%', true, 3), ('D', '5.22%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:
(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16
GenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118

What does the intercept represent in this regression model?', null, 'Female is the reference category, so the intercept is the mean score for females.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The overall average score across all participants', false, 1), ('B', 'The average score for females', true, 2), ('C', 'The difference between male and female scores', false, 3), ('D', 'The average score for males', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:
(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16
GenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118

What is the predicted score for a male participant according to this model?', null, 'Predicted male score = 76.464 - 6.120 = 70.344.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '82.584', false, 1), ('B', '70.344', true, 2), ('C', 'Cannot be determined from the given information', false, 3), ('D', '76.464', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The summary output of a regression model studying the effect of gender (two factors: male and female) on test scores:
(Intercept): estimate 76.464, std. error 1.295, t value 59.045, Pr(>|t|) < 2e-16
GenderMale: estimate -6.120, std. error 1.831, t value -3.342, Pr(>|t|) 0.00118

If another factor, such as age, were added to this model, under what condition might the coefficient for ''GenderMale'' change significantly, and what would that imply?', null, 'If age is correlated with gender (and affects scores), adjusting for it changes the gender coefficient - confounding.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'If age is independent of gender, indicating no impact on the gender coefficient.', false, 1), ('B', 'If the sample size increases, leading to more accurate estimates.', false, 2), ('C', 'If the variance of the residuals increases, indicating a poorer fit of the model.', false, 3), ('D', 'If age is correlated with gender, indicating a potential confounding effect.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements is not the property of Bernoulli distribution?', null, 'In a Bernoulli process the probability of success p stays constant from trial to trial.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Each trials results in an outcome that may be classified under two mutually exclusive categories as a success or as a failure.', false, 1), ('B', 'The repeated trials are independent.', false, 2), ('C', 'The probability of success denoted by p, changes from trail to trail.', true, 3), ('D', 'The experiment consists of n repeated trials.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the context of time series forecasting, what is the "Box-Cox transformation" primarily used for?', null, 'The Box-Cox transformation stabilises variance (and makes data closer to normal).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reducing autocorrelation', false, 1), ('B', 'Identifying seasonality', false, 2), ('C', 'Stabilizing variance', true, 3), ('D', 'Handling missing data', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a two-tailed hypothesis test, if the p-value is 0.04, what is the probability of observing a test statistic as extreme or more extreme than the observed one in the opposite direction?', null, 'A two-tailed p-value of 0.04 splits equally: 0.02 in each tail.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.02', true, 1), ('B', '0.08', false, 2), ('C', '0.04', false, 3), ('D', '0.96', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose a continuous random variable X has a PDF given by f(x) = 3x² for x ∈ [0, 1]. What is the expected value E[X]?', null, 'E[X] = ∫ x·3x² dx from 0 to 1 = 3/4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2/3', false, 1), ('B', '3/5', false, 2), ('C', '3/4', true, 3), ('D', '1/2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose you have two different samples from the same population. The first sample has a size of 25, and the second sample has a size of 100. If the standard deviation of the population is known, how does the standard error of the mean for the first sample compare to that of the second sample?', null, 'SE = σ/√n: √(100/25) = 2, so the first sample''s SE is twice as large.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The first sample’s standard error is half as large.', false, 1), ('B', 'The first sample’s standard error is twice as large.', true, 2), ('C', 'The first sample’s standard error is four times as large.', false, 3), ('D', 'The first sample’s standard error is equal to that of the second sample.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A dataset has a mean of 50 and standard deviation of 7. If every data point is reduced by 5, what are the new mean and standard deviation?', null, 'Subtracting a constant lowers the mean by 5 but leaves the SD unchanged: 45 and 7.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '55 and 2', false, 1), ('B', '45 and 2', false, 2), ('C', '50 and 7', false, 3), ('D', '45 and 7', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the context of experimental design, what is a "confounding variable"?', null, 'A confounder is associated with both the exposure (independent variable) and the outcome.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A variable that is held constant throughout the experiment to isolate the effect of the treatment.', false, 1), ('B', 'A variable that influences both the independent and dependent variables, potentially distorting the observed effect.', true, 2), ('C', 'A variable that is deliberately manipulated by the researcher.', false, 3), ('D', 'A variable that is randomly assigned to subjects to ensure unbiased results.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a binomial distribution with n = 8 and p = 0.2, what is the standard deviation?', null, 'SD = √(npq) = √(8 x 0.2 x 0.8) = √1.28 = 1.13.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.13', true, 1), ('B', '1.28', false, 2), ('C', '0.12', false, 3), ('D', '2.24', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the boxplot of monthly household expenses shown, what can be inferred about the skewness of the data?', null, 'Outliers and the longer whisker are on the high side, so the data are positively (right) skewed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), '/papers/me/tech3-stat-2024-boxplot.png')
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The data is normally distributed.', false, 1), ('B', 'The data is negatively skewed.', false, 2), ('C', 'The data is symmetric.', false, 3), ('D', 'The data is positively skewed.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A bag contains 25 balls marked 1 to 25. One ball is drawn at random. What is the probability that it is marked with a number that is a multiple of 5 or 7?', null, 'Multiples of 5: 5, 10, 15, 20, 25 (5); of 7: 7, 14, 21 (3); none common: 8/25.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5/25', false, 1), ('B', '8/25', true, 2), ('C', '6/25', false, 3), ('D', '3/25', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In hypothesis testing, what is the main difference between a Type I error and a Type II error?', null, 'Type I: rejecting a true H0; Type II: failing to reject a false H0.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Type I error is rejecting a true null hypothesis; Type II error is failing to reject a false null hypothesis.', true, 1), ('B', 'Type I error is failing to reject a false null hypothesis; Type II error is rejecting a true null hypothesis.', false, 2), ('C', 'Type I error occurs when the sample size is too large; Type II error occurs when the sample size is too small.', false, 3), ('D', 'Type I error occurs in one-tailed tests; Type II error occurs in two-tailed tests.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is true about the posterior distribution in Bayesian statistics?', null, 'Posterior ∝ prior x likelihood: the prior is updated with the data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is obtained by updating the prior distribution with the likelihood function.', true, 1), ('B', 'It is the same as the prior distribution.', false, 2), ('C', 'It is the likelihood function alone.', false, 3), ('D', 'It is the prior distribution multiplied by the data.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main purpose of using a control group in an experimental design?', null, 'The control group provides the baseline to measure the treatment effect.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To ensure that the experimental procedure is standardized', false, 1), ('B', 'To reduce the cost of the experiment', false, 2), ('C', 'To increase the sample size of the experiment', false, 3), ('D', 'To provide a baseline for comparison and measure the effect of the treatment', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a multiple regression model, adding more independent variables to the model will always', null, 'R² never decreases when variables are added (adjusted R² can fall).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Improve the model''s predictive accuracy', false, 1), ('B', 'Reduce the variance of the error term', false, 2), ('C', 'Increase the multicollinearity in the model', false, 3), ('D', 'Increase the R² value', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The unit for variance is', null, 'Variance is in squared units of the original data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Original unit squared', true, 1), ('B', 'None of above', false, 2), ('C', 'Original unit', false, 3), ('D', 'Unitless', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A city reports a CPI of 200 this year. If the CPI last year was 180, what is the percentage change in the purchasing power of the currency?', null, 'Purchasing power changes by 180/200 - 1 = -10%: a 10% fall.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12.00%', false, 1), ('B', '8.89%', false, 2), ('C', '11.11%', false, 3), ('D', '10.00%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A company wants to estimate the average time (in hours) its employees spend on training per month. A random sample of 40 employees shows that the average training time is 8 hours with a standard deviation of 2 hours.

a) Calculate a 95% confidence interval for the true average training time. (3 marks)', 'a) Standard error = s/√n = 2/√40 = 2/6.325 = 0.316. With σ unknown, use t with 39 df: t = 2.023, margin of error = 2.023 x 0.316 = 0.64. 95% CI = 8 ± 0.64 = (7.36, 8.64) hours. (Using z = 1.96 for a large sample: 8 ± 0.62 = (7.38, 8.62).)', null, '[{"point": "SE = 2/√40 = 0.316; t(39, 0.025) = 2.023 (or z = 1.96); margin ≈ 0.64 (0.62); CI ≈ 7.36 to 8.64 hours (7.38 to 8.62)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-s1', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A company wants to estimate the average time (in hours) its employees spend on training per month. A random sample of 40 employees shows that the average training time is 8 hours with a standard deviation of 2 hours.

b) Interpret it. (2 marks)', 'b) We are 95% confident that the true average monthly training time of all the company''s employees lies between about 7.4 and 8.6 hours. That is, if many samples of 40 were taken and an interval built from each, about 95% of those intervals would contain the true mean.', null, '[{"point": "We are 95% confident the true mean monthly training time of all employees lies between about 7.4 and 8.6 hours; 95% of such intervals would contain μ", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-s1', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A researcher wants to estimate the average monthly expenditure on healthcare with a margin of error of Nu 50 and a confidence level of 95%. From a preliminary study, the standard deviation of expenditure is estimated to be Nu 500. What sample size is needed? (5 marks)', 'For estimating a mean: n = (z x σ / E)². With z = 1.96 (95%), σ = Nu 500 and E = Nu 50: n = (1.96 x 500 / 50)² = (19.6)² = 384.16. Always round up, so the required sample size is 385 (before allowing for non-response).', null, '[{"point": "Formula n = (zσ/E)² with z = 1.96, σ = 500, E = 50", "marks": 2}, {"point": "n = (1.96 x 500/50)² = 19.6² = 384.16 → round up to 385", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A problem in Statistics is given to five students - Sonam, Karma, Penjor, Choki and Tashi. Their chances of solving it are 1/6, 1/5, 1/4, 1/3 and 1/2 respectively. What is the probability that the problem will be solved? (5 marks)', 'The problem is solved if at least one student solves it. Assuming the students work independently, P(solved) = 1 - P(no one solves it). Probabilities of failing: Sonam 5/6, Karma 4/5, Penjor 3/4, Choki 2/3, Tashi 1/2. P(no one) = 5/6 x 4/5 x 3/4 x 2/3 x 1/2 = 120/720 = 1/6. Therefore P(solved) = 1 - 1/6 = 5/6 ≈ 0.833.', null, '[{"point": "P(solved) = 1 - P(none solves), assuming independence; failure probabilities 5/6, 4/5, 3/4, 2/3, 1/2", "marks": 2}, {"point": "P(none) = 5/6 x 4/5 x 3/4 x 2/3 x 1/2 = 1/6; P(solved) = 5/6 ≈ 0.833", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Assume X1, X2, ..., Xn are independent and identically distributed (iid) random variables with E(Xi) = μ and Var(Xi) = σ². Write/derive the distribution of the sample mean X̄. (5 marks)', 'X̄ = (1/n)(X1 + X2 + ... + Xn). Mean: E(X̄) = (1/n) Σ E(Xi) = (1/n)(nμ) = μ, so X̄ is unbiased for μ. Variance: because the Xi are independent, Var(X̄) = (1/n²) Σ Var(Xi) = (1/n²)(nσ²) = σ²/n, so the standard error is σ/√n. Distribution: if the Xi are normally distributed, X̄ is exactly normal, X̄ ~ N(μ, σ²/n) (a linear combination of independent normals is normal). For any distribution with finite variance, the Central Limit Theorem gives that, for large n (usually n ≥ 30), X̄ is approximately N(μ, σ²/n), i.e. (X̄ - μ)/(σ/√n) → N(0, 1).', null, '[{"point": "E(X̄) = (1/n)ΣE(Xi) = μ", "marks": 1.5}, {"point": "Var(X̄) = (1/n²)ΣVar(Xi) = σ²/n (independence)", "marks": 1.5}, {"point": "Distribution: if Xi normal, X̄ ~ N(μ, σ²/n) exactly; otherwise by the Central Limit Theorem X̄ is approximately N(μ, σ²/n) for large n (standard error σ/√n)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Testing customer preference for a new product
A company wants to assess whether the proportion of customers who prefer their new product is different from the proportion of customers who preferred their previous product. They conducted a survey with a sample of 400 customers. Of these, 180 indicated a preference for the new product. The company previously reported that 40% of their customers preferred the old product.
You are required to perform hypothesis testing on the proportion of customers who prefer the new product.

1. Formulate the hypothesis. Specify the significance level for this test. (10 marks)', 'Let p be the true proportion of customers who prefer the new product. Null hypothesis H0: p = 0.40 (no difference from the old product). Alternative hypothesis H1: p ≠ 0.40 (the proportion is different - a two-tailed test, because the company asks whether it is ''different'', not specifically higher). Significance level: α = 0.05, the conventional level balancing Type I and Type II errors; critical values z = ±1.96. Conditions: the sample is random, and np0 = 400 x 0.4 = 160 and n(1 - p0) = 240 are both at least 10, so the normal approximation to the binomial is valid.', null, '[{"point": "H0: p = 0.40 (proportion preferring new product equals old)", "marks": 3}, {"point": "H1: p ≠ 0.40 (two-tailed, since ''different'')", "marks": 3}, {"point": "Significance level α = 0.05 (stated and justified), critical values ±1.96; conditions np0 = 160, n(1-p0) = 240 ≥ 10, random sample", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case1', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Testing customer preference for a new product
A company wants to assess whether the proportion of customers who prefer their new product is different from the proportion of customers who preferred their previous product. They conducted a survey with a sample of 400 customers. Of these, 180 indicated a preference for the new product. The company previously reported that 40% of their customers preferred the old product.
You are required to perform hypothesis testing on the proportion of customers who prefer the new product.

2. Calculate the test statistic and compare it to its sampling distribution under the null hypothesis by calculating the p-value. What do you conclude at the level of significance decided? (15 + 5 marks) (20 marks)', 'Sample proportion p̂ = 180/400 = 0.45. Under H0 the standard error is √(p0(1 - p0)/n) = √(0.40 x 0.60/400) = √0.0006 = 0.0245. Test statistic: z = (p̂ - p0)/SE = (0.45 - 0.40)/0.0245 = 2.04. Under H0, z follows approximately the standard normal distribution. p-value (two-tailed) = 2 x P(Z > 2.04) = 2 x (1 - 0.9793) = 2 x 0.0207 ≈ 0.041. Conclusion: since the p-value 0.041 is less than α = 0.05 (equivalently |z| = 2.04 > 1.96), we reject H0. There is statistically significant evidence at the 5% level that the proportion of customers preferring the new product differs from 40%; the sample suggests it is higher (about 45%). The evidence is moderate - at α = 0.01 we would not reject H0.', null, '[{"point": "p̂ = 180/400 = 0.45", "marks": 3}, {"point": "SE under H0 = √(0.4 x 0.6/400) = √0.0006 = 0.0245", "marks": 4}, {"point": "z = (0.45 - 0.40)/0.0245 = 2.04", "marks": 4}, {"point": "p-value = 2 x P(Z > 2.04) = 2 x 0.0207 ≈ 0.041", "marks": 4}, {"point": "Conclusion: p-value 0.041 < 0.05 (|z| > 1.96) → reject H0; evidence that preference for the new product (45%) differs from 40% - higher; would not reject at α = 0.01", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case1', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Testing customer preference for a new product
A company wants to assess whether the proportion of customers who prefer their new product is different from the proportion of customers who preferred their previous product. They conducted a survey with a sample of 400 customers. Of these, 180 indicated a preference for the new product. The company previously reported that 40% of their customers preferred the old product.
You are required to perform hypothesis testing on the proportion of customers who prefer the new product.

3. Construct a 95% confidence interval for the proportion of customers who prefer the new product. Interpret the confidence interval in the context of the study. (10 marks)', 'Using the sample proportion: SE = √(p̂(1 - p̂)/n) = √(0.45 x 0.55/400) = √0.000619 = 0.0249. Margin of error = 1.96 x 0.0249 = 0.0488. 95% CI = 0.45 ± 0.049 = (0.401, 0.499), i.e. about 40.1% to 49.9%. Interpretation: we are 95% confident that the true proportion of all the company''s customers who prefer the new product lies between about 40% and 50%. The interval lies (just) above 0.40, which agrees with the test result that the preference differs from 40%, but the lower limit is very close to 40%, so the improvement may be small.', null, '[{"point": "SE = √(0.45 x 0.55/400) = 0.0249; margin = 1.96 x 0.0249 = 0.0488; CI = 0.45 ± 0.049 = (0.401, 0.499)", "marks": 6}, {"point": "Interpretation: 95% confident the true proportion preferring the new product is between about 40.1% and 49.9%; interval just excludes 0.40, consistent with the test", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case1', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Testing customer preference for a new product
A company wants to assess whether the proportion of customers who prefer their new product is different from the proportion of customers who preferred their previous product. They conducted a survey with a sample of 400 customers. Of these, 180 indicated a preference for the new product. The company previously reported that 40% of their customers preferred the old product.
You are required to perform hypothesis testing on the proportion of customers who prefer the new product.

4. Discuss how increasing the sample size would affect the test statistic and the confidence interval. Also explain why larger sample sizes generally provide more reliable results. (5 + 5 marks) (10 marks)', 'Effect: the standard error √(p(1 - p)/n) falls in proportion to 1/√n. With the same sample proportion of 0.45, a larger n gives a smaller SE and therefore a larger test statistic z (e.g. with n = 1600, SE under H0 = 0.0122 and z ≈ 4.1), a smaller p-value and a more powerful test; the confidence interval becomes narrower (with n = 1600 the margin is about ±0.024 instead of ±0.049), giving a more precise estimate. Why larger samples are more reliable: sampling variability is lower, so estimates are closer to the true population value (law of large numbers); the normal approximation and Central Limit Theorem work better; the test has higher power (lower chance of a Type II error); and the sample is more likely to represent the population''s variety. However, a larger sample does not correct bias from poor sampling design or non-response, and very large samples can make tiny, practically unimportant differences statistically significant.', null, '[{"point": "Larger n reduces SE (∝ 1/√n): for the same p̂, z becomes larger (more likely significant, more power), CI becomes narrower (more precise)", "marks": 5}, {"point": "Reliability: less sampling variability, estimates closer to true value (law of large numbers), better normal approximation (CLT), higher power/ lower Type II error, more representative - but does not remove bias", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case1', 4, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

1. Define the key objectives of the survey. (5 marks)', 'Objectives: (1) measure overall customer satisfaction with the app (e.g. satisfaction score and Net Promoter Score); (2) assess user experience - ease of registration and navigation, speed, reliability, security and trust, and usefulness of features (transfers, bill payments, QR payments); (3) identify problems and areas for improvement; (4) compare satisfaction across user groups (age, gender, urban/rural, device type, frequency of use); (5) understand usage patterns and reasons for non-use or drop-out; (6) provide evidence for decisions on app updates and customer support.', null, '[{"point": "Clear objectives: measure overall satisfaction (e.g. CSAT/ NPS), assess user experience (ease of use, speed, reliability, security, features), identify problems/ improvement areas, compare satisfaction across user groups, measure usage patterns and likelihood to recommend", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 1, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

2. Design a sampling strategy for the survey: identify the target population; describe the sampling method you would use and justify your choice; explain how you would ensure the sample is representative. (20 marks)', 'Target population: all customers registered on the mobile banking app who used it at least once in, say, the last three months (active users), with a separate small sample of registered but inactive users to learn why they stopped. Sampling frame: the bank''s database of registered users, which has contact details and characteristics (branch/ region, age, gender, transaction frequency). Method: stratified random sampling - divide users into strata by region (or branch), age group and usage frequency (light, medium, heavy), then select a simple random sample within each stratum with proportional allocation (and oversample small groups such as rural or older users if separate estimates are needed). Justification: the frame exists, so probability sampling is possible; stratification improves precision and guarantees all important groups are included; it is cheaper and faster than a census. Sample size: for a proportion with 95% confidence and ±5% margin, n = 1.96² x 0.5 x 0.5/0.05² ≈ 385; allowing for about 30% non-response and stratum analysis, select about 550-600 users. Ensuring representativeness: use an up-to-date, complete frame; random selection; adequate sample size; multiple reminders and follow-ups to reduce non-response; compare respondents with the user database; and apply weights (design weights and post-stratification) to correct imbalances.', null, '[{"point": "Target population: all registered/ active users of the app over a defined period (sampling frame from the bank''s user database), possibly also inactive users", "marks": 5}, {"point": "Method: stratified random sampling (strata by region, age group, gender, frequency of use/ customer type) with proportional or optimal allocation; justification - frame available, precision, subgroup estimates; sample size calculation (e.g. n = z²p(1-p)/E² = 385, adjusted for non-response)", "marks": 10}, {"point": "Representativeness: complete updated frame, random selection within strata, adequate sample size, follow-ups to reduce non-response, weighting/ post-stratification, compare sample profile with user database", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 2, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

3. Discuss the potential biases that might affect the survey results and suggest strategies to minimise them. (5 marks)', 'Possible biases: non-response bias (dissatisfied or busy customers may not reply); self-selection bias if the survey is just posted in the app; coverage bias (frame missing some users or excluding those who uninstalled); response bias such as social desirability or acquiescence; question wording and order effects; recall bias; and interviewer bias in phone interviews. Strategies: use random probability sampling rather than volunteers; send reminders, use short questionnaires and small incentives; follow up non-respondents and weight the data; pre-test neutral, clear questions with balanced scales; guarantee anonymity and confidentiality; use mixed modes (in-app, SMS link, phone) and train interviewers.', null, '[{"point": "Biases: non-response, self-selection, coverage/ frame (excluding inactive or non-smartphone users), response/ social desirability, question wording/ order, recall, interviewer bias", "marks": 3}, {"point": "Strategies: random sampling, reminders/ incentives, weighting, neutral pre-tested questions, anonymity, multiple modes, interviewer training", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 3, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

4. Data collection and analysis plan: explain how you would collect the data; discuss data collection tools; discuss the data entry and pre-processing steps required before performing statistical analysis. (10 marks)', 'Data collection: a structured questionnaire with sections on usage, satisfaction (5-point Likert scales), specific features, problems faced, likelihood to recommend (0-10 NPS) and open-ended suggestions; pilot-test it on about 30 users and revise. Send the survey link by SMS/email/in-app notification to the sampled users, with telephone interviews for those who do not respond after reminders, over a fixed 3-4 week period. Tools: computer-assisted web interviewing (CAWI) and telephone interviewing (CATI) software such as KoboToolbox, ODK, Survey Solutions or Google Forms, with built-in skip logic and range/consistency checks; analysis in SPSS, Stata, R or Excel. Data entry and pre-processing: export data from the platform (or double-enter paper forms); check completeness and response rates; remove duplicates; check for out-of-range values, inconsistencies and straight-lining; code open-ended responses into themes; handle missing data (imputation or exclusion rules); recode and create derived variables (satisfaction index, NPS categories); apply sampling weights; check scale reliability (Cronbach''s alpha); then analyse with descriptive statistics, cross-tabulations by subgroup, chi-square tests or t-tests/ANOVA, and regression to find drivers of satisfaction.', null, '[{"point": "Collection: mode (online/ in-app questionnaire via link, phone interviews for non-respondents), period, pre-testing/ pilot, structured questionnaire with Likert scales and open questions", "marks": 3}, {"point": "Tools: CAPI/ CATI/ CAWI software (KoboToolbox, ODK, Survey Solutions, Google Forms), with validation checks; analysis software (SPSS, Stata, R)", "marks": 3}, {"point": "Pre-processing: data entry/ export, checking completeness, cleaning (duplicates, out-of-range, inconsistencies), coding open answers, handling missing data, weighting, creating variables/ indices, reliability check (Cronbach''s alpha); then descriptive and inferential analysis", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 4, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

5. Ethical considerations. (5 marks)', 'Ethical considerations: obtain informed consent - explain the purpose, time needed and that participation is voluntary, with the right to skip questions or withdraw; protect confidentiality and anonymity - do not link answers to account details in reports, store data securely with restricted access and follow data protection rules on customer information; avoid harm or pressure (participation must not affect their banking services); use the data only for the stated purpose; obtain the institution''s approval; never ask for passwords or PINs (and warn users against phishing); and report results honestly.', null, '[{"point": "Informed consent and voluntary participation, confidentiality/ anonymity and data protection (customer data, secure storage), no harm/ no pressure, transparency of purpose, use data only for stated purpose, approval/ permissions, honest reporting", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 5, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Survey of customer satisfaction with a mobile banking app
You are tasked with designing a survey to evaluate customer satisfaction for a newly launched mobile banking app by a financial institution. The goal of the survey is to gather feedback on user experience, identify areas for improvement and assess overall satisfaction. You may adopt the following structure.

6. Outline an overall work plan for survey administration. (5 marks)', 'Work plan (about 12 weeks): Weeks 1-2 - planning: objectives, budget, team and approvals; Weeks 3-4 - questionnaire design, sampling frame and sample selection, programming the tool; Week 5 - pilot test and revision, training of enumerators; Weeks 6-8 - data collection with reminders, phone follow-ups and daily quality monitoring; Weeks 9-10 - data cleaning, weighting and analysis; Weeks 11-12 - report writing, presentation of findings and recommendations to management, and dissemination. Responsibilities, resources and milestones are set out in a Gantt chart.', null, '[{"point": "Phases with timeline and responsibilities: planning (objectives, budget, team), questionnaire design and pre-test, sampling, training, fieldwork/ data collection with monitoring, data processing, analysis, reporting and dissemination (e.g. Gantt chart over ~3 months)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Statistics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-stat2024-case2', 6, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If A and B are independent events with P(A) = 0.3 and P(B) = 0.5, then P(A ∩ B) is', null, 'For independent events P(A ∩ B) = P(A) x P(B) = 0.15.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'statistics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Statistics): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'statistics'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.65', false, 1), ('B', '0.15', true, 2), ('C', '0.8', false, 3), ('D', '0.2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
