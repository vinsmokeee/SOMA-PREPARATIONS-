-- ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'meteorology-and-climate-studies', 'Meteorology and Climate Studies' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'meteorology-hydrology') is null then raise exception 'unknown specialisation meteorology-hydrology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'meteorology-hydrology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'meteorology-hydrology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'meteorology-hydrology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'meteorology-hydrology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary driving force of the Hadley cell', null, 'The Hadley cell is driven by the temperature difference (differential heating) between the warm equator and cooler higher latitudes: warm air rises at the equator and sinks near 30°.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Air pressure variation across latitudes', false, 1), ('B', 'Temperature difference between the equator and poles', true, 2), ('C', 'Coriolis effect', false, 3), ('D', 'Rotation of the Earth', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Adjacent land and water is heated by the sun on a calm day, after a few hours a surface wind develops. What is the direction of the winds?', null, 'On a sunny calm day the land heats faster, air rises over it and cooler air flows from water to land (sea breeze).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Parallel to the land and water', false, 1), ('B', 'Land to water', false, 2), ('C', 'Water to land', true, 3), ('D', 'Vertically from water to air', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ozone layer is found in:', null, 'The ozone layer lies in the stratosphere (about 15-35 km).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Troposphere', false, 1), ('B', 'Thermosphere', false, 2), ('C', 'Mesosphere', false, 3), ('D', 'Stratosphere', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The approximate density of air at 15o C is:', null, 'Standard sea-level air density at 15 °C is 1.225 kg/m³.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0 g/cm3', false, 1), ('B', '1.225 kg/m3', true, 2), ('C', '1000kg/m3', false, 3), ('D', '1 g/cm3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What amount of rainfall can you expect in Bhutan during El Nino year?', null, 'El Niño years usually weaken the South Asian monsoon, so Bhutan tends to be drier than normal.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Drier than normal', true, 1), ('B', 'Wetter than normal', false, 2), ('C', 'United Nations Convention to Combat Desertification', false, 3), ('D', 'Normal rainfall', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Butterfly Effect can be defined as:', null, 'The butterfly effect: a small change in initial conditions can lead to very different outcomes (chaos theory).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Feedback loop in climate change', false, 1), ('B', 'Small change in starting conditions can lead to vastly different outcomes', true, 2), ('C', 'Study of impact of butterflies', false, 3), ('D', 'Outcomes are independent of the changes in the starting conditions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The formula for volume of a cylinder with given radius (r) and height (h):', null, 'Volume of a cylinder = πr²h.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', '2 π r2 h', false, 2), ('C', 'π r2 h', true, 3), ('D', 'π r h', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'By 2023, the global average temperature has warmed above the pre-industrial level by:', null, 'By 2023 the world had warmed about 1.1-1.45 °C above pre-industrial levels - more than 1 °C (but the long-term average is not yet above 1.5 °C).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.5 ° C', false, 1), ('B', 'More than 1° C', true, 2), ('C', 'More than 1.5 ° C', false, 3), ('D', 'Less than 0.8 ° C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Windward side of a mountain have a wet climate due to:', null, 'Rising air expands and cools adiabatically; water vapour condenses, giving cloud and rain on the windward side.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rising air compresses and warms, causing evaporation of water vapour', false, 1), ('B', 'Rising air compresses and cools, causing condensation of water vapour', false, 2), ('C', 'Rising air expands and cools, causing condensation of water vapour', true, 3), ('D', 'Rising air expands and warms, causing condensation of water vapour', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '1 litre of water is equivalent to:', null, '1 litre of water = 1000 cm³ and has a mass of about 1 kg.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 kg', false, 1), ('B', 'None of the above', false, 2), ('C', 'Both (a) and (b)', true, 3), ('D', '1000 cm3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is true about dew point?', null, 'Dew point is the temperature to which air must be cooled at constant pressure (and moisture) to become saturated (100% RH).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Temperature when dew is formed', false, 1), ('B', 'Temperature of air at constant pressure when air is dry', false, 2), ('C', 'Temperature of water when relative humidity is 100%', false, 3), ('D', 'Temperature of air at constant pressure to achieve 100% relative humidity', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which weather is likely indicated by rapidly falling air pressure?', null, 'Rapidly falling pressure indicates an approaching low-pressure system or storm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Storm approaching', true, 1), ('B', 'Skies are clearing', false, 2), ('C', 'Temperature is decreasing', false, 3), ('D', 'Humidity is decreasing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Convert 100 ° F (Fahrenheit) to ° C (Celsius)', null, '°C = (100 - 32) x 5/9 = 37.8 °C, closest to 37.7 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '37.7 ° C', true, 1), ('B', '37 ° C', false, 2), ('C', '38 ° C', false, 3), ('D', '36.7 ° C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Average temperature of a large city is warmer than the surrounding forest area, which phenomena describes this?', null, 'A city warmer than its surroundings is the urban heat island effect.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Climate change', false, 1), ('B', 'Urban heating effect', false, 2), ('C', 'Urban heat island effect', true, 3), ('D', 'Cooling due to evaporation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Intertropical Convergence Zone (ITCZ) is associated with:', null, 'The ITCZ is a belt of rising air, deep convection and heavy rainfall.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Drought', false, 1), ('B', 'Calm weather', false, 2), ('C', 'Heavy rainfall', true, 3), ('D', 'Hurricanes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Surface winds blow around a high pressure system in the Northern Hemisphere, the direction of:', null, 'In the Northern Hemisphere, surface winds blow clockwise and outward around a high.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Clockwise and outward', true, 1), ('B', 'Anti-clockwise and outward', false, 2), ('C', 'Clockwise and inward', false, 3), ('D', 'Anti-clockwise and inward', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Wind is caused by?', null, 'Wind is caused by horizontal pressure differences (pressure gradient force).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Horizontal pressure difference', true, 1), ('B', 'Surface friction', false, 2), ('C', 'Rotation of the earth', false, 3), ('D', 'Fronts', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The radiation of the sun heats:', null, 'Sunlight mainly heats the Earth''s surface, which then heats the air of the troposphere from below.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thermosphere which heats the other layers till the troposphere', false, 1), ('B', 'Air in the troposphere', false, 2), ('C', 'Troposphere directly on a clear sky', false, 3), ('D', 'Surface of earth which heats air in troposphere', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '1 knot in km/hr is approximately:', null, '1 knot = 1 nautical mile per hour = 1.852 km/h ≈ 1.8.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2.4', false, 1), ('B', '1.8', true, 2), ('C', '1.5', false, 3), ('D', '2.1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Oscillation of sea surface temperature', null, 'The Indian Ocean Dipole is an oscillation of sea surface temperature between the western and eastern Indian Ocean.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Indian Ocean Dipole', true, 1), ('B', 'Intertropical convergence zone', false, 2), ('C', 'None of the above', false, 3), ('D', 'Madden–Julian oscillation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the best method for finding the average annual precipitation of a catchment?', null, 'The isohyetal method, using lines of equal rainfall, gives the most accurate catchment average, especially in hilly areas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thiessen’s mean method', false, 1), ('B', 'Arithmetic method', false, 2), ('C', 'Simple mean method', false, 3), ('D', 'Isohyetal method', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The intensity of a cyclone decreases after land fall due to:', null, 'Over land a cyclone is cut off from its moisture (latent heat) supply, so it weakens (friction also helps).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Friction due to obstruction at land', false, 1), ('B', 'Cut off of moisture', true, 2), ('C', 'Decrease in wind speed', false, 3), ('D', 'Decrease in temperature on land', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Where are you likely to find strong winds close to the ground?', null, 'Strong surface winds occur where the pressure gradient is steep, as in frontal zones between air masses; the centre of a low is fairly calm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Periphery of a high pressure system', false, 1), ('B', 'In the transition zone between two air masses', true, 2), ('C', 'Where the pressure difference is less', false, 3), ('D', 'Centre of a low pressure system', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Additional hazard to aircraft taking off or landing in or near thunderstorm:', null, 'Wind shear (sudden changes in wind speed or direction, microbursts) is the main extra hazard on take-off and landing near thunderstorms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wind shear', true, 1), ('B', 'Turbulence', false, 2), ('C', 'Reduced speed', false, 3), ('D', 'Compass error', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which form of precipitation is most likely to fall, from clouds containing only water, in mid- latitudes?', null, 'Shallow warm (all-water) clouds such as stratus give drizzle.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Heavy rain with large drops', false, 1), ('B', 'Moderate rain with large drops', false, 2), ('C', 'Hail', false, 3), ('D', 'Drizzle', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the aviation weather charts can a pilot most find easily find a jet stream?', null, 'Upper-level wind/ temperature charts show the jet stream most easily.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Surface chart', false, 1), ('B', 'Meteorological Aerodrome Reports (METAR)', false, 2), ('C', 'Significant weather chart', false, 3), ('D', 'Wind/temperature chart', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The map shows sea level air pressure in millibars for an eastern coast of North America. Points A, B, C and D are sea-level locations on the Earth''s surface. Which location would have recorded the highest wind speed? What would be the approximate air pressure at point D?', 'Highest wind speed: location B. Wind speed depends on the pressure gradient - the closer the isobars, the steeper the gradient and the stronger the wind. Around B the isobars are packed most closely (between the 1024 mb isobar and the low centred near C), while A lies in the middle of a high-pressure area with widely spaced isobars, C is near the calm centre of the low (996 mb), and D has wider spacing.
Pressure at D: D lies between the 1008 mb and 1012 mb isobars, so the pressure there is approximately 1010 mb (about 1009-1011 mb).', null, '[{"point": "Highest wind speed at B - isobars most closely spaced there (steepest pressure gradient)", "marks": 2.5}, {"point": "Point D lies between the 1008 and 1012 mb isobars - approximately 1010 mb", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), '/papers/me/tech3-met-2024-pressure-map.png')
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
  values ('ME', 'short_answer', 'Find the median, first and third quartile, interquartile range and range from the box plot.', 'Reading the box plot: minimum (left whisker end) = 24, first quartile Q1 (left edge of box) = 27, median (line inside the box) = 31, third quartile Q3 (right edge of box) = 33, maximum (right whisker end) = 34.
Median = 31
First quartile Q1 = 27; third quartile Q3 = 33
Interquartile range = Q3 - Q1 = 33 - 27 = 6
Range = maximum - minimum = 34 - 24 = 10', null, '[{"point": "Median = 31 (line inside the box)", "marks": 1}, {"point": "First quartile Q1 = 27, third quartile Q3 = 33 (edges of the box)", "marks": 2}, {"point": "Interquartile range = 33 - 27 = 6", "marks": 1}, {"point": "Range = maximum - minimum = 34 - 24 = 10", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), '/papers/me/tech3-met-2024-boxplot.png')
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
  values ('ME', 'short_answer', 'Explain the different stages of a hydrological cycle.', 'The hydrological (water) cycle is the continuous movement of water between the oceans, atmosphere and land, driven by solar energy and gravity:
1. Evaporation and transpiration: the sun heats oceans, lakes, rivers and moist soil, turning water into water vapour; plants release water vapour through their leaves (transpiration) - together, evapotranspiration. Snow and ice can also sublimate directly into vapour.
2. Transport and condensation: winds carry the moist air; as it rises it expands and cools to its dew point, and the vapour condenses on tiny particles (condensation nuclei) to form clouds and fog.
3. Precipitation: when cloud droplets or ice crystals grow heavy enough they fall as rain, drizzle, snow, sleet or hail.
4. Interception, infiltration and percolation: some precipitation is caught by vegetation; some soaks into the soil (infiltration) and moves down to recharge groundwater (percolation), later feeding springs and rivers as baseflow.
5. Runoff and storage: the rest flows over the surface into streams and rivers (runoff) and back to the oceans; water may be stored for long periods in glaciers, snow, lakes, aquifers and oceans before the cycle repeats.', null, '[{"point": "Evaporation (from oceans, lakes, soil) and transpiration (plants) - evapotranspiration; sublimation from snow/ ice", "marks": 1.5}, {"point": "Condensation into clouds (cooling of rising air, dew point, condensation nuclei); transport by winds (advection)", "marks": 1}, {"point": "Precipitation - rain, snow, hail, drizzle", "marks": 1}, {"point": "Interception, infiltration/ percolation to groundwater, surface runoff and streamflow back to oceans; storage in glaciers, lakes, aquifers", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
  values ('ME', 'short_answer', 'Briefly describe the different meteorological observations and types of data collected.', 'Meteorological observations are made in several ways:
1. Surface observations at manual and automatic weather stations (synoptic, agro-meteorological and climate stations, airports): air temperature (including maximum and minimum), rainfall and snowfall, relative humidity (dew point), atmospheric pressure, wind speed and direction, sunshine duration and solar radiation, cloud amount and type, visibility, present weather (fog, thunder, hail), soil temperature and evaporation. Data are reported in codes such as SYNOP and, at airports, METAR.
2. Upper-air observations: radiosondes carried by balloons measure vertical profiles of temperature, humidity, pressure and wind; pilot balloons give winds; aircraft automatically report temperature and winds (AMDAR).
3. Remote sensing: weather radar detects precipitation intensity and movement of storms; meteorological satellites provide cloud images, sea surface temperature, atmospheric moisture, winds and snow cover; lightning detection networks locate thunderstorms.
4. Related hydrological and marine observations: river water level and discharge, glacier and lake monitoring, ocean buoys.
These data are used for weather forecasting, warnings, aviation, agriculture, hydropower and climate studies.', null, '[{"point": "Surface observations (manual and automatic weather stations): temperature (max/ min), rainfall, humidity, pressure, wind speed/ direction, sunshine/ solar radiation, cloud, visibility, present weather, soil temperature, evaporation", "marks": 2}, {"point": "Upper-air observations: radiosondes/ pilot balloons - temperature, humidity, pressure, wind profiles; aircraft reports (AMDAR)", "marks": 1}, {"point": "Remote sensing: weather radar (precipitation, storms), satellites (cloud imagery, SST, winds, moisture), lightning detection; hydrological (river level, discharge); aviation METAR/ SYNOP codes; climate records", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
Weather forecasting is a challenging and complex problem owing to the chaotic nature of the atmosphere. Weather forecasting is the prediction of the weather by the application of principles of physics and the use of a number of empirical and statistical methods. Prediction of the future is made based on the initial conditions of the current state of the atmosphere and projecting into the future using physical laws and the understanding of atmospheric processes. In the context of weather forecasting, answer the following questions.

1. What are weather models and how are they used for forecasting? Suggest ways to improve weather forecasting accuracy. What kind of data is used in weather models? (15 marks)', 'Weather models (numerical weather prediction, NWP, models) are computer programs that represent the atmosphere on a three-dimensional grid and solve the physical equations that govern it - conservation of momentum (motion), mass (continuity), energy (thermodynamics) and moisture - together with parameterisations of processes too small for the grid (clouds and convection, radiation, boundary layer, land surface). There are global models (e.g. ECMWF IFS, NOAA GFS) and regional or limited-area models (e.g. WRF) run at higher resolution for a country like Bhutan.
How they are used: observations are combined with a previous forecast through data assimilation to produce the best estimate of the current state (initial conditions); the model then steps forward in time to predict future values of pressure, wind, temperature, humidity and rainfall at every grid point. Because the atmosphere is chaotic, ensembles of slightly different runs are used to give probabilities and uncertainty. Forecasters interpret and post-process model output, downscale it for local terrain and issue forecasts and warnings.
Improving accuracy: denser and better observations (automatic weather stations, radiosondes, weather radar, satellite data, especially in mountainous and data-poor areas such as Bhutan); improved data assimilation; higher model resolution to represent complex terrain; better physics (convection, microphysics, orography); ensemble and probabilistic forecasting; more computing power; use of AI/machine learning; bias correction and local calibration; regular forecast verification; and training of forecasters.
Data used: surface observations (pressure, temperature, humidity, wind, rainfall), upper-air radiosonde and pilot balloon data, aircraft reports, satellite radiances, cloud-motion winds and sea surface temperature, radar reflectivity, ship and buoy data, and static data such as topography, land use, soil moisture and snow cover.', null, '[{"point": "Weather (NWP) models: computer programs solving equations of atmospheric physics (motion, thermodynamics, continuity, moisture) on a 3-D grid; global (GFS, ECMWF) and regional/ limited-area (WRF) models", "marks": 4}, {"point": "Use: data assimilation gives initial state, model integrates forward in time steps, outputs (rain, temperature, wind) interpreted by forecasters; ensemble forecasts for uncertainty, downscaling, post-processing", "marks": 4}, {"point": "Improve accuracy: more and better observations (AWS, radar, upper air), better data assimilation, higher resolution, better physics/ parameterisation (convection, terrain), ensembles, supercomputing, AI/ ML, verification, local calibration, forecaster training", "marks": 4}, {"point": "Data: surface stations, radiosondes, aircraft, satellites (radiances, cloud winds), radar, ships/ buoys, topography, land use, SST, soil moisture", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case1', 1, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
Weather forecasting is a challenging and complex problem owing to the chaotic nature of the atmosphere. Weather forecasting is the prediction of the weather by the application of principles of physics and the use of a number of empirical and statistical methods. Prediction of the future is made based on the initial conditions of the current state of the atmosphere and projecting into the future using physical laws and the understanding of atmospheric processes. In the context of weather forecasting, answer the following questions.

2. A flash flood occurred in Dechencholing, Thimphu on 10 August 2024. Investigation revealed that the flood was triggered by heavy rainfall caused by a convective thunderstorm. Describe what a convective thunderstorm is. What conditions make convective storms likely? What are the tools used to help detect convective thunderstorms? (15 marks)', 'A convective thunderstorm is a storm produced by strong vertical (convective) motion of warm, moist, unstable air. As the air rises it cools and its moisture condenses, releasing latent heat that makes it rise further, building a tall cumulonimbus cloud that produces thunder, lightning, very heavy short-duration rain, gusty winds and sometimes hail. It develops in three stages: the cumulus stage (updrafts dominate), the mature stage (strong updrafts and downdrafts, heaviest rain, lightning and hail) and the dissipating stage (downdrafts cut off the warm inflow). Such storms are localised and can drop large amounts of rain on a small catchment within an hour, causing flash floods like the one in Dechencholing.
Conditions that make convective storms likely: (1) plenty of moisture in the lower atmosphere - as during the monsoon; (2) atmospheric instability - warm, humid air near the surface under cooler air aloft (high convective available potential energy, CAPE); (3) a lifting mechanism - strong daytime heating of the ground (afternoon and evening storms), orographic lifting as air is forced up mountain slopes, convergence zones or fronts; and (4) slow storm movement (weak steering winds), so rain falls on the same place for a long time.
Tools used to detect them: Doppler weather radar (precipitation intensity, storm movement, rotation); meteorological satellites (rapidly cooling, high cloud tops in infrared imagery, cloud growth); lightning detection networks; automatic weather stations and rain gauges reporting rainfall intensity in real time; radiosonde soundings and instability indices (CAPE, lifted index, K index); high-resolution NWP models; nowcasting systems; and webcams and public reports.', null, '[{"point": "Convective thunderstorm: storm from strong vertical rising of warm, moist, unstable air forming cumulonimbus cloud; stages cumulus (updraft), mature (updraft + downdraft, heavy rain, lightning, hail), dissipating; localised, short, intense rainfall", "marks": 5}, {"point": "Conditions: moisture (monsoon), atmospheric instability (warm humid surface, cooler air aloft, high CAPE), lifting mechanism (surface heating in afternoon, orographic lift on mountain slopes, fronts, convergence), weak wind shear for slow-moving storms", "marks": 5}, {"point": "Detection tools: Doppler weather radar, satellites (IR/ visible imagery, cloud-top cooling), lightning detection networks, AWS and rain gauges, radiosondes/ instability indices (CAPE, K index), NWP models, nowcasting systems, cameras/ public reports", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case1', 2, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
  values ('ME', 'passage', 'Case I
Weather forecasting is a challenging and complex problem owing to the chaotic nature of the atmosphere. Weather forecasting is the prediction of the weather by the application of principles of physics and the use of a number of empirical and statistical methods. Prediction of the future is made based on the initial conditions of the current state of the atmosphere and projecting into the future using physical laws and the understanding of atmospheric processes. In the context of weather forecasting, answer the following questions.

3. What is nowcasting? What tools are used for nowcasting? (10 marks)', 'Nowcasting is the detailed description of the current weather together with forecasts for the very short range - from the present up to about 6 hours ahead (mostly 0-2 hours). It relies mainly on the latest observations and extrapolation of the movement and development of weather systems, and is used for rapidly developing, local, high-impact weather such as thunderstorms, heavy rainfall and flash floods, hail, strong winds, lightning and fog, so that warnings can be issued quickly (e.g. for aviation, roads, disaster management and the public).
Tools: weather radar (reflectivity and Doppler winds, with extrapolation of storm tracks); geostationary satellite imagery with rapid-scan updates (cloud growth, cloud-top temperature); lightning detection networks; real-time automatic weather stations and rain gauges; rapid-update, high-resolution numerical models blended with observations; nowcasting software systems (e.g. SWIRLS, TITAN, pySTEPS) that track and project storms; webcams and spotter reports; and the experience of forecasters, together with fast communication channels (SMS, apps, sirens, media) to deliver warnings.', null, '[{"point": "Nowcasting: detailed description of current weather and forecast for the next 0-6 hours (mainly 0-2 h) by extrapolating observed systems; for severe, local, fast-changing weather - thunderstorms, heavy rain, flash floods, fog, wind; warnings", "marks": 4}, {"point": "Tools: weather radar (reflectivity, Doppler velocity, extrapolation), satellite imagery (rapid scan), lightning detection, AWS/ rain gauges real-time, high-resolution rapid-update NWP, nowcasting software (e.g. SWIRLS, TITAN, pySTEPS), cameras, forecaster expertise, communication channels (SMS, apps)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case1', 3, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
Weather forecasting is a challenging and complex problem owing to the chaotic nature of the atmosphere. Weather forecasting is the prediction of the weather by the application of principles of physics and the use of a number of empirical and statistical methods. Prediction of the future is made based on the initial conditions of the current state of the atmosphere and projecting into the future using physical laws and the understanding of atmospheric processes. In the context of weather forecasting, answer the following questions.

4. What are the impacts of El Niño-Southern Oscillation (ENSO) and the Indian Ocean Dipole (IOD) on rainfall of Bhutan? (10 marks)', 'ENSO: during El Niño, waters in the central and eastern Pacific are unusually warm, the Walker circulation shifts and the South Asian summer monsoon tends to weaken. Bhutan therefore usually receives below-normal monsoon rainfall, with delayed onset, longer dry spells, higher temperatures, reduced river flows (affecting hydropower and irrigation), water shortages and a higher risk of forest fires and crop loss. During La Niña the monsoon tends to be stronger, so Bhutan often receives normal to above-normal rainfall, with more risk of floods, flash floods and landslides.
IOD: a positive IOD (warmer western Indian Ocean, cooler east) generally strengthens monsoon rainfall over South Asia and can partly cancel the drying effect of El Niño; a negative IOD tends to reduce monsoon rainfall and can worsen an El Niño drought.
The combined phases of ENSO and IOD, together with Bhutan''s complex topography and local factors, determine the actual rainfall, so the relationship is not the same every year. NCHM uses ENSO and IOD forecasts in seasonal outlooks to help agriculture, hydropower and disaster management prepare.', null, '[{"point": "ENSO: El Niño (warm central/ eastern Pacific) weakens Walker circulation and South Asian monsoon - generally below-normal monsoon rainfall/ drier, higher temperatures in Bhutan, drought/ water stress, forest fires; La Niña - generally normal/ above-normal rainfall, floods/ landslides", "marks": 5}, {"point": "IOD: positive IOD (warmer western Indian Ocean) tends to enhance monsoon rainfall and can offset El Niño; negative IOD tends to reduce rainfall; combined phases matter; relationship not uniform - local topography, use in seasonal forecasts", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case1', 4, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
  values ('ME', 'passage', 'Case II
Climate change is widespread, rapid and intensifying according to the Intergovernmental Panel on Climate Change (IPCC). Climate change is projected to increase the temperature and the global water cycle. One of the main impacts of climate change is the rise of extreme weather events like heavy rainfall and severe floods. Bhutan is also highly vulnerable to the impacts of climate change due to its geographical location and fragile mountain ecosystem. In the light of the increase in extreme weather events, answer the following questions.

1. What is an Early Warning System? Suggest how the early warning system can work efficiently during an extreme weather event. (10 marks)', 'An Early Warning System (EWS) is an integrated system of hazard monitoring, forecasting and prediction, disaster risk assessment, communication and preparedness activities that enables individuals, communities, governments and businesses to take timely action to reduce disaster risk before a hazardous event (UNDRR definition). It has four key elements: (1) disaster risk knowledge, (2) detection, monitoring, analysis and forecasting, (3) warning dissemination and communication, and (4) preparedness and response capabilities.
For it to work efficiently during an extreme weather event: maintain a dense, reliable monitoring network (automatic weather stations, rain gauges, weather radar, river-level and GLOF sensors) with backup power and communication; produce accurate, timely and impact-based forecasts that say what the weather will do (e.g. which roads or villages may flood); have clear standard operating procedures and responsibilities linking NCHM, the Department of Disaster Management, dzongkhag and gewog disaster committees, police and other agencies; disseminate warnings quickly through many channels - sirens, SMS and cell broadcast, radio, TV, social media, apps and community focal persons - in simple language and Dzongkha; make sure the warning reaches the "last mile" including remote and vulnerable people; prepare communities through awareness, drills, evacuation routes and shelters; and review each event to improve the system.', null, '[{"point": "EWS: integrated system of hazard monitoring, forecasting, risk assessment, communication and preparedness that enables timely action to reduce harm (UNDRR); four elements - risk knowledge, monitoring and warning, dissemination/ communication, response capability", "marks": 4}, {"point": "Efficient working: accurate, timely impact-based forecasts; dense monitoring network (AWS, radar, river sensors); clear standard operating procedures and roles (NCHM, DDM, dzongkhags); multi-channel last-mile dissemination (sirens, SMS, media, apps, community focal persons, in local language); community awareness, drills, evacuation plans/ shelters; feedback and review; redundancy (power, communication)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case2', 1, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Climate change is widespread, rapid and intensifying according to the Intergovernmental Panel on Climate Change (IPCC). Climate change is projected to increase the temperature and the global water cycle. One of the main impacts of climate change is the rise of extreme weather events like heavy rainfall and severe floods. Bhutan is also highly vulnerable to the impacts of climate change due to its geographical location and fragile mountain ecosystem. In the light of the increase in extreme weather events, answer the following questions.

2. Write a short note on flood forecasting. The ''Early Warnings for All'' initiative of the World Meteorological Organization aims to ensure that everyone on Earth is protected from hazardous weather, water or climate events through life-saving early warning systems by the end of 2027. What do you think are some challenges to this initiative? (15 marks)', 'Flood forecasting is the prediction of when, where and how severe a flood will be, so that warnings can be issued in advance. It combines rainfall forecasts from weather models and radar/satellite estimates, real-time observations of rainfall and river water levels and discharge, and hydrological (rainfall-runoff) and hydraulic (flood routing and inundation) models, with warning thresholds for each river point. Lead time is usually hours to days for large rivers but very short (minutes to a few hours) for flash floods in small mountain catchments, which require rainfall-based warnings. In Bhutan, NCHM operates hydro-meteorological stations, a flood warning section and GLOF early warning systems with sensors and sirens along rivers such as the Punatsangchhu, Mangdechhu and Chamkharchhu.
Challenges to "Early Warnings for All" by 2027: (1) large gaps in observation networks, especially in mountainous, small and least developed countries; (2) limited funding and difficulty sustaining and maintaining equipment; (3) shortage of trained forecasters, hydrologists and technicians; (4) limited data sharing and cooperation on transboundary rivers; (5) reaching the "last mile" - remote communities without mobile coverage, electricity or internet, and people who speak different languages or have disabilities; (6) very short lead times of flash floods and landslides; (7) weak coordination among meteorological, disaster management and local agencies; (8) turning warnings into action - public awareness, trust and preparedness; and (9) climate change increasing the frequency and intensity of extremes, so the system must keep improving.', null, '[{"point": "Flood forecasting: predicting timing, magnitude, location of floods using rainfall forecasts, real-time rainfall and river level/ discharge observations and hydrological/ hydraulic models (rainfall-runoff, routing), thresholds; lead time short for flash floods; GLOF monitoring; Bhutan - NCHM flood warning centre, hydro-met stations, sirens on Punatsangchhu/ Mangdechhu", "marks": 7}, {"point": "Challenges: gaps in observing networks especially in mountains/ LDCs, funding and sustainability, technical capacity/ trained staff, data sharing across borders/ transboundary rivers, last-mile communication (remote areas, connectivity, languages, power), short lead times of flash floods, coordination among agencies, public trust/ awareness and response, maintenance, climate change increasing extremes", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case2', 2, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
  values ('ME', 'passage', 'Case II
Climate change is widespread, rapid and intensifying according to the Intergovernmental Panel on Climate Change (IPCC). Climate change is projected to increase the temperature and the global water cycle. One of the main impacts of climate change is the rise of extreme weather events like heavy rainfall and severe floods. Bhutan is also highly vulnerable to the impacts of climate change due to its geographical location and fragile mountain ecosystem. In the light of the increase in extreme weather events, answer the following questions.

3. Climate projections are simulations of Earth''s climate for future decades based on assumed ''scenarios'' for the concentrations of greenhouse gases, aerosols and other atmospheric constituents. Global Climate Models help in understanding the Earth''s climate in the future. How does one use climate projections that run hundreds of years into the future? (10 marks)', 'Climate projections are not predictions of the weather on a particular day or year; they show how the climate (long-term averages and the frequency of extremes) is likely to change under different assumed futures of greenhouse gas and aerosol emissions (scenarios such as the Shared Socioeconomic Pathways, SSP1-2.6 to SSP5-8.5). They are therefore used as "what if" information:
- Use many models (multi-model ensembles) and several scenarios to show the range of possible futures and the uncertainty, and look at changes in 20-30-year averages relative to a baseline period (e.g. 1981-2010) rather than single years.
- Downscale the coarse global model output to local or regional scale (statistical downscaling or regional climate models, e.g. CORDEX South Asia) and bias-correct it against observed data, because Bhutan''s mountains are not resolved by global models.
- Feed the projected temperature and rainfall into impact models for water resources, glaciers and GLOF risk, agriculture, forests, hydropower, health and disasters.
- Use the results to plan adaptation (National Adaptation Plan), set design standards for long-lived infrastructure such as dams, bridges and drainage, guide land use and disaster risk reduction, and support mitigation policy (NDCs) by showing the benefit of lower-emission pathways.
- Update plans as newer models and observations become available, using projections as guidance for robust, flexible decisions rather than exact numbers.', null, '[{"point": "Nature: projections are not forecasts of specific weather/ years - conditional on scenarios (SSPs/ RCPs), give long-term trends and ranges; use multi-model ensembles and multiple scenarios; 30-year averages/ change relative to baseline", "marks": 4}, {"point": "Use: downscale (statistical/ dynamical, CORDEX) to local scale, bias-correct; assess impacts on water, glaciers, agriculture, hydropower, health; inform adaptation plans (NAP, NDC), infrastructure design standards, risk assessment, policy for mitigation; update as new models", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case2', 3, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
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
Climate change is widespread, rapid and intensifying according to the Intergovernmental Panel on Climate Change (IPCC). Climate change is projected to increase the temperature and the global water cycle. One of the main impacts of climate change is the rise of extreme weather events like heavy rainfall and severe floods. Bhutan is also highly vulnerable to the impacts of climate change due to its geographical location and fragile mountain ecosystem. In the light of the increase in extreme weather events, answer the following questions.

4. What are the long term impacts of climate change and how should countries like Bhutan prepare for the changing climate? (15 marks)', 'Long-term impacts of climate change: rising temperatures, especially at high altitudes; retreat and loss of glaciers, growth of glacial lakes and higher GLOF risk; changes in rainfall - more intense downpours but also longer dry spells and erratic monsoons - leading to more floods, flash floods and landslides as well as droughts, drying springs and water shortages; more forest fires, pests and diseases; shifts of species and ecosystems upslope and loss of biodiversity; reduced crop yields and food security problems for farmers; variability in river flows affecting hydropower, the main source of national revenue; health risks such as vector-borne diseases spreading to higher areas and heat stress; damage to roads, bridges and settlements; and wider economic and livelihood losses.
How Bhutan should prepare: strengthen hydro-meteorological services, observation networks and multi-hazard early warning systems (including GLOF and flash-flood warnings); build climate-resilient infrastructure with updated design standards and risk-informed land-use planning; manage water carefully - protect spring-sheds and watersheds, build storage and rainwater harvesting, improve irrigation efficiency; promote climate-smart agriculture (drought-tolerant varieties, diversification, irrigation, crop insurance); conserve and sustainably manage forests and biodiversity; reduce GLOF risk through lake lowering, monitoring and hazard zoning; strengthen disaster preparedness at all levels; diversify the economy and energy sources (solar, wind) to reduce dependence on hydropower; invest in research, data and climate projections; mainstream climate change into national and local plans (NAP, NDC, Five-Year Plans); seek climate finance and international cooperation; raise public awareness and build capacity; and continue to stay carbon neutral to contribute to global mitigation.', null, '[{"point": "Long-term impacts: rising temperatures, glacier retreat and GLOF risk, changed rainfall (more intense, erratic, longer dry spells), floods, flash floods, landslides, droughts/ water shortage (drying springs), forest fires, pests, biodiversity shifts (species moving upslope), agriculture and food security, hydropower generation, health (vector-borne disease), infrastructure damage, economy and livelihoods", "marks": 7}, {"point": "Preparation: strengthen hydro-met services and EWS, climate-resilient infrastructure and building codes, water management (spring-shed protection, storage, rainwater harvesting), climate-smart agriculture, forest and watershed conservation, GLOF risk reduction, disaster preparedness, diversified economy/ energy, research and data, integrate climate into plans (NAP, NDC), international finance and cooperation, awareness and capacity building; continue carbon neutrality/ mitigation", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Meteorology and Climate Studies", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-met2024-case2', 4, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which instrument measures relative humidity using wet-bulb and dry-bulb thermometers?', null, 'A psychrometer compares dry-bulb and wet-bulb temperatures to give humidity; an anemometer measures wind, a pyranometer solar radiation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pyranometer', false, 1), ('B', 'Psychrometer', true, 2), ('C', 'Barometer', false, 3), ('D', 'Anemometer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which cloud type is most associated with thunderstorms, lightning and hail?', null, 'Cumulonimbus clouds are tall convective clouds producing thunder, lightning, heavy showers and hail.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Altostratus', false, 1), ('B', 'Cirrus', false, 2), ('C', 'Cumulonimbus', true, 3), ('D', 'Stratus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The average environmental lapse rate in the troposphere is about:', null, 'Temperature falls by about 6.5 °C per km on average; 9.8 °C/km is the dry adiabatic lapse rate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6.5 °C per km', true, 1), ('B', '15 °C per km', false, 2), ('C', '9.8 °C per km', false, 3), ('D', '2.0 °C per km', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan receives most of its annual rainfall from the south-west monsoon during:', null, 'The south-west monsoon (June-September) brings most of Bhutan''s rainfall.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'meteorology-and-climate-studies'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Meteorology and Climate Studies): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'meteorology-hydrology'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'March to May', false, 1), ('B', 'October to November', false, 2), ('C', 'December to February', false, 3), ('D', 'June to September', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
