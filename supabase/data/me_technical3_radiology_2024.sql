-- ME Paper III (Technical, Radiology): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'radiology', 'Radiology' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'radiology') is null then raise exception 'unknown specialisation radiology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'radiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'radiology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2024 Main Examination, Technical Paper III, Radiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'radiology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2024 Main Examination, Technical Paper III, Radiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'radiology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2024 Main Examination, Technical Paper III, Radiology');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following occurs as the result of filtration of X- rays? I. Harden the X-ray beam II. Increase the quality of the X-ray beam III. Remove high energy X-rays from the beam', null, 'Filtration removes low-energy photons, so the beam becomes harder and its quality (mean energy) increases; it does not remove high-energy X-rays.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I and II', true, 1), ('B', 'II and III', false, 2), ('C', 'All of the above', false, 3), ('D', 'I and III', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most useful type of X- beam in medical imaging is', null, 'K-shell characteristic X-rays of tungsten (about 69 keV) are the only characteristic X-rays useful for imaging.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'produced from M-shell of the tungsten anode.', false, 1), ('B', 'produced from K-shell of the tungsten anode.', true, 2), ('C', 'produced from L-shell of the tungsten anode.', false, 3), ('D', 'produced from N-shell of the tungsten anode', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the process is responsible for the production of electrons at cathode in an X-ray tube?', null, 'The heated filament releases electrons by thermionic emission.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Induction', false, 1), ('B', 'Electromagnetic induction', false, 2), ('C', 'Thermionic emission', true, 3), ('D', 'Superconducting emission phenomenon', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following will help reduce exposure to the patient? I. High KV,low mAs II. Collimation III. Filltration', null, 'High kV with low mAs, collimation and filtration all reduce patient dose.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I and III only', false, 1), ('B', 'II and III only', false, 2), ('C', 'I and II only', false, 3), ('D', 'I, II and III', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Doubling the distance from 3 feet to 6 feet from the source of X-ray will decrease the radiation dose by a factor of', null, 'Inverse square law: doubling the distance gives (1/2)² = 1/4 of the dose.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1/8', false, 1), ('B', '1/4', true, 2), ('C', '1/12', false, 3), ('D', '1/2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following X-ray beam possess the highest quality?', null, 'Beam quality rises with both kV and filtration: 90 kV with 3.0 mm Al is the hardest beam.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '70 KV with 2.0 mm Aluminum filter', false, 1), ('B', '85 KV with 2.5 mm Aluminum filter', false, 2), ('C', '80 KV with 1.5 mm Aluminum filter', false, 3), ('D', '90 KV with 3.0 mm Aluminum filter', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Radiation from the tube housing other than the primary beam is', null, 'Radiation escaping through the tube housing, other than the useful beam, is leakage radiation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Remnant.', false, 1), ('B', 'Compton.', false, 2), ('C', 'Secondary.', false, 3), ('D', 'Leakage.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The number of structural lines actually recorded within a radiographic image is known as', null, 'The number of line pairs (structural lines) recorded is the spatial resolution.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'visibility', false, 1), ('B', 'resolution', true, 2), ('C', 'quality.', false, 3), ('D', 'contrast', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is Grid Frequency?', null, 'Grid frequency is the number of lead strips per inch (or per cm); option (a) describes grid ratio.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ratio of lead strip height into interspace thickness', false, 1), ('B', 'Number of lead strips per inch', true, 2), ('C', 'Speed of the reciprocating grid', false, 3), ('D', 'Ratio of lead strips height to lead strip thickness', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a Radio Technologist left a sick patient unattended and he/she fell off the X-ray table and sustained a serious injury, the Technologist could be sued for', null, 'Failing to take reasonable care that causes injury is negligence.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'felony.', false, 1), ('B', 'battery.', false, 2), ('C', 'negligence.', true, 3), ('D', 'reasonable care.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The crest of the ilium is at the same level as which of the following vertebrae?', null, 'The iliac crest lies at the level of the L4-L5 interspace (L4).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'L3 and L4', false, 1), ('B', 'L4 and L5', true, 2), ('C', 'L2 and L3', false, 3), ('D', 'L1 and L2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the radiation safety concepts DO NOT apply to diagnostic radiography?', null, 'Diagnostic X-rays use sealed generators, so there is no radioactive contamination; time, distance and shielding apply.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Contamination control', true, 1), ('B', 'Distance', false, 2), ('C', 'Shielding', false, 3), ('D', 'Time', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '“Congruence of radiation and optical field” is a quality assurance test performed for which of the following machine?', null, 'Light-field to X-ray-field congruence is a QA test of the X-ray collimator.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ultrasound', false, 1), ('B', 'Computed Tomography', false, 2), ('C', 'X-ray', true, 3), ('D', 'Magnetic Resonance Imaging', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Common filters used in Computed Tomography (CT) are of Bow Tie design owing to', null, 'The bow-tie filter follows the body''s shape: thicker at the edges where the patient is thinner.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Patient’s body structure', true, 1), ('B', 'Patient’s height', false, 2), ('C', 'Patient’s weight', false, 3), ('D', 'Patient’s age', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT usually a component of CT stroke protocol?', null, 'Delayed brain scans after 5 minutes are not part of a CT stroke protocol.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Do the CT scan of the brain', false, 1), ('B', 'Inform the Radiologist On call', false, 2), ('C', 'Give contrast for CT angiography if required', false, 3), ('D', 'Do delayed scans after 5 minutes for brain imaging', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements regarding different CT scanner generations are correctly paired?', null, 'First-generation CT used a translate-rotate motion; 3rd generation is rotate-rotate and 4th is rotate-stationary.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4th Generation-Rotate-Rotate', false, 1), ('B', '4th Generation-most commonly used currently', false, 2), ('C', '3rd Generation-Rotate Stationary', false, 3), ('D', '1st Generation-Rotate-Translate', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Partial Volume artifacts in CT are rectified by', null, 'Thinner slices reduce partial volume averaging.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Beam filtrations', false, 1), ('B', 'Positioning aids', false, 2), ('C', 'Thin slice acquisition', true, 3), ('D', 'Respiratory or Cardiac gating', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Projecting the voxel with the highest attenuation value on every view throughout the volume onto a 2D image is known as', null, 'Projecting the highest-attenuation voxel along each ray is Maximum Intensity Projection (MIP).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maximum Intensity Projection', true, 1), ('B', 'Three Dimensional Reconstruction', false, 2), ('C', 'Minimum Intensity Projection', false, 3), ('D', 'Surface rendering', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following medications for diabetic patient is contraindicated for contrast enhanced computed tomography (CECT)?', null, 'Metformin is withheld around iodinated contrast because of the risk of lactic acidosis if renal function falls.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Glipizide', false, 1), ('B', 'Insulin', false, 2), ('C', 'Metformin', true, 3), ('D', 'Glyburide', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The kilovoltage peak (KVp) used for an adult patient in Computed Tomography scan is', null, '120 kVp is the standard adult CT setting.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '140', false, 1), ('B', '110', false, 2), ('C', '130', false, 3), ('D', '120', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the protons in the patient’s body who is undergoing Magnetic Resonance Imaging relaxes by transferring energy to the surrounding space, it is known as', null, 'Spin-lattice relaxation (energy given to the surrounding lattice) is T1 recovery.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T2 recovery', false, 1), ('B', 'T2 decay', false, 2), ('C', 'T1 recovery', true, 3), ('D', 'T1 decay', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What type of cylinders should you use to transport cryogens?', null, 'Cryogens such as liquid helium and nitrogen are carried in insulated Dewar vessels.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plastic cylinders', false, 1), ('B', 'Liquefied Petroleum Gas cylinders', false, 2), ('C', 'Oxygen cylinders', false, 3), ('D', 'Dewar cylinders', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Magnetic Resonance Imaging ( MRI) Patient’s anatomy is best given in', null, 'T1-weighted images show anatomy best; T2-weighted images show pathology best.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T1 weighted images', true, 1), ('B', 'Gradient images', false, 2), ('C', 'T2 weighted images', false, 3), ('D', 'Proton density images', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an analytical tool or application?', null, 'MR spectroscopy analyses the chemical make-up of tissue - an analytical application.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ultrasound', false, 1), ('B', 'Radiography', false, 2), ('C', 'MRI spectroscopy', true, 3), ('D', 'Mammography', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'DICOM is', null, 'DICOM is the international standard format for medical images and their communication.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'an standard medical image format.', true, 1), ('B', 'a software image.', false, 2), ('C', 'a computer image.', false, 3), ('D', 'a medical image feature.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The type of display workstation used to review images after acquisition and before sending it to the Radiologist for reporting is', null, 'The technologist checks images at the QC station before sending them to the radiologist.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Image Management Station', false, 1), ('B', 'Technologist’s Quality Control Station', true, 2), ('C', 'Physician Review Station', false, 3), ('D', 'Radiologists Workstation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Digital Radiography a link between the quality of the image and the dose to the detector is shown by', null, 'The exposure indicator links detector dose with image quality in digital radiography.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Exposure indicator', true, 1), ('B', 'Exposure parameters', false, 2), ('C', 'Exposure patient dose', false, 3), ('D', 'Exposure Exhibitor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Compare and contrast deterministic and stochastic effects of ionizing radiation focusing on their nature, threshold, examples, mechanism and onset.', 'Deterministic (tissue reactions) and stochastic effects compared:
Nature: deterministic effects are certain to occur above a dose and their severity increases with dose; stochastic effects occur by chance - the probability rises with dose but the severity does not depend on dose.
Threshold: deterministic effects have a threshold dose (e.g. about 2 Gy for skin erythema, about 0.5 Gy for lens opacities); stochastic effects are assumed to have no threshold (linear no-threshold model), so any dose carries some risk.
Examples: deterministic - skin erythema and burns, hair loss (epilation), cataract, temporary or permanent sterility, acute radiation syndrome; stochastic - radiation-induced cancers such as leukaemia and thyroid cancer, and hereditary (genetic) effects in offspring.
Mechanism: deterministic effects result from the killing or malfunction of a large number of cells in a tissue; stochastic effects result from DNA damage (mutation) in a single cell or a few cells that survive and transform.
Onset: deterministic effects are usually early (hours to weeks, except cataract); stochastic effects are late, appearing years to decades after exposure.
Radiation protection aims to prevent deterministic effects completely and keep the probability of stochastic effects as low as reasonably achievable (ALARA).', null, '[{"point": "Nature and threshold: deterministic - severity increases with dose, threshold dose exists; stochastic - probability (not severity) increases with dose, no threshold (linear no-threshold model)", "marks": 2}, {"point": "Mechanism and onset: deterministic - killing of many cells, usually early (hours-weeks); stochastic - DNA mutation in one or few cells, late (years-decades)", "marks": 2}, {"point": "Examples: deterministic - skin erythema, epilation, cataract, sterility, acute radiation syndrome; stochastic - cancer (leukaemia), hereditary effects", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'short_answer', 'a) What is CT stroke protocol (code stroke CT)? (1 mark)', 'a) CT stroke protocol (code stroke CT) is a rapid, pre-agreed imaging pathway for a patient with suspected acute stroke: as soon as the code is called, the patient is taken straight to CT for a non-contrast CT brain followed by CT angiography (and CT perfusion where available), so the stroke team can decide on treatment within the time window ("time is brain").', null, '[{"point": "Rapid, pre-agreed imaging pathway for suspected acute stroke (NCCT brain, CT angiography, +/- CT perfusion) done immediately on arrival to decide treatment within the time window", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-s2', 1, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) What is the purpose of doing non-contrast CT brain and CT cerebral angiography during Code Stroke CT? (2 marks)', 'b) Non-contrast CT brain is done first to exclude intracranial haemorrhage (and stroke mimics such as tumour) before thrombolysis is given, and to look for early ischaemic changes (ASPECTS score). CT cerebral angiography shows the site of a large vessel occlusion (e.g. middle cerebral artery) to select patients for mechanical thrombectomy, and also shows carotid disease, collaterals and aneurysms.', null, '[{"point": "NCCT: exclude haemorrhage (and mimics), early ischaemic signs/ ASPECTS before thrombolysis; CTA: locate large vessel occlusion for thrombectomy, check carotids/ collaterals", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-s2', 2, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'short_answer', 'c) Why do you think MRI is superior to CT in stroke protocol? List down the essential sequences of MRI stroke protocol. (2 marks)', 'c) MRI is more sensitive and specific: diffusion-weighted imaging shows an infarct within minutes, it detects small lacunar and posterior fossa (brainstem, cerebellum) infarcts that CT misses, it helps estimate infarct age (DWI-FLAIR mismatch) and uses no ionising radiation. Essential sequences: DWI with ADC map, FLAIR, gradient echo (GRE) or susceptibility-weighted imaging (SWI) for haemorrhage, T2-weighted images, and time-of-flight MR angiography (with perfusion if available).', null, '[{"point": "MRI more sensitive: DWI shows infarct within minutes, posterior fossa/ small lacunes, no radiation; sequences DWI/ ADC, FLAIR, GRE/ SWI, (T2), MRA/ perfusion", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-s2', 3, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'short_answer', 'What is radiography? Draw a labelled diagram of an X-ray tube with a rotating anode.', 'Radiography is a medical imaging technique in which a beam of X-rays is passed through a part of the body onto a film or digital detector; because tissues attenuate X-rays differently (bone most, air least), an image of internal structures is produced for diagnosis.
Rotating anode X-ray tube - the diagram should show and label:
- Glass (or metal) envelope containing a vacuum, inside a lead-lined tube housing filled with insulating oil.
- Cathode (negative): tungsten filament(s) in a focusing cup, heated to emit electrons by thermionic emission.
- Anode (positive): a rotating disc (tungsten-rhenium target on a molybdenum/graphite base) with a bevelled target angle and focal track, mounted on a molybdenum stem.
- Rotor (inside the envelope) and stator coils (outside) forming the induction motor that spins the anode at about 3000-10 000 rpm to spread the heat.
- Electron stream from cathode to anode, the focal spot, and the X-ray beam leaving through the window (port) with added filtration.
- High-voltage cable connections to cathode and anode.', null, '[{"point": "Definition: imaging technique using X-rays passing through the body to produce an image on film/ detector, based on differential attenuation of tissues", "marks": 1}, {"point": "Diagram labels: glass/ metal envelope (vacuum), cathode with filament and focusing cup, rotating anode disc (tungsten target) with stem, rotor and stator (induction motor), tube housing with oil, window/ port, X-ray beam, high voltage cables", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'short_answer', 'If you were to design an Artificial Intelligence algorithm for Radiology, what are the features that you would like to include? What challenges do you think you will face?', 'Features I would include: automatic detection and flagging of critical findings (intracranial bleed, fractures, pneumothorax, lung nodules, tuberculosis on chest X-ray) to prioritise the radiologist''s worklist; automatic measurements and segmentation (organ volumes, tumour size, cardiothoracic ratio); image quality and positioning checks at the technologist''s QC station with immediate feedback; protocol selection and radiation dose optimisation (low-dose CT reconstruction); comparison with previous studies; drafting of structured reports; seamless integration with PACS/RIS and DICOM; and explainable output (heat maps, confidence scores) so the radiologist can verify the result.
Challenges: collecting enough good-quality, accurately labelled local data; bias and poor performance on our population, equipment and image quality; the need for clinical validation and regulatory approval; patient data privacy and cyber security; cost, IT infrastructure and internet connectivity, especially in district hospitals; integration with existing systems; training and acceptance by staff; legal responsibility (liability) for errors and the risk of over-reliance on AI; and keeping the model updated as practice changes.', null, '[{"point": "Features: automatic detection/ triage of urgent findings (bleed, fracture, nodule, TB), worklist prioritisation, measurements/ segmentation, dose optimisation and protocol selection, image quality check/ positioning feedback, draft reports, PACS/ RIS integration, explainability (heat maps)", "marks": 3}, {"point": "Challenges: large good-quality labelled local data, bias/ generalisation to local population and machines, validation and regulation, data privacy/ security, integration and cost, internet/ IT capacity, acceptance/ training, liability and over-reliance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

1. Describe the preparation steps and imaging technique that you will carry out while doing Chest X-Ray PA view. (10 marks)', 'Preparation: check the request form and identify the patient with two identifiers; explain the procedure and get her cooperation; ask her to remove clothing, jewellery, hair clips and any metal from the chest and give a gown; confirm she is not pregnant (age 55 - ask about menopause/LMP); as she has chest pain, keep her monitored, keep the procedure short and have the emergency nurse nearby; if she cannot stand, do an AP erect or sitting view and mark it.
Technique (PA erect): patient stands facing the detector with the chest against it, chin raised and resting on top; feet slightly apart, weight even; backs of the hands on the hips with elbows and shoulders rotated forward to move the scapulae away from the lung fields; median sagittal plane perpendicular and centred, no rotation; horizontal central ray at the level of T7 (inferior angles of the scapulae); source-image distance 180 cm (72 inches) to reduce magnification of the heart; collimate to include the lung apices, costophrenic angles and lateral rib margins; high kV (about 110-125 kV) with a grid and short exposure time to reduce motion; exposure on arrested deep inspiration (second breath); apply the right/left marker. Check the image: 10 posterior ribs above the diaphragm, clavicles equidistant from the spinous processes, scapulae outside the lungs, whole lung fields included.', null, '[{"point": "Preparation: verify request/ identity, explain, remove metal/ jewellery, gown, check pregnancy (55 y - LMP/ menopause), infection control, cardiac monitoring if unwell", "marks": 4}, {"point": "Technique: erect, chest against detector, chin raised, hands on hips, shoulders rolled forward (scapulae out), MSP centred, central ray at T7 (inferior angle of scapula), 180 cm SID, collimate, high kV (~110-125) short time with grid, full inspiration on 2nd breath hold, markers, check image (10 ribs, no rotation)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 1, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

2. Describe the imaging technique that you will carry out while doing NCCT brain. (5 marks)', 'Explain the procedure, remove hair clips, earrings, dentures and other metal from the head. Lay the patient supine, head first, with the head in the head holder, chin slightly tucked, and immobilise with pads and straps (she has a headache and may move). Align the median sagittal plane with the laser and the orbitomeatal line (or angle the gantry parallel to it) to keep the eye lenses out of the beam. Take a lateral scout (topogram) and plan from the skull base (foramen magnum) to the vertex. Scan without contrast, axial or helical, about 120 kV with dose modulation, 5 mm slices for viewing and thin slices (0.625-1.25 mm) for multiplanar reconstruction. Reconstruct in brain window (W 80, L 40) and bone window, with sagittal and coronal reformats. Check for motion or artefacts and repeat if needed, then send the images to PACS and inform the radiologist urgently.', null, '[{"point": "Patient supine head first, head in head rest, immobilised, remove metal, orbitomeatal baseline/ gantry tilt to avoid lens, centring", "marks": 2}, {"point": "Scan scout (lateral), cover skull base to vertex, axial/ helical ~120 kV, 5 mm (thin 0.6-1.25 for reconstructions), brain and bone windows, no contrast, check for motion, send to PACS", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 2, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

3. What precautions you will take before doing CT pulmonary angiography and why? (5 marks)', 'Before CTPA (iodinated contrast) I would: (1) check renal function (serum creatinine/eGFR) because she is diabetic and hypertensive and at higher risk of contrast-induced kidney injury; ensure she is well hydrated. (2) Ask about metformin - it is withheld for 48 hours after contrast (if renal function is reduced) because of the risk of lactic acidosis; check blood sugar. (3) Ask about previous contrast reactions, allergies and asthma, and keep emergency drugs, oxygen and resuscitation equipment ready; premedicate if advised by the radiologist. (4) Take informed consent and confirm she is not pregnant. (5) Insert a good 18-20G cannula in the antecubital vein to allow a fast injection (4-5 mL/s) and check it with saline to avoid extravasation. (6) Explain the breath-hold instructions and monitor her, as she has chest pain and may be unstable.', null, '[{"point": "Renal function (creatinine/ eGFR) - diabetic, hypertensive, contrast nephropathy risk; hydration", "marks": 1.5}, {"point": "Metformin - withhold (lactic acidosis), check blood sugar", "marks": 1}, {"point": "Allergy/ previous contrast reaction, asthma - premedication, emergency drugs ready; informed consent; pregnancy status", "marks": 1.5}, {"point": "Good IV access (18-20G antecubital), fasting as per protocol, explain breath hold, monitoring", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 3, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

4. How will you perform CT pulmonary angiography? (5 marks)', 'Position the patient supine with arms raised above the head, centred in the gantry. Take an AP/lateral scout and plan from the lung apices to the diaphragm (below the costophrenic angles). Using a pressure injector through an 18-20G cannula, inject about 50-70 mL of high-concentration iodinated contrast (e.g. 350 mgI/mL) at 4-5 mL/s followed by a saline chaser. Use bolus tracking with the region of interest on the main pulmonary trunk and trigger the scan when enhancement reaches about 100-150 HU (or use a test bolus). Scan helically, caudo-cranial, with thin collimation (about 0.6-1 mm), 100-120 kV with dose modulation, during a breath hold (gentle, to avoid a Valsalva effect that dilutes contrast). Reconstruct thin slices in mediastinal and lung windows with MPR and MIP images. Check the pulmonary arteries are well opacified, observe the patient for contrast reactions for about 30 minutes, and send images to PACS for urgent reporting.', null, '[{"point": "Positioning: supine, feet/ head first, arms above head, centred, scout from apices to diaphragm", "marks": 1}, {"point": "Contrast: 50-70 mL high-concentration iodine at 4-5 mL/s via 18G, saline chaser, bolus tracking ROI on pulmonary trunk, trigger ~100 HU", "marks": 2}, {"point": "Scan: caudo-cranial helical, thin slices (~1 mm), 100-120 kV, breath hold (shallow), reconstruct lung/ mediastinal windows, MPR/ MIP; check enhancement, observe patient", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 4, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

5. Describe the preparation steps and the imaging techniques for MRI lumbar spine. (10 marks)', 'Preparation: complete the MRI safety screening checklist with the patient - pacemaker or other implanted devices, aneurysm clips, cochlear implants, metal fragments (eyes), joint replacements, previous surgery, pregnancy; confirm the device is MR-conditional if present. Ask her to remove all metal objects, jewellery, hearing aids, cards, phones and hair clips, and change into a gown. Explain the noise and duration (20-30 minutes), the need to keep still, and give ear plugs/headphones and the call bell; check for claustrophobia; give pain relief through the physician if severe back pain prevents her lying still. Take consent (and check renal function if contrast is planned).
Technique: supine, feet first, on the spine coil, with a pad under the knees for comfort, arms by the side; centre the laser at the iliac crests (L3). Take a three-plane localiser. Standard sequences: sagittal T1-weighted and sagittal T2-weighted (plus STIR for oedema/fractures) from T11 to the sacrum; axial T2-weighted (and T1) slices angled parallel to the L3-L4, L4-L5 and L5-S1 disc spaces, or stacked through the lumbar spine, to look for disc herniation compressing the nerve roots (radiating right leg pain); coronal images if scoliosis. Contrast (gadolinium) only if infection, tumour or post-operative scarring is suspected. Check for motion, repeat as needed and send to PACS.', null, '[{"point": "Safety screening: MRI checklist (pacemaker, implants, aneurysm clips, metal fragments, pregnancy), remove all metal/ cards, gown, ear protection, consent, claustrophobia, pain relief so she can lie still", "marks": 4}, {"point": "Technique: supine, feet first, spine coil, knee support, centre at L3/ iliac crest; localiser; sagittal T1, T2 (STIR), axial T2 (and T1) through L3-S1 discs angled to disc spaces, coronal if needed; FOV T12-S2, contrast only if infection/ tumour; check images", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 5, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

6. What do you think the physician is trying to rule out by ordering the above mentioned medical imaging tests? (5 marks)', 'With sudden left-sided chest pain in a 55-year-old hypertensive diabetic woman, the chest X-ray looks for pneumothorax, pneumonia, heart failure (cardiomegaly, pulmonary oedema), widened mediastinum (aortic dissection) and rib fractures, and CT pulmonary angiography is ordered to rule out pulmonary embolism (and it also shows aortic dissection). Persistent headache in a hypertensive patient raises concern about intracranial haemorrhage, stroke or hypertensive emergency (or a space-occupying lesion), so a CT brain is done. Severe backache radiating to the right leg suggests a prolapsed lumbar disc compressing a nerve root (sciatica) or other causes such as spinal canal stenosis, cauda equina compression, infection or metastasis, which MRI lumbar spine shows best.', null, '[{"point": "Chest X-ray: pneumonia, pneumothorax, heart failure, aortic widening, rib fracture; CTPA: pulmonary embolism (also aortic dissection)", "marks": 2}, {"point": "CT brain: haemorrhage/ stroke (hypertension, diabetes), hypertensive emergency, space-occupying lesion", "marks": 1.5}, {"point": "MRI lumbar spine: disc prolapse with nerve root compression (sciatica), cord/ cauda equina compression, metastasis/ infection", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 6, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

7. What ethical responsibilities do you have for ensuring accurate and timely imaging result for the patient? (5 marks)', 'As a radio-technologist I am responsible for: identifying the right patient and doing the right examination on the right side; making sure the examination is justified and the dose kept as low as reasonably achievable; doing safety checks (pregnancy, contrast allergy, renal function, MRI screening) and watching the patient during the procedure; obtaining informed consent and respecting her dignity, privacy and confidentiality; producing good-quality, correctly labelled images, checking them and repeating if needed so the diagnosis is accurate; prioritising this emergency patient and sending images promptly to PACS, informing the radiologist and emergency physician immediately of critical findings (e.g. pulmonary embolism, haemorrhage); documenting what was done (contrast, dose, incidents); and working within my professional scope, honestly reporting any errors.', null, '[{"point": "Patient safety and welfare: correct patient/ procedure, justification, minimum dose, safety screening, monitoring", "marks": 1.5}, {"point": "Quality/ accuracy: correct technique and protocols, image QC, repeat when needed, correct labelling/ markers", "marks": 1.5}, {"point": "Timeliness and communication: prioritise emergency, inform radiologist/ physician of critical findings; consent, privacy, confidentiality, dignity, respect, documentation, work within scope", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 7, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
You are a Radio-Technologist on duty. The Emergency Physician has referred a patient to your department for various Medical Imaging Services. The patient is a 55 year old female with known history of hypertension and Type-II diabetes. She was brought to the emergency by her relatives for sudden onset of left sided chest pain. Additionally she is having persistent headache and severe backache which is radiating to her right leg. The physician has requested medical imaging tests such as Chest X-ray PA view, CT Brain, CT Pulmonary Angiography and MRI Lumbar spine.

8. What are the radiation safety principles you will follow while doing X-ray and CT of the patient? (5 marks)', '1. Justification: every examination must be clinically indicated with benefit greater than risk; confirm the request with the physician and avoid unnecessary repeats.
2. Optimisation (ALARA): use the lowest dose that gives a diagnostic image - correct kV/mAs, tight collimation, proper filtration, automatic exposure control and CT dose modulation, low-dose and size-specific protocols, limited scan range, correct positioning first time to avoid repeats, and lead shielding of sensitive organs where it does not affect the image.
3. Dose limitation: keep staff and public doses below limits by applying time, distance and shielding - stay behind the control console barrier, keep doors closed, warning lights on, nobody unnecessary in the room, wear personal dosimeters (TLD) and lead aprons when holding is unavoidable.', null, '[{"point": "Justification - each examination indicated, benefit > risk, avoid repeats", "marks": 1.5}, {"point": "Optimisation/ ALARA - correct exposure factors, collimation, filtration, dose modulation, protocols for size, shielding, avoid repeats", "marks": 2}, {"point": "Dose limitation for staff/ public; time, distance, shielding; dosimeters, lead aprons, doors closed, warning lights", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case1', 8, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case II
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

1. When establishing any radiation facility, what general consideration should be given on its location, layout, room size, shielding, doors, warning signs, waiting area and ventilation? (8 marks)', 'Location: on the ground floor or at a corner of the building, away from high-occupancy areas such as wards, maternity and paediatric units, but close to the emergency department and easy for stretchers to reach. Layout: designated controlled areas (X-ray rooms) and supervised areas, with the control console behind a protective barrier, and logical patient flow (reception, waiting, changing, examination, reporting). Room size: large enough for the equipment, the patient on a trolley and staff movement, as required by the regulator - about 18-25 m² for general radiography. Shielding: walls, floor and ceiling shielded (brick, concrete, barium plaster or lead) according to workload, kV, distance and occupancy of adjoining areas, calculated by a qualified expert. Doors: lead-lined doors with the same lead equivalence as the walls, overlapping the frame, preferably with interlocks. Warning signs: radiation trefoil symbol and a warning light/sign ("X-ray on - do not enter") outside each room; notices asking pregnant women to inform staff. Waiting area: outside the controlled area, with seats, changing cubicles and toilets. Ventilation: good ventilation/air-conditioning for heat from equipment and patient comfort, with proper lighting.', null, '[{"point": "Location and layout: away from high-occupancy areas (wards, maternity, children), ground floor/ corner, easy access from emergency; controlled and supervised areas; console behind barrier", "marks": 2}, {"point": "Room size and shielding: large enough for equipment and patient movement (per regulator); walls/ floor/ ceiling shielded (lead/ concrete/ brick) based on workload and occupancy; lead-glass viewing window", "marks": 2}, {"point": "Doors and warning signs: lead-lined doors with interlocks; trefoil radiation sign and warning light outside ''X-ray on''; notice for pregnant women", "marks": 2}, {"point": "Waiting area outside controlled area with seats, toilets, changing cubicles; ventilation/ air-conditioning (equipment heat, contrast reactions), lighting", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 1, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

2. What are the radiation safety principles and elaborate on them? (9 marks)', 'The ICRP system of radiation protection has three principles:
1. Justification - no practice involving radiation should be adopted unless it produces enough benefit to the exposed person or society to offset the harm. For patients, each examination must be clinically indicated (referral guidelines), and alternatives without radiation (ultrasound, MRI) considered.
2. Optimisation (ALARA) - doses should be kept as low as reasonably achievable, social and economic factors being taken into account. This uses time (minimise exposure time), distance (inverse square law), shielding (barriers, aprons), correct exposure factors and collimation, diagnostic reference levels, quality assurance of equipment and staff training.
3. Dose limitation - the total dose to any individual worker or member of the public from regulated practices must not exceed the limits recommended by ICRP and set by the national regulator (e.g. 20 mSv/year for workers, 1 mSv/year for the public). Dose limits do not apply to patients'' medical exposures, which are controlled by justification and optimisation.', null, '[{"point": "Justification: practice/ exposure must do more good than harm, clinically indicated, referral criteria", "marks": 3}, {"point": "Optimisation/ ALARA: keep doses as low as reasonably achievable, social and economic factors; time, distance, shielding; diagnostic reference levels; QA", "marks": 3}, {"point": "Dose limitation: individual doses of workers and public kept below ICRP limits (not applied to patients)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 9,
    972, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 2, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

3. What will be the requirements of room size, wall thickness, console room, viewing window and mobile protective barrier while establishing an X-ray facility? (10 marks)', 'Typical requirements (based on regulatory guidance such as the AERB safety code, used in the region; exact values are set by the national regulator and the shielding calculation):
Room size: about 18-25 m² for a general X-ray room, with no side less than about 4 m, to allow the equipment, trolley access and safe distance; larger rooms for CT and fluoroscopy.
Wall thickness: about 23 cm (9 inch) brick or about 15 cm concrete, equivalent to about 2 mm of lead, up to 2.1 m height; doors lined with about 1.5-2 mm lead overlapping the frame; ceiling/floor shielded if occupied areas lie above or below.
Console room: a separate, shielded control area (or a fixed protective barrier) from which the operator can see the patient and the entrance door; the exposure switch fixed so it can only be used from behind the barrier.
Viewing window: lead glass with lead equivalence equal to the barrier (about 1.5-2 mm Pb), large enough to watch the patient.
Mobile protective barrier: lead-lined screen of about 1.5-2 mm Pb equivalent, about 2 m high and 1 m wide with a lead glass viewing window, on wheels, used where a fixed console barrier is not available (e.g. with mobile units or in theatres).', null, '[{"point": "Room size: adequate for equipment and movement - about 18-25 m² for general radiography with no side less than about 4 m (as per regulator e.g. AERB guidance)", "marks": 2}, {"point": "Wall thickness: about 23 cm (9 inch) brick or 15 cm concrete, or equivalent of about 2 mm lead; doors 1-2 mm lead equivalent; shielding calculated for workload", "marks": 2}, {"point": "Console room/ area: separate shielded control area with operator view of patient and door; exposure switch fixed behind barrier", "marks": 2}, {"point": "Viewing window: lead glass of same lead equivalence (about 1.5-2 mm Pb), good size and height", "marks": 2}, {"point": "Mobile protective barrier: about 1.5-2 mm Pb, about 2 m high and 1 m wide with lead glass window, for mobile/ operator use", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 3, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

4. How does a thermoluminescent dosimeter work? (7 marks)', 'A TLD contains small crystals (chips) of thermoluminescent material such as lithium fluoride doped with magnesium and titanium (LiF:Mg,Ti) or calcium sulphate (CaSO4:Dy), held in a badge with filters. When ionising radiation is absorbed, electrons are raised from the valence band to the conduction band and many are caught in "traps" created by the impurities, where they stay - so the crystal stores energy in proportion to the dose received. At the end of the wearing period (usually monthly or quarterly) the crystal is heated in a TLD reader; the heat frees the trapped electrons, which fall back to their ground state and emit visible light (thermoluminescence). A photomultiplier tube measures this light; the amount of light (the area under the glow curve) is proportional to the radiation dose. The crystal is then annealed (heated) to empty all traps and can be reused. TLDs are small, sensitive, tissue-equivalent (LiF) and reusable, but the reading destroys the stored information and gives only a cumulative dose.', null, '[{"point": "Crystal (e.g. LiF:Mg,Ti or CaSO4:Dy) absorbs radiation; electrons excited to conduction band and trapped in impurity traps - energy stored proportional to dose", "marks": 3}, {"point": "Reading: crystal heated in TLD reader, electrons released, return to ground state emitting light; photomultiplier measures light (glow curve) proportional to dose; annealing for reuse; worn on chest, read periodically (e.g. quarterly)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 4, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
  values ('ME', 'passage', 'Case II
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

5. What are the dose limits for the public and occupational worker? (10 marks)', 'Dose limits (ICRP 103 and IAEA Basic Safety Standards, adopted by national regulators):
Occupational workers: effective dose 20 mSv per year averaged over 5 consecutive years (100 mSv in 5 years), with no more than 50 mSv in any single year; equivalent dose to the lens of the eye 20 mSv per year averaged over 5 years (no more than 50 mSv in a year); skin 500 mSv per year; hands and feet 500 mSv per year. Apprentices and students aged 16-18: 6 mSv per year effective dose. A pregnant worker, once she declares the pregnancy: the dose to the embryo/fetus should not exceed about 1 mSv for the rest of the pregnancy.
Members of the public: effective dose 1 mSv per year; lens of the eye 15 mSv per year; skin 50 mSv per year.
These limits do not include medical exposure of patients or natural background radiation.', null, '[{"point": "Occupational: effective dose 20 mSv/ year averaged over 5 years (100 mSv in 5 y), not more than 50 mSv in any one year", "marks": 3}, {"point": "Occupational equivalent doses: lens of eye 20 mSv/ y (averaged), skin 500 mSv, hands/ feet 500 mSv; pregnant worker - 1 mSv to fetus for rest of pregnancy; apprentices 16-18 y 6 mSv", "marks": 3}, {"point": "Public: effective dose 1 mSv/ year; lens 15 mSv, skin 50 mSv", "marks": 3}, {"point": "Limits exclude medical and natural background exposure; set by ICRP/ IAEA BSS and national regulator", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 5, null, null, (select id from public.specialisations where code = 'radiology'), null)
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
You are working as a Radio-Technologist at JDWNRH. The Ministry of Health has been assigned to look after the planning, purchasing and installation of diagnostic radiographic facilities for a hospital which is going to be built in Gelephu Mindfulness City. The officials from the Ministry of Health consult you regarding the radiation regulations within and outside the country, and with your expertise in the field they want to bring the best and latest diagnostic machines to the city.

6. From the three types of X-ray systems (conventional X-ray machine, Computed Radiography, and Digital Radiography) which one will you choose for the department and why? (6 marks)', 'I would choose Digital Radiography (DR) for the new hospital in Gelephu Mindfulness City. Reasons: DR detectors give the image within seconds, so throughput is high and emergency patients are handled quickly; image quality is better with a wide dynamic range and post-processing (windowing, zoom, measurements), so fewer repeats; the dose to the patient is lower for the same quality; there is no film, chemicals or darkroom, so running cost, waste and environmental pollution are reduced; images go directly to PACS, allowing teleradiology and easy storage and retrieval; and it is future-ready for AI tools. Computed radiography still needs cassettes to be carried and scanned in a reader (slower, more handling, slightly higher dose), and conventional film-screen systems need films, processing chemicals and darkrooms, with more repeats and storage problems. Although DR costs more initially, it is the best long-term choice for a modern hospital.', null, '[{"point": "Choice: Digital Radiography (DR) for a new modern hospital", "marks": 1}, {"point": "Reasons: instant image, high throughput, better image quality/ wide dynamic range, lower dose, no films/ chemicals/ darkroom, post-processing, direct PACS/ teleradiology, less storage, environmental; compare CR (cassette handling, slower) and conventional (film, chemicals, repeats)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Radiology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-radio2024-case2', 6, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The anode heel effect results in a higher X-ray intensity on the:', null, 'X-rays leaving towards the anode side are absorbed more by the anode''s own heel, so the cathode side is more intense - place the thicker part of the body towards the cathode.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Both sides equally', false, 1), ('B', 'Cathode side of the beam', true, 2), ('C', 'Centre of the beam only', false, 3), ('D', 'Anode side of the beam', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which personal dosimeter is read by heating its crystal so that stored energy is released as light?', null, 'A TLD (e.g. lithium fluoride) stores energy in trapped electrons and gives out light in proportion to dose when heated.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thermoluminescent dosimeter (TLD)', true, 1), ('B', 'Geiger-Muller counter', false, 2), ('C', 'Film badge', false, 3), ('D', 'Pocket ionisation chamber', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an absolute contraindication to MRI?', null, 'A pacemaker not labelled MR-conditional may malfunction, heat or move in the magnet; the others are generally MRI-safe.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'radiology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Radiology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'radiology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A plaster cast', false, 1), ('B', 'Non-MRI-conditional cardiac pacemaker', true, 2), ('C', 'Dental amalgam fillings', false, 3), ('D', 'Titanium hip replacement', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
