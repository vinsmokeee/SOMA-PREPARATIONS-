-- ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'geographic-information-system-gis', 'Geographic Information System (GIS)' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'gis') is null then raise exception 'unknown specialisation gis'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'gis');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'gis'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'gis'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'gis'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which spatial analysis technique is used to determine the visibility between two points?', null, 'Viewshed analysis finds what is visible from a point.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Network Analysis', false, 1), ('B', 'Overlay Analysis', false, 2), ('C', 'Viewshed Analysis', true, 3), ('D', 'Buffer Analysis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does the "Fuzzy Logic" approach in GIS deal with?', null, 'Fuzzy logic handles uncertainty and gradual class boundaries.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Handling Uncertainty in Spatial Data', true, 1), ('B', '3D Terrain Modelling', false, 2), ('C', 'Precise binary classification', false, 3), ('D', 'Network routing optimization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a key advantage of using remote sensing technology?', null, 'Remote sensing collects data from inaccessible areas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ability to gather data from inaccessible areas', true, 1), ('B', 'Inadequate temporal coverage', false, 2), ('C', 'High cost of implementation', false, 3), ('D', 'Dependency on weather conditions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The integration of Artificial Intelligence (AI) in GIS is most beneficial for', null, 'AI helps predictive spatial modelling and pattern recognition.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reducing satellite image costs', false, 1), ('B', 'Predictive spatial modeling and pattern recognition', true, 2), ('C', 'Printing paper maps faster', false, 3), ('D', 'Automating map coloring', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a primary application of LIDAR technology?', null, 'LiDAR is mainly used to map topography (high-resolution elevation).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Analyzing land cover changes', false, 1), ('B', 'Monitoring atmospheric gases', false, 2), ('C', 'Measuring sea surface temperatures', false, 3), ('D', 'Mapping topography', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term "Digital Twin" in geospatial science refers to', null, 'A digital twin is a virtual replica updated with real-time data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A drone-captured topographic model', false, 1), ('B', 'A 3D printed map', false, 2), ('C', 'A virtual replica of a physical environment updated in real-time', true, 3), ('D', 'A high-resolution satellite image', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The map projection used in DRUKREF03 grid is', null, 'DRUKREF03 grid uses a Transverse Mercator projection (Bhutan TM).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polyconic', false, 1), ('B', 'Transverse Mercator', true, 2), ('C', 'Conic', false, 3), ('D', 'Lamberts conformal conic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which satellite constellation provides high-temporal-resolution imagery for disaster monitoring?', null, 'PlanetScope''s large constellation images most land daily.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Landsat', false, 1), ('B', 'MODIS', false, 2), ('C', 'Planet Scope', true, 3), ('D', 'Sentinel-1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In photogrammetry, what is an "orthophoto"?', null, 'An orthophoto is geometrically corrected so it has uniform scale like a map.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A photo with an orthographic projection', false, 1), ('B', 'A photo corrected for geometric distortions to create a map-like image', true, 2), ('C', 'A photo taken from a satellite', false, 3), ('D', 'An aerial photo taken with a drone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which band combination helps users identify healthy vegetation?', null, 'NIR-Red-Green false colour shows healthy vegetation in red.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Red, Green, Coastal', false, 1), ('B', 'Panchromatic', false, 2), ('C', 'Red, Green, Blue', false, 3), ('D', 'Near infrared, Red, Green', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which image classification technique allows the algorithm to define classes during image classification?', null, 'Unsupervised classification lets the algorithm form the classes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Unsupervised pixel-based', true, 1), ('B', 'Supervised object-based', false, 2), ('C', 'Supervised pixel-based', false, 3), ('D', 'Deep learning object-based', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best approach for storing a large quantity of GIS dataset that need to be constantly revised, accessed, manipulated and updated by multiple users would be', null, 'An enterprise geodatabase supports large, multi-user, versioned editing.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Personal Geodatabase', false, 1), ('B', 'Raster files', false, 2), ('C', 'Enterprise Geodatabase', true, 3), ('D', 'Shape files', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which algorithm is commonly used for shortest path analysis in network datasets?', null, 'Dijkstra''s algorithm finds shortest paths.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'IDW (Inverse Distance Weighting)', false, 1), ('B', 'Moran’s I', false, 2), ('C', 'Kriging', false, 3), ('D', 'Dijkstra’s Algorithm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the process of assigning coordinates to the pixel values of an image known as?', null, 'Georeferencing assigns coordinates to image pixels.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Projection', false, 1), ('B', 'Georeferencing', true, 2), ('C', 'Digitization', false, 3), ('D', 'Resampling', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which open-source GIS software is widely used for machine learning-based spatial analysis?', null, 'QGIS with Python (e.g. scikit-learn plugins) is open source.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'QGIS with Python plugins', true, 1), ('B', 'Google Earth Pro', false, 2), ('C', 'AutoCAD Map', false, 3), ('D', 'ArcGIS Online', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best describes the concept of ''geocoding''?', null, 'Geocoding converts addresses to coordinates.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Converting addresses into geographic coordinates', true, 1), ('B', 'Projecting geographic data', false, 2), ('C', 'Collecting geographic coordinates', false, 3), ('D', 'Creating digital maps', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In disaster management, which GIS operation is typically used for evaluating flood risk areas?', null, 'Flood risk combines layers (elevation, slope, land use) by overlay.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Geostatistical analysis', false, 1), ('B', 'Overlay analysis', true, 2), ('C', 'Buffer analysis', false, 3), ('D', 'Network analysis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following techniques is commonly used for change detection in remote sensing?', null, 'Image differencing is a standard change-detection method.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Image differencing', true, 1), ('B', 'Principal Component Analysis (PCA)', false, 2), ('C', 'Image classification', false, 3), ('D', 'Spectral unmixing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following characteristic of a satellite imagery is most relevant for studying change detection over a period of time', null, 'Change detection depends on repeat coverage - temporal resolution.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', false, 1), ('B', 'Temporal resolution', true, 2), ('C', 'Spatial resolution', false, 3), ('D', 'Spectral resolution', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the role of ''metadata'' in geospatial data management?', null, 'Metadata describes content, quality, condition and other characteristics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To perform spatial analysis', false, 1), ('B', 'To describe the content, quality, condition, and other characteristics of data', true, 2), ('C', 'To visualize the spatial data', false, 3), ('D', 'To store the spatial coordinates', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is true?', null, 'Contours are discrete lines; a DEM is a continuous surface.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Contour map represents height information discretely, while DEM provides it continuously', true, 1), ('B', 'While the contour map has height information, the DEM provides elevation information', false, 2), ('C', 'A contour map is more precise than a DEM', false, 3), ('D', 'Contour is a raster dataset and DEM is a vector dataset', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term "GeoAI" refers to:', null, 'GeoAI = geographic artificial intelligence.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A new GPS satellite', false, 1), ('B', 'A type of geodatabase', false, 2), ('C', 'A drone mapping technique', false, 3), ('D', 'Geographic Artificial Intelligence for spatial problem-solving', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the role of blockchain in geospatial data management?', null, 'Blockchain gives immutable, transparent records.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reducing image resolution', false, 1), ('B', 'Creating 3D maps', false, 2), ('C', 'Ensuring data immutability and transparency', true, 3), ('D', 'Replacing GPS systems', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which emerging technology combines GIS with real-time sensor data for dynamic spatial analysis?', null, 'IoT sensors feed real-time data to GIS.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quantum GIS', false, 1), ('B', 'Augmented Reality GIS', false, 2), ('C', 'Blockchain GIS', false, 3), ('D', 'IoT-enabled GIS', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term "Spatial Data Infrastructure" (SDI) refers to:', null, 'An SDI is the framework for sharing geospatial data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A type of drone', false, 1), ('B', 'A new map projection', false, 2), ('C', 'A LiDAR sensor', false, 3), ('D', 'A framework for sharing geospatial data across organizations', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of "geofencing" in location-based services?', null, 'Geofences are virtual boundaries that trigger alerts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To encrypt geospatial data', false, 1), ('B', 'To reduce GPS battery usage', false, 2), ('C', 'To create virtual boundaries for triggering alerts', true, 3), ('D', 'To improve satellite resolution', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary purpose of a "Topology Rule" in GIS?', null, 'Topology rules enforce spatial relationships (no gaps, overlaps).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To enforce spatial relationships between features', true, 1), ('B', 'To improve GPS accuracy', false, 2), ('C', 'To compress raster data', false, 3), ('D', 'To enhance map aesthetics', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the following terms used in spatial analysis:

a) Kriging (1 mark)', 'a) Kriging: a geostatistical interpolation method that estimates unknown values from nearby samples using a model of spatial autocorrelation (semivariogram); it also gives the prediction error.', null, '[{"point": "Geostatistical interpolation using spatial autocorrelation (semivariogram), gives prediction and error", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-s1', 1, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the following terms used in spatial analysis:

b) Moran''s I (1 mark)', 'b) Moran''s I: a statistic measuring spatial autocorrelation - whether similar values cluster (positive, up to +1), are random (≈0) or dispersed (negative).', null, '[{"point": "Measure of spatial autocorrelation (clustering vs dispersion), −1 to +1", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-s1', 2, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the following terms used in spatial analysis:

c) IDW (Inverse Distance Weighting) (1 mark)', 'c) IDW: a deterministic interpolation in which each known point influences the estimate in inverse proportion to its distance (closer points weigh more).', null, '[{"point": "Interpolation where nearer points get more weight (weight ∝ 1/distanceᵖ)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-s1', 3, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the following terms used in spatial analysis:

d) Pixel (1 mark)', 'd) Pixel: the smallest cell (picture element) of a raster image, holding one value such as reflectance or a class.', null, '[{"point": "Smallest cell of a raster image holding one value", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-s1', 4, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S1d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the following terms used in spatial analysis:

e) Resolution (1 mark)', 'e) Resolution: the level of detail - spatial (ground size of a pixel), spectral (number/width of bands), temporal (revisit time) and radiometric (bit depth).', null, '[{"point": "Level of detail - spatial (cell size), spectral, temporal, radiometric", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-s1', 5, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S1e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'How do topology rules improve GIS data quality? Explain with a few examples. (5 marks)', 'Topology rules state how features must relate to each other (adjacency, connectivity, containment). Validating them finds errors automatically so they can be fixed, giving clean, consistent data for analysis. Examples: ''Must not overlap'' and ''Must not have gaps'' for land parcels or gewog boundaries (no double-counted or missing land); ''Must not have dangles'' and connectivity rules for road or river networks so routing works; ''Point must be covered by line'' for bus stops on roads; ''Boundary must be covered by'' so gewogs nest exactly inside dzongkhags.', null, '[{"point": "Topology rules define and enforce spatial relationships, find and fix errors, keep data consistent", "marks": 2}, {"point": "Examples: polygons must not overlap/ have no gaps (land parcels, dzongkhag boundaries); lines must not dangle/ must be connected (road network); points must be on lines; must be covered by", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A researcher claims NDVI values from two different satellite images (for example Sentinel-2 and Landsat 8) are not directly comparable. Justify the claim. (5 marks)', 'The claim is valid. Sentinel-2 MSI and Landsat 8 OLI have different red and near-infrared band centres and widths, so the same surface reflects differently in each; spatial resolution differs (10 m vs 30 m), mixing different land covers in a pixel; radiometric calibration, processing level (top-of-atmosphere vs surface reflectance) and atmospheric correction differ; and acquisition dates, times, sun angles and atmospheric conditions are not the same. NDVI values must be harmonised - surface reflectance, cross-sensor calibration coefficients (e.g. the Harmonized Landsat-Sentinel product) and resampling - before comparison.', null, '[{"point": "Different sensors: band wavelengths/widths (spectral response) differ", "marks": 1.5}, {"point": "Different spatial resolution (10 m vs 30 m), radiometric calibration and processing levels", "marks": 1.5}, {"point": "Different acquisition date/time, sun angle, atmosphere; need atmospheric correction and cross-calibration/harmonisation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Discuss some of the major challenges and issues of land use and land cover classification using remotely sensed satellite images. Describe and propose solutions to address such issues to generate a reliable land use and land cover map of Bhutan. (5 marks)', 'Challenges in Bhutan: persistent monsoon cloud; steep terrain causing shadows and illumination differences; small, mixed and fragmented fields producing mixed pixels; spectral confusion (e.g. shrubs vs forest, settlements vs bare land); seasonal changes; and limited ground-truth data. Solutions: multi-date cloud-free composites and radar (Sentinel-1); topographic (illumination) correction with a DEM; higher-resolution imagery and object-based or machine-learning (random forest) classification with ancillary data (DEM, slope); a standard national legend; extensive field data collection; and accuracy assessment (confusion matrix, kappa) with validation by sector agencies.', null, '[{"point": "Challenges: cloud cover, rugged terrain shadows, mixed pixels/small fields, spectral confusion between classes, lack of ground truth, seasonal variation", "marks": 2.5}, {"point": "Solutions: cloud-free composites/radar (Sentinel-1), terrain correction with DEM, higher resolution imagery, object-based/machine learning classification, field data and accuracy assessment, standard classification scheme", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
The National Land Commission (NLC), in collaboration with the Cabinet Secretariat, is implementing a National Framework for Integrated Land Use and Spatial Planning to harmonise sectoral spatial plans to support Bhutan''s 10X Economic Roadmap. As a newly appointed GIS Officer, your role is critical in ensuring cross-sectoral alignment.

1. Technical approach: How would you use GIS and remote sensing to integrate disparate land-use datasets (e.g. forestry, urban, transport) into a unified spatial plan? (20 marks)', 'Inventory all sectoral datasets (forest management units, protected areas, urban plans, roads, mining leases, agricultural land, hydropower) and their metadata. Standardise them: one coordinate system and projection (DRUKREF03 / Bhutan TM), common scale, harmonised land-use classification and attribute schema. Clean and validate geometry with topology rules. Update with recent satellite imagery and a current land use/land cover map, and derive terrain layers from a DEM. Load everything into a central enterprise geodatabase. Use overlay analysis to find overlaps and conflicts, multi-criteria suitability analysis to identify best uses, and scenario modelling for the 10X Roadmap. Produce a unified, version-controlled spatial plan and maps.', null, '[{"point": "Data inventory, standardisation: common coordinate system (DRUKREF03), scale, classification scheme, metadata", "marks": 6}, {"point": "Data cleaning, topology, updating with recent satellite imagery/LULC", "marks": 5}, {"point": "Integration in an enterprise geodatabase; overlay/conflict analysis, suitability analysis", "marks": 6}, {"point": "Outputs: unified zoning map, scenario analysis", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-case1', 1, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
The National Land Commission (NLC), in collaboration with the Cabinet Secretariat, is implementing a National Framework for Integrated Land Use and Spatial Planning to harmonise sectoral spatial plans to support Bhutan''s 10X Economic Roadmap. As a newly appointed GIS Officer, your role is critical in ensuring cross-sectoral alignment.

2. Stakeholder coordination: What strategies would you employ to resolve conflicts between sectoral plans (e.g. mining vs conservation areas)? (15 marks)', 'Map every conflict area (e.g. mining leases overlapping protected areas or biological corridors) and share it transparently. Convene an inter-agency technical working group under the NLC with sectors, local governments and communities. Apply clear decision rules based on law and policy (Constitution''s 60% forest cover, protected-area rules, GNH screening), and use multi-criteria and cost-benefit analysis to compare options, considering alternatives, buffer zones, phased use and mitigation or compensation. Use strategic environmental assessment for major plans. Unresolved issues go to the Cabinet Secretariat for decision, and agreements are recorded in the spatial plan.', null, '[{"point": "Map and quantify conflicts transparently and share with all agencies", "marks": 4}, {"point": "Inter-agency technical committee/working group under NLC; consultations including local governments and communities", "marks": 4}, {"point": "Decision rules: legal priorities (protected areas, 60% forest), trade-off and multi-criteria analysis, compensation/mitigation, EIA/SEA", "marks": 5}, {"point": "Escalate to Cabinet/policy level; document agreements", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-case1', 2, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
The National Land Commission (NLC), in collaboration with the Cabinet Secretariat, is implementing a National Framework for Integrated Land Use and Spatial Planning to harmonise sectoral spatial plans to support Bhutan''s 10X Economic Roadmap. As a newly appointed GIS Officer, your role is critical in ensuring cross-sectoral alignment.

3. Innovative solutions: Propose one digital tool or methodology (e.g. WebGIS, participatory mapping) to improve inter-agency collaboration. (15 marks)', 'A national WebGIS geoportal built on Bhutan''s spatial data infrastructure: each agency publishes and maintains its authoritative layers as web services; users view, overlay and download data in a browser; role-based access allows controlled editing; conflict-detection tools and dashboards show overlaps in real time; mobile apps let field staff and gewogs add data (participatory mapping). Benefits: one source of truth, faster coordination, transparency and less duplication. It needs data-sharing agreements, metadata standards, training and secure hosting.', null, '[{"point": "Tool proposed and described (e.g. national WebGIS / geoportal on the NSDI)", "marks": 5}, {"point": "How it works: shared layers, role-based editing, metadata, APIs, dashboards, mobile data collection", "marks": 6}, {"point": "Benefits and needs (training, data policy, security)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-case1', 3, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
To enhance health care services in the country, the Ministry of Health (MoH) wants to establish new hospitals or health care centres in the 20 Dzongkhags of Bhutan. However, the Ministry has no idea where the hospitals should be suitably located.

As a GIS professional, describe how you would use GIS to do a land suitability analysis to determine the best site for a new health care centre. Describe and explain the necessary steps and the methodology or framework that you would adopt to produce the desired output and guide informed decision-making. (50 marks)', '1. Define the objective and criteria with the Ministry and experts: serve the most under-served population; criteria such as population density and growth, distance or travel time to existing facilities, road accessibility, slope (< 15-20%), distance from hazards (floodplains, landslide and GLOF zones), land availability/ownership, access to water and electricity, and planning rules.
2. Collect and prepare data: census population (by chiwog), locations of existing hospitals and BHUs, road network, DEM (slope), hazard maps, land use/land cover, cadastral and land-ownership data, utilities. Bring all into one coordinate system (DRUKREF03), clip to each dzongkhag and convert to rasters of the same cell size.
3. Analysis: network analysis to compute travel time to the nearest facility and identify unserved populations; buffers around roads and hazards; build a constraints (exclusion) layer (protected areas, steep slopes, hazard zones, private or religious land); reclassify each factor to a common suitability scale (e.g. 1-5).
4. Weighting and overlay: use multi-criteria decision analysis with the Analytic Hierarchy Process (pairwise comparison with stakeholders, consistency check) to weight factors, then a weighted overlay to produce a suitability map; mask by constraints and rank candidate sites by population served.
5. Validate and decide: field verification of top sites, sensitivity analysis on the weights, location-allocation modelling to test coverage, and present maps, tables and a WebGIS dashboard so MoH can make an informed, transparent decision for each dzongkhag.', null, '[{"point": "Define objective and criteria with MoH/experts (population, distance to existing facilities, road access, slope, hazards, land ownership, utilities)", "marks": 10}, {"point": "Data collection and preparation: population census, health facility locations, roads, DEM, hazard maps, land use, cadastre; common projection, rasterise", "marks": 10}, {"point": "Analysis: network/accessibility analysis (travel time), buffers, constraints (exclusion) layer, reclassify/standardise factors", "marks": 10}, {"point": "Weighting and combination: AHP/MCDA weighted overlay; suitability map and ranking of sites", "marks": 10}, {"point": "Validation (field visits, sensitivity analysis), outputs and decision support for each dzongkhag", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50,
    5400, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geographic Information System (GIS)", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-gis2025-case2', 1, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'WGS 84 is best described as a', null, 'WGS 84 is the global geodetic reference system used by GPS.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'satellite sensor', false, 1), ('B', 'file format', false, 2), ('C', 'map projection', false, 3), ('D', 'geodetic datum and reference system', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the vector data model, geographic features are represented as', null, 'Vector data uses points, lines and polygons.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'spectral bands', false, 1), ('B', 'pixels in a grid', false, 2), ('C', 'points, lines and polygons', true, 3), ('D', 'only contour lines', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Normalised Difference Vegetation Index (NDVI) is calculated as', null, 'NDVI = (NIR − Red)/(NIR + Red), from −1 to +1.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geographic-information-system-gis'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geographic Information System (GIS)): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'gis'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(Green − NIR)/(Green + NIR)', false, 1), ('B', '(NIR − Red)/(NIR + Red)', true, 2), ('C', 'NIR/Red', false, 3), ('D', '(Red − NIR)/(Red + NIR)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
