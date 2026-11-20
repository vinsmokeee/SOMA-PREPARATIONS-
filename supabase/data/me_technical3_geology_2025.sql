-- ME Paper III (Technical, Geology): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'geology', 'Geology' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'geology') is null then raise exception 'unknown specialisation geology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'geology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'geology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Geology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'geology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Geology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'geology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Geology');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Basalts are composed of the following the minerals: i. Pyroxene ii. Plagioclase iii. Quartz iv. Orthoclase v. Olivine Chose the correct answer from the options given below:', null, 'Basalt is mafic: plagioclase, pyroxene and often olivine; no quartz or orthoclase.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'i, ii and iv only', false, 1), ('B', 'All of the above', false, 2), ('C', 'i, ii and v only', true, 3), ('D', 'i, ii and iii only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Strike-slip faults are examples of plate movement which is', null, 'In a strike-slip fault movement is parallel to the strike of the fault plane.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'at 45° to the strike of the fault plane', false, 1), ('B', 'perpendicular to the strike of the fault plane', false, 2), ('C', 'parallel to the strike of the fault plane', true, 3), ('D', 'None of above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Exfoliation is a form of:', null, 'Exfoliation (sheeting) is physical weathering from pressure release and thermal changes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Physical weathering', true, 1), ('B', 'Mass wasting', false, 2), ('C', 'Biochemical weathering', false, 3), ('D', 'Chemical weathering', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The study of spatial and temporal relationships between bodies of rock is called', null, 'Stratigraphy studies the spatial and temporal relationships of rock layers.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paleontology', false, 1), ('B', 'Geomorphology', false, 2), ('C', 'Stratigraphy', true, 3), ('D', 'Petrology', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common rock stratigraphic unit is', null, 'The formation is the basic (most common) lithostratigraphic unit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'group', false, 1), ('B', 'Formation', true, 2), ('C', 'bed', false, 3), ('D', 'Members', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Dinosaurs evolved and became dominant during the', null, 'Dinosaurs evolved and dominated during the Mesozoic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paleozoic', false, 1), ('B', 'Cenozoic', false, 2), ('C', 'Tertiary', false, 3), ('D', 'Mesozoic', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The geologic epoch that we currently live is called', null, 'We live in the Holocene epoch.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Miocene', false, 1), ('B', 'Pleistocene', false, 2), ('C', 'Eocene', false, 3), ('D', 'Holocene', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The valueless minerals present in an ore mineral is called?', null, 'Gangue is the valueless material in an ore.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gangue minerals', true, 1), ('B', 'Non-metallic minerals', false, 2), ('C', 'Metallic minerals', false, 3), ('D', 'Flux minerals', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ore deposits which are formed simultaneously with the enclosing rocks are called:', null, 'Syngenetic deposits form at the same time as the host rock.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Epigenetic', false, 1), ('B', 'Supergene', false, 2), ('C', 'Magmatic', false, 3), ('D', 'Syngenetic', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common ore of Lead is:', null, 'Galena (PbS) is the main lead ore.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Galena', true, 1), ('B', 'Pyrite', false, 2), ('C', 'Chromite', false, 3), ('D', 'Sphalerite', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On the basis of which content igneous rocks are classified as acidic or basic rocks?', null, 'Silica content: acidic > 63% SiO2, basic 45-52%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Magnetite', false, 1), ('B', 'Bauxite', false, 2), ('C', 'Calcium', false, 3), ('D', 'Silica', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of the volume of voids to the total volume of the materials is known as', null, 'Porosity = volume of voids / total volume.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Permeability', false, 1), ('B', 'Porosity', true, 2), ('C', 'Specific retention', false, 3), ('D', 'Conductivity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A fold in which both limbs dip away from the center is called', null, 'In an anticline both limbs dip away from the centre (hinge).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Monocline', false, 1), ('B', 'Anticline', true, 2), ('C', 'Dome', false, 3), ('D', 'Syncline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Karst topography is mainly developed in', null, 'Karst develops in soluble limestone.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Limestone', true, 1), ('B', 'Sandstone', false, 2), ('C', 'Gneiss', false, 3), ('D', 'Granite', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cuesta is best described as', null, 'A cuesta is an asymmetrical ridge: gentle dip slope and steep scarp.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'An asymmetrical ridge with a gentle and steep slope', true, 1), ('B', 'A dome-shaped hill', false, 2), ('C', 'A symmetrical ridge', false, 3), ('D', 'A volcanic cone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The angle of repose of a soil or rock mass is?', null, 'The angle of repose is the steepest stable slope of loose material.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The dip of bedding planes', false, 1), ('B', 'The angle of maximum slope at which materials remains stable', true, 2), ('C', 'None of the above', false, 3), ('D', 'The angle of internal friction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Uniaxial Compressive Strength (UCS) test is used to measure', null, 'UCS measures the compressive strength of intact rock.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Shear strength of soil', false, 1), ('B', 'Tensile strength of rock', false, 2), ('C', 'Compressive strength of intact rock', true, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following discontinuities is most critical for slope stability?', null, 'Joints dipping out of (daylighting) the slope allow planar sliding.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bedding planes dipping into the slope', false, 1), ('B', 'Joints dipping out of the slope', true, 2), ('C', 'Fractures parallel to the slope', false, 3), ('D', 'Vertical joints perpendicular to the slope', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Rock Mass Rating (RMR) system is used for', null, 'RMR classifies rock mass quality for engineering design.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measuring permeability of rock', false, 1), ('B', 'Estimating rock mass quality for engineering purposes', true, 2), ('C', 'Identifying mineral composition', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which soil is most susceptible to liquefaction during seismic shaking', null, 'Saturated loose sand liquefies most easily.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gravel', false, 1), ('B', 'Dense sand', false, 2), ('C', 'Clay', false, 3), ('D', 'Saturated loose sand', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The presence of clay minerals in soil generally', null, 'Clay minerals raise cohesion and plasticity and lower permeability.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increases cohesion and plasticity', true, 1), ('B', 'All of the above', false, 2), ('C', 'Decreases plasticity', false, 3), ('D', 'Increases permeability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A joint is', null, 'A joint is a fracture with no or negligible displacement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A fracture with displacement', false, 1), ('B', 'None of the above', false, 2), ('C', 'A fracture with no or negligible movement', true, 3), ('D', 'A type of unconformity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Main Central Thrust (MCT) in the Himalayas separates', null, 'The MCT separates the Lesser Himalaya from the Higher (Greater) Himalaya.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Tethyan Himalaya from the Higher Himalayas', false, 1), ('B', 'The Siwalik from the Lesser Himalayas', false, 2), ('C', 'The Lesser Himalayas from the Higher Himalayas', true, 3), ('D', 'The Lesser Himalayas from the Indo-Gangetic plains', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Tethyan Himalayan Sequence mainly comprises of', null, 'The Tethyan Himalaya is mainly Paleozoic-Mesozoic sedimentary rocks.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crystalline basement', false, 1), ('B', 'Paleozoic-Mesozoic sedimentary rocks', true, 2), ('C', 'Metamorphic gneiss and schist', false, 3), ('D', 'Recent fluvial deposits', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following structures is the youngest?', null, 'The Main Frontal Thrust is the youngest, southernmost active thrust.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Main Central Thrust (MCT)', false, 1), ('B', 'The South Tibetan Detachment System (STDS)', false, 2), ('C', 'The Main Boundary Thrust (MBT)', false, 3), ('D', 'The Main Frontal Thrust (MFT)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which seismic waves cannot travel through liquid?', null, 'S-waves (shear waves) cannot travel through liquids.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Love waves', false, 1), ('B', 'Rayleigh waves', false, 2), ('C', 'S-waves', true, 3), ('D', 'P-waves', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A V-shaped pattern of contour lines pointing uphill usually represents:', null, 'Contour Vs point uphill (upstream) in valleys.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Valley', true, 1), ('B', 'Cliff', false, 2), ('C', 'Fault', false, 3), ('D', 'Ridge', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'List and briefly explain three physical properties used to identify minerals in hand specimen.', '1. Hardness - resistance to scratching, measured on Mohs scale (1 talc to 10 diamond) using a fingernail (2.5), copper coin (3.5), steel knife (5.5) or glass; e.g. quartz (7) scratches glass, calcite (3) does not.
2. Cleavage and fracture - the way a mineral breaks: along flat planes of weakness (cleavage, e.g. mica in one direction, feldspar in two) or irregularly/conchoidally (fracture, e.g. quartz).
3. Lustre - how the surface reflects light: metallic (galena, pyrite) or non-metallic (vitreous quartz, pearly, silky, earthy).
(Also accepted: streak - colour of powder on unglazed porcelain, e.g. hematite red-brown; colour; crystal habit; specific gravity; magnetism; reaction with dilute HCl.)', null, '[{"point": "Three properties named (e.g. hardness, lustre, cleavage/fracture, colour/streak, crystal habit, specific gravity)", "marks": 2}, {"point": "Each briefly explained with how it is tested/example", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the Principle of Superposition? Explain its significance with appropriate diagram.', 'Principle (Nicolas Steno): in an undeformed sequence of sedimentary rocks (or lava flows), each layer is younger than the one below it and older than the one above - the oldest beds are at the bottom and the youngest at the top.
Significance: basis of relative dating and stratigraphy; lets geologists work out the order of events, correlate rock units and fossils between areas, build the geological time scale and reconstruct past environments. It must be used with way-up criteria (graded bedding, cross-bedding, mud cracks) because folding (overturned limbs) and thrust faulting can invert or repeat sequences.
Diagram: a stack of beds labelled from bottom ''Layer A - oldest'' up to ''Layer D - youngest'', with an arrow ''increasing age'' pointing downward.', null, '[{"point": "Statement: in undisturbed sequence, oldest at bottom, youngest at top", "marks": 2}, {"point": "Significance: relative dating, correlation, reconstructing geological history; exceptions (overturned folds, thrusts)", "marks": 2}, {"point": "Diagram of layered sequence labelled oldest-youngest", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the term rock cycle with a simple diagram.', 'The rock cycle is the continuous set of processes by which rocks are formed, broken down and re-formed, changing from one type to another over geological time, driven by Earth''s internal heat (plate tectonics) and surface processes (sun, water, gravity).
- Magma cools and crystallises to form igneous rocks.
- Uplift exposes rocks; weathering and erosion produce sediment, which is transported, deposited, compacted and cemented (lithification) into sedimentary rocks.
- Burial with heat and pressure changes igneous or sedimentary rocks into metamorphic rocks.
- Further heating melts rocks into magma, and the cycle continues; any rock type can also be weathered or metamorphosed again.
Diagram: three boxes (igneous, sedimentary, metamorphic) and magma/sediment, joined by labelled arrows: cooling, weathering and erosion, deposition and lithification, heat and pressure, melting.', null, '[{"point": "Definition: continuous processes transforming igneous, sedimentary, metamorphic rocks into one another", "marks": 2}, {"point": "Processes: melting, cooling/crystallisation, weathering/erosion, deposition, lithification, heat and pressure, uplift", "marks": 2}, {"point": "Labelled diagram (cycle with three rock types and arrows)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the difference between porosity and permeability in rocks.', 'Porosity is the proportion of a rock''s total volume that is empty space (pores, fractures): n = Vv / Vt x 100%. It measures how much fluid a rock can store.
Permeability is the ability of a rock to let fluids flow through it; it depends on the size, shape and connectivity of pores and fractures, not just their total volume (measured in darcies; hydraulic conductivity in m/s, from Darcy''s law).
A rock can be porous but not permeable: clay and shale have high porosity (40-60%) but tiny, poorly connected pores, so very low permeability (aquitards). Well-sorted sandstone and gravel have both high porosity and high permeability (good aquifers and reservoirs). Crystalline rocks like granite have low porosity but can be permeable where fractured.', null, '[{"point": "Porosity defined: ratio of void volume to total volume (%), storage capacity", "marks": 2}, {"point": "Permeability defined: ability to transmit fluids, depends on connected pores (Darcy)", "marks": 2}, {"point": "Contrast/example: clay high porosity low permeability; sandstone/gravel both high; fractured granite", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Introduction: Describe the objective and importance of slope stability assessment at the site. (5 marks)', 'The objective is to make a preliminary evaluation of the stability of the hillside above/near the proposed hydropower site, identify likely failure mechanisms (rockfall, shallow translational slides in the soil cover, structurally controlled failure in gneiss) and recommend stabilisation measures and further investigation. It matters because slope failure could damage the headworks, access roads, penstock or powerhouse, endanger workers and nearby communities, block the river and cause costly delays; Bhutan''s steep terrain, young Himalayan geology, earthquakes and intense monsoon rain make such failures common, as shown by last monsoon''s rockfall and shallow slides.', null, '[{"point": "Objective: evaluate stability, identify failure mechanisms, recommend measures", "marks": 2}, {"point": "Importance: safety of hydropower structures, roads, workers, communities; monsoon landslides common in Bhutan; cost of failure", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 1, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Data Collection: Summarise the geological and geotechnical data available for the site and any assumptions you made. (8 marks)', 'Data: slope angle β = 35°; bedrock para-gneiss with foliation dipping 40° towards NE; overburden 1.5 m of silty clay; water table 3 m below surface (i.e. below the soil cover in the dry season); monsoon rainfall 120 mm/day; soil c = 15 kPa, φ = 25°, γ = 18 kN/m³; reported FoS 0.86; evidence of rockfall and shallow landslides. Assumptions: the soil layer is uniform and the potential slip surface is parallel to the slope at the soil-rock contact (z = 1.5 m), so the infinite slope model applies; strength parameters are representative and effective; γw = 9.81 kN/m³; two groundwater cases are checked - dry (water table below the slip surface, u = 0) and fully saturated during heavy monsoon rain (seepage parallel to slope, m = 1); the slope face is assumed to face roughly NE (same direction as foliation dip), which needs field confirmation.', null, '[{"point": "Summary of data: slope 35°, para-gneiss foliation 40° NE, 1.5 m silty clay, water table 3 m, rainfall 120 mm/day, c 15 kPa, φ 25°, γ 18 kN/m³", "marks": 4}, {"point": "Assumptions: infinite slope, slip plane at soil/rock contact, homogeneous soil, parameters representative, slope dip direction relative to foliation, groundwater cases (dry vs saturated)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 2, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Analysis and Discussion: Calculate the factor of safety using an infinite slope model and discuss the implications of the results for slope stability, considering geological features. (15 marks)', 'Infinite slope: FoS = [c + (γ z cos²β - u) tan φ] / (γ z sin β cos β), with pore pressure u = m γw z cos²β.
γz = 18 x 1.5 = 27 kPa; cos 35° = 0.819, cos²35° = 0.671, sin 35° = 0.574; tan 25° = 0.466.
Driving stress = 27 x 0.574 x 0.819 = 12.7 kPa.
Dry (water table 3 m deep, below the slip surface, u = 0): normal stress = 27 x 0.671 = 18.1 kPa; FoS = (15 + 18.1 x 0.466) / 12.7 = (15 + 8.45) / 12.7 ≈ 1.85.
Fully saturated during monsoon (m = 1): u = 9.81 x 1.5 x 0.671 = 9.9 kPa; FoS = (15 + (18.1 - 9.9) x 0.466) / 12.7 = 18.8 / 12.7 ≈ 1.49.
If cohesion is lost when the silty clay is softened/saturated (c ≈ 0): FoS = tanφ / tanβ = 0.67 dry and about 0.30 saturated.
Discussion: with the given c and φ the soil cover is stable on paper, so the reported FoS of 0.86 does not follow from the data; it implies much lower strength (loss of cohesion, residual strength), a deeper or weaker slip surface, or a rising perched water table during 120 mm/day rain. The observed shallow landslides support the low value: rainfall infiltration saturates the silty clay, removes apparent cohesion and builds seepage pressure, and with c near zero the 35° slope is steeper than φ = 25°, so it is unstable. Geologically, foliation dipping 40° NE is steeper than the slope; if the slope faces NE the foliation does not daylight and planar sliding on foliation is less likely, but intersecting joints can form wedges and toppling, and weathered gneiss releases blocks that cause rockfall. Seismic shaking, toe cutting by the river or roads, and deforestation further reduce stability. Overall the slope should be treated as marginally stable to unstable in the monsoon.', null, '[{"point": "Correct formula: FoS = [c + (γz cos²β - u) tanφ] / (γz sinβ cosβ), u = m γw z cos²β", "marks": 3}, {"point": "Correct calculation: dry ≈ 1.85; saturated ≈ 1.49 (or c = 0 cases ≈ 0.67 / 0.30)", "marks": 4}, {"point": "Comparison with given 0.86 - explains discrepancy (loss of cohesion, deeper/weaker zones, rainfall infiltration, seepage) and that slope is marginal/unstable in the worst case", "marks": 4}, {"point": "Geological discussion: foliation vs slope (40° > 35° - not daylighting if same direction, wedges/joints), weathering of gneiss, rockfall, rainfall, seismicity, toe erosion", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 3, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Recommendation: Suggest at least three mitigation or stabilisation measures appropriate for this slope. (10 marks)', '1. Drainage - the most important measure: surface catch drains above the crest, lined berm drains, horizontal drains and sealing cracks to stop infiltration and reduce pore pressure in the monsoon. 2. Regrading and support - benching or flattening the slope where possible, toe retaining walls or gabion walls, and soil nails or rock bolts/anchors to tie the soil and weathered gneiss to sound rock. 3. Rockfall protection - scaling loose blocks, draped wire mesh or shotcrete on fractured faces, and catch fences or ditches to protect structures and roads. 4. Bioengineering - planting deep-rooted grasses, shrubs and trees with jute or coir netting to reduce erosion and strengthen the surface. 5. Monitoring and warning - rain gauges, piezometers, inclinometers and visual inspections with thresholds for alerts during the monsoon.', null, '[{"point": "Drainage: surface drains, cut-off/catch drains, horizontal/sub-horizontal drains to lower pore pressure", "marks": 3}, {"point": "Slope geometry/reinforcement: regrading/benching, soil nails, rock bolts, retaining/toe walls, gabions", "marks": 3}, {"point": "Rockfall protection: scaling, wire mesh/drapery, catch fences, ditches", "marks": 2}, {"point": "Bioengineering/vegetation and monitoring (piezometers, inclinometers, rain gauges)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 4, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Limitation of the Study: Discuss limitations related to the data and methodology used in your assessment. (5 marks)', 'Data limitations: single values of c, φ and γ without test details or variability; no borehole logs, no joint/discontinuity survey and no slope aspect, so the relation between foliation and slope is assumed; water table measured once, not during the monsoon; no seismic data; and the given FoS is inconsistent with the parameters. Method limitations: the infinite slope model only covers shallow planar slides parallel to the surface and assumes uniform soil and seepage; it ignores rockfall, wedge and toppling failure in the gneiss, deep-seated failure, seismic loading and 3D effects, so detailed investigation and analysis (limit equilibrium/numerical, kinematic analysis) are needed.', null, '[{"point": "Data: few parameters, no lab/field test details, single values, no discontinuity survey, slope orientation unknown, seasonal water levels", "marks": 3}, {"point": "Method: infinite slope is simplistic (only shallow planar failure, ignores rockfall, wedges, 3D, seismic loading)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 5, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Slope stability assessment near a proposed hydropower project
You are assigned to perform a preliminary slope stability assessment of a hillside located near a recently proposed hydropower project site. The slope has shown signs of minor rockfall and shallow landslides during the last monsoon season. Your task is to evaluate the stability conditions and provide appropriate stabilisation measures.

Data provided:
- Slope angle: 35°
- Rock type: para-gneiss with foliation dipping 40° towards NE
- Soil overburden thickness: 1.5 m, classified as silty clay
- Water table depth: 3 m below the slope surface
- Rainfall intensity during monsoon: 120 mm/day
- Cohesion (c) of soil: 15 kPa
- Internal angle of friction (φ): 25°
- Bulk unit weight of soil: 18 kN/m³
- Estimated factor of safety (FoS) from simple infinite slope model: 0.86 (unstable if FoS < 1.0)

Write a preliminary slope stability assessment report for the site based on the above data.

Conclusion: Summarise your findings and final remarks on the slope condition. (7 marks)', 'The 35° slope with 1.5 m of silty clay over para-gneiss is marginally stable in dry conditions but becomes unstable when saturated and when cohesion is lost during intense monsoon rain, consistent with the reported FoS of 0.86 and the recent rockfall and shallow landslides (the formula with the given c and φ gives higher values, so parameters must be checked). Rainfall infiltration and groundwater are the main triggers, with fractured, weathered gneiss supplying rockfall. The slope poses a risk to the hydropower project; drainage, rockfall protection and slope support should be designed before construction, supported by detailed site investigation (boreholes, lab tests, discontinuity survey) and long-term monitoring.', null, '[{"point": "Summary: slope marginally stable when dry, unstable when saturated/with cohesion loss; given FoS 0.86 indicates failure risk", "marks": 3}, {"point": "Key controls: rainfall/groundwater, weak silty clay, fractured gneiss, rockfall", "marks": 2}, {"point": "Final remarks: urgent drainage and protection, detailed investigation before construction, monitoring", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["The given FoS of 0.86 does not follow from the data (the infinite slope formula gives about 1.85 dry and 1.49 fully saturated); the model answer shows this."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case1', 6, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Introduction: Importance of geological mapping in mineral exploration. (5 marks)', 'Geological mapping is the foundation of mineral exploration: it records the distribution of rock types, structures (foliation, folds, faults, veins), alteration and mineral showings on a map. It shows how mineralisation is controlled by lithology and structure, guides geochemical and geophysical surveys and the siting of trenches and drill holes, reduces exploration cost and risk, and provides the base for 3D geological models, resource estimates and environmental planning.', null, '[{"point": "Mapping is the foundation: lithology, structure, alteration and mineral occurrences on a map", "marks": 2}, {"point": "Guides targeting: controls on mineralisation, where to sample/drill, reduces cost and risk; base for 3D models and resource estimation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 1, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Data Collection: Outline the types of data collected during field mapping and laboratory analyses. (7 marks)', 'Field data: base maps and GPS positions of outcrops; lithology and contacts; structural data (foliation strike and dip, fold axes, lineations, fault orientations and sense of movement, vein orientation and thickness); alteration types and intensity (silicification, sericite, chlorite, carbonate, gossans); visible sulphides (chalcopyrite, pyrite) and their style; photographs and sketches. Sampling: rock chip, channel and grab samples of veins and wall rock; systematic soil and stream sediment samples; drill core logs from earlier holes. Laboratory: thin-section petrography and ore microscopy, multi-element geochemical assays (Cu, Pb, Zn, Fe, Au, Ag), XRD/XRF for alteration minerals, and density measurements; results are compiled in a GIS database.', null, '[{"point": "Field: lithology, contacts, structural measurements (strike/dip, faults, veins, lineations), alteration, mineralisation, GPS locations, photos", "marks": 3}, {"point": "Sampling: rock chips, channel, soil, stream sediment", "marks": 2}, {"point": "Laboratory: petrography/thin sections, ore microscopy, geochemical assay (Cu, Pb, Zn, Au, Ag), XRD/XRF, density", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 2, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Analysis and Discussion: (i) Interpret the structural controls on mineralisation in the area. (ii) Correlate lithology, alteration zones and geochemical anomalies to identify potential target zones for further exploration. (20 marks)', '(i) Structural controls: the foliation (strike N45°E, dip 60° SE) is the main planar fabric; hydrothermal fluids would have moved along foliation planes and lithological contacts, so veins and sulphides are likely elongated NE-SW and dip SE. The NW-SE brittle faults cut across the foliation at a high angle; they are likely later conduits that tapped fluids and created open spaces (dilational jogs, fracture zones). Where these faults intersect favourable layers and foliation-parallel veins, permeability is highest and quartz-chalcopyrite-pyrite veins are expected to be thickest and richest. Competent units (quartzite, amphibolite) fracture brittlely and host veins, while schist deforms ductilely and may act as a seal.
(ii) Correlation: chalcopyrite and pyrite occur in quartz veins; drilling found alteration halos (e.g. silicification, sericite/chlorite) around these veins, showing that hydrothermal fluids altered the wall rock; the soil anomaly of elevated Cu and Fe in the south indicates weathering of sulphide-bearing rock beneath. The amphibolite (metavolcanic, Fe-Mg rich) may be the chemical trap/source for copper. Targets: Priority 1 - the southern area where the Cu-Fe soil anomaly overlaps NW-SE faults, quartz veins and mapped alteration, especially at fault-foliation intersections and contacts between amphibolite and quartzite/schist. Priority 2 - NE-SW strike extensions of known veins along the foliation and down-dip to the SE. Priority 3 - other NW-SE faults with weaker anomalies, to be tested by more sampling. The anomaly should be checked for transport down-slope so that targets are placed upslope of the peak.', null, '[{"point": "(i) Foliation N45°E/60° SE as pathway; NW-SE brittle faults cross-cutting foliation as fluid conduits; intersections and dilational sites host quartz-sulphide veins", "marks": 7}, {"point": "Competency contrast: quartzite/amphibolite brittle vs schist ductile; veins in fractures", "marks": 3}, {"point": "(ii) Correlation: chalcopyrite-pyrite veins + alteration halos + Cu-Fe soil anomaly in south", "marks": 5}, {"point": "Targets ranked: southern zone where NW-SE faults cut foliation/veins and alteration coincide with anomaly; extensions along strike", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 3, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Recommendation: Propose next steps for detailed exploration or drilling programmes. (8 marks)', 'Do detailed mapping (1:2,000-1:5,000) and infill soil and rock-chip sampling over the southern anomaly; open trenches across the anomaly and veins to expose and channel-sample mineralisation. Run ground geophysics - induced polarisation (IP)/resistivity for disseminated sulphides, magnetics and electromagnetics (EM) for massive sulphides and structures. Integrate all data in GIS to rank targets. Then drill diamond core holes on the best targets, oriented to cut the SE-dipping foliation and veins at a high angle (holes inclined towards the NW) and to test fault intersections, starting with scout holes and stepping out along strike and down-dip; log and assay the core, measure density and study metallurgy. Include environmental baseline, community consultation and permits.', null, '[{"point": "Detailed mapping (1:2,000-1:5,000), infill soil/rock sampling, trenching across anomalies", "marks": 3}, {"point": "Geophysics: IP/resistivity, magnetics, EM to detect sulphides", "marks": 2}, {"point": "Drilling: diamond drill holes oriented to cross veins/foliation (towards NW), stepped out, core logging and assays", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 4, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Limitation of the Study: Identify challenges or gaps in data that may affect exploration success. (5 marks)', 'Gaps: poor outcrop under soil and forest cover; limited structural data and uncertain fault displacement; soil anomalies that may be displaced down-slope or caused by barren pyrite (Fe); sparse sampling density; few drill holes with no information on grade, continuity or depth; no geophysics. Challenges: complex multiple deformation in metamorphic rocks makes vein geometry hard to predict; steep terrain, monsoon weather and access limits; budget; and environmental and community constraints.', null, '[{"point": "Data gaps: limited outcrop/thick soil and vegetation, few structural measurements, sparse soil sampling, limited drilling, no geophysics, unknown grades/depth", "marks": 3}, {"point": "Challenges: transported anomalies, steep terrain/access, weather, deformation complexity, cost, environmental/social constraints", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 5, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Geological mapping for base metal exploration
You are tasked to conduct a geological mapping study in an area of 10 km² of a known mineralised belt to prospect for potential base metal mineralisation. The region consists of metamorphosed volcanic and sedimentary rocks with quartz veins and sulfide mineralisation occurrences.

Data provided:
- Rock types: amphibolite, schist, quartzite and quartz veins
- Known mineral occurrences: chalcopyrite and pyrite in quartz veins
- Structural data: foliation strikes N45°E and dips 60° SE; several brittle faults trending NW-SE
- Geochemical soil anomaly data: elevated Cu and Fe concentration in the southern part of the area
- Previous drilling shows alteration zones near quartz veins

Prepare a geological mapping report.

Conclusion: Provide a concise summary of mapping results and exploration potential. (5 marks)', 'Mapping shows a metamorphosed volcano-sedimentary belt (amphibolite, schist, quartzite) with chalcopyrite-pyrite quartz veins, wall-rock alteration and a Cu-Fe soil anomaly in the south. Mineralisation appears to be controlled by NE-SW foliation and cross-cutting NW-SE faults, with the best potential at their intersections near the southern anomaly. The area has good potential for vein/shear-hosted copper (base metal) mineralisation, which should be tested by detailed sampling, geophysics and drilling.', null, '[{"point": "Summary: Cu sulphides in quartz veins controlled by foliation and NW-SE faults, with alteration and Cu-Fe anomaly in south", "marks": 3}, {"point": "Potential: good for vein/shear-hosted base metal (Cu) mineralisation; southern zone priority, needs follow-up", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Geology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-geo2025-case2', 6, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following minerals is the most resistant to chemical weathering?', null, 'In the Goldich stability series quartz, the last mineral to crystallise in Bowen''s series, is the most stable at the Earth''s surface.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quartz', true, 1), ('B', 'Biotite', false, 2), ('C', 'Calcium-rich plagioclase', false, 3), ('D', 'Olivine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a sedimentary rock?', null, 'Marble is a metamorphic rock formed from limestone or dolomite.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Conglomerate', false, 1), ('B', 'Marble', true, 2), ('C', 'Sandstone', false, 3), ('D', 'Shale', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the Himalayas, the Main Boundary Thrust (MBT) separates', null, 'The MBT carries the Lesser Himalaya over the Siwaliks; the MFT separates the Siwaliks from the plains.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'geology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Geology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'geology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Siwaliks from the Indo-Gangetic plains', false, 1), ('B', 'The Higher Himalayas from the Tethyan Himalayas', false, 2), ('C', 'The Lesser Himalayas from the Higher Himalayas', false, 3), ('D', 'The Siwaliks from the Lesser Himalayas', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
