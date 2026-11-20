-- ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'ot-technologist', 'OT Technologist' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'occupational-therapy-technology') is null then raise exception 'unknown specialisation occupational-therapy-technology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'occupational-therapy-technology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 50, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, OT Technologist');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 3, 10, null, 'BCSE 2025 Main Examination, Technical Paper III, OT Technologist');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 20, 1, 'BCSE 2025 Main Examination, Technical Paper III, OT Technologist');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To what pressure an endotracheal tube must be inflated to produce an adequate seal between the cuff and the wall of the trachea?', null, 'ETT cuff pressure is kept about 20-30 (cmH2O/mmHg range) to seal without mucosal ischaemia.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10-15 mm Hg', false, 1), ('B', '<20 mm Hg', false, 2), ('C', '20-30 mm Hg', true, 3), ('D', '>40 mm Hg', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which method should be used to open the airway in case of suspected C spine injury?', null, 'Use jaw thrust (no head tilt) if cervical spine injury is suspected.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Abdominal thrust', false, 1), ('B', 'Back thrust', false, 2), ('C', 'Jaw thrust', true, 3), ('D', 'Head tilt and chin lift', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is known as laughing gas?', null, 'Nitrous oxide (N2O) is laughing gas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'B₂O', false, 1), ('B', 'CO₂', false, 2), ('C', 'NO₂', false, 3), ('D', 'N₂O', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the colour of nitrous oxide gas cylinder?', null, 'Nitrous oxide cylinders are blue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Black', false, 1), ('B', 'Gray', false, 2), ('C', 'White', false, 3), ('D', 'Blue', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An intravenous solution of 0.45% sodium chloride is_____.', null, '0.45% sodium chloride is hypotonic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'hypertonic', false, 1), ('B', 'isotonic', false, 2), ('C', 'hypotonic', true, 3), ('D', 'isomeric', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '“First, do no harm” is based on which ethical principle of health care?', null, '''First, do no harm'' is non-maleficence.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fidelity', false, 1), ('B', 'Beneficence', false, 2), ('C', 'Non-malfeasance', true, 3), ('D', 'Accountability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most health-care-associated infections are transmitted to patients:', null, 'Most healthcare-associated infections spread via health workers'' hands.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By talking to each other.', false, 1), ('B', 'From the hands of the health care workers.', true, 2), ('C', 'From hospital food.', false, 3), ('D', 'It’s from dirty washrooms.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What should be the rate of compressions per minute while providing chest compressions in CPR?', null, 'Compressions at 100-120 per minute.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100-120-per minute', true, 1), ('B', '70-90 per minute', false, 2), ('C', '80-100 per minute', false, 3), ('D', '60-80 per minute', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is nephrectomy?', null, 'Nephrectomy is removal of a kidney.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Surgical removal of kidney', true, 1), ('B', 'Surgical removal of necrotic tissues', false, 2), ('C', 'Surgical removal of a nerve', false, 3), ('D', 'The surgical repair of a nerve', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '______ is the site of giving spinal anaesthesia.', null, 'Spinal anaesthesia is usually given at L3-L4 (below the end of the cord).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'LI – L2', false, 1), ('B', 'L2 – L3', false, 2), ('C', 'L3 – L4', true, 3), ('D', 'L5 – L6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Anal and perianal procedures should be performed in which of the following positions?', null, 'Anal and perianal surgery is done in lithotomy (or prone jackknife).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lithotomy', true, 1), ('B', 'Lateral', false, 2), ('C', 'Trendelenburg', false, 3), ('D', 'Dorsal recumbent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A small artery forceps used to hold small bleeders is called:', null, 'Mosquito forceps hold small bleeders.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Allis tissue forceps', false, 1), ('B', 'Non-toothed dissecting forceps', false, 2), ('C', 'Babcock’s tissue forceps', false, 3), ('D', 'Mosquito forceps', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In hospital, the infectious non-sharp waste i.e. soiled bandage, dressings, soiled cotton are disposed of in which colored containers?', null, 'Infectious non-sharp waste goes in yellow containers.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'black', false, 1), ('B', 'yellow', true, 2), ('C', 'blue', false, 3), ('D', 'red', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT true regarding pulse oximeter?', null, 'Not true: pulse oximetry measures oxygen saturation of haemoglobin only.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is used to measure O2 saturation in blood.', false, 1), ('B', 'It is used to measure the saturation of all the gases in the blood.', true, 2), ('C', 'Sensor probe can be clipped on the finger, toe or earlobe.', false, 3), ('D', 'It is a very sensitive monitor.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The process that kills live bacteria as well as spores is', null, 'Sterilisation kills all microbes including spores.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High level disinfection', false, 1), ('B', 'None of the above', false, 2), ('C', 'Disinfection', false, 3), ('D', 'Sterilization', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Grey colour injection port cap of I.V cannula represents which of the following?', null, 'Grey cannula = 16 G.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20 G', false, 1), ('B', '18 G', false, 2), ('C', '16 G', true, 3), ('D', '14 G', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The oxygen flush valve delivers oxygen at what flow rate?', null, 'The oxygen flush delivers 35-75 L/min.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '35-75 L/min', true, 1), ('B', '10-15 L/min', false, 2), ('C', '100 L/min', false, 3), ('D', '1-5 L/min', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pressure in an oxygen cylinder is approximately:', null, 'A full oxygen cylinder is about 2000 psi (≈137 bar).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1000 psi', false, 1), ('B', '500 psi', false, 2), ('C', '2000 psi', true, 3), ('D', '5000 psi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common type of anesthesia breathing circuit used in adults is:', null, 'The circle system is the commonest adult breathing system.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T-piece', false, 1), ('B', 'Circle system', true, 2), ('C', 'Mapleson D', false, 3), ('D', 'Mapleson A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The minimum oxygen concentration required in an anesthesia gas mixture is:', null, 'Machines ensure at least about 25% oxygen in the delivered mixture (hypoxic guard).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21%', false, 1), ('B', '10%', false, 2), ('C', '30%', false, 3), ('D', '25%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pressure in the pipeline supply for medical gases is:', null, 'Pipeline pressure is about 50 psi (4 bar).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '500 psi', false, 1), ('B', '50 psi', true, 2), ('C', '100 psi', false, 3), ('D', '200 psi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a closed anesthesia breathing system?', null, 'The circle system can be used closed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T-piece', false, 1), ('B', 'Mapleson D', false, 2), ('C', 'Circle system', true, 3), ('D', 'Mapleson A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common type of endotracheal tube cuff is:', null, 'Modern ETT cuffs are high-volume, low-pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High-volume, low-pressure', true, 1), ('B', 'Low-volume, high-pressure', false, 2), ('C', 'Uncuffed', false, 3), ('D', 'Foam cuff', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The size of an endotracheal tube is measured by its:', null, 'ETT size = internal diameter in mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Length in cm', false, 1), ('B', 'External diameter in mm', false, 2), ('C', 'French gauge', false, 3), ('D', 'Internal diameter in mm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not a part of the anesthesia circuit?', null, 'The ETT is the airway device, not part of the breathing circuit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Endotracheal tube', true, 1), ('B', 'Breathing bag', false, 2), ('C', 'CO₂ absorber', false, 3), ('D', 'Vaporizer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The fail-safe valve in an anesthesia machine is designed to:', null, 'The fail-safe valve shuts off N2O if oxygen pressure falls.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measure end-tidal CO₂', false, 1), ('B', 'Activate the ventilator', false, 2), ('C', 'Stop nitrous oxide flow if oxygen pressure drops', true, 3), ('D', 'Increase oxygen flow automatically', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of anesthesia machine malfunction is:', null, 'Circuit disconnection is the commonest cause of machine-related incidents.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Empty oxygen cylinder', false, 1), ('B', 'Disconnected circuit', true, 2), ('C', 'Faulty vaporizer', false, 3), ('D', 'Power failure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common complication of high-pressure oxygen delivery is:', null, 'High-pressure gas can cause barotrauma.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Barotrauma', true, 1), ('B', 'Hypothermia', false, 2), ('C', 'Hypercapnia', false, 3), ('D', 'Hypoxia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Bourdon gauge is most accurate for measuring:', null, 'The Bourdon gauge measures high pressures such as cylinder pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gas flow rates in laminar conditions', false, 1), ('B', 'High pressures (e.g., cylinder pressures)', true, 2), ('C', 'Negative pressures (e.g., suction)', false, 3), ('D', 'Very low pressures (<5 cm H₂O)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a rotameter, the float rises with increasing gas flow because of:', null, 'Gas flowing through the annular gap lifts the float.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Magnetic repulsion between the float and tube', false, 1), ('B', 'Increased velocity of gas lifting the float', true, 2), ('C', 'Increased pressure downstream', false, 3), ('D', 'Decreased viscosity of the gas', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Hagen-Poiseuille equation applies to which type of gas flow?', null, 'Hagen-Poiseuille applies to laminar flow.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Laminar flow', true, 1), ('B', 'Turbulent flow', false, 2), ('C', 'Supersonic flow', false, 3), ('D', 'Transitional flow', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of vaporizer is designed to be agent-specific and cannot be used interchangeably between different volatile anesthetics?', null, 'Tec vaporisers are agent-specific, calibrated variable-bypass vaporisers.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tec vaporizer', true, 1), ('B', 'Goldman vaporizer', false, 2), ('C', 'Copper kettle vaporizer', false, 3), ('D', 'Boyle’s bottle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of the splitting ratio in a variable bypass vaporizer?', null, 'The splitting ratio divides fresh gas between bypass and vaporising chamber.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To prevent backflow of anesthetic into the pipeline', false, 1), ('B', 'To measure the temperature of the liquid agent', false, 2), ('C', 'To regulate the pressure of delivered anesthetic', false, 3), ('D', 'To divide fresh gas flow between bypass and vaporizing chambers', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which safety feature prevents the use of an incorrect anesthetic agent in the vaporizer?', null, 'Agent-specific (keyed) filling adapters prevent wrong agents.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Agent-specific filling adapters', true, 1), ('B', 'Pin-index system', false, 2), ('C', 'Pressure relief valve', false, 3), ('D', 'Color-coded bottles', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a pressure-controlled ventilation (PCV) mode?', null, 'In PCV the inspiratory pressure is fixed and volume varies.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flow rate is constant throughout inspiration', false, 1), ('B', 'Inspiratory pressure is fixed, volume varies', true, 2), ('C', 'Ventilation is triggered only by the patient', false, 3), ('D', 'Tidal volume is fixed, pressure varies', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The bellows in an anesthesia ventilator ascend during which phase?', null, 'Ascending (standing) bellows rise during expiration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inspiration', false, 1), ('B', 'PEEP application', false, 2), ('C', 'Both inspiration and expiration', false, 3), ('D', 'Expiration', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'PEEP (Positive End-Expiratory Pressure) is used to:', null, 'PEEP prevents alveolar collapse at end-expiration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase peak inspiratory pressure', false, 1), ('B', 'Enhance volatile anesthetic uptake', false, 2), ('C', 'Prevent alveolar collapse at end-expiration', true, 3), ('D', 'Reduce tidal volume delivery', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ideal temperature range for an OT as per standards is:', null, 'OT temperature is usually kept about 20-24 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '24–28°C', false, 1), ('B', '20–24°C', true, 2), ('C', '22–26°C', false, 3), ('D', '18–22°C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Critical temperature is important for cylinder storage because:', null, 'Above its critical temperature a gas cannot be liquefied by pressure (CO2 31 °C).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It predicts oxygen analyzer accuracy', false, 1), ('B', 'It determines the pressure needed to liquefy a gas (e.g., CO₂ at 31°C)', true, 2), ('C', 'It indicates flammability risk', false, 3), ('D', 'It correlates with gas density', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a pressure-reducing valve fails, the most likely consequence is:', null, 'A failed regulator lets high pressure through to the machine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gradual decrease in gas flow', false, 1), ('B', 'Automatic switch to pipeline supply', false, 2), ('C', 'Uncontrolled high-pressure gas delivery to the machine', true, 3), ('D', 'Complete cessation of gas supply', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The i-gel differs from other SADs because it:', null, 'The i-gel has a non-inflatable thermoplastic elastomer cuff.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Is made of thermoplastic elastomer (non-inflatable cuff)', true, 1), ('B', 'Can only be used in pediatric patients', false, 2), ('C', 'Has a built-in gastric drainage channel', false, 3), ('D', 'Requires an inflatable cuff', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The first step in reprocessing reusable anesthetic equipment is:', null, 'Cleaning with detergent and water always comes first.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Drying with compressed air', false, 1), ('B', 'Sterilization', false, 2), ('C', 'High-level disinfection', false, 3), ('D', 'Thorough cleaning with detergent and water', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For heat-sensitive equipment (e.g., fiberoptic bronchoscopes), the preferred method of sterilization is:', null, 'Heat-sensitive equipment is sterilised with ethylene oxide (or low-temperature plasma).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'UV radiation', false, 1), ('B', 'Dry heat', false, 2), ('C', 'Ethylene oxide (ETO) gas', true, 3), ('D', 'Boiling at 100°C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which chemical is commonly used for high-level disinfection of anesthetic equipment?', null, '2% glutaraldehyde is used for high-level disinfection.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Household bleach', false, 1), ('B', 'Povidone-iodine', false, 2), ('C', '70% ethanol', false, 3), ('D', '2% glutaraldehyde', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Spaulding classification defines laryngoscope handles as:', null, 'Laryngoscope handles are classed non-critical (blades are semi-critical).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Single-use only', false, 1), ('B', 'Non-critical (cleaning alone suffices)', true, 2), ('C', 'Critical (must be sterile)', false, 3), ('D', 'Semi-critical (require high-level disinfection)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following circuits does not have a valve?', null, 'Mapleson E (Ayre''s T-piece) has no valve.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Closed circuit', false, 1), ('B', 'Bains circuit', false, 2), ('C', 'Magill circuit', false, 3), ('D', 'Mapleson E', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Oxygen was first synthesized by', null, 'Joseph Priestley isolated oxygen in 1774 (Scheele independently).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pristley', true, 1), ('B', 'WTG Morton', false, 2), ('C', 'Valerius Cordus', false, 3), ('D', 'Oliver Wendell homes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure shows equipment used in the anaesthesia workstation.

a) Identify the equipment. (1 mark)', 'a) A pressure regulator (pressure-reducing valve).', null, '[{"point": "Pressure regulator (pressure-reducing valve)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s1', 1, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), '/papers/me/tech3-ot-2025-regulator.png')
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure shows equipment used in the anaesthesia workstation.

b) Describe where it is used and its mechanism. (4 marks)', 'b) It is fitted between a gas cylinder and the anaesthetic machine (on the machine yoke or cylinder head), and as second-stage regulators within the machine. It reduces the high and falling cylinder pressure (e.g. about 2000 psi for oxygen) to a constant low working pressure (about 45-60 psi/4 bar) so flowmeters receive a steady supply. Mechanism: high-pressure gas enters through a valve controlled by a diaphragm attached to a spring. The spring force (F) pushes the valve open; gas pressure in the low-pressure chamber (P) acts on the diaphragm area (A). When P x A exceeds F, the diaphragm rises and closes the valve; as gas is used and pressure falls, the spring reopens it - so outlet pressure stays constant (P = F/A).', null, '[{"point": "Use: between cylinder and machine (also pipeline/ second stage) to reduce high, variable cylinder pressure to constant low pressure (~45-60 psi); mechanism: spring force on diaphragm balances outlet pressure, valve opens/closes (P x A = F)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s1', 2, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), '/papers/me/tech3-ot-2025-regulator.png')
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The figure shows equipment used in the anaesthesia workstation.

c) What are the problems in its use, and its safety features? (5 marks)', 'c) Problems: diaphragm rupture or valve failure can pass high pressure to the machine (barotrauma, damage); leaks; ice formation from cooling as gas expands; fire or explosion if oil or grease contacts high-pressure oxygen; dust blocking the valve; wrong regulator on a cylinder. Safety features: pressure relief (safety) valve on the low-pressure side; pressure gauge; gas-specific connections and pin index system; colour coding; non-interchangeable fittings; oil-free design and sintered filter at the inlet; regular servicing.', null, '[{"point": "Problems: failure/ leak, high pressure delivery, ice formation, fire (oil/grease), diaphragm rupture, wrong regulator; safety: relief valve, gauge, pin index/ gas-specific, oil-free, sintered filter, colour coding", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s1', 3, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), '/papers/me/tech3-ot-2025-regulator.png')
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'On anaesthesia breathing systems:

a) Describe the Mapleson classification of breathing systems and their uses. (5 marks)', 'a) Mapleson classified semi-open (non-rebreathing) systems by the position of the fresh gas inlet, reservoir bag, tubing and APL valve: A (Magill; coaxial Lack) - most efficient for spontaneous breathing (FGF about equal to minute volume, ~70-80 mL/kg/min) but poor for controlled ventilation. B and C - fresh gas and valve near the patient; inefficient; C (Waters) is used for short-term manual ventilation and resuscitation/transport. D (Bain coaxial) - most efficient for controlled ventilation (FGF about 70 mL/kg/min); needs 2-3 times minute volume for spontaneous breathing. E (Ayre''s T-piece) - no valve or bag, low resistance, for children under about 20-25 kg. F (Jackson-Rees modification of E with an open-tailed bag) - paediatric anaesthesia, allows monitoring and assisting ventilation.', null, '[{"point": "Mapleson A (Magill/ Lack) - best for spontaneous breathing; B and C (rarely used, C for transport/ resuscitation); D (Bain) - best for controlled ventilation; E (Ayre''s T-piece) - children; F (Jackson-Rees) - paediatric; with FGF requirements", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s2', 1, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'On anaesthesia breathing systems:

b) Describe the properties of an ideal breathing system. (3 marks)', 'b) An ideal system: delivers the intended gas mixture accurately; is efficient (low fresh gas flow without CO2 rebreathing); has low resistance and dead space; conserves heat and humidity; is lightweight, simple and safe (no disconnection, little leak); suits both spontaneous and controlled ventilation and both adults and children; allows scavenging of waste gases; and is easy to clean or disposable.', null, '[{"point": "Ideal: low resistance and dead space, efficient (low FGF, no rebreathing of CO2), humidify/ warm, light, simple, safe, allow spontaneous and controlled ventilation, scavenging, easy to sterilise, adult and paediatric", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s2', 2, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'On anaesthesia breathing systems:

c) List the components of a breathing system. (2 marks)', 'c) Fresh gas inlet/flow, reservoir (breathing) bag, corrugated breathing tubing, adjustable pressure-limiting (expiratory) valve, connectors and catheter mount to the face mask or tracheal tube; a circle system also has a CO2 absorber and unidirectional inspiratory and expiratory valves (plus filters/HME).', null, '[{"point": "Components: fresh gas inlet, reservoir bag, corrugated tubing, APL (expiratory) valve, connectors/ catheter mount, face mask/ ETT connection; circle adds CO2 absorber and unidirectional valves", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-s2', 3, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write short notes on any FIVE of the following six. Each carries 2 marks.
(i) Sellick''s manoeuvre
(ii) IV fluids
(iii) Prevention of fire in the OR
(iv) Supraglottic airway
(v) Blood groups
(vi) Bispectral index (BIS)', '(i) Sellick''s manoeuvre (cricoid pressure): backward pressure on the cricoid cartilage (about 10 N while awake, 30 N after loss of consciousness) to compress the oesophagus against the vertebra during rapid sequence induction, to reduce regurgitation and aspiration; released if it hinders intubation or if the patient is actively vomiting.
(ii) IV fluids: crystalloids (normal saline, Ringer''s lactate/Hartmann''s, dextrose solutions) and colloids (gelatins, starches, albumin) used for maintenance, replacement of losses and resuscitation; isotonic, hypotonic or hypertonic; monitor volume, electrolytes and signs of overload; warm fluids in major surgery.
(iii) Prevention of fire in the OR: the fire triangle - oxidiser (oxygen, N2O), ignition (diathermy, lasers, light sources) and fuel (drapes, alcohol preps, hair); reduce oxygen near the field, let alcohol preps dry, use wet sponges and laser-safe tubes, place diathermy correctly and keep fire extinguishers ready with a fire drill plan.
(iv) Supraglottic airway: devices that sit above the glottis to maintain an airway without entering the trachea, e.g. LMA classic, ProSeal, i-gel; used for routine anaesthesia and difficult airway rescue; quick to insert, but limited protection against aspiration.
(v) Blood groups: ABO system (A, B, AB, O with natural antibodies) and Rh (D) system; group O negative is the universal red cell donor and AB the universal plasma donor/recipient; grouping and cross-matching before transfusion prevent haemolytic reactions.
(vi) Bispectral index (BIS): a processed EEG monitor giving a number 0-100 for depth of anaesthesia; 40-60 indicates adequate general anaesthesia; helps reduce awareness and excessive anaesthetic dosing; affected by artefacts and some drugs (ketamine, N2O).', null, '[{"point": "Any five short notes, 2 marks each: accurate definition/ purpose plus key points (technique, types, precautions)", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Preparing the theatre for an emergency laparotomy
You are the senior OT Technologist on duty when a 45-year-old man, Mr Hodo, is rushed into the emergency department with signs of septic shock and acute abdominal rigidity. A provisional diagnosis of a perforated viscus (likely duodenal ulcer) is made, and the surgical team declares an emergency exploratory laparotomy. The patient is being resuscitated and will be transferred to the OT within 30 minutes. Detail the comprehensive, systematic preparation you would undertake in the operating theatre.

a) Preoperative theatre readiness (6 marks)', 'Prepare a clean, ready theatre: check the anaesthesia machine (leak test, gases, vaporisers, ventilator, suction working), airway equipment for rapid sequence induction (range of cuffed tubes, bougie, video laryngoscope, suction, difficult airway trolley), and monitoring (ECG, SpO2, NIBP, EtCO2, temperature, invasive arterial and central venous lines). Prepare drugs - induction agents, muscle relaxants for RSI, vasopressors (noradrenaline, adrenaline), antibiotics, fluids and warmers, and confirm cross-matched blood is ready. Surgical side: major laparotomy set, retractors, suction, diathermy, sutures, warm saline for peritoneal lavage, drains, swabs and instruments counted. Set up the operating table with positioning aids, warming mattress and forced-air warmer, and raise room temperature to prevent hypothermia in a septic patient.', null, '[{"point": "Theatre/ table ready: clean OT, positioning aids, warming (warm room, warming blanket/ fluid warmer)", "marks": 2}, {"point": "Anaesthesia: machine and suction checked, airway equipment for RSI (cuffed tubes, bougie, video laryngoscope), drugs (induction, vasopressors, antibiotics), monitoring (arterial line, CVP), IV lines/ pressure bags", "marks": 2}, {"point": "Surgical: laparotomy set, instruments, sutures, diathermy, suction, warm saline for lavage, swabs counted; blood products requested", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case1', 1, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Preparing the theatre for an emergency laparotomy
You are the senior OT Technologist on duty when a 45-year-old man, Mr Hodo, is rushed into the emergency department with signs of septic shock and acute abdominal rigidity. A provisional diagnosis of a perforated viscus (likely duodenal ulcer) is made, and the surgical team declares an emergency exploratory laparotomy. The patient is being resuscitated and will be transferred to the OT within 30 minutes. Detail the comprehensive, systematic preparation you would undertake in the operating theatre.

b) Infection control and sterilisation (4 marks)', 'Use only sterile instruments and supplies - check sterility indicators, pack integrity and expiry dates; maintain strict aseptic technique with surgical hand scrub, gowns and gloves, and a correctly laid-out sterile field. Limit traffic and keep doors closed; ensure skin preparation and draping; give antibiotics as prescribed before incision. As a contaminated (dirty) case, plan safe handling and disposal of peritoneal fluid, waste and linen, separate soiled instruments for decontamination, and carry out thorough terminal cleaning of the theatre afterwards.', null, '[{"point": "Sterile instruments verified (indicators, packs intact, expiry), aseptic technique, scrubbing/ gowning", "marks": 2}, {"point": "Theatre cleanliness, traffic control, prophylactic/ therapeutic antibiotics timing, skin prep, handling contaminated (dirty case) waste/ instruments afterwards, terminal cleaning", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case1', 2, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Preparing the theatre for an emergency laparotomy
You are the senior OT Technologist on duty when a 45-year-old man, Mr Hodo, is rushed into the emergency department with signs of septic shock and acute abdominal rigidity. A provisional diagnosis of a perforated viscus (likely duodenal ulcer) is made, and the surgical team declares an emergency exploratory laparotomy. The patient is being resuscitated and will be transferred to the OT within 30 minutes. Detail the comprehensive, systematic preparation you would undertake in the operating theatre.

c) Team coordination and communication (4 marks)', 'Hold a quick team briefing with surgeon, anaesthetist, scrub and circulating nurses and technicians to agree roles, the plan, special equipment and anticipated problems (shock, difficult airway, massive bleeding). Use the WHO Surgical Safety Checklist (sign in, time out, sign out). Keep in contact with the emergency department about the patient''s condition and arrival time, with the blood bank and laboratory, and with the ICU for a post-operative bed. Use clear, closed-loop communication during the case, and give a structured handover (e.g. SBAR) and complete documentation.', null, '[{"point": "Brief the team: surgeon, anaesthetist, nurses, technicians - roles, plan, equipment, anticipated problems; WHO surgical safety checklist (sign in, time out, sign out)", "marks": 2}, {"point": "Communication with ED/ ICU, blood bank, lab; closed-loop communication; handover; documentation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case1', 3, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Preparing the theatre for an emergency laparotomy
You are the senior OT Technologist on duty when a 45-year-old man, Mr Hodo, is rushed into the emergency department with signs of septic shock and acute abdominal rigidity. A provisional diagnosis of a perforated viscus (likely duodenal ulcer) is made, and the surgical team declares an emergency exploratory laparotomy. The patient is being resuscitated and will be transferred to the OT within 30 minutes. Detail the comprehensive, systematic preparation you would undertake in the operating theatre.

d) Safety and contingency measures (6 marks)', 'Patient safety: confirm identity, procedure and consent; check allergies; plan rapid sequence induction for aspiration risk (NG tube, cricoid pressure); careful positioning and pressure-area care; correct diathermy pad placement; swab, sharp and instrument counts. Haemodynamic contingencies: vasopressors and inotropes ready, defibrillator and resuscitation trolley, rapid infuser/pressure bags, a massive transfusion plan, and a difficult/failed airway plan. Equipment backups: spare oxygen cylinders, backup suction, UPS/generator power, spare laryngoscope and monitoring cables. Staff safety: PPE, safe sharps handling, and exposure precautions. Plan post-operative ICU care and arrange extra staff if needed.', null, '[{"point": "Patient safety: identification, consent, allergies, aspiration risk (RSI, NG tube), positioning/ pressure care, diathermy pad, counts", "marks": 2}, {"point": "Haemodynamic contingency: vasopressors, massive transfusion/ rapid infuser, defibrillator, emergency drugs; difficult airway plan", "marks": 2}, {"point": "Equipment/ system backup: backup oxygen cylinders, power (UPS), suction, spare equipment; ICU plan, staff safety (PPE, sharps)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case1', 4, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Contaminated gauze during laparoscopic cholecystectomy
You are the senior OT Technologist in a busy general surgery theatre. During a laparoscopic cholecystectomy, a stack of sterile gauze (intended for the procedure) falls onto the visibly soiled floor near the scrub nurse''s feet. The circulating nurse quickly picks it up, places it back on the sterile instrument table and says, "It''s fine, we''ll use it if needed." The surgeon and anaesthetist are focused on the patient and do not notice. The patient has a BMI of 35 and a history of diabetes.

a) Identify THREE immediate risks to the patient arising from this situation. (6 marks)', '1. Surgical site infection - contaminated gauze carries microorganisms from the floor into the wound or abdomen; obesity (BMI 35) and diabetes greatly increase infection risk and impair healing. 2. Contamination of the whole sterile field - the gauze has touched the sterile table and other instruments, risking intra-abdominal infection, abscess or sepsis. 3. Swab count errors and retained foreign body - items moved on and off the table outside procedure upset the count; also longer operation and anaesthesia time if the field must be re-set, adding risk.', null, '[{"point": "Surgical site infection (contaminated gauze), especially with obesity and diabetes", "marks": 2}, {"point": "Contamination of the whole sterile field/ instruments - intra-abdominal infection, sepsis", "marks": 2}, {"point": "Others: retained foreign body/ count errors (gauze added/ removed), delayed healing, delay/ prolonged anaesthesia if field must be re-set", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case2', 1, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Contaminated gauze during laparoscopic cholecystectomy
You are the senior OT Technologist in a busy general surgery theatre. During a laparoscopic cholecystectomy, a stack of sterile gauze (intended for the procedure) falls onto the visibly soiled floor near the scrub nurse''s feet. The circulating nurse quickly picks it up, places it back on the sterile instrument table and says, "It''s fine, we''ll use it if needed." The surgeon and anaesthetist are focused on the patient and do not notice. The patient has a BMI of 35 and a history of diabetes.

b) Describe FOUR specific actions you would take to mitigate these risks. (6 marks)', '1. Speak up immediately and assertively - tell the scrub nurse, circulating nurse and surgeon that the gauze is contaminated and must not be used (''stop'' principle). 2. Remove the contaminated gauze and treat everything it contacted as contaminated - replace affected instruments or re-drape/re-set the instrument table area, and have the scrub team change gloves if they handled it. 3. Open fresh sterile gauze, adjust and verify the swab count and record it so no item is lost or retained. 4. Document and report the incident through the incident reporting system and inform the surgeon so post-operative wound monitoring (and prophylactic antibiotic review) can be planned for this high-risk patient.', null, '[{"point": "Speak up immediately (stop the use), inform the surgeon/ team - ''stop the line''", "marks": 1.5}, {"point": "Remove the gauze and anything it touched; consider re-setting/ replacing sterile table items, change gloves", "marks": 1.5}, {"point": "Recount swabs/ instruments and document; replace with new sterile packs", "marks": 1.5}, {"point": "Report incident (incident reporting system), monitor patient for infection, inform team for post-op antibiotics/ wound surveillance", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case2', 2, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Contaminated gauze during laparoscopic cholecystectomy
You are the senior OT Technologist in a busy general surgery theatre. During a laparoscopic cholecystectomy, a stack of sterile gauze (intended for the procedure) falls onto the visibly soiled floor near the scrub nurse''s feet. The circulating nurse quickly picks it up, places it back on the sterile instrument table and says, "It''s fine, we''ll use it if needed." The surgeon and anaesthetist are focused on the patient and do not notice. The patient has a BMI of 35 and a history of diabetes.

c) Explain ONE long-term strategy to prevent similar incidents. (4 marks)', 'Introduce regular training and competency assessment for all theatre staff on aseptic technique and sterile field management, with a clear written policy that anything dropped is never returned to the sterile field, supported by a culture of safety in which everyone - whatever their rank - is encouraged to speak up without blame. Reinforce it through regular audits of practice, incident review with feedback, and use of the WHO Surgical Safety Checklist and team briefings.', null, '[{"point": "Strategy explained: regular aseptic technique/ infection control training and competency assessment, culture of safety (speaking up, no-blame), clear SOPs (dropped items never reused), audits and feedback, checklist use", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case2', 3, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Contaminated gauze during laparoscopic cholecystectomy
You are the senior OT Technologist in a busy general surgery theatre. During a laparoscopic cholecystectomy, a stack of sterile gauze (intended for the procedure) falls onto the visibly soiled floor near the scrub nurse''s feet. The circulating nurse quickly picks it up, places it back on the sterile instrument table and says, "It''s fine, we''ll use it if needed." The surgeon and anaesthetist are focused on the patient and do not notice. The patient has a BMI of 35 and a history of diabetes.

d) Justify your decisions using evidence-based guidelines. (4 marks)', 'AORN and CDC/WHO guidance on aseptic technique state that any sterile item that falls below table level or touches an unsterile surface is contaminated and must not be returned to the sterile field. WHO Global Guidelines for the Prevention of Surgical Site Infection identify contamination, obesity and diabetes (hyperglycaemia) as major risk factors, so strict asepsis is essential. The WHO Surgical Safety Checklist and patient safety principles support speaking up, team communication and accurate counts to prevent retained items. Incident reporting and learning systems (WHO patient safety framework) help prevent recurrence. Therefore removing the gauze, re-establishing sterility, recounting and reporting are evidence-based and protect the patient.', null, '[{"point": "Cites guidelines: WHO SSI prevention guidelines, AORN/ CDC aseptic technique (items below table level/ dropped are unsterile), WHO Surgical Safety Checklist, patient safety/ incident reporting principles", "marks": 2}, {"point": "Links to evidence: contaminated items increase SSI; obesity/ diabetes risk factors; speaking up reduces errors; counts prevent retained items", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, OT Technologist", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ot2025-case2', 4, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A Mallampati class IV view (only the hard palate visible) predicts', null, 'Higher Mallampati classes (III-IV) predict difficult laryngoscopy and intubation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Possible difficult intubation', true, 1), ('B', 'Need for spinal anaesthesia', false, 2), ('C', 'Normal laryngoscopy', false, 3), ('D', 'Easy mask ventilation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the pin index safety system, the pin positions for an oxygen cylinder are', null, 'Oxygen 2-5; nitrous oxide 3-5; medical air 1-5; carbon dioxide 1-6.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 and 6', false, 1), ('B', '2 and 5', true, 2), ('C', '1 and 5', false, 3), ('D', '3 and 5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Modern variable-bypass vaporisers maintain a steady output when room temperature changes because they have', null, 'Temperature-compensating mechanisms alter the splitting ratio as the agent cools or warms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ot-technologist'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, OT Technologist): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'occupational-therapy-technology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'An oxygen failure alarm', false, 1), ('B', 'A pressure relief valve', false, 2), ('C', 'A pin index system', false, 3), ('D', 'Automatic temperature compensation (e.g. bimetallic strip)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
