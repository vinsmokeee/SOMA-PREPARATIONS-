-- ME Paper III (Technical, Food Science): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'food-science', 'Food Science' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'food-science') is null then raise exception 'unknown specialisation food-science'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'food-science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'food-science'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Food Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'food-science'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 5, 4, null, 'BCSE 2025 Main Examination, Technical Paper III, Food Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'food-science'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Food Science');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Aseptic packaging can be defined as', null, 'Aseptic packaging: commercially sterile product filled into sterile containers aseptically and hermetically sealed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The filling of a commercial sterile product into sterile containers under aseptic conditions and sealing of the containers', false, 1), ('B', 'The filling of a commercial sterile product into a sterile containers under aseptic conditions and hermetically sealing of the containers', true, 2), ('C', 'The filling of commercial sterile product into sterile containers and hermetically sealing of the containers', false, 3), ('D', 'The filling of commercial sterile product into containers under aseptic conditions and hermetically sealing of the containers', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Monosodium glutamide is used as', null, 'MSG is a flavour enhancer.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anticaking agent', false, 1), ('B', 'Artificial sweetener', false, 2), ('C', 'Cleaning agent', false, 3), ('D', 'Flavour enhancer', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Quick bread is', null, 'Quick breads are leavened by air, steam or CO₂ from baking soda/powder, not yeast.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A cereal product made from rye flour and mimic wheat flour bread', false, 1), ('B', 'A bread which is prepared very quickly- ready to eat bread', false, 2), ('C', 'A bread which is easily digested', false, 3), ('D', 'A bread leavened with air, steam, and/ or CO2 from baking soda or baking powder', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Water content of apple and __________________ are similar', null, 'Apple (~85%) and milk (~87%) have similar water content.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maize', false, 1), ('B', 'Milk', true, 2), ('C', 'Cucumber', false, 3), ('D', 'Wheat', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sauerkraut is the __________________', null, 'Sauerkraut is fermented cabbage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fermented carrot.', false, 1), ('B', 'All of the above.', false, 2), ('C', 'Fermented cabbage.', true, 3), ('D', 'Fermented radish.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statement is/are correct?', null, 'Class I (natural) preservatives such as salt and sugar have no quantity limit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Class I preservatives are those which have no limit quantity to be added', true, 1), ('B', 'Class I preservatives are those which are prepared under hygienic conditions', false, 2), ('C', 'Class I preservatives are those which are used prior to other ingredients', false, 3), ('D', 'Class I preservatives are those which are used for preservation of foods served in five-star hotels', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Psychrophiles would be expected to grow', null, 'Psychrophiles grow at refrigeration temperatures.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'At low pH', false, 1), ('B', 'At refrigeration temperature', true, 2), ('C', 'On the human body', false, 3), ('D', 'In hot springs', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bread mold is', null, 'Black bread mould: Rhizopus stolonifer.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Monilla sitophilla', false, 1), ('B', 'Penicillium notatum', false, 2), ('C', 'Aspergillus niger', false, 3), ('D', 'Rhizopus stolonifer', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '_________________ are most common causes of spoilage of fruits and vegetables', null, 'Moulds are the commonest spoilers of fruits and vegetables.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Yeasts', false, 1), ('B', 'Molds', true, 2), ('C', 'Bacteria', false, 3), ('D', 'Viruses', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Egg quality is manually checked by seeing it through a lamp, it is called', null, 'Candling.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lightening', false, 1), ('B', 'Lamping', false, 2), ('C', 'Viewing', false, 3), ('D', 'Candling', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Preservation of foods in sealed containers and which usually implies heat treatment as the principal factor in prevention of spoilage is called', null, 'Canning: sealed containers with heat treatment.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Simmering', false, 1), ('B', 'Aseptic packaging', false, 2), ('C', 'Canning', true, 3), ('D', 'Cold sterilization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The separation of solids from suspension in liquid by gravity alone is called as', null, 'Settling by gravity is sedimentation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Centrifugation', false, 1), ('B', 'None of the above', false, 2), ('C', 'Sedimentation', true, 3), ('D', 'Flocculation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In crystallization', null, 'Crystallisation transfers mass from liquid to solid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mass transfer occurs from liquid to solid phase', true, 1), ('B', 'Mass transfer occurs from solid to liquid phase', false, 2), ('C', 'Mass transfer occurs from solid to solid phase', false, 3), ('D', 'Mass transfer occurs from liquid to liquid phase', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which dryer is commonly used for wet filter cakes and wet lumpy solids', null, 'Tray dryers suit wet filter cakes and lumpy solids.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Roller dryer', false, 1), ('B', 'Drum dryer', false, 2), ('C', 'Spray dryer', false, 3), ('D', 'Tray dryer', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In case of oil in water emulsion, oil acts as', null, 'Oil is the dispersed phase in an oil-in-water emulsion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dispersed phase', true, 1), ('B', 'Dispersing medium', false, 2), ('C', 'Stabilizer', false, 3), ('D', 'Emulsifier', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A good refrigerant should have', null, 'A good refrigerant has a high coefficient of performance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Low conductivity', false, 1), ('B', 'High coefficient of performance', true, 2), ('C', 'Low boiling point', false, 3), ('D', 'High specific volume', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Hurdle technology consists of', null, 'Hurdle technology combines preservation factors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mixture of different preservation technique', true, 1), ('B', 'Using irradiation for increasing shelf life of meat', false, 2), ('C', 'Mixture of different ingredients to form a uniform quality product', false, 3), ('D', 'None of above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sterilization of high acid food is generally done in', null, 'High-acid foods (pH < 4.6) are processed in boiling water.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Retort', false, 1), ('B', 'Superheated steam', false, 2), ('C', 'Boiling water', true, 3), ('D', 'Supercooled water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Phosphatase test is for the detection of', null, 'Phosphatase test checks pasteurisation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Adequacy of churning', false, 1), ('B', 'Adequacy of sterilization', false, 2), ('C', 'Degree of adulteration of milk by calcium phosphate', false, 3), ('D', 'Adequacy of pasteurization', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statement is correct on rigor mortis', null, 'Greater rigor (cold shortening) gives tougher meat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The lesser the degree of rigor mortis, the tougher the meat', false, 1), ('B', 'There is no effect of rigor mortis on the texture of meat', false, 2), ('C', 'The greater degree of rigor mortis, the tougher the meat', true, 3), ('D', 'The greater the degree of rigor mortis, the softer the meat', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Saffron is obtained from', null, 'Saffron is the stigma of the crocus flower.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flower', true, 1), ('B', 'Fruit', false, 2), ('C', 'Root', false, 3), ('D', 'Seed', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In food packaging, lamination is', null, 'Lamination combines materials into one web by adhesive, solvent or heat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The method of wrapping the food article with certain packaging material and sorting them at ambient temperature', false, 1), ('B', 'Combination of two or more materials into a single homogeneous packaging web by means of adhesive, solvent or heat', true, 2), ('C', 'Coating of zinc on the surface of iron to prevent it from rusting', false, 3), ('D', 'A type of packaging where the material used for packaging is made from substance obtained from the middle of lamella of cell wall', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of these is NOT considered a food quality attribute?', null, 'Packaging design is not a food quality attribute.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Appearance (Size, shape, Colour)', false, 1), ('B', 'Texture', false, 2), ('C', 'Packaging design', true, 3), ('D', 'Nutritional content', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'HACCP defined as codex:', null, 'Codex: HACCP identifies, evaluates and controls significant hazards.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Identifies and evaluates hazards', false, 1), ('B', 'Identifies, evaluates and controls hazards', true, 2), ('C', 'Identifies and controls hazards', false, 3), ('D', 'Identifies and controls hazards after verification', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Safety precaution and environment safety guideline is given under?', null, 'ISO 14001 is the environmental management standard.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ISO 14001', true, 1), ('B', 'ISO 18000', false, 2), ('C', 'ISO 23000', false, 3), ('D', 'ISO 9001', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Codex Alimentarius covers food standards for', null, 'Codex covers raw, semi-processed and processed foods.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Only raw foods', false, 1), ('B', 'Only processed foods', false, 2), ('C', 'Only foods that are traded internationally', false, 3), ('D', 'Processed, semi-processed, and raw foods', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '____________ are code of good practices that comprises the fundamental principles, procedures, and means needed for safe food production', null, 'GMP: good practices with the principles, procedures and means for safe food production.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of these', false, 1), ('B', 'GMP', true, 2), ('C', 'HACCP', false, 3), ('D', 'PRP', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Basic objective of Consumer Act is', null, 'The Consumer Protection Act protects all these rights.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', true, 1), ('B', 'To provide the consumers their right to file a complaint against any trader who is charging them more than the price displayed on the package of goods', false, 2), ('C', 'To provide the consumers their right to buy the goods anywhere in Bhutan', false, 3), ('D', 'To provide the consumers their right to choose their products of their choice', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define enzymatic browning reactions in fruits and vegetables. What are the ways to prevent enzymatic browning in fruits and vegetables? (2+2 = 4 marks)', 'Enzymatic browning is the browning of cut or bruised fruits and vegetables (apple, potato, banana) when the enzyme polyphenol oxidase, in the presence of oxygen, oxidises phenolic compounds to quinones, which polymerise into brown melanin pigments. Prevention: heat inactivation by blanching; lowering pH with citric or ascorbic acid (ascorbic acid also reduces quinones); sulphites; dipping in salt or sugar solution; excluding oxygen (water immersion, vacuum or modified-atmosphere packaging); and refrigeration.', null, '[{"point": "Definition: polyphenol oxidase oxidises phenols to quinones that polymerise to brown melanins when tissue is cut/bruised and exposed to oxygen", "marks": 2}, {"point": "Prevention: blanching, acidulants (citric/ascorbic acid), sulphites, salt/sugar solutions, excluding oxygen, cold storage", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define amylose and amylopectin. What is the difference between amylose and amylopectin? (2+2 = 4 marks)', 'Amylose is the linear fraction of starch - glucose units joined by α-1,4 glycosidic bonds; amylopectin is the branched fraction - α-1,4 chains with α-1,6 branch points every 20-30 units. Differences: amylose is linear, about 20-30% of starch, gives a deep blue colour with iodine, forms firm gels and retrogrades easily (staling); amylopectin is branched, about 70-80%, gives red-purple with iodine, gives viscous, sticky pastes and retrogrades less (waxy rice is almost all amylopectin).', null, '[{"point": "Amylose: linear α-1,4 glucose polymer; amylopectin: branched α-1,4 with α-1,6 branches", "marks": 2}, {"point": "Differences: structure, proportion (20-30% vs 70-80%), iodine colour (blue vs red-purple), retrogradation/gel vs viscosity, solubility", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the effect of temperature on the rate of an enzyme-catalysed reaction with a graphical representation. (2+2 = 4 marks)', 'As temperature rises, molecules move faster and collide more often, so the reaction rate increases (roughly doubling per 10 °C) up to an optimum temperature (about 35-40 °C for many enzymes). Above the optimum, the enzyme''s three-dimensional structure and active site are denatured, so the rate falls sharply until activity stops. At low temperatures enzymes are inactive but not destroyed. Graph: rate (y-axis) vs temperature (x-axis) - a curve rising gradually to a peak at the optimum, then dropping steeply (bell shape, skewed to the right).', null, '[{"point": "Rate rises with temperature up to an optimum (more collisions)", "marks": 2}, {"point": "Above optimum the enzyme denatures and rate falls sharply; bell-shaped graph with optimum (≈ 35-40 °C for many)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define jelly and marmalade. List the differences between these two products. (2+2 = 4 marks)', 'Jelly is a clear, sparkling, semi-solid product made by boiling strained fruit juice with sugar, pectin and acid until it sets, firm enough to hold its shape. Marmalade is a fruit jelly (usually citrus such as orange) in which slices or shreds of peel are suspended. Differences: jelly uses only clear juice and contains no fruit pieces, while marmalade contains peel shreds; jelly can be made from any pectin-rich fruit, marmalade mainly from citrus; marmalade has a slightly bitter flavour and less transparent appearance.', null, '[{"point": "Jelly: clear, set product from strained fruit juice, sugar, pectin and acid", "marks": 1}, {"point": "Marmalade: citrus jelly with suspended shreds of peel", "marks": 1}, {"point": "Differences: raw material (any fruit juice vs citrus), clarity, peel shreds present, bitterness/texture", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are the four core principles of canning? (4 marks)', '1. Heat processing to destroy spoilage and pathogenic micro-organisms (commercial sterility; low-acid foods in a retort at 121 °C to kill Clostridium botulinum spores). 2. Inactivation of enzymes that would cause quality changes. 3. Hermetic sealing of the container to prevent recontamination. 4. Exhausting air to create a vacuum (preventing oxidation and can corrosion), followed by rapid cooling and proper storage.', null, '[{"point": "Destroy microorganisms by heat (sterilisation/commercial sterility)", "marks": 1}, {"point": "Inactivate enzymes", "marks": 1}, {"point": "Hermetic sealing to prevent recontamination", "marks": 1}, {"point": "Exclusion of air/vacuum and proper cooling and storage", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I (food science and technology)

1. Write the differences between the following from the perspective of food science and technology: (i) thermoplastics and thermosets in the food industry; (ii) climacteric and non-climacteric fruits; (iii) Maillard reaction and caramelisation; (iv) lye peeling and brining; (v) drying and dehydration. (5 × 3 = 15 marks) (15 marks)', '(i) Thermoplastics (polyethylene, polypropylene, PET) soften when heated and can be re-moulded and recycled - used for films, bottles and trays; thermosets (melamine, phenolic and epoxy resins) cure into a permanent rigid network that does not melt - used for heat-resistant tableware and can lacquers.
(ii) Climacteric fruits (mango, banana, apple, tomato, papaya) show a rise in respiration and ethylene at ripening and can ripen after harvest; non-climacteric fruits (citrus, grape, pineapple, strawberry) do not and must be harvested ripe.
(iii) Maillard reaction is non-enzymatic browning between reducing sugars and amino acids at moderate temperatures, giving flavour and colour (bread crust, roasted coffee); caramelisation is browning of sugars alone at high temperatures (above about 160 °C) without amino acids.
(iv) Lye peeling uses hot sodium hydroxide solution to loosen and remove skins of fruits and vegetables (peaches, tomatoes, potatoes) before washing; brining is immersing foods in salt solution to preserve, flavour or ferment them (pickles, olives, cheese).
(v) Drying usually means removing water under natural conditions (sun drying) to a safe moisture level; dehydration is controlled drying with artificial heat and air flow in dryers to a very low moisture content with better quality.', null, '[{"point": "(i) Thermoplastics soften on heating and can be reshaped/recycled (PE, PP, PET) vs thermosets set permanently (melamine, epoxy can linings)", "marks": 3}, {"point": "(ii) Climacteric: respiration and ethylene burst, ripen after harvest (mango, banana, apple) vs non-climacteric: ripen only on plant (citrus, grape, pineapple)", "marks": 3}, {"point": "(iii) Maillard: reducing sugar + amino acid, lower temp, flavour/colour (bread crust) vs caramelisation: sugar alone at high temp", "marks": 3}, {"point": "(iv) Lye peeling: hot NaOH solution loosens skin of fruits/vegetables vs brining: soaking in salt solution for preservation/flavour/fermentation", "marks": 3}, {"point": "(v) Drying: removal of moisture, often natural/sun drying to safe level vs dehydration: controlled artificial drying to very low moisture", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case1', 1, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I (food science and technology)

2. What is fruit jam? What are the common problems during jam processing? Mention the name of the test to ensure the quality of the finished jam. (2+4+4 = 10 marks) (10 marks)', 'Jam is a product made by boiling fruit pulp or pieces with sugar, pectin and acid to a total soluble solids of at least 68%, giving a reasonably firm, spreadable set. Common problems: crystallisation of sugar (too little acid/inversion or over-concentration) or of glucose (too much inversion); stickiness or gumminess (too much inversion/ high TSS); premature setting or failure to set (wrong pectin/acid/sugar balance); syneresis or weeping (too much acid, too little pectin); mould growth (low TSS, poor sealing); browning and loss of colour (overcooking). Tests for end point and quality: sheet (flake) test, drop test in water, boiling-temperature test (about 105-106 °C) and measuring TSS with a refractometer (≥ 68%).', null, '[{"point": "Jam: fruit pulp/pieces boiled with sugar, pectin, acid to ≥ 68% TSS, set consistency", "marks": 2}, {"point": "Problems: crystallisation (sugar/ inversion), stickiness, premature/poor setting, syneresis (weeping), mould growth, colour change", "marks": 4}, {"point": "Tests: sheet/flake test, drop test, temperature test (105-106 °C), refractometer TSS ≥ 68%", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case1', 2, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I (food science and technology)

3. By-product technology in the food industry plays a significant role in reducing food losses. List the by-products and their uses for the following fruits: (i) apple; (ii) mango; (iii) pineapple; (iv) banana; (v) grape. (5 × 2 = 10 marks) (10 marks)', '(i) Apple: pomace and peel - pectin extraction, cider vinegar, animal feed, dietary fibre. (ii) Mango: peel - pectin and fibre; kernel - mango kernel fat/oil (cocoa-butter substitute) and starch; also feed. (iii) Pineapple: peel and core - bromelain enzyme, vinegar, juice/syrup, animal feed, fibre. (iv) Banana: peel - flour, feed and compost; pseudostem and leaves - fibre for textiles/paper, plates. (v) Grape: pomace and seeds - grape seed oil, polyphenols/antioxidants, tartaric acid (cream of tartar), distilled spirits, animal feed.', null, '[{"point": "(i) Apple pomace - pectin, vinegar, cider, animal feed", "marks": 2}, {"point": "(ii) Mango peel and kernel - pectin, kernel fat/oil, starch, feed", "marks": 2}, {"point": "(iii) Pineapple peel/core - bromelain, vinegar, juice, feed", "marks": 2}, {"point": "(iv) Banana peel/pseudostem - fibre, flour, feed, compost", "marks": 2}, {"point": "(v) Grape pomace/seeds - grape seed oil, tartrates, polyphenols, alcohol, feed", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case1', 3, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I (food science and technology)

4. Define sensory evaluation. What are the criteria for selection of a panel of judges? How do you prepare food samples for sensory evaluation? List and explain the types of sensory tests. (2+4+3+6 = 15 marks) (15 marks)', 'Sensory evaluation is a scientific discipline used to evoke, measure, analyse and interpret reactions to the characteristics of food as perceived by sight, smell, taste, touch and hearing. Panel selection: good health and no allergies or colds; non-smokers; interest, motivation and availability; normal sensory acuity shown in screening tests (basic tastes, odours, colour vision); ability to describe and repeat judgements; no bias (not product developers) and willingness to be trained. Sample preparation: identical size, shape, quantity and serving temperature; coded with random three-digit numbers; served in random/balanced order in identical neutral containers; water and plain crackers for rinsing; tests in a quiet booth with controlled lighting. Types of tests: discrimination/difference tests (paired comparison, duo-trio, triangle) to find whether products differ; descriptive tests (flavour profile, quantitative descriptive analysis) with trained panels to describe attributes; affective/consumer tests (hedonic 9-point scale, paired preference, ranking) to measure liking.', null, '[{"point": "Definition: scientific method to evoke, measure, analyse and interpret responses to food perceived by the senses", "marks": 2}, {"point": "Panel selection: health, no allergies, interest and availability, sensory acuity (screening tests), training, non-smokers, unbiased", "marks": 4}, {"point": "Sample preparation: uniform size/temperature, coded with random 3-digit numbers, random order, neutral containers, water/crackers between samples, controlled environment", "marks": 3}, {"point": "Tests: discrimination (triangle, duo-trio, paired comparison), descriptive (profile, QDA), affective (hedonic scale, preference, ranking)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case1', 4, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II (cereals, pulses and baking)

1. In the preparation of baked products, the dough and batter are leavened. List the leavening agents used in baked products and explain their step-by-step mechanisms of leavening. (10 marks)', 'Leavening agents: (1) Biological - yeast (and sourdough bacteria): yeast ferments sugars to carbon dioxide and ethanol; the CO₂ is trapped in the gluten network developed by kneading, the dough rises during proofing, and in the oven gas expands further before the crumb sets. (2) Chemical - baking soda (sodium bicarbonate) reacts with an acid (buttermilk, cream of tartar) to release CO₂; baking powder contains soda plus acid salts - single-acting releases gas when moistened, double-acting also releases gas when heated. (3) Physical - air incorporated by creaming fat and sugar, whipping eggs or sifting flour, and steam formed from water in the batter during baking (e.g. puff pastry, choux) expand in the heat. In the oven, the gases expand, then starch gelatinises and proteins (gluten, egg) coagulate to fix the light, porous structure.', null, '[{"point": "Biological: yeast fermentation - sugars → CO₂ + ethanol, gas trapped in gluten", "marks": 3}, {"point": "Chemical: baking soda + acid / baking powder (single and double acting) release CO₂ on moisture and heat", "marks": 3}, {"point": "Physical: air (creaming, whipping, sifting) and steam expanding in oven", "marks": 3}, {"point": "Gas expansion in oven, starch gelatinisation and protein coagulation set the structure", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case2', 1, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II (cereals, pulses and baking)

2. Processing of pulses is important to eliminate toxic constituents. List two groups of thermolabile inhibitors/toxic constituents with examples. Define lathyrism and favism. Explain the step-by-step ways to eliminate the toxic constituents from pulses. (4+6+5 = 15 marks) (15 marks)', 'Thermolabile anti-nutritional factors: (1) protease (trypsin and chymotrypsin) inhibitors - soybean, red gram, chickpea - reduce protein digestion; (2) haemagglutinins (lectins/phytohaemagglutinins) - red kidney beans, soybean - agglutinate red blood cells and cause digestive upset; others include goitrogens and amylase inhibitors. Lathyrism: a crippling neurological disease (spastic paralysis of the legs) caused by eating large amounts of khesari dal (Lathyrus sativus) over a long period, due to the neurotoxin β-ODAP (BOAA). Favism: acute haemolytic anaemia in people with G6PD deficiency after eating fava (broad) beans, caused by vicine and convicine. Elimination: clean and soak pulses overnight and discard the soaking water; dehull; germinate (sprout) or ferment; boil thoroughly or pressure-cook (destroys inhibitors and lectins); roast; for khesari, steep in hot water and discard the water (removes most ODAP) and parboil; avoid fava beans if G6PD-deficient.', null, '[{"point": "Thermolabile groups: protease (trypsin/chymotrypsin) inhibitors - soybean, red gram; haemagglutinins (lectins) - kidney bean, soybean (also goitrogens, amylase inhibitors)", "marks": 4}, {"point": "Lathyrism: paralysis of lower limbs from excessive Lathyrus sativus (khesari dal) - neurotoxin BOAA/ODAP", "marks": 3}, {"point": "Favism: haemolytic anaemia after eating fava beans in G6PD-deficient people (vicine, convicine)", "marks": 3}, {"point": "Elimination: soaking and discarding water, dehulling, germination, fermentation, boiling/pressure cooking, roasting; parboiling khesari, steeping in hot water", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case2', 2, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II (cereals, pulses and baking)

3. Explain/define the following: (i) dextrin; (ii) glycogen; (iii) cellulose; (iv) hemicellulose; (v) pectic substances. (5 × 2 = 10 marks) (10 marks)', '(i) Dextrins: partially hydrolysed starch fragments formed by dry heat (toasting, baking crusts), acid or amylase; soluble, slightly sweet, used as adhesives and thickeners.
(ii) Glycogen: the storage polysaccharide of animals (''animal starch''), a highly branched glucose polymer (α-1,4 with frequent α-1,6 branches) stored in liver and muscle.
(iii) Cellulose: a linear polymer of glucose with β-1,4 bonds, the main structural component of plant cell walls; insoluble dietary fibre not digested by humans.
(iv) Hemicellulose: a group of branched heteropolysaccharides (xylans, arabinoxylans, mannans, glucans) found with cellulose in cell walls; partly soluble, a source of dietary fibre.
(v) Pectic substances: polymers of galacturonic acid in the middle lamella and cell walls of fruits - protopectin (unripe), pectin and pectic acid (over-ripe); pectin forms gels with sugar and acid in jams and jellies.', null, '[{"point": "(i) Dextrin: low-molecular starch breakdown products (heat/acid/enzymes), e.g. toast crust", "marks": 2}, {"point": "(ii) Glycogen: highly branched animal storage polysaccharide in liver and muscle", "marks": 2}, {"point": "(iii) Cellulose: linear β-1,4 glucose polymer, plant cell walls, dietary fibre", "marks": 2}, {"point": "(iv) Hemicellulose: branched heteropolysaccharides (xylans, mannans) in cell walls", "marks": 2}, {"point": "(v) Pectic substances: galacturonic acid polymers in middle lamella - protopectin, pectin, pectic acid; gelling", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case2', 3, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II (cereals, pulses and baking)

4. What is parboiling of paddy? What are the advantages and disadvantages of parboiling? Elaborate the milling operations, cooking and nutritive value of rice. List the processed products from rice. (4+5+4+2 = 15 marks) (15 marks)', 'Parboiling is the hydrothermal treatment of paddy before milling: soaking in water, steaming and then drying. Starch gelatinises and water-soluble vitamins and minerals from the husk and bran move into the endosperm.
Advantages: grain becomes harder, so fewer broken grains and higher head-rice yield; better retention of thiamine and minerals; resistance to insects and better keeping quality; less loss of solids and stickiness in cooking. Disadvantages: extra cost, water and energy; darker colour and sometimes off-odour; longer cooking time; risk of mould if drying is poor; bran oil quality changes.
Milling: cleaning, dehusking (rubber-roll huller) to give brown rice, paddy separation, whitening/polishing to remove bran, then grading and sorting. Cooking: rice absorbs water and starch gelatinises; the amylose content decides texture (high amylose - fluffy, low - sticky). Nutritive value: about 78% carbohydrate, 6-8% protein (lysine limiting), little fat; brown and parboiled rice keep more B vitamins and minerals, while highly polished rice loses much thiamine (risk of beriberi).
Processed products: beaten/flaked rice (zaw/sip), puffed and popped rice, rice flour, noodles and vermicelli, rice bran oil, rice-based fermented foods and beverages (ara, rice wine), idli/dosa batters, baby foods.', null, '[{"point": "Parboiling: soaking, steaming and drying paddy before milling - starch gelatinised, nutrients move inward", "marks": 4}, {"point": "Advantages: less breakage, higher milling yield, retains B-vitamins/minerals, better keeping quality, less stickiness; disadvantages: cost, energy, colour/odour, longer cooking, mould risk", "marks": 5}, {"point": "Milling: cleaning, dehusking, separation, whitening/polishing, grading; cooking: water absorption, gelatinisation; nutrition: carbohydrate ~78%, protein 6-8%, B vitamins lost in polishing", "marks": 4}, {"point": "Products: flakes (beaten rice), puffed/popped rice, rice flour, noodles, bran oil, rice wine/ara, idli/dosa batter", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Food Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2025-case2', 4, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Botulism is caused by the toxin of', null, 'Clostridium botulinum, a concern in low-acid canned foods.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bacillus cereus', false, 1), ('B', 'Staphylococcus aureus', false, 2), ('C', 'Clostridium botulinum', true, 3), ('D', 'Salmonella typhi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most spoilage bacteria cannot grow below a water activity (aw) of about', null, 'Most bacteria need aw above about 0.91; moulds grow down to about 0.80.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.91', true, 1), ('B', '0.30', false, 2), ('C', '0.99', false, 3), ('D', '0.70', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
commit;
