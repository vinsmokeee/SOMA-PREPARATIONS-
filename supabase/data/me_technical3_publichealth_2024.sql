-- ME Paper III (Technical, Public Health): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'public-health', 'Public Health' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'public-health') is null then raise exception 'unknown specialisation public-health'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a core function of public health?', null, 'Core public health functions are assessment, policy development and assurance (promotion, prevention, surveillance); direct healthcare delivery is a clinical service.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Surveillance and monitoring of health threats', false, 1), ('B', 'Healthcare delivery', true, 2), ('C', 'Policy development to improve health outcomes', false, 3), ('D', 'Health promotion and disease prevention', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The World Health Organization (WHO) focuses on all of the following EXCEPT:', null, 'WHO sets norms, leads global health action and monitors trends; it does not provide individual medical care.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Providing individual medical care', true, 1), ('B', 'Promoting mental health awareness', false, 2), ('C', 'Eradicating infectious diseases', false, 3), ('D', 'Monitoring global health trends', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Ottawa Charter for Health Promotion emphasizes the importance of:', null, 'Building healthy public policy is one of the Ottawa Charter''s five action areas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Creating healthy public policies', true, 1), ('B', 'Technological advancements in medicine', false, 2), ('C', 'Focusing solely on individual behavior change', false, 3), ('D', 'Limiting access to unhealthy foods and beverages', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Bradford Hill criteria are used to assess:', null, 'Bradford Hill criteria (strength, consistency, temporality, dose-response, etc.) assess causation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The validity of a diagnostic test.', false, 1), ('B', 'The generalizability of research findings.', false, 2), ('C', 'The effectiveness of an intervention.', false, 3), ('D', 'Causality between a suspected risk factor and a disease.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The dependent variable in a research study is the one that is:', null, 'The dependent variable is the outcome that is measured; the independent variable is manipulated.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Both A and B.', false, 1), ('B', 'Neither A nor B.', false, 2), ('C', 'Measured or observed.', true, 3), ('D', 'Manipulated by the researcher.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When conducting a literature review, the goal is to:', null, 'A literature review identifies and critically evaluates existing research.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Find one perfect source to answer your research question.', false, 1), ('B', 'Focus only on the most recent research.', false, 2), ('C', 'Summarize all the information you find', false, 3), ('D', 'Identify and critically evaluate existing research on your topic.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a measure of disease frequency?', null, 'Case fatality rate measures severity (deaths among cases), not how often disease occurs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Attack rate', false, 1), ('B', 'Case fatality rate', true, 2), ('C', 'Incidence', false, 3), ('D', 'Prevalence', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A study follows a group of individuals forward in time to assess risk factors for a specific disease. This is an example of which epidemiological study design?', null, 'Following people forward in time from exposure to outcome is a cohort study.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Case-control study', false, 1), ('B', 'Cohort study', true, 2), ('C', 'Cross-sectional study', false, 3), ('D', 'Ecological study', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A case-control study is most useful for:', null, 'Case-control studies efficiently identify risk factors, especially for rare diseases.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Determining the incidence of a disease.', false, 1), ('B', 'Evaluating the effectiveness of an intervention.', false, 2), ('C', 'Identifying potential risk factors for a disease.', true, 3), ('D', 'Studying the natural history of a disease.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When conducting health research, which principle ensures that a study measures what it is intended to measure?', null, 'Validity: the study or tool measures what it intends to measure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Validity', true, 1), ('B', 'Generalizability', false, 2), ('C', 'Sensitivity', false, 3), ('D', 'Reliability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a screening test, a high sensitivity means the test is good at identifying:', null, 'Sensitivity is the ability to correctly identify those with the disease (true positives).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'True negative cases', false, 1), ('B', 'False positive cases', false, 2), ('C', 'False negative cases', false, 3), ('D', 'True positive cases', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A health education program focuses on teaching teenagers about the negative health consequences of smoking. This program is most aligned with which level of prevention?', null, 'Preventing smoking before disease develops is primary prevention.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Primary Prevention', true, 1), ('B', 'Secondary Prevention', false, 2), ('C', 'Health Education is not considered prevention', false, 3), ('D', 'Tertiary Prevention', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a large portion of a population is immune to a disease, it reduces the likelihood of susceptible individuals encountering infected individuals. This is known as:', null, 'Herd immunity: immunity in a large proportion of the population protects the susceptible.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Specificity', false, 1), ('B', 'Herd immunity', true, 2), ('C', 'Passive immunity', false, 3), ('D', 'Active immunity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Surveillance is an essential tool for:', null, 'Surveillance detects outbreaks, monitors trends and evaluates interventions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Monitoring trends in disease burden.', false, 1), ('B', 'Identifying disease outbreaks.', false, 2), ('C', 'All of the above.', true, 3), ('D', 'Evaluating the effectiveness of public health interventions.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Public health interventions to reduce childhood obesity might focus on:', null, 'Promoting physical activity in schools is an evidence-based obesity intervention.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Limiting regulations on fast food advertising', false, 1), ('B', 'Increasing access to processed foods', false, 2), ('C', 'Promoting physical activity in schools', true, 3), ('D', 'Encouraging sugary drinks as a source of energy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is one disadvantage of passive public health surveillance system?', null, 'Passive surveillance relies on routine reports from providers, so under-reporting is common.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Underreporting of cases can occur.', true, 1), ('B', 'It is not well-suited for monitoring chronic diseases.', false, 2), ('C', 'It requires a significant investment of resources.', false, 3), ('D', 'It provides real-time data on disease outbreaks.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Effective communication strategies are essential for promoting healthy behaviors and reducing NCD risk. These strategies should be:', null, 'Health communication should be culturally appropriate, evidence-based, clear and engaging.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', true, 1), ('B', 'Evidence-based and clear', false, 2), ('C', 'Culturally appropriate and tailored to the target audience', false, 3), ('D', 'Engaging and interactive', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A public health professional notices a cluster of foodborne illness cases in a specific town. This observation is most likely indicative of an:', null, 'A cluster of cases above expected numbers in one place is an epidemic (outbreak).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Endemic disease', false, 1), ('B', 'Epidemic', true, 2), ('C', 'Sporadic case', false, 3), ('D', 'Pandemic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary purpose of an occupational safety and health program is to:', null, 'Occupational safety and health programmes aim to prevent work-related injuries and illnesses.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase worker productivity', false, 1), ('B', 'Prevent work-related injuries and illnesses', true, 2), ('C', 'Improve company profits', false, 3), ('D', 'Reduce absenteeism due to illness', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan''s traditional medicine system, known as Sowa Rigpa, is:', null, 'Bhutan integrates traditional medicine (Sowa Rigpa) with modern medicine in its national health system.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gradually being phased out in favor of modern medicine', false, 1), ('B', 'Neglected due to lack of scientific evidence', false, 2), ('C', 'Only practiced by religious figures', false, 3), ('D', 'Integrated into the national healthcare system alongside modern medicine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan''s national lockdown strategy during the COVID-19 pandemic was primarily focused on:', null, 'Lockdowns restricted movement to limit transmission.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Encouraging herd immunity', false, 1), ('B', 'Prioritizing economic activity', false, 2), ('C', 'Restricting movement to limit transmission', true, 3), ('D', 'Isolating positive cases', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A veterinarian in Bhutan notices a recent increase in unusual cattle deaths. Which of the following actions is MOST appropriate?', null, 'Unusual animal deaths may signal a zoonotic threat: report for joint investigation (One Health).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ignore the outbreak as it is likely not a public health concern', false, 1), ('B', 'Continue treating cattle with existing medications', false, 2), ('C', 'Advise farmers to sell their cattle immediately', false, 3), ('D', 'Report the outbreak to public health authorities for investigation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The EPI program in Ministry of Health Bhutan is an example of which public health strategy?', null, 'Immunisation (Expanded Programme on Immunization) is preventive healthcare.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Preventive healthcare', true, 1), ('B', 'Hospital-based care', false, 2), ('C', 'Health education campaigns', false, 3), ('D', 'Treatment of infectious diseases', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan is working towards achieving Universal Health Coverage (UHC). This means:', null, 'UHC: everyone can use the essential health services they need without financial hardship.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Main emphasis of focus is on preventive healthcare', false, 1), ('B', 'Prioritizes specialized care over basic services.', false, 2), ('C', 'Everyone has access to essential healthcare services without financial hardship.', true, 3), ('D', 'Only citizens have access to healthcare services.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the epidemiological triad, and how does it apply to understanding communicable diseases? (5 marks)', 'The epidemiological triad is a model of disease causation in which disease results from the interaction of three components: the agent (the cause - for communicable diseases a pathogen such as a virus, bacterium or parasite, with its infectivity, virulence and dose); the host (the human who can be infected - age, sex, immunity, nutrition, genetics, behaviour); and the environment (external factors that bring agent and host together - climate, water, sanitation, crowding, housing, vectors, socio-economic conditions). Vectors and time are sometimes added. Application: it explains why disease occurs and how it spreads, and shows where to intervene. For example, in malaria the agent is Plasmodium, the host is a non-immune person, and the environment includes Anopheles mosquitoes and stagnant water; control targets the agent (prompt treatment), the host (bed nets, prophylaxis) and the environment (indoor residual spraying, removing breeding sites). Breaking any link of the triad can prevent disease.', null, '[{"point": "Triad: agent (pathogen - virulence, infectivity, dose), host (age, immunity, nutrition, behaviour, genetics), environment (physical, biological - vectors, social: crowding, sanitation); disease results from their interaction; vector/ time sometimes added", "marks": 3}, {"point": "Application with an example (e.g. malaria, TB, diarrhoea): explains transmission, guides control by acting on agent (treatment, disinfection), host (vaccination, nutrition), environment (water, sanitation, vector control)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Briefly explain the concept of contact tracing in the context of communicable disease control. (5 marks)', 'Contact tracing is the process of identifying, assessing and managing people who have been exposed to a person with an infectious disease (the index case) so as to prevent further transmission. Steps: (1) interview the confirmed case to identify everyone they were in close contact with during the infectious period; (2) list and locate the contacts and inform them of possible exposure, confidentially; (3) assess and manage them - testing, quarantine or isolation, post-exposure prophylaxis or vaccination, or treatment; (4) monitor contacts for symptoms for the incubation period and test those who become ill, tracing their contacts in turn. It breaks chains of transmission, finds cases early, and is used for TB, COVID-19 (widely used in Bhutan), measles, Ebola and sexually transmitted infections.', null, '[{"point": "Definition: identifying, listing and following up people who have been in contact with an infected person (index case) during the infectious period", "marks": 2}, {"point": "Steps and purpose: case interview, contact identification, notification, quarantine/ testing/ prophylaxis/ treatment, monitoring for symptoms; breaks transmission chains (e.g. TB, COVID-19, Ebola, STIs); confidentiality", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
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
  values ('ME', 'short_answer', 'Define and differentiate between passive and active public health surveillance systems. (5 marks)', 'Passive surveillance: health facilities and providers report cases of notifiable diseases to the health authority routinely, on their own initiative, using standard forms or electronic systems (e.g. the national notifiable disease reporting system). It is simple, inexpensive and covers many diseases and areas, but suffers from under-reporting, incomplete data and delays. Active surveillance: the health authority regularly and actively seeks out cases - by visiting facilities, telephoning providers, reviewing records, house-to-house case finding or sentinel sites. It gives more complete, accurate and timely data but needs more staff and money, so it is used for specific purposes such as outbreak investigation, disease elimination and eradication programmes (e.g. acute flaccid paralysis surveillance for polio, measles elimination) and special studies.', null, '[{"point": "Passive: health facilities routinely report notifiable diseases to the health authority without being prompted; cheap, wide coverage, but under-reporting, incomplete, delayed", "marks": 2.5}, {"point": "Active: the health authority actively seeks cases (visits, calls, record searches, case finding); more complete and timely but costly, used in outbreaks, elimination programmes (e.g. AFP for polio)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
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
  values ('ME', 'short_answer', 'List and briefly explain three strategies used in NCD prevention and control. (5 marks)', '1. Health promotion and reducing risk factors: tackle tobacco use, harmful alcohol use, unhealthy diet and physical inactivity through policies and education - tobacco and alcohol taxes and bans, salt reduction, food labelling, promoting physical activity and healthy diets in schools and workplaces (WHO ''best buys''). 2. Early detection and management in primary health care: screening for hypertension, diabetes and cancers (cervical, breast, oral) and providing treatment and follow-up using packages such as the WHO Package of Essential NCD interventions (PEN) at primary health centres, plus ensuring essential medicines. 3. Surveillance, research and multisectoral action: monitor risk factors and NCDs through surveys such as STEPS, set national targets and action plans, and engage sectors beyond health (education, agriculture, trade, transport, urban planning) and communities.', null, '[{"point": "Three strategies explained, e.g. (1) health promotion and risk factor reduction - tobacco, alcohol, diet, physical activity (policies: taxes, bans, labelling - WHO best buys); (2) early detection/ screening and management at primary care (WHO PEN - BP, diabetes, cancer screening); (3) surveillance/ monitoring (STEPS), multisectoral action and health system strengthening", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
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
  values ('ME', 'passage', 'Case I: Health determinants and health promotion
Health determinants and promotion are two sides of the same coin which work together to influence the overall health and well-being of individuals and communities. Health determinants influence health promotion activities. These are the various factors that influence a person''s health status. By understanding and addressing the various determinants of health, and implementing effective health promotion strategies, we can create a society where everyone has the opportunity to live a healthy life.

1. Discuss the concept of the social determinants of health (SDOH) and how they influence population health outcomes. Provide specific examples of how SDOH can impact health disparities. (20 marks)', 'Concept: the social determinants of health are the non-medical conditions in which people are born, grow, live, work and age, and the wider forces (economic policies, social norms, political systems) that shape these conditions (WHO Commission on Social Determinants of Health, 2008). Structural determinants - income, education, occupation, social class, gender and ethnicity - determine people''s position in society; intermediary determinants - living and working conditions, housing, food, water and sanitation, psychosocial factors, behaviours and access to health care - translate that position into health. The Dahlgren-Whitehead ''rainbow'' shows layers from individual factors to lifestyle, social networks, living and working conditions and broad socio-economic, cultural and environmental conditions. Influence on outcomes: SDOH explain most differences in health between and within countries; they act through material conditions (nutrition, housing), behaviours (smoking, alcohol, diet), chronic stress and access to services, producing a social gradient - the lower the position, the worse the health. Examples of disparities: (1) poverty - poor households have more child stunting and malnutrition and cannot afford travel to care; (2) education - children of mothers with little education have higher infant mortality and lower immunisation; (3) geography - remote rural communities in Bhutan have longer travel times to hospitals, affecting maternal and emergency care; (4) housing and crowding - higher TB and respiratory infections; (5) water and sanitation - diarrhoeal disease; (6) gender - violence against women and unequal decision-making; (7) unemployment - youth mental health problems, alcohol and drug use; (8) occupation - injuries and exposures among construction and hydropower workers. Addressing them requires intersectoral action and ''health in all policies'' (in Bhutan, linked to GNH).', null, '[{"point": "Concept: conditions in which people are born, grow, live, work and age, shaped by distribution of money, power and resources (WHO CSDH); structural vs intermediary determinants; Dahlgren-Whitehead rainbow", "marks": 6}, {"point": "Domains and pathways: income/ poverty, education, employment/ working conditions, housing, water and sanitation, food security, social support/ inclusion, gender, access to health care, environment; act via material conditions, behaviours, psychosocial stress, access", "marks": 7}, {"point": "Examples of disparities: rural-urban access, poverty and child stunting/ malnutrition, education and maternal/ child mortality, crowding and TB, gender and violence, unemployment and mental health/ alcohol; Bhutan context; need for intersectoral action/ health in all policies", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case1', 1, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Health determinants and health promotion
Health determinants and promotion are two sides of the same coin which work together to influence the overall health and well-being of individuals and communities. Health determinants influence health promotion activities. These are the various factors that influence a person''s health status. By understanding and addressing the various determinants of health, and implementing effective health promotion strategies, we can create a society where everyone has the opportunity to live a healthy life.

2. Explain the core principles of health promotion and provide examples of each. (15 marks)', 'Health promotion is ''the process of enabling people to increase control over, and to improve, their health'' (Ottawa Charter, 1986). Its core strategies are to advocate, enable and mediate, and its five action areas/principles are: (1) Build healthy public policy - laws and policies that make healthy choices easier, e.g. Bhutan''s Tobacco Control Act, alcohol taxes, salt and sugar policies, helmet and seat-belt laws. (2) Create supportive environments - physical and social settings that support health, e.g. smoke-free public places, healthy schools with clean water and toilets, safe walking paths and open-air gyms. (3) Strengthen community action - empowering communities to set priorities and act, e.g. village health workers, community-led total sanitation, youth groups running anti-drug campaigns. (4) Develop personal skills - information, education and life skills, e.g. school health education on nutrition, sexual and reproductive health, mental health literacy, cooking demonstrations. (5) Reorient health services - from treatment towards prevention and promotion, e.g. NCD screening and counselling at primary health centres, health promotion units in hospitals. Underlying principles are equity, empowerment, participation, intersectoral collaboration, a holistic view of health, and sustainability.', null, '[{"point": "Principles (Ottawa Charter 5 action areas): build healthy public policy, create supportive environments, strengthen community action, develop personal skills, reorient health services; prerequisites and strategies enable, mediate, advocate", "marks": 8}, {"point": "Examples for each (e.g. tobacco control act, smoke-free/ healthy schools, community health groups/ village health workers, life skills and health education, primary care focused on prevention/ PEN); also equity, empowerment, participation, intersectoral, sustainability", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case1', 2, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Health determinants and health promotion
Health determinants and promotion are two sides of the same coin which work together to influence the overall health and well-being of individuals and communities. Health determinants influence health promotion activities. These are the various factors that influence a person''s health status. By understanding and addressing the various determinants of health, and implementing effective health promotion strategies, we can create a society where everyone has the opportunity to live a healthy life.

3. Discuss the role of health communication in promoting healthy behaviours. How can health communication be tailored to different target audiences? (15 marks)', 'Role of health communication: it informs and educates people about health risks and benefits, raises awareness, shapes attitudes and social norms, motivates people to adopt and maintain healthy behaviours (e.g. quitting tobacco, eating healthily, getting vaccinated), teaches skills, promotes the use of services (screening, ANC), counters misinformation, advocates for supportive policies, and provides risk communication during emergencies (as during COVID-19). It works best when based on behaviour change theories (health belief model, stages of change, social cognitive theory) and combined with other interventions. Tailoring to audiences: (1) audience research and segmentation - understand each group''s knowledge, beliefs, needs, literacy and preferred channels; (2) culturally appropriate messages in the right language (Dzongkha, Sharchopkha, Lhotshamkha, English) using local examples and values; (3) age-appropriate approaches - youth through social media, influencers, peer educators and schools; adults through workplaces and TV; elderly and rural people through radio, community meetings and face-to-face talks by health workers; (4) gender-sensitive messages and channels; (5) trusted messengers - religious figures, local leaders, teachers and health workers; (6) simple, clear, pictorial materials for low-literacy groups; (7) pre-testing materials with the audience and using two-way, participatory communication; (8) monitoring and evaluating reach and impact and adjusting.', null, '[{"point": "Role: raises awareness and knowledge, changes attitudes and norms, motivates and reinforces behaviour, demonstrates skills, promotes services, counters misinformation, supports policy (advocacy), risk communication in emergencies; theories (health belief model, stages of change)", "marks": 7}, {"point": "Tailoring: audience analysis/ segmentation, culturally and linguistically appropriate (Dzongkha, local languages), literacy, age (youth - social media, peers; elderly - radio, face-to-face), gender, rural/ urban channels, trusted messengers (religious figures, local leaders), pre-testing, two-way participatory, evaluation", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case1', 3, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Epidemiology and research
Epidemiology and research are the cornerstones of public health. Epidemiology provides the foundation for public health action by identifying health problems and their causes. Public health research builds on this knowledge by developing and testing solutions to these problems. This combined approach allows public health professionals to target interventions effectively, leading to improved health outcomes for communities.

1. Explain the core principles of epidemiology and how they are used to investigate and control disease outbreaks. (15 marks)', 'Core principles: epidemiology studies the distribution and determinants of health-related states in specified populations and applies this to control health problems. (1) Population focus - the community is the patient. (2) Distribution - descriptive epidemiology by person (age, sex, occupation), place and time. (3) Frequency measures - counts, incidence, prevalence, attack rates, mortality. (4) Determinants - analytic epidemiology compares groups to find risk factors and causes (measures of association: relative risk, odds ratio), considering bias, confounding and chance, and judging causation (Bradford Hill). (5) Application - using findings to prevent and control disease. Use in outbreaks: (1) prepare for fieldwork; (2) confirm the outbreak (cases above expected) and verify the diagnosis with laboratory tests; (3) set a case definition; (4) find and count cases (line list); (5) describe the outbreak by time (epidemic curve showing source type), place (spot map) and person; (6) develop hypotheses about source and mode of transmission; (7) test them with analytic studies (case-control or cohort, e.g. food-specific attack rates); (8) implement control and prevention measures (remove the source, treat cases, isolate, vaccinate, improve water and food hygiene) - often early, alongside investigation; (9) communicate findings and recommendations; (10) maintain surveillance to confirm the outbreak has ended and evaluate measures.', null, '[{"point": "Core principles: distribution (person, place, time - descriptive), determinants (analytic - causes, risk factors), frequency measures (incidence, prevalence, attack rates), comparison/ association, population focus, causation, application to control", "marks": 7}, {"point": "Outbreak investigation steps: prepare, confirm outbreak and diagnosis, case definition, case finding, descriptive epidemiology (epi curve, maps, person characteristics), hypotheses, analytic study (case-control/ cohort), control measures, communicate findings, surveillance/ evaluation", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case2', 1, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Epidemiology and research
Epidemiology and research are the cornerstones of public health. Epidemiology provides the foundation for public health action by identifying health problems and their causes. Public health research builds on this knowledge by developing and testing solutions to these problems. This combined approach allows public health professionals to target interventions effectively, leading to improved health outcomes for communities.

2. Explain the role of epidemiology in public health research. Discuss how epidemiological studies can be used to inform interventions aimed at improving population health. (15 marks)', 'Role of epidemiology in public health research: it measures the burden, distribution and trends of diseases (descriptive studies, surveillance, cross-sectional surveys); identifies causes and risk factors (case-control and cohort studies); describes the natural history and prognosis of disease; identifies high-risk groups; tests interventions (randomised controlled trials, community trials) and evaluates programmes and health services; and provides the evidence base for policy, planning and resource allocation. Informing interventions: (1) cohort and case-control studies linking smoking to lung cancer and heart disease led to tobacco control laws and taxes; (2) risk factor surveys such as the WHO STEPS survey show the prevalence of hypertension, raised blood sugar, alcohol and tobacco use in Bhutan, guiding NCD screening and health promotion priorities; (3) vaccine trials and surveillance data shape immunisation schedules (e.g. HPV vaccination to prevent cervical cancer); (4) mapping malaria and TB cases directs vector control and case finding to high-risk districts; (5) nutrition surveys revealing stunting and anaemia lead to fortification and supplementation programmes; (6) evaluation studies show which programmes work and allow them to be improved, scaled up or stopped. Thus epidemiology turns data into targeted, cost-effective action.', null, '[{"point": "Role: measure burden and trends, identify causes/ risk factors, natural history, identify high-risk groups, evaluate interventions and services, provide evidence for policy and planning; study designs (descriptive, cross-sectional, case-control, cohort, RCT)", "marks": 7}, {"point": "Informing interventions with examples: smoking-lung cancer → tobacco control; STEPS survey → NCD programmes; trials → vaccines; surveillance → targeted malaria/ TB control; evaluation of programmes; priority setting and resource allocation", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case2', 2, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Epidemiology and research
Epidemiology and research are the cornerstones of public health. Epidemiology provides the foundation for public health action by identifying health problems and their causes. Public health research builds on this knowledge by developing and testing solutions to these problems. This combined approach allows public health professionals to target interventions effectively, leading to improved health outcomes for communities.

3. Identify an area of public health research that interests you, with brief justifications. Explain how your research skills and knowledge could be applied to conduct a study and contribute to this field. (20 marks)', 'Example: Area - harmful alcohol use among adults in Bhutan. Justification: alcohol-related liver disease is a major cause of hospital deaths and illness, alcohol is linked to road traffic injuries, domestic violence and mental health problems, and there are gaps in evidence about drinking patterns and their drivers in different communities; it is a national health priority. Study plan: research question - what is the prevalence of harmful alcohol use and its associated factors among adults aged 18-69 in a selected Dzongkhag? Objectives - estimate prevalence using AUDIT, identify socio-demographic and social factors, and assess awareness of services. Design - community-based cross-sectional study with a qualitative component (focus groups) to understand cultural drivers. Population and sampling - multistage cluster sampling of households; sample size by formula n = z²p(1-p)/d² with design effect and non-response (about 400-600). Data collection - trained enumerators using a structured questionnaire on tablets (KoboToolbox) with AUDIT, demographic and social variables. Analysis - descriptive statistics, prevalence with 95% CI, chi-square tests and multivariable logistic regression in Stata or R; thematic analysis for qualitative data. Ethics - approval from the Research Ethics Board of Health, informed consent, confidentiality, referral of people with alcohol problems to services. Contribution: I would apply my skills in epidemiological study design, biostatistics, data management, literature review and report writing; share findings with the Ministry of Health, Dzongkhag health sector and BNCA through reports, policy briefs and publications; and help design targeted interventions such as brief interventions in primary care, community awareness and policy measures (licensing, taxation). Limitations such as self-reporting bias would be acknowledged.', null, '[{"point": "A relevant research area identified (e.g. NCD risk factors, mental health/ suicide, alcohol use, maternal and child nutrition, road safety, climate and health in Bhutan) with justification: burden, gaps in evidence, national priorities", "marks": 6}, {"point": "Study plan: research question and objectives, design (e.g. cross-sectional/ case-control/ cohort/ mixed methods), population and sampling, sample size, data collection tools, variables, analysis plan (statistics/ software), ethics (approval, consent, confidentiality)", "marks": 9}, {"point": "Contribution: application of skills (epidemiology, biostatistics, data management, literature review, report writing), dissemination to policy makers, how findings inform programmes; feasibility and limitations", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Public Health", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ph2024-case2', 3, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which study design provides the strongest evidence of a cause-and-effect relationship?', null, 'Randomisation balances confounders, so RCTs give the strongest causal evidence among single studies.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Randomised controlled trial', true, 1), ('B', 'Ecological study', false, 2), ('C', 'Cross-sectional study', false, 3), ('D', 'Case report', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a stable situation, prevalence is approximately equal to', null, 'P ≈ I x D: longer-lasting diseases have higher prevalence for the same incidence.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'attack rate x population', false, 1), ('B', 'incidence x average duration of disease', true, 2), ('C', 'incidence / mortality', false, 3), ('D', 'incidence - case fatality', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The specificity of a screening test is its ability to correctly identify', null, 'Specificity = true negatives / all without disease.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the prevalence', false, 1), ('B', 'all positive results', false, 2), ('C', 'people with the disease', false, 3), ('D', 'people without the disease', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ''iceberg of disease'' concept means that', null, 'The submerged part of the iceberg represents undiagnosed, subclinical and carrier cases.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'only severe cases matter', false, 1), ('B', 'diseases spread from cold regions', false, 2), ('C', 'the hidden (undiagnosed or subclinical) cases far outnumber the visible clinical cases', true, 3), ('D', 'most diseases are seasonal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The measure of association usually calculated in a cohort study is the', null, 'Cohort studies measure incidence in exposed and unexposed groups, giving the relative risk.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'odds ratio only', false, 1), ('B', 'relative risk', true, 2), ('C', 'prevalence ratio of cases only', false, 3), ('D', 'case fatality rate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Alma-Ata Declaration of 1978 is associated with', null, 'Alma-Ata declared primary health care the key to ''Health for All''.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'public-health'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Public Health): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'public-health'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the eradication of smallpox', false, 1), ('B', 'tobacco control', false, 2), ('C', 'the International Health Regulations', false, 3), ('D', 'primary health care', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
commit;
