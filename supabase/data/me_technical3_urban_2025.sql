-- ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'urban-planning', 'Urban Planning' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'urban-planning') is null then raise exception 'unknown specialisation urban-planning'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'urban-planning');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'urban-planning'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Urban Planning');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'urban-planning'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Urban Planning');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'urban-planning'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Urban Planning');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The agency mandated to formulate policies related to housing and function as a Tenancy Authority in Bhutan is the:', null, 'The Department of Human Settlement formulates housing policy and acts as Tenancy Authority (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Local Governments', false, 1), ('B', 'Department of Human Settlement', true, 2), ('C', 'National Pension and Provident Fund.', false, 3), ('D', 'National Housing Development Corporation Limited', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For adherence to approved land use in Bhutan, which of the following permit is required:', null, 'A planning permit confirms the proposal follows the approved land use (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Notice from Local Government', false, 1), ('B', 'Building Permit', false, 2), ('C', 'None of the above.', false, 3), ('D', 'Planning Permit', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the Bhutan Building Regulation, an area of mezzanine floor shall not exceed:', null, 'Bhutan Building Regulation: mezzanine limited to a share of the plinth area (30% - to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '45% of the plinth area', false, 1), ('B', '30% of the plinth area', true, 2), ('C', '25% of the plinth area', false, 3), ('D', '20% of the plinth area', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the Planning Model/Theory advocated by Charles E. Lindblom?', null, 'Lindblom advocated incremental planning (''muddling through'').', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Incremental planning', true, 1), ('B', 'Advocacy planning', false, 2), ('C', 'Transactive planning', false, 3), ('D', 'Synoptic planning', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the Bhutan Building Regulation 2018, the maximum allowable floor in rural areas is:', null, 'BBR 2018 rural height limit (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Three plus Jamthog', false, 1), ('B', 'Three plus attic and Jamthog', false, 2), ('C', 'Two plus Jamthog', true, 3), ('D', 'Two plus attic and Jamthog', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The formula for calculating the Indicative Contribution Ratio (ICR) for land pooling is:', null, 'ICR = (infrastructure requirement + reserve plots) / contributing land x 100.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ICR = Infrastructure requirement (IR) + Area of Contributing Land (ACL) ×100 Area of proposed Reserve Plots (ARP)', false, 1), ('B', 'ICR = Area of Contributing Land (ACL) - Area of proposed Reserve Plots (ARP) ×100 Infrastructure requirement (IR)', false, 2), ('C', 'ICR = Infrastructure requirement (IR) +Area of proposed Reserve Plots (ARP) ×100 Area of Contributing Land (ACL)', true, 3), ('D', 'ICR = Area of proposed Reserve Plots (ARP) + Area of Contributing Land (ACL) ×100 Infrastructure requirement (IR)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per Kevin Lynch, which of the following five elements form the image of a city?', null, 'Lynch: paths, edges, districts, nodes and landmarks.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paths, Edges, Districts, Nodes & Landmarks', true, 1), ('B', 'Paths, Buildings, Nodes, Monuments & Landmarks', false, 2), ('C', 'Paths, Edges, Nodes, Monuments & Landmarks', false, 3), ('D', 'Paths, Edges, Rivers, Nodes & Landforms', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The time horizon for a Structure Plan for implementation and review is:', null, 'Structure plan horizon and review period (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '25 years and 5 years', false, 1), ('B', '20 years and 5 years', true, 2), ('C', '30 years and 10 years', false, 3), ('D', '20 years, and 10 years', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The formula to calculate FAR is:', null, 'FAR = gross floor area / plot area.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Total lot size/ Gross Floor Area', false, 1), ('B', 'Gross Floor Area/Total lot size', true, 2), ('C', 'Total lot size X Gross Floor area', false, 3), ('D', 'Total Plinth Area x Gross Floor Area', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the Spatial Planning Standards 2017 of Bhutan, the population density 80-300 pph is considered as:', null, 'Density band 80-300 pph per Spatial Planning Standards 2017 (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Very high', false, 1), ('B', 'Low', false, 2), ('C', 'Medium', true, 3), ('D', 'High', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Bhutan, the maximum limit of land pooling usually adopted is :', null, 'Land pooling contribution usually up to 30% (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '28%', false, 1), ('B', '25%', false, 2), ('C', '32%', false, 3), ('D', '30%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Gentrification is a process of urban development in which:', null, 'Gentrification raises values and rents and displaces residents.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'There will be rising rents and living costs.', false, 1), ('B', 'A neighborhood''s residents are often displaced.', false, 2), ('C', 'All of the above.', true, 3), ('D', 'A city neighborhood changes from low to high value.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the National Land Use Plan for Bhutan, for an urban area the:', null, 'Urban areas: less than 50% of population in primary industry (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Population in primary industry should be less than 25%.', false, 1), ('B', 'Population in primary industry should be more than 25%.', false, 2), ('C', 'Population in primary industry should be less than 50%.', true, 3), ('D', 'Population in primary industry should be more than 50%.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Kerbed central island with diameter greater than or equal to 4m and flared approaches to allow multiple entry lanes is a description of:', null, 'A kerbed central island ≥4 m with flared entries is a conventional (normal) roundabout.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mini Roundabout', false, 1), ('B', 'Conventional Roundabout', true, 2), ('C', 'Raindrop Roundabout', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the actual distance on ground equivalent to 2cm on a map of scale 1:25,000?', null, '2 cm x 25 000 = 50 000 cm = 0.5 km.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Quarter of a km', false, 1), ('B', '50m', false, 2), ('C', '1 km', false, 3), ('D', '½ km', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Under the Spatial Planning Framework, the tiers of spatial plans in Bhutan as per hierarchy are:', null, 'National, regional, local spatial plans and action area plans (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'National Spatial Plan; Structure Plan; Regional Spatial Plan; and Local Area Plan.', false, 1), ('B', 'National Spatial Plan; Regional Spatial Plan; Local Spatial Plan; and Action Area Plan.', true, 2), ('C', 'Action Area Plan; Structure Plan; Local Area Plan; and National Spatial Plan.', false, 3), ('D', 'Regional Spatial Plan; National Spatial Plan; Valley Development Plan; and Local Area Plan.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the Spatial Planning Standards of Bhutan, the parking space requirement for theatres, cinemas, concert halls, dance halls and similar places would be:', null, 'Parking standard for assembly halls per Spatial Planning Standards (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 car parking space per 10 fixed seats', true, 1), ('B', '2 car parking space per 15 fixed seats', false, 2), ('C', '3 car parking space per 10 fixed seats', false, 3), ('D', '1 car parking space per 3 fixed seats', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Buffers of water courses, natural drainage and other sensitive areas shall be categorized as:', null, 'Buffers for water courses and sensitive areas are overlays (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Precincts', false, 1), ('B', 'Setback', false, 2), ('C', 'Overlays', true, 3), ('D', 'Zones', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What would be the FAR for a plot measuring 50 mx 30 m, has three floors measuring 15 mx10 m each and no restriction on coverage?', null, 'FAR = 3 x 150 / 1500 = 0.3.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.3', true, 1), ('B', '0.4', false, 2), ('C', '1', false, 3), ('D', '3.3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Traditional Neighborhood Development (TND) means being able to walk somewhere within:', null, 'TND: daily needs within a short walk (about 5-10 minutes) (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10 minutes', true, 1), ('B', '15 minutes', false, 2), ('C', '45 minutes', false, 3), ('D', '30 minutes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An Action Area Plan is:', null, 'An action area plan is detailed and regulatory (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'General in nature', false, 1), ('B', 'Strategic in nature', false, 2), ('C', 'Regulatory in nature', true, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which agency decides the type of building color to be adopted in Bhutan?', null, 'Building colour decided locally (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Department of Human Settlement', false, 1), ('B', 'Department of Culture', false, 2), ('C', 'Thromde', false, 3), ('D', 'Dzongkhag', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many Yenlag Thromdes are there in Bhutan?', null, 'Number of Yenlag Thromdes (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20', true, 1), ('B', '24', false, 2), ('C', '4', false, 3), ('D', '40', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Yenlag Thromde for Thimphu is:', null, 'Yenlag Thromde for Thimphu (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dagala', false, 1), ('B', 'Lingzhi', false, 2), ('C', 'Namseling', false, 3), ('D', 'Khasadrapchu', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Yenlag Thromde for Trashigang Dzongkhag is:', null, 'Yenlag Thromde for Trashigang (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kanglung', true, 1), ('B', 'Khaling', false, 2), ('C', 'Rangjung', false, 3), ('D', 'Yonphula', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan has a Spatial Planning Act or Planning Act:', null, 'Bhutan''s planning legislation (to be confirmed).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Answer key not verified: Bhutan-specific rule - an urban planner must confirm it against the current regulation/standard before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Not sure', false, 1), ('B', 'False', false, 2), ('C', 'I don’t know', false, 3), ('D', 'True', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What would be the area of a neighborhood if it is to be within walk-able distance of 350 m radius?', null, 'π x 350² = 384 845 m² ≈ 95 acres.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Approximately 96 acres', false, 1), ('B', 'Approximately 95 acres', true, 2), ('C', 'Approximately 124 acres', false, 3), ('D', 'Approximately 120 acres', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The City Beautiful Movement that flourished during 1890s and 1900s introduced beatification and monumental grandeur in cities. It also intended to create:', null, 'The City Beautiful movement aimed to instil moral and civic virtue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'beautiful villages', false, 1), ('B', 'moral and civic virtue among urban populations', true, 2), ('C', 'awareness on beauty and heritage values', false, 3), ('D', 'harmony between nature and infrastructure development', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '_________is a thoroughfare that is lined with buildings. It has area defined for cars, human circulations and activity:', null, 'A street is a building-lined thoroughfare for people and vehicles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Promenade', false, 1), ('B', 'Footpath', false, 2), ('C', 'Road', false, 3), ('D', 'Street', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '____________is an international movement to reform the design of built environment and is about raising quality of life and standard of living by creating better places to live in. It is the revival of our lost art of place making:', null, 'New Urbanism revives place-making for better places to live.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'New Urbanism', true, 1), ('B', 'City Beautiful', false, 2), ('C', 'Rationalism', false, 3), ('D', 'Contextualism', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) What is land pooling? (2 marks)', 'a) Land pooling (land readjustment) is a planning tool in which owners of many small, irregular plots pool their land; the government (e.g. thromde) replans the area, takes a share of each owner''s land (the contribution ratio) for roads, drains and public facilities, and returns smaller but regular, serviced and more valuable plots - so infrastructure is built without large land acquisition costs, and owners share costs and benefits fairly.', null, '[{"point": "Land readjustment tool: landowners contribute a share of land for infrastructure/ public facilities, plots reconfigured and returned smaller but serviced and more valuable; no compensation, voluntary/ statutory", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-s1', 1, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) What public facilities and amenities can be developed on the pooled land? Where necessary, explain why they are included in land pooling. (3 marks)', 'b) Roads, footpaths and parking; storm-water drains, water supply, sewerage and power lines; open spaces, parks and playgrounds; schools, health units, community centres, religious structures and markets; and reserve plots that the authority can sell or lease to recover infrastructure costs or use for affordable housing. These are included because a planned, liveable neighbourhood needs them, and pooling secures the land at the start instead of buying it later.', null, '[{"point": "Facilities with reasons: roads, footpaths, drains, water/ sewer networks, open spaces/ parks, schools, health units, community halls, markets, utilities, reserve plots for cost recovery/ affordable housing", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-s1', 2, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the types of spatial plans in Bhutan.', 'Bhutan''s spatial plans work in tiers [check details against the current Spatial Planning framework]: 1. National Spatial Plan (e.g. NSP 2030) - long-term national framework for settlements, land use, infrastructure corridors, environment and growth centres. 2. Regional/dzongkhag-level plans (including valley development plans) - coordinate development across a region or valley. 3. Structure plans for thromdes/towns (e.g. Thimphu Structure Plan) - long-term (about 20-25 years) strategic plans for land use, transport, density and growth areas. 4. Local area plans (LAPs) - detailed plans for neighbourhoods within the structure plan with plots, roads, precincts and development control. 5. Action area plans - detailed, short-term plans for specific areas needing priority development or redevelopment.', null, '[{"point": "Hierarchy: National Spatial Plan (e.g. NSP 2030), regional/ dzongkhag plans, structure plans for thromdes, local area plans, action area plans", "marks": 2}, {"point": "Purpose/ scale and content of each", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Check against Bhutan''s current spatial planning framework."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Which is the lead agency responsible for urban planning and for developing the related rules and regulations in Bhutan? List some of its mandates.', 'The Department of Human Settlement under the Ministry of Infrastructure and Transport (formerly the Ministry of Works and Human Settlement) leads urban and spatial planning nationally, while thromdes and dzongkhags implement plans locally [confirm current structure]. Mandates include: formulating human settlement and housing policies; preparing the National Spatial Plan and supporting structure and local area plans; developing planning and building regulations, standards and guidelines (e.g. Bhutan Building Regulation, Spatial Planning Standards, land pooling rules); guiding land use and development control; promoting affordable housing; preserving traditional architecture and settlement character; capacity building for local governments; and monitoring urban development.', null, '[{"point": "Lead agency: Department of Human Settlement, Ministry of Infrastructure and Transport (formerly MoWHS) (with thromdes implementing)", "marks": 2}, {"point": "Mandates: spatial planning policies, standards and regulations (building regulations, planning standards), national/ structure plans, land pooling guidance, housing policy, urban development and capacity building, monitoring, guidelines for traditional architecture", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Agency names changed in the 2022-2023 civil service reform: confirm."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What transformation is needed in Thimphu to enhance liveability? Describe briefly.', 'Thimphu needs: better mobility - safe, continuous footpaths and cycle routes, reliable city buses, parking management and reduced car dependence; more green and open spaces - protected riverfronts (Wang Chhu), parks and playgrounds, protecting forests and ridges; affordable housing and mixed-use neighbourhoods with services within walking distance (local area plans), with higher density along transport corridors and controlled sprawl on slopes; reliable water, drainage, sewerage and waste management; preserving Bhutanese architectural character and heritage; disaster resilience (earthquakes, landslides, flash floods); inclusive public spaces for children, the elderly and disabled; and participatory, digitally supported planning.', null, '[{"point": "Transport: walkability, footpaths, public transport, parking management, reduce congestion", "marks": 1.5}, {"point": "Green and open spaces, riverfront, environment, drainage, waste", "marks": 1.5}, {"point": "Housing affordability, mixed-use, density near nodes, services, heritage character, smart/ inclusive city, disaster resilience", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Reviewing the Thimphu City Design Code 2024
The Thimphu City Design Code 2024, part of the revised Thimphu Structure Plan, was developed by international experts to streamline development activities and designate land uses that ensure good growth in the right places. As an urban planner tasked with reviewing the code, answer the following.

a) List five objectives of the Design Code. Describe how these objectives can improve the existing capital city. (15 marks)', 'Objectives (as an urban design code typically sets out): 1. Create walkable, people-friendly streets with active frontages - improving safety and reducing car dependence in a congested city. 2. Ensure context-sensitive built form that respects Bhutanese architecture, heights and skyline - stopping out-of-character blocks and protecting identity. 3. Protect the natural landscape - river corridors, ridges, forests and slopes, minimising cut and fill - reducing landslides and flooding and keeping Thimphu''s green setting. 4. Guide density and mixed use to the right places (nodes and corridors) - reducing sprawl up the slopes and making services and public transport viable. 5. Deliver a quality public realm and open spaces - plazas, parks and setbacks that support community life. Also: climate and disaster resilience, and clear, predictable rules for developers. Together these would make Thimphu more liveable, attractive, safer and better organised as the capital grows.', null, '[{"point": "Five objectives (e.g. walkable, people-friendly streets; context-sensitive built form/ Bhutanese character; protecting natural landscape/ slopes and rivers; appropriate density and mixed use at right places; quality public realm/ open spaces; climate/ disaster resilience; clear, predictable rules)", "marks": 7.5}, {"point": "How each improves Thimphu (congestion, sprawl, loss of character, flooding, lack of public space)", "marks": 7.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case1', 1, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Reviewing the Thimphu City Design Code 2024
The Thimphu City Design Code 2024, part of the revised Thimphu Structure Plan, was developed by international experts to streamline development activities and designate land uses that ensure good growth in the right places. As an urban planner tasked with reviewing the code, answer the following.

b) Carry out a SWOT analysis of the Design Code. (15 marks)', 'Strengths: a clear, illustrated set of rules for built form and land use; based on international best practice; integrated with the revised structure plan; promotes walkability, open space and environmental protection; preserves Bhutanese character; gives predictability to developers. Weaknesses: may be complex and technical for owners and small builders; prepared by outsiders so some rules may not fit local topography, culture or construction costs; limited consultation; heavy demands on thromde enforcement capacity; compliance may raise costs. Opportunities: better-quality development attracting investment and tourism; improved liveability and public health; climate and disaster resilience; capacity building for local planners; digital permit systems; aligning with Gelephu Mindfulness City ideas. Threats: weak enforcement, exemptions and political pressure; high land prices and fragmented ownership; resistance from landowners and developers; lack of funding for public realm works; rapid rural-urban migration and informal development; earthquakes and floods.', null, '[{"point": "Strengths: clear standards, international expertise, holistic vision, links to structure plan, protects environment/ character", "marks": 4}, {"point": "Weaknesses: possibly complex/ technical, international view may miss local context, enforcement capacity, cost to comply, limited consultation", "marks": 4}, {"point": "Opportunities: better investment, tourism/ GMC links, liveability, climate resilience, capacity building, digital permitting", "marks": 3.5}, {"point": "Threats: weak enforcement/ political pressure, land prices/ fragmented ownership, resistance from owners/ developers, funding gaps, rapid migration, disasters", "marks": 3.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case1', 2, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Reviewing the Thimphu City Design Code 2024
The Thimphu City Design Code 2024, part of the revised Thimphu Structure Plan, was developed by international experts to streamline development activities and designate land uses that ensure good growth in the right places. As an urban planner tasked with reviewing the code, answer the following.

c) For the concept shown (development on a slope: one large flat platform made by deep cut and fill versus smaller, stepped development platforms that minimise cut and fill), list three pros and three cons of each proposal with justification. Which would you recommend for Thimphu, and why? (15 marks)', 'Large single cut-and-fill platform - pros: simple layout and construction; large flat area for parking and bigger buildings; easier access and services. Cons: massive excavation and fill, high retaining walls and costs; destabilised slopes, landslide and erosion risk; disrupted natural drainage and ugly scars on the hillside. Smaller stepped platforms - pros: follow the natural contours, reducing earthworks, cost of retaining structures and slope failure risk; preserve natural drainage, vegetation and views; better visual integration with the hillside and traditional settlement patterns. Cons: more complex design, levels and access (steps, ramps); smaller platforms and floor plates; higher design and detailing effort. Recommendation: stepped platforms, because Thimphu''s steep, seismic, landslide- and flood-prone terrain needs minimal cut and fill; this is safer, more sustainable and keeps the valley''s character.', null, '[{"point": "Large single platform - pros (easy construction/ layout, larger floor plates, cheaper per unit on paper) and cons (high cut/fill, slope instability, tall retaining walls, drainage/ visual scars)", "marks": 5}, {"point": "Stepped platforms - pros (follow contours, less earthwork, stability, natural drainage, views, landscape) and cons (more complex design/ access, higher structural detailing, smaller floor plates)", "marks": 5}, {"point": "Recommendation: stepped platforms for Thimphu''s steep, landslide-prone terrain with justification", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case1', 3, null, null, (select id from public.specialisations where code = 'urban-planning'), '/papers/me/tech3-urban-2025-stepped-platforms.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Reviewing the Thimphu City Design Code 2024
The Thimphu City Design Code 2024, part of the revised Thimphu Structure Plan, was developed by international experts to streamline development activities and designate land uses that ensure good growth in the right places. As an urban planner tasked with reviewing the code, answer the following.

d) What are some front setback treatments for residential ground floors? (5 marks)', 'Landscaped front gardens or planting strips; low walls, hedges or transparent fences that give privacy while keeping eyes on the street; ground floors slightly raised above street level or set behind a small porch or veranda for privacy; permeable paving and rain gardens for drainage; street trees and seating; screened areas for bins and meters; and avoiding car parking or blank walls in the front setback so the frontage stays active and pedestrian-friendly.', null, '[{"point": "Treatments: landscaped front gardens/ planting strips, low fences or hedges, raised ground floor/ privacy step-up, porches/ verandas, permeable paving, street trees, no parking in front setbacks, bins/ services screening, active frontage with windows", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case1', 4, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Planning Samtse as the fifth Thromde
Samtse town is proposed to be developed as the fifth Thromde. As an urban planner, learning from the experiences of other thromdes such as Thimphu and Phuentsholing, how would you plan Samtse Thromde? Your proposals must include, but are not limited to, the parts below.

a) Analyses: study of the existing scenario; identification of issues; and SWOT analysis. (15 marks)', 'Existing scenario: Samtse is a southern border town in a warm, low-lying area next to India, with a growing population, trade links, small industries, agriculture (cardamom, areca nut, oranges), institutions such as the Samtse College of Education, and road links to Phuentsholing and the planned Gelephu-related corridors. Survey land use, topography, rivers and flood zones, existing roads, water, sewerage and drainage, housing, services, land ownership and economic activities. Issues: flash floods and river bank erosion; unplanned, ribbon development along roads; inadequate water, drainage, sewerage and solid waste systems; traffic and parking at border points; informal settlements and land tenure problems; limited jobs; heat and vector-borne diseases; security and cross-border trade management. SWOT - Strengths: flat and gently sloping land, border trade location, educational institution, agricultural hinterland. Weaknesses: poor infrastructure and services, flood exposure, limited planning capacity. Opportunities: becoming a regional trade and logistics hub, industrial estates, education and tourism, learning from Phuentsholing and Thimphu, connection to national highways. Threats: floods, climate change and earthquakes, uncontrolled growth and speculation, cross-border risks, funding gaps.', null, '[{"point": "Existing scenario: location (southern border, Samtse dzongkhag, near India), population and growth, land use, topography/ rivers, economy (trade, industry, agriculture), infrastructure, services, institutions (college)", "marks": 5}, {"point": "Issues: flooding/ river erosion, unplanned growth, border trade/ security, infrastructure gaps, land tenure, connectivity, heat/ disease, employment", "marks": 5}, {"point": "SWOT: strengths, weaknesses, opportunities, threats specific to Samtse", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case2', 1, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Planning Samtse as the fifth Thromde
Samtse town is proposed to be developed as the fifth Thromde. As an urban planner, learning from the experiences of other thromdes such as Thimphu and Phuentsholing, how would you plan Samtse Thromde? Your proposals must include, but are not limited to, the parts below.

b) Visioning exercise and the planning principles to be adopted. (10 marks)', 'Visioning: run a participatory process - community meetings, business and youth groups, local government, agencies and border authorities - to agree a shared vision such as "Samtse: a resilient, green and prosperous southern gateway town". Planning principles: GNH and sustainability; compact, mixed-use growth instead of sprawl; flood- and disaster-resilient development (no building in flood zones, river buffers); walkable neighbourhoods with good public transport; a connected green and blue network (rivers, parks, trees for shade); inclusive and affordable housing; infrastructure-led, phased development (land pooling before plots are sold); preserving Bhutanese architectural identity; supporting trade, logistics, education and agro-industry for jobs; and learning from Thimphu''s slope sprawl and Phuentsholing''s density and border congestion.', null, '[{"point": "Visioning: participatory (residents, business, LG, agencies), vision statement e.g. ''A resilient, green and prosperous southern gateway''", "marks": 4}, {"point": "Principles: GNH/ sustainability, compact mixed-use growth, resilience/ flood-safe, walkable and transit, green-blue network, inclusive/ affordable, Bhutanese character, economic growth/ border trade, phased infrastructure-led development, learn from Thimphu/ Phuentsholing mistakes", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case2', 2, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Planning Samtse as the fifth Thromde
Samtse town is proposed to be developed as the fifth Thromde. As an urban planner, learning from the experiences of other thromdes such as Thimphu and Phuentsholing, how would you plan Samtse Thromde? Your proposals must include, but are not limited to, the parts below.

c) Proposals to address the problems: set out at least five strategies, with simple sketches to illustrate your ideas. (25 marks)', '1. Land-use plan and zoning: define a compact urban core with mixed-use commercial streets, residential neighbourhoods, an institutional zone around the college, and an industrial/logistics zone away from homes; mark no-build flood zones. (Sketch: zoning map with core, neighbourhoods, logistics area and river buffers.) 2. Flood and river management: river training, embankments and green buffers along rivers and streams, retention ponds and a storm-water drainage network; parks and sports fields in the buffers. (Sketch: river cross-section showing buffer, embankment and park.) 3. Land pooling for planned neighbourhoods: pool fragmented plots to provide roads, drains, open spaces, schools and reserve plots before development; affordable housing on reserve plots. (Sketch: before-and-after plot layout.) 4. Transport and border logistics: a road hierarchy with a truck bypass and a dry port/logistics hub near the border to keep heavy vehicles out of the town centre; continuous shaded footpaths, cycle lanes and a bus terminal. (Sketch: street section with footpath, trees, lanes.) 5. Utilities and services: phased water supply, sewer and treatment plant, solid waste management and power; health, education and market facilities at neighbourhood centres. Also: preserve Bhutanese architecture with design guidelines; a green network of parks and street trees for shade in the hot climate; and strong thromde governance, phasing and public participation, with lessons from Thimphu and Phuentsholing.', null, '[{"point": "At least five relevant strategies explained (5 marks each max), e.g.: land-use zoning with growth nodes and flood-free development areas; river protection/ green buffers and flood management; land pooling for planned neighbourhoods with infrastructure; road hierarchy, bypass/ logistics hub for trucks at border, public transport and walkability; water, sewerage, drainage and solid waste systems; affordable housing; economic zones; heritage/ public spaces; governance and phasing", "marks": 20}, {"point": "Simple sketches (zoning plan, river buffer section, street section, neighbourhood layout)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2025 - check Bhutan-rule answer keys before publishing", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Urban Planning", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2025-case2', 3, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q3';
commit;
