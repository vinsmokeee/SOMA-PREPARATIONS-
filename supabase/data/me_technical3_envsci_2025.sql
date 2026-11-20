-- ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'environmental-science', 'Environmental Science' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'environmental-science') is null then raise exception 'unknown specialisation environmental-science'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'environmental-science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'environmental-science'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Environmental Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'environmental-science'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Environmental Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'environmental-science'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Environmental Science');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Global Theme for World Environment Day 2025 was ……………', null, 'World Environment Day 2025 (host Republic of Korea) focused on ending plastic pollution - #BeatPlasticPollution.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Land Restoration, Desertification, and Drought Resilience', false, 1), ('B', 'Only One Earth', false, 2), ('C', 'Solutions to Plastic Pollution', false, 3), ('D', 'Beat Plastic Pollution', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a designated Ramsar site of Bhutan?', null, 'Bhutan''s Ramsar sites are Bumdeling, Gangtey-Phobji and Khotokha.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gangtey-Phobji wetland, Wangdue Phodrang', false, 1), ('B', 'Bumdeling wetland, Tashiyangtse', false, 2), ('C', 'Khotokha wetland, Wangdue Phodrang', false, 3), ('D', 'Shingkhar wetland, Bumthang', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an indicator of biological water pollution?', null, 'Macroinvertebrates, fish and algae are all biological indicators.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fish', false, 1), ('B', 'Algae', false, 2), ('C', 'All of the above', true, 3), ('D', 'Macroinvertebrates', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan ratified the Paris Agreement on…………….', null, 'Bhutan ratified the Paris Agreement on 19 September 2017.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'August 17, 2017', false, 1), ('B', 'September 15, 2017', false, 2), ('C', 'September 19, 2017', true, 3), ('D', 'August 19, 2017', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the Environmental Assessment Act of Bhutan, 2000, environmental assessment means…….', null, 'EA Act 2000: procedures to ensure a project is managed in an environmentally sound and sustainable way.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All procedures required under Bhutanese law to identify the impacts of mining activity for ensuring scientific mining.', false, 1), ('B', 'All procedures required under Bhutanese law to identify means to ensure that the activities of a project are managed in an environmentally sound and sustainable way.', true, 2), ('C', 'All procedures required under the Bhutanese law to uphold the carbon neutrality pledge of the country.', false, 3), ('D', 'All procedures required under Bhutanese law to ensure sustainable forest management.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan acknowledges water resources as state property and the state’s rights. In this regard, arrange i) water for energy; ii) water for agriculture; iii) water for drinking and sanitation; and iv) water for industry, according to water use priorities/order of priorities observed by the government as per the Water Act of Bhutan, 2011.', null, 'Water Act 2011 priority: drinking and sanitation, agriculture, energy, industry.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'iii, i, ii, and iv', false, 1), ('B', 'iii, i, iv, and ii', false, 2), ('C', 'iii, ii, i, and iv', true, 3), ('D', 'iii, ii, iv, and i', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the National Environment Protection Act (2007), which statement below is not true about the “Polluter Pays Principle”?', null, 'Statement (a) is the precautionary principle, not polluter pays.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Where there are threats of serious or irreversible damage, lack of full scientific certainty shall not be used as a reason for postponing measures to prevent environmental degradation.', true, 1), ('B', 'The uniformity of the system of environmental protection shall be guaranteed by the Government, the local governments, and the private sector through appropriate policies, plans, and programs such as environmental assessment processes, regulations, incentives, fiscal policies, and other instruments.', false, 2), ('C', 'A person polluting the environment or causing ecological harm is responsible for the costs of containment, avoidance, abatement, medical compensation, mitigation, remediation, and restoration.', false, 3), ('D', 'State authorities and local governments, institutions, persons, businesses, and organizations shall cooperate for the protection of the environment. The right and responsibility to cooperate shall extend to all aspects of achieving the environmental objectives.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Chlorophyta is …………………', null, 'Green algae (Chlorophyta) photosynthesise - autotrophs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Autotroph', true, 1), ('B', 'Heterotroph', false, 2), ('C', 'None of the above', false, 3), ('D', 'Decomposer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the Environmental Standards of Bhutan (2020), which of the following is one of the parameters for incineration emission standards?', null, 'HCl is a standard incinerator stack-emission parameter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ozone (O3)', false, 1), ('B', 'Stack height', false, 2), ('C', 'Poly Aromatic Hydrocarbon', false, 3), ('D', 'Hydrogen Chloride (HCl)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A river is a…………', null, 'Running water is a lotic ecosystem.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wetland ecosystem', false, 1), ('B', 'Lotic ecosystem', true, 2), ('C', 'None of the above', false, 3), ('D', 'Lentic ecosystem', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Memelakha Compost Plant is “Turning Waste into Wealth” using Takakura Composting Method. It adopts ……………….. composting technique.', null, 'Takakura is an aerobic composting method.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anaerobic digestion', false, 1), ('B', 'Aerobic composting', true, 2), ('C', 'Biogas', false, 3), ('D', 'Vermicomposting', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following does NOT describe the characteristic of hazardous waste?', null, 'Ignitable hazardous waste catches fire easily under normal conditions, not only extreme ones.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Corrodes metals', false, 1), ('B', 'Destroys living tissue', false, 2), ('C', 'Unstable', false, 3), ('D', 'Easily catches fire under extreme conditions', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The National Adaptation Plan (NAP) of the Kingdom of Bhutan was submitted to the United Nations Framework Convention on Climate Change (UNFCCC) in 2023. Which of the following is NOT a sector identified for the NAP?', null, 'Mining is not a NAP sector.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mining', true, 1), ('B', 'Energy', false, 2), ('C', 'Health', false, 3), ('D', 'Water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which article of the Paris Agreement governs the development of the global carbon markets?', null, 'Article 6 covers cooperative approaches and carbon markets.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Article 4', false, 1), ('B', 'Article 7', false, 2), ('C', 'Article 6', true, 3), ('D', 'Article 5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is an environmental clearance according to the Environmental Assessment Act of Bhutan, 2000?', null, 'Environmental clearance is the written decision allowing a project to proceed, with terms.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A document that specifies the environmental, health, and safety terms for the design, construction, operation, and decommissioning of a project.', false, 1), ('B', 'The decision issued in writing to let a project proceed, which includes terms to ensure that the project is managed in an environmentally sound and sustainable way.', true, 2), ('C', 'The requirements and conditions that the project must comply.', false, 3), ('D', 'Program of systematic, objective, and quantitative measurements, observations, and reporting of projects that may have environmental impacts.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In 2025, Bhutan joined the world in observing the first World Day for Glaciers. The United Nations declared ……………. as World Day of Glaciers.', null, 'World Day for Glaciers: 21 March (first observed 2025).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '21st March', true, 1), ('B', '21st May', false, 2), ('C', '21st April', false, 3), ('D', '21st February', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the CORRECT definition of “Deforestation”?', null, 'Deforestation: clearing forest for another land use, not temporarily.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Clearing an area of forest on a non-temporary basis for another use.', true, 1), ('B', 'A gradual decline in the health, biodiversity, and ecological function of a forest.', false, 2), ('C', 'Felling of trees and the extraction of their stems or other usable parts from the forest.', false, 3), ('D', 'Clear-cutting followed by reforestation for forestry purposes.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a form of land degradation?', null, 'Salinization degrades land.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crop rotation', false, 1), ('B', 'Expansion of forest cover', false, 2), ('C', 'Agroforestry', false, 3), ('D', 'Salinization', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statement is relevant to the goal of Climate Change Policy of the Kingdom of Bhutan, 2020?', null, 'All three reflect the Climate Change Policy 2020.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above.', true, 1), ('B', 'Bhutan’s pledge to remain carbon neutral.', false, 2), ('C', 'Challenges and opportunities of climate change are addressed at all appropriate levels, through adequate finance, technology, and capacity building.', false, 3), ('D', 'Meaningful participation of all relevant stakeholders in climate change actions.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a substance that blocks the action of acetylcholine, a key neurotransmitter in the central and peripheral nervous systems in the nervous system?', null, 'Anticholinergics block acetylcholine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inhibitor', false, 1), ('B', 'Hepatotoxin', false, 2), ('C', 'Organophosphate', false, 3), ('D', 'Anticholinergic', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Systematic process for evaluating the environmental consequences of a proposed policy, plan or program is known as………………..', null, 'SEA evaluates policies, plans and programmes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Environmental Impact Assessment', false, 1), ('B', 'Strategic Environmental Assessment', true, 2), ('C', 'Policy Gap Analysis', false, 3), ('D', 'Sound Environmental Management', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '“Cradle-to-Grave” analysis describes …….', null, 'Cradle-to-grave is life cycle assessment.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Circular Economy', false, 1), ('B', 'Life Cycle Assessment', true, 2), ('C', 'Regenerative Model', false, 3), ('D', 'Sustainable Consumption and Production', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is one of the spheres of the environment?', null, 'The anthroposphere is one of the environment''s spheres.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hemisphere', false, 1), ('B', 'Stratosphere', false, 2), ('C', 'Ozonosphere', false, 3), ('D', 'Anthrosphere', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Moles of solute per kilogram of solvent is', null, 'Molality = moles of solute per kg of solvent.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Formality', false, 1), ('B', 'Molarity', false, 2), ('C', 'Molality', true, 3), ('D', 'Normality', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an example of a one-way ecological cycle?', null, 'Energy flows one way through ecosystems.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Energy cycle', true, 1), ('B', 'Water cycle', false, 2), ('C', 'Nitrogen cycle', false, 3), ('D', 'Carbon cycle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is climate finance? Elaborate with ONE example in the context of Bhutan. (5 marks)', 'Climate finance is money - from public, private and international sources - used to support actions that reduce greenhouse gas emissions (mitigation) or help people and ecosystems cope with climate impacts (adaptation). Example: Bhutan has received Green Climate Fund support for climate-resilient agriculture and water projects, and the ''Bhutan for Life'' fund (project finance for permanence) secures long-term financing for the protected-area network, protecting forests that keep Bhutan carbon negative.', null, '[{"point": "Definition: local, national or international finance (public, private, alternative) for climate mitigation and adaptation", "marks": 2}, {"point": "One Bhutanese example explained (e.g. Green Climate Fund projects, Bhutan for Life, Bhutan Climate Fund, GEF/LDCF adaptation projects)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is green hydrogen? Elaborate in the context of climate change. (5 marks)', 'Green hydrogen is hydrogen made by splitting water (electrolysis) with renewable electricity such as hydropower or solar, so no carbon dioxide is released, unlike ''grey'' hydrogen from natural gas. It helps fight climate change because it can replace fossil fuels in hard-to-electrify sectors - heavy transport, steel, fertiliser and other industries - and store surplus renewable energy. Bhutan, with clean hydropower (and partnerships to explore green hydrogen), could use it to cut fuel imports and transport emissions and even export clean fuel.', null, '[{"point": "Hydrogen produced by electrolysis of water using renewable electricity - no CO₂", "marks": 2}, {"point": "Climate relevance: replaces fossil fuels in transport, industry (steel, fertiliser), storage of surplus renewable power; Bhutan''s hydropower potential", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Elaborate on "waste as a water pollutant" with an appropriate example in the context of Bhutan. (5 marks)', 'Solid and liquid waste dumped near rivers, or leachate from poorly managed dumps, carries plastics, organic matter, nutrients, pathogens and chemicals into water. Organic waste raises BOD and lowers dissolved oxygen, killing fish and invertebrates; nutrients cause algal growth; pathogens cause waterborne diseases. Example: in Thimphu, untreated sewage and waste entering streams such as the Olarongchhu and the Wang Chhu have polluted them, and plastic waste collects along river banks in towns.', null, '[{"point": "How waste pollutes water: leachate, plastics, sewage, nutrients, pathogens, chemicals; lowers oxygen, harms aquatic life and health", "marks": 3}, {"point": "Bhutanese example (e.g. waste and sewage in Wang Chhu / Olarongchhu in Thimphu, leachate from landfills, waste dumped in streams)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is carbon negative? Explain the key drivers that made Bhutan achieve it. (5 marks)', 'A carbon-negative country absorbs more carbon dioxide than it emits. Bhutan emits about 2-3 million tonnes of CO₂ equivalent a year while its forests absorb far more. Key drivers: forest cover above 70% with the constitutional requirement to keep at least 60%; about half the country in protected areas and biological corridors; electricity almost entirely from hydropower, and exports of clean power that replace fossil power in India; GNH-based policies that put environmental conservation first; and a small, low-industry economy.', null, '[{"point": "Carbon negative: removes more CO₂ from the atmosphere than it emits", "marks": 2}, {"point": "Drivers: over 70% forest cover sink, constitutional 60% mandate, hydropower clean energy (and exports offsetting emissions abroad), conservation policies/protected areas, GNH, low industrialisation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region.

