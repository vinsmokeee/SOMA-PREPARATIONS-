-- ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'survey-engineering', 'Survey Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'survey-engineering') is null then raise exception 'unknown specialisation survey-engineering'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'survey-engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'survey-engineering'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Survey Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'survey-engineering'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 5, 4, null, 'BCSE 2025 Main Examination, Technical Paper III, Survey Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'survey-engineering'), null, 3, 'Section B: Case studies (answer any TWO)', 'passage', 3, 25, 2, 'BCSE 2025 Main Examination, Technical Paper III, Survey Engineering');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which positioning method is used by GPS to determine location?', null, 'GPS finds position by trilateration (distances from satellites).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Traversing', false, 1), ('B', 'Trilateration', true, 2), ('C', 'Intersection', false, 3), ('D', 'Triangulation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Geoid is best described as…', null, 'The geoid is the equipotential surface approximating mean sea level.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mathematical Ellipsoid', false, 1), ('B', 'Perfect sphere', false, 2), ('C', 'Earth surface model', false, 3), ('D', 'An equipotential surface that approximates mean sea level', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which ellipsoid is used for DrukRef03 datum?', null, 'DrukRef03 is based on ITRF2000 with the GRS80 ellipsoid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'GRS 1980', true, 1), ('B', 'WGS 1984', false, 2), ('C', 'Everest 1981', false, 3), ('D', 'Bessel 1841', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a common error source that RTK surveying must correct for?', null, 'RTK corrects ephemeris, clock and atmospheric errors; multipath must be managed too.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of above', true, 1), ('B', 'Clock drift', false, 2), ('C', 'Multi-path effects', false, 3), ('D', 'Ephemeris errors', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In GPS surveying, the ambiguity is resolved by?', null, 'Ambiguity resolution finds the integer number of carrier cycles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Using only the L2 frequency', false, 1), ('B', 'Averaging multiple pseudo-range positions', false, 2), ('C', 'Determining the integer number of carrier wave cycles', true, 3), ('D', 'Calculating Doppler shift from satellite signals', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which error in surveying is not systematic?', null, 'Human error (blunders/random) is not systematic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Temperature effect.', false, 1), ('B', 'Collimation error.', false, 2), ('C', 'Instrument miscalibration.', false, 3), ('D', 'Human error', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In which portion of the electromagnetic spectrum do GPS signals operate?', null, 'GPS signals are L-band radio waves.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Radio wave', true, 1), ('B', 'Ultraviolet', false, 2), ('C', 'Visible light', false, 3), ('D', 'Infrared', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Stereoscopic vision in photogrammetry is possible due to…', null, 'Stereo viewing needs overlapping photos taken from different positions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Color enhancement.', false, 1), ('B', 'Digital image processing.', false, 2), ('C', 'Camera distortion.', false, 3), ('D', 'Overlap in successive images', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Orthophotos are generated to…', null, 'Orthophotos remove relief displacement and tilt distortions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reduce the image file size.', false, 1), ('B', 'Remove image distortions and terrain relief.', true, 2), ('C', 'Correct orientations.', false, 3), ('D', 'Enhance 3D modeling.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is ''parallax'' refers to in photogrammetry?', null, 'Parallax is the apparent displacement of an object between two viewpoints.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measurement error', false, 1), ('B', 'Camera distortion', false, 2), ('C', 'Apparent displacement due to different viewpoints', true, 3), ('D', 'Refraction effect', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What are the transformation parameters?', null, 'A 7-parameter transformation has translations, rotations and scale.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All above', true, 1), ('B', 'Translations', false, 2), ('C', 'Scale factor', false, 3), ('D', 'Rotations', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What type of data is produced directly by LIDAR?', null, 'LiDAR produces a point cloud.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Image', false, 1), ('B', 'Point cloud', true, 2), ('C', 'Vector', false, 3), ('D', 'Raster', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a map of 1:5000, what is the minimum size of the features that can be plotted in the map?', null, 'Plottable error 0.25 mm x 5000 = 1.25 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.25 m', true, 1), ('B', '2.5 m', false, 2), ('C', '3.5 m', false, 3), ('D', '2 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The total station machine has the horizontal accuracy specification as 2 mm + 2 ppm. What would be the maximum potential error when the horizontal distance measured is 1 km?', null, '2 mm + 2 ppm x 1 km (2 mm) = ±4 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '±6 mm', false, 1), ('B', '±8 mm', false, 2), ('C', '±2 mm', false, 3), ('D', '±4 mm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In surveying, trilateration refers to measuring…', null, 'Trilateration measures distances.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All above', false, 1), ('B', 'Distance', true, 2), ('C', 'Time', false, 3), ('D', 'Angle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does Dilution of Precision (DOP) in GPS surveying represent?', null, 'DOP describes how satellite geometry affects accuracy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The strength of satellite signal', false, 1), ('B', 'The number of visible satellites', false, 2), ('C', 'The effect of satellite geometry on positional accuracy', true, 3), ('D', 'The number of frequency bands used', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main cause of systematic errors in surveying?', null, 'Systematic errors come from instrument imperfections and environmental factors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Human mistakes during data recording', false, 1), ('B', 'Variations in the gravitational field', false, 2), ('C', 'Random fluctuations in measurements', false, 3), ('D', 'Instrumental imperfections or environmental factors', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which map projection system is more accurate to be used for the cadastral mapping in Bhutan?', null, 'Dzongkhag local TM grids keep scale distortion small, best for cadastral work.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Universal Transverse Mercator (UTM)', false, 1), ('B', 'National grid projection', false, 2), ('C', 'Plane projection', false, 3), ('D', 'Local grid projection defined for every Dzongkhag', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which communication method is commonly used to transmit RTK corrections?', null, 'RTK corrections are sent by UHF/VHF radio or NTRIP over the internet.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fiber optic cable', false, 1), ('B', 'UHF/VHF radio or NTRIP via Internet', true, 2), ('C', 'Bluetooth', false, 3), ('D', 'Infrared', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What measurement technique is primarily used in GNSS-RTK surveying to achieve centimeter- level accuracy?', null, 'RTK uses carrier-phase measurements.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Carrier-phase measurement', true, 1), ('B', 'code-based ranging', false, 2), ('C', 'Pseudo-range positioning', false, 3), ('D', 'Doppler shift tracking', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which part of the electromagnetic spectrum is typically emitted by Electronic Distance Measurement (EDM) instruments?', null, 'EDMs use infrared (and microwave) signals.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ultraviolet rays', false, 1), ('B', 'Radio waves', false, 2), ('C', 'Infrared and microwave signals', true, 3), ('D', 'Gamma rays', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'EDM (Electronic Distance Measurement) works on the principle of…', null, 'EDM measures travel time or phase shift of electromagnetic waves.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Travel time and phase shift of electromagnetic waves', true, 1), ('B', 'Triangulation', false, 2), ('C', 'Resection', false, 3), ('D', 'Traversing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is equivalent value of area in hectare for 1 acre plot?', null, '1 acre = 0.4047 ha.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.505 ha', false, 1), ('B', '0.605 ha', false, 2), ('C', '0.405 ha', true, 3), ('D', '0.705 ha', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A GNSS receiver measures an ellipsoidal height of 2000 m at a survey point in Bhutan. Given the geoid height at that location is 35 m what is the orthometric height at the survey point?', null, 'Orthometric height H = h - N = 2000 - 35 = 1965 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1965', true, 1), ('B', '2000', false, 2), ('C', '2035', false, 3), ('D', '2010', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Land Act 2007 of Bhutan mandates all the cadastral survey is conducted on National Geodetic reference datum. The current datum (DrukRef03) is realized at the tectonic plate epoch of ….', null, 'DrukRef03 is realised at epoch 2003.0.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2005', false, 1), ('B', '2010', false, 2), ('C', '2000', false, 3), ('D', '2003', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the difference between the carrier-phase and pseudo-range (code) techniques of GNSS measurement, including their principle, key features, advantages and limitations.', 'Pseudo-range (code) technique: the receiver correlates the satellite''s PRN code (C/A or P) with its replica to measure signal travel time; multiplied by the speed of light this gives a range biased by clock error (pseudo-range). Positions from four or more satellites. Features/advantages: simple, instant, cheap receivers, no ambiguity problem, works for navigation and GIS mapping. Limitations: accuracy about 1-5 m (or sub-metre with DGNSS), affected by multipath and atmosphere. Carrier-phase technique: measures the phase of the carrier wave (L1 wavelength about 19 cm, L2 about 24 cm) plus an unknown integer number of whole cycles (ambiguity) that must be resolved. Advantages: mm- to cm-level accuracy (static, RTK, PPP) - needed for geodetic control and cadastral surveys. Limitations: needs ambiguity resolution, continuous lock (cycle slips), dual-frequency/expensive receivers, base stations or CORS, and longer observation.', null, '[{"point": "Code: measures signal travel time using PRN code correlation x c = pseudo-range; metre-level, instant, simple/cheap receivers, no ambiguity; limited accuracy (1-5 m)", "marks": 2}, {"point": "Carrier phase: measures phase of carrier wave (19/24 cm) plus integer ambiguity; mm-cm accuracy (RTK, static), needs ambiguity resolution, continuous lock, cycle slips, costlier, longer", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is a scale factor? Explain how it acts as a multiplier with a total station and as a divider with GPS.', 'Scale factor is the ratio between a distance on the map projection (grid) and the corresponding distance on the ellipsoid; with the elevation (height) factor it forms the combined scale factor (CSF = grid scale factor x elevation factor), relating grid distance to true ground distance. A total station measures horizontal ground distances, so to compute coordinates on the national grid the ground distance is multiplied by the CSF (grid distance = ground distance x CSF). GNSS gives coordinates directly on the grid, so a distance computed from GPS coordinates is a grid distance; to set out or compare with ground measurements it is divided by the CSF (ground distance = grid distance / CSF). Example: CSF 0.9997 - a 1000 m ground distance is 999.70 m on the grid.', null, '[{"point": "Scale factor: ratio of grid distance to ground (ellipsoid) distance; combined scale factor = grid (projection) factor x elevation (height) factor", "marks": 2}, {"point": "Total station measures ground distance - multiply by CSF to get grid distance for computing grid coordinates; GPS gives grid coordinates - grid distance divided by CSF gives ground distance for setting out", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are plottable error and map accuracy? Compute the plottable error and map accuracy for a map scale of 1:5000.', 'Plottable error (graphical accuracy) is the smallest distance that can be plotted or distinguished on a map by eye, usually taken as 0.25 mm at map scale (0.2-0.3 mm). Map accuracy is the expected positional accuracy of well-defined features shown on the map, often taken as about 0.5 mm at map scale (or twice the plottable error). For 1:5000: plottable error = 0.25 mm x 5000 = 1.25 m on the ground, so features smaller than about 1.25 m cannot be shown to scale; map accuracy = 0.5 mm x 5000 = 2.5 m.', null, '[{"point": "Plottable error: smallest distance that can be plotted/ read on a map, about 0.25 mm (0.2-0.3 mm) at map scale", "marks": 1.5}, {"point": "Map accuracy: positional accuracy of features shown; commonly 0.5 mm (or 0.3 mm) x scale", "marks": 1}, {"point": "1:5000: plottable 0.25 mm x 5000 = 1.25 m; map accuracy 0.5 mm x 5000 = 2.5 m (or per standard used)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the process of differential GNSS positioning and its advantages over standard GPS. The base station coordinates are known (X: 500 m, Y: 300 m, Z: 200 m). The rover receives correction values from the base station (ΔX: -5 m, ΔY: 3.0 m, ΔZ: -2.5 m). Calculate the corrected coordinates for the rover.', 'Differential GNSS: a base receiver is set on a point with known coordinates and observes the same satellites as the rover at the same time. Comparing its known position with the position it computes gives corrections (or pseudo-range corrections) for errors common to both receivers - satellite orbit and clock errors and ionospheric and tropospheric delays. These are sent to the rover by radio or internet (NTRIP), or applied later by post-processing, and the rover applies them to its own observations. Advantages over standalone GPS: accuracy improves from several metres to sub-metre (code DGNSS) or centimetres (carrier-phase RTK), in real time and reliably. Calculation (applying the given corrections to the given coordinates, since no separate rover reading is given): X = 500 + (-5) = 495.0 m; Y = 300 + 3.0 = 303.0 m; Z = 200 + (-2.5) = 197.5 m.', null, '[{"point": "Process: base receiver at known point computes errors (known minus observed), sends corrections (radio/ NTRIP) or post-processing; rover applies corrections; common errors cancel", "marks": 1.5}, {"point": "Advantages: removes common errors (satellite clock/orbit, ionosphere, troposphere), sub-metre to cm accuracy, real-time", "marks": 1}, {"point": "Calculation: X = 500 - 5 = 495 m, Y = 300 + 3 = 303 m, Z = 200 - 2.5 = 197.5 m (stating assumption)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the National Grid projection system of Bhutan. Discuss the role and impact of the scale factor in this system, with examples.', 'Bhutan''s National Grid is a Transverse Mercator projection based on the national datum DrukRef03 (ITRF2000 at epoch 2003.0, GRS80 ellipsoid), with a central meridian near 90°E through the middle of the country and false easting/northing so all coordinates are positive; separate dzongkhag TM grids with their own central meridians are used for cadastral work to keep distortion small. [Expert: check the exact grid parameters.] Scale factor: on a TM projection the scale is fixed at the central meridian and increases with distance east or west, so grid distances differ slightly from ellipsoid distances. In Bhutan, high elevations add a large elevation factor: at 2500 m the elevation factor is about 1 - 2500/6 371 000 ≈ 0.99961, so a 1000 m ground distance is about 0.39 m shorter on the grid. Ignoring the combined scale factor causes errors of decimetres per kilometre in setting out roads, hydropower tunnels or parcels, so surveyors apply the CSF or use local grids.', null, '[{"point": "System: Bhutan National Grid - Transverse Mercator projection on DrukRef03 datum (ITRF2000 epoch 2003, GRS80), central meridian about 90°E, false easting/northing, scale factor at CM; dzongkhag TM grids for cadastral", "marks": 2}, {"point": "Scale factor role: distortion increases away from CM; combined with elevation factor (large in Bhutan''s mountains), grid vs ground differences; example calculation; need to apply CSF in surveys/ setting out", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Check Bhutan National Grid parameters."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Modernising Bhutan''s GNSS CORS network
Bhutan currently operates 14 GNSS Continuously Operating Reference Stations (CORS) to support geodetic and surveying applications. As lead survey engineer, you are tasked with proposing a national-level project to modernise and expand the GNSS-CORS network to meet growing demand for high-accuracy positioning and geospatial services across the country.

Write the proposal. It should include:
- current limitations of the existing CORS network;
- proposed technical enhancements;
- expansion strategy, including optimal station density and location criteria;
- expected improvements in geodetic reference frame maintenance and real-time and post-processed positioning accuracy;
- applications and benefits in key sectors;
- resource and implementation plan. (25 marks)', '1. Current limitations: 14 stations cannot cover Bhutan''s rugged terrain - many areas lie beyond 30-40 km of a station, so single-base RTK accuracy degrades, and deep valleys block signals; uneven distribution with gaps in remote north and east; some receivers are older, GPS-only or limited-frequency; unreliable power and internet links cause data gaps; no full network RTK solution; limited monitoring, data archiving and technical capacity; few users can access services easily.
2. Technical enhancements: replace or upgrade to multi-GNSS (GPS, GLONASS, Galileo, BeiDou), multi-frequency geodetic receivers with choke-ring antennas; build a network RTK system (VRS/MAC/FKP) with a central processing centre and NTRIP caster; provide redundant solar power and UPS, and redundant communication (fibre, 4G, VSAT); integrity monitoring and automatic alerts; long-term archive of RINEX data; regular ties to the latest ITRF and the IGS network; consider PPP-RTK services.
3. Expansion strategy: add stations to reach about 30-50 km spacing (denser around towns, GMC, hydropower and highway corridors); about 30-40 stations nationally depending on terrain. Site criteria: stable monument on bedrock or a solid building, open sky above 10-15° elevation, low multipath and radio interference, reliable power and internet, security, easy access for maintenance, away from landslide-prone slopes, and good geometry with neighbouring stations and cross-border stations.
4. Expected improvements: continuous maintenance of the national reference frame (DrukRef03) and its link to ITRF, with station velocities to monitor tectonic plate motion and deformation (Himalayan seismicity); real-time network RTK of about 1-3 cm horizontal and 3-5 cm vertical nationwide; post-processed static accuracy of millimetres; faster, cheaper surveys without local control.
5. Applications and benefits: cadastral surveys and land records; roads, bridges, hydropower and urban planning (GMC); machine control and construction; drone mapping and GIS; disaster monitoring (earthquakes, landslides, glacial lakes); agriculture and forestry; transport and navigation; scientific research and the geoid model.
6. Resource and implementation plan: phase 1 (year 1) - needs assessment, design, site selection and procurement; phase 2 (years 1-2) - installation, network software, testing; phase 3 - service launch, user registration and training. Resources: budget for equipment, monuments, communications and software (government with development partners), trained geodesists and IT staff, maintenance contracts, a data and pricing policy, and monitoring and evaluation of uptime and accuracy.', null, '[{"point": "Current limitations: sparse coverage (long baselines in mountains/ valleys), gaps in east/ north, single-frequency/ GPS-only or ageing receivers, communication/ power reliability, latency, lack of network RTK, data management, monitoring/ maintenance capacity", "marks": 4}, {"point": "Technical enhancements: multi-GNSS multi-frequency receivers/ antennas (GPS, GLONASS, Galileo, BeiDou), network RTK (VRS/MAC), NTRIP caster, redundant power (solar, UPS) and comms (fibre, 4G, VSAT), monitoring software, PPP-RTK, ITRF ties, IGS-standard monuments", "marks": 4}, {"point": "Expansion strategy: station spacing ~30-50 km (denser in valleys), coverage of all dzongkhags/ GMC/ hydropower; site criteria - stable bedrock monument, clear sky view, low multipath, power, internet, security, accessibility, geology", "marks": 5}, {"point": "Expected improvements: maintenance of DrukRef03 and link to latest ITRF, velocity/ deformation monitoring (tectonics), RTK cm accuracy nationwide, post-processed mm, faster surveys", "marks": 4}, {"point": "Applications: cadastre, infrastructure/ hydropower, construction, GMC, disaster monitoring (earthquake, landslide, GLOF), agriculture, transport, mapping/ drones, science", "marks": 4}, {"point": "Resource and implementation: phases, budget, staff/ training, partnerships, data policy/ user subscriptions, maintenance, timeline, M&E", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2025-case1', 1, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: A high-accuracy geoid model for Bhutan
Accurate height information is crucial for infrastructure development, flood modelling, engineering design and sustainable land management. The current geoid model has accuracy issues of up to 25 cm. As lead geodetic engineer at the National Land Commission Secretariat (NLCS), you are tasked with proposing a comprehensive national project to develop a high-accuracy geoid model tailored to Bhutan''s rugged terrain and geodetic infrastructure.

Write the proposal. It should cover:
- the need and significance of a local geoid model and its benefits for surveying and national development;
- data requirements and methods of acquisition;
- the methodology for geoid computation and fitting;
- validation and accuracy assessment procedures;
- implementation and applications, including institutional responsibilities and data dissemination.
Justify your approach with reference to Bhutan''s topography, CORS network and geodetic capacity. (25 marks)', 'Need and significance: GNSS gives ellipsoidal heights (h), but engineering, drainage and flood work need orthometric heights (H ≈ h - N, where N is the geoid height). With geoid errors up to 25 cm, GNSS heights cannot replace spirit levelling for roads, canals, hydropower, sewers or flood models. Bhutan''s extreme relief (100 m to over 7000 m) causes large, rapid geoid variations that global models (e.g. EGM2008) do not capture well. A local geoid of about 3-5 cm accuracy would allow fast GNSS/CORS heighting anywhere, unify the national height datum, cut survey costs and support GMC, hydropower, disaster risk management and mapping.
Data and acquisition: gravity data - existing ground gravity, new terrestrial gravity along roads, and an airborne gravity survey covering inaccessible mountains (the most practical method for Bhutan''s terrain); GNSS/levelling benchmarks (precise levelling lines tied to the national vertical datum, observed with static GNSS from CORS); a high-resolution digital elevation model (e.g. 30 m or better, LiDAR where available) for terrain corrections; satellite gravity models (GRACE/GOCE-based global models such as XGM2019/EGM2008); rock density information; cross-border data sharing.
Methodology: remove-compute-restore - remove the global model and terrain (residual terrain model) effects from gravity anomalies, grid the residuals, compute the residual geoid by Stokes integration (or least-squares collocation / KTH method), and restore the global model and terrain effects to obtain a gravimetric geoid; then fit it to GNSS/levelling points with a corrector surface to produce a hybrid geoid consistent with the national height datum and DrukRef03.
Validation: hold back independent GNSS/levelling checkpoints across different terrain; compare computed and observed N; report mean, standard deviation and RMS (target ≤5 cm, ideally 2-3 cm in populated areas); cross-validation and comparison with global models; peer review by international geodesy experts.
Implementation and applications: NLCS as lead agency with the Department of Geology and Mines, universities and international partners (e.g. US NGS, Survey of India, technical assistance projects); a 2-3 year plan with budget for airborne gravity, gravimeters, levelling and training; build staff capacity in physical geodesy. Dissemination: publish the model as grid files and an online height conversion tool, integrate it into CORS/RTK services and survey software, with documentation and regular updates. Applications: infrastructure and hydropower design, flood and GLOF modelling, drainage and irrigation, mapping, construction at GMC and scientific studies.', null, '[{"point": "Need/significance: convert GNSS ellipsoidal heights to orthometric (H = h - N), current 25 cm errors too large for engineering/ flood modelling, rugged terrain with large geoid variations, enables GNSS levelling replacing costly levelling", "marks": 5}, {"point": "Data: terrestrial/ airborne gravity (airborne essential in rugged/ inaccessible terrain), GNSS/levelling benchmarks, high-resolution DEM, global gravity models (EGM2008/ XGM), satellite gravity (GRACE/GOCE), density data, CORS heights", "marks": 5}, {"point": "Methodology: remove-compute-restore, terrain corrections (RTM), Stokes integration/ LSC, gravimetric geoid, fitting to GNSS/levelling (hybrid geoid) with corrector surface", "marks": 5}, {"point": "Validation: independent GNSS/levelling checkpoints, statistics (RMS, mean), cross-validation, comparison with global models; target 3-5 cm", "marks": 4}, {"point": "Implementation/applications: NLCS lead with partners (DGM, universities, international e.g. NGS, Survey of India), training, timeline, budget; dissemination - grid files, online converter, integration with CORS/ RTK software, regular updates; applications - infrastructure, flood/ GLOF, hydropower, mapping", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2025-case2', 1, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case III: Large-scale topographic survey of Gelephu Mindfulness City
The government urgently needs a large-scale topographic survey of Gelephu Mindfulness City (GMC), which spans 2000 square kilometres. Requirements and deliverables:
- Detailed topographic data and information at 1:1000 scale.
- Land use and land cover detail.
- Vertical and horizontal accuracy of 0.5 m.
- Contour interval of 1 m.
- The area of interest includes urban areas, agricultural land, dense vegetation and hilly terrain.
- The project must be completed within two months.

Formulate a comprehensive project proposal addressing these requirements, explaining your methodology, technical approach, strategic considerations, required resources and project deliverables. (25 marks)', 'Methodology: 2000 km² at 1:1000 within two months, including dense vegetation and hills, cannot be done by ground surveying. Use airborne LiDAR (for terrain under vegetation and 1 m contours) combined with high-resolution aerial photography (for orthophotos, features and land use), supported by GNSS ground control from CORS and targeted ground surveys (total station/RTK) in dense urban or obstructed areas. UAV surveys can supplement small priority sites.
Technical approach: (1) Planning - define AOI blocks, flight lines with 30-60% side overlap, LiDAR density of at least 8-10 points/m² (higher in forest), image GSD of about 5-10 cm, flight height and timing; obtain flight permissions. (2) Ground control - establish GCPs and independent checkpoints by static GNSS/CORS on DrukRef03 and the national grid, with heights converted using the geoid model and tied to benchmarks. (3) Data capture - parallel aircraft or sensors to meet the timeline, flying in dry-season windows. (4) Processing - LiDAR strip adjustment, classification (ground, vegetation, buildings), DTM and DSM generation, 1 m contours; aerial triangulation and true orthophoto mosaics; feature extraction (roads, buildings, rivers, utilities) at 1:1000; land use/land cover classification from imagery (object-based) with field verification. (5) QA/QC - compare with checkpoints, report horizontal and vertical RMSE to show ≤0.5 m accuracy at 95% confidence, edge-matching and topology checks.
Strategic considerations: monsoon cloud and rain (schedule early, have contingency); airspace and security clearances; rugged terrain and access for ground teams; vegetation penetration; managing very large data volumes; phasing priority zones first; coordination with GMC authority, NLCS and communities; possibly contracting an experienced international firm with local partners and knowledge transfer.
Resources: aircraft with LiDAR and medium-format camera (contracted), GNSS receivers, total stations, drones, processing workstations and software (LiDAR and photogrammetry, GIS), field and processing teams, project manager, QA staff, budget and a two-month Gantt chart (week 1 planning and control, weeks 2-5 acquisition, weeks 3-8 processing and delivery in phases).
Deliverables: 1:1000 topographic maps and GIS database, DTM and DSM, 1 m contours, orthophoto mosaics, land use/land cover maps, classified point cloud, control point register, metadata and an accuracy and QA report.', null, '[{"point": "Methodology choice: airborne LiDAR + high-resolution aerial imagery (or UAV for small areas) given 2000 km², vegetation, 2-month deadline; ground control/ CORS; field survey for gaps", "marks": 6}, {"point": "Technical approach: planning (flight lines, overlap, point density ≥ 8-10 pts/m², GSD ≤ 10 cm), GCPs/ check points, DrukRef03/ national grid, geoid, processing (classification, DTM/DSM, contours 1 m, orthophotos, feature extraction, LULC classification)", "marks": 6}, {"point": "Accuracy: QA/QC plan to meet 0.5 m H/V, checkpoints, RMSE reporting", "marks": 3}, {"point": "Strategic considerations: weather/ monsoon windows, flight permissions, security, phasing/ parallel teams, terrain, vegetation penetration, data volume, stakeholders/ community", "marks": 4}, {"point": "Resources: aircraft/ LiDAR sensor (contract), GNSS receivers, total stations, drones, software, staff, budget, timeline (Gantt)", "marks": 3}, {"point": "Deliverables: 1:1000 topo maps, DTM/DSM, contours, orthophotos, LULC map, GIS database, metadata, accuracy report", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Survey Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-survey2025-case3', 1, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'C3Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C3Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C3Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C3Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In single-base RTK, positional accuracy generally', null, 'Atmospheric and orbit errors decorrelate with distance, so RTK accuracy falls as the baseline grows (typically kept within about 10-30 km).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Depends only on the number of satellites', false, 1), ('B', 'Degrades as the distance from the base station increases', true, 2), ('C', 'Does not depend on baseline length', false, 3), ('D', 'Improves as the baseline gets longer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why must survey instruments be calibrated regularly?', null, 'Calibration finds and corrects systematic errors such as collimation, index and EDM constant errors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To increase battery life', false, 1), ('B', 'To detect and correct systematic instrument errors', true, 2), ('C', 'To change the datum', false, 3), ('D', 'To remove random errors completely', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A closed traverse has a perimeter of 2000 m and a linear misclosure of 0.20 m. Its relative precision is', null, 'Relative precision = 0.20 / 2000 = 1:10 000.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1:400', false, 1), ('B', '1:20 000', false, 2), ('C', '1:10 000', true, 3), ('D', '1:1000', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a horizontal control network, the hierarchy from highest to lowest accuracy is', null, 'Lower-order points are densified from higher-order control, so accuracy decreases down the hierarchy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tertiary → secondary → primary', false, 1), ('B', 'Primary (zero order/first order) → secondary → tertiary/detail', true, 2), ('C', 'All orders have equal accuracy', false, 3), ('D', 'Secondary → primary → tertiary', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The area of a land parcel on a map at 1:1000 scale measures 25 cm². The ground area is', null, '1 cm = 10 m, so 1 cm² = 100 m²; 25 x 100 = 2500 m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'survey-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Survey Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'survey-engineering'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '25 m²', false, 1), ('B', '250 m²', false, 2), ('C', '2500 m²', true, 3), ('D', '25 000 m²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
commit;
