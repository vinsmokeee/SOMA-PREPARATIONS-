-- ME Paper III (Technical, Mining): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'mining', 'Mining' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'mining') is null then raise exception 'unknown specialisation mining'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'mining');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mining'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Mining');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mining'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 5, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Mining');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mining'), null, 3, 'Section B: Case study (answer either Option I or Option II)', 'passage', 2, 45, 1, 'BCSE 2025 Main Examination, Technical Paper III, Mining');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Minimum metal percentage, at which mining is profitable, is known as:', null, 'Cut-off grade is the minimum grade at which mining is profitable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mill grade.', false, 1), ('B', 'Economical grade.', false, 2), ('C', 'Cut-off grade.', true, 3), ('D', 'Average grade.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is Salting in Mine Valuation?', null, 'Salting adds high-grade material to samples to inflate the property''s value.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Adding high-grade mineral samples to higher-grade ore during sampling or core drilling to inflate the value of mining property', false, 1), ('B', 'Adding high-grade mineral samples to lower-grade ore during sampling or core drilling to inflate the value of mining property', true, 2), ('C', 'Adding low-grade mineral samples to high-grade ore during sampling or core drilling to inflate the value of mining property', false, 3), ('D', 'Adding low-grade mineral samples to lower-grade ore during sampling or core drilling to inflate the value of mining property', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Project A has an internal rate of return (IRR) of 21 percent. Project B has an IRR of 7 percent. Project C has an IRR of 31 percent. Project D has an IRR of 25 percent. Which of these would be the BEST project?', null, 'With other things equal, the highest IRR (31%, Project C) is best.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Project B', false, 1), ('B', 'Project D', false, 2), ('C', 'Project A', false, 3), ('D', 'Project C', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a mine for one shovel, six trucks are assigned. The shovel loading time per truck is 5 minute, and truck cycle time is 20 minutes. Calculate the match factor.', null, 'Match factor = (trucks x loading time) / (shovels x truck cycle) = 6 x 5 / 20 = 1.5.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.2', false, 1), ('B', '1.5', true, 2), ('C', '1.0', false, 3), ('D', '0.7', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per classification of mineral resources, “reserve “means', null, 'A reserve is the identified part of a resource that is techno-economically mineable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypothetical resources', false, 1), ('B', 'Inferred resources', false, 2), ('C', 'Identified resources', false, 3), ('D', 'Identified and techno-economically viable resources', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the Fig. A and B represents contour plots in a terrain then the correct statement is', null, 'Contours bending towards lower values show a ridge (Fig. A); towards higher values, a valley (Fig. B).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), '/papers/me/tech3-mining-2025-contours.png')
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fig. A shows anticline and Fig. B shows syncline', false, 1), ('B', 'Fig. A shows ridge and Fig. B shows valley', true, 2), ('C', 'Fig. A shows valley and Fig. B shows ridge', false, 3), ('D', 'Fig. A shows syncline and Fig. B shows anticline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the context of mine planning, match the following techniques/algorithms (A-D) with their preferred applications (1-4): A. Lerchs-Grossmann algorithm, B. Kriging, C. Lane''s theory, D. Taylor''s rule; 1. Reserve estimation, 2. Mine life, 3. Cut-off grade optimisation, 4. Ultimate pit limit.', null, 'Lerchs-Grossmann → ultimate pit limit; kriging → reserve estimation; Lane → cut-off grade; Taylor''s rule → mine life.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A-4, B-1, C-3, D-2', true, 1), ('B', 'A-2, B-4, C-1, D-3', false, 2), ('C', 'A-3, B-2, C-4, D-1', false, 3), ('D', 'A-1, B-2, C-3, D-4', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A FMFS report is a document containing', null, 'A Final Mine Feasibility Study report covers technical, financial, environmental and social analyses before a lease.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A detail of geological report', false, 1), ('B', 'An EIA report including all scoping and baseline studies', false, 2), ('C', 'In reasonable detail, the technical, financial, environmental and social impact analyses required prior to the approval of a mining lease.', true, 3), ('D', 'Mine plan but no environmental management plan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The point beyond which the mineral cannot be economically extracted is called', null, 'The break-even stripping ratio marks the limit of economic extraction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Break-even ratio', true, 1), ('B', 'Stripping ratio', false, 2), ('C', 'Limit of extraction', false, 3), ('D', 'Cost of stripping ratio', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of the weight per unit volume of solid rock in the bench to the weight per unit volume of loose rock after blasting is called the', null, 'In-situ density / loose density is the swell factor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Swell factor', true, 1), ('B', 'Bucket factor', false, 2), ('C', 'Drill factor', false, 3), ('D', 'Swing factor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term Representative Factor (RF) is associated with', null, 'The representative fraction (scale) is used on mine plans.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mine air sampling', false, 1), ('B', 'Mine ventilation', false, 2), ('C', 'Mine drainage', false, 3), ('D', 'Mine plan', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Under what conditions blasting may not be carried out?', null, 'Blasting must not be done during thunderstorms (lightning can trigger detonators).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'At temperatures exceeding 300Cᵒ', false, 1), ('B', 'Heavy rain', false, 2), ('C', 'Thunderstorm', true, 3), ('D', 'Strong wind', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When explosive charges in a hole is separated by air gaps in stead stemming materials, then the process is known as', null, 'Separating charges by air gaps is air decking.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'air decking', true, 1), ('B', 'Deck charging’', false, 2), ('C', 'Priming', false, 3), ('D', 'Detonating', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a mine deploying shovel and dumper, the distance from the crest of the bench to the centre of the dumper including safety berm and clearance is 7.5m, the dumping radius and the cutting radii of the shovel are 15m and 12m respectively. The width of the working bench of the mine in m is;', null, 'Bench width = 7.5 + 15 + 12 = 34.5 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '34.5', true, 1), ('B', '32.5', false, 2), ('C', '36.5', false, 3), ('D', '30.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The rocks that are formed by the cooling of molten material (called magma) at or relatively near the earth surface is called', null, 'Rocks formed by cooling magma are igneous.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crystalline', false, 1), ('B', 'Igneous rock', true, 2), ('C', 'Sedimentary rock', false, 3), ('D', 'Metamorphic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'VOD is the property of:', null, 'Velocity of detonation (VOD) is a property of explosives.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'dumper', false, 1), ('B', 'detonator', false, 2), ('C', 'dragline', false, 3), ('D', 'explosives', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the provisions of the MMMR 2002, under ‘Environmental restoration bond’ the lessee shall deposit an environmental bond to the Government as security for:-', null, 'The bond secures mine reclamation and environmental restoration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mine reclamation and environmental restoration in the mine and for ensuring that the negative impacts on the surrounding environment are minimized.', true, 1), ('B', 'Claiming the interest given on the security bond by the government for increasing the mining activities in the country.', false, 2), ('C', 'Taking out loans from the financial institutions to carry out the mining/quarrying operations in the Country', false, 3), ('D', 'Carrying out the mining/quarrying operations not as per the approved FMFS report and other relevant rules & regulations set up by the government', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The boundary of a mine is plotted on a scale of 1:2000. If a planimeter measures the plotted area as 58 cm2 the actual mine area in m2 is', null, '58 cm² x (2000)² = 2.32 x 10⁸ cm² = 23 200 m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '11700', false, 1), ('B', '23200', true, 2), ('C', '6800', false, 3), ('D', '28000', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In an open-pit mine design, the ultimate pit limit is primarily determined by', null, 'The ultimate pit limit is set mainly by stripping ratio and economics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bench height', false, 1), ('B', 'Drilling pattern', false, 2), ('C', 'Stripping ratio and economics', true, 3), ('D', 'Slope stability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ultimate Pit slope is the angle made by the imaginary line joining the –', null, 'Overall pit slope joins the topmost crest to the bottom toe.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Top most crest of the bench to bottom most crest of the bench.', false, 1), ('B', 'Average of the all bench angles.', false, 2), ('C', 'Top most toe of the bench to the bottom most toe of the bench.', false, 3), ('D', 'Top most crest of the bench to bottom most toe of the bench.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What are Contours in a topographic map?', null, 'Contours join points of equal elevation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'Used for calculating the area.', false, 2), ('C', 'Lines joining the point of same elevations.', true, 3), ('D', 'Shows the level of depth of mine.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the Moho’s Scale of hardness, the minerals in increasing order of hardness are;', null, 'Mohs order: gypsum (2), calcite (3), topaz (8), diamond (10).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Calcite, gypsum, topaz, diamond', false, 1), ('B', 'Calcite, gypsum, diamond, topaz', false, 2), ('C', 'Gypsum, calcite, topaz, diamond', true, 3), ('D', 'Topaz, gypsum, calcite, diamond', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per MMMA 1995, a mining lease shall be granted for a mining area', null, 'A lease is granted only after clearances from all concerned authorities.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'based on the approval of the FMFS report only', false, 1), ('B', 'only after clearance of such area has been received from all concerned authorities of the Government', true, 2), ('C', 'if the mining area is demarcated by the applicant', false, 3), ('D', 'after putting an application for mining lease in Form A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statement is NOT CORRECT?', null, 'Not correct: secondary blasting breaks boulders; toe is avoided by proper primary blast design.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Secondary blasting is done for big size boulders', false, 1), ('B', 'Stemming is required to avoid the blown-out shots', false, 2), ('C', 'Controlled blasting is done to avoid fly rock', false, 3), ('D', 'Secondary blasting is done to avoid the toe formation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The extension of all boundaries of the mining area shall be?', null, 'The mining area boundaries extend vertically downward without limit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Downward, vertically without limit', true, 1), ('B', 'Downward, vertically with the limit', false, 2), ('C', 'Sideward, horizontally with the limit', false, 3), ('D', 'Sideward, horizontally without limit', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Coal formation takes place in the following order', null, 'Coalification: peat → lignite → bituminous → anthracite.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lignite – peat – bituminous – anthracite', false, 1), ('B', 'Bituminous – peat – lignite – anthracite', false, 2), ('C', 'Peat – lignite – bituminous – anthracite', true, 3), ('D', 'Peat- lignite – anthracite – bituminous', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Mineral levies in Bhutan are collected based on:', null, 'Mineral levies are based on quantity in metric tonnes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quantity in Kilograms', false, 1), ('B', 'Quantity in metric tons', true, 2), ('C', 'None of above', false, 3), ('D', 'Volume of the material', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Why is it necessary to carry out break-even analysis in a mining business? The handling figures for the Pugli Limestone Mine for 2024-25 are: overburden (OB) handled = 5,00,000 MT; ore production = 2,00,000 MT; densities of OB and ore are 2.5 and 3 respectively. Find the stripping ratio for 2024-25.', 'Break-even analysis finds the level of production (or price/grade) at which revenue equals total cost. It is needed to know the minimum output or selling price for the mine to be viable, to judge profitability and risk of price or cost changes, to fix the break-even stripping ratio that sets the economic pit limit, and to plan production, pricing and investment.
Stripping ratio: OB volume = 5,00,000 / 2.5 = 2,00,000 m³; ore volume = 2,00,000 / 3 = 66,667 m³.
Stripping ratio (volume) = 2,00,000 / 66,667 = 3 : 1 (m³ of OB per m³ of ore). In other units: 2,00,000 m³ / 2,00,000 t = 1 m³ of OB per tonne of ore, or 5,00,000 / 2,00,000 = 2.5 t of OB per t of ore.', null, '[{"point": "Why break-even: shows minimum production/price to cover costs, viability, pit limit (break-even stripping ratio), planning, risk", "marks": 2}, {"point": "Volumes: OB 2,00,000 m³; ore 66,667 m³", "marks": 1.5}, {"point": "Stripping ratio 3:1 (m³/m³) or 1 m³ OB per tonne ore (2.5 t/t)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the Environment Restoration Bond (ERB) formula and its mode of payment. Calculate the upfront ERB from the following data: area = 9.66 acres; OB = 53,714 m³.', 'The Environment Restoration Bond is security deposited by the lessee with the Government (Department of Geology and Mines) to make sure the mine is reclaimed and the environment restored; it is released after satisfactory restoration, or forfeited and used by the Government if the lessee fails. The bond amount is worked out from the area disturbed and the volume of overburden to be handled and restored, at the rates prescribed in the current Mines and Minerals rules: ERB = (area in acres x rate per acre) + (OB volume in m³ x rate per m³). Part is paid upfront before operations begin and the rest as prescribed (e.g. instalments or bank guarantee/fixed deposit). For this lease: ERB = 9.66 x (rate per acre) + 53,714 x (rate per m³), applying the prescribed upfront percentage. [Examiner: use the rates in the rules in force.]', null, '[{"point": "Purpose of ERB: security for reclamation and restoration, refunded/ released after satisfactory restoration", "marks": 1.5}, {"point": "Formula: based on disturbed area and overburden volume at rates prescribed in the current Mines and Minerals rules", "marks": 1.5}, {"point": "Calculation with prescribed rates, and mode of payment (upfront portion plus instalments/ bank guarantee or deposit)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Uses Bhutan''s ERB rates: check against the rules in force."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A shovel operates 300 days a year, 2 shifts a day and 4 hours a shift to achieve a target production of 30 million MT per annum. Find the number of shovels required, given: bucket capacity 15 m³; shovel cycle time 44 s; bucket fill factor 0.85; bulk density of the muck 3.00 t/m³.', 'Load per cycle = 15 x 0.85 x 3.0 = 38.25 t. Cycles per hour = 3600 / 44 = 81.8. Output per hour = 38.25 x 81.8 ≈ 3130 t/h.
Working hours per year = 300 x 2 x 4 = 2400 h. Output per shovel per year = 3130 x 2400 ≈ 7.51 million t.
Number of shovels = 30 / 7.51 = 3.99 → 4 shovels (one more as standby is advisable for breakdowns and maintenance).', null, '[{"point": "Load per cycle 15 x 0.85 x 3 = 38.25 t; cycles per hour 81.8", "marks": 2}, {"point": "Output per hour ≈ 3130 t; hours per year 2400; per shovel ≈ 7.51 Mt/yr", "marks": 2}, {"point": "Number = 30/7.51 ≈ 3.99 → 4 shovels (plus standby)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Draw a simple risk matrix. How would you manage risk in mines when posted to a regional office of the department as Regional Coordinator?', 'Risk matrix: a grid with likelihood on one axis (rare, unlikely, possible, likely, almost certain - 1 to 5) and consequence on the other (insignificant, minor, moderate, major, catastrophic - 1 to 5). Risk = likelihood x consequence, banded as low (green, 1-4), medium (yellow, 5-9), high (orange, 10-16) and extreme (red, 20-25).
As Regional Coordinator: 1. Identify hazards in mines of the region (slope failure, blasting, heavy vehicles, dust, landslides, unsafe workings) through regular inspections. 2. Assess and rank risks with the matrix. 3. Require controls using the hierarchy - eliminate, substitute, engineering controls (benches, berms, haul road design), administrative (permits, SOPs, blasting procedures), PPE. 4. Check compliance with approved mine plans and safety rules; issue notices and enforce. 5. Train lessees, managers and workers; ensure emergency response plans and drills. 6. Record and investigate accidents and near misses, monitor and review regularly, and report to the department.', null, '[{"point": "Risk matrix: likelihood vs consequence (e.g. 5x5), risk levels low/medium/high/extreme colour bands", "marks": 2}, {"point": "Risk management: hazard identification, risk assessment, controls hierarchy, inspections, enforcement, training, emergency plans, monitoring and review", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the different environmental problems associated with surface mining operations.', 'Land degradation - removal of vegetation, topsoil and forests, changing the landscape and destroying habitats. Soil erosion and slope instability - landslides and debris flows from dumps and benches, especially in the monsoon. Water pollution - sediment, suspended solids and chemicals entering streams; changed drainage and lowered water tables; acid mine drainage in some deposits. Air pollution - dust from blasting, loading, haul roads and crushing, and vehicle emissions, affecting health and crops. Noise, ground vibration and fly rock from blasting and machines. Waste dumps and overburden occupying land. Loss of biodiversity and wildlife disturbance. Visual impact and conflicts with communities, agriculture and water sources.', null, '[{"point": "At least five problems explained: land degradation/ loss of vegetation and habitat, soil erosion/ landslides, water pollution/ sedimentation/ altered drainage, air pollution/ dust, noise and vibration/ fly rock, waste dumps, loss of biodiversity, social impacts", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option.

1. Discuss the factors influencing the choice between open-pit and underground mining methods. (10 marks)', 'Depth, size, shape and attitude of the ore body - shallow, large, massive or flat deposits suit open-pit; deep, narrow or steeply dipping ones suit underground. Stripping ratio compared with the break-even stripping ratio - when overburden removal becomes uneconomic, change to underground. Grade and value - high-grade ore can bear higher underground costs. Costs and productivity - open-pit has lower cost per tonne, higher production rates and recovery, and large equipment; underground has higher cost but less waste. Recovery and dilution. Geotechnical and hydrological conditions - rock strength, slope stability, groundwater. Environmental and land use - surface disturbance, forests, communities, visual impact, waste dumps; underground has smaller footprint. Safety, availability of skilled labour and technology, regulations and lease conditions, infrastructure and terrain (in Bhutan, steep terrain and environmental rules matter).', null, '[{"point": "Depth and geometry of deposit, stripping ratio vs break-even", "marks": 3}, {"point": "Grade, tonnage, ore value and costs (capital/operating), productivity, recovery/dilution", "marks": 3}, {"point": "Geotechnical, hydrology, environment and land use, safety, technology, regulations, social", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q5 on Bhutan''s royalty systems: check against the current Mines and Minerals Act/Rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case1', 1, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option.

2. What is mine planning? Explain mine planning and its components. Explain the difference between geological reserve and mineable reserve. (10 marks)', 'Mine planning is the systematic process of deciding how a mineral deposit will be developed, extracted, processed and closed in a safe, economic and environmentally responsible way over its life. Components: geological modelling and exploration data; resource and reserve estimation (e.g. kriging, block models); selection of mining method; mine/pit design (ultimate pit limit, benches, haul roads, slopes); production scheduling (short- and long-term) and cut-off grade; equipment selection and fleet sizing; infrastructure (power, water, roads, dumps, drainage); environmental management, reclamation and closure plan; cost estimation and financial evaluation; safety and statutory approvals (FMFS). Geological reserve (resource) is the total quantity and grade of mineral estimated in the ground from exploration, without considering economics. Mineable reserve is the part of it that can be extracted economically, technically and legally with the chosen method - after applying pit limits, cut-off grade, pillars and barriers, mining losses, dilution and regulatory constraints.', null, '[{"point": "Definition: systematic process of designing how a deposit will be developed, extracted and closed safely and economically", "marks": 2}, {"point": "Components: exploration/ geological model, reserve estimation, method selection, pit/ mine design, production scheduling, equipment selection, infrastructure, waste/ dumps, environmental plan, economics, closure", "marks": 5}, {"point": "Geological reserve: total estimated mineral in the deposit; mineable reserve: part that can be economically and legally extracted after losses, dilution, pit limits", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q5 on Bhutan''s royalty systems: check against the current Mines and Minerals Act/Rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case1', 2, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option.

3. A bench in an open-pit mine is 15 m high with a bench face angle of 65°. If the factor of safety against sliding is calculated as 1.1, discuss whether the bench is safe and what corrective measures may be required. (5 marks)', 'A factor of safety of 1.1 means resisting forces only slightly exceed driving forces: the bench is marginally stable but not adequately safe, since design standards usually require about 1.2-1.3 for benches and 1.3-1.5 for long-term or overall slopes. Rain, groundwater, blast vibration or an earthquake could push it below 1. Corrective measures: reduce the face angle (e.g. to 55-60°) or bench height; provide wider berms and catch benches; improve drainage (surface drains, drain holes) to reduce pore pressure; use controlled blasting (pre-splitting, smooth blasting); scale loose rock and install rock bolts or wire mesh where needed; and monitor with prisms or inspections.', null, '[{"point": "FoS 1.1 > 1 so marginally stable but below normal design values (1.2-1.5); risky with water, blasting, earthquakes", "marks": 2}, {"point": "Measures: flatten face angle/reduce height, benches/berms, drainage, controlled blasting, bolting/ netting, monitoring", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q5 on Bhutan''s royalty systems: check against the current Mines and Minerals Act/Rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case1', 3, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option.

4. Discuss the role of automation and AI in modern mining operations. (10 marks)', 'Automation: autonomous haul trucks and drills, remote-controlled and tele-operated loaders, automated conveyors and crushers, all supervised from central control rooms; drones for surveying, stockpile measurement and inspection. AI and data: predictive maintenance from equipment sensor data; optimisation of blasting, fragmentation and fleet dispatch; machine learning for ore-grade modelling and grade control; production scheduling; real-time monitoring of slope stability, dust and gas; fatigue and collision-avoidance systems; digital twins of the mine. Benefits: removes workers from hazardous areas, higher productivity and equipment utilisation, lower fuel and maintenance cost, better recovery and less dilution, and better environmental monitoring. Challenges: high investment, need for skilled staff, job displacement, reliable connectivity, cybersecurity and data quality. In Bhutan, drones, GPS fleet management and predictive maintenance are practical first steps.', null, '[{"point": "Automation: autonomous haulage, drilling, remote-operated equipment, tele-remote, control rooms", "marks": 3}, {"point": "AI: predictive maintenance, ore grade control, blast optimisation, scheduling, safety analytics, drones, digital twins", "marks": 3}, {"point": "Benefits: safety, productivity, cost, precision, environment", "marks": 2}, {"point": "Challenges: cost, skills, jobs, connectivity, cybersecurity; relevance for Bhutan", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q5 on Bhutan''s royalty systems: check against the current Mines and Minerals Act/Rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case1', 4, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option I: Mine planning, stability, technology and royalty
Answer all the questions in this option.

5. What are the two mineral royalty systems of Bhutan? Explain the process of levying the domestic and export mineral royalty. List the advantages and disadvantages of having a mixed royalty system in the country. (10 marks)', 'Bhutan uses a specific royalty (a fixed rate per metric tonne of mineral) and an ad valorem royalty (a percentage of the value of the mineral). Domestic sales are charged on quantity: the lessee records dispatches (weighbridge, transit permits), declares the quantity in metric tonnes and pays the prescribed rate per tonne to the Department of Geology and Mines. Exports are charged on value: the royalty is a percentage of the declared export value/price, verified against export documents, collected at the point and in the manner prescribed in the rules. Advantages of the mixed system: specific royalty is simple, predictable and easy to administer for low-value domestic minerals; ad valorem royalty lets the government share in higher international prices and captures more revenue from exports. Disadvantages: more complex administration; risk of under-valuation or transfer pricing for exports; ad valorem revenue fluctuates with prices; specific rates lose value with inflation unless revised; and possible inconsistency between domestic and export users. [Examiner: check rates and collection points against the current rules.]', null, '[{"point": "Two systems: specific (fixed rate per tonne) and ad valorem (percentage of value)", "marks": 3}, {"point": "Levying process: domestic - based on quantity (MT) dispatched/ weighbridge records at prescribed rates; export - percentage of export value/ price at the point prescribed, collected by the department", "marks": 4}, {"point": "Advantages and disadvantages of mixed mode", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q5 on Bhutan''s royalty systems: check against the current Mines and Minerals Act/Rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case1', 5, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option II: Mine safety, equipment and costs
Answer all the questions in this option.

1. When an accident takes place in a mine area, what is the lessee or the mine manager supposed to do with respect to the department? (5 marks)', 'Immediately rescue and give first aid to the injured, arrange medical evacuation, make the area safe and stop work there. Inform the Department of Geology and Mines (and the Dzongkhag administration and police for serious or fatal accidents) at once by the fastest means, then submit a written notice of accident in the prescribed form within the prescribed time, with a copy to the Dzongdag. Preserve the accident site undisturbed until inspection (except for rescue and safety), cooperate with the department''s investigation, keep accident records and register, and implement the corrective measures directed.', null, '[{"point": "Immediate: rescue, first aid, medical evacuation, make area safe, stop operations in area", "marks": 2}, {"point": "Inform the department (and Dzongkhag, police) immediately; written notice of accident in the prescribed form within the prescribed time", "marks": 2}, {"point": "Preserve site, cooperate with investigation, records, corrective measures", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case2', 1, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option II: Mine safety, equipment and costs
Answer all the questions in this option.

2. A shovel with a 2 m³ bucket (fill factor 0.85, material density 2.2 t/m³) loads trucks of 35 t capacity at 90% fill. Shovel cycle time = 40 s. Haul road = 2.5 km (loaded speed 25 km/h, empty speed 35 km/h). Spot/loading time = 2.8 min, dumping time = 1.2 min. Find the number of trucks required if the shovel works continuously. (10 marks)', 'Load per shovel pass = 2 x 0.85 x 2.2 = 3.74 t. Truck payload = 35 x 0.9 = 31.5 t. Passes = 31.5 / 3.74 = 8.4 → 9 passes.
Loading time = 9 x 40 s = 360 s = 6.0 min.
Haul (loaded) = 2.5/25 h = 6.0 min; return (empty) = 2.5/35 h = 4.29 min.
Truck cycle = loading 6.0 + haul 6.0 + return 4.29 + spot 2.8 + dump 1.2 = 20.3 min.
Trucks needed = cycle time / loading time = 20.3 / 6.0 = 3.4 → 4 trucks (so the shovel is never idle).
(If the 2.8 min is taken as including loading, cycle = 14.3 min and trucks = 14.3 / 2.8 ≈ 5.1 → 6; state the assumption.)', null, '[{"point": "Load per pass 2 x 0.85 x 2.2 = 3.74 t; truck payload 31.5 t; passes 8.4 → 9", "marks": 3}, {"point": "Loading time 9 x 40 s = 6 min; haul 6 min, return 4.3 min", "marks": 3}, {"point": "Cycle ≈ 20.3 min (adding spot 2.8 and dump 1.2)", "marks": 2}, {"point": "Trucks = cycle/loading time ≈ 3.4 → 4", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case2', 2, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option II: Mine safety, equipment and costs
Answer all the questions in this option.

3. Briefly describe the various operations involved in surface mining. Classify surface mining methods in relation to the equipment used. (10 marks)', 'Operations: (1) site preparation - clearing vegetation and removing and storing topsoil; (2) drilling of blast holes; (3) blasting to fragment rock; (4) excavation and loading of overburden and ore by shovels, excavators or loaders; (5) haulage by dumpers, conveyors or rail; (6) dumping of waste on dumps and ore at stockpiles/crushers; (7) ancillary operations - dozing, haul road maintenance, dewatering, dust suppression, slope monitoring; (8) reclamation and backfilling. Classification by equipment: shovel-dumper (truck) systems (most common, e.g. limestone and dolomite quarries); dragline mining (cast overburden in strip mines); bucket wheel excavator with conveyors (continuous mining of soft material); scraper mining; dozer-ripper systems; surface miners (blast-free cutting); hydraulic excavator/front-end loader systems; and in-pit crushing and conveying.', null, '[{"point": "Unit operations: site clearing/topsoil removal, drilling, blasting, excavation/loading, haulage, dumping, (crushing), ancillary (dewatering, road maintenance, reclamation)", "marks": 5}, {"point": "Classification by equipment: shovel-dumper, dragline, bucket wheel excavator, scraper, surface miner, dozer-ripper, hydraulic excavator/ front-end loader, in-pit crushing-conveying", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case2', 3, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option II: Mine safety, equipment and costs
Answer all the questions in this option.

4. Find the cost per cubic metre of rock to be blasted from the following data: explosive cost = ₹250/kg; consumption = 8 kg/m³; burden = 3 m; spacing = 4 m; bench height = 10 m. (10 marks)', 'Volume of rock per hole = burden x spacing x bench height = 3 x 4 x 10 = 120 m³.
Explosive per hole = 8 kg/m³ x 120 m³ = 960 kg. Explosive cost per hole = 960 x 250 = ₹2,40,000.
Cost per m³ = 2,40,000 / 120 = ₹2000 per m³ (= 8 x 250).
Note: a powder factor of 8 kg/m³ is far higher than normal bench blasting (about 0.3-0.8 kg/m³), so the data may contain a typo; with 0.8 kg/m³ the cost would be ₹200/m³. Accessories (detonators, cord) and drilling costs would be added to get the total blasting cost.', null, '[{"point": "Volume per hole = 3 x 4 x 10 = 120 m³", "marks": 3}, {"point": "Explosive per hole = 8 x 120 = 960 kg; cost per hole = ₹2,40,000", "marks": 3}, {"point": "Cost per m³ = 8 x 250 = ₹2000/m³ (explosive cost); note 8 kg/m³ is unusually high (typical 0.3-0.8)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case2', 4, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Option II: Mine safety, equipment and costs
Answer all the questions in this option.

5. What is productivity in mining? Elaborate on overall mining operations with respect to machines and drilling operations. (10 marks)', 'Productivity in mining is the ratio of output (tonnes of ore/overburden) to the inputs used - labour, machines, energy and capital - e.g. output per man-shift (OMS), tonnes per machine hour, or cost per tonne. Machines: productivity depends on availability (mechanical readiness), utilisation (time actually worked), operating efficiency and rated capacity; overall equipment effectiveness improves with good maintenance (preventive/predictive), skilled operators, well-maintained haul roads, correct shovel-truck matching (match factor near 1), dispatch systems and less waiting. Drilling: productivity is measured as metres drilled per hour and holes per shift; it depends on rock type, bit selection, drill condition and operator skill. Accurate drilling to the planned burden, spacing and depth gives good fragmentation, which raises shovel loading rates, truck payloads and crusher throughput and reduces secondary blasting and toe problems. Overall mine productivity therefore comes from integrating drilling, blasting, loading, hauling and maintenance, with monitoring of key performance indicators.', null, '[{"point": "Productivity definition: output per unit input (t per man-shift, t per machine hour, OMS), factors", "marks": 3}, {"point": "Machine productivity: availability, utilisation, efficiency, OEE, matching shovel-truck, maintenance", "marks": 4}, {"point": "Drilling: drill rate, hole quality, pattern, fragmentation effects on loading/ crushing; improvement measures", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Q1 on accident reporting: check form names and time limits against the current Mines and Minerals rules."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mining", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mine2025-case2', 5, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which surface mining equipment works mainly by casting overburden directly into the mined-out area, without trucks?', null, 'A dragline digs overburden and casts it into the mined-out void (cast overburden), common in strip mining.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rotary drill', false, 1), ('B', 'Rear dump truck', false, 2), ('C', 'Front-end loader', false, 3), ('D', 'Dragline', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Royalty that is charged as a percentage of the value of the mineral sold is called', null, 'Ad valorem royalty is a percentage of value; specific royalty is a fixed amount per tonne.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Surface rent', false, 1), ('B', 'Ad valorem royalty', true, 2), ('C', 'Specific royalty', false, 3), ('D', 'Dead rent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The first thing a mine manager must do immediately after a serious accident in a mine is to', null, 'Saving life and securing the area come first; the site is preserved for investigation and the authorities are informed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mining'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mining): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mining'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rescue and give first aid to the injured and make the area safe', true, 1), ('B', 'Clean up the accident site', false, 2), ('C', 'Repair the damaged machinery', false, 3), ('D', 'Resume production to meet targets', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
