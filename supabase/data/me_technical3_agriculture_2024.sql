-- ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'agriculture', 'Agriculture' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'agriculture') is null then raise exception 'unknown specialisation agriculture'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'agriculture');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'agriculture'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2024 Main Examination, Technical Paper III, Agriculture');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'agriculture'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2024 Main Examination, Technical Paper III, Agriculture');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'agriculture'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2024 Main Examination, Technical Paper III, Agriculture');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why is a soil pH range of 5.5 to 7.0 generally considered optimal for the availability of most nutrients to plants?', null, 'Between pH 5.5 and 7.0 most plant nutrients are in soluble, available forms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Because it reduces the leaching of nutrients', false, 1), ('B', 'Because it prevents soil compaction', false, 2), ('C', 'Because most nutrients are soluble in this pH range', true, 3), ('D', 'Because it promotes microbial activity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How does clayey soil compare to sandy and loamy soils regarding water-holding capacity?', null, 'Clay has the most fine pores and surface area, so it holds the most water.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It has a moderate water-holding capacity', false, 1), ('B', 'It has the lowest water-holding capacity', false, 2), ('C', 'It has the highest water-holding capacity', true, 3), ('D', 'It does not retain water at all', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why is drip irrigation considered the most efficient irrigation method, especially in areas with water scarcity?', null, 'Drip irrigation delivers water slowly to the root zone only, with very little evaporation or runoff.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Because it waters the entire field evenly', false, 1), ('B', 'Because it uses the least amount of water by targeting only the root zones', true, 2), ('C', 'Because it requires minimal maintenance', false, 3), ('D', 'Because it increases evaporation rates', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How does contour plowing help in preventing soil erosion on agricultural land?', null, 'Ploughing across the slope makes ridges that slow runoff and keep soil on the slope.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By allowing more water to infiltrate the soil', false, 1), ('B', 'By reducing water runoff and retaining soil on the slopes', true, 2), ('C', 'By decreasing the amount of tillage needed', false, 3), ('D', 'By increasing soil fertility', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The enzyme secreted by the embryo of seeds which induces the germination process is', null, 'The embryo releases gibberellin, which triggers the aleurone layer to make amylase for germination (gibberellin is a hormone, not an enzyme).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gibberellin', true, 1), ('B', 'Cytokinin', false, 2), ('C', 'Ethylene', false, 3), ('D', 'Auxin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why sustainable land management is considered crucial for maintaining and enhancing agricultural productivity in Bhutan?', null, 'Bhutan''s steep terrain makes soil erosion and land degradation a major risk, so sustainable land management is crucial.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Because it allows for the rapid expansion of agricultural land into forested areas', false, 1), ('B', 'Because Bhutan''s steep terrain increases the risk of soil erosion and land degradation', true, 2), ('C', 'Because it ensures that all available land is converted into monoculture plantations', false, 3), ('D', 'Because it enables the substitution of traditional farming methods with high-tech farming solutions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Aflatoxin contamination in stored maize is a major issue. Which fungus is primarily responsible for producing aflatoxins?', null, 'Aspergillus flavus (and A. parasiticus) produce aflatoxins.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aspergillus flavus', true, 1), ('B', 'Fusarium oxysporum', false, 2), ('C', 'Rhizopusstolonifer', false, 3), ('D', 'Penicillium chrysogenum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How do the significant altitudinal variations across Bhutan''s agricultural regions influence the design and implementation of irrigation systems?', null, 'Different altitudes have different water sources, slopes and climates, so a mix of irrigation methods is needed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'They allow for the uniform application of sprinkler systems across all regions', false, 1), ('B', 'They demand the integration of diverse irrigation methods tailored to specific altitude- related challenges', true, 2), ('C', 'They require the use of gravity-fed irrigation systems exclusively', false, 3), ('D', 'They necessitate the adaptation of irrigation systems to prevent waterlogging in lower regions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why is the implementation of climate-smart irrigation systems increasingly critical for the sustainability of agriculture in Bhutan?', null, 'Climate-smart irrigation reduces dependence on increasingly erratic monsoon rainfall.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To solely increase the country''s agricultural exports to neighboring countries', false, 1), ('B', 'To decrease the energy consumption of irrigation systems by transitioning to entirely solar-powered systems', false, 2), ('C', 'To replace all traditional irrigation methods that are now considered outdated', false, 3), ('D', 'To mitigate the impact of erratic monsoon patterns and reduce the dependence on seasonal rainfall', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Match the following research centers and their mandates correctly.', null, 'Yusipang - organic agriculture (National Centre for Organic Agriculture); Wengkhar - horticulture; Bajo - field crops; Samtenling - plantation crops.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific fact - an agriculture officer must confirm it against current MoAL information before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A-3; B-4; C-1; D-2', true, 1), ('B', 'A-1; B-2; C-3; D-4', false, 2), ('C', 'A-3; B-4; C-2; D-1', false, 3), ('D', 'A-2; B-3; C-4; D-1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The initial uptake of water by seed is called', null, 'The first uptake of water by a dry seed is imbibition.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hydrolysis', false, 1), ('B', 'None of the above.', false, 2), ('C', 'Hydration', false, 3), ('D', 'Imbibition', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why the Cation Exchange Capacity (CEC) of soil is considered a crucial factor in determining soil fertility?', null, 'CEC measures how many nutrient cations (Ca, Mg, K, NH4) the soil can hold and supply to plants.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It indicates the soil''s capacity to retain and supply essential nutrients to plants.', true, 1), ('B', 'It reflects the soil''s ability to support microbial life through organic matter decomposition.', false, 2), ('C', 'It measures the soil''s resistance to temperature fluctuations and climate changes.', false, 3), ('D', 'It determines the soil''s ability to drain excess water and prevent waterlogging.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the smallest order of class Insecta?', null, 'Zoraptera (spelt ''Zeroptera'' in the paper) is the smallest insect order, with only a few dozen species.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hemiptera', false, 1), ('B', 'Odonata', false, 2), ('C', 'Zoraptera', true, 3), ('D', 'Coleoptera', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'De-hulled rice grain is called', null, 'The rice grain without its husk (brown rice) is a caryopsis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Awn', false, 1), ('B', 'Tegmen', false, 2), ('C', 'Rachilla', false, 3), ('D', 'Caryopsis', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Soils with cation exchange capacity in the range of 5-15 meq.100g-1 would be classified as having', null, 'On the common scale, CEC of 5-15 meq/100 g is low (15-25 medium, above 25 high).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Very high CEC', false, 1), ('B', 'High CEC', false, 2), ('C', 'Low CEC', true, 3), ('D', 'Moderate CEC', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose a tariff is put on the import of Indian rice, the demand curve for Bhutanese-grown rice will', null, 'A tariff makes imported rice dearer, so demand for its substitute, Bhutanese rice, increases - the curve shifts right.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'move vertically up.', false, 1), ('B', 'shift to the right.', true, 2), ('C', 'shift to the left.', false, 3), ('D', 'move vertically down.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The bulk density (dry mass per unit volume) of typical agricultural soils is near', null, 'Typical agricultural soils have a bulk density of about 1.3 g/cm³ = 1300 kg/m³.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1300 kg/m3', true, 1), ('B', '3000 kg/m3', false, 2), ('C', '3500 kg/m3', false, 3), ('D', '2000 kg/m3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The interference exerted by a plant onto its neighbors by way of releasing chemical substances is termed as', null, 'Release of chemicals by a plant that affect its neighbours is allelopathy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Encephalopathy', false, 1), ('B', 'Antipathy', false, 2), ('C', 'Allelopathy', true, 3), ('D', 'Enteropathy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Bhutan, which of the following is a key component of the Integrated Pest Management (IPM) strategy employed for controlling the infestation of the fall armyworm in maize crops?', null, 'Pheromone traps for monitoring and mass trapping are a key IPM tool against fall armyworm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Implementing monoculture farming practices to reduce pest spread', false, 1), ('B', 'Introducing genetically modified maize varieties resistant to fall armyworm', false, 2), ('C', 'Applying broad-spectrum chemical insecticides to eliminate all pest species', false, 3), ('D', 'Utilizing pheromone traps to monitor and reduce pest populations', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a farmer wants to apply 100 kg nitrogen, how much urea should be use?', null, 'Urea has 46% N: 100 / 0.46 ≈ 217 kg of urea.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '217 kg', true, 1), ('B', '87 kg', false, 2), ('C', '40 kg', false, 3), ('D', '115 kg', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the essential nutrients required by plants are taken up in', null, 'Plants take up nutrients in inorganic (ionic) forms such as NO3-, NH4+, H2PO4- and K+.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inorganic form', true, 1), ('B', 'All of the above', false, 2), ('C', 'Organic form', false, 3), ('D', 'Mixture of organic and inorganic form', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How can marginal analysis be used by farmers to optimize the allocation of resources on their farms?', null, 'Marginal analysis compares the extra cost and extra revenue of one more unit of input.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By calculating the average productivity of all resources and focusing only on the most productive ones.', false, 1), ('B', 'By assessing the additional cost and revenue from using one more unit of a resource to decide whether it should be increased or decreased.', true, 2), ('C', 'By ensuring that all available resources are used to their maximum capacity regardless of their individual costs.', false, 3), ('D', 'By determining the total profit from the farm operation and dividing it equally among all resources.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best describes a major constraint faced by Bhutanese farmers in adopting organic farming practices on a large scale?', null, 'Lack of knowledge and training in organic methods is a major constraint for Bhutanese farmers.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Excessive availability of certified organic seeds and planting materials', false, 1), ('B', 'High market demand for organic produce, which exceeds local production capacities', false, 2), ('C', 'An overabundance of organic certification bodies leading to confusion and excessive costs', false, 3), ('D', 'Insufficient knowledge and training in organic farming techniques among local farmers', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a key principle of IFOAM''s "Basic Standards" for organic farming that is designed to ensure environmental and social sustainability?', null, 'IFOAM standards promote crop-livestock integration, nutrient cycling and biodiversity, and exclude GMOs and synthetic inputs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Integration of crop and livestock systems to enhance nutrient cycling and biodiversity', true, 1), ('B', 'Use of genetically modified organisms (GMOs) to enhance crop resilience', false, 2), ('C', 'Promotion of monoculture systems to increase agricultural efficiency', false, 3), ('D', 'Reliance on synthetic chemical inputs to boost crop yields and protect against pests', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Department of Agriculture, during the preparation of the 13 FYP prioritized four major crops for providing chain-link fencing to protect from wild animals, based mainly on the Human-wildlife conflict ranking and the cultivated area. Which are the four prioritized crops?', null, 'The four priority crops for chain-link fencing were paddy, maize, potato and vegetables.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific fact - an agriculture officer must confirm it against current MoAL information before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paddy, maize, quinoa, barley', false, 1), ('B', 'Paddy, potato, vegetables, buckwheat', false, 2), ('C', 'Paddy, maize, potato, vegetables', true, 3), ('D', 'Paddy, potato, vegetables, apple', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ganoderma lucidum is a popular medicinal mushroom promoted by the National Mushroom Centre for export purposes. What are the common names of this mushroom used by the Chinese and the Japanese?', null, 'Ganoderma lucidum is called Lingzhi in China and Reishi in Japan.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lingzhi in both Japan and China', false, 1), ('B', 'Lingzhi in China and Reishi in Japan', true, 2), ('C', 'None of the above', false, 3), ('D', 'Reishi in China and Lingzhi in China', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Digital agriculture is gaining momentum in our country, gradually. What do you mean by digital agriculture?', 'Digital agriculture is the use of digital technologies - mobile phones and apps, the internet, sensors and the Internet of Things, GIS and remote sensing, drones, big data, artificial intelligence and digital platforms - throughout the agricultural value chain to collect, analyse and share information, so that farmers, extension staff, traders and policymakers can make better decisions and work more efficiently.
Examples relevant to Bhutan: mobile apps and online platforms for market prices and selling produce (e-marketing); SMS and app-based advice on crops, weather, pests and diseases; digital extension services and farmer databases; sensor-based smart irrigation and greenhouses; drones for spraying and crop monitoring; GIS mapping of land and crops; traceability and farm records; and digital payments and credit.
Benefits include higher productivity and efficiency, lower costs and less labour, timely information, better market access and making farming more attractive to youth. Challenges are poor connectivity in remote areas, cost of technology, digital literacy and data management.', null, '[{"point": "Definition: use of digital technologies (ICT, mobile apps, internet, sensors, IoT, GIS/ remote sensing, drones, data analytics, AI) across the agricultural value chain to improve production, decisions, marketing and services", "marks": 2.5}, {"point": "Examples/ benefits in Bhutan: market information and e-marketing apps, advisory/ weather and pest alerts by SMS, precision farming, smart irrigation, farm records/ traceability, e-extension, digital payments; benefits - efficiency, productivity, reach youth, reduce labour; challenges - connectivity, cost, digital literacy", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
  values ('ME', 'short_answer', 'Why do you think it is important to enhance food self-sufficiency?', 'Food self-sufficiency is important for Bhutan because:
1. Food and nutrition security: Bhutan imports a large share of its rice, vegetables, meat and other foods, mainly from India. Producing more at home reduces the risk from border closures (as during COVID-19), export bans, transport disruptions, natural disasters and price rises, ensuring a stable supply of food.
2. Economy: it reduces food imports and the outflow of Indian rupees and foreign exchange, narrowing the trade deficit; it keeps money in the rural economy, raises farm incomes, creates jobs for youth and supports agro-processing and rural development, reducing poverty and rural-urban migration.
3. Health and quality: locally grown food is fresher, safer (fewer chemical residues) and supports better nutrition.
4. National and cultural values: it strengthens self-reliance and sovereignty, contributes to GNH, keeps land productive (reducing fallow land) and preserves farming traditions and biodiversity, while building resilience to climate change.', null, '[{"point": "Food and nutrition security: less vulnerability to import disruptions (border closure, COVID-19, export bans by India, price shocks), stable supply", "marks": 2}, {"point": "Economic: reduce imports and outflow of rupees/ trade deficit, income and jobs for farmers/ youth, rural development, reduce poverty, add value", "marks": 2}, {"point": "Other: national sovereignty/ GNH, healthier, safer and fresh food, preserve farming culture and land use, climate resilience", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
  values ('ME', 'short_answer', 'How can the Ministry of Agriculture and Livestock ensure that the youth stay on the farm?', 'The Ministry can keep youth in farming by making it profitable, modern and respected:
1. Profitability and markets: assured markets and buy-back schemes, minimum support prices, links to schools, hotels and exports, support for value addition and agro-processing, easy and low-interest credit, crop and livestock insurance, and access to land through land leasing and use of fallow land.
2. Modernisation and less drudgery: farm mechanisation and hiring centres, reliable irrigation, greenhouses and protected cultivation, improved seeds and breeds, digital tools, and protection from wildlife (chain-link/electric fencing).
3. Skills and support: training, internships and agri-business incubation, start-up grants, youth farming groups and cooperatives, mentoring by extension officers and successful farmers, and commercial and specialised farming opportunities.
4. Rural living and recognition: better rural infrastructure (roads, electricity, internet, services), recognition and awards for young farmers, and awareness programmes that present farming as a dignified, rewarding career.', null, '[{"point": "Make farming profitable: assured markets/ buy-back, minimum support prices, value addition, credit/ loans (low interest), insurance, land access/ land leasing, inputs and subsidies", "marks": 2}, {"point": "Reduce drudgery and modernise: farm mechanisation, irrigation, technology/ digital and commercial farming, protected cultivation, HWC fencing", "marks": 1.5}, {"point": "Skills and status: training/ incubation, youth groups/ cooperatives, start-up support, extension and mentoring, recognition, rural infrastructure and services (roads, internet), awareness to change mindset", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
  values ('ME', 'short_answer', 'What do you mean by climate-smart agriculture? How is it different from climate-resilient agriculture?', 'Climate-smart agriculture (CSA), as defined by FAO, is an integrated approach to managing farms, crops, livestock, forests and fisheries that addresses food security and climate change together through three pillars: (1) sustainably increasing agricultural productivity and incomes; (2) adapting and building resilience to climate change; and (3) reducing or removing greenhouse gas emissions where possible. Examples include improved and stress-tolerant varieties, efficient irrigation (drip, sprinkler), conservation agriculture, agroforestry, the System of Rice Intensification (less methane), integrated nutrient and manure management, and climate information services.
Climate-resilient agriculture focuses mainly on adaptation - the ability of farming systems and farmers to withstand, cope with, recover from and adapt to climate shocks and stresses such as droughts, floods, erratic rainfall, heat, pests and diseases (e.g. drought-tolerant crops, crop diversification, water harvesting, flood-proof infrastructure, insurance).
Difference: climate resilience is one of the three goals of climate-smart agriculture; CSA is broader because it also aims to increase productivity and to reduce emissions (mitigation), not only to cope with climate change.', null, '[{"point": "Climate-smart agriculture (FAO): approach with three pillars - sustainably increase productivity and incomes, adapt and build resilience to climate change, and reduce/ remove greenhouse gas emissions where possible; examples - SRI, conservation agriculture, agroforestry, efficient irrigation, improved varieties, manure management", "marks": 3}, {"point": "Difference: climate-resilient agriculture focuses mainly on adaptation - ability of farms/ systems to withstand, recover from and adapt to climate shocks (drought, floods, pests) - e.g. drought-tolerant varieties, diversification, water harvesting, insurance; CSA is broader, adding productivity and mitigation goals", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
The shortage of farm labour is a critical issue impacting agriculture in our country. Various strategies are being implemented to tackle this problem, including the import of foreign workers for seasonal farm tasks, which is presently under process.

1. How will the hiring of foreign farm labour differ from hiring construction workers? (10 marks)', 'Hiring foreign farm labour differs from hiring construction workers in several ways:
1. Nature and timing of work: farm work is seasonal and time-critical (land preparation, transplanting, weeding and harvesting must be done within short windows), whereas construction work is continuous and project-based for months or years.
2. Location: construction workers stay at one site or camp under a contractor; farm workers would be spread over many small, scattered farms in remote villages, and may need to move from farm to farm or village to village, which is harder to manage and monitor.
3. Employers and ability to pay: construction workers are hired by companies and contractors with project budgets; farm workers would be hired by many smallholder farmers or farmer groups with low and uncertain incomes, so wages, housing, food and recruitment costs need cost-sharing or support schemes.
4. Skills: farm work needs familiarity with local crops, terraces, tools and practices, and care with animals; construction requires building skills.
5. Biosecurity and social aspects: farm workers move between fields and may carry pests, diseases or seeds, so plant and animal quarantine rules apply; they live closely with rural households, so cultural and social integration matters.
6. Regulation: different permits, contracts, work duration and monitoring systems are needed, involving the agriculture ministry, labour authorities and local governments.', null, '[{"point": "Nature of work: farm work is seasonal, short and time-critical (planting, harvesting), scattered across many small farms/ remote villages; construction is continuous, project-based, at one site with contractor", "marks": 3}, {"point": "Employer and management: many small individual farmers/ groups as employers vs. contractors/ companies; housing, supervision, wages (lower farm incomes, ability to pay), contracts, movement between farms", "marks": 4}, {"point": "Skills and risks: farm work needs knowledge of local crops/ practices, biosecurity (pest/ disease, plant quarantine), interaction with households/ culture, social impact in villages; different regulation/ permits (MoAL vs MoLHR/ MoICE), monitoring", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case1', 1, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
The shortage of farm labour is a critical issue impacting agriculture in our country. Various strategies are being implemented to tackle this problem, including the import of foreign workers for seasonal farm tasks, which is presently under process.

2. If the recruitment of farm labour is approved and implemented, what are the advantages and disadvantages of this approach? (20 marks)', 'Advantages: (1) fills the critical seasonal labour gap so that planting, weeding and harvesting are done on time; (2) increases crop production and supports food self-sufficiency, especially rice and vegetables; (3) brings fallow land back into cultivation; (4) lets farmers expand and commercialise their farms and increase incomes; (5) reduces losses from late operations and unharvested crops; (6) relieves elderly farmers and women of heavy work; (7) foreign workers from agricultural backgrounds may bring skills and practices; (8) supports agro-based enterprises and the rural economy.
Disadvantages: (1) high cost for smallholders - wages, recruitment, travel, housing and food - which many cannot afford without subsidy; (2) outflow of money (rupees) from the country; (3) creates dependence on foreign workers and does not solve the root causes - youth leaving rural areas, low profitability, drudgery and wildlife damage; (4) may discourage mechanisation and the employment of local youth; (5) social, cultural and security concerns in rural communities, and the risk that workers stay illegally or move to other jobs; (6) biosecurity risks (pests, diseases, plant material); (7) difficulty in managing, supervising and monitoring workers scattered across farms, and ensuring their welfare and fair treatment; (8) seasonal demand means workers may be idle or need to be moved, complicating contracts.', null, '[{"point": "Advantages: fills seasonal labour gap, timely operations, higher production and food self-sufficiency, reduces fallow land, farmers can expand/ commercialise, income, reduces crop losses, transfer of skills", "marks": 10}, {"point": "Disadvantages: cost to farmers (wages, recruitment, housing), dependency on foreign labour and outflow of money, does not address root causes (youth migration, low profitability), social/ cultural/ security issues, biosecurity risks, management/ monitoring difficulty, may discourage mechanisation and local employment, legal/ welfare issues", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case1', 2, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
The shortage of farm labour is a critical issue impacting agriculture in our country. Various strategies are being implemented to tackle this problem, including the import of foreign workers for seasonal farm tasks, which is presently under process.

3. As a new agricultural professional, how would you address the issue of farm labour shortages differently? (20 marks)', 'As a new agricultural professional I would focus on long-term solutions within the country:
1. Farm mechanisation: promote appropriate small machines suited to Bhutan''s terraces - power tillers, mini-tillers, paddy transplanters, reapers, threshers and mini combine harvesters - through farm machinery hiring centres and cost-sharing, with farm roads, land development and terrace consolidation so machines can be used.
2. Labour-saving technologies and practices: direct seeding of rice, mulching and appropriate weed control, drip irrigation, protected cultivation, improved post-harvest equipment, and choosing high-value, less labour-intensive crops and enterprises.
3. Organising farmers: strengthen farmers'' groups and cooperatives to share labour and machinery, revive traditional labour exchange systems, and encourage group or contract farming and land leasing so that fallow land is farmed by those who want to.
4. Making farming attractive to youth and local people: ensure profitability with assured markets, value addition, credit and insurance; youth agri-entrepreneurship programmes, training and incubation; and recognition of farming as a respected career. Engage local seasonal labour such as students during vacations and volunteer programmes during peak seasons.
5. Reducing extra labour needs: control human-wildlife conflict with fencing so that night crop guarding is no longer needed; use digital tools for advice and marketing; and support research on labour-saving technologies.
Foreign labour may be used only as a short-term, supplementary measure while these structural solutions are implemented.', null, '[{"point": "Mechanisation: appropriate small machines (power tillers, transplanters, reapers, mini-harvesters), custom hiring centres, farm road/ land development, terracing for machines", "marks": 5}, {"point": "Make farming attractive to youth/ locals: profitability, markets, value addition, commercial farming, land leasing, credit, youth groups, training, recognition", "marks": 5}, {"point": "Labour-saving practices and organisation: direct seeding, herbicides/ mulching where suitable, labour sharing (traditional ''''la'''' exchange), cooperatives/ farmer groups, crop choice (less labour-intensive, high value), protected cultivation", "marks": 5}, {"point": "Reduce losses and other measures: control HWC so guarding not needed, land consolidation, digital/ precision agriculture, engaging de-suups/ students/ seasonal local labour, policy support and research", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case1', 3, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Human-wildlife conflict (HWC) has been identified as a significant issue in agriculture in Bhutan. Various mitigation strategies have been employed to protect crops from wildlife damage, including crop guarding, electric fencing and, recently, chain-link fencing. The 13th Five-Year Plan (FYP) of the Ministry of Agriculture and Livestock has allocated Nu. 5.1 billion for the installation of chain-link fencing.

1. What is meant by human-wildlife conflict, and what are the consequences of failing to address it? (20 marks)', 'Human-wildlife conflict (HWC) is the negative interaction that occurs when the needs and behaviour of wild animals overlap with those of people, causing costs to people or to wildlife: animals damage crops, kill livestock, destroy property or injure people, and people in turn harm or kill wildlife in retaliation or defence. In Bhutan, high forest cover (about 70%), strong conservation laws, farms bordering forests, fallow land and habitat changes bring farmers into frequent contact with wild boar, deer, monkeys, porcupines, bears, elephants, and tigers, leopards and wild dogs (livestock).
Consequences of not addressing it:
1. Large crop and livestock losses, reducing household food security and income and pushing families into poverty.
2. Farmers spend many nights guarding crops, losing sleep, time and labour, and risking injury from animals and exposure.
3. Injuries and loss of human lives.
4. Farmers stop cultivating fields near forests, increasing fallow land, and young people migrate to towns, worsening labour shortages and rural decline.
5. National goals of food self-sufficiency and rural development are undermined, and imports rise.
6. Conservation suffers: farmers may kill wildlife in retaliation (poisoning, snares), threatening endangered species, and public support for conservation and protected areas falls.
7. Increased government spending on compensation, relief and food imports, and social conflict between communities and conservation agencies.', null, '[{"point": "Definition: negative interactions when needs/ behaviour of wildlife and people overlap - wildlife damaging crops, killing livestock, injuring people, and people retaliating/ killing wildlife; causes in Bhutan - high forest cover, conservation success, farms near forests, habitat change, fallow land; animals wild boar, deer, monkeys, porcupine, elephant, bear, tiger/ leopard", "marks": 8}, {"point": "Consequences: crop and livestock losses, food insecurity and lower income, labour/ sleep lost to crop guarding, injuries/ deaths, fallow land and abandonment, rural-urban migration, poverty, conflict with conservation goals - retaliatory killing, loss of support for conservation, threat to endangered species, compensation costs to government, failure of self-sufficiency targets", "marks": 12}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case2', 1, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Human-wildlife conflict (HWC) has been identified as a significant issue in agriculture in Bhutan. Various mitigation strategies have been employed to protect crops from wildlife damage, including crop guarding, electric fencing and, recently, chain-link fencing. The 13th Five-Year Plan (FYP) of the Ministry of Agriculture and Livestock has allocated Nu. 5.1 billion for the installation of chain-link fencing.

2. Do you believe that the provision of chain-link fencing is the ultimate solution to mitigating crop damage caused by wild animals? Justify your answer with reasons. (20 marks)', 'I believe chain-link fencing is an effective and important tool, but not the ultimate or only solution.
Why it helps: chain-link fences are durable (lasting many years), work without electricity and solar batteries (unlike electric fences), and effectively keep out major crop raiders such as wild boar, deer, sambar and cattle; they reduce the need for night guarding, allow farmers to cultivate fallow land again and increase production and income, supporting food self-sufficiency.
Why it is not the ultimate solution:
1. It does not stop all animals - monkeys and birds climb or fly over, porcupines and wild pigs may dig under, and bears and elephants can damage fences.
2. It is very expensive (Nu. 5.1 billion in the 13th FYP), so it can cover only priority crops and areas; scattered fields are costly to fence.
3. Its effectiveness depends on maintenance and community discipline - gates left open, damage from landslides, falling trees and rust reduce protection, and responsibilities for repair must be clear.
4. Long fences can block wildlife movement and corridors, fragmenting habitats and pushing animals to unfenced fields.
5. It does not address the root causes such as habitat change, land use near forests, and the economic viability of farming.
Therefore an integrated HWC strategy is needed: chain-link fencing combined with electric fencing where suitable, community-based maintenance and ownership, land-use planning and clustering of farms, crop and livestock insurance and compensation, habitat and food management in forests, deterrents and early warning, choice of less palatable crops, research and monitoring of fence effectiveness.', null, '[{"point": "Position: effective and important but not the ultimate/ only solution", "marks": 2}, {"point": "Benefits: durable (long life), works without electricity, keeps out wild boar, deer, porcupine etc., reduces guarding, allows farming of fallow land, increases production", "marks": 6}, {"point": "Limitations: does not stop monkeys, birds, bears/ elephants (climbing/ breaking), porcupines digging under; high cost (Nu 5.1 billion) and maintenance; gates left open, damage by landslides/ falling trees; only priority crops/ areas covered; blocks wildlife movement/ corridors, fragmentation; dependency; scattered farms difficult", "marks": 7}, {"point": "Need integrated approach: combine with community management/ maintenance, electric fencing, land use planning/ clustering farms, crop insurance and compensation, habitat management, deterrents, alternative crops, research, monitoring of effectiveness", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case2', 2, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
Human-wildlife conflict (HWC) has been identified as a significant issue in agriculture in Bhutan. Various mitigation strategies have been employed to protect crops from wildlife damage, including crop guarding, electric fencing and, recently, chain-link fencing. The 13th Five-Year Plan (FYP) of the Ministry of Agriculture and Livestock has allocated Nu. 5.1 billion for the installation of chain-link fencing.

3. ''For a large agrarian country like India, crop damage by wild animals is not a significant issue.'' To what extent do you agree with this statement regarding crop damage by wild animals? Do you think Bhutan could ever make a similar statement? (10 marks)', 'I largely disagree. At the national level, crop losses to wildlife may look small compared with India''s huge total farm production, because most Indian farmland lies in plains far from forests. But crop damage is a serious problem in many states: nilgai (blue bull) and wild boar in Uttar Pradesh, Bihar, Rajasthan and Madhya Pradesh; elephants in Assam, West Bengal, Odisha, Jharkhand, Karnataka and Kerala; monkeys in Himachal Pradesh and Uttarakhand. Smallholders near forests lose large shares of their crops, elephants kill hundreds of people each year, and several states have declared some species vermin or paid large compensation. So the statement is true only at the aggregate level, not for affected farmers.
Bhutan is unlikely ever to make a similar statement. Farms are small, scattered and surrounded by forests; forest cover is about 70% (with a constitutional mandate to keep at least 60%); conservation is strong and wildlife populations are healthy and growing; and HWC is consistently ranked among farmers'' top problems, causing fallow land and rural migration. Only if integrated measures - fencing, land-use planning, insurance, compensation and commercial clustered farming - greatly reduce losses could crop damage become a minor issue in Bhutan.', null, '[{"point": "Disagree largely: in India, crop raiding by nilgai, wild boar, elephants, monkeys, deer is a serious local problem in many states, causing big losses to smallholders, deaths (elephants), and farmer protests; nationally its share of total production may be small due to huge farm area mostly away from forests, so partly agree only at aggregate level", "marks": 5}, {"point": "Bhutan: unlikely - small, fragmented farms bordering forests, about 70% forest cover, constitution mandate of 60% forest, strong conservation, high wildlife density; HWC among top farmer constraints; only possible if integrated measures (fencing, land use, insurance) greatly reduce losses", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Agriculture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-agri2024-case2', 3, null, null, (select id from public.specialisations where code = 'agriculture'), null)
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
  values ('ME', 'mcq', 'Apart from phosphorus and calcium, single super phosphate (SSP) also supplies which nutrient?', null, 'SSP contains about 16% P2O5, about 20% calcium and about 12% sulphur (from gypsum).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zinc', false, 1), ('B', 'Potassium', false, 2), ('C', 'Nitrogen', false, 3), ('D', 'Sulphur', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bordeaux mixture, a widely used fungicide, is prepared from:', null, 'Bordeaux mixture is copper sulphate neutralised with hydrated (slaked) lime.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sulphur and lime', false, 1), ('B', 'Copper sulphate and lime', true, 2), ('C', 'Zinc sulphate and lime', false, 3), ('D', 'Copper sulphate and urea', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The C:N ratio of well-decomposed (mature) compost is about:', null, 'Mature compost has a C:N ratio of about 10-20:1; fresh straw is 80-100:1.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100:1', false, 1), ('B', '60:1', false, 2), ('C', '40:1', false, 3), ('D', '10:1 to 20:1', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which method is most commonly used to multiply apple varieties true to type?', null, 'Apples do not come true from seed, so scions of the variety are grafted or budded onto rootstocks.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'agriculture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Agriculture): BCSE 2024 - check Bhutan-figure answer keys before publishing", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'agriculture'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stem cuttings', false, 1), ('B', 'Layering only', false, 2), ('C', 'Grafting or budding onto rootstocks', true, 3), ('D', 'Sowing seeds', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
