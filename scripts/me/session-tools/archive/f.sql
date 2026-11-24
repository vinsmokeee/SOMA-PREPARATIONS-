-- ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'forestry', 'Forestry' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'forestry') is null then raise exception 'unknown specialisation forestry'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'forestry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'forestry'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2024 Main Examination, Technical Paper III, Forestry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'forestry'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2024 Main Examination, Technical Paper III, Forestry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'forestry'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2024 Main Examination, Technical Paper III, Forestry');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The interaction between individuals of the same species or different species at the same trophic level, in which the growth and survival of one or all species or individuals is adversely affected:', null, 'Competition is the interaction that harms the growth or survival of the individuals or species involved.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Competitive exclusion principle', false, 1), ('B', 'Competitive release', false, 2), ('C', 'Compensation point', false, 3), ('D', 'Competition', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The region of the Earth where life can be found, including soil, water, and air is termed as:', null, 'The biosphere is the part of the Earth (land, water and air) where life is found.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Biosphere reserve', false, 1), ('B', 'Biosphere,', true, 2), ('C', 'Biome,', false, 3), ('D', 'Ecosystem', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan’s protected area network comprises of National Parks, Wildlife Sanctuaries, Strict Nature Reserve, Botanical Park and Biological Corridors. The Protected Area network constituted;', null, 'The protected area network covers about 51.44% of Bhutan (note: of the country''s area, not of the forest area).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific figure - a forester must confirm it against the latest DoFPS/ NFI data before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '52 % of the forest area,', false, 1), ('B', '60 % of the forest area,', false, 2), ('C', '51.44 % of the forest area,', true, 3), ('D', '51 % of the forest area,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A successional change, usually from an existing climax community, leading to a less diverse and less structurally complex community is called;', null, 'Succession that moves away from the climax to a simpler, less diverse community is retrogressive succession.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Retrogressive succession', true, 1), ('B', 'Progressive succession', false, 2), ('C', 'All of the above', false, 3), ('D', 'Allogenic succession', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following natural polymer is used in paper making?', null, 'Paper is made from cellulose fibres.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Chitin', false, 1), ('B', 'Cellulose', true, 2), ('C', 'Elastin', false, 3), ('D', 'Keratin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The national tiger survey report revealed the increase in Tiger numbers from 103 in 2015 to 131 tigers in 2023. The significant increase in Tiger population indicates;', null, 'A rising tiger population (an apex predator) indicates healthy ecosystems with enough prey and habitat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Healthy ecosystems', true, 1), ('B', 'Increased poaching activities,', false, 2), ('C', 'Increased developmental activities,', false, 3), ('D', 'Global warming,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The natural rejection of plant organs such as leaves, flowers and fruits in order to help adapt to nutrient limitation is called:', null, 'The natural shedding of leaves, flowers and fruits is abscission.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plant disease', false, 1), ('B', 'Senescence', false, 2), ('C', 'Abscission', true, 3), ('D', 'Die-back', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Evolutionary mechanism that leads to adaptation is;', null, 'Natural selection is the mechanism that leads to adaptation; mutation, migration and drift change gene frequencies at random.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'mutation,', false, 1), ('B', 'genetic drift,', false, 2), ('C', 'migration,', false, 3), ('D', 'selection', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The forest fire damaged about 4 hectares of chirpine forest in Wangduephodrang dzongkhag. The 4 hectares of chirpine forest area is equivalent to:', null, '1 hectare = 10 000 m², so 4 ha = 40 000 m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4000 m2', false, 1), ('B', '45000 m2', false, 2), ('C', '40000 m2', true, 3), ('D', '20000 m2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Selecting good seeds is critical in raising seedlings in the nursery. Seeds contain following:', null, 'A seed contains the embryo and nutritive (storage) tissue inside a seed coat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pollen grains & sporophytes', false, 1), ('B', 'Mature sporophyte and nutritive tissue', false, 2), ('C', 'Male sporophyte and embryo', false, 3), ('D', 'Embryo and nutritive tissue', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Dey-sho (Traditional paper) is known for its durability and raw materials are locally available. The source of the raw material is bark from a shrub plant referred to as;', null, 'Dey-sho is traditionally made from the bark of Daphne species (Daphne bholua).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific figure - a forester must confirm it against the latest DoFPS/ NFI data before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Morus alba', false, 1), ('B', 'Pieris formosa', false, 2), ('C', 'Edgeworthia gardneri', false, 3), ('D', 'Daphne bholua', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A scientific instrument used to measure atmospheric pressure is:', null, 'A barometer measures atmospheric pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Barometer', true, 1), ('B', 'Hydrometer', false, 2), ('C', 'pH meter', false, 3), ('D', 'Pressure meter,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Forest Inventories are carried periodically to understand the status of forest coverage, health of the forest and its potential resources. The latest inventory result showed 2.68 million ha of forest area equivalent to;', null, 'The NFI (2023) reported 69.71% forest cover.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '71.5 % forest coverage,', false, 1), ('B', '72 % forest coverage,', false, 2), ('C', '69.71 % forest coverage', true, 3), ('D', '70.0 % forest coverage,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Starch and oxygen are the results of photosynthesis. What is the formula of plant photosynthesis?', null, 'Photosynthesis: 6CO2 + 6H2O → C6H12O6 + 6O2 (in light, with chlorophyll).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2Na+2H2O → 2NaOH + H2', false, 1), ('B', '6CO2 + 6H2O → C6H12O6+ 6O2', true, 2), ('C', 'C6H12O6+ 6O2 → 6CO2 + 6H2O', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Pinus species normally colonized the abandoned and fallow land. The colonization pattern is called;', null, 'Colonisation of abandoned or fallow land that still has soil is secondary succession.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Secondary succession', true, 1), ('B', 'Regeneration succession', false, 2), ('C', 'Inhibition', false, 3), ('D', 'Primary succession', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Royal Government of Bhutan made a commitment at the 15th Conference of Parties (COP-15) of the United Nations Framework Convention on Climate Change (UNFCCC) in 2009;', null, 'At COP15 in Copenhagen (2009) Bhutan pledged to remain carbon neutral.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'to remain carbon neutral,', true, 1), ('B', 'to reduce use of fossil fuel,', false, 2), ('C', 'to remain carbon negative,', false, 3), ('D', 'to increase forest cover', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Ramsar Convention on Wetlands of International Importance was signed in 1971 in the city of Ramsar in Iran. Bhutan declared 3 RAMSAR sites;', null, 'Bhutan''s three Ramsar sites (2012) are Gangtey-Phobji, Khotokha and Bumdeling.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Khotokha, Bumdeling & Gaytsa', false, 1), ('B', 'Gangtey-Phobji, Khotokha & Bumdeling', true, 2), ('C', 'Peling-tsho, Gangtey-Phobji, Khotokha', false, 3), ('D', 'Gantey-Phobji, Buli & Bumdeling', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan with abundant fresh water resources with per capita availability of about 94,000 cubic meters per person annually, one of the highest in the world. However, recently there are reports of water shortage in many places in Bhutan. The reasons of water shortage are;', null, 'Drying springs, flash floods with sediment and poorly designed infrastructure all cause water shortages.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', true, 1), ('B', 'Flash floods and sediments due to intense rainfall,', false, 2), ('C', 'Drying up of springs and streams,', false, 3), ('D', 'Lack of design and climate proof infrastructure,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Environmental Impact Assessment (EIA) is one of the fundamental processes of developmental projects. EIA is carried out to;', null, 'EIA identifies impacts, proposes mitigation and protects resources - all of the above.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Help protect critical resources from degradation,', false, 1), ('B', 'All of the above', true, 2), ('C', 'Reduce the impacts on the environment,', false, 3), ('D', 'Identify and propose mitigation measures,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A type of relationship where one of the organisms benefits greatly from the symbiosis. In other words, this is a one-sided symbiotic relationship;', null, 'Commensalism: one partner benefits and the other is neither helped nor harmed - a one-sided relationship.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mutualism', false, 1), ('B', 'Parasitism', false, 2), ('C', 'Symbiosis', false, 3), ('D', 'Commensalism', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan’s protected area network comprises of National Parks, Wildlife Sanctuaries, Strict Nature Reserves, Botanical Park and Biological Corridors. How many wildlife sanctuaries are established in Bhutan?', null, 'Bhutan has four wildlife sanctuaries (Bumdeling, Sakteng, Phibsoo and Jomotsangkha), so none of the options.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific figure - a forester must confirm it against the latest DoFPS/ NFI data before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', true, 1), ('B', 'Three (3),', false, 2), ('C', 'Two (2),', false, 3), ('D', 'Five (5),', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Forest fragmentation is a major issue in managing and conserving the forest resources resulting in;', null, 'Fragmentation increases human-wildlife conflict, reduces biodiversity and helps invasive species spread.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', true, 1), ('B', 'Human-wildlife conflict,', false, 2), ('C', 'Decrease biodiversity,', false, 3), ('D', 'Encroachment of invasive species,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Blue pine is a coniferous evergreen needle leaved tree native to the Himalayas. Blue pine is known by the scientific name;', null, 'Blue pine is Pinus wallichiana.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pinus roxburghii,', false, 1), ('B', 'Pinus bhutanica,', false, 2), ('C', 'Pinus wallichiana,', true, 3), ('D', 'Pinus patula', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Any disease that results in rapid decay or death of young succulent seedlings of both coniferous and broad-leaved species due to high humidity, moist soil, high organic matter and shade:', null, 'Rapid decay or death of young seedlings in damp, shaded nursery beds is damping-off, which is not listed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Needle blight,', false, 1), ('B', 'Die-back,', false, 2), ('C', 'None of the above', true, 3), ('D', 'Leaf Spot,', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The lowest altitude of Bhutan is around 100 m a.s.l. along the southern foothills and highest peak is more than 7000 m a.s.l. in the northern high Himalayas. The distribution of trees is limited by the low temperature at higher altitudes. The generally accepted tree line is:', null, 'The tree line in the Bhutan Himalaya is generally taken as about 4000 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific figure - a forester must confirm it against the latest DoFPS/ NFI data before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3500 m', false, 1), ('B', '4000 m', true, 2), ('C', '4500 m', false, 3), ('D', '5000 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What do you understand by the following:
a. Afforestation
b. Reforestation', 'a. Afforestation is the establishment of a forest, by planting trees or sowing seeds, on land that has not been under forest for a long time (commonly at least 50 years under UNFCCC definitions) or that was never forest - for example barren hillsides, degraded grazing land or mine spoil. It increases forest area and carbon storage, controls erosion and protects watersheds.
b. Reforestation is the re-establishment of forest on land that was forest until recently but was cleared by harvesting, fire, landslides or shifting cultivation - by planting, direct seeding or natural or assisted natural regeneration. In Bhutan, plantations after logging in Forest Management Units and replanting of burnt chir pine areas are reforestation.
The difference lies in the land''s history: afforestation creates new forest, reforestation restores forest that was lost.', null, '[{"point": "Afforestation: establishing forest (planting/ seeding) on land that has not been forest for a long time (at least 50 years) or never was forest; e.g. barren land, degraded pastures", "marks": 2.5}, {"point": "Reforestation: re-establishing forest on land that was recently forest but was cleared (felling, fire, landslide), by planting or natural/ assisted regeneration; difference = previous land use", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'short_answer', 'Define the following:
a. Temperate forest
b. Watershed', 'a. A temperate forest is a forest that grows in the temperate zone (mid-latitudes, or mid-altitudes in mountains) with four distinct seasons, cool to cold winters, warm summers and moderate, well-distributed rainfall. It may be broadleaved (deciduous or evergreen, e.g. oak, maple, rhododendron, walnut) or coniferous (fir, spruce, hemlock, blue pine). In Bhutan, temperate forests occur roughly between 2000 and 3500 m - cool broadleaved forest, blue pine, spruce, hemlock and mixed conifer forests.
b. A watershed (catchment) is the area of land from which all rainfall and snowmelt drain into a common stream, river, lake or outlet; its boundary is the ridge or water divide. A watershed includes its forests, soils, wetlands and settlements, and is managed as one unit to protect water quantity and quality - e.g. the forest watersheds that feed drinking water springs in Bhutan.', null, '[{"point": "Temperate forest: forest of the temperate (mid-latitude/ mid-altitude) zone with distinct seasons, cool winters, moderate rainfall; broadleaved (oak, maple) and/ or conifers (fir, hemlock, spruce, blue pine); in Bhutan about 2000-3500 m (cool broadleaved, mixed conifer)", "marks": 2.5}, {"point": "Watershed: the land area drained by a stream/ river system to a common outlet, bounded by ridges (water divide); includes forests, soils, settlements; managed as a unit for water", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'short_answer', 'What is forest thinning and why is it important in forest management?', 'Forest thinning is a silvicultural operation in which some trees are removed from an immature (usually even-aged) stand to reduce stand density, so that the remaining trees grow better; poor, diseased, suppressed or badly formed trees are removed first and the best "crop trees" are favoured. Types include low (from below), crown (from above), selective and mechanical (row) thinning.
Importance: it reduces competition for light, water and nutrients so the remaining trees grow faster in diameter and give better-quality timber in a shorter rotation; it improves stand health by removing diseased and weak trees, reducing pest and disease outbreaks; it gives an early yield of poles, posts and firewood for income and rural needs; it reduces fuel load and the risk of forest fires (important in chir pine and blue pine plantations); it lets more light reach the forest floor, improving undergrowth, regeneration and biodiversity; and it produces a more stable, wind-firm stand.', null, '[{"point": "Definition: silvicultural operation removing some trees from an immature/ even-aged stand to reduce density, leaving the best trees (crop trees); types - low, crown, mechanical, selective", "marks": 2}, {"point": "Importance: more light, water, nutrients for remaining trees - faster diameter growth, better quality timber, healthier stand (less pest/ disease), early yield/ income (poles, firewood), reduces fire risk, improves undergrowth/ biodiversity, stand stability", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'short_answer', 'Differentiate between primary succession and secondary succession.', 'Primary succession begins in an area where there was no life and no soil - bare rock, new lava, glacial moraines exposed by retreating glaciers, sand dunes or landslides scoured to bedrock. Pioneer species such as lichens and mosses colonise first and slowly build soil, followed by herbs, shrubs and trees. Because soil must be formed, it is very slow (hundreds to thousands of years).
Secondary succession begins where an existing community has been disturbed or removed but the soil, seeds, roots and organisms remain - after forest fire, logging, landslides that leave soil, or on abandoned farmland and fallow shifting-cultivation (tseri) land. Grasses and herbs come first, then shrubs and fast-growing pioneer trees (e.g. pines colonising fallow land in Bhutan), leading back towards the climax forest. It is much faster (decades) because soil and seed bank are already present.', null, '[{"point": "Primary: starts on bare area with no soil/ life (rock, lava, glacial moraine, sand dune, landslide scar to bedrock); pioneers lichens/ mosses; soil formation needed; very slow (hundreds-thousands of years)", "marks": 2.5}, {"point": "Secondary: starts where existing community disturbed but soil/ seed bank remains (fire, logging, abandoned fields, shifting cultivation); pioneers grasses, herbs, shrubs, pines; faster (decades); e.g. pine on fallow land in Bhutan", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'passage', 'Case Study I: Forest structural attributes
A forest inventory team carried out a vegetation survey in a sample plot measuring 40 m by 40 m. All individual trees within the plot with a height greater than 1.3 m (H ≥ 1.3 m) were identified, measured and recorded for total height (m) and diameter at breast height (DBH, at 1.3 m above ground). The measured attributes were analysed to understand the forest diversity, structural traits and forest types. The sample plot showed a Shannon diversity index (H'') of 3 with diverse life-forms.
The diameter class distribution is shown in the figure (Figure 1: Diameter class distribution of a typical forest type - stem density per plot against diameter class, 0 to 85 cm). Study it carefully and answer the following questions.

Q1. Study and describe the type of forest depicted by the figure above. (15 marks)', 'Reading the figure: the plot (40 m x 40 m = 0.16 ha) has about 45 stems - 12 in the 0-5 cm class, 10 in 5-10 cm, 4 in 10-15 cm, 5 in 15-20 cm, then only 1-3 stems in the larger classes up to 85 cm, with some classes (about 35, 45, 55, 65-70 and 80 cm) empty. This is roughly 280 stems per hectare, with about 22 of the 45 stems (nearly half) below 10 cm DBH and about 10 trees of 40 cm or more.
Type of forest: the diameter distribution has a reverse-J (inverse J, negative exponential) shape - many small trees and progressively fewer large trees. This is typical of an uneven-aged, multi-storeyed natural forest in which trees of all ages and sizes grow together and regeneration is continuous - not an even-aged plantation (which would show a bell-shaped curve around one diameter). Together with a high Shannon index (H'' = 3) and diverse life-forms, it indicates a species-rich, mixed (most likely broadleaved or mixed broadleaved-conifer) near-natural or old-growth forest, such as the cool or warm broadleaved forests that dominate Bhutan. The empty diameter classes suggest irregular recruitment or past disturbance (selective felling, windthrow, landslides), but overall the stand is self-maintaining.', null, '[{"point": "Reads figure: about 45 stems in 0.16 ha (≈ 280 stems/ ha); most stems in smallest classes (0-5 cm: 12, 5-10: 10) and few large trees up to 85 cm", "marks": 4}, {"point": "Reverse-J (inverse J/ negative exponential) diameter distribution", "marks": 4}, {"point": "Interpretation: uneven-aged, multi-storeyed, natural (not plantation) mixed forest - likely mixed broadleaved/ old-growth near-natural forest with continuous regeneration; with H'' 3 = species-rich", "marks": 5}, {"point": "Gaps in some classes (35, 45, 55, 65-70, 80 cm) suggest past disturbance/ selective removal or irregular recruitment", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case1', 1, null, null, (select id from public.specialisations where code = 'forestry'), '/papers/me/tech3-forest-2024-dbh.png')
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
  values ('ME', 'passage', 'Case Study I: Forest structural attributes
A forest inventory team carried out a vegetation survey in a sample plot measuring 40 m by 40 m. All individual trees within the plot with a height greater than 1.3 m (H ≥ 1.3 m) were identified, measured and recorded for total height (m) and diameter at breast height (DBH, at 1.3 m above ground). The measured attributes were analysed to understand the forest diversity, structural traits and forest types. The sample plot showed a Shannon diversity index (H'') of 3 with diverse life-forms.
The diameter class distribution is shown in the figure (Figure 1: Diameter class distribution of a typical forest type - stem density per plot against diameter class, 0 to 85 cm). Study it carefully and answer the following questions.

Q2. Explain the regeneration structure and the diversity of the sample forest plot. (15 marks)', 'Regeneration structure: the largest numbers of stems are in the smallest classes (12 stems at 0-5 cm and 10 at 5-10 cm, about 140 stems per hectare below 10 cm DBH), with fewer poles and only scattered large trees. This reverse-J pattern means there are enough young trees and saplings to replace the mature trees as they die - regeneration and recruitment are good and continuous, which is the sign of a healthy, self-sustaining uneven-aged forest. However, the numbers fall sharply after 10 cm and several middle and large classes are empty, showing irregular recruitment, which may be caused by competition and natural mortality, browsing by cattle and wildlife, past selective logging or natural disturbances. Note also that seedlings below 1.3 m were not measured, so a separate regeneration survey (seedling plots) would complete the picture.
Diversity: a Shannon index (H'') of 3 is high - values usually range from about 1.5 to 3.5 in forests - meaning many species are present and their abundances are fairly evenly distributed, with no single dominant species. Diverse life-forms (trees, shrubs, climbers, epiphytes) mean many niches and habitats for wildlife. High diversity makes the forest more resilient to pests, diseases and climate change, and gives important conservation value.', null, '[{"point": "Regeneration: abundant small stems (22 of 45 under 10 cm, ≈ 140/ ha) - good, continuous regeneration and recruitment; sufficient saplings/ poles to replace mature trees", "marks": 5}, {"point": "Some irregularity: drop at 10-15 then 15-20 and missing middle classes - recruitment gaps, mortality/ competition, possible grazing or past felling; need regeneration survey (seedlings < 1.3 m excluded)", "marks": 4}, {"point": "Diversity: H'' = 3 is high (usual range 1.5-3.5), many species with fairly even abundance, diverse life-forms (trees, shrubs, climbers) - healthy, resilient, habitat value", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case1', 2, null, null, (select id from public.specialisations where code = 'forestry'), '/papers/me/tech3-forest-2024-dbh.png')
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
  values ('ME', 'passage', 'Case Study I: Forest structural attributes
A forest inventory team carried out a vegetation survey in a sample plot measuring 40 m by 40 m. All individual trees within the plot with a height greater than 1.3 m (H ≥ 1.3 m) were identified, measured and recorded for total height (m) and diameter at breast height (DBH, at 1.3 m above ground). The measured attributes were analysed to understand the forest diversity, structural traits and forest types. The sample plot showed a Shannon diversity index (H'') of 3 with diverse life-forms.
The diameter class distribution is shown in the figure (Figure 1: Diameter class distribution of a typical forest type - stem density per plot against diameter class, 0 to 85 cm). Study it carefully and answer the following questions.

Q3. What role can this type of forest play in a mountainous country? (10 marks)', 'A natural, uneven-aged, species-rich forest is very valuable in a mountainous country like Bhutan:
- Watershed protection: the multi-layered canopy, litter and deep roots intercept rain, increase infiltration and recharge groundwater, so springs and streams flow longer in the dry season; they reduce peak floods and keep water clean for drinking, irrigation and hydropower.
- Soil and slope stability: continuous cover and mixed root systems bind soil on steep slopes, reducing erosion, landslides and sedimentation of rivers and hydropower reservoirs; such forests act as protection forests for roads and settlements.
- Biodiversity: varied structure and high diversity provide habitat and corridors for wildlife (including tigers and their prey) and conserve plant genetic resources.
- Climate: large carbon stocks make them important carbon sinks helping Bhutan remain carbon neutral, and diverse forests are more resilient to climate change.
- Livelihoods and culture: sustainable supply of firewood, timber, fodder, non-wood forest products and medicinal plants; ecotourism; and cultural and spiritual values (sacred groves, community forests).', null, '[{"point": "Watershed/ hydrological: protects springs and streams, regulates flow, recharges groundwater, reduces floods", "marks": 2.5}, {"point": "Soil and slope protection: multi-layered canopy and roots reduce erosion, landslides; protection forest on steep slopes", "marks": 2.5}, {"point": "Biodiversity and habitat (corridors, wildlife, tigers), climate change mitigation (carbon sink - carbon neutrality), climate resilience", "marks": 2.5}, {"point": "Livelihoods and economy: NWFPs, firewood, timber (sustainable), medicinal plants, ecotourism, cultural/ spiritual values, hydropower support", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case1', 3, null, null, (select id from public.specialisations where code = 'forestry'), '/papers/me/tech3-forest-2024-dbh.png')
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
  values ('ME', 'passage', 'Case Study I: Forest structural attributes
A forest inventory team carried out a vegetation survey in a sample plot measuring 40 m by 40 m. All individual trees within the plot with a height greater than 1.3 m (H ≥ 1.3 m) were identified, measured and recorded for total height (m) and diameter at breast height (DBH, at 1.3 m above ground). The measured attributes were analysed to understand the forest diversity, structural traits and forest types. The sample plot showed a Shannon diversity index (H'') of 3 with diverse life-forms.
The diameter class distribution is shown in the figure (Figure 1: Diameter class distribution of a typical forest type - stem density per plot against diameter class, 0 to 85 cm). Study it carefully and answer the following questions.

Q4. Is this type of forest potential for logging? (10 marks)', 'The forest has some potential for logging, but only through careful, sustainable selective harvesting - not clear-felling.
Why it may be logged: the reverse-J structure of an uneven-aged forest is ideal for a selection system (single-tree or group selection), in which a few mature or over-mature trees are removed periodically and the abundant younger trees grow into the gaps. There are about 10 trees of 40 cm DBH and above in the 0.16 ha plot (about 60 per hectare), some of which (especially large, mature, defective or dying trees) could be harvested.
Conditions and limits: harvesting must follow an approved Forest Management Unit (FMU) or working scheme plan based on a proper inventory, with the annual allowable cut set so that removals do not exceed growth and the J-shaped distribution is maintained; it must be outside protected areas, biological corridors, watershed and drinking-water source protection zones, and very steep or unstable slopes; low-impact methods (cable cranes, directional felling) should be used, with follow-up regeneration and monitoring. Because the plot has very high diversity (H'' = 3), many empty large-diameter classes and important watershed and habitat roles, the volume available is limited and in many cases conservation or very light selection is the better choice.', null, '[{"point": "Yes, but only selective/ sustainable logging (single-tree or group selection) - reverse-J uneven-aged stand suits selection system; no clear-felling", "marks": 3}, {"point": "Limited volume: only about 10 trees ≥ 40 cm in 0.16 ha (≈ 60/ ha), harvest mature/ over-mature and defective trees within allowable cut keeping the J-curve", "marks": 3}, {"point": "Conditions: approved FMU/ management plan, inventory, outside protected areas/ steep slopes/ watershed buffers, low-impact logging (cable cranes), regeneration and monitoring; high diversity/ watershed values may favour conservation", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case1', 4, null, null, (select id from public.specialisations where code = 'forestry'), '/papers/me/tech3-forest-2024-dbh.png')
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
  values ('ME', 'passage', 'Case Study II: Forest-water nexus
The National Forest Inventory report (2023) stated that Bhutan has a total forest coverage of 69.71%, of which 67.99% of the total forest area is broad-leaved forest and coniferous forest constitutes 32.01%. The cool broad-leaved forest is the most dominant forest type, accounting for 28.18%.
Similarly, the assessment and mapping of water sources in Bhutan (2021) collected data from 7399 water sources across the country. Of these, springs are the largest water source with 67.6% (5001), followed by streams with 25.7% (1898). The major rivers flow along the valleys.
Owing to the geographical terrain of the country, settlements are mostly located along the mountain slopes. Thus, there is a strong relationship between the forest and water sources originating from forest watersheds.

Q1. What are the factors affecting water sources in Bhutan? What mitigation measures need to be incorporated into the plan? (10 marks)', 'Factors affecting water sources: climate change - erratic, intense and shorter monsoon rainfall, longer dry spells and rising temperatures that dry up springs and reduce snow and glacier storage; degradation of forest watersheds through fire, unsustainable harvesting, grazing and land-use change (agriculture, settlements); road construction, urbanisation and mining that cut through slopes and disturb spring aquifers; landslides, flash floods and sediment that damage intakes and pipelines; rising demand and over-extraction for drinking, irrigation and industry; pollution; and weak or fragmented management of sources.
Mitigation measures in the plan: identify, map and protect critical water sources and their recharge areas (declare them watershed or water-source protection areas); restore degraded watersheds by planting native species and controlling fire and grazing; build recharge structures such as contour trenches, percolation pits and ponds; make climate-proof intakes, storage tanks and pipelines; promote rainwater harvesting and efficient water use; follow environmental safeguards and EIA for roads and projects near sources; integrated watershed management with community participation (water user groups) and payment for ecosystem services; and regular monitoring of spring discharge and water quality.', null, '[{"point": "Factors: climate change (erratic rainfall, higher temperature, glacier retreat), forest degradation/ fire/ land-use change in source watersheds, infrastructure (roads, urbanisation) disturbing springs, landslides/ sediment, over-extraction and growing demand, grazing, poor management/ pollution", "marks": 5}, {"point": "Mitigation: protect and restore spring-shed/ watersheds (declare water source protection areas, plantation, fire control), recharge ponds/ trenches, climate-proof design, rainwater harvesting, storage, efficient distribution, community management (WUAs), monitoring/ mapping, integrated watershed management plans", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case2', 1, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'passage', 'Case Study II: Forest-water nexus
The National Forest Inventory report (2023) stated that Bhutan has a total forest coverage of 69.71%, of which 67.99% of the total forest area is broad-leaved forest and coniferous forest constitutes 32.01%. The cool broad-leaved forest is the most dominant forest type, accounting for 28.18%.
Similarly, the assessment and mapping of water sources in Bhutan (2021) collected data from 7399 water sources across the country. Of these, springs are the largest water source with 67.6% (5001), followed by streams with 25.7% (1898). The major rivers flow along the valleys.
Owing to the geographical terrain of the country, settlements are mostly located along the mountain slopes. Thus, there is a strong relationship between the forest and water sources originating from forest watersheds.

Q2. High forest coverage means high evapo-transpiration ratio which ultimately leads to reduction in the ground water. Do you agree with this statement? (10 marks)', 'I only partly agree. It is true that forests use more water than grasslands or crops: their large leaf area intercepts rain (some evaporates before reaching the ground) and their deep roots transpire a lot, so in some studies afforestation - especially with fast-growing exotic species like eucalyptus or dense pine plantations - reduced total annual stream flow.
However, for Bhutan the statement is misleading overall. Natural forests build porous soils with deep litter and root channels, so rainfall infiltrates instead of running off; this recharges groundwater and releases water slowly, sustaining springs and stream baseflow during the dry season - the very springs (67.6% of water sources) that communities depend on. When forests are cleared or degraded, the soil compacts, runoff and erosion increase, floods become flashier and springs dry up in winter. Montane cloud forests also capture fog and cloud water, and forests influence local humidity and rainfall.
So the effect depends on species, age, density, climate and soil: healthy, native mixed forests are net beneficial for water regulation and quality, even if they use some water. The right approach is to manage forests for water - protect natural watershed forests, avoid water-hungry exotic plantations around sources and restore degraded land.', null, '[{"point": "Partly true: dense forests (esp. fast-growing, plantations like eucalyptus/ pines) use more water - interception and transpiration higher than grass/ crops, can reduce total runoff/ yield", "marks": 3}, {"point": "But disagree overall for Bhutan: forests increase infiltration via litter/ roots/ soil porosity, reduce surface runoff and erosion, recharge groundwater and sustain dry-season baseflow (springs); cloud/ fog interception in montane forests; regulate microclimate/ rainfall", "marks": 5}, {"point": "Conclusion: depends on species, age, climate and soil - native, healthy mixed forests are net beneficial; degraded land gives quick runoff, floods and dry springs; manage forests for water", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case2', 2, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case Study II: Forest-water nexus
The National Forest Inventory report (2023) stated that Bhutan has a total forest coverage of 69.71%, of which 67.99% of the total forest area is broad-leaved forest and coniferous forest constitutes 32.01%. The cool broad-leaved forest is the most dominant forest type, accounting for 28.18%.
Similarly, the assessment and mapping of water sources in Bhutan (2021) collected data from 7399 water sources across the country. Of these, springs are the largest water source with 67.6% (5001), followed by streams with 25.7% (1898). The major rivers flow along the valleys.
Owing to the geographical terrain of the country, settlements are mostly located along the mountain slopes. Thus, there is a strong relationship between the forest and water sources originating from forest watersheds.

Q3. The glaciers and glacier lakes store huge volume of water. Can the communities living downstream entirely depend on these water sources? Which river basin is highly vulnerable to Glacial Lake Outburst Flood? (15 marks)', 'No, downstream communities cannot depend entirely on glaciers and glacial lakes. Bhutan''s glaciers are retreating and thinning because of rising temperatures; meltwater may increase for some years but will then decline ("peak water"), and many small glaciers may disappear. Glacier melt is also seasonal - high in summer when monsoon rain is plentiful, and low in winter when water is most needed. Most Bhutanese settlements are on mountain slopes far above the main rivers flowing in deep valleys, so they rely on springs and streams fed by rainfall and forest watersheds; lifting river water to them would need costly pumping. Glacial water is often turbid and sediment-laden, and glacial lakes are a hazard rather than a safe source, because moraine dams can burst. Communities therefore need diversified and protected sources - springs, streams, rainwater harvesting and storage - with protected forest watersheds.
The river basin most vulnerable to Glacial Lake Outburst Floods is the Punatsangchhu basin (Pho Chhu and Mo Chhu), fed by the Lunana glacial lakes such as Thorthormi, Raphstreng and Luggye Tsho; the 1994 Luggye Tsho GLOF caused deaths and damage downstream in Punakha and Wangdue, including to Punakha Dzong. Other basins with potentially dangerous lakes include the Chamkharchhu and Mangdechhu. Risk reduction includes early warning systems (sensors and sirens along the Punatsangchhu), artificial lowering of lakes (Thorthormi), hazard zoning and keeping settlements and infrastructure out of flood paths.', null, '[{"point": "No - glaciers are retreating/ shrinking with warming; meltwater increases then declines (peak water), seasonal; most rural settlements are on slopes above rivers and depend on springs/ streams fed by rain and forests, not glaciers", "marks": 4}, {"point": "Rivers are in deep valleys - pumping costly; glacial water is seasonal, turbid/ sediment-laden, and glacier lakes are hazards (GLOF) not reliable supply; need diversified sources (springs, rainwater, storage)", "marks": 4}, {"point": "Most vulnerable basin: Punatsangchhu (Pho chhu/ Mo chhu) - Lunana lakes (Thorthormi, Raphstreng, Luggye); 1994 Luggye GLOF hit Punakha-Wangdue; also Chamkharchhu/ Mangdechhu basins at risk", "marks": 4}, {"point": "GLOF risk reduction: early warning systems, lake lowering (Thorthormi), hazard zoning, avoid settlements in flood plains", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case2', 3, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case Study II: Forest-water nexus
The National Forest Inventory report (2023) stated that Bhutan has a total forest coverage of 69.71%, of which 67.99% of the total forest area is broad-leaved forest and coniferous forest constitutes 32.01%. The cool broad-leaved forest is the most dominant forest type, accounting for 28.18%.
Similarly, the assessment and mapping of water sources in Bhutan (2021) collected data from 7399 water sources across the country. Of these, springs are the largest water source with 67.6% (5001), followed by streams with 25.7% (1898). The major rivers flow along the valleys.
Owing to the geographical terrain of the country, settlements are mostly located along the mountain slopes. Thus, there is a strong relationship between the forest and water sources originating from forest watersheds.

Q4. How important are the forest watersheds and their relation to monsoon rain? Name at least five major rivers of Bhutan. (15 marks)', 'Forest watersheds are vital for Bhutan: almost all drinking water springs and streams originate in forested catchments; they supply water for drinking, irrigation and industry and feed the rivers that drive hydropower, Bhutan''s largest source of revenue; they keep water clean by filtering sediment and pollutants; and they support biodiversity and livelihoods.
Relation to monsoon rain: Bhutan receives most (roughly 70-80%) of its annual rainfall from the south-west monsoon between June and September, often as intense downpours on steep slopes. Forest canopies intercept part of the rain and reduce its impact; the litter layer and root channels let water infiltrate into the soil and recharge groundwater instead of rushing off the surface. This stored water is released slowly through springs and baseflow during the dry winter months, so forests act like a sponge that spreads monsoon water through the year. Forest cover also reduces flash floods, landslides, soil erosion and sedimentation of rivers and hydropower reservoirs, and evapotranspiration from forests recycles moisture and helps sustain local rainfall. Where watersheds are degraded, monsoon rain causes floods and landslides while springs dry up in winter.
Major rivers of Bhutan (any five): Amochhu (Torsa), Wangchhu (Raidak), Punatsangchhu (Sankosh), Mangdechhu, Chamkharchhu, Kurichhu, Drangmechhu (Manas), Nyera Amachhu and Jaldhaka (Dichhu).', null, '[{"point": "Importance of forest watersheds: source of most springs/ streams, drinking water, irrigation, hydropower (main revenue), regulate flow, reduce sediment, biodiversity", "marks": 4}, {"point": "Relation to monsoon (June-September, 70-80% of annual rain): forests intercept heavy rain, increase infiltration, store water in soil/ groundwater and release slowly in dry season; reduce floods, landslides, erosion; recycle moisture/ influence local rainfall", "marks": 6}, {"point": "Five major rivers: Amochhu (Torsa), Wangchhu (Raidak), Punatsangchhu (Sankosh), Mangdechhu, Chamkharchhu, Kurichhu, Drangmechhu (Manas), Nyera Amachhu, Jaldhaka", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Forestry", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-forest2024-case2', 4, null, null, (select id from public.specialisations where code = 'forestry'), null)
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
  values ('ME', 'mcq', 'A forest that regenerates mainly from stump or root shoots after felling is called a:', null, 'Coppice forest regrows vegetatively from stumps or roots; high forest regenerates from seed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Seed orchard', false, 1), ('B', 'Plantation forest', false, 2), ('C', 'Coppice forest', true, 3), ('D', 'High forest', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Diameter at breast height (DBH) of a standing tree is normally measured at what height above ground (uphill side on slopes)?', null, 'DBH is measured at 1.3 m above ground, on the uphill side on sloping ground.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2.0 m', false, 1), ('B', '1.3 m', true, 2), ('C', '1.0 m', false, 3), ('D', '1.5 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which tissue in a tree trunk conducts water and minerals from the roots to the leaves?', null, 'Xylem (sapwood) carries water and minerals upward; phloem carries food downward.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cork', false, 1), ('B', 'Cambium', false, 2), ('C', 'Phloem', false, 3), ('D', 'Xylem', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The basal area of a tree with a DBH of 40 cm is approximately:', null, 'Basal area = πd²/4 = 3.1416 x 0.40² / 4 ≈ 0.126 m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.503 m²', false, 1), ('B', '0.126 m²', true, 2), ('C', '1.257 m²', false, 3), ('D', '0.251 m²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A Shannon diversity index (H'') value of 0 for a plot means that:', null, 'H'' = 0 when the community has a single species; H'' rises with more species and more even abundance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'forestry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Forestry): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'forestry'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All species are equally abundant', false, 1), ('B', 'Diversity is very high', false, 2), ('C', 'The plot has many rare species', false, 3), ('D', 'Only one species is present', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
commit;
