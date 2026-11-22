-- ME Paper III (Technical, Nursing): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'nursing', 'Nursing' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'nursing') is null then raise exception 'unknown specialisation nursing'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which electrolyte imbalance most likely occurs in a patient with chronic kidney disease?', null, 'Failing kidneys cannot excrete potassium, so hyperkalaemia is the most common and dangerous imbalance in CKD.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hyperkalemia', true, 1), ('B', 'Hypernatremia', false, 2), ('C', 'Hypomagnesemia', false, 3), ('D', 'Hypocalcemia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with myasthenia gravis is at risk for:', null, 'Weakness of respiratory muscles (myasthenic or cholinergic crisis) can cause respiratory failure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypoglycemia', false, 1), ('B', 'Respiratory failure', true, 2), ('C', 'Hypertensive crisis', false, 3), ('D', 'Hypercalcemia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary goal in the management of diabetic ketoacidosis (DKA) is to:', null, 'First priority in DKA is restoring fluid volume and correcting electrolytes (especially potassium); insulin then lowers glucose gradually.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Correct fluid and electrolyte imbalances', true, 1), ('B', 'Lower blood glucose levels rapidly', false, 2), ('C', 'Reduce ketone production', false, 3), ('D', 'Manage pain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which drug is used as an antidote for acetaminophen overdose?', null, 'N-acetylcysteine replenishes glutathione and is the antidote for paracetamol (acetaminophen) poisoning.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flumazenil', false, 1), ('B', 'Atropine', false, 2), ('C', 'Naloxone', false, 3), ('D', 'N-acetylcysteine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which condition is characterized by the premature separation of the placenta from the uterine wall?', null, 'Abruptio placentae is premature separation of a normally implanted placenta.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Abruptio placentae', true, 1), ('B', 'Ectopic pregnancy', false, 2), ('C', 'Molar pregnancy', false, 3), ('D', 'Placenta previa', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of postpartum hemorrhage is:', null, 'Uterine atony causes about 70-80% of postpartum haemorrhage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Retained placenta', false, 1), ('B', 'Coagulopathy', false, 2), ('C', 'Uterine atony', true, 3), ('D', 'Lacerations', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Apgar score includes all of the following parameters EXCEPT:', null, 'Apgar: Appearance (colour), Pulse, Grimace (reflex irritability), Activity (tone), Respiration - not blood pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Muscle tone', false, 1), ('B', 'Respiratory effort', false, 2), ('C', 'Heart rate', false, 3), ('D', 'Blood pressure', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The concept of "informed consent" is based on which ethical principle?', null, 'Informed consent respects the patient''s autonomy - the right to decide.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fidelity', false, 1), ('B', 'Nonmaleficence', false, 2), ('C', 'Autonomy', true, 3), ('D', 'Justice', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the normal pH range of blood?', null, 'Normal arterial blood pH is 7.35-7.45.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7.25-7.35', false, 1), ('B', '7.55-7.65', false, 2), ('C', '7.35-7.45', true, 3), ('D', '7.45-7.55', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the most appropriate action if a patient is suspected of having a stroke?', null, 'An urgent non-contrast CT is needed first to exclude haemorrhage before any antiplatelet or thrombolytic treatment.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Give aspirin', false, 1), ('B', 'Administer oxygen', false, 2), ('C', 'Start an IV line', false, 3), ('D', 'Perform a CT scan immediately', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents with a sudden onset of severe chest pain, radiating to the back, and a difference in blood pressure between the arms. What is the most likely diagnosis?', null, 'Tearing chest pain radiating to the back with unequal arm blood pressures suggests aortic dissection.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Myocardial infarction', false, 1), ('B', 'Pneumothorax', false, 2), ('C', 'Pulmonary embolism', false, 3), ('D', 'Aortic dissection', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A nurse is assessing a patient with suspected meningitis. Which of the following findings would indicate a positive Brudzinski’s sign?', null, 'Brudzinski''s sign: passive neck flexion causes involuntary flexion of the hips and knees.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flexion of the hips and knees when the neck is flexed', true, 1), ('B', 'Inability to straighten the leg when the hip is flexed', false, 2), ('C', 'Nuchal rigidity and photophobia', false, 3), ('D', 'Pain and resistance when the neck is flexed', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient is receiving a blood transfusion and develops chills, fever, and back pain. What is the priority nursing action?', null, 'Chills, fever and back pain suggest a haemolytic reaction: stop the transfusion immediately, keep the IV open with saline, then notify.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Slow the rate of infusion', false, 1), ('B', 'Administer acetaminophen', false, 2), ('C', 'Stop the transfusion immediately', true, 3), ('D', 'Notify the physician', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A nurse is caring for a patient with hyperkalemia. Which of the following ECG changes is most indicative of this condition?', null, 'Tall, peaked T waves are the earliest typical ECG sign of hyperkalaemia.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Peaked T waves', true, 1), ('B', 'Depressed ST segment', false, 2), ('C', 'Inverted P waves', false, 3), ('D', 'Prolonged QT interval', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Packed red cells have been prescribed for a patient with low haemoglobin and hematocrit levels. The nurse takes the patient''s temperature before handling the blood transfusion and records 100.8 degrees Fahrenheit. Which action should the nurse take?', null, 'A fever before transfusion would mask a reaction: delay hanging the blood and inform the physician.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Administer an antihistamine and begin transfusion.', false, 1), ('B', 'Proceeds with the transfusion.', false, 2), ('C', 'Give an antipyretic and begin the transfusion.', false, 3), ('D', 'Delay hanging the blood and inform the physician.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with a history of chronic urinary tract infections complains of urinary frequency and a burning sensation during urination. To determine if the issue involves the kidneys, where should the nurse assess for pain or discomfort?', null, 'Kidney (upper urinary tract) involvement causes costovertebral angle (flank) tenderness.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Right or left costovertebral angle', true, 1), ('B', 'Pain in the labium', false, 2), ('C', 'Urinary meatus', false, 3), ('D', 'Suprapubic area', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A nurse is assessing a patient for signs of renal dysfunction. Which clinical manifestation would most likely indicate that the patient is experiencing fluid overload due to impaired kidney function?', null, 'Impaired kidneys retain sodium and water, causing peripheral oedema.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Decreased blood pressure', false, 1), ('B', 'Edema in the extremities', true, 2), ('C', 'Increased urine output', false, 3), ('D', 'Dry, flaky skin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following findings is the best indication that fluid replacement for the patient with hypovolemic shock is adequate?', null, 'Urine output above 30 mL/hour shows adequate renal perfusion and fluid replacement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Diastolic Blood pressure greater than 90mmHg', false, 1), ('B', 'Urine output greater than 30ml/hour', true, 2), ('C', 'Respiratory rate of 21', false, 3), ('D', 'Systolic Blood pressure greater than 110mmHg', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Dorji, a patient with myasthenia gravis, is scheduled to receive immunosuppressive therapy. Which of the following explains why this therapy is expected to be effective in managing his condition?', null, 'Myasthenia gravis is autoimmune; immunosuppressants reduce production of antibodies against acetylcholine receptors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inhibits the breakdown of acetylcholine at the neuromuscular junction', false, 1), ('B', 'Stimulates the production of acetylcholine at the neuromuscular junction', false, 2), ('C', 'Decreases the production of antibodies that attack the acetylcholine receptors', true, 3), ('D', 'Promotes the removal of antibodies that impair the transmission of impulses', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When faced with an ethical dilemma, the nursing code of ethics advises nurses to:', null, 'Ethical dilemmas should be resolved by consulting the ethics committee and other resources.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ignore dilemma', false, 1), ('B', 'Make decisions independently', false, 2), ('C', 'Consult the ethics committee or other resources', true, 3), ('D', 'Follow the physician’s order without questions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the nursing code of ethics, the nurse’s role in a patient’s informed consent is to:', null, 'The nurse ensures the patient has the necessary information and understands it (the physician explains the procedure).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Minimize patient questions', false, 1), ('B', 'Provide all necessary information and support patient understanding', true, 2), ('C', 'Make the decision for the patient', false, 3), ('D', 'Document the physician’s explanation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 25-year-old woman presents to the Emergency Room with acute gastritis and signs of moderate dehydration. What is the most appropriate nursing diagnosis?', null, 'Dehydration from gastritis (vomiting) = fluid volume deficit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fluid volume deficit', true, 1), ('B', 'Fluid volume excess', false, 2), ('C', 'Activity intolerance', false, 3), ('D', 'Infection', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with blunt trauma underwent exploratory laparotomy for repair of an intra-abdominal injury. He develops oliguria and hypotension four hours post-surgery. Which is the priority nursing diagnosis?', null, 'Oliguria and hypotension after abdominal trauma surgery suggest bleeding/ hypovolaemia: deficient fluid volume.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Deficient fluid volume', true, 1), ('B', 'Nausea', false, 2), ('C', 'Impaired urinary elimination', false, 3), ('D', 'Risk for infection', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Intrauterine growth curves classify a 32-week-old preterm newborn. Birth weight and gestational age show the infant’s growth rate falls below the 10th percentile. What is the priority nursing diagnosis for a newborn with a small for gestational age?', null, 'SGA infants have small glycogen stores and are at high risk of hypoglycaemia - the priority.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Risk for impaired gas exchange related to meconium aspiration.', false, 1), ('B', 'Risk for injury related to impaired gluconeogenesis.', true, 2), ('C', 'Risk for ineffective thermoregulation related to lack of subcutaneous fate.', false, 3), ('D', 'Risk for altered nutrition less than body requirements related to increased metabolic needs.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following offers the best way to set priority?', null, 'Priorities are set from the assessment of the patients'' nursing needs and problems.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Controlling and evaluating the delivery of nursing care', false, 1), ('B', 'Assessing nursing needs and problems', true, 2), ('C', 'Assigning a safe nurse-to-patient ratio', false, 3), ('D', 'Giving instructions on how nursing needs are to be met', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient is receiving a platelet transfusion. The nurse determines that the patient is gaining from this therapy if the patient exhibits which of the following?', null, 'Platelets prevent and control bleeding, so fewer bleeding episodes show benefit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Less frequent febrile episode', false, 1), ('B', 'Increased level of hematocrit', false, 2), ('C', 'Increased level of haemoglobin', false, 3), ('D', 'Fewer episodes of bleeding', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A nurse is surveying to assess nurses’ attitudes towards pain management practices. What type of data will be collected through this survey?', null, 'An attitude survey (rating scales) yields quantitative data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Meta-analysis data', false, 1), ('B', 'Mixed method data', false, 2), ('C', 'Qualitative data', false, 3), ('D', 'Quantitative data', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A four-year-old boy presented with a firm and non-tender mass that his mother had discovered in the right upper abdominal quadrant. He was admitted to the hospital and underwent a complete surgical excision of a renal tumour that had extended beyond the kidney. The child was then scheduled for radiation and chemotherapy treatment. Which stage was the tumour?', null, 'Wilms tumour extending beyond the kidney but completely excised is stage II.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'III', false, 1), ('B', 'II', true, 2), ('C', 'IV', false, 3), ('D', 'I', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions on End-of-Life Care.

a) Define the term ''advance directive''. (1 mark)', 'a) An advance directive is a written (legal) statement in which a competent adult states in advance what medical treatment they would want or refuse, and/or who should make decisions for them (a health-care proxy), if they later become unable to decide for themselves.', null, '[{"point": "Written/ legal statement made by a competent person about the treatment they want or refuse (and/or who decides for them) if they later lose capacity", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s1', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions on End-of-Life Care.

b) Explain the role of advance directives in end-of-life care planning. (2 marks)', 'b) It guides end-of-life care so that treatment matches the patient''s values and wishes - for example decisions about CPR, mechanical ventilation, tube feeding and place of death; it names a decision-maker, prevents unwanted or futile treatment, supports timely palliative care, and reduces the burden and conflict on family and staff when the patient can no longer speak.', null, '[{"point": "Guides care to match patient''s values; avoids unwanted treatment (CPR, ventilation); names proxy; reduces family burden/ conflict; supports palliative planning", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s1', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'short_answer', 'Answer the following questions on End-of-Life Care.

c) Explain the ethical implications of respecting advance directives in cases where family members disagree with the patient''s wishes. (2 marks)', 'c) Respecting a valid directive upholds autonomy even when family members disagree; overriding it would disrespect the patient, though family distress must be handled with compassion. The nurse should check that the directive is valid and applies to the situation, communicate openly, hold family meetings with the team, explain the patient''s wishes and the plan, involve the ethics committee or legal advice where conflict persists, be sensitive to cultural and religious values, and document carefully. Beneficence and non-maleficence also support avoiding treatment the patient did not want.', null, '[{"point": "Autonomy vs family wishes/ beneficence; directive generally prevails if valid and applicable; communication, family meetings, ethics committee, legal/ cultural sensitivity, documentation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s1', 3, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'short_answer', 'Write short answers to the following questions on diabetic ketoacidosis (DKA).

a) What are the clinical manifestations of DKA? (1 mark)', 'a) Polyuria, polydipsia, dehydration (dry mucosa, tachycardia, hypotension), nausea, vomiting and abdominal pain, Kussmaul (deep, rapid) breathing, fruity acetone breath, weakness, drowsiness, confusion and coma; blood glucose usually above 250 mg/dL, ketones in blood and urine, and metabolic acidosis (pH below 7.3, low bicarbonate).', null, '[{"point": "Polyuria, polydipsia, dehydration, nausea/ vomiting, abdominal pain, Kussmaul breathing, fruity (acetone) breath, weakness, confusion/ coma; high glucose, ketones, metabolic acidosis", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s2', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write short answers to the following questions on diabetic ketoacidosis (DKA).

b) Explain the pathophysiology of DKA. (2 marks)', 'b) Absolute or relative insulin deficiency, with raised counter-regulatory hormones (glucagon, cortisol, adrenaline), means glucose cannot enter cells and the liver releases more glucose, causing hyperglycaemia. This produces osmotic diuresis, severe dehydration and loss of sodium, potassium and phosphate. Without insulin, fat is broken down (lipolysis) and the liver converts free fatty acids into ketone bodies (acetoacetate, beta-hydroxybutyrate), causing metabolic acidosis; the body compensates with Kussmaul breathing.', null, '[{"point": "Insulin deficiency + counter-regulatory hormones → hyperglycaemia → osmotic diuresis, dehydration, electrolyte loss; lipolysis → free fatty acids → ketone bodies → metabolic acidosis", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s2', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write short answers to the following questions on diabetic ketoacidosis (DKA).

c) Describe the nursing management for a patient with DKA. (2 marks)', 'c) Assess airway, breathing and circulation; establish IV access and give IV fluids (normal saline) as ordered to correct dehydration; start an IV insulin infusion per protocol; monitor and replace potassium (check before insulin); monitor blood glucose hourly, electrolytes, blood gases and ketones; strict intake-output and vital signs; cardiac monitoring for arrhythmias; neurological checks; add dextrose when glucose falls; identify and treat the cause (infection, missed insulin); and educate on sick-day rules and insulin adherence.', null, '[{"point": "Airway/ monitoring, IV fluids (0.9% saline), IV insulin infusion, potassium replacement, monitor glucose hourly, electrolytes, ABG, input-output, neuro status, treat cause, education", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s2', 3, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write short answers on heart failure.

a) What is heart failure? (2 marks)', 'a) Heart failure is a clinical syndrome in which the heart is unable to pump enough blood to meet the body''s metabolic needs, or can do so only with raised filling pressures, because of structural or functional impairment of ventricular filling or ejection. It causes fatigue, breathlessness and fluid retention (congestion).', null, '[{"point": "Condition in which the heart cannot pump enough blood to meet the body''s needs (or only at high filling pressures), due to structural/ functional impairment", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s3', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write short answers on heart failure.

b) List down the types of heart failure. (3 marks)', 'b) Types: left-sided heart failure (pulmonary congestion - dyspnoea, crackles) and right-sided heart failure (systemic congestion - oedema, raised JVP, hepatomegaly); systolic heart failure/ heart failure with reduced ejection fraction (HFrEF) and diastolic heart failure/ heart failure with preserved ejection fraction (HFpEF); acute and chronic heart failure; congestive heart failure; high-output and low-output failure.', null, '[{"point": "Left-sided and right-sided; systolic (HFrEF) and diastolic (HFpEF); acute and chronic; congestive; high-output and low-output", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s3', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer questions on pulse points/sites.

a) How many common pulse sites/points are there? List five of the common pulse sites. (3 marks)', 'a) There are nine common pulse sites: temporal, carotid, apical, brachial, radial, femoral, popliteal, posterior tibial and dorsalis pedis (pedal). Any five, e.g. radial (wrist), carotid (neck), brachial (inner elbow), femoral (groin) and dorsalis pedis (top of the foot).', null, '[{"point": "Nine common pulse sites: temporal, carotid, apical, brachial, radial, femoral, popliteal, posterior tibial, dorsalis pedis (any five)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s4', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer questions on pulse points/sites.

b) When assessing a patient''s pulse rate, what should a nurse evaluate? (2 marks)', 'b) The nurse evaluates the rate (beats per minute; normal adult 60-100), rhythm (regular or irregular - count for a full minute if irregular and check the apical pulse for a pulse deficit), volume or strength (bounding, normal, weak, thready), equality on both sides of the body, and the elasticity of the arterial wall, and compares the findings with the patient''s baseline and condition.', null, '[{"point": "Rate, rhythm, volume/ strength (amplitude), equality/ symmetry on both sides, elasticity of the artery wall; compare with apical pulse/ baseline", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-s4', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

1. Describe how Ms. Sumchum''s history of hypertension and hyperlipidaemia contributes to her stroke risk. What strategies should be implemented to manage these conditions in the context of her stroke treatment? (10 marks)', 'Contribution: long-standing hypertension damages the endothelium and arterial walls, speeds up atherosclerosis in the carotid and cerebral arteries and causes small-vessel disease, and is the single most important modifiable stroke risk factor. Hyperlipidaemia (high LDL cholesterol) deposits lipid in the arterial wall, forming atherosclerotic plaques that narrow vessels and can rupture, causing thrombosis in situ or emboli to the brain - here in the left MCA territory. Together they multiply the risk. Management in the acute phase: avoid lowering BP too fast - permissive hypertension maintains perfusion of the penumbra; if she is to receive thrombolysis, BP must be brought below 185/110 mmHg before and kept below 180/105 for 24 hours (e.g. IV labetalol), otherwise treat only if above 220/120. After the acute phase: long-term BP control to below about 130/80 with antihypertensives (continue/adjust lisinopril, add others), high-intensity statin therapy (atorvastatin 40-80 mg) to lower LDL, regular monitoring of BP and lipids, medication adherence (especially as she lives alone), diet low in salt and saturated fat, and lifestyle changes.', null, '[{"point": "Risk: hypertension damages vessel walls, accelerates atherosclerosis, small vessel disease; hyperlipidaemia → atherosclerotic plaques in carotid/ cerebral arteries → thrombosis/ embolism; combined effect", "marks": 5}, {"point": "Management: acute BP - permissive hypertension, lower only if >220/120, or to <185/110 before thrombolysis; then long-term target <130/80 with antihypertensives (ACE inhibitor); high-intensity statin, LDL target, diet, adherence, monitoring", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

2. Discuss the importance of timing in stroke treatment and define the ''therapeutic window''. Is Ms. Sumchum still within this window based on her symptoms and onset time? How does this influence her treatment plan? (10 marks)', 'Timing is critical: ''time is brain'' - roughly 1.9 million neurons die every minute of untreated large-vessel ischaemic stroke. Around the dead core is the ischaemic penumbra, tissue that can be saved only if blood flow is restored quickly. The therapeutic window is the period after symptom onset (last known well) in which reperfusion treatment is effective and its benefits outweigh the risks: IV thrombolysis with alteplase (or tenecteplase) within 4.5 hours, and mechanical thrombectomy for large-vessel occlusion within 6 hours (up to 24 hours in selected patients with imaging). Ms. Sumchum''s symptoms began about 2 hours ago (onset time must be confirmed - the neighbour''s report and last known well), and the CT shows ischaemia without haemorrhage, so she is within the window for thrombolysis. Her plan should therefore be urgent: rapid eligibility check (contraindications, anticoagulants, recent surgery, glucose normal), lower BP to below 185/110 mmHg before treatment, give IV thrombolysis aiming for door-to-needle time under 60 minutes, consider CT angiography for a large-vessel occlusion and thrombectomy, then close neurological and BP monitoring in a stroke unit. (Her severe headache warrants care, but the CT excluded haemorrhage.)', null, '[{"point": "''Time is brain'' - about 1.9 million neurons lost per minute; penumbra salvageable only if reperfused early; therapeutic window: period after onset when treatment (IV thrombolysis up to 4.5 h; thrombectomy up to 6-24 h) is effective and safe", "marks": 5}, {"point": "She is at about 2 h, ischaemic, no haemorrhage → within the window for IV alteplase/ tenecteplase (check eligibility, BP <185/110); urgent door-to-needle <60 min; consider thrombectomy (CTA for large vessel occlusion); monitoring", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

3. Evaluate the role of CT imaging in the diagnosis and management of stroke. When might these be indicated for Ms. Sumchum? (10 marks)', 'Non-contrast CT is the first imaging test in suspected stroke because it is fast and widely available. Its main role is to exclude intracranial haemorrhage, which is essential before giving thrombolytics or antiplatelets; it can also show early ischaemic changes (loss of grey-white differentiation, hyperdense MCA sign, ASPECTS score) and other causes of symptoms such as tumour or subdural haematoma. Its limitation is that early ischaemia may not be visible in the first hours, and MRI (diffusion-weighted) is more sensitive for small or posterior strokes. CT angiography shows the site of arterial occlusion (large-vessel occlusion suitable for thrombectomy) and carotid disease; CT perfusion distinguishes the core from the salvageable penumbra, guiding treatment in extended windows. For Ms. Sumchum: the immediate non-contrast CT on arrival (already done) excluded haemorrhage and supports thrombolysis; CT angiography (with or without perfusion) should be done promptly given her NIHSS of 12 and MCA signs to look for a large-vessel occlusion for thrombectomy; a repeat CT is indicated 24 hours after thrombolysis before starting antiplatelets, and urgently if she deteriorates (headache worsening, falling GCS, rising BP) to look for haemorrhagic transformation or oedema.', null, '[{"point": "Non-contrast CT: first, fast, available - excludes haemorrhage (essential before thrombolysis), shows early ischaemic changes/ ASPECTS, other causes (tumour); limitation - early ischaemia may not show, MRI more sensitive", "marks": 5}, {"point": "CT angiography (large vessel occlusion for thrombectomy), CT perfusion (penumbra, extended window); for her: immediate non-contrast CT on arrival (done), CTA/ CTP now for thrombectomy decision, repeat CT at 24 h after thrombolysis or if deterioration (haemorrhagic transformation)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 3, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

4. Describe the typical clinical features of a stroke that Ms. Sumchum presents with and how they correlate with the ischaemic area identified in the CT scan. (10 marks)', 'Ms. Sumchum shows the typical sudden-onset features of a stroke (the FAST signs - Face, Arm, Speech, Time): right-sided hemiparesis with weakness of the arm and leg, right facial droop, aphasia (difficulty forming coherent sentences) and headache, with an NIHSS of 12 (moderate stroke) and GCS 14. Correlation with the left MCA territory: the motor pathways (corticospinal tracts) cross at the medulla, so a lesion in the left hemisphere causes weakness of the right side of the body and lower face (upper motor neuron facial palsy sparing the forehead). The MCA supplies the lateral surface of the frontal, parietal and temporal lobes, including the motor and sensory cortex for the face and arm (so arm and face are usually more affected than the leg), and, in the dominant (usually left) hemisphere, Broca''s area (expressive aphasia) and Wernicke''s area (receptive aphasia). Other expected left-MCA features include right-sided sensory loss, right homonymous hemianopia and gaze preference to the left.', null, '[{"point": "Features: sudden onset, right hemiparesis (arm > leg typical of MCA), right facial droop (upper motor neuron), aphasia, headache; FAST signs; NIHSS 12 moderate", "marks": 5}, {"point": "Correlation: left hemisphere controls right side (crossing of corticospinal tracts); left MCA supplies lateral motor cortex (face, arm), Broca''s and Wernicke''s areas in dominant hemisphere → aphasia; also possible sensory loss, visual field defect", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 4, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

5. Describe the pathophysiology of ischaemic stroke. How does it differ from haemorrhagic stroke in terms of underlying causes and treatment approaches? (5 marks)', 'Ischaemic stroke (about 85% of strokes) occurs when an artery to the brain is blocked by a thrombus forming on an atherosclerotic plaque or by an embolus (e.g. from the heart in atrial fibrillation or from carotid plaque). Reduced blood flow deprives neurons of oxygen and glucose; energy failure leads to ion pump failure, glutamate excitotoxicity, calcium influx, free radicals and cell death in the core, surrounded by a salvageable penumbra. Haemorrhagic stroke is caused by rupture of a blood vessel - commonly from chronic hypertension (small penetrating arteries), aneurysm (subarachnoid haemorrhage), arteriovenous malformation, or anticoagulant use - with blood compressing brain tissue and raising intracranial pressure. Treatment: ischaemic stroke - restore flow with thrombolysis or thrombectomy, then antiplatelets and statins; haemorrhagic stroke - thrombolytics and antiplatelets are contraindicated; treatment is lowering BP, reversing anticoagulation, managing raised ICP and surgery (clot evacuation, aneurysm clipping or coiling).', null, '[{"point": "Ischaemic: blocked artery (thrombosis on atherosclerotic plaque, embolism - AF, carotid) → reduced flow → energy failure, excitotoxicity, cell death; core and penumbra", "marks": 2}, {"point": "Haemorrhagic: rupture of vessel (hypertension, aneurysm, AVM, anticoagulants) → bleeding, raised ICP; treatment differs: ischaemic - thrombolysis/ thrombectomy, antiplatelets; haemorrhagic - no thrombolytics, BP lowering, reverse anticoagulation, surgery", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 5, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case I
Patient background: Ms. Sumchum (pseudonym), a 65-year-old woman, is admitted to the emergency department with sudden onset of right-sided weakness, difficulty speaking and a severe headache that started about 2 hours ago. She has a history of hypertension and hyperlipidaemia and is on lisinopril and atorvastatin. She lives alone and did not recognise the symptoms as serious until her neighbour noticed her difficulty speaking and called for help.
Vital signs: BP 180/100 mmHg; HR 88 bpm; RR 20/min; temperature 98.6 °F.
Physical examination: right-sided hemiparesis with significant weakness of the right arm and leg; aphasia with difficulty forming coherent sentences; right facial droop; a severe headache described as ''the worst headache of my life''.
Neurological examination: GCS 14; NIH Stroke Scale (NIHSS) 12.
A non-contrast CT scan of the head shows an area of ischaemia in the left middle cerebral artery (MCA) territory, with no evidence of haemorrhage. Laboratory tests: normal blood glucose; elevated cholesterol; normal renal function.

6. Evaluate the importance of lifestyle modifications in stroke prevention. What specific changes should be recommended to patients to reduce their risk of stroke recurrence? (5 marks)', 'Lifestyle changes are central because most strokes are linked to modifiable risk factors (hypertension, high cholesterol, smoking, diabetes, obesity, inactivity, alcohol), and recurrence risk after a first stroke is high. Lifestyle measures lower BP, lipids and blood sugar and work together with medicines. Recommendations: stop smoking and avoid second-hand smoke; limit alcohol (no binge drinking, avoid local ara); reduce salt intake (less salty foods, suja and processed foods); eat a healthy diet rich in vegetables, fruit, whole grains and low in saturated fat; do regular physical activity (at least 150 minutes of moderate exercise a week, as able); maintain a healthy weight; control diabetes; take prescribed medicines (antihypertensives, statin, antiplatelets) regularly; manage stress and sleep; attend regular check-ups; and know the FAST warning signs to seek help immediately.', null, '[{"point": "Importance: most strokes linked to modifiable risk factors; lifestyle lowers BP, lipids, glucose, weight and complements drugs; recurrence risk high", "marks": 2}, {"point": "Changes: stop smoking, limit alcohol, reduce salt, healthy diet (DASH/ Mediterranean, fruits, vegetables), regular exercise (150 min/ week), weight control, diabetes control, medication adherence, stress management, regular check-ups, know warning signs", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case1', 6, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

1. What intervention should you, as the nurse, perform immediately? Why? (5 marks)', 'Immediately: give oxygen (his SpO2 is 90%, below the 94% target) and sit him upright (semi-Fowler''s) to ease breathing; attach a cardiac monitor and obtain a 12-lead ECG within 10 minutes; establish IV access; and, as ordered, give aspirin 300 mg to chew, sublingual nitroglycerin (BP is adequate) and IV morphine if pain persists. Why: oxygen increases oxygen supply to the ischaemic myocardium and corrects hypoxaemia; aspirin prevents further clot growth; nitrates and morphine relieve pain and reduce myocardial oxygen demand; the ECG identifies STEMI for urgent reperfusion; and monitoring detects life-threatening arrhythmias (ventricular fibrillation is the main early cause of death).', null, '[{"point": "Immediate: oxygen to keep SpO2 ≥ 94% (SpO2 90%), position upright, IV access, continuous ECG monitoring, 12-lead ECG within 10 min", "marks": 3}, {"point": "Rationale: improve myocardial oxygen supply, relieve pain/ hypoxia, detect arrhythmias/ STEMI; give aspirin 300 mg chewed and nitroglycerin/ morphine as ordered (MONA)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 1, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

2. What is myocardial infarction? List down the causes of MI. (8 marks)', 'Myocardial infarction is the death (necrosis) of part of the heart muscle due to prolonged ischaemia, when blood flow through a coronary artery is blocked or severely reduced; it is classified as ST-elevation MI (STEMI) or non-ST-elevation MI (NSTEMI). Causes: (1) rupture or erosion of an atherosclerotic plaque with thrombus formation in a coronary artery - the most common cause; (2) coronary artery spasm (e.g. cocaine); (3) coronary embolism; (4) spontaneous coronary artery dissection; (5) supply-demand mismatch (type 2 MI) from severe anaemia, hypotension, arrhythmia or hypoxia. Risk factors: smoking, hypertension, diabetes, high cholesterol, obesity (he weighs 104 kg), physical inactivity, older age, male sex, family history and stress.', null, '[{"point": "Definition: death (necrosis) of heart muscle due to prolonged ischaemia from blocked coronary blood flow; STEMI/ NSTEMI", "marks": 3}, {"point": "Causes: atherosclerotic plaque rupture with thrombosis (main), coronary spasm (cocaine), embolism, dissection, severe anaemia/ hypotension (supply-demand mismatch), arteritis; risk factors - smoking, hypertension, diabetes, hyperlipidaemia, obesity, age, male, family history, stress", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 2, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

3. What is a cardiac marker? Name the cardiac markers which you anticipate would be advised by the doctor for Mr. Tshewang. (7 marks)', 'A cardiac marker is a substance - an enzyme or protein - released into the blood when heart muscle cells are damaged; measuring it helps diagnose myocardial infarction and assess its size and timing. Expected markers for Mr. Tshewang: cardiac troponin I or T (preferably high-sensitivity troponin) - the most sensitive and specific, rises within 3-4 hours, peaks at 24-48 hours and stays raised for 7-14 days, measured serially (on arrival and repeated after 1-3 hours); CK-MB - rises in 4-6 hours and returns to normal in 48-72 hours, useful for detecting reinfarction; myoglobin - rises earliest (1-3 hours) but is not specific to the heart. Other tests that may be advised: lactate dehydrogenase (older test), BNP/NT-proBNP if heart failure is suspected, plus electrolytes, lipid profile, blood sugar and coagulation profile.', null, '[{"point": "Cardiac marker: substance (protein/ enzyme) released into blood when heart muscle is damaged, used to diagnose and monitor MI", "marks": 2}, {"point": "Markers: cardiac troponin I and T (high-sensitivity, most specific, rise 3-4 h, stay 7-14 days), CK-MB (rise 4-6 h, normal 48-72 h - reinfarction), myoglobin (early, not specific), also LDH, BNP for heart failure; serial testing", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 3, null, null, (select id from public.specialisations where code = 'nursing'), null)
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
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

4. What are the complications of MI? (5 marks)', 'Complications: arrhythmias (ventricular fibrillation and tachycardia - the main cause of early death - bradycardia and heart blocks, atrial fibrillation); left ventricular failure and pulmonary oedema; cardiogenic shock; recurrent ischaemia and reinfarction; mechanical complications - papillary muscle rupture with acute mitral regurgitation, ventricular septal rupture, free wall rupture with cardiac tamponade; left ventricular aneurysm; mural thrombus with embolism (stroke); pericarditis and Dressler''s syndrome; and sudden cardiac death.', null, '[{"point": "Arrhythmias (VF, VT, heart block), cardiogenic shock, heart failure/ pulmonary oedema, recurrent ischaemia/ reinfarction", "marks": 3}, {"point": "Mechanical: papillary muscle rupture (mitral regurgitation), ventricular septal rupture, free wall rupture/ tamponade, ventricular aneurysm, mural thrombus/ embolism (stroke), pericarditis/ Dressler''s syndrome, sudden death", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 4, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

5. What patient education topics would need to be covered with Mr. Tshewang? (10 marks)', 'Education topics: (1) what a heart attack is and its cause, in simple terms; (2) warning signs of another attack (chest pain, breathlessness, sweating) and what to do - rest, take sublingual GTN as instructed, and seek emergency help if pain lasts more than 5 minutes; (3) medicines - aspirin and a second antiplatelet, statin, beta-blocker, ACE inhibitor and nitrates: purpose, dose, side effects (bleeding, dizziness) and not stopping them without advice; (4) smoking cessation; (5) heart-healthy diet - less salt, saturated fat and sugar, more vegetables, fruit and fibre; (6) weight reduction, since he weighs 104 kg; (7) limiting alcohol; (8) gradual increase in physical activity and joining cardiac rehabilitation, with guidance on lifting, returning to work, driving and sexual activity; (9) stress management and adequate sleep; (10) controlling BP, blood sugar and cholesterol and attending follow-up appointments and tests.', null, '[{"point": "Disease and medicines: what MI is, warning signs and when to seek help/ call ambulance, medicines (aspirin, clopidogrel, statin, beta-blocker, ACE inhibitor, GTN use) - purpose, side effects, adherence", "marks": 4}, {"point": "Lifestyle: smoking cessation, heart-healthy diet (low salt/ fat), weight reduction (104 kg), alcohol limit, gradual activity/ cardiac rehabilitation, sexual activity/ return to work, stress management, control of BP/ diabetes/ lipids, follow-up", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 5, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Mr. Tshewang, a 57-year-old man, arrives at the Emergency Department with chest pain that began about one hour after dinner while he was working. He describes an intense ''crushing pressure'' in the centre of his chest, extending down his left arm and towards his back, severity 7/10. He is diaphoretic and pale, with shortness of breath.
On assessment there is no jugular vein distension or oedema; heart sounds are normal (S1 and S2 present); the lungs are clear with scattered wheezes. Vital signs: BP 140/90 mmHg; HR 92 bpm; SpO2 90% on room air; RR 32/min; temperature 36.9 °C; weight 104 kg. A 12-lead ECG, chest X-ray and cardiac markers were ordered.
He was diagnosed with myocardial infarction (heart attack), and interventions were implemented to relieve the chest pain and improve oxygenation.

6. Prepare a nursing care plan for this patient in relation to pain. Include the rationale against each intervention. (15 marks)', 'Assessment: crushing central chest pain radiating to the left arm and back, 7/10, with diaphoresis, pallor, tachypnoea (RR 32) and SpO2 90%. Nursing diagnosis: Acute pain related to myocardial ischaemia (imbalance between oxygen supply and demand) as evidenced by reported chest pain 7/10, diaphoresis and restlessness. Goal: the patient will report pain reduced to below 3/10 within 30-60 minutes, with stable vital signs and no further ischaemic changes. Interventions and rationale: (1) Assess pain using PQRST and a 0-10 scale every 5-15 minutes and after each intervention - gives a baseline and evaluates effectiveness. (2) Keep the patient on bed rest in a semi-Fowler''s position in a quiet, calm environment - reduces cardiac workload and oxygen demand and eases breathing. (3) Give oxygen to keep SpO2 at least 94% - increases oxygen supply to the ischaemic myocardium. (4) Give aspirin 300 mg to chew as ordered - inhibits platelet aggregation and limits clot growth. (5) Give sublingual nitroglycerin every 5 minutes up to three doses, checking BP (systolic above 90 mmHg) - dilates coronary arteries and veins, improving blood flow and reducing preload. (6) Give IV morphine in small doses as ordered if pain continues, watching respiration and BP - relieves pain and anxiety and reduces preload and oxygen demand. (7) Give beta-blockers as ordered if no contraindication - reduce heart rate and oxygen demand. (8) Monitor vital signs and continuous ECG; record a 12-lead ECG during pain - detects ischaemia, extension of infarction and arrhythmias. (9) Explain procedures and reassure the patient and family - anxiety increases catecholamines and oxygen demand. (10) Prepare for reperfusion (PCI or thrombolysis) as ordered - restoring blood flow is the definitive relief of ischaemic pain. (11) Provide stool softeners and help with activities - avoids straining (Valsalva) and exertion. Evaluation: pain score below 3/10, patient relaxed, vital signs and SpO2 within normal limits, no new ECG changes; document and revise the plan if pain persists.', null, '[{"point": "Assessment and diagnosis: acute chest pain related to myocardial ischaemia as evidenced by crushing pain 7/10, radiation, diaphoresis, tachypnoea; goal - pain reduced (e.g. <3/10) within 30-60 min, stable vitals", "marks": 4}, {"point": "Interventions with rationale: assess pain (PQRST) regularly - baseline/ evaluate; bed rest, semi-Fowler''s, calm environment - reduce oxygen demand; oxygen to SpO2 ≥94% - supply; aspirin, nitroglycerin, IV morphine as ordered - antiplatelet, vasodilation, analgesia/ reduce preload; monitor BP before nitrates/ morphine - hypotension; ECG monitoring - ischaemia/ arrhythmia; beta-blocker - reduce demand; reassurance/ anxiety reduction; prepare for reperfusion (PCI/ thrombolysis)", "marks": 9}, {"point": "Evaluation: pain score, vital signs, ECG changes, patient comfort; document and revise plan", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nursing", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nurse2024-case2', 6, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best position for a conscious patient having an acute asthma attack is', null, 'Sitting upright lowers the diaphragm and eases breathing.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Left lateral', false, 1), ('B', 'Trendelenburg', false, 2), ('C', 'High Fowler''s (sitting upright)', true, 3), ('D', 'Supine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The minimum acceptable urine output for an adult is about', null, 'Below 0.5 mL/kg/hour (about 30 mL/hour) is oliguria.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nursing'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nursing): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nursing'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5 mL/kg/hour', false, 1), ('B', '0.5 mL/kg/hour', true, 2), ('C', '0.1 mL/kg/hour', false, 3), ('D', '2 mL/kg/hour', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
commit;
