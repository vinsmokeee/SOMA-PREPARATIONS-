-- ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'physiotherapy', 'Physiotherapy' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'physiotherapy') is null then raise exception 'unknown specialisation physiotherapy'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '________________ is where the sternum projects forward and is held in a prominent position by the ribs and costal cartilages.', null, 'Pectus carinatum (pigeon chest): the sternum projects forward.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pectus carinatum', true, 1), ('B', 'Pectus arcuatum', false, 2), ('C', 'Pectus excavatum', false, 3), ('D', 'Barrel chest', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is the holistic model of patient care and treatment which takes into consideration a person’s physical abilities, emotional and psychological state and greater environmental factors?', null, 'The biopsychosocial model considers biological, psychological and social/ environmental factors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Medical Model', false, 1), ('B', 'Social model', false, 2), ('C', 'Disability Model', false, 3), ('D', 'Biopsychosocial Model', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Rapid shallow breathing is also known as____________', null, 'Tachypnoea is rapid shallow breathing; hyperpnoea is deep breathing.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hyperpnea', false, 1), ('B', 'Biot’s breathing', false, 2), ('C', 'Tachypnea', true, 3), ('D', 'Hyperventilation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '_______________ is a continuous whistling sound produced by air passing through a narrowed airway.', null, 'A wheeze is a continuous musical/ whistling sound from narrowed airways.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stridor', false, 1), ('B', 'Crackles', false, 2), ('C', 'Stertor', false, 3), ('D', 'Wheeze', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'While the extremity or joint(s) is held in a static position by the therapist, the patient is asked to describe the position verbally or to duplicate the position of the extremity or joint(s) with the contralateral extremity. What is being tested in the patient?', null, 'Describing or matching a static joint position tests position sense (proprioceptive awareness); kinaesthesia is sense of movement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kinesthesia', false, 1), ('B', 'Stereognosis perception', false, 2), ('C', 'Proprioceptive awareness', true, 3), ('D', 'Barognosis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which cranial nerve supplies taste to the anterior two-thirds of the tongue?', null, 'Taste from the anterior two-thirds of the tongue is carried by the facial nerve (chorda tympani).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Trigeminal', false, 1), ('B', 'Facial', true, 2), ('C', 'Glossopharyngeal', false, 3), ('D', 'Oculomotor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents with very painful, red and dry skin on their upper shoulders after spending the day outside gardening with no sun protection. What is this patient’s MOST likely diagnosis?', null, 'Sunburn - painful, red, dry skin without blisters - is a superficial (epidermal) burn.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Superficial partial thickness burn', false, 1), ('B', 'Deep partial thickness burn', false, 2), ('C', 'Superficial burn', true, 3), ('D', 'Full thickness burn', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When classifying a burn injury by depth, which ONE of the following extends through the entire dermis and into the hypodermis?', null, 'Full-thickness burns destroy the entire dermis and extend into the hypodermis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Subcutaneous', false, 1), ('B', 'Full thickness', true, 2), ('C', 'Superficial partial thickness', false, 3), ('D', 'Deep partial thickness', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why is estimating the initial total body surface area affected after a burn injury important as a life-saving measure? Select the most appropriate answer.', null, '%TBSA is needed to calculate fluid resuscitation (e.g. Parkland formula).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To estimate amount of blanching on the skin', false, 1), ('B', 'To work out the body surface area damaged', false, 2), ('C', 'To calculate an accurate measurement for fluid resuscitation', true, 3), ('D', 'To improve the wound care and management', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following movements is used to assess the strength of the L3 myotome?', null, 'The L3 myotome is tested by knee extension (L2: hip flexion; L4: ankle dorsiflexion; L5: big toe extension).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ankle Dorsiflexion', false, 1), ('B', 'Hip Flexion', false, 2), ('C', 'Big toe Extension', false, 3), ('D', 'Knee Extension', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which ONE of the following repeated movement tests should you add to your assessment if a patient has a lateral shift?', null, 'For a lateral shift, add side glides (McKenzie).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rotation', false, 1), ('B', 'Extension', false, 2), ('C', 'Flexion', false, 3), ('D', 'Slide glides', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are assessing a patient with low back pain. During the straight leg raise test, the patient starts to get symptoms at around 75-80 degrees of flexion. You think that this might be due to stretching of their hamstrings. Which ONE of the following tests could you perform to distinguish between hamstrings stretch and sciatic nerve tension?', null, 'The slump test adds neural tension (neck flexion) to distinguish neural from hamstring symptoms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thomas test', false, 1), ('B', 'Slump test', true, 2), ('C', 'Femoral nerve tension test', false, 3), ('D', 'Obers test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents with low back pain. They appear to be in a lot of pain and have high fear avoidance. How would you approach the functional screen? Select the best answer.', null, 'With high pain and fear-avoidance, adapt the screen to what the patient is willing to do.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ask them to complete a full functional screen, so you can objectively determine irritability.', false, 1), ('B', 'Get a sense of what they are willing to do; for example, see if they can bend forward', true, 2), ('C', 'Get them to visualize the movement and then perform it.', false, 3), ('D', 'Ask them to do a full squat to get an understanding of their general range of motion without them having to do too many movements', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Complete the sentence with the correct answer. If just one nerve root is involved in a patient’s presentation, we will not see a huge sensory or strength loss. Comparing _________ can help us to pick up on subtle differences.', null, 'Comparing left and right sides reveals subtle sensory or strength differences.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Left and right', true, 1), ('B', 'Proximal and distal', false, 2), ('C', 'ROM and muscle strength', false, 3), ('D', 'One repetitions maximum and ten repetition maximum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 17-year-old cricket player presents with low back pain. Her pain has come on gradually, and it is worse when she is bowling. On examination, you observe that she has pain with extension. While palpating her lumbar spine, you notice a step-off. Based on this history, which ONE of the following conditions do you think is more likely?', null, 'A young bowler with extension pain and a palpable step-off suggests spondylolysis/ spondylolisthesis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Back Strain', false, 1), ('B', 'Disc pathology', false, 2), ('C', 'Spondylolisthesis', true, 3), ('D', 'Instability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the preferred term for spasticity approved by the European consensus on the concepts and measurement of the pathophysiological neuromuscular responses to passive muscle stretch? Select ONE answer.', null, 'The European consensus recommends the term ''hyper-resistance'' to passive stretch.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hyper-resistance', true, 1), ('B', 'Rigidity', false, 2), ('C', 'Hyperactivity', false, 3), ('D', 'Hypertonia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The neurological component of spasticity is characterized by disinhibition occurring at the ___________________ as a direct result of the neurological insult.', null, 'Spasticity results from disinhibition of the spinal stretch reflex loop.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cervical plexus', false, 1), ('B', 'Medulla', false, 2), ('C', 'Hypothalamus', false, 3), ('D', 'Spinal reflex loop', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are assessing a patient with a C6 spinal cord injury who has developed hyper-resistance to passive muscle stretch. You notice a marked increase in muscle tone through most of the range, but you can still easily move his lower extremities. Which Modified Ashworth Scale grade is this? Select ONE answer.', null, 'MAS grade 2: more marked increase in tone through most of the ROM, but the part is easily moved.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Grade 2', true, 1), ('B', 'Grade 3', false, 2), ('C', 'Grade 1', false, 3), ('D', 'Grade 1+', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Complete the sentence with the correct answer. You are working with a 5- year- old-girl with cerebral palsy and her family. The girl’s parents mention that their daughter has difficulty communicating with her family and is unable to express her needs. This is an example of _______________________.', null, 'Difficulty communicating needs is an activity/ participation limitation (ICF).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A body structure', false, 1), ('B', 'An activity/participation', true, 2), ('C', 'A body function', false, 3), ('D', 'An environmental factor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are working with a 10-year-old boy who has cerebral palsy. He lives with his family in a rural area and does not have access to electricity for much of the day. Limited access to electricity is an example of which ONE of the following?', null, 'Limited access to electricity is an environmental factor (ICF).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Environmental factor', true, 1), ('B', 'Activity/participation', false, 2), ('C', 'Body function', false, 3), ('D', 'Body structure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are checking to see if 4-year-old Dema has a subluxed or dislocated hip. She is supine in a hook-lying position with her feet flat. You do not see any difference in height between her knees. How would you document the results of this special test? Select ONE answer.', null, 'Equal knee heights in hook-lying = negative Galeazzi sign.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Negative Galeazzi sign', true, 1), ('B', 'Negative Ortolani sign', false, 2), ('C', 'Positive Ortolani sign', false, 3), ('D', 'Positive Galeazzi sign', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are assessing the gait of a 10-year-old boy named Dorji. When he walks, you notice he has a left foot drop. Which muscle would you suspect is weak? Select ONE answer.', null, 'Foot drop is due to weakness of the ankle dorsiflexors, mainly tibialis anterior.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Soleus', false, 1), ('B', 'Tibialis posterior', false, 2), ('C', 'Gastrocnemius', false, 3), ('D', 'Tibialis anterior', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following muscles would be impaired if you observed a Trendelenburg gait?', null, 'Trendelenburg gait is due to weakness of the hip abductors, mainly gluteus medius.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gluteus maximus', false, 1), ('B', 'Gluteus medius', true, 2), ('C', 'Gluteus minmus', false, 3), ('D', 'Multifidus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '____________________ is a physical disability caused by brain injury during pregnancy, birth, or shortly after birth. It affects movement, coordination, muscle tone, reflexes, posture and balance.', null, 'Cerebral palsy: non-progressive brain injury before, during or shortly after birth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Spina Bifida', false, 1), ('B', 'Cerebral palsy', true, 2), ('C', 'Downs syndrome', false, 3), ('D', 'Muscular dystrophy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Osteoarthritis or degenerative joint disease, is a slowly evolving joint disease that appears to originate in the ____________________.', null, 'Osteoarthritis appears to originate in the articular cartilage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Synovial fluid', false, 1), ('B', 'Ligaments', false, 2), ('C', 'Cartilage', true, 3), ('D', 'Soft tissue', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cystic swelling of the dura and arachnoid, that protrudes through the neural tube defect is ____________________________.', null, 'A meningocele is a cystic protrusion of dura and arachnoid without neural tissue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Meningocele', true, 1), ('B', 'Meningomyelocele', false, 2), ('C', 'Myeloschisis', false, 3), ('D', 'Spina bifida occulta', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'List the various cortical sensations and how each is assessed. (5 marks)', 'Cortical (combined/ discriminative) sensations depend on intact primary sensation and parietal cortex; test with the patient''s vision occluded and compare sides. (1) Stereognosis - ability to recognise common objects (key, coin, pen) placed in the hand by touch. (2) Graphaesthesia - recognising numbers or letters traced on the palm or skin. (3) Two-point discrimination - distinguishing one from two points touched simultaneously using calipers, finding the smallest distance felt as two. (4) Tactile localisation - pointing to the exact spot touched. (5) Barognosis - recognising differences in weight of objects of the same size and shape. (6) Texture recognition - identifying materials such as cotton, wool or silk. (7) Bilateral simultaneous stimulation - touching identical sites on both sides at once to detect extinction/ neglect.', null, '[{"point": "Cortical (combined) sensations with test: stereognosis (identify object by touch), graphaesthesia (numbers traced on skin), two-point discrimination (calipers), tactile localisation, barognosis (weights), texture recognition, bilateral simultaneous stimulation/ extinction; vision occluded, compare sides, primary sensation intact first", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'short_answer', 'Dorji is a 7-year-old boy referred by the paediatrician with difficulty in walking. He walks with a waddling gait. His mother reports that he has had difficulty walking for the last few months; before that he was a typical child with no developmental delay and no falls. The onset was insidious and he has no pain. He has had frequent falls.

a) What is your impression of the boy? (1 mark)', 'a) Duchenne muscular dystrophy - a progressive X-linked condition causing proximal muscle weakness in boys, typically presenting at 3-7 years with a waddling gait, frequent falls and difficulty running, climbing stairs and rising from the floor.', null, '[{"point": "Duchenne muscular dystrophy (proximal muscle weakness)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-s2', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Dorji is a 7-year-old boy referred by the paediatrician with difficulty in walking. He walks with a waddling gait. His mother reports that he has had difficulty walking for the last few months; before that he was a typical child with no developmental delay and no falls. The onset was insidious and he has no pain. He has had frequent falls.

b) Which sign would you expect to be positive in this boy? (1 mark)', 'b) Gowers'' sign - the child ''climbs up'' his legs with his hands to rise from the floor because of weak hip and knee extensors; calf pseudohypertrophy is also expected.', null, '[{"point": "Gowers'' sign (also calf pseudohypertrophy)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-s2', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Dorji is a 7-year-old boy referred by the paediatrician with difficulty in walking. He walks with a waddling gait. His mother reports that he has had difficulty walking for the last few months; before that he was a typical child with no developmental delay and no falls. The onset was insidious and he has no pain. He has had frequent falls.

c) What further assessment would you perform on him? (3 marks)', 'c) Detailed history (family history, milestones) and assessment: manual muscle testing (proximal more than distal weakness); range of motion and contractures (tendo-Achilles, iliotibial band, hip flexors); posture (increased lumbar lordosis, wide base); gait analysis (toe-walking, Trendelenburg/ waddling); functional and timed tests (time to rise from the floor, 10-metre walk/run, stair climbing, 6-minute walk test, North Star Ambulatory Assessment); balance and falls; respiratory function (chest expansion, cough, spirometry) and cardiac screening; and refer for investigations - serum creatine kinase (very high), genetic testing for the dystrophin gene, and EMG or muscle biopsy if needed.', null, '[{"point": "Muscle strength (MMT - proximal), ROM/ contractures (tendo-Achilles, ITB, hip flexors), posture (lumbar lordosis), gait, functional tests (timed rise from floor, 6MWT, North Star Ambulatory Assessment), respiratory function, cardiac; refer for CK, genetic testing, EMG/ biopsy", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-s2', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'short_answer', 'Assume you are about to begin a coordination examination. Which screening would be appropriate and why, and in what order would you perform it? (5 marks)', 'Before testing coordination, screen the systems that contribute to coordinated movement, so that deficits are not wrongly attributed to cerebellar or basal ganglia dysfunction. Order: (1) mental status and cognition - arousal, attention, orientation, memory and ability to understand and follow commands; (2) sensory integrity - especially proprioception and kinaesthesia, vision and vestibular function, since sensory ataxia mimics coordination loss; (3) range of motion - limitations restrict movement; (4) muscle strength - weakness prevents accurate, smooth movement; (5) tone - spasticity or rigidity interferes with movement; and screening of balance and endurance. Only then perform coordination tests: non-equilibrium tests (finger-to-nose, heel-to-shin, alternating movements, tapping) and equilibrium tests (standing, tandem walking, Romberg), moving from gross to fine motor tasks.', null, '[{"point": "Screen first the systems that affect coordination so deficits are not misattributed: mental status/ cognition (arousal, attention, ability to follow commands, memory), sensation (proprioception, vision, vestibular), ROM, muscle strength, tone, balance", "marks": 3}, {"point": "Logical order: cognition/ communication → sensory (especially proprioception) → ROM → strength → tone/ spasticity → then coordination tests (non-equilibrium then equilibrium; gross then fine)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'short_answer', 'Differentiate between the terms motor control and motor learning. How can impairments in motor control be distinguished from those of motor learning? (5 marks)', 'Motor control is the ability to regulate or direct the mechanisms essential to movement - how the nervous system organises muscles and joints into coordinated, functional movement and posture, integrating sensory information - and is seen in a person''s current performance. Motor learning is a set of internal processes associated with practice or experience that leads to relatively permanent changes in the capability for skilled movement; it is inferred from performance over time. Distinguishing: motor control impairments are seen during performance of a single task - e.g. abnormal tone, weakness, poor timing, incoordination or postural instability while the patient attempts the movement. Motor learning impairments are seen when, despite practice and feedback, the patient fails to improve, does not retain the improvement after a rest period (retention test), or cannot transfer it to a new context or variation (transfer test). Performance during practice may improve temporarily without true learning; learning is shown by retention and transfer.', null, '[{"point": "Motor control: ability to regulate/ direct the mechanisms essential for movement (posture, movement, sensory integration) - current performance; motor learning: set of processes associated with practice/ experience leading to relatively permanent changes in capability for skilled movement", "marks": 3}, {"point": "Distinguishing: control impairments seen in performance during a single task (abnormal tone, coordination, timing) vs learning impairments seen as failure to improve or retain/ transfer skills with practice - assessed by retention and transfer tests after practice", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

i. One of the pathophysiological mechanisms of TBI is diffuse axonal injury. Briefly describe diffuse axonal injury and its classification. (5 marks)', 'Diffuse axonal injury is widespread damage to axons caused by shearing and stretching forces from rapid rotational acceleration-deceleration of the brain (e.g. motorcycle crashes). Axons at the grey-white matter junction, corpus callosum and brainstem are most affected; damage to the cytoskeleton disrupts axonal transport, leading to swelling and secondary disconnection over hours to days. Patients are often in coma from the moment of injury, while CT may show little - MRI (diffusion, susceptibility-weighted) is more sensitive. Classification (Adams/ Gennarelli): Grade I - microscopic axonal injury in the white matter of the cerebral hemispheres; Grade II - grade I plus a focal lesion in the corpus callosum; Grade III - grade II plus a focal lesion in the dorsolateral brainstem. Clinically it is also graded as mild, moderate or severe by duration of coma.', null, '[{"point": "DAI: widespread shearing/ stretching of axons from rotational acceleration-deceleration forces, especially at grey-white junction, corpus callosum, brainstem; secondary axonal disconnection; often coma with little on CT, best seen on MRI", "marks": 3}, {"point": "Classification (Adams/ Gennarelli): grade I - axonal injury in white matter of hemispheres; grade II - plus focal lesion in corpus callosum; grade III - plus brainstem lesion", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

ii. What is coup-contrecoup injury? (3 marks)', 'Coup-contrecoup injury is a pair of brain contusions caused by acceleration-deceleration: the coup injury occurs directly under the site of impact as the brain strikes the inside of the skull; the contrecoup injury occurs on the opposite side as the brain rebounds and hits the skull on the other side (often the frontal and temporal poles against bony ridges). In this patient, the left frontal contusion with a right basal ganglia contusion reflects injury at and away from the impact site.', null, '[{"point": "Coup: contusion at site of impact as brain strikes skull; contrecoup: injury on opposite side as brain rebounds/ decelerates against skull; acceleration-deceleration; frontal and temporal poles", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

iii. Which measurement tool is used to measure the level of alertness/ consciousness to help define the severity of injury in patients with TBI? Explain the tool briefly. (5 marks)', 'The Glasgow Coma Scale (GCS). It scores three responses: eye opening (4 spontaneous, 3 to voice, 2 to pain, 1 none); best verbal response (5 oriented, 4 confused, 3 inappropriate words, 2 incomprehensible sounds, 1 none); and best motor response (6 obeys commands, 5 localises pain, 4 withdraws, 3 abnormal flexion - decorticate, 2 extension - decerebrate, 1 none). Total 3-15. TBI severity: 13-15 mild, 9-12 moderate, 3-8 severe (coma). It is repeated to monitor change; verbal scoring is limited in intubated or sedated patients (recorded as ''T'').', null, '[{"point": "Glasgow Coma Scale", "marks": 1}, {"point": "Components: eye opening 1-4, verbal 1-5, motor 1-6; total 3-15", "marks": 2}, {"point": "Severity: 13-15 mild, 9-12 moderate, ≤ 8 severe (coma); limitations (intubation, sedation)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

iv. Describe the CNS and its functions, with appropriate diagrams. (5 marks)', 'The central nervous system consists of the brain and spinal cord, protected by the skull, vertebrae, meninges and CSF. Cerebrum - two hemispheres with lobes: frontal (voluntary movement in the primary motor cortex, planning, personality, executive function, Broca''s speech area), parietal (somatosensory perception, spatial awareness), temporal (hearing, memory, language comprehension - Wernicke''s area) and occipital (vision). Basal ganglia - regulate movement, tone and motor planning. Diencephalon - thalamus (sensory relay) and hypothalamus (autonomic, endocrine, temperature control). Cerebellum - coordination, balance, motor learning. Brainstem - midbrain, pons and medulla: cranial nerve nuclei, reticular activating system (consciousness), cardiorespiratory centres. Spinal cord - conducts ascending sensory and descending motor tracts and mediates spinal reflexes. (Diagram: lateral view of brain with lobes, cerebellum and brainstem; cross-section of spinal cord with grey and white matter.)', null, '[{"point": "Components: brain (cerebrum - lobes and functions: frontal motor/ executive, parietal sensory, temporal hearing/ memory, occipital vision; basal ganglia; diencephalon - thalamus, hypothalamus; cerebellum - coordination; brainstem - midbrain, pons, medulla, vital centres, cranial nerves) and spinal cord (tracts, reflexes); meninges, CSF", "marks": 4}, {"point": "Labelled diagram(s)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 4, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

v. During the acute stage of TBI, what common complications might arise, and what physiotherapy management prevents them? (5 marks)', 'Common complications: respiratory - pneumonia, atelectasis and aspiration (with gastric tube, reduced consciousness); musculoskeletal - spasticity, contractures, heterotopic ossification; skin - pressure ulcers; vascular - deep vein thrombosis; general deconditioning and orthostatic intolerance. Physiotherapy: positioning with the head elevated about 30° and neutral neck to help ICP, regular turning (2-hourly) and pressure care; chest physiotherapy - positioning, gentle percussion/ vibration, suctioning and airway clearance while monitoring ICP; passive range of motion exercises and positioning in anti-spastic postures; splints and serial casting; early mobilisation - sitting out, tilt table - once stable; sensory and coma stimulation; and DVT prevention (exercises, compression with medical prophylaxis).', null, '[{"point": "Complications: respiratory (pneumonia, atelectasis, aspiration), contractures/ spasticity, pressure ulcers, DVT, heterotopic ossification, deconditioning, raised ICP considerations", "marks": 2}, {"point": "PT: positioning (head up 30°, avoid ICP rises), chest physiotherapy/ suctioning carefully, passive ROM, splinting/ serial casting, regular turning, early mobilisation/ sitting/ tilt table, sensory stimulation, DVT prevention", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 5, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

vi. Which scale is used to examine cognitive and behavioural recovery in individuals with TBI? (1 marks)', 'The Rancho Los Amigos Levels of Cognitive Functioning Scale (levels I to VIII/X).', null, '[{"point": "Rancho Los Amigos Levels of Cognitive Functioning Scale", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 6, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

vii. What is shaken baby syndrome? (1 marks)', 'Shaken baby syndrome (abusive head trauma) is brain injury in an infant caused by violent shaking, producing acceleration-deceleration forces that cause subdural haemorrhages, retinal haemorrhages and diffuse brain injury, often with no external signs.', null, '[{"point": "Abusive head trauma in infants from violent shaking - subdural haemorrhage, retinal haemorrhages, brain injury (DAI)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 7, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

viii. Define neuroplasticity. What are the principles of neuroplasticity? (5 marks)', 'Neuroplasticity is the ability of the nervous system to change its structure and function - forming new connections and reorganising - in response to experience, learning, training or injury. Principles of experience-dependent plasticity (Kleim and Jones, 2008): 1. Use it or lose it; 2. Use it and improve it; 3. Specificity - the nature of training determines the change; 4. Repetition matters; 5. Intensity matters; 6. Time matters - different forms occur at different times after injury; 7. Salience matters - training must be meaningful; 8. Age matters - plasticity is greater in younger brains; 9. Transference - plasticity in one training can enhance related behaviours; 10. Interference - plasticity in response to one experience can interfere with acquiring others (e.g. compensation).', null, '[{"point": "Definition: ability of the nervous system to change structure and function in response to experience, learning or injury (reorganisation, new connections)", "marks": 1}, {"point": "Principles (Kleim and Jones): use it or lose it; use it and improve it; specificity; repetition matters; intensity matters; time matters; salience matters; age matters; transference; interference", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 8, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

ix. Since this patient has severe spasticity, which scale will be used to grade the spasticity? Explain the scale. (5 marks)', 'The Modified Ashworth Scale (Bohannon and Smith, 1987). The limb is moved passively through its range over about one second, and resistance is graded: 0 - no increase in muscle tone; 1 - slight increase, shown by a catch and release or minimal resistance at the end of the range; 1+ - slight increase, shown by a catch followed by minimal resistance throughout the remainder (less than half) of the range; 2 - more marked increase through most of the range, but the part is easily moved; 3 - considerable increase in tone, passive movement difficult; 4 - affected part rigid in flexion or extension. (The Modified Tardieu Scale is an alternative that tests at different speeds.)', null, '[{"point": "Modified Ashworth Scale", "marks": 1}, {"point": "Grades: 0 no increase; 1 slight increase - catch and release or minimal resistance at end of ROM; 1+ slight increase - catch followed by minimal resistance through < half ROM; 2 more marked increase through most ROM, easily moved; 3 considerable increase, passive movement difficult; 4 rigid in flexion/ extension; method of testing", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 9, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

x. What are the primitive postures that may be associated with TBI? (4 marks)', 'Abnormal (primitive) postures in severe TBI: decorticate rigidity - upper limbs flexed at elbows, wrists and fingers and held to the chest, lower limbs extended and internally rotated, feet plantarflexed - indicating damage above the red nucleus (cerebral hemispheres, internal capsule, thalamus); decerebrate rigidity - upper limbs extended, adducted and internally rotated with pronated forearms, lower limbs extended with plantarflexion, often with neck extension - indicating brainstem (midbrain/ pons) damage and a worse prognosis. Opisthotonus (arching of the back and neck) may also occur.', null, '[{"point": "Decorticate posture (flexion of upper limbs, extension of lower limbs - lesion above red nucleus/ cerebral hemispheres, internal capsule)", "marks": 2}, {"point": "Decerebrate posture (extension and internal rotation of upper limbs, extension of lower limbs - brainstem lesion, worse prognosis); also opisthotonus", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 10, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

xi. During the rehabilitation process, list and explain the roles of the professionals in the multidisciplinary team. (6 marks)', 'Neurosurgeon/ physician or rehabilitation physician - medical management, coordinating the team and goals. Nurses - 24-hour care, pressure care, bladder and bowel, medication, tube feeding. Physiotherapist - respiratory care, tone management, mobility, balance, gait, strength and fitness. Occupational therapist - activities of daily living, upper-limb function, cognition and perception, splints, wheelchair and home adaptations. Speech and language therapist - communication, cognitive-communication and swallowing assessment for safe oral feeding. Clinical psychologist/ counsellor - cognitive and behavioural assessment, emotional support and family counselling. Dietitian - nutrition through the gastric tube and transition to oral diet. Social worker - discharge planning, financial and community support, return to work. The patient and family are central members, with orthotists and others as needed.', null, '[{"point": "Any six with roles: physician/ neurosurgeon/ physiatrist (medical management, lead), nurse (care, skin, bladder/ bowel), physiotherapist (mobility, tone, respiratory), occupational therapist (ADLs, cognition, splints, home adaptation), speech-language therapist (communication, swallowing), clinical psychologist/ counsellor (cognition, behaviour, family), dietitian (nutrition via gastric tube), social worker (discharge, support), family/ caregivers", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 11, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q11' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Traumatic brain injury
A 36-year-old man sustained a traumatic brain injury (TBI) in a motorcycle accident. On admission he had a left frontal laceration with an underlying linear skull fracture. CT revealed oedema, a right basal ganglia contusion and a left frontal contusion. He was comatose on admission. His acute hospital course was complicated by increased intracranial pressure and severe spasticity, which required casts and splints. A gastric tube was inserted. Illustrate with diagrams wherever necessary.

xii. What are some physiotherapy strategies to manage spasticity, besides the ones mentioned in the case? (5 marks)', 'Besides casts and splints: correct positioning in anti-spastic patterns in bed and chair; slow, sustained prolonged stretching and daily passive/ active-assisted range of motion; weight-bearing through limbs (tilt table, supported standing); cold therapy (ice application) or warmth to reduce tone temporarily; electrical stimulation of antagonist muscles (FES) and TENS; neurodevelopmental (Bobath) inhibitory handling and rhythmic rotation; strengthening antagonists and task-specific functional training; hydrotherapy; dynamic orthoses; and working alongside medical treatments such as botulinum toxin injections, oral antispasticity drugs or intrathecal baclofen, with stretching after injections.', null, '[{"point": "Any five: positioning (anti-spastic, RIP), sustained prolonged stretching, ROM exercises, weight-bearing (tilt table/ standing), cryotherapy/ heat, electrical stimulation (FES/ antagonist), inhibitory handling/ neurodevelopmental techniques, strengthening antagonists, task-oriented training, hydrotherapy, orthoses (dynamic), combined with botulinum toxin injections", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case1', 12, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C1Q12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q12' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

1. How does the clinical presentation of obstructive disease differ from restrictive disease? (5 marks)', 'Obstructive diseases (COPD, asthma, bronchiectasis) reduce airflow, especially during expiration: patients have difficulty breathing out, prolonged expiration, wheezing, cough and sputum, use of accessory muscles and pursed-lip breathing, hyperinflation with a barrel chest and flattened diaphragm; spirometry shows a reduced FEV1/FVC ratio (< 0.7) with normal or increased total lung capacity and increased residual volume. Restrictive diseases (interstitial lung disease, chest wall deformity, obesity, neuromuscular weakness) reduce lung expansion: patients have difficulty breathing in, rapid shallow breathing, reduced chest expansion, fine end-inspiratory crackles in fibrosis; spirometry shows reduced FVC and TLC with a normal or increased FEV1/FVC ratio.', null, '[{"point": "Obstructive (COPD, asthma): airflow limitation, difficulty expiring, prolonged expiration, wheeze, hyperinflation/ barrel chest, ↓FEV1/FVC (< 0.7), ↑TLC/ RV", "marks": 2.5}, {"point": "Restrictive (ILD, chest wall, neuromuscular): reduced lung volumes/ expansion, rapid shallow breathing, difficulty inspiring, fine crackles, normal/ ↑ FEV1/FVC, ↓TLC, ↓FVC", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 1, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

2. What are breath sounds, and what kinds of abnormal breath sounds can be heard in a patient with COPD? (5 marks)', 'Breath sounds are the sounds produced by air moving through the tracheobronchial tree, heard with a stethoscope: normal vesicular sounds over most lung fields, bronchial sounds over the trachea, and bronchovesicular sounds over the main bronchi. Abnormal findings in COPD: diminished (reduced) breath sounds because of hyperinflation and air trapping; prolonged expiratory phase; expiratory wheezes (polyphonic) from narrowed airways; coarse (early inspiratory) crackles or rhonchi from secretions; and, after pneumonia, bronchial breath sounds or crackles over consolidated areas.', null, '[{"point": "Breath sounds: sounds generated by airflow in the airways heard on auscultation - normal vesicular, bronchial, bronchovesicular", "marks": 2}, {"point": "Abnormal in COPD: diminished/ reduced breath sounds (hyperinflation), prolonged expiration, wheezes (polyphonic), coarse crackles (secretions), rhonchi; bronchial breathing if pneumonia/ consolidation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 2, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

3. What would the physiotherapy goals be for this patient during the acute stage and after discharge from hospital? (5 marks)', 'Acute stage: clear secretions and maintain airway patency; improve ventilation, lung expansion and oxygenation; reduce the work of breathing and dyspnoea (positioning, breathing control); prevent complications such as atelectasis, pressure sores, DVT and ICU-acquired weakness; begin early mobilisation and restore basic functional mobility. After discharge: improve exercise tolerance and functional capacity through pulmonary rehabilitation; increase muscle strength and endurance; teach breathing control, energy conservation and independent airway clearance; educate her and her daughter on self-management, inhaler use and recognition of exacerbations; prevent readmission; regain independence in daily activities and improve quality of life.', null, '[{"point": "Acute: clear secretions, improve ventilation and oxygenation, reduce work of breathing/ dyspnoea, prevent complications (atelectasis, DVT, deconditioning), early mobilisation", "marks": 2.5}, {"point": "Post-discharge: improve exercise tolerance and functional capacity (pulmonary rehabilitation), strength, breathing control/ self-management, airway clearance independence, prevent exacerbations, educate patient and daughter, independence in ADLs, quality of life", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 3, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

4. Name at least two exercise testing protocols used for patients with pulmonary disease. (2 marks)', 'Six-minute walk test (6MWT); incremental shuttle walk test (and endurance shuttle walk test); cardiopulmonary exercise testing on a cycle ergometer or treadmill (e.g. modified Bruce protocol); 1-minute sit-to-stand test.', null, '[{"point": "Any two: six-minute walk test, incremental shuttle walk test (and endurance shuttle walk test), cardiopulmonary exercise testing on cycle ergometer/ treadmill, sit-to-stand test", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 4, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

5. What is dyspnoea, and how do you assess it? (3 marks)', 'Dyspnoea is the subjective experience of breathing discomfort or shortness of breath, varying in quality and intensity. Assessment: history (onset, triggers, activities causing it, positions that relieve it); rating scales - the modified Borg (CR-10) scale during activity, the modified Medical Research Council (mMRC) dyspnoea scale for its effect on daily life, a visual analogue scale, and questionnaires such as the COPD Assessment Test; plus observation - respiratory rate, use of accessory muscles, pursed-lip breathing, ability to speak in full sentences and oxygen saturation.', null, '[{"point": "Definition: subjective experience of breathing discomfort/ shortness of breath", "marks": 1}, {"point": "Assessment: history (onset, triggers, activities), modified Borg scale (0-10) during exercise, mMRC dyspnoea scale (0-4), VAS, CAT/ CRQ; observation - RR, accessory muscles, speech, SpO2", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 5, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

6. Since this patient was ventilated, what would your physiotherapy management be while she was on the ventilator and after she came off it? (5 marks)', 'On the ventilator: monitor vital signs and ventilator settings; positioning (head of bed up 30-45°, side-lying, regular turning) to improve ventilation-perfusion and prevent aspiration and pressure sores; airway clearance - manual or ventilator hyperinflation, chest wall vibrations and shaking, closed suctioning; passive and active-assisted range of motion; early mobilisation when stable (sitting over the edge of the bed, sitting out); inspiratory muscle training to aid weaning. Off the ventilator: breathing control, deep breathing and diaphragmatic breathing, incentive spirometry, ACBT with huffing and supported coughing; positioning for dyspnoea relief; progressive mobilisation - standing, walking with oxygen as needed; strengthening of limbs; monitoring SpO2 and dyspnoea during activity; and education.', null, '[{"point": "On ventilator: positioning (head up, side-lying, regular turning), airway clearance (manual hyperinflation, vibrations, suctioning), lung expansion, passive/ active ROM, early mobilisation (sitting, edge of bed) when stable, inspiratory muscle training/ support weaning", "marks": 2.5}, {"point": "Off ventilator: breathing exercises (diaphragmatic, deep breathing, incentive spirometry), ACBT/ huffing and cough, positioning, progressive mobilisation and walking, strengthening, monitoring SpO2, education", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 6, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
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
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

7. Which scale would you use to measure the functional limitation of this patient? (2 marks)', 'The modified Medical Research Council (mMRC) dyspnoea scale (grades 0-4), which rates the functional limitation caused by breathlessness in COPD; ADL limitation can also be measured with the London Chest Activity of Daily Living scale or the Barthel Index.', null, '[{"point": "e.g. mMRC dyspnoea scale (functional limitation due to breathlessness), or Barthel Index/ FIM for ADLs, CAT, London Chest ADL scale - one named and justified", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 7, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

8. How do you determine the exercising heart rate to prescribe exercise intensity? (3 marks)', 'Use the Karvonen (heart rate reserve) method: target heart rate = [(HRmax - HRrest) x intensity] + HRrest, where HRmax ≈ 220 - age = 220 - 67 = 153 beats/min. For example, with a resting HR of 80 and intensity 50%: THR = (153 - 80) x 0.5 + 80 ≈ 117 beats/min (range 40-60% for a deconditioned COPD patient). Alternatively, 60-80% of HRmax or heart rate at a given level from an exercise test. In COPD, heart rate may be affected by medication and ventilatory limitation, so intensity is also guided by the Borg dyspnoea or exertion rating (about 3-4 on the 0-10 scale) and SpO2 (keep ≥ 88-90%).', null, '[{"point": "Karvonen (heart rate reserve) method: THR = [(HRmax - HRrest) x intensity %] + HRrest; HRmax ≈ 220 - age (= 153 for 67 years); intensity 40-60% for COPD; or % HRmax (60-80%); worked example; with RPE/ dyspnoea (Borg 3-4) since beta-agonists/ COPD limit HR use", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 8, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

9. What is aerobic training? Design an aerobic training protocol for this patient. (5 marks)', 'Aerobic (endurance) training is rhythmic, continuous exercise of large muscle groups that relies on aerobic (oxidative) metabolism, improving cardiorespiratory fitness and endurance. Protocol (FITT): Frequency - 3-5 sessions a week; Intensity - moderate, 40-60% of heart rate reserve or about 60-80% of the walking speed achieved on the 6MWT, guided by Borg dyspnoea 3-4/10 and SpO2 ≥ 88-90% (supplemental oxygen if needed); Time - start with 5-10 minute bouts or interval training (e.g. 1 minute work, 1 minute rest) and build up to 20-30 minutes continuous; Type - walking (ground or treadmill) and stationary cycling. Each session includes a 5-10 minute warm-up and cool-down with breathing control. Progress gradually every 1-2 weeks by increasing duration, then intensity; monitor symptoms, SpO2 and heart rate; continue for at least 8 weeks in a pulmonary rehabilitation programme, with a home walking programme supported by her daughter.', null, '[{"point": "Aerobic training: continuous/ rhythmic large-muscle exercise using oxidative metabolism to improve cardiorespiratory endurance", "marks": 1}, {"point": "FITT protocol: walking/ cycling, 3-5 days/ week, moderate intensity (40-60% HRR or 60-80% of 6MWT speed, Borg 3-4), 20-30 min (start with intervals 5-10 min), warm-up/ cool-down, progression, supplemental O2 if SpO2 < 88%, monitoring", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 9, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

10. Explain the Active Cycle of Breathing Techniques (ACBT). (5 marks)', 'The Active Cycle of Breathing Techniques is a flexible airway clearance method combining three components repeated in cycles: (1) Breathing control - gentle, relaxed tidal breathing using the lower chest, between the other components, to prevent fatigue and bronchospasm; (2) Thoracic expansion exercises - 3-4 deep inspirations, with an inspiratory hold or sniff, and relaxed expiration, which increase collateral ventilation to get air behind secretions (percussion or vibration can be added); (3) Forced expiration technique - one or two huffs (forced expirations with an open glottis) from mid to low lung volume to move peripheral secretions, and from high lung volume to clear proximal ones, followed by a cough, always mixed with breathing control. It can be done in sitting or gravity-assisted positions, independently, and is used for COPD and bronchiectasis.', null, '[{"point": "ACBT: flexible cycle of three components - breathing control (relaxed tidal breathing between components), thoracic expansion exercises (deep inspirations with hold/ sniff, may add percussion/ vibration - mobilise secretions via collateral ventilation), forced expiration technique (1-2 huffs mixed with breathing control, from low to high lung volume, then cough)", "marks": 4}, {"point": "Use: airway clearance in COPD/ bronchiectasis, independent, can be done in any position (gravity-assisted), adapted to patient", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 10, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

11. What is long COVID? List some of its symptoms. (5 marks)', 'Long COVID (WHO: post COVID-19 condition) is the continuation or development of new symptoms, usually starting within 3 months of the initial SARS-CoV-2 infection and lasting at least 2 months, that cannot be explained by another diagnosis. Common symptoms: fatigue; shortness of breath; cough; chest pain or tightness; palpitations; cognitive problems (''brain fog'', poor memory and concentration); post-exertional malaise; muscle and joint pain; headache; sleep disturbance; anxiety and depression; loss or change of smell and taste; dizziness.', null, '[{"point": "Definition (WHO): post COVID-19 condition - symptoms usually starting within 3 months of infection, lasting ≥ 2 months, not explained by another diagnosis", "marks": 2}, {"point": "Symptoms: fatigue, breathlessness, cough, chest pain, palpitations, cognitive dysfunction (''brain fog''), sleep problems, anxiety/ depression, joint/ muscle pain, loss of smell/ taste, post-exertional malaise, headache", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 11, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q11' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: COPD after pneumonia
A 67-year-old woman was admitted to hospital with acute bacterial pneumonia. She was treated with mechanical ventilation for 5 days, steroids, antibiotics and bronchodilators. She has a history of COPD and is cared for by her daughter. She was discharged on day 7 and referred to physiotherapy.

12. Since this is a 67-year-old woman with COPD, what is she at risk of once she goes home? What would you assess, and how would you manage it? (5 marks)', 'Risks at home: falls (muscle weakness after ICU stay and steroids, deconditioning, hypoxia, medications, age); further exacerbations and readmission; progressive deconditioning and loss of independence in daily activities; osteoporosis and fractures from steroids; anxiety, depression and social isolation. Assessment: falls risk (Timed Up and Go, Berg Balance Scale, 30-second sit-to-stand, history of falls), lower-limb strength, gait, home environment hazards, ADL function, SpO2 and dyspnoea during activity, and caregiver capacity. Management: balance and lower-limb strengthening exercises, gait training and walking aids if needed; home modifications (remove loose rugs, grab bars, lighting); a graded home walking programme or community pulmonary rehabilitation; breathing control and energy conservation; education on inhaler technique, a COPD action plan for early signs of exacerbation, smoking/ smoke avoidance, vaccination (influenza, pneumococcal); training her daughter; and regular follow-up.', null, '[{"point": "Risks: falls (weakness, deconditioning after ICU, steroids, hypoxia), re-exacerbation/ readmission, deconditioning/ sarcopenia, osteoporosis (steroids), reduced ADL independence, anxiety/ depression, social isolation", "marks": 2}, {"point": "Assess and manage: falls risk (TUG, Berg, home hazards), strength/ balance, SpO2/ dyspnoea, ADLs; manage with balance and strengthening, walking aids, home modification, pulmonary rehab, inhaler technique/ action plan, vaccination, caregiver (daughter) education, follow-up", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Physiotherapy", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-physio2024-case2', 12, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'C2Q12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q12' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The lowest possible score on the Glasgow Coma Scale is', null, 'GCS ranges from 3 (deep coma) to 15.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', true, 1), ('B', '5', false, 2), ('C', '1', false, 3), ('D', '0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Wrist drop after a fracture of the shaft of the humerus is due to injury of the', null, 'The radial nerve runs in the spiral groove of the humerus.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'axillary nerve', false, 1), ('B', 'median nerve', false, 2), ('C', 'radial nerve', true, 3), ('D', 'ulnar nerve', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the MRC (Oxford) scale, muscle grade 3 means', null, 'Grade 3: movement through full range against gravity only.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'full range against strong resistance', false, 1), ('B', 'full range with gravity eliminated', false, 2), ('C', 'flicker of contraction only', false, 3), ('D', 'full range against gravity but not against resistance', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Transcutaneous electrical nerve stimulation (TENS) is mainly used for', null, 'TENS relieves pain (gate control and endogenous opioid mechanisms).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'physiotherapy'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Physiotherapy): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'physiotherapy'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'wound healing', false, 1), ('B', 'pain relief', true, 2), ('C', 'bone union', false, 3), ('D', 'muscle strengthening', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