1. Elaborate on the key causes of the rise in global temperature commonly referred to as global warming. (10 marks)', 'Global warming is caused mainly by the enhanced greenhouse effect: greenhouse gases trap outgoing heat, and human activities have raised their concentrations. Key causes: burning coal, oil and gas for power, transport and industry (CO₂); deforestation and land-use change, which release carbon and reduce sinks; agriculture - livestock and rice paddies (methane), fertilisers (nitrous oxide); industrial processes such as cement and fluorinated gases; and waste in landfills (methane). Feedbacks such as melting ice reducing albedo and thawing permafrost amplify warming. Global temperature is now about 1.2-1.5 °C above pre-industrial levels.', null, '[{"point": "Enhanced greenhouse effect explained", "marks": 3}, {"point": "Causes: fossil fuel burning (CO₂), deforestation, agriculture (CH₄, N₂O), industry/F-gases, waste", "marks": 5}, {"point": "Feedbacks (ice-albedo, permafrost) and examples", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case1', 1, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region.

2. What specific geographic, ecological and socio-economic factors make Bhutan especially vulnerable to rising temperatures? (10 marks)', 'Geographic: steep, young and fragile Himalayan mountains; many glaciers and glacial lakes with GLOF risk; heavy monsoon rain causing floods and landslides; a hot southern belt such as Sarpang. Ecological: rich biodiversity with species confined to narrow altitude bands, alpine ecosystems that cannot move higher, and forests at risk of fire and pests. Socio-economic: the economy depends on hydropower (river flow) and tourism; most rural people depend on rain-fed farming; settlements, roads and hydropower plants lie in river valleys; limited finance, technology and data constrain adaptation.', null, '[{"point": "Geographic: young fragile mountains, glaciers and GLOF risk, steep slopes, monsoon", "marks": 4}, {"point": "Ecological: high biodiversity and altitude-limited species, forests, water sources", "marks": 3}, {"point": "Socio-economic: hydropower-dependent economy, rain-fed agriculture, rural poverty, limited resources/infrastructure", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case1', 2, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region.

3. What ecological or societal risks does this pose for Bhutan? Elaborate with specific examples. (10 marks)', 'Ecological: shifting and shrinking habitats for alpine species; more forest fires and pest outbreaks; drying springs and wetlands; glacier retreat changing river flow. Societal: glacial lake outburst floods (as in 1994 from Lugge Tsho) and flash floods threatening lives, homes and hydropower plants (e.g. Punatsangchhu valley); crop failure and new pests reducing food security; drying drinking-water sources in many villages; heat stress in the south; malaria and dengue spreading to higher districts; and loss of hydropower revenue in dry seasons.', null, '[{"point": "Ecological risks with examples: species shifts, forest fires, pests, drying springs, glacier retreat", "marks": 5}, {"point": "Societal risks with examples: GLOFs/floods (e.g. 1994 Lugge Tsho), crop loss, water scarcity, heat stress and vector-borne disease spreading to higher areas, hydropower loss", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case1', 3, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region.

4. What comprehensive climate mitigation and adaptation strategies should Bhutan prioritise to safeguard its ecological integrity and socio-economic resilience in the face of accelerating climate change? (10 marks)', 'Mitigation: maintain forest cover and the protected-area network; diversify renewable energy (solar, wind, small hydro, green hydrogen) and reduce diesel use through electric vehicles and public transport; energy efficiency in buildings and industry; low-emission agriculture and waste-to-resource systems. Adaptation: early warning systems and artificial lowering of dangerous glacial lakes; climate-resilient crops, irrigation and rainwater harvesting; spring-shed and watershed protection; climate-proof roads, buildings and hydropower; disaster preparedness; health surveillance for vector-borne diseases; insurance and social protection; and mobilising climate finance, research and community participation.', null, '[{"point": "Mitigation: keep forest cover, diversify renewables (solar, wind, green hydrogen), electric transport, energy efficiency, low-emission agriculture and waste", "marks": 5}, {"point": "Adaptation: GLOF early warning and lake lowering, climate-resilient agriculture and water storage, disaster risk management, health, climate-smart infrastructure, finance and research", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case1', 4, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I
For the first time since meteorological records were maintained in 1996, Bhur Meteorological Station in Sarpang Dzongkhag has recorded a staggering 40°C in 2025, marking the highest daily maximum temperature of 2024. This extreme temperature surpasses the highest recorded temperature in recent years, signalling the intensifying impacts of global warming on the Himalayan region.

5. What collective actions must the global community undertake, across governments, industries and civil society, to effectively confront the increasing climate crisis to ensure a sustainable future? (10 marks)', 'Governments must strengthen and implement NDCs in line with 1.5 °C, phase down coal and fossil-fuel subsidies, price carbon, protect forests and deliver promised climate finance (including loss-and-damage funds) to vulnerable countries like Bhutan. Industries should decarbonise operations, invest in renewable energy, efficiency and clean technology, and adopt sustainable supply chains and disclosure. Civil society, media and individuals can raise awareness, change consumption (energy, transport, food, waste), advocate and hold leaders accountable. International cooperation in technology transfer, research and capacity building is essential.', null, '[{"point": "Governments: ambitious NDCs, phase out fossil fuels, carbon pricing, honour climate finance and loss-and-damage commitments", "marks": 4}, {"point": "Industries: decarbonise, renewable energy, green technology, sustainable supply chains", "marks": 3}, {"point": "Civil society/individuals: awareness, sustainable lifestyles, advocacy, accountability; international cooperation and technology transfer", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case1', 5, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan''s long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country''s pristine environment through an improved waste management system.

1. In what ways can embracing circular economy principles accelerate Bhutan''s transition toward a Zero Waste Society? (10 marks)', 'A circular economy keeps materials in use for as long as possible by designing out waste, reusing, repairing, recycling and returning organic matter to the soil, instead of ''take-make-dispose''. For Bhutan: compulsory segregation at source; composting the large organic share of waste (e.g. Memelakha Takakura composting); recycling enterprises for paper, PET, metal and glass; repair and reuse businesses; deposit-refund and EPR schemes; bans and alternatives for single-use plastics; and green procurement. This reduces landfill and open burning, creates jobs and enterprises, and cuts dependence on imported materials.', null, '[{"point": "Circular economy explained (reduce, reuse, repair, recycle; design out waste; keep materials in use)", "marks": 3}, {"point": "Ways: segregation at source, composting organic waste, recycling enterprises, reuse/repair, eco-design and EPR, bans on single-use plastics", "marks": 5}, {"point": "Benefits: less landfill, jobs, less import dependence", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case2', 1, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan''s long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country''s pristine environment through an improved waste management system.

2. Critically assess the potential benefits and limitations of adopting the Public-Private Partnership (PPP) model as a strategic approach to foster private sector involvement in waste management services, particularly in the context of enhancing efficiency, accountability and sustainability. (10 marks)', 'Benefits: PPPs bring private investment, management skills and technology; performance-based contracts can improve efficiency and service quality; risks are shared; government can focus on regulation; entrepreneurship and jobs grow (e.g. private collection and recycling companies in Thimphu). Limitations: firms seek profit, so poor or remote areas may be neglected; Bhutan''s small waste volumes limit economies of scale; weak contract design, monitoring and enforcement reduce accountability; user fees may rise; a single contractor can become a monopoly. PPPs work when contracts are clear, performance is monitored, fees are fair and communities are involved.', null, '[{"point": "Benefits: private investment, efficiency, technology and innovation, shared risk, better service", "marks": 5}, {"point": "Limitations: profit motive vs public good, small market/low volumes in Bhutan, weak contracts and monitoring, cost to users, dependence on one operator", "marks": 4}, {"point": "Balanced conclusion with safeguards", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case2', 2, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan''s long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country''s pristine environment through an improved waste management system.

3. What is Extended Producer Responsibility (EPR)? Elaborate on its advantages and disadvantages in the context of the waste management system in Bhutan. (10 marks)', 'EPR makes producers and importers responsible for their products after use - for take-back, collection, recycling or safe disposal, usually through fees or schemes. Advantages: shifts costs from municipalities to producers; funds collection and recycling of packaging, plastics, e-waste and batteries; encourages less packaging and recyclable design; supports a circular economy. Disadvantages in Bhutan: most products are imported, so the ''producer'' is a small importer; the small market makes schemes costly; monitoring and enforcement capacity is limited; costs may be passed to consumers; informal traders may avoid it.', null, '[{"point": "Definition: producers/importers responsible for products through post-consumer stage (take-back, recycling, fees)", "marks": 3}, {"point": "Advantages: shifts cost from government, encourages eco-design, funds collection and recycling, reduces plastic/e-waste", "marks": 4}, {"point": "Disadvantages in Bhutan: mostly imported goods, small market, enforcement and monitoring difficulty, higher prices", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case2', 3, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan''s long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country''s pristine environment through an improved waste management system.

4. In what ways can an effective waste management system help mitigate or reduce greenhouse gas emissions? (10 marks)', 'Organic waste rotting in landfills produces methane, a powerful greenhouse gas; composting or anaerobic digestion (with biogas used as energy) avoids it. Landfill gas can be captured and flared or used. Recycling and reuse save the energy and emissions of producing new materials. Waste reduction at source avoids emissions across the life cycle. Stopping open burning cuts CO₂ and black carbon. Efficient collection routes and electric vehicles reduce transport emissions.', null, '[{"point": "Diverting organics from landfill (methane) through composting/anaerobic digestion and biogas", "marks": 4}, {"point": "Recycling and reuse save energy and raw materials; reducing waste generation", "marks": 3}, {"point": "Landfill gas capture, ending open burning, efficient collection transport", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case2', 4, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II
The 13th Five Year Plan (FYP) strategically prioritises "Waste Management Enterprise Development" as a cornerstone initiative to modernise and strengthen the waste management system in the country. By explicitly encouraging private sector engagement, the plan opens a pathway for innovative, market-driven solutions to address increasing issues of waste. This approach not only fosters entrepreneurship in the waste management landscape but also aligns with Bhutan''s long-term vision of achieving a Zero Waste Society, where sustainability, circular economy principles and community participation converge to protect the country''s pristine environment through an improved waste management system.

5. How can advocacy, awareness and education programmes contribute to Bhutan''s pursuit of a Zero Waste Society? (10 marks)', 'Awareness and education change attitudes and daily habits - reducing, reusing, refusing single-use plastics and segregating waste at source - and build a sense of shared responsibility linked to Bhutanese values of respect for nature. Channels include school curricula and eco-clubs, school waste banks, media and social media campaigns, religious and community leaders, and national movements such as cleaning campaigns. Informed citizens comply with waste rules, pay fees, support recycling enterprises and pressure businesses, making policies effective.', null, '[{"point": "Change attitudes and behaviour: segregation, reduce, reuse, refuse plastics", "marks": 4}, {"point": "Channels: schools and curricula, school waste banks, media/social media, religious and community leaders, campaigns (e.g. Clean Bhutan)", "marks": 4}, {"point": "Builds participation, compliance with rules and demand for green enterprises", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Environmental Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-envsci2025-case2', 5, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Kyoto Protocol was adopted in', null, 'Adopted in Kyoto in 1997.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2015', false, 1), ('B', '1992', false, 2), ('C', '1997', true, 3), ('D', '1987', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most of the Earth''s ozone layer lies in the', null, 'About 90% of ozone is in the stratosphere.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'stratosphere', true, 1), ('B', 'thermosphere', false, 2), ('C', 'troposphere', false, 3), ('D', 'mesosphere', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Montreal Protocol deals with', null, 'It phases out ozone-depleting substances.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'wetland protection', false, 1), ('B', 'ozone-depleting substances', true, 2), ('C', 'hazardous waste trade', false, 3), ('D', 'greenhouse gas trading', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A high Biochemical Oxygen Demand (BOD) in a river indicates', null, 'Microbes use more oxygen to break down organic matter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'high dissolved oxygen', false, 1), ('B', 'high organic pollution', true, 2), ('C', 'low temperature', false, 3), ('D', 'clean water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Constitution of Bhutan requires the country to maintain forest cover of at least', null, 'Article 5: a minimum of 60% of total land under forest for all time.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'environmental-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Environmental Science): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'environmental-science'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '50%', false, 1), ('B', '70%', false, 2), ('C', '60%', true, 3), ('D', '72%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
commit;
