-- ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'survey-engineering', 'Survey Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'survey-engineering') is null then raise exception 'unknown specialisation survey-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'One degree of latitude is approximately ….. kilometers.', null, 'One degree of latitude is about 111 km (the meridian arc is nearly constant).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '333', false, 1), ('B', '111', true, 2), ('C', '222', false, 3), ('D', '444', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The distance value of one degree of longitude varies depending on the latitude. The distance decreases as you move towards the poles, following the…….', null, 'Length of 1° of longitude ≈ 111.32 km x cos(latitude), so it shrinks towards the poles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cosine of the latitude', true, 1), ('B', 'Cosine of the longitude', false, 2), ('C', 'Sine of the latitude', false, 3), ('D', 'Sine of the longitude', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In RTK surveying, what is the significance of ambiguity resolution?', null, 'Ambiguity resolution finds the unknown integer number of carrier wavelengths between satellite and receiver, giving centimetre accuracy (a ''fixed'' solution).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It resolves the integer number of wavelengths between the satellite and receiver.', true, 1), ('B', 'It calculates the initial position of the rover.', false, 2), ('C', 'It corrects for clock errors in the GPS system.', false, 3), ('D', 'It determines the base station location.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why is a dual-frequency receiver preferred over a single-frequency receiver in RTK surveying?', null, 'Two frequencies let the receiver estimate and remove the ionospheric delay, and help faster, more reliable ambiguity fixing.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is less expensive.', false, 1), ('B', 'It can mitigate ionospheric errors more effectively.', true, 2), ('C', 'It provides faster processing speeds', false, 3), ('D', 'It requires fewer satellites for a fix.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which statement is true regarding the L5 GPS frequency (1176.45 MHz)?', null, 'L5 was added in GPS modernisation (first on Block IIF satellites, 2010) for safety-of-life and high-precision use.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is the primary frequency used by civilian GPS devices.', false, 1), ('B', 'It has been in use since the inception of GPS.', false, 2), ('C', 'It is primarily used for nuclear detonation detection.', false, 3), ('D', 'It was introduced as part of the GPS modernization effort for high-precision and safety-of- life applications.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary difference between GPS and GNSS?', null, 'GNSS is the general term for all satellite navigation systems (GPS, GLONASS, Galileo, BeiDou ...); GPS is one of them.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'GPS is a global system, while GNSS is a regional system.', false, 1), ('B', 'GNSS is more accurate than GPS.', false, 2), ('C', 'GNSS includes multiple satellite systems, while GPS is one specific system.', true, 3), ('D', 'GPS is used for navigation, while GNSS is used for surveying.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does the term "multipath" refer to in GPS surveying?', null, 'Multipath is the error from signals reflected by buildings, water or ground before reaching the antenna.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Using multiple satellites for positioning', false, 1), ('B', 'Using multiple receivers to improve accuracy', false, 2), ('C', 'Interference from multiple GPS signals', false, 3), ('D', 'Errors caused by GPS signals reflecting off surfaces before reaching the receiver', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Datum transformation require transformation parameters that define the mathematical relationship between the old and new datums. What are the transformation parameters?', null, 'A 7-parameter (Helmert) transformation uses three translations, three rotations and one scale factor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Translations', false, 1), ('B', 'All above', true, 2), ('C', 'Scale factor', false, 3), ('D', 'Rotations', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the value of latitude of origin for the National Grid projection of Bhutan ‘DrukRef 03’?', null, 'Bhutan''s national grid (DrukRef 03, Transverse Mercator) uses the equator, 0°, as latitude of origin.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '360°', false, 1), ('B', '0°', true, 2), ('C', '180°', false, 3), ('D', '90°', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a map of 1:5000, what is the plottable error of the map?', null, 'Plottable error ≈ 0.25 mm x 5000 = 1.25 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3.5 m', false, 1), ('B', '4 m', false, 2), ('C', '1.25 m', true, 3), ('D', '2 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The total station machine has the horizontal accuracy specification as 2 mm + 2 ppm. What would be the maximum potential error when the horizontal distance measured is 5 km?', null, '2 mm + 2 ppm x 5 km = 2 mm + 10 mm = ±12 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '±12 mm', true, 1), ('B', '±10 mm', false, 2), ('C', '±11 mm', false, 3), ('D', '±13 mm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The precision total station machine has the horizontal accuracy specification as 1 mm + 1 ppm. What is distance dependent error when horizontal distance measured is 5 km?', null, 'Distance-dependent part only: 1 ppm x 5 km = 5 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '±1.5 mm', false, 1), ('B', '±3 mm', false, 2), ('C', '±5 mm', true, 3), ('D', '±1 mm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In surveying, which method involves determining the location of a point by measuring distances from known points rather than angles?', null, 'Trilateration fixes points from measured distances (sides) of triangles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Refracting', false, 1), ('B', 'Rectification', false, 2), ('C', 'Triangulation', false, 3), ('D', 'Trilateration', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In GPS, which Dilution of Precision (DOP) represents the geometric quality of the satellite constellation specifically in determining the horizontal position (latitude and longitude)?', null, 'HDOP is the dilution of precision for the horizontal position.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'VDOP', false, 1), ('B', 'PDOP', false, 2), ('C', 'HDOP', true, 3), ('D', 'TDOP', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the key difference between triangulation and trilateration in surveying?', null, 'Triangulation measures angles from known points; trilateration measures distances.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Triangulation uses angle measurements from known points, while trilateration uses distance measurements.', true, 1), ('B', 'Triangulation forms circles from known points, while trilateration forms triangles.', false, 2), ('C', 'Triangulation is used only in 2D surveying, while trilateration is used only in 3D surveying.', false, 3), ('D', 'Triangulation uses distance measurements from known points, while trilateration uses angle measurements.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which method is commonly used to minimize random errors in surveying?', null, 'Random errors are reduced by repeating measurements and taking the mean.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Adjusting data based on known error patterns', false, 1), ('B', 'Calibrating instruments before each use', false, 2), ('C', 'Repeating measurements multiple times', true, 3), ('D', 'Using more advanced equipment', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of a "closing error" adjustment in a traverse?', null, 'Angular closing error is adjusted so the sum of the angles of the closed polygon equals its theoretical value, (n-2) x 180° for interior angles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To compensate for angular errors only', false, 1), ('B', 'To calibrate the surveying instruments', false, 2), ('C', 'To ensure the sum of angles in a polygon equals the theoretical value', true, 3), ('D', 'To determine the accurate lengths of traverse lines', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the process of aligning geographic data to a known coordinate system called?', null, 'Georeferencing assigns map coordinates to data (e.g. a scanned map or image) in a known coordinate system.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Remote Sensing', false, 1), ('B', 'Spatial analysis', false, 2), ('C', 'Geocoding', false, 3), ('D', 'Georeferencing', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does high precision in measurements indicate?', null, 'Precision means repeated measurements agree closely with each other (not necessarily with the true value).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measurements are taken quickly', false, 1), ('B', 'Measurements are consistently close to each other', true, 2), ('C', 'Measurements are always accurate', false, 3), ('D', 'Measurements are spread out over a large range', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main function of a theodolite?', null, 'A theodolite measures horizontal and vertical angles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measuring vertical distances', false, 1), ('B', 'Measuring time intervals', false, 2), ('C', 'Measuring atmospheric pressure', false, 3), ('D', 'Measuring horizontal and vertical angles', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How does NTRIP enhance GNSS-RTK performance?', null, 'NTRIP streams corrections over the internet (mobile data), so the rover is not limited by radio range.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By providing real-time correction data via the internet, extending the range beyond traditional radio communication', true, 1), ('B', 'By reducing the need for a base station', false, 2), ('C', 'By eliminating the need for satellite signals', false, 3), ('D', 'By increasing the battery life of GNSS receivers', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which frequency band is commonly used for radio communication in GNSS-RTK?', null, 'RTK radio modems usually work in the UHF band (about 400-470 MHz).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'VHF (Very High Frequency)', false, 1), ('B', 'SHF (Super High Frequency)', false, 2), ('C', 'UHF (Ultra High Frequency)', true, 3), ('D', 'EHF (Extremely High Frequency)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary principle behind Electronic Distance Measurement (EDM) in total stations?', null, 'EDM measures the travel time or phase shift of an electromagnetic (infrared/laser) signal to the reflector.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Determination of positions using satellite signals', false, 1), ('B', 'Calculation of distances based on the travel time of electromagnetic waves', true, 2), ('C', 'Measurement of elevations using laser beams', false, 3), ('D', 'Measurement of angles using optical instruments', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is a common source of error in EDM measurements?', null, 'Temperature, pressure and humidity change the speed of the wave, so an atmospheric correction (ppm) is applied.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Magnetic declination', false, 1), ('B', 'Inaccurate angle measurement', false, 2), ('C', 'Incorrect calibration of the optical scope', false, 3), ('D', 'Atmospheric conditions affecting wave propagation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How does EDM in a total station typically deal with the curvature of the Earth?', null, 'The total station applies earth-curvature (and refraction) corrections to long distances and heights.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By applying a curvature correction factor to the measured distance', true, 1), ('B', 'By aligning the total station with the Earth''s magnetic field', false, 2), ('C', 'By measuring only very short distances', false, 3), ('D', 'By using high-frequency waves that are unaffected by curvature', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The unique identifier or primary key that is used to link cadastral data to Thram data is', null, 'The unique Plot ID links each cadastral parcel to its Thram (land record).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plot area', false, 1), ('B', 'Plot ID', true, 2), ('C', 'CID', false, 3), ('D', 'Thram number', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the relationship between satellite image resolution and the scale of mapping. How would you choose the appropriate resolution for a mapping project focused on urban planning at a scale of 1:10,000? Justify your choice with examples. (4 marks; 5 marks in the 2024 paper)', 'Image resolution (ground sample distance, GSD) decides the smallest feature that can be seen and mapped, so it limits the largest scale that can be mapped: the finer the resolution, the larger the possible scale. A common rule is that the pixel size should be about 0.1-0.2 mm at map scale, or that achievable map accuracy is about 2-3 times the GSD. For an urban-planning map at 1:10 000 the plottable error is 0.25 mm x 10 000 = 2.5 m, so imagery of about 0.5-1 m resolution is appropriate: it shows individual buildings, roads, footpaths, drains and plot boundaries clearly, e.g. Pleiades (0.5 m), WorldView-3 (0.3 m) or aerial/drone orthophotos. Coarser imagery such as Sentinel-2 (10 m) or Landsat (30 m) suits only regional land-cover mapping, while very fine imagery (5-10 cm drone) is more costly than needed at this scale. The choice also considers cost, recent acquisition date, cloud cover, stereo availability for heights, and ground control for accurate georeferencing.', null, '[{"point": "Relationship: finer ground resolution (GSD) supports larger map scale; rule of thumb pixel ≈ 0.1-0.2 mm at map scale (or map accuracy ≈ 2-3 x GSD); detail visible depends on resolution", "marks": 2}, {"point": "1:10 000: 0.25 mm x 10 000 = 2.5 m plottable; choose about 0.5-1 m imagery (e.g. Pleiades 0.5 m, WorldView 0.3-0.5 m) to identify buildings, roads, plots; coarser (Sentinel-2 10 m) only for land cover; consider cost, cloud, date, stereo for heights", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'During a detailed topographic survey with a drone, you need to determine the flying height for capturing images with a resolution of 10 cm per pixel. The camera has a pixel size of 5.6 micrometres (0.0056 cm) and a focal length of 18 mm (1.8 cm). Explain the steps and find the flying height. (4 marks; 5 marks in the 2024 paper)', 'Ground sample distance (GSD) relates to flying height by similar triangles: GSD / pixel size = H / f, so H = GSD x f / pixel size. Steps: (1) write the required GSD, pixel size and focal length in the same units (10 cm, 0.0056 cm, 1.8 cm); (2) substitute: H = 10 x 1.8 / 0.0056 = 3214.3 cm; (3) convert: H ≈ 32.1 m above the ground. The drone should fly about 32 m above ground level (with terrain following in hilly areas, since height above ground changes with the terrain), with about 70-80% forward and 60-70% side overlap and ground control points for accuracy.', null, '[{"point": "GSD = pixel size x H / f, so H = GSD x f / pixel size; use consistent units", "marks": 2}, {"point": "H = 10 cm x 1.8 cm / 0.0056 cm = 3214 cm ≈ 32.1 m above ground; plan above-ground height, overlap, terrain", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In a GNSS-based survey you must determine precise coordinates using Differential GPS (DGPS). Describe the process of DGPS and its advantages over standard GPS. The base station coordinates are known (X: 500,000 m, Y: 300,000 m, Z: 200,000 m) and the rover receives correction values from the base station (ΔX: -2.5 m, ΔY: 3.0 m, ΔZ: -1.5 m). Calculate the corrected coordinates for the rover. (4 marks; 5 marks in the 2024 paper)', 'In DGPS a base receiver is set up on a point with known coordinates and tracks the same satellites as the rover at the same time. The difference between its known position and the position it computes (or between true and measured ranges) gives corrections for errors common to both receivers: satellite orbit and clock errors and ionospheric and tropospheric delays. The corrections are sent to the rover by radio or internet (NTRIP) in real time, or applied later by post-processing, and the rover applies them to its own observations. Advantages over standalone GPS: accuracy improves from several metres to sub-metre (code DGPS) or centimetres (carrier-phase RTK), reliably and in real time. Calculation (the question gives only the corrections, so they are applied to the given coordinates): X = 500 000 + (-2.5) = 499 997.5 m; Y = 300 000 + 3.0 = 300 003.0 m; Z = 200 000 + (-1.5) = 199 998.5 m.', null, '[{"point": "Process: base on known point compares known and computed positions, sends corrections (radio/ NTRIP) or post-processing; rover applies; common errors cancel", "marks": 1.5}, {"point": "Advantages: removes satellite clock/orbit and atmospheric errors, metre to sub-metre/cm accuracy, real time", "marks": 1}, {"point": "Calculation (applying the corrections to the given coordinates): X = 499 997.5 m, Y = 300 003.0 m, Z = 199 998.5 m", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'You are conducting a topographic survey using a total station. Describe the process of measuring distances and angles with a total station and explain how to correct the measured slope distance to a horizontal distance. The measured slope distance is 500 m, the vertical angle is 5° and the instrument and target heights are equal. Calculate the horizontal distance. (4 marks; 5 marks in the 2024 paper)', 'Process: the total station is set up over the station point, centred (optical/laser plummet) and levelled; instrument and target (prism) heights, prism constant and atmospheric correction (temperature, pressure) are entered; it is oriented by sighting a backsight point of known coordinates. For each target, the EDM measures the slope distance by the phase shift or travel time of an infrared/laser signal, and the electronic encoders read the horizontal and vertical (or zenith) angles; the instrument stores the readings and can compute coordinates and heights. Slope to horizontal: the horizontal distance is the slope distance times the cosine of the vertical angle (or the sine of the zenith angle): HD = SD cos α. Because the instrument and target heights are equal, no height correction is needed. HD = 500 x cos 5° = 500 x 0.99619 = 498.10 m (vertical difference = 500 sin 5° = 43.58 m).', null, '[{"point": "Process: set up, centre and level over station, orient/ backsight to known point, set heights, prism constant, atmospheric ppm; EDM measures slope distance, encoders measure horizontal and vertical angles; record/ compute coordinates", "marks": 2}, {"point": "Correction: HD = SD x cos(vertical angle) (or SD x sin(zenith angle)); HD = 500 x cos 5° = 498.10 m; equal heights so no height correction", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain what differential levelling is and how it is carried out, and how instrument and target heights are handled. A backsight (BS) on a benchmark of known elevation 100 m reads 2.50 m and the foresight (FS) on the new point reads 1.75 m. Calculate the elevation of the new point. (4 marks; 5 marks in the 2024 paper)', 'Differential levelling determines the difference in elevation between two or more points using a level and a levelling staff. The level gives a horizontal line of sight. A backsight is taken on a point of known elevation (benchmark) to find the height of instrument (HI = RL of BM + BS), and a foresight on the new point gives its reduced level (RL = HI - FS). Over long distances or steep ground, change points are used and the process repeated, with the line closed back on a known benchmark to check. Keeping backsight and foresight distances equal cancels collimation, curvature and refraction errors; the staff must be vertical and the instrument height itself does not appear, because the height of instrument is found from the benchmark. Calculation: HI = 100.00 + 2.50 = 102.50 m; elevation of new point = 102.50 - 1.75 = 100.75 m (a rise of 0.75 m).', null, '[{"point": "Differential levelling: finds height difference between points with a level and staff; BS on known point, FS on unknown; line of collimation horizontal; change points for long distances; equal BS/FS distances cancel collimation and curvature errors", "marks": 2}, {"point": "HI = 100 + 2.50 = 102.50 m; RL = 102.50 - 1.75 = 100.75 m (rise 0.75 m)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain what a scale factor is and its significance in surveying. Describe how a grid distance is converted to a ground distance and explain geoid separation. Given: grid distance 1200 m, scale factor 0.9996, geoid separation -25 m. Calculate the true ground distance and explain the height difference due to geoid separation. (4 marks; 5 marks in the 2024 paper)', 'A scale factor is the ratio of a distance on the map projection (grid) to the corresponding distance on the ellipsoid; multiplied by the elevation factor it gives the combined scale factor relating grid and ground distances. It matters because GNSS and maps work in grid coordinates while tapes and total stations measure ground distances, so ignoring it causes errors of centimetres to decimetres per kilometre in setting out. Grid to ground: ground distance = grid distance / scale factor (ideally the combined scale factor). Here: 1200 / 0.9996 = 1200.48 m, i.e. the ground distance is 0.48 m longer than the grid distance. Geoid separation (undulation) N is the height of the geoid above the ellipsoid; orthometric (mean sea level) height H = ellipsoidal height h - N. With N = -25 m the geoid lies 25 m below the ellipsoid, so H = h + 25 m: heights above sea level are 25 m greater than the GNSS ellipsoidal heights at this point.', null, '[{"point": "Scale factor: ratio of grid (projection) distance to ellipsoid distance; combined with elevation factor (CSF); needed so total station and GNSS/ map distances agree", "marks": 1.5}, {"point": "Ground = grid / scale factor = 1200 / 0.9996 = 1200.48 m", "marks": 1}, {"point": "Geoid separation N = height of geoid above ellipsoid; H = h - N; N = -25 m: orthometric heights are 25 m greater than ellipsoidal heights at this point", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: A high-precision geodetic network for a new urban centre
You lead a geodetic team establishing a high-precision geodetic network for a new urban centre that will develop rapidly. It must support new transport routes, utility installations and high-rise buildings. Requirements:
- A geodetic control network with horizontal accuracy of ±2 cm and vertical accuracy of ±1 cm.
- The network must cover 20 square kilometres.
- Integration with existing national geodetic frameworks.
- The project must be completed within 10 months.

1. Which surveying methods, techniques and instruments will you use to achieve the required accuracy? (8 marks)', 'Network design: about 15-25 permanent monuments (concrete pillars with forced-centring plates or deep-set marks) spread over the 20 km², on stable ground away from planned construction, with intervisible pairs for total-station users and good sky view for GNSS, forming well-shaped figures with redundant observations. Horizontal control (±2 cm): static GNSS with dual/multi-frequency geodetic receivers, observing sessions of 2-6 hours, at least two independent occupations per station, connected to nearby national CORS/control; processed with precise orbits, fixed ambiguities and a minimally-constrained then constrained least-squares network adjustment, with error ellipses checked. Lower-order points densified by total-station traverses (1" instruments, forced centring). Vertical control (±1 cm): GNSS heights are not accurate enough, so precise (first-order) levelling with digital levels and invar bar-coded staffs from national benchmarks, double-run (forward and back) with closure limits such as 4√K mm (K in km); GNSS/geoid heights used only as an independent check. Calibration of all instruments before field work.', null, '[{"point": "Network design: primary monuments (e.g. 15-25 forced-centring pillars/ deep monuments) well distributed, intervisible pairs, stable ground, redundancy", "marks": 2}, {"point": "Horizontal: static GNSS (dual-frequency geodetic receivers, long sessions 2-6 h, multiple sessions, CORS ties), processed with precise ephemerides, least-squares adjustment; total station densification", "marks": 3}, {"point": "Vertical ±1 cm: precise (first-order) digital levelling with invar staffs from national benchmarks, double-run, closure limits (e.g. 4√K mm); GNSS heights with geoid only as check", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case1', 1, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: A high-precision geodetic network for a new urban centre
You lead a geodetic team establishing a high-precision geodetic network for a new urban centre that will develop rapidly. It must support new transport routes, utility installations and high-rise buildings. Requirements:
- A geodetic control network with horizontal accuracy of ±2 cm and vertical accuracy of ±1 cm.
- The network must cover 20 square kilometres.
- Integration with existing national geodetic frameworks.
- The project must be completed within 10 months.

2. How will you integrate the new network with the existing national geodetic framework? (5 marks)', 'The network will be tied to the national framework maintained by NLCS: GNSS sessions will include the nearest CORS and at least three or four existing national control points, whose stability will first be checked. The adjustment will be done in the national datum (DrukRef03, ITRF-based, at its reference epoch), so coordinates are compatible; if the existing local survey works use another datum, transformation parameters (7-parameter or grid-based) will be computed and published. Coordinates will be given on the national grid (with combined scale factors for local users), and heights on the national vertical datum by levelling from national benchmarks, with geoid separations recorded. All station descriptions, sketches, photographs, coordinates and accuracy reports will be documented and submitted to NLCS for approval and inclusion in the national geodetic database, so that all agencies and contractors use the same control.', null, '[{"point": "Connect to national CORS and DrukRef03 control/ benchmarks; observe ties to several existing points; check their stability", "marks": 2}, {"point": "Adjust in national datum (DrukRef03/ ITRF epoch), compute transformation parameters if needed, national grid coordinates and scale factors; heights to national vertical datum/ geoid", "marks": 2}, {"point": "Metadata, documentation, submit to NLCS for approval and inclusion in national database", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case1', 2, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
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
  values ('ME', 'passage', 'Case: A high-precision geodetic network for a new urban centre
You lead a geodetic team establishing a high-precision geodetic network for a new urban centre that will develop rapidly. It must support new transport routes, utility installations and high-rise buildings. Requirements:
- A geodetic control network with horizontal accuracy of ±2 cm and vertical accuracy of ±1 cm.
- The network must cover 20 square kilometres.
- Integration with existing national geodetic frameworks.
- The project must be completed within 10 months.

3. Give the project timeline and management plan for the 10 months. (6 marks)', 'Timeline: Month 1 - planning, reconnaissance, network design, permissions, procurement and instrument calibration. Months 2-3 - construction of monuments and allowing them to settle. Months 4-6 - static GNSS campaigns and precise levelling (before the monsoon where possible). Months 7-8 - data processing, least-squares adjustment, quality control and any re-observation. Month 9 - computation of final coordinates, scale factors, documentation and geodatabase. Month 10 - handover, user training and final report. Management: a project manager with a geodetic engineer, GNSS team, levelling team, data processing and GIS staff; a budget for staff, equipment, vehicles and monuments; coordination with NLCS, the city development authority and land owners; a Gantt chart with milestones, weekly progress reports and a risk register; and quality checkpoints at the end of each phase.', null, '[{"point": "Phased timeline: month 1 planning, reconnaissance, design, procurement; months 2-3 monumentation; months 4-6 GNSS and levelling observations; months 7-8 processing, adjustment, QC; month 9 documentation, database; month 10 handover, training", "marks": 3}, {"point": "Management: team structure, roles, budget, equipment, coordination with city authority/ NLCS, progress monitoring (Gantt, milestones), risk register, reporting", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case1', 3, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: A high-precision geodetic network for a new urban centre
You lead a geodetic team establishing a high-precision geodetic network for a new urban centre that will develop rapidly. It must support new transport routes, utility installations and high-rise buildings. Requirements:
- A geodetic control network with horizontal accuracy of ±2 cm and vertical accuracy of ±1 cm.
- The network must cover 20 square kilometres.
- Integration with existing national geodetic frameworks.
- The project must be completed within 10 months.

4. What challenges do you expect and how will you mitigate them? (6 marks)', 'Challenges: monsoon rain and cloud delaying field work; rugged terrain and limited access; trees, buildings and slopes causing GNSS obstruction and multipath; monuments being destroyed or disturbed by the rapid construction; ionospheric activity; equipment failure; staff shortage; and land-owner objections. Mitigation: schedule observations in the dry season with buffer time; choose open, stable, protected sites (public land, away from construction corridors) with reference marks and protective covers; observe longer and repeated GNSS sessions with redundancy and good DOP; keep spare receivers and batteries; coordinate with developers and the city authority so marks are protected, with legal notices; train staff and use clear procedures; and keep a quality-control and re-observation plan so any weak station is re-measured before handover.', null, '[{"point": "Challenges: weather/ monsoon, terrain/ access, obstructions and multipath, monument disturbance by construction, ionosphere, equipment failure, staff, land access", "marks": 3}, {"point": "Mitigation: schedule dry season, site selection and protection, redundancy, longer sessions, spare equipment, coordination with developers, documentation and re-observation plan, community awareness", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case1', 4, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical.

1. Outline efficient methods and techniques for acquiring and processing the road data. (7 marks)', 'The most efficient method for 12 000 km in six months is a vehicle-mounted mobile mapping system: LiDAR scanners and 360° cameras with dual-frequency GNSS and an inertial unit (IMU), driven along the roads, collecting point clouds and imagery at traffic speed. Trajectories are processed against the national CORS network and checked with surveyed ground control points every few kilometres, which gives about 5-10 cm horizontal and better than 1 m vertical accuracy. Sections that vehicles cannot drive (farm roads, washed-out roads) are mapped by drone photogrammetry or LiDAR, or digitised from recent high-resolution satellite imagery with RTK checks. Processing: GNSS/IMU trajectory adjustment, point-cloud classification, automatic and manual extraction of the centreline, edges, width, bridges, culverts and retaining walls, and attributing each segment (surface material, class, ownership, name, location). Several teams (e.g. one per region) work in parallel, scheduled around the monsoon.', null, '[{"point": "Mobile mapping system (vehicle-mounted LiDAR + cameras + GNSS/IMU) on motorable roads; achieves cm-level horizontal accuracy with GNSS/CORS and control points", "marks": 3}, {"point": "Supplement: drone photogrammetry/ LiDAR for difficult sections, high-resolution satellite imagery for farm roads, GNSS-RTK for checks; processing: trajectory with CORS, point-cloud classification, feature extraction (centreline, edges, bridges), attributes", "marks": 3}, {"point": "Plan teams by region and season to cover 12,000 km in 6 months", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case2', 1, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical.

2. Describe the quality control and checks you will use to ensure accuracy and reliability. (5 marks)', 'Positional checks: independent check points surveyed by GNSS-RTK along each route (not used in processing); root-mean-square errors computed and compared with the 10 cm horizontal and 1 m vertical requirements; repeated runs and overlapping sections compared; and GNSS/IMU trajectory quality reports reviewed so weak segments (tunnels, forest) are re-driven or controlled. Data checks: topology rules (roads connected at junctions, no gaps, overlaps or dangles), attribute completeness and allowed values (domains for road class and surface), naming and coding standards, a second operator reviewing a sample of each block, and field verification of a random sample. All checks are recorded in quality reports and metadata, and data are accepted only when they pass.', null, '[{"point": "Accuracy checks: independent GNSS-RTK check points along routes, RMSE vs 10 cm/ 1 m spec, overlap/ repeat runs comparison, trajectory quality reports", "marks": 2}, {"point": "Data checks: topology (connectivity, no gaps/ overlaps), attribute completeness and validity (domains), standards, review by second operator, field verification sample, documentation/ metadata", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case2', 2, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
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
  values ('ME', 'passage', 'Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical.

3. Explain how you will build a reliable geodatabase to store and manage the road network. (5 marks)', 'A national road data model will be agreed with the Department of Surface Transport and NLCS: feature classes for road centrelines, edges, bridges, culverts, tunnels and junctions; attributes such as unique road ID, name, class (national highway, dzongkhag, thromde, farm road), surface material, width, number of lanes, ownership, condition and date; domains and subtypes to keep values consistent; and linear referencing (chainage) so events like landslides or repairs can be located. Data will be stored in an enterprise geodatabase (e.g. PostgreSQL/PostGIS or ArcGIS Enterprise) in the national datum and grid, with topology rules, metadata to national standards, versioning and edit tracking, user access rights, regular backups, and web map/feature services so agencies can view and use the data.', null, '[{"point": "Data model/ schema: feature classes (centreline, edges, bridges, culverts, junctions), attributes and domains, unique road IDs, linear referencing (chainage), national datum/ grid", "marks": 3}, {"point": "Platform: enterprise geodatabase (e.g. PostGIS/ ArcGIS), topology rules, metadata standards, versioning, access rights, backups, web services", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case2', 3, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
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
  values ('ME', 'passage', 'Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical.

4. How will you integrate and use existing road data to enhance the project? (4 marks)', 'Existing data - the road inventory of the Department of Surface Transport, NLCS topographic maps and databases, dzongkhag and thromde road layers, OpenStreetMap and recent imagery - will be collected and assessed for accuracy, currency and coverage. They will be used to plan survey routes and team logistics, to supply attributes that mobile mapping cannot capture (official road names, classes, ownership, construction year), and to fill gaps for roads that cannot be surveyed in time. Their geometry will be replaced by, or conflated with, the new accurate survey, keeping existing road IDs where possible so other systems still link, and avoiding duplicate features.', null, '[{"point": "Collect existing data (DoST road inventory, NLCS topographic maps, OpenStreetMap, dzongkhag data, imagery), assess quality and coverage", "marks": 2}, {"point": "Use for planning routes, attributes (names, class), gap filling; conflate/ update with new accurate geometry; keep IDs; avoid duplication", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case2', 4, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case: National road infrastructure mapping
Accurate and up-to-date road network data is essential for transport planning, disaster management and suitability analysis, and Bhutan lacks precise, current spatial road data. As a surveying professional, you must prepare a project proposal to map roads across the whole country:
- Area of interest: whole country.
- Estimated road length: 12,000 km.
- Road categories based on material, use and location.
- Timeline: 6 months.
- Required accuracy: 10 cm horizontal and 1 m vertical.

5. Provide a framework for the long-term maintenance and updating of the road network data. (4 marks)', 'A custodian (for example the Department of Surface Transport with NLCS) will be named, with a data-sharing policy under the national spatial data infrastructure. Every new or upgraded road will have to submit as-built survey data in the agreed format before completion certificates are issued, and the database will be updated continuously from these, with periodic checks from new satellite imagery or repeat mobile mapping (e.g. every 3-5 years). Staff will be trained, a recurrent budget provided, standards and versioning maintained, users given a channel to report errors, and the data published on the national geoportal so it stays used and therefore maintained.', null, '[{"point": "Custodian agency and data-sharing policy; update procedures: new road construction submitted as-built surveys in standard format; periodic imagery/ mobile mapping updates", "marks": 2}, {"point": "Capacity building, budget, standards, version control, feedback from users, integration with national SDI/ geoportal", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Survey Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2024-case2', 5, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A geoid model is used in GNSS heighting mainly to', null, 'GNSS gives ellipsoidal height h; orthometric height H = h - N, where N (geoid undulation) comes from the geoid model.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Convert ellipsoidal heights to orthometric (mean sea level) heights', true, 1), ('B', 'Calculate the scale factor of the projection', false, 2), ('C', 'Remove multipath errors', false, 3), ('D', 'Convert latitude to longitude', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
