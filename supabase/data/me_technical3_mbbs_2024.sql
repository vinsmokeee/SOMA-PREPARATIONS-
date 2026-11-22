-- ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'mbbs-medicine', 'MBBS / Medicine' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'mbbs-medicine') is null then raise exception 'unknown specialisation mbbs-medicine'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is NOT a risk factor for coronary artery disease in patients with hyperlipidemia', null, 'High HDL is protective; smoking, hypertension and family history are risk factors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypertension', false, 1), ('B', 'Family history of premature CAD', false, 2), ('C', 'High HDL', true, 3), ('D', 'Cigarette smoking', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Identify the live vaccines from the following', null, 'BCG and MMR are live attenuated vaccines; IPV and pentavalent are inactivated/ subunit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'MMR and IPV', false, 1), ('B', 'MMR and Pentavalent', false, 2), ('C', 'BCG and IPV', false, 3), ('D', 'BCG and MMR', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Common side effect of amlodipine is', null, 'Ankle oedema (peripheral vasodilatation) is the common side effect of amlodipine; dry cough is from ACE inhibitors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Edema', true, 1), ('B', 'Palpitation', false, 2), ('C', 'Hepatitis', false, 3), ('D', 'Dry cough', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most common cause of death after acute MI is', null, 'Ventricular fibrillation (arrhythmia) is the most common cause of death after acute MI, mostly early.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ventricular fibrillation', true, 1), ('B', 'Cardiac rupture', false, 2), ('C', 'Ventricular septal rupture.', false, 3), ('D', 'Pulmonary failure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What part of the brain generates spontaneous breathing.', null, 'The respiratory centres generating the basic rhythm are in the medulla (modulated by the pons).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pons', false, 1), ('B', 'Medulla', true, 2), ('C', 'Cerebellum', false, 3), ('D', 'Cerebrum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Chronic bronchitis is defined as', null, 'Chronic bronchitis: productive cough for at least 3 months in each of 2 consecutive years.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Productive cough for at least 3 consecutive months in 3 consecutive years.', false, 1), ('B', 'Productive cough for at least 3 consecutive months in 2 consecutive years.', true, 2), ('C', 'Productive cough for at least 2 consecutive months in 3 consecutive years.', false, 3), ('D', 'Productive cough for at least 2 consecutive months in 2 consecutive years.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sinusoidal cause of esophageal varices is', null, 'Cirrhosis is the sinusoidal cause of portal hypertension; portal vein thrombosis is pre-hepatic, hepatic vein thrombosis post-hepatic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cirrhosis', true, 1), ('B', 'Portal vein thrombosis', false, 2), ('C', 'Hepatic vein thrombosis.', false, 3), ('D', 'Portal biliary thrombosis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Vitamin B12 requires intrinsic factor for absorption produced by', null, 'Intrinsic factor is secreted by parietal cells of the stomach.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Duodenum', false, 1), ('B', 'Caecum', false, 2), ('C', 'Small intestine', false, 3), ('D', 'Stomach', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Normal BMI is', null, 'Normal BMI is 18.5-24.9 kg/m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '25 -29.5 Kg/m2', false, 1), ('B', '18.6 -24.9 gm/m2', false, 2), ('C', 'less than 18.5 Kg/m2', false, 3), ('D', '18.6 -24.9 Kg/m2', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the treatment of Helicobacter pylori, the dose of amoxicillin is', null, 'Amoxicillin 1 g twice daily is used in standard H. pylori triple therapy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1000 mg daily', false, 1), ('B', '1000 mg twice daily', true, 2), ('C', '500 mg twice a day', false, 3), ('D', '500 mg daily.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of chronic pancreatitis is', null, 'Alcohol is the most common cause of chronic pancreatitis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Metabolic', false, 1), ('B', 'Autoimmune', false, 2), ('C', 'Alcohol', true, 3), ('D', 'Genetic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common gallstone is', null, 'Cholesterol stones are the most common gallstones.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cholesterol', true, 1), ('B', 'Brown calcium salts.', false, 2), ('C', 'Black calcium bilibrubinate', false, 3), ('D', 'Pigmented', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Charcot’s triad comprise of', null, 'Charcot''s triad (cholangitis): RUQ pain, jaundice and fever.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Right upper quadrant pain, diarrhoea and fever.', false, 1), ('B', 'Right upper quadrant pain, jaundice and vomiting.', false, 2), ('C', 'Right upper quadrant pain, jaundice and fever.', true, 3), ('D', 'Right upper quadrant pain, hypotension and altered mental status.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The post renal cause of Acute Kidney Injury is', null, 'Post-renal AKI is due to urinary tract obstruction (strictures, stones, prostate).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nephrotoxins', false, 1), ('B', 'Ischemia', false, 2), ('C', 'Hypotension', false, 3), ('D', 'Obstruction due to strictures', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 25-year-old woman presented with hypotension, wheezing and urticaria, 10 minutes after a bee sting. What is the likely diagnosis?', null, 'Hypotension, wheeze and urticaria minutes after a sting = systemic anaphylaxis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Urticarial reaction', false, 1), ('B', 'Systemic anaphylaxis', true, 2), ('C', 'Shock', false, 3), ('D', 'Hyperactive pain reaction to bee sting.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which species of plasmodium have a dormant phase in the liver?', null, 'P. vivax and P. ovale form dormant liver hypnozoites (relapse), needing primaquine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plasmodium malariae and Plasmodium ovale.', false, 1), ('B', 'Plasmodium vivax and Plasmodium falciparum.', false, 2), ('C', 'Plasmodium falciparum and Plasmodium ovale.', false, 3), ('D', 'Plasmodium vivax and Plasmodium ovale.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Hansen’s disease is caused by', null, 'Hansen''s disease (leprosy) is caused by Mycobacterium leprae.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mycobacterium kansasii', false, 1), ('B', 'Mycobacterium bovis', false, 2), ('C', 'Mycobacterium leprae', true, 3), ('D', 'Mycobacterium tuberculosis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Condyloma lata is caused by', null, 'Condylomata lata are lesions of secondary syphilis (Treponema pallidum); condylomata acuminata are HPV 6/11.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Human papillomavirus type 6', false, 1), ('B', 'Treponema pallidum', true, 2), ('C', 'Treponema pertenue', false, 3), ('D', 'Human papillomavirus type 11', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What are the vitamin K dependent clotting factors?', null, 'Vitamin K-dependent clotting factors: II, VII, IX and X.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Factors II, VII, IX and X', true, 1), ('B', 'Factors II, VII, IX and XI', false, 2), ('C', 'Factors V, VIII, IX and X', false, 3), ('D', 'Factors V, VII, IX and XIII', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one is a diagnostic criterion for GDM after a 75 g OGTT (glucose value)?', null, 'IADPSG/ WHO 2013: fasting ≥ 92 mg/dL (1 h ≥ 180, 2 h ≥ 153) diagnoses GDM.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 hour >= 200mg%', false, 1), ('B', '2 hour >= 140mg%', false, 2), ('C', '2 hour >= 120mg%', false, 3), ('D', 'Fasting >= 92mg%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The drug of choice for treatment of Scrub typhus is', null, 'Doxycycline is the drug of choice for scrub typhus.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Amoxycillin', false, 1), ('B', 'Ciprofloxacin', false, 2), ('C', 'Doxycycline', true, 3), ('D', 'Erythromycin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A teenage boy presents with sudden onset of right testicular pain. Which one of the following options needs to be excluded first?', null, 'Sudden testicular pain in a teenager is torsion until proven otherwise - a surgical emergency.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Testicular trauma', false, 1), ('B', 'Testicular torsion', true, 2), ('C', 'Epididymitis', false, 3), ('D', 'Orchitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old man presents to the OPD with increased thirst, increased frequency of urine and polyphagia. His blood pressure is 120/80 mmHg. There is a hyperpigmented skin lesion on the neck. He is not on any medication.

a) What is the most probable diagnosis? (1 mark)', 'a) Diabetes mellitus - most likely type 2 diabetes with insulin resistance, shown by acanthosis nigricans (hyperpigmented velvety skin on the neck) and the classic symptoms of polyuria, polydipsia and polyphagia.', null, '[{"point": "Diabetes mellitus, probably type 2 with insulin resistance (acanthosis nigricans)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s1', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old man presents to the OPD with increased thirst, increased frequency of urine and polyphagia. His blood pressure is 120/80 mmHg. There is a hyperpigmented skin lesion on the neck. He is not on any medication.

b) How will you confirm the diagnosis? (2 marks)', 'b) By blood glucose testing (WHO/ ADA criteria): fasting plasma glucose ≥ 126 mg/dL (7.0 mmol/L), or 2-hour plasma glucose ≥ 200 mg/dL (11.1 mmol/L) in a 75 g OGTT, or HbA1c ≥ 6.5%, or a random plasma glucose ≥ 200 mg/dL with classic symptoms. In the absence of symptoms an abnormal result is repeated to confirm.', null, '[{"point": "Fasting plasma glucose ≥ 126 mg/dL, or 2-h OGTT ≥ 200, or HbA1c ≥ 6.5%, or random ≥ 200 with symptoms (repeat test if asymptomatic)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s1', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
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
  values ('ME', 'short_answer', 'A 35-year-old man presents to the OPD with increased thirst, increased frequency of urine and polyphagia. His blood pressure is 120/80 mmHg. There is a hyperpigmented skin lesion on the neck. He is not on any medication.

c) Mention three types of the disease. (2 marks)', 'c) Type 1 diabetes (autoimmune beta-cell destruction), type 2 diabetes (insulin resistance with relative deficiency) and gestational diabetes; other specific types include MODY and diabetes secondary to pancreatic disease or drugs.', null, '[{"point": "Type 1, type 2, gestational diabetes (also other specific types - MODY, secondary)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s1', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old primigravida delivered a 3.5 kg male baby normally at 40 weeks. Immediately post-partum her blood pressure was 130/86 mmHg and pulse 88/min. The uterus was soft. The staff on duty massaged the uterus and there was torrential vaginal bleeding. Within 10 minutes the blood pressure dropped to 90/60 mmHg and the pulse rose to 120/min. The staff called for help.

a) What is this condition called? (1 mark)', 'a) Primary postpartum haemorrhage (blood loss ≥ 500 mL within 24 hours of vaginal birth) complicated by hypovolaemic shock.', null, '[{"point": "Primary postpartum haemorrhage with hypovolaemic shock", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s2', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old primigravida delivered a 3.5 kg male baby normally at 40 weeks. Immediately post-partum her blood pressure was 130/86 mmHg and pulse 88/min. The uterus was soft. The staff on duty massaged the uterus and there was torrential vaginal bleeding. Within 10 minutes the blood pressure dropped to 90/60 mmHg and the pulse rose to 120/min. The staff called for help.

b) What is the most common cause of this condition? (1 mark)', 'b) Uterine atony (failure of the uterus to contract) - about 70-80% of cases (''tone'' of the 4 Ts: tone, trauma, tissue, thrombin).', null, '[{"point": "Uterine atony", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s2', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old primigravida delivered a 3.5 kg male baby normally at 40 weeks. Immediately post-partum her blood pressure was 130/86 mmHg and pulse 88/min. The uterus was soft. The staff on duty massaged the uterus and there was torrential vaginal bleeding. Within 10 minutes the blood pressure dropped to 90/60 mmHg and the pulse rose to 120/min. The staff called for help.

c) How will you manage the condition? (3 marks)', 'c) Call for help and manage as an emergency: airway, breathing, oxygen; two large-bore IV cannulas, take blood for haemoglobin, grouping and cross-match and clotting; rapid IV crystalloids and blood transfusion; catheterise the bladder and monitor urine output and vital signs. Treat atony: continuous uterine massage and bimanual compression; oxytocin 10 IU IM/IV then infusion (e.g. 20-40 IU in 1 L); ergometrine 0.2 mg IM/IV if no hypertension; misoprostol 800 µg sublingually; IV tranexamic acid 1 g within 3 hours of birth. Check that the placenta is complete and examine for genital tract tears. If bleeding continues: uterine balloon tamponade, then surgery (compression sutures such as B-Lynch, uterine/ internal iliac artery ligation, hysterectomy as a last resort).', null, '[{"point": "Call for help, ABC, two large-bore IV lines, crystalloids, blood group/ cross-match, transfuse; uterine massage/ bimanual compression, oxytocin infusion, ergometrine, misoprostol, tranexamic acid; empty bladder; check placenta/ tears; if persists - balloon tamponade, surgery (B-Lynch, ligation, hysterectomy); monitor", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s2', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old woman is brought to the emergency department with breathlessness for 2 hours. She has had fever for the past 2 days. She gets a cough especially on exposure to cold and dust. On examination: BP 130/96 mmHg, pulse 100/min, respiratory rate 36/min, mild central cyanosis and rhonchi on auscultation.

a) How will you manage this patient? (3 marks)', 'a) Sit her upright; give high-flow oxygen to keep SpO2 93-95%; nebulised salbutamol 5 mg repeated every 15-20 minutes (or continuous) with ipratropium 0.5 mg; systemic corticosteroids - prednisolone 40-50 mg orally or IV hydrocortisone 100 mg; IV magnesium sulphate 2 g over 20 minutes if poor response; treat infection with antibiotics if bacterial infection is suspected; monitor SpO2, PEF, pulse, respiratory rate and arterial blood gases; get a chest X-ray to exclude pneumothorax or pneumonia; refer to ICU for possible ventilation if she tires, becomes drowsy, or has a rising PaCO2.', null, '[{"point": "Sit upright, high-flow oxygen (SpO2 93-95%), nebulised salbutamol (repeated/ back-to-back) + ipratropium, systemic steroid (prednisolone/ IV hydrocortisone), IV magnesium if no response, antibiotics if infection, monitor SpO2/ PEF/ ABG, ICU/ ventilation if life-threatening", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s3', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old woman is brought to the emergency department with breathlessness for 2 hours. She has had fever for the past 2 days. She gets a cough especially on exposure to cold and dust. On examination: BP 130/96 mmHg, pulse 100/min, respiratory rate 36/min, mild central cyanosis and rhonchi on auscultation.

b) What is your diagnosis? (1 mark)', 'b) Acute severe exacerbation of bronchial asthma (respiratory rate 36/min, cyanosis, tachycardia, rhonchi), triggered by a respiratory infection.', null, '[{"point": "Acute severe asthma (exacerbation) triggered by a respiratory infection", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s3', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old woman is brought to the emergency department with breathlessness for 2 hours. She has had fever for the past 2 days. She gets a cough especially on exposure to cold and dust. On examination: BP 130/96 mmHg, pulse 100/min, respiratory rate 36/min, mild central cyanosis and rhonchi on auscultation.

c) How will you confirm the diagnosis? (1 mark)', 'c) By showing variable, reversible airflow obstruction: peak expiratory flow or spirometry with bronchodilator reversibility (FEV1 increase ≥ 12% and ≥ 200 mL), done when she is stable; in the acute setting PEF and arterial blood gases assess severity.', null, '[{"point": "PEF/ spirometry showing variable airflow obstruction with reversibility (≥ 12% and 200 mL FEV1 after bronchodilator); ABG/ chest X-ray to assess severity and exclude others", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s3', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 16-year-old student is brought to the emergency department after swallowing 30 tablets of paracetamol 30 minutes ago. She has vomiting and abdominal pain. She is drowsy; pulse 100/min, BP 110/80 mmHg, temperature 37 °C, respiratory rate 24/min.

a) What is the immediate treatment for the patient? (2 marks)', 'a) Resuscitate - airway, breathing and circulation; she is drowsy, so protect the airway (recovery position, consider other co-ingested drugs or alcohol). Give activated charcoal 50 g as she presented within 1 hour, if the airway is safe. Take blood for paracetamol level (at 4 hours after ingestion), liver function tests, INR, blood glucose, renal function and electrolytes. Thirty tablets of 500 mg is about 15 g - well above the toxic dose (≥ 150 mg/kg) - so start IV N-acetylcysteine without waiting for the level (or as soon as the 4-hour level confirms toxicity, plotted on the nomogram).', null, '[{"point": "ABC, protect airway (drowsy); activated charcoal 50 g within 1 h if airway safe; blood for paracetamol level at 4 h, LFT, INR, glucose, electrolytes; start IV N-acetylcysteine (large/ staggered ingestion ≈ 15 g if 500 mg tablets - above toxic dose); look for co-ingestion", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s4', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 16-year-old student is brought to the emergency department after swallowing 30 tablets of paracetamol 30 minutes ago. She has vomiting and abdominal pain. She is drowsy; pulse 100/min, BP 110/80 mmHg, temperature 37 °C, respiratory rate 24/min.

b) Outline the long-term management of the patient. (3 marks)', 'b) Complete the full N-acetylcysteine course and repeat liver function tests, INR, glucose and creatinine; treat hepatotoxicity and refer to a liver unit if there are signs of acute liver failure. Before discharge, a full psychiatric assessment of suicidal intent and underlying problems (depression, stress, abuse, exams); counselling and psychotherapy, involving her family with her consent; a safety plan with restricted access to medicines at home; school support; and regular follow-up with mental health services.', null, '[{"point": "Complete NAC course, monitor LFT/ INR/ glucose/ renal function, refer liver unit if failure; psychiatric assessment of suicide risk before discharge, counselling, family involvement, safety plan/ limit access to medicines, follow-up", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-s4', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

i. How will you manage this patient initially? (10 marks)', 'This is an upper GI bleed with haemodynamic compromise in a man with probable alcoholic cirrhosis (ascites) - suspect variceal bleeding. Initial management: airway (risk of aspiration with haematemesis), oxygen; two large-bore IV cannulas; send blood for haemoglobin, grouping and cross-match, platelets, INR, liver and renal function; give IV crystalloids cautiously and transfuse packed red cells with a restrictive target (Hb 7-8 g/dL - over-transfusion raises portal pressure); correct coagulopathy and low platelets (FFP, platelets, vitamin K); monitor pulse, BP, urine output (catheter) and assess risk (Glasgow-Blatchford score). Specific treatment: IV vasoactive drug - terlipressin 2 mg 4-hourly or octreotide infusion - started before endoscopy; prophylactic IV antibiotics (e.g. ceftriaxone 1 g daily) which reduce infection, rebleeding and death; IV PPI until the source is known; nil by mouth; urgent upper GI endoscopy within 12 hours for diagnosis and endoscopic variceal band ligation (or therapy for an ulcer); if bleeding is uncontrolled, balloon tamponade (Sengstaken-Blakemore) as a bridge and TIPS; lactulose to prevent hepatic encephalopathy; and alcohol withdrawal prophylaxis (thiamine, benzodiazepines as needed).', null, '[{"point": "Resuscitation: ABC, two large-bore IV lines, bloods (Hb, cross-match, LFT, INR, platelets, urea), crystalloids then restrictive transfusion (target Hb 7-8), correct coagulopathy, monitor (urine output, vitals), Glasgow-Blatchford score", "marks": 5}, {"point": "Suspected variceal bleed (alcohol, ascites): IV terlipressin or octreotide, IV antibiotics (ceftriaxone), IV PPI until endoscopy, urgent endoscopy within 12 h (band ligation), balloon tamponade/ TIPS if uncontrolled, avoid fluid overload, lactulose; NBM", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
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
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

ii. How is the site of the bleeding determined? (5 marks)', 'Clinically, haematemesis (fresh or coffee-ground) and melaena indicate bleeding proximal to the ligament of Treitz (upper GI); a raised blood urea relative to creatinine also suggests upper GI bleeding (digested blood); bright red blood per rectum suggests lower GI bleeding, unless the upper bleed is massive. Investigations: upper GI endoscopy (oesophagogastroduodenoscopy) is the key test - it identifies the site and cause (varices, ulcer, Mallory-Weiss tear) and allows treatment; colonoscopy for lower GI bleeding; CT angiography or catheter angiography when endoscopy cannot find a brisk bleed (also allows embolisation); capsule endoscopy for small-bowel bleeding; radionuclide red cell scan for slow intermittent bleeding.', null, '[{"point": "Clinical: haematemesis/ coffee-ground vomit and melaena → upper GI (proximal to ligament of Treitz); raised urea; NG aspirate; fresh blood per rectum → lower (unless massive upper)", "marks": 2}, {"point": "Investigations: upper GI endoscopy (diagnostic and therapeutic - first line), colonoscopy for lower, CT angiography/ angiography, capsule endoscopy, radionuclide scan", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

iii. Name five common causes of upper GI bleeding. (5 marks)', 'Peptic ulcer disease (duodenal and gastric ulcers); oesophageal and gastric varices (portal hypertension); erosive gastritis and duodenitis (NSAIDs, alcohol); Mallory-Weiss tear; reflux oesophagitis; upper GI malignancy (gastric or oesophageal cancer); Dieulafoy lesion; angiodysplasia.', null, '[{"point": "Any five: peptic ulcer (duodenal/ gastric), oesophageal/ gastric varices, erosive gastritis/ duodenitis (NSAIDs, alcohol), Mallory-Weiss tear, oesophagitis, malignancy (gastric/ oesophageal), Dieulafoy lesion, angiodysplasia", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

iv. List five common causes of lower GI bleeding. (5 marks)', 'Haemorrhoids; anal fissure; diverticular disease; angiodysplasia; colorectal cancer and polyps; inflammatory bowel disease (ulcerative colitis, Crohn''s); infective colitis (e.g. amoebic or bacillary dysentery); ischaemic colitis; radiation proctitis; Meckel''s diverticulum in young people.', null, '[{"point": "Any five: haemorrhoids, anal fissure, diverticular disease, angiodysplasia, colorectal carcinoma/ polyps, inflammatory bowel disease, infective colitis (dysentery), ischaemic colitis, post-polypectomy, Meckel''s diverticulum (young)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

v. The patient''s blood reports show haemoglobin 4 g%, normal WBC, grossly deranged liver enzymes and positive hepatitis B surface antigen. What is your decision? (5 marks)', 'With a haemoglobin of 4 g/dL and active bleeding, he needs urgent transfusion of packed red cells (to a target of about 7-8 g/dL) along with control of the bleeding; hepatitis B positivity is not a contraindication to transfusion or endoscopy - use standard precautions and infection control. The deranged liver enzymes with HBsAg positivity and alcohol use suggest decompensated chronic liver disease from hepatitis B and alcohol; admit him to HDU/ ICU, continue variceal bleeding treatment (vasoactive drugs, antibiotics, endoscopic ligation), correct coagulopathy, and refer to a higher centre (gastroenterology/ hepatology) if facilities are lacking. Further work-up: HBeAg, HBV DNA, ultrasound abdomen, AFP; start antiviral therapy (tenofovir or entecavir) as indicated; screen and vaccinate household contacts; strict alcohol abstinence.', null, '[{"point": "Urgent transfusion of packed red cells (Hb 4 with active bleeding) - HBsAg positivity is not a contraindication; universal precautions, infection control", "marks": 2}, {"point": "Treat as decompensated chronic liver disease (alcohol + HBV): continue variceal bleed management, correct coagulopathy, admit HDU/ ICU, refer to higher centre/ gastroenterology, HBV workup (HBeAg, HBV DNA) and antiviral (tenofovir/ entecavir), family screening and vaccination, stop alcohol", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 5, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

vi. The patient complains of breathlessness and itching 5 minutes after the start of a blood transfusion. On examination there are urticarial rashes and swelling of the lips. What is your diagnosis? How will you manage it? (10 marks)', 'Diagnosis: anaphylactic (severe allergic) transfusion reaction - urticaria, lip swelling (angioedema) and breathlessness within minutes of starting transfusion (sometimes due to IgA deficiency with anti-IgA antibodies). Management: stop the transfusion immediately and keep the IV line open with normal saline; call for help; assess airway, breathing and circulation; give IM adrenaline 0.5 mg (0.5 mL of 1:1000) into the thigh, repeated every 5 minutes if needed; high-flow oxygen; IV fluids for hypotension; IV chlorpheniramine 10 mg and IV hydrocortisone 200 mg; nebulised salbutamol for bronchospasm; monitor vital signs and SpO2 closely. Check the patient''s identity against the blood unit label and records; return the blood bag and send fresh blood and urine samples to the blood bank to exclude a haemolytic reaction; document and report the reaction (haemovigilance). For future transfusions use washed red cells or IgA-deficient products if IgA deficiency is confirmed, with premedication, and transfuse slowly under close observation, since he still needs blood.', null, '[{"point": "Diagnosis: acute (anaphylactic/ severe allergic) transfusion reaction", "marks": 3}, {"point": "Management: stop transfusion immediately, keep IV line with normal saline, ABC, IM adrenaline 0.5 mg (repeat 5 min), oxygen, IV fluids, antihistamine (chlorpheniramine), hydrocortisone, nebulised salbutamol; check patient/ unit identity, return bag and blood samples to blood bank, report (haemovigilance), monitor; future transfusions - washed/ IgA-deficient products, premedication", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 6, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Upper GI bleeding in a man who drinks alcohol
A 41-year-old man had three episodes of vomiting blood at home and one on arrival at the emergency department. He also gave a history of passing black stools. He regularly consumes alcohol. On examination he is conscious and pale, with ascites. Blood pressure 90/60 mmHg, pulse 100/min, respiratory rate 16/min. He has been on omeprazole for gastritis for one month.

vii. When will you discharge the patient? Detail the long-term management of the patient. (10 marks)', 'Discharge when there has been no rebleeding for at least 48-72 hours, haemoglobin and vital signs are stable, he is eating, ascites and any encephalopathy are controlled, infections are treated, he understands his medicines and warning signs, and follow-up (endoscopy and clinic) is arranged. Long-term management: (1) secondary prophylaxis of variceal bleeding - non-selective beta blocker (propranolol or carvedilol) plus repeated endoscopic band ligation every 2-4 weeks until varices are eradicated, then surveillance; (2) hepatitis B - antiviral therapy (tenofovir or entecavir) with monitoring of HBV DNA and liver function; screen and vaccinate family; (3) complete alcohol abstinence with counselling, de-addiction services and family support; (4) ascites - salt restriction (< 2 g sodium/ day), spironolactone with or without furosemide, monitoring electrolytes and weight; (5) prevention of encephalopathy with lactulose; (6) good nutrition (adequate protein and calories, late-evening snack); (7) avoid NSAIDs and unnecessary sedatives; (8) vaccination (hepatitis A, pneumococcal, influenza); (9) surveillance for hepatocellular carcinoma with ultrasound and AFP every 6 months; (10) assessment for liver transplantation if decompensation continues; regular follow-up.', null, '[{"point": "Discharge when: no further bleeding for 48-72 h, stable haemodynamics and Hb, tolerating diet, ascites/ encephalopathy controlled, infection treated, follow-up arranged", "marks": 3}, {"point": "Long-term: secondary prophylaxis - non-selective beta blocker (propranolol/ carvedilol) + repeated band ligation until varices eradicated; antiviral therapy for HBV; total alcohol abstinence/ de-addiction support; ascites management (salt restriction, spironolactone ± furosemide); lactulose; nutrition; vaccination; HCC surveillance (USG + AFP 6-monthly); avoid NSAIDs; liver transplant evaluation; regular follow-up", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case1', 7, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

i. How will you confirm the diagnosis? (5 marks)', 'Collect two sputum samples (spot and early morning) and test with a WHO-recommended rapid molecular test such as Xpert MTB/RIF (or Truenat), which detects M. tuberculosis and rifampicin resistance within hours; sputum smear microscopy (Ziehl-Neelsen or LED fluorescence) where molecular tests are unavailable; sputum culture (liquid or solid) with drug-susceptibility testing is the gold standard and is done for resistance testing. Supporting tests: chest X-ray (cavities, infiltrates), HIV testing, blood glucose (diabetes), CBC and ESR. A positive test gives a bacteriologically confirmed diagnosis; if tests are negative but the clinician decides to treat based on X-ray and clinical features, it is a clinically diagnosed case.', null, '[{"point": "Sputum examination: rapid molecular test (Xpert MTB/RIF/ Truenat - also detects rifampicin resistance) on sputum; sputum smear microscopy (ZN/ LED fluorescence) 2 samples; culture and DST (gold standard)", "marks": 3}, {"point": "Supporting: chest X-ray, HIV test, CBC/ ESR, blood glucose; bacteriologically confirmed vs clinically diagnosed", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
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
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

ii. List the types of extrapulmonary TB. (4 marks)', 'Tuberculous lymphadenitis (most common, cervical nodes); pleural TB (pleural effusion, empyema); abdominal TB (intestinal, peritoneal, mesenteric nodes); bone and joint TB including spinal TB (Pott''s disease); central nervous system TB (TB meningitis, tuberculoma); genitourinary TB (renal, genital); pericardial TB; disseminated/ miliary TB; cutaneous TB (scrofuloderma, lupus vulgaris); ocular TB.', null, '[{"point": "Any eight/ main types: lymph node (TB lymphadenitis), pleural (effusion), abdominal (intestinal/ peritoneal), skeletal/ spinal (Pott''s), CNS (TB meningitis, tuberculoma), genitourinary, pericardial, miliary/ disseminated, cutaneous, ocular", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

iii. Classify TB based on the history of previous TB treatment. (7 marks)', 'WHO classification (used in national guidelines): (1) New patients - never treated for TB or have taken anti-TB drugs for less than 1 month. (2) Previously treated patients - received 1 month or more of anti-TB drugs in the past, subdivided into: (a) relapse - previously treated, declared cured or treatment completed at the end of their last course, and now diagnosed with a recurrent episode; (b) treatment after failure - their most recent course ended in failure; (c) treatment after loss to follow-up - previously treated and declared lost to follow-up (treatment interrupted for 2 consecutive months or more); (d) other previously treated - outcome of the last course unknown or undocumented. (3) Patients with unknown previous TB treatment history.', null, '[{"point": "New: never treated or < 1 month of anti-TB drugs", "marks": 1.5}, {"point": "Previously treated: relapse (cured/ completed, now again diagnosed)", "marks": 1.5}, {"point": "Treatment after failure", "marks": 1.5}, {"point": "Treatment after loss to follow-up (interrupted ≥ 2 months)", "marks": 1.5}, {"point": "Other previously treated; patients with unknown previous treatment history", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

iv. Define the treatment outcomes of a TB patient. (7 marks)', 'WHO/ national definitions: Cured - a pulmonary TB patient with bacteriologically confirmed TB at the start who completed treatment and was smear- or culture-negative in the last month of treatment and on at least one previous occasion. Treatment completed - completed treatment without evidence of failure, but without a record showing negative sputum results in the last month and at least one previous occasion. Treatment failed - sputum smear or culture positive at month 5 or later during treatment. Died - a patient who dies for any reason before starting or during treatment. Lost to follow-up - did not start treatment or whose treatment was interrupted for 2 consecutive months or more. Not evaluated - no treatment outcome assigned (including transferred out with unknown outcome). Treatment success - the sum of cured and treatment completed.', null, '[{"point": "Cured: bacteriologically confirmed at start, completed treatment, smear/ culture negative in last month and at least once before", "marks": 1.5}, {"point": "Treatment completed: completed treatment without evidence of failure but no record of cure test", "marks": 1}, {"point": "Treatment failed: smear/ culture positive at month 5 or later", "marks": 1}, {"point": "Died: dies for any reason before or during treatment", "marks": 1}, {"point": "Lost to follow-up: did not start or interrupted ≥ 2 consecutive months", "marks": 1}, {"point": "Not evaluated (no outcome/ transferred out); treatment success = cured + completed", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

v. What are the aims of treating TB? (5 marks)', 'To cure the patient and restore quality of life and productivity; to prevent death from active TB or its late effects; to prevent relapse of TB; to reduce transmission of TB to others; and to prevent the development and transmission of drug-resistant TB.', null, '[{"point": "Cure the patient and restore quality of life/ productivity; prevent death from active TB or its late effects; prevent relapse; reduce transmission to others; prevent development and transmission of drug resistance", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 5, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
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
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

vi. Mention three basic principles of TB treatment. (3 marks)', '(1) Use a combination of several effective drugs - never a single drug - to prevent drug resistance; (2) give the correct dose by body weight for an adequate duration (an intensive phase to kill bacilli rapidly and a continuation phase to eliminate persisters); (3) ensure regular, uninterrupted intake with treatment adherence support such as directly observed treatment, using standardised regimens and monitoring response (sputum follow-up).', null, '[{"point": "Any three: combination of several drugs (prevent resistance), adequate duration (intensive + continuation phases), correct dosage by weight, regular uninterrupted intake with direct observation/ adherence support (DOT), standardised regimens/ free drugs, monitoring of response", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 6, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

vii. What are the advantages of FDC (fixed-dose combination) drugs? (3 marks)', 'Fewer tablets to swallow, improving adherence; prevents monotherapy because the patient cannot take one drug and not the others, reducing the risk of drug resistance; fewer prescribing and dispensing errors with simple weight-band dosing; simpler procurement, storage and distribution, and easier directly observed treatment.', null, '[{"point": "Fewer pills - better adherence, prevents monotherapy/ selective intake and resistance, fewer prescription/ dosing errors, simpler procurement, storage and distribution, easier DOT", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 7, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

viii. Write the names, with strengths, of the drugs in 4FDC and 2FDC (adult). (6 marks)', 'Adult 4FDC (HRZE) tablet: isoniazid 75 mg, rifampicin 150 mg, pyrazinamide 400 mg and ethambutol 275 mg. Adult 2FDC (HR) tablet: isoniazid 75 mg and rifampicin 150 mg. The number of tablets is given by weight band (e.g. 3 tablets for 38-54 kg, 4 for 55-70 kg, 5 for > 70 kg).', null, '[{"point": "4FDC: isoniazid 75 mg + rifampicin 150 mg + pyrazinamide 400 mg + ethambutol 275 mg", "marks": 4}, {"point": "2FDC: isoniazid 75 mg + rifampicin 150 mg", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 8, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

ix. Name the treatment phases with their duration. (4 marks)', 'For drug-susceptible TB (new and previously treated without resistance): intensive phase - 2 months of isoniazid, rifampicin, pyrazinamide and ethambutol (2HRZE) daily; continuation phase - 4 months of isoniazid and rifampicin (4HR, ethambutol may be added in some guidelines) daily. Total 6 months; it is extended (9-12 months) for TB meningitis and bone and joint TB.', null, '[{"point": "Intensive phase: 2 months of HRZE (4FDC) daily", "marks": 2}, {"point": "Continuation phase: 4 months of HR (2FDC) daily - total 6 months (longer for TB meningitis/ bone TB)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 9, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

x. What is DOTS? Explain. (2 marks)', 'DOTS (Directly Observed Treatment, Short-course) is the WHO strategy for TB control in which a trained health worker or treatment supporter watches the patient swallow every dose of a standardised short-course regimen. Its five components: political commitment with funding; case detection by quality-assured bacteriology; standardised treatment with supervision and patient support; an effective, uninterrupted drug supply; and a standard recording and reporting system to monitor outcomes.', null, '[{"point": "Directly Observed Treatment, Short-course: WHO strategy - political commitment, quality diagnosis (sputum bacteriology), standardised treatment with direct observation and support, uninterrupted drug supply, recording/ reporting and monitoring", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 10, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

xi. What are the four targets of the National TB Control Programme (NTCP)? (2 marks)', 'Answer from the current National TB Control Programme strategy (Ministry of Health). These are aligned with the WHO End TB Strategy targets: reduce TB deaths and TB incidence substantially (End TB: 90% fewer deaths and 80% lower incidence by 2030 compared with 2015), achieve high case detection, and achieve high treatment success (at least 90%) with no TB-affected family facing catastrophic costs. [Expert: check the exact four NTCP targets in the current national manual.]', null, '[{"point": "The four national targets as stated in the current NTCP strategy/ manual (e.g. case detection, treatment success, reduction of incidence and deaths, no catastrophic costs) - aligned with End TB Strategy", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Expert check: confirm the four targets of the National TB Control Programme."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 11, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q11' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Presumptive tuberculosis
A 35-year-old man presented to a district hospital OPD with a productive cough for 3 weeks. He also had mild fever, night sweats and unexplained weight loss. On examination: blood pressure 160/110 mmHg, pulse 88/min, mild pallor, no icterus. The cervical lymph nodes were not palpable and the chest was clear on auscultation. On these findings the medical officer made a diagnosis of presumptive tuberculosis.

xii. What is latent TB? (2 marks)', 'Latent TB infection is a state of persistent immune response to Mycobacterium tuberculosis antigens without clinical, radiological or bacteriological evidence of active TB disease. The person has no symptoms and is not infectious, but about 5-10% will develop active TB in their lifetime (higher with HIV, diabetes, malnutrition, immunosuppression). It is detected with a tuberculin skin test or interferon-gamma release assay, and high-risk groups receive TB preventive treatment (e.g. 6 months of isoniazid or 3 months of weekly isoniazid-rifapentine).', null, '[{"point": "Persistent immune response to M. tuberculosis antigens without clinical, radiological or bacteriological evidence of active disease; not infectious; ~5-10% lifetime risk of reactivation; detected by TST/ IGRA; treated with TPT (e.g. isoniazid, 3HP) in high-risk groups", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2024-case2', 12, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q12' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The first-line drug for anaphylaxis in an adult is', null, 'Intramuscular adrenaline into the anterolateral thigh, repeated every 5 minutes if needed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'IV salbutamol', false, 1), ('B', 'IM adrenaline 0.5 mg (1:1000)', true, 2), ('C', 'Oral antihistamine', false, 3), ('D', 'IV hydrocortisone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Kussmaul breathing is characteristic of', null, 'Deep, rapid breathing compensates for metabolic acidosis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'pneumothorax', false, 1), ('B', 'respiratory alkalosis', false, 2), ('C', 'opioid overdose', false, 3), ('D', 'metabolic acidosis such as diabetic ketoacidosis', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Koplik spots on the buccal mucosa are seen in', null, 'Koplik spots appear before the rash of measles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measles', true, 1), ('B', 'Mumps', false, 2), ('C', 'Chickenpox', false, 3), ('D', 'Rubella', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The antidote used for organophosphate poisoning is', null, 'Atropine blocks muscarinic effects (with pralidoxime where available).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flumazenil', false, 1), ('B', 'Vitamin K', false, 2), ('C', 'Atropine', true, 3), ('D', 'Naloxone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The drug of choice for severe falciparum malaria is', null, 'WHO recommends IV (or IM) artesunate for severe malaria.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oral chloroquine', false, 1), ('B', 'Primaquine', false, 2), ('C', 'IV artesunate', true, 3), ('D', 'Oral doxycycline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common bacterial cause of community-acquired pneumonia is', null, 'Pneumococcus is the commonest cause.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Streptococcus pneumoniae', true, 1), ('B', 'Staphylococcus aureus', false, 2), ('C', 'Klebsiella pneumoniae', false, 3), ('D', 'Pseudomonas aeruginosa', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
commit;
