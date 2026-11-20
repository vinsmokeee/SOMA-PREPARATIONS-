-- ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'physiotherapy', 'Physiotherapy' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'physiotherapy') is null then raise exception 'unknown specialisation physiotherapy'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'physiotherapy');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'physiotherapy'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Physiotherapy');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'physiotherapy'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Physiotherapy');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'physiotherapy'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Physiotherapy');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 55-year-old patient presents with insidious onset of shoulder pain that is worse at night and difficulty lifting their arm. The most likely initial impairment to assess is:', null, 'Night pain and difficulty lifting suggest rotator cuff pathology: assess cuff strength first.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rotator cuff muscle strength', true, 1), ('B', 'Cervical active range of motion', false, 2), ('C', 'Glenohumeral joint accessory mobility', false, 3), ('D', 'Scapulothoracic rhythm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary muscle responsible for inspiration is:', null, 'The diaphragm is the main muscle of inspiration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Diaphragm', true, 1), ('B', 'Internal oblique', false, 2), ('C', 'External oblique', false, 3), ('D', 'Rectus abdominis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The center of gravity in a normal adult standing upright is located at:', null, 'The centre of gravity lies just anterior to S2.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'At the umbilicus', false, 1), ('B', 'Just anterior to S2 vertebra', true, 2), ('C', 'Level of S1 vertebra', false, 3), ('D', 'At the xiphoid process', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In stroke rehabilitation, the Brunnstrom approach describes recovery in:', null, 'Brunnstrom described six stages of motor recovery.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5 stages', false, 1), ('B', '6 stages', true, 2), ('C', '7 stages', false, 3), ('D', '3 stages', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A common physiotherapy intervention for post-operative total knee replacement in the first week is', null, 'Early after TKR: cryotherapy, passive/active-assisted ROM and early mobility.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cryotherapy and passive ROM exercises', true, 1), ('B', 'Jogging and stair climbing', false, 2), ('C', 'High-resistance strength training', false, 3), ('D', 'Plyometric training', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During a squat assessment, you observe a patient''s knees moving into significant valgus (knock- knee). Which of the following muscles is most likely weak and contributing to this movement fault?', null, 'Weak gluteus medius allows dynamic knee valgus.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tensor Fascia Latae (TFL)', false, 1), ('B', 'Biceps Femoris', false, 2), ('C', 'Gluteus Medius', true, 3), ('D', 'Adductor Longus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary goal of pursed-lip breathing in a patient with severe COPD is to:', null, 'Pursed-lip breathing keeps airways open and reduces air trapping.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Facilitate a more effective cough', false, 1), ('B', 'Strengthen the inspiratory muscles', false, 2), ('C', 'Prevent early airway closure and reduce air trapping', true, 3), ('D', 'Improve oxygenation by increasing FiO2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 22-year-old basketball player lands awkwardly after a jump. They report hearing a "pop," immediate swelling, and a feeling of the knee "giving way." The most likely injured structure is:', null, 'Pop, rapid swelling and giving way suggest an ACL tear.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Medial Meniscus', false, 1), ('B', 'Anterior Cruciate Ligament (ACL)', true, 2), ('C', 'Lateral Collateral Ligament (LCL)', false, 3), ('D', 'Patellar Tendon', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During a special test for shoulder impingement, the therapist passively flexes the patient''s shoulder to 90° and then forcibly internally rotates the arm. This maneuver is known as:', null, 'Shoulder flexed to 90° then internally rotated is the Hawkins-Kennedy test.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hawkins-Kennedy Test', true, 1), ('B', 'Apprehension Test', false, 2), ('C', 'Neer''s Test', false, 3), ('D', 'Empty Can Test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents with loss of pain and temperature sensation on the left side of the body and loss of proprioception on the right side below the level of a cervical lesion. This presentation is most characteristic of:', null, 'Contralateral pain/temperature loss with ipsilateral proprioception loss is Brown-Séquard syndrome.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anterior Cord Syndrome', false, 1), ('B', 'Brown-Séquard Syndrome', true, 2), ('C', 'Cauda Equina Syndrome', false, 3), ('D', 'Central Cord Syndrome', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a patient in the early stages of Parkinson''s disease, which of the following exercise interventions is MOST beneficial for improving gait amplitude and overcoming bradykinesia?', null, 'External cues improve step length and help overcome bradykinesia in Parkinson''s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Passive stretching of all major muscle groups', false, 1), ('B', 'Use of external cues, such as walking to the beat of a metronome or over floor markers', true, 2), ('C', 'High-intensity resistance training for the lower limbs', false, 3), ('D', 'Repetitive, rhythmic rocking in sitting', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On auscultation of a post-operative patient''s lungs, you hear a continuous low-pitched, snoring sound over the trachea and main bronchi. This is most indicative of:', null, 'Rhonchi are low-pitched, snoring sounds from large airways.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stridor', false, 1), ('B', 'Fine Crackles', false, 2), ('C', 'Wheeze', false, 3), ('D', 'Rhonchi', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Active Cycle of Breathing Techniques (ACBT) is a cornerstone of airway clearance. What is the correct sequence of its components?', null, 'ACBT: breathing control → thoracic expansion exercises → forced expiration technique (with breathing control between).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Breathing Control → Thoracic Expansion Exercises → Forced Expiration Technique', true, 1), ('B', 'Thoracic Expansion Exercises → Breathing Control → Forced Expiration Technique', false, 2), ('C', 'Forced Expiration Technique → Breathing Control → Thoracic Expansion Exercises', false, 3), ('D', 'Thoracic Expansion Exercises → Forced Expiration Technique → Breathing Control', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the ICF (International Classification of Functioning, Disability and Health) model, "the inability to climb stairs" is classified as a(n):', null, 'Inability to climb stairs is an activity limitation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Participation Restriction', false, 1), ('B', 'Health Condition', false, 2), ('C', 'Impairment', false, 3), ('D', 'Activity Limitation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A randomized controlled trial (RCT) shows that a new treatment is statistically significantly better than the current standard (p=0.04). To apply this to your patient, what is the MOST important next step?', null, 'Evidence-based practice combines research with clinical expertise and patient values.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wait for a systematic review to be published before considering the treatment.', false, 1), ('B', 'Dismiss the findings as the p-value is not less than 0.01.', false, 2), ('C', 'Immediately adopt the new treatment for all relevant patients.', false, 3), ('D', 'Evaluate if your patient is similar to those in the study and consider the treatment alongside clinical expertise and their values.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 2-year-old child presents with hypertonia in a "scissoring" posture, persistent primitive reflexes, and delayed motor milestones. This clinical picture is MOST suggestive of:', null, 'Scissoring, hypertonia and delayed milestones suggest spastic diplegic CP.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Spastic Diplegic Cerebral Palsy', true, 1), ('B', 'Down Syndrome', false, 2), ('C', 'Duchenne Muscular Dystrophy', false, 3), ('D', 'Brachial Plexus Palsy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary respiratory physiotherapy goal for an infant with cystic fibrosis?', null, 'Airway clearance of thick secretions is the main goal in CF.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To provide postural drainage only during pulmonary exacerbations', false, 1), ('B', 'To increase tidal volume through incentive spirometry', false, 2), ('C', 'To mobilize and clear thickened pulmonary secretions', true, 3), ('D', 'To strengthen inspiratory muscles', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Therapeutic handling in pediatric physiotherapy for a child with cerebral palsy should focus on:', null, 'Handling inhibits abnormal patterns and facilitates normal movement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Using firm handling on distal parts to guide movement', false, 1), ('B', 'Inhibiting abnormal patterns and facilitating normal alignment and movement sequences', true, 2), ('C', 'Letting the child move freely to encourage independence', false, 3), ('D', 'Focusing solely on strengthening within the child''s preferred movement patterns', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When treating a child with Osteogenesis Imperfecta (OI), the physiotherapist''s primary precaution is to:', null, 'In OI, handle gently and avoid excessive force to prevent fractures.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prioritize cardiovascular fitness over all other goals', false, 1), ('B', 'Focus intensely on high-impact activities to strengthen bones', false, 2), ('C', 'Avoid all weight-bearing activities', false, 3), ('D', 'Prevent fractures by handling the child gently and avoiding excessive force during stretching or exercises', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Multiple sclerosis (MS) primarily involves:', null, 'MS is demyelination of the central nervous system.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Muscle degeneration', false, 1), ('B', 'Destruction of peripheral nerves', false, 2), ('C', 'Demyelination of central nervous system neurons', true, 3), ('D', 'Neuromuscular junction defect', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In motor relearning, feedback is most effective when:', null, 'Early in motor learning, immediate and specific feedback works best.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Random and inconsistent', false, 1), ('B', 'Delayed and generalized', false, 2), ('C', 'Immediate and specific', true, 3), ('D', 'Absent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which syndrome often results from a hyperextension injury in an elderly individual with cervical stenosis and typically presents with greater weakness in the upper limbs than the lower limbs?', null, 'Central cord syndrome: hyperextension in cervical stenosis, arms weaker than legs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Posterior Cord Syndrome', false, 1), ('B', 'Anterior Cord Syndrome', false, 2), ('C', 'Cauda Equina Syndrome', false, 3), ('D', 'Central Cord Syndrome', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Neurogenic shock, which can occur immediately after a cervical or high thoracic SCI, is characterized by:', null, 'Neurogenic shock causes hypotension and bradycardia (loss of sympathetic tone).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypertension and tachycardia', false, 1), ('B', 'Hypotension and tachycardia', false, 2), ('C', 'Hypertension and bradycardia', false, 3), ('D', 'Hypotension and bradycardia', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents with pain and paresthesia in the lateral forearm and thumb, weakness in elbow flexion and forearm supination. The most likely involved cervical nerve root is:', null, 'C6: lateral forearm and thumb, elbow flexion and supination.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'C6', true, 1), ('B', 'C4', false, 2), ('C', 'C5', false, 3), ('D', 'C7', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with a complete T10 spinal cord injury will most likely have:', null, 'T10 complete: full upper limbs and partial trunk control; no lower limb function.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Full upper extremity strength, no trunk or lower extremity control', false, 1), ('B', 'Impaired hand function and impaired respiratory function', false, 2), ('C', 'Full upper extremity strength and partial trunk control', true, 3), ('D', 'Flaccid paralysis of all four limbs', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Following a median sternotomy for Coronary Artery Bypass Graft (CABG) surgery, a patient should be advised to:', null, 'After sternotomy, avoid lifting more than about 5-10 lb for 6-8 weeks.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Avoid lifting anything heavier than 5-10 lbs for 6-8 weeks', true, 1), ('B', 'Focus only on lower limb exercises', false, 2), ('C', 'Avoid deep breathing exercises to prevent pain', false, 3), ('D', 'Begin aggressive overhead exercises immediately', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary purpose of proprioceptive neuromuscular facilitation (PNF) diagonal patterns is to:', null, 'PNF diagonals mimic natural multi-joint functional movement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Isolate a single muscle group', false, 1), ('B', 'Provide a passive stretch only', false, 2), ('C', 'Mimic natural, multi-joint functional movement', true, 3), ('D', 'Treat respiratory conditions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The therapeutic ultrasound frequency of 3 MHz is typically used for:', null, '3 MHz ultrasound heats superficial tissues (1-2 cm).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fracture healing', false, 1), ('B', 'Superficial tissue heating (1-2 cm depth)', true, 2), ('C', 'Phonophoresis of corticosteroids', false, 3), ('D', 'Deep tissue heating (3-5 cm depth)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The presence of coarse crackles on auscultation is most commonly associated with:', null, 'Coarse crackles indicate secretions in larger airways.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bronchospasm (wheezing)', false, 1), ('B', 'Secretions in the large airways', true, 2), ('C', 'Pleural friction rub', false, 3), ('D', 'A completely collapsed lung (pneumothorax)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A patient with chronic low back pain tells you that a previous therapist said they "have the spine of an 80-year-old" and "must never lift anything heavy again". The patient is now fearful and avoids all physical activity.

a) Identify TWO unprofessional or harmful elements in the previous therapist''s communication. (2 marks)', 'a) 1. Threatening, catastrophic language ("spine of an 80-year-old") that is not evidence-based and creates fear (a nocebo effect). 2. An absolute, unjustified restriction ("never lift anything heavy") that encourages fear-avoidance and disability.', null, '[{"point": "Two harmful elements: catastrophising/nocebo language (''spine of an 80-year-old''), unjustified absolute restriction (''never lift''), creating fear-avoidance, not evidence-based", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s1', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A patient with chronic low back pain tells you that a previous therapist said they "have the spine of an 80-year-old" and "must never lift anything heavy again". The patient is now fearful and avoids all physical activity.

b) Describe THREE key principles of your education and advice to this patient, based on a biopsychosocial approach. (3 marks)', 'b) 1. Reassurance and pain education: back pain is common, the spine is strong, and pain does not equal damage; age-related changes are normal. 2. Stay active: graded exposure to feared activities, including lifting, with a progressive exercise programme. 3. Address beliefs and the psychosocial factors (fear, mood, work), set shared goals and promote self-management, with consistent, positive language.', null, '[{"point": "Three principles: reassure (pain ≠ damage, imaging findings normal with age), encourage graded activity and exercise, address fears/beliefs and self-management, shared goals", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s1', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 70-year-old patient with severe COPD (FEV1 <50% predicted) becomes severely breathless after walking 10 metres.

a) Name the validated outcome measure you would use to assess functional exercise capacity. (1 mark)', 'a) The Six-Minute Walk Test (6MWT); the incremental shuttle walk test is an alternative. With severe breathlessness, the 6MWT can be adapted (rests allowed) with SpO2 and Borg monitoring.', null, '[{"point": "Six-Minute Walk Test (or incremental shuttle walk test)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s2', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 70-year-old patient with severe COPD (FEV1 <50% predicted) becomes severely breathless after walking 10 metres.

b) List TWO breathing techniques you would teach to manage breathlessness and state the purpose of EACH. (4 marks)', 'b) 1. Pursed-lip breathing - breathing out slowly through pursed lips creates back-pressure that keeps small airways open, reduces air trapping, slows the breathing rate and eases breathlessness. 2. Breathing control in positions of ease (relaxed, low-chest/diaphragmatic breathing while leaning forward with arms supported) - reduces the work of breathing, uses the diaphragm efficiently and helps recovery from breathlessness. (Also accepted: paced/blow-as-you-go breathing during activity.)', null, '[{"point": "Two techniques with purposes: pursed-lip breathing (prevents airway collapse, slows RR), breathing control/diaphragmatic breathing, positions of ease (forward lean), paced breathing/ recovery", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s2', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 55-year-old patient with right hemiparesis after a left middle cerebral artery stroke has marked spasticity in the right upper limb, with a flexed elbow, wrist and fingers.

a) Define spasticity. (1 mark)', 'a) Spasticity is a motor disorder from an upper motor neuron lesion, characterised by a velocity-dependent increase in tonic stretch reflexes (muscle tone) with exaggerated tendon jerks (Lance, 1980).', null, '[{"point": "Velocity-dependent increase in tonic stretch reflexes (muscle tone) with exaggerated tendon jerks, from upper motor neuron lesion (Lance)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s3', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 55-year-old patient with right hemiparesis after a left middle cerebral artery stroke has marked spasticity in the right upper limb, with a flexed elbow, wrist and fingers.

b) List two non-pharmacological techniques to manage this spasticity. (2 marks)', 'b) Any two: prolonged/sustained stretching of the elbow, wrist and finger flexors; positioning the limb in extension (supported on a pillow); resting hand or wrist splints/serial casting; weight-bearing through the extended arm; functional electrical stimulation of the extensors; task-specific active training.', null, '[{"point": "Two techniques: sustained/prolonged stretching, positioning, splinting/serial casting, weight-bearing through limb, task-specific training, electrical stimulation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s3', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 55-year-old patient with right hemiparesis after a left middle cerebral artery stroke has marked spasticity in the right upper limb, with a flexed elbow, wrist and fingers.

c) Explain one functional implication of this spasticity pattern on daily activities. (2 marks)', 'c) The flexed elbow, wrist and fingers make it hard to open the hand to grasp and release objects and to reach, so tasks like eating, dressing (putting the arm into a sleeve) and washing are difficult; the clenched hand is also hard to keep clean, causing skin problems, and the flexed arm can affect balance and walking.', null, '[{"point": "One functional implication explained (difficulty reaching, grasping, hygiene of palm, dressing, eating, balance)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s3', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old long-distance runner presents with a 6-week history of insidious anterior knee pain, worse on descending stairs and prolonged sitting.

a) What is the most likely diagnosis? (1 mark)', 'a) Patellofemoral pain syndrome (runner''s knee).', null, '[{"point": "Patellofemoral pain syndrome", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s4', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old long-distance runner presents with a 6-week history of insidious anterior knee pain, worse on descending stairs and prolonged sitting.

b) Describe TWO key subjective history questions you would ask to confirm your hypothesis. (2 marks)', 'b) 1. "Have you recently changed your training - distance, speed, hills or footwear?" (overload). 2. "Where exactly is the pain, and is it worse with squatting, kneeling, stairs or after sitting with knees bent (''movie-goer''s sign'')?" Also ask about swelling, locking or giving way to rule out meniscal or ligament injury.', null, '[{"point": "Two questions: training load changes, aggravating activities (squatting, stairs, running downhill, ''movie sign''), location (peripatellar), swelling/locking/ giving way to exclude others, footwear", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s4', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old long-distance runner presents with a 6-week history of insidious anterior knee pain, worse on descending stairs and prolonged sitting.

c) Outline TWO key components of your initial exercise management plan. (2 marks)', 'c) 1. Strengthening of hip abductors and external rotators (e.g. side-lying hip abduction, clams) and quadriceps (e.g. wall squats, step-downs in a pain-free range). 2. Load management - temporarily reduce running volume and downhill running, then return gradually; plus education and flexibility work for quadriceps, hamstrings and iliotibial band.', null, '[{"point": "Two components: hip abductor/external rotator strengthening, quadriceps strengthening (closed chain), load management/relative rest, flexibility", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-s4', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

1. Based on the motor presentation, identify the type of motor deficit Mrs Pema Choden is exhibiting and explain why it has occurred. (3 marks)', 'She has a left hemiplegia (upper motor neuron lesion) - more severe in the arm than the leg - currently with flaccidity in the arm and emerging spasticity in the leg. It occurred because the right MCA infarct damaged the right motor cortex and corticospinal tract fibres (and internal capsule); these fibres cross at the medulla (pyramidal decussation) to control the left side. The MCA supplies the lateral cortex where the face and arm are represented, so the arm and face are affected more than the leg (supplied by the anterior cerebral artery).', null, '[{"point": "Left hemiplegia/hemiparesis (upper motor neuron), arm more affected than leg", "marks": 1.5}, {"point": "Explanation: right MCA infarct damages motor cortex/corticospinal tracts (internal capsule) on right, which control left side (decussation); MCA supplies arm/face area more than leg", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

2. List THREE specific assessment tools you would use to objectively measure her current status and justify each choice. (Do not use the Modified Ashworth Scale.) (6 marks)', '1. Fugl-Meyer Assessment (upper and lower extremity) - valid, reliable measure of motor recovery after stroke; tracks change from 0/5 in the arm and 2/5 in the leg. 2. Trunk Control Test or Postural Assessment Scale for Stroke (PASS) - she cannot sit unsupported and leans to the right; these measure sitting balance and trunk control at this early stage (Berg Balance Scale would have a floor effect now). 3. Barthel Index or Functional Independence Measure - measures dependence in ADLs and transfers (two-person assist), relevant to her goal of returning home; repeated to show progress. (Also accepted: Motor Assessment Scale, Star Cancellation Test for left neglect, Nottingham Sensory Assessment.)', null, '[{"point": "Three appropriate tools (e.g. Fugl-Meyer, Motor Assessment Scale, Trunk Impairment Scale/ Trunk Control Test, Berg Balance (later), Postural Assessment Scale for Stroke, Functional Independence Measure/Barthel, Star cancellation for neglect)", "marks": 3}, {"point": "Justification for each linked to her problems", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

3. Identify TWO key impairments and TWO activity limitations Mrs Pema Choden is experiencing. (4 marks)', 'Impairments (body structure/function): left-sided weakness/paralysis (arm 0/5, leg 1-2/5) with flaccid upper limb and shoulder subluxation; reduced light touch and proprioception on the left; poor trunk control and sitting balance with lean to the right; emerging spasticity in plantarflexors and hamstrings; reduced attention. Activity limitations: unable to sit unsupported; needs maximal assistance of two to transfer; unable to stand or walk; dependent in personal ADLs and unable to prepare a drink.', null, '[{"point": "Two impairments: left limb weakness/paralysis, flaccid arm with shoulder subluxation, reduced sensation/proprioception, poor sitting balance/trunk control, emerging spasticity, attention deficit", "marks": 2}, {"point": "Two activity limitations: unable to transfer independently, unable to walk, unable to sit unsupported, difficulty with ADLs (dressing, making tea)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

4. What is the most significant potential complication regarding her left upper limb at this stage? Describe ONE strategy to prevent it. (2 marks)', 'The most significant complication is hemiplegic shoulder pain from the subluxed, flaccid shoulder (soft tissue damage, possibly complex regional pain syndrome/shoulder-hand syndrome). Prevention: support the arm at all times - in sitting on a pillow or lap tray/arm trough with the shoulder in a neutral position, in lying with the shoulder protracted and supported - and train all staff and family never to pull on the affected arm during transfers or repositioning (taping or a supportive sling may be used when upright).', null, '[{"point": "Hemiplegic shoulder pain due to subluxation/ soft tissue trauma (also shoulder-hand syndrome)", "marks": 1}, {"point": "One strategy: supported positioning (pillows, lap tray, arm trough), correct handling - never pull on the arm, shoulder strapping/sling during upright, education", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 4, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

5. Outline your physiotherapy goals for Mrs Pema Choden for the first week of rehabilitation, including ONE short-term goal for each category. (6 marks)', 'SMART goals for week 1: Impairment: (a) maintain a pain-free left shoulder with no increase in subluxation, and (b) achieve active knee extension and hip extension against gravity in bridging. Activity: (a) sit on the edge of the bed with feet supported and close supervision for 2 minutes without leaning to the right; (b) transfer bed to chair with a sliding board and moderate assistance of one person. Participation/education: (a) Mrs Choden and her husband correctly position and support her left arm and leg, and (b) she sits out of bed for meals and tea with her husband for 30 minutes twice daily, linking to her goal of returning to her kitchen.', null, '[{"point": "Goals SMART and realistic for week 1", "marks": 2}, {"point": "Impairment-level goal (e.g. sitting balance/ trunk control, shoulder protection, active hip/knee movement)", "marks": 1.5}, {"point": "Activity-level goal (e.g. sit unsupported 2 min, transfer with assistance of one)", "marks": 1.5}, {"point": "Participation/ education goal (e.g. patient and husband trained in positioning/ handling; sit out of bed for meals)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 5, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

6. Design a treatment plan for your FIRST TWO treatment sessions with Mrs Pema Choden.
(i) List FOUR different treatment techniques or activities you would include. (4 marks)
(ii) For EACH technique, give a brief rationale linking it to her specific problems. (8 marks) (12 marks)', '1. Positioning and shoulder protection (arm supported, correct bed/chair positioning, handling education) - flaccid arm with subluxation and emerging leg spasticity; prevents shoulder pain and contractures. 2. Sitting balance and trunk control training (sitting at the edge of the bed, weight shift towards the left, reaching tasks, mirror feedback) - she leans to the right and lacks protective reactions; trunk control is the foundation for transfers, standing and kitchen tasks. 3. Transfer and sit-to-stand practice with assistance (weight-bearing through the left leg, facilitation at the knee) - she needs two people to transfer; task-specific practice drives recovery and increases independence. 4. Active-assisted exercises for the left leg (bridging, hip and knee flexion/extension, ankle dorsiflexion) plus sensory input through weight-bearing - leg muscles are 1-2/5 with reduced proprioception; repetition promotes neuroplasticity and strength and prevents spasticity-related shortening. Education throughout on attention, safety and goals keeps her motivated.', null, '[{"point": "(i) Four appropriate techniques: positioning and shoulder protection; sitting balance/trunk control training; sit-to-stand/ transfer practice; active-assisted LL exercises (bridging, knee/hip); sensory stimulation/ weight-bearing through left side; patient/family education", "marks": 4}, {"point": "(ii) Rationale for each linked to her problems (2 marks each)", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 6, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

7. As Mrs Pema''s recovery progresses, spasticity is likely to increase.
(i) Describe ONE stretching technique and ONE positioning strategy to manage spasticity in her left plantarflexors. (4 marks)
(ii) Explain the neurophysiological rationale for using sustained stretching. (3 marks) (7 marks)', '(i) Stretch: a slow, prolonged stretch of the gastrocnemius and soleus - e.g. standing on a tilt table or wedge with the knee straight and heel down for 20-30 minutes, or manual slow sustained stretches held 30-60 seconds and repeated, avoiding fast stretches that trigger the stretch reflex. Positioning: keep the ankle at neutral (90°) - in lying with the foot supported and no heavy bedclothes pushing it into plantarflexion, and in sitting with the foot flat on the floor; an ankle-foot orthosis or resting night splint can hold the position.
(ii) Sustained stretch reduces the excitability of the stretch reflex: prolonged tension activates Golgi tendon organs (autogenic inhibition) and the muscle spindle adapts, lowering alpha motor neurone excitability, so tone falls. It also produces viscoelastic lengthening of muscle and connective tissue and maintains sarcomere number, preventing contracture.', null, '[{"point": "(i) Stretch: prolonged passive/ standing stretch of gastrocnemius-soleus (e.g. tilt table, standing on wedge, 20-30 min or 30-60 s holds) with knee straight", "marks": 2}, {"point": "Positioning: ankle at neutral (90°) with foot supported, ankle-foot orthosis/ resting splint, avoid pressure on ball of foot", "marks": 2}, {"point": "(ii) Rationale: sustained stretch reduces muscle spindle sensitivity/ alpha motor neuron excitability (autogenic inhibition via Golgi tendon organs), viscoelastic changes, prevents sarcomere loss/contracture", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 7, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

8. Considering her goal of making tea, describe the THREE main components of kitchen-related function you would need to assess and rehabilitate before a safe discharge home. (3 marks)', '1. Standing balance and mobility - standing for several minutes, turning, reaching to cupboards and walking short distances in the kitchen safely (with or without an aid). 2. Upper limb function and one-handed techniques - reaching, grasping, pouring and carrying (often with the right hand, using adaptive equipment such as a kettle tipper, non-slip mats and a trolley for carrying). 3. Cognition and safety awareness - attention, sequencing the task, left-sided neglect, and safe handling of hot water and the stove (assessed jointly with occupational therapy in a kitchen assessment).', null, '[{"point": "Standing balance and safe mobility in the kitchen (including turning, reaching, with/without aid)", "marks": 1}, {"point": "Upper limb/ one-handed function: reaching, grasping, carrying (hot liquids) with adaptations", "marks": 1}, {"point": "Cognition and safety: attention, sequencing, neglect, hazard awareness (hot water, stove)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 8, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

9. What is the recommended gait aid for initial ambulation in a patient with left hemiplegia and poor balance? Justify your answer. (2 marks)', 'A hemi-walker or broad-based quadripod stick held in the right (unaffected) hand, after initial practice in parallel bars. A standard frame cannot be used because her left arm is non-functional; a quad stick or hemi-walker gives a wide, stable base of support for her poor balance while allowing one-handed use.', null, '[{"point": "Hemi-walker or quad (broad-based) stick in right hand (or parallel bars initially)", "marks": 1}, {"point": "Justification: wide stable base, used with one (right) hand as left arm non-functional; frame cannot be used", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 9, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Rehabilitation after stroke
Patient: Mrs Pema Choden, 72, retired school teacher. Past history: type 2 diabetes (well controlled), osteoarthritis of both knees (right more than left). Lives with her husband in a two-storey house with 12 stairs to the bedroom. Independent in basic ADLs but stopped her daily walks due to knee pain. Right-hand dominant.
Admitted 5 days ago with a right-sided cerebrovascular accident: left hemiplegia, facial asymmetry and slurred speech. CT confirmed an ischaemic infarct in the right middle cerebral artery (MCA) territory.
Day 5 status:
- Cognition and communication: alert, oriented to person and place; difficulty with attention and concentration; mild expressive dysphasia but understands simple commands.
- Sensation: diminished light touch and proprioception in the left upper and lower limbs.
- Tone: flaccid (hypotonic) left upper limb; emerging spasticity (Modified Ashworth 1+) in the left plantarflexors and hamstrings.
- Motor: left upper limb no volitional movement (0/5) at shoulder, elbow, wrist and fingers; shoulder subluxation of about 1 finger width. Left lower limb: hip 2/5, knee 2/5, ankle 1/5, no toe movement. Right side 4+/5.
- Balance and function: needs moderate support to sit upright, leans markedly to the right, no protective extension on the left. Bed-to-chair transfer needs maximal assistance of two with a sliding board. Not yet walking.
- Goal: frustrated but highly motivated: "I want to go back home and be able to make tea in my kitchen without falling."

10. List FIVE essential considerations for discharge planning to ensure Mrs Pema''s safety and continued progress at home. (5 marks)', '1. Home environment and access - 12 stairs to the bedroom: assess stair climbing, install rails or move the bed downstairs; home visit by OT/PT. 2. Equipment - walking aid, shower chair, raised toilet seat, grab rails and kitchen aids. 3. Carer support and training - her husband''s capacity, training in safe transfers, positioning and exercises; need for extra help. 4. Continued rehabilitation - referral to outpatient/community physiotherapy and a clear home exercise programme with goals. 5. Health and safety - falls prevention, management of diabetes and knee osteoarthritis, medication adherence and secondary stroke prevention, plus an emergency plan and follow-up appointments.', null, '[{"point": "Five considerations (1 each): home environment/ stairs (12 steps) - bedroom downstairs or rails; equipment (gait aid, shower chair, raised toilet, kitchen aids); carer training/ husband''s ability and support; follow-up community/outpatient rehab and home exercise programme; falls prevention, medication/ diabetes and secondary stroke prevention, knee OA management, communication/ referral", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case1', 10, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

1. Based on the subjective and objective findings, what is your primary clinical hypothesis? Give THREE key pieces of evidence to support it. (5 marks)', 'Primary hypothesis: acute posterolateral lumbar disc herniation (left L4/5 or L5/S1) with left lumbar radiculopathy (nerve root irritation and mild compression). Evidence: 1. Mechanism - repeated bending, twisting and heavy lifting; pain aggravated by flexion, sitting and coughing/sneezing (raised intradiscal pressure). 2. Neurological signs - tingling in the left lateral calf and dorsum of foot, weak dorsiflexion, reduced Achilles reflex and reduced sensation in the 1st web space, with a positive left slump test. 3. Directional preference - repeated extension centralises symptoms while repeated flexion peripheralises them, typical of a discogenic derangement; antalgic lateral shift is also common.', null, '[{"point": "Hypothesis: acute lumbar disc herniation (posterolateral, L4/5 or L5/S1) with left L5 radiculopathy", "marks": 2}, {"point": "Three pieces of evidence: mechanism (repeated flexion/ lifting), worse with sitting/ flexion/ cough-sneeze, leg tingling in dermatome, neuro deficits, positive slump, centralisation with extension", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

2. (i) Identify the most likely spinal nerve root involved. (1 mark)
(ii) Give TWO objective findings that support this. (2 marks) (3 marks)', '(i) The left L5 nerve root. (ii) Weak left ankle dorsiflexion (4/5) - L5 myotome (with extensor hallucis longus); reduced light touch in the web space between the 1st and 2nd toes - L5 dermatome (plus tingling in the lateral calf and dorsum of the foot). The diminished Achilles reflex is an S1 sign, suggesting some S1 involvement too (e.g. an L5/S1 disc affecting both roots).', null, '[{"point": "(i) Left L5 nerve root (note S1 features from reflex)", "marks": 1}, {"point": "(ii) Two findings: weak ankle dorsiflexion (and EHL), reduced sensation in 1st-2nd toe web space, (positive slump); diminished Achilles suggests S1 overlap", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

3. The concepts of centralisation and peripheralisation are crucial.
(i) Define both terms. (2 marks)
(ii) Why is centralisation a positive prognostic indicator? (2 marks) (4 marks)', '(i) Centralisation: with repeated movements or sustained positions, referred symptoms in the leg retreat towards the midline of the spine and lessen or disappear (central pain may briefly increase). Peripheralisation: symptoms spread further down the limb (distally) with a movement. (ii) Centralisation shows the problem is mechanically responsive (a reducible derangement with an intact annulus) and that a directional preference exists - here extension. Research shows centralisers have a good prognosis with conservative care, recover faster, have less disability and are less likely to need surgery.', null, '[{"point": "(i) Centralisation: distal/referred symptoms move towards midline/ spine (abolished) with repeated movements; peripheralisation: symptoms spread distally", "marks": 2}, {"point": "(ii) Indicates mechanically responsive (reducible) disc derangement, outer annulus intact; predicts good outcome with directional preference exercises, lower surgery need, faster recovery", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

4. List THREE key impairments and TWO key activity limitations for Mr Dorji. (The paper says ''Mr. Matthews'', a slip for Mr Dorji.) (5 marks)', 'Impairments: severe low back and left leg pain; reduced lumbar range (flexion 20%, left side flexion 30%) with antalgic lateral shift; neurological deficit - weak left dorsiflexion, reduced Achilles reflex and sensation; paraspinal muscle guarding; reduced neural mobility (positive slump) and hamstring tightness. Activity limitations: unable to sit and drive for long; difficulty bending to put on socks and shoes; unable to lift; difficulty playing with his children; currently unable to work.', null, '[{"point": "Three impairments: pain, reduced lumbar ROM (flexion, left side flexion), neurological deficit (weak dorsiflexion, reflex, sensation), muscle guarding/ spasm, lateral shift/ altered posture, reduced neural mobility", "marks": 3}, {"point": "Two activity limitations: sitting/ driving, bending to dress (socks and shoes), lifting, playing with children, working", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 4, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

5. Identify TWO ''yellow flags'' present in this case. (2 marks)', 'Any two: fear-avoidance behaviour (avoiding all lifting and moving very cautiously); the belief that rest is the treatment (previous episodes ''resolved with rest''); moderate work-related stress; being off work with a physically demanding, sedentary job; low physical activity outside work.', null, '[{"point": "Two yellow flags: fear-avoidance (avoiding all lifting/ activity), belief that rest is the cure (previous episodes resolved with rest), work-related stress, off work, sedentary/ smoking", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 5, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

6. What is the single most important ''red flag'' to rule out in this presentation, and how did the case information provide reassurance? (2 marks)', 'Cauda equina syndrome. Reassurance: he reports normal bladder and bowel function, symptoms are one-sided with only mild single-root signs, and there is no reported saddle anaesthesia or bilateral leg weakness (these should still be specifically checked and he should be told to seek urgent help if they appear).', null, '[{"point": "Cauda equina syndrome", "marks": 1}, {"point": "Reassurance: normal bladder and bowel function, no saddle anaesthesia reported, unilateral symptoms, no bilateral weakness", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 6, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

7. Outline your physiotherapy management goals for the first 1-2 weeks (acute phase). (6 marks)', '1. Reduce pain and irritability and centralise and abolish leg symptoms (e.g. leg tingling gone, pain at rest ≤2/10). 2. Restore movement - correct the lateral shift and improve extension, then gradually flexion. 3. Education and reassurance - understand the condition, reduce fear-avoidance, stay active and avoid bed rest; perform an independent home programme of extension exercises several times a day. 4. Function - put on socks and shoes independently, sit 30 minutes with lumbar support, walk regularly, and plan graded return to driving/work. 5. Monitor neurological status (myotomes, reflexes, sensation) at each session.', null, '[{"point": "Pain and irritability reduction, centralise symptoms", "marks": 1.5}, {"point": "Restore lumbar movement (extension, flexion), correct lateral shift", "marks": 1.5}, {"point": "Reassure/ educate, reduce fear, stay active, independent home programme", "marks": 1.5}, {"point": "Function: dressing, sitting tolerance, graded return to work/ driving; monitor neuro status", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 7, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

8. Design a treatment plan for the first two sessions.
(i) List THREE specific treatment strategies you would use. (3 marks)
(ii) For EACH strategy, give a clear physiological or clinical rationale. (6 marks) (9 marks)', '1. Directional preference exercises (McKenzie) - lateral shift correction then repeated prone extension (press-ups) every 2-3 hours. Rationale: extension centralised his symptoms; repeated end-range extension is thought to reduce the posterior disc displacement and relieve nerve root irritation, giving rapid pain relief. 2. Education and advice - explain the condition and good prognosis, stay active, avoid prolonged sitting and flexion for now, use a lumbar roll when sitting, walk regularly. Rationale: reduces fear-avoidance and catastrophising (yellow flags), improves self-efficacy and outcomes; avoiding flexion prevents peripheralisation. 3. Pain-relieving modalities and positioning - heat or ice, rest positions of ease (side-lying, or prone if tolerated), gentle walking. Rationale: reduces muscle guarding and pain via pain-gate and circulatory effects, so he can do his exercises; walking keeps the spine moving and aids disc nutrition. (Also accepted: gentle mobilisation in extension.)', null, '[{"point": "(i) Three strategies: McKenzie directional preference - repeated extension in lying (after lateral shift correction), education/reassurance and activity advice, pain relief (positioning, ice/heat), walking programme, posture with lumbar roll; gentle manual therapy", "marks": 3}, {"point": "(ii) Rationale for each (2 marks each)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 9,
    972, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 8, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

9. Mr Dorji''s job as a bus driver is a major aggravating factor. Describe THREE specific pieces of advice to manage his pain at work on his return. (3 marks)', '1. Adjust the driving seat and use a lumbar roll to keep his lumbar lordosis (backrest slightly reclined, seat close enough to reach pedals without slouching). 2. Take regular breaks (e.g. every 30-60 minutes at stops) to get out, walk and do 5-10 standing back extensions. 3. Avoid lifting or bending immediately after a long drive (discs are more vulnerable after prolonged sitting), and agree a graded return with shorter shifts at first; manage stress and keep up his home exercises.', null, '[{"point": "Three pieces of advice (1 each): lumbar roll/ seat adjustment (lordosis, seat close, upright backrest), regular breaks every 30-60 min to walk and do standing extensions, avoid lifting/ bending after long sitting, graded return/ shorter shifts, manage stress", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 9, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

10. As he moves into the sub-acute phase (weeks 2-4), his programme must evolve. Describe TWO key exercise progressions you would implement, specifying their purpose. (4 marks)', '1. Restore flexion and full movement - once symptoms are centralised and stable, reintroduce flexion gradually (flexion in lying, then sitting, then standing), always followed by extension, to regain normal range without provoking leg symptoms. 2. Progressive strengthening and functional training - trunk and hip strengthening (bridging, bird-dog, planks) progressing to graded lifting technique and work-specific tasks, to build load tolerance, prevent recurrence and return him to work and playing with his children. (Also: neural mobility sliders and aerobic conditioning such as brisk walking; smoking cessation advice.)', null, '[{"point": "Two progressions with purpose: gradual reintroduction of flexion once centralised (restore full ROM); core/ trunk stabilisation and strengthening (motor control, load tolerance); graded lifting/ functional training; neural mobilisation (slump sliders); aerobic walking", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 10, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

11. Despite 4 weeks of physiotherapy, the neurological deficit (reduced reflex and sensation) persists and leg pain is unchanged. What is your next step in management? (2 marks)', 'Re-assess thoroughly and refer him back to his doctor for review by a spinal (orthopaedic or neurosurgical) specialist, with MRI to confirm the level and degree of nerve root compression and to consider options such as nerve root/epidural injection or surgical discectomy; any progressive weakness or cauda equina signs need urgent referral.', null, '[{"point": "Re-assess and refer to doctor/ spinal specialist (orthopaedic/ neurosurgery) for medical review, MRI and consideration of further management (e.g. epidural injection or surgery); monitor progressive deficit", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 11, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

12. Explain why a course of NSAIDs (e.g. ibuprofen) might be prescribed for this condition and what their main mechanism of action is. (2 marks)', 'NSAIDs reduce the inflammatory reaction around the irritated nerve root and disc and relieve pain, helping him stay active and do his exercises. They act by inhibiting the cyclo-oxygenase enzymes (COX-1 and COX-2), reducing the production of prostaglandins that cause inflammation and sensitise pain receptors (with caution because of his hypertension and gastric side effects).', null, '[{"point": "Why: reduce pain and inflammation around irritated nerve root/ disc, allow activity and exercise", "marks": 1}, {"point": "Mechanism: inhibit cyclo-oxygenase (COX-1/COX-2), reducing prostaglandin synthesis", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 12, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Acute low back pain with leg symptoms
Patient: Mr Dorji, 45, bus driver. Hypertension (controlled). Two previous episodes of low back pain in 10 years, each resolving within a week with rest. Married with two children; sedentary outside work; smokes 10 cigarettes a day; moderate work-related stress.
Presenting: 7-day history of severe low back pain that began gradually after two days building a shed (much bending, twisting and lifting heavy timber).
Subjective: central and left low lumbar pain (L4-S1); highly irritable - 3/10 at rest rising to 8/10 with minimal provocation; worse with sitting (especially driving), forward bending, coughing/sneezing; better lying on his right side with knees bent; stiff and very painful for about 30 minutes in the morning; worse towards the end of a driving shift. Vague intermittent tingling in the left lateral calf and dorsum of the foot; no reported leg weakness; bladder and bowel normal. Off work for 3 days; struggles to put on socks and shoes; avoiding all lifting. Goals: return to work soon and play with his children without pain.
Objective: antalgic lean to the right; reduced lumbar lordosis; moves cautiously. Flexion limited to 20% by severe central pain (fingers to mid-thigh); extension 50% (local pain); right side flexion 70%; left side flexion 30% (sharp left pain). Repeated extension in lying centralises and reduces central and leg symptoms; repeated flexion in sitting increases left calf symptoms (peripheralisation). Neuro: left ankle dorsiflexion 4/5 (right 5/5), other myotomes 5/5; left Achilles reflex 1+ (right 2+); subtle reduced light touch in the web space between the left 1st and 2nd toes. Palpation: severe tenderness and guarding over left L5/S1 paraspinals. Slump test positive on the left (reproduces calf pain); SLR negative for neural pain but limited to 60° by hamstring tightness; femoral nerve test negative.

13. Describe the key differences in presentation between neurogenic claudication (from lumbar spinal stenosis) and Mr Dorji''s symptoms. (3 marks)', 'Neurogenic claudication usually affects older people (over 60) with gradual onset; symptoms are often bilateral and diffuse (aching, heaviness, cramping or numbness in the buttocks and legs), brought on by walking or standing (extension narrows the canal) and relieved by sitting or bending forward (e.g. leaning on a shopping trolley), with few neurological signs at rest. Mr Dorji is 45 with acute onset after lifting; his symptoms are one-sided and follow a specific root (L5), are worse with sitting and flexion and better with extension, with clear neurological signs - typical of disc-related radiculopathy.', null, '[{"point": "Age/onset: stenosis older (>60), gradual; Dorji 45, acute after lifting", "marks": 1}, {"point": "Aggravating/easing: stenosis worse with walking/standing/extension, relieved by sitting/flexion (shopping trolley sign); Dorji worse with sitting/flexion, better with extension", "marks": 1}, {"point": "Symptoms: stenosis often bilateral, diffuse, heaviness/ cramping, few neuro signs at rest; Dorji unilateral dermatomal, specific root signs", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Physiotherapy", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2025-case2', 13, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q13', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which outcome measure is most commonly used to assess functional exercise capacity in a patient with COPD?', null, 'The 6MWT measures functional exercise capacity in chronic respiratory disease.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Glasgow Coma Scale', false, 1), ('B', 'Modified Ashworth Scale', false, 2), ('C', 'Berg Balance Scale', false, 3), ('D', 'Six-Minute Walk Test', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
