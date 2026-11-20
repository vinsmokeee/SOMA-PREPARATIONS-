-- ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'medical-laboratory-technology', 'Medical Laboratory Technology' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'medical-laboratory-technology') is null then raise exception 'unknown specialisation medical-laboratory-technology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'medical-laboratory-technology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The gold standard laboratory test for diagnosis of leptospirosis is', null, 'The microscopic agglutination test (MAT) is the gold standard for leptospirosis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polymerase chain reaction', false, 1), ('B', 'All the above', false, 2), ('C', 'Microscopic agglutination test', true, 3), ('D', 'Enzyme-linked immunosorbent assays', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following are correct statement regarding electron microscope EXCEPT:', null, 'Zacharias Janssen is credited with the compound light microscope; the electron microscope was built by Knoll and Ruska.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Offers the highest resolution and magnification', false, 1), ('B', 'First invented by Zacharias Janssen', true, 2), ('C', 'Electrons beam is a source of illumination', false, 3), ('D', 'employ electromagnetic lenses', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose the correct group of pathogens not linked with zoonosis:', null, 'Measles virus and Corynebacterium diphtheriae infect only humans (not zoonotic).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mycobacterium tuberculosis & Salmonella', false, 1), ('B', 'Measles virus and Corynebacterium Diphtheria', true, 2), ('C', 'Anthrax & vibrio cholera', false, 3), ('D', 'Brucella & Staphylococcus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Identify the incorrect statement regarding Viruses:', null, 'Viruses are not considered living organisms in the usual sense; the other statements are true.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'They are obligate intracellular parasites', false, 1), ('B', 'They are without metabolic mechanism', false, 2), ('C', 'They are the smallest living organism', true, 3), ('D', 'Virus has only either RNA or DNA.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most vulnerable to the heat and chemical sterilization is:', null, 'Viruses (especially enveloped ones) are the most easily killed; spores and prions are the most resistant.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Spores', false, 1), ('B', 'Prions', false, 2), ('C', 'Tubercle bacilli', false, 3), ('D', 'Viruses', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most accurate method of diagnosis of dengue during the first week of infection is:', null, 'In the first week (viraemia) RT-PCR (or NS1 antigen) is most accurate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RT-PCR', true, 1), ('B', 'IgG only', false, 2), ('C', 'IgG & IgM', false, 3), ('D', 'IgM only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The body''s response to measles is example of:', null, 'Recovery from measles produces adaptive (natural active) immunity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Natural passive immunity', false, 1), ('B', 'Adaptive immunity', true, 2), ('C', 'Artificial passive immunity', false, 3), ('D', 'Artificial active immunity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Normal fasting blood sugar level in human adult is:', null, 'Normal fasting glucose is about 70-100 mg/dL; 80-100 is the best option.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '150-200 mg/dl', false, 1), ('B', '100-125 mg/dl', false, 2), ('C', '100-150 mg/dl', false, 3), ('D', '80-100 mg/dl', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Primary Component of Gram Stain:', null, 'Crystal violet is the primary stain in Gram staining.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Eosin', false, 1), ('B', 'Alcohol', false, 2), ('C', 'crystal violet', true, 3), ('D', 'Iodine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not a Romanowsky stain:', null, 'Gram stain is not a Romanowsky stain.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Leishman’s stain', false, 1), ('B', 'Gram Stain', true, 2), ('C', 'Giemsas stain', false, 3), ('D', 'Jenner’s stain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose the incorrect functions of fixatives for tissues and cells:', null, 'Fixatives do not make tissue impermeable; they arrest autolysis, harden and preserve tissue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Enhance tissue impermeability', true, 1), ('B', 'Hardening of the tissue', false, 2), ('C', 'Protect cells and tissues from osmotic damage', false, 3), ('D', 'Arrests cell autolysis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the optimum concentration of the formalin used as fixatives:', null, '10% (neutral buffered) formalin is the standard fixative.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '15%', false, 1), ('B', '20%', false, 2), ('C', '5%', false, 3), ('D', '10%', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the best site for venipuncture:', null, 'The median cubital vein is the preferred venipuncture site.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'basilica vein', false, 1), ('B', 'medial cubital vein', true, 2), ('C', 'cephalic vein', false, 3), ('D', 'femoral vein', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A blood specimen collected in plain tube is centrifuged. It will separate into:', null, 'Clotted blood in a plain tube separates into serum and clot.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Serum and plasma', false, 1), ('B', 'Plasma, buffy coat, RBC', false, 2), ('C', 'Serum and clot', true, 3), ('D', 'Plasma and clot', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following causes hemolysis during blood collection EXCEPT:', null, 'Preservatives do not cause haemolysis; small needles, shaking and wrong anticoagulant ratio do.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wrong concentration of anticoagulant', false, 1), ('B', 'Vigorously shaking the blood specimen', false, 2), ('C', 'Using a 25-gauge needle on an adult', false, 3), ('D', 'Using preservatives', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To make a 1:5 dilution of serum sample, dilute:', null, '1 part serum + 4 parts diluent = 1:5 (1 in 5 total).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.0 mL of serum + 4.0 mL of diluent', true, 1), ('B', '1.0 mL of serum + 6.0 mL of diluent', false, 2), ('C', '5.0 mL of serum + 1.0 mL of diluent', false, 3), ('D', '1.0 mL of serum + 5.0 mL of diluent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the normality of a solution of sodium hydroxide (molecular weight=40) containing 20 grams in 100 mL of solution?', null, '20 g / 40 = 0.5 eq in 0.1 L = 5.0 N.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.5N', false, 1), ('B', '5.0N', true, 2), ('C', '1.0N', false, 3), ('D', '0.4N', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Spreading of disease Worldwide is called as?', null, 'Worldwide spread is a pandemic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Infection', false, 1), ('B', 'Endemic', false, 2), ('C', 'Pandemic', true, 3), ('D', 'Epidemic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sodium is responsible for the maintenance of:', null, 'Sodium maintains osmotic pressure of extracellular fluid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Osmotic pressure of body fluids', true, 1), ('B', 'Cardiac muscle contractions', false, 2), ('C', 'Blood coagulation', false, 3), ('D', 'Salt intake', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Method of sterilization used for glass wares and test tubes is:', null, 'Dry glassware is sterilised in a hot air oven.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'Autoclave', false, 2), ('C', 'Pasteurization', false, 3), ('D', 'Hot air oven', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of urine sample is preferred for bacterial examination?', null, 'A midstream clean-catch sample is used for bacterial culture.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Last-night urine sample', false, 1), ('B', 'Random urine sample', false, 2), ('C', 'First-morning urine sample', false, 3), ('D', 'Midstream clean-catch urine sample', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following causes systemic errors in the laboratory quality control system EXCEPT:', null, 'Inappropriate pipetting gives random error; the others cause systematic error.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inappropriate pipetting', true, 1), ('B', 'Calibration errors', false, 2), ('C', 'Expiring of reagents', false, 3), ('D', 'Change in the reagent lot', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose the incorrect characteristic of lyophilized serum used as quality control material:', null, 'Lyophilised material is not as easy to prepare as frozen serum (incorrect statement).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is in solidified and powder form.', false, 1), ('B', 'It needs to be reconstituted.', false, 2), ('C', 'Easy to prepare like frozen serum', true, 3), ('D', 'It is stable for longer period at 2-8oC', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following causes random errors in laboratory analysis EXCEPT:', null, 'A change of personnel tends to cause systematic shifts; the others cause random errors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electrical fluctuation', false, 1), ('B', 'Change in laboratory personal', true, 2), ('C', 'Pipetting errors', false, 3), ('D', 'Clog formation in the tubing of the analyzers.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Kinetic method of measurement involves:', null, 'Kinetic methods record absorbance at intervals during the reaction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Recording of absorbance at the certain interval of time during the chemical reactions.', true, 1), ('B', 'Recording of absorbance at the fixed time when the reaction is completed.', false, 2), ('C', 'Recording of absorbance at the beginning of the reaction.', false, 3), ('D', 'Recording of absorbance at the fixed time when the reaction is about to be completed.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of blood cell is reduced by Dengue virus?', null, 'Dengue causes thrombocytopenia.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neutrophils', false, 1), ('B', 'Monocytes', false, 2), ('C', 'Platelets', true, 3), ('D', 'Eosinophils', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following enzymes is responsible for the breakdown of starch into glucose?', null, 'Amylase breaks starch down to sugars.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Amylase', true, 1), ('B', 'Lactase', false, 2), ('C', 'Protease', false, 3), ('D', 'Lipase', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following parameters can be used to calculate standard deviation in the Laboratory IQC?', null, 'SD = square root of the variance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Median and variance', false, 1), ('B', 'Square root of Variance', true, 2), ('C', 'Standard deviation and the mean', false, 3), ('D', 'Variance and mean', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the types of specimens, the time of specimen collection and the laboratory tests performed for the diagnosis of leptospirosis.', 'Specimens and timing: during the first week of illness (leptospiraemic/acute phase, days 1-7) - whole blood (EDTA or heparin) for PCR and culture, and CSF if meningitis is suspected; from the second week (immune/leptospiruric phase) - urine for PCR/culture, and serum for antibody tests; paired sera (acute and convalescent, 10-14 days apart) to show a rise in titre. Post-mortem tissues (kidney, liver) in fatal cases.
Tests: microscopic agglutination test (MAT) - gold standard; fourfold rise in titre or a single high titre (e.g. ≥1:400) confirms. IgM ELISA and rapid diagnostic tests - screening from about day 5. PCR/real-time PCR on blood (first week) or urine - early confirmation. Culture in EMJH or Fletcher''s medium (slow, weeks). Dark-field microscopy of blood or urine (low sensitivity). Supportive tests: CBC, renal and liver function, urinalysis.', null, '[{"point": "Specimens and timing: first week (leptospiraemic phase) - blood (EDTA/heparin), CSF; after first week - urine; serum (acute and convalescent)", "marks": 2.5}, {"point": "Tests: MAT (gold standard), IgM ELISA/ rapid tests, PCR/ RT-PCR, dark-field microscopy, culture (EMJH medium)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define and describe the principle of the Ziehl-Neelsen (ZN) staining technique, and give the interpretation and grading of AFB seen on the smear using the WHO grading scale.', 'ZN staining is a differential stain used to detect acid-fast bacilli (AFB) such as Mycobacterium tuberculosis. Principle: the cell wall of mycobacteria is rich in mycolic acid (lipid); hot carbol fuchsin penetrates it and, once stained, the bacilli resist decolourisation with acid-alcohol (or 25% sulphuric acid), so they stay red; non-acid-fast cells and background lose the stain and take the methylene blue counterstain.
Steps: fixed smear flooded with carbol fuchsin and heated till steaming for 5 min, washed; decolourised with acid-alcohol/25% H2SO4; washed; counterstained with methylene blue 1 min; washed, dried, examined under oil immersion (100x).
Interpretation: AFB appear as red/pink slender, slightly curved rods on a blue background.
WHO/IUATLD grading (per field counts under oil immersion): no AFB in 100 fields - negative; 1-9 AFB in 100 fields - scanty (report exact number); 10-99 AFB in 100 fields - 1+; 1-10 AFB per field (examine 50 fields) - 2+; more than 10 AFB per field (examine 20 fields) - 3+.', null, '[{"point": "Definition and principle: differential acid-fast stain; mycolic acid retains hot carbol fuchsin and resists decolourisation by acid-alcohol; counterstain methylene blue", "marks": 2}, {"point": "Steps and interpretation: AFB red rods on blue background", "marks": 1}, {"point": "WHO/IUATLD grading: negative, scanty (1-9/100 fields), 1+, 2+, 3+", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the principle of the Leishman staining technique and describe the staining steps. Give the colour seen in each of the following: red cells; nuclei of leucocytes; cytoplasm of neutrophils; eosinophil granules; basophil granules; monocyte cytoplasm; small lymphocytes; large lymphocytes.', 'Principle: Leishman stain is a Romanowsky stain - a mixture of eosin (acidic dye) and methylene blue/azure (basic dyes) dissolved in methanol. Methanol fixes the smear. Acidic cell components (nuclear DNA, RNA in cytoplasm, basophil granules) bind the basic dyes and stain blue-purple; basic components (haemoglobin, eosinophil granules) bind eosin and stain pink-orange. Staining depends on buffered water at pH 6.8.
Steps: make a thin smear and air-dry; cover with Leishman stain for 1-2 minutes (fixation); add about double the volume of buffered distilled water (pH 6.8), mix gently and leave 7-10 minutes; wash with buffered water until pinkish; air-dry and examine under oil immersion.
Colours: red cells - pink/salmon; nuclei of leucocytes - purple/violet; neutrophil cytoplasm - pale pink with fine violet-pink granules; eosinophil granules - bright orange-red; basophil granules - dark blue-black/purple; monocyte cytoplasm - pale greyish-blue (''ground glass''); small lymphocytes - dark purple nucleus with a thin rim of sky-blue cytoplasm; large lymphocytes - purple nucleus with more abundant pale/clear blue cytoplasm, sometimes a few azurophilic granules.', null, '[{"point": "Principle: Romanowsky stain - eosin (acidic) stains basic components pink, methylene blue/azure (basic) stains acidic components (nuclei) blue-purple; methanol fixes; buffer pH 6.8", "marks": 1.5}, {"point": "Steps: thin smear, cover with stain 2 min (fixation), add double buffered water 7-10 min, wash, dry, examine", "marks": 1.5}, {"point": "Colours: RBC pink/ salmon; nuclei purple; neutrophil cytoplasm pale pink with fine lilac granules; eosinophil granules orange-red; basophil granules dark blue-purple; monocyte cytoplasm grey-blue; small lymphocyte dark purple nucleus, scanty sky-blue cytoplasm; large lymphocyte more pale blue cytoplasm", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the human blood group systems.', 'Blood group systems are sets of inherited antigens on the red cell surface; the ISBT recognises more than 40 systems. The most important:
ABO system (Landsteiner, 1901): based on A and B antigens. Group A - A antigen, anti-B in plasma; Group B - B antigen, anti-A; Group AB - both antigens, no antibodies (universal recipient); Group O - no antigens, both anti-A and anti-B (universal red cell donor). The antibodies occur naturally (IgM), so ABO-incompatible transfusion causes acute haemolytic reactions.
Rh system: mainly the D antigen - Rh positive (D present) or Rh negative (D absent); also C, c, E, e. Anti-D is not naturally present but forms after exposure (transfusion or pregnancy), and can cause haemolytic disease of the foetus and newborn; prevented by anti-D immunoglobulin.
Other clinically significant systems: Kell (K - strong immunogen, HDFN), Duffy (Fya/Fyb; Fy(a-b-) resists P. vivax), Kidd (Jka/Jkb - delayed haemolytic reactions), MNS, Lewis, Lutheran and P. They matter in antibody screening and cross-matching.', null, '[{"point": "ABO system: antigens A and B on RBC, natural antibodies in plasma, four groups, Landsteiner, transfusion importance", "marks": 2}, {"point": "Rh system: D antigen, Rh positive/negative, immune antibodies, HDN", "marks": 2}, {"point": "Other systems (ISBT recognises 40+): Kell, Duffy, Kidd, MNS, Lewis, Lutheran, P; clinical relevance", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Poor specimen collection from the Emergency Department
In one of the laboratories in Bhutan, laboratory staff repeatedly receive samples from the Emergency Department (ED) of the hospital that are inappropriately labelled, with tubes and sample trays stained with blood, haemolysed blood, blood drawn in the wrong tube for the test requested, or with an insufficient quantity of blood. When laboratory staff call the nurse who drew the blood to ask for a resample, they occasionally experience hostility. In one instance, a ward boy delivered a tray of blood samples with three tubes and a requisition form, but the tubes were not labelled. When the laboratory technicians called the ED, the in-charge told them to trust that the blood tubes belonged to the patient on the requisition. The laboratory in-charge explained that the laboratory could not accept the specimen due to sampling issues. The nurse hung up the phone.

1. The laboratory technician reported five important problems with blood samples collected by Emergency Department staff. List the five problems and, against each, give 2-3 key words for the major risks of these unprofessional practices to (i) patients and (ii) hospital staff (nurses and laboratory staff). Choose from these risks: wrong results; wrong diagnosis; infection transmission; wrong treatment; medico-legal cases; administrative actions; patient allegation. (20 marks)', '1. Unlabelled or inappropriately labelled tubes - Patients: wrong results, wrong diagnosis, wrong treatment (sample mix-up). Staff: medico-legal cases, administrative actions, patient allegation.
2. Tubes and sample tray stained with blood - Patients: infection transmission. Staff: infection transmission (blood-borne HBV, HCV, HIV), administrative actions.
3. Haemolysed blood - Patients: wrong results (e.g. falsely high potassium, LDH), wrong diagnosis, wrong treatment. Staff: patient allegation, administrative actions.
4. Blood drawn in the wrong tube for the test - Patients: wrong results, wrong diagnosis, wrong treatment (or delay and repeat pricks). Staff: administrative actions, patient allegation.
5. Insufficient quantity of specimen - Patients: wrong results (wrong blood-to-anticoagulant ratio, e.g. coagulation tests), wrong diagnosis, wrong treatment/delay. Staff: patient allegation, administrative actions.
(The hostile communication and refusal to resample also increase risks of wrong treatment and medico-legal cases.)', null, '[{"point": "Five problems identified: unlabelled/ wrongly labelled tubes; blood-stained tubes and trays; haemolysed samples; wrong tube for test; insufficient sample volume (also hostility/ poor communication)", "marks": 5}, {"point": "Risks to patients matched correctly for each (wrong results, wrong diagnosis, wrong treatment, infection transmission, delay/ resampling)", "marks": 8}, {"point": "Risks to staff matched correctly (infection transmission, medico-legal cases, administrative actions, patient allegation)", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case1', 1, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Poor specimen collection from the Emergency Department
In one of the laboratories in Bhutan, laboratory staff repeatedly receive samples from the Emergency Department (ED) of the hospital that are inappropriately labelled, with tubes and sample trays stained with blood, haemolysed blood, blood drawn in the wrong tube for the test requested, or with an insufficient quantity of blood. When laboratory staff call the nurse who drew the blood to ask for a resample, they occasionally experience hostility. In one instance, a ward boy delivered a tray of blood samples with three tubes and a requisition form, but the tubes were not labelled. When the laboratory technicians called the ED, the in-charge told them to trust that the blood tubes belonged to the patient on the requisition. The laboratory in-charge explained that the laboratory could not accept the specimen due to sampling issues. The nurse hung up the phone.

2. The laboratory HOD raised these issues with hospital management. The hospital director asked the HOD to plan a one-day training for nurses on good laboratory practice covering: blood collection procedures; identification of vials and tubes and blood collection sites; blood storage and transport; and communication skills.
From these topics, write the blood collection procedure in detail. (20 marks)', '1. Preparation: check the request form; gather equipment (correct tubes, needle/vacutainer, tourniquet, 70% alcohol swabs, gauze, plaster, sharps container, gloves); perform hand hygiene and wear gloves. 2. Patient identification: ask the patient to state full name and date of birth/CID and match with the form (two identifiers); explain the procedure and get consent; check fasting or special requirements. 3. Position the patient comfortably with arm extended. 4. Apply the tourniquet 7-10 cm above the site for no more than 1 minute; select a vein - median cubital preferred, then cephalic or basilic; avoid arms with IV infusions, haematoma, fistula or mastectomy side. 5. Clean the site with 70% alcohol in a circular motion and let it air-dry (prevents haemolysis and stinging); do not touch after cleaning. 6. Anchor the vein, insert the needle bevel up at 15-30°; collect tubes in the correct order of draw (blood culture → citrate → plain/serum → heparin → EDTA → fluoride), filling each to the marked volume. 7. Gently invert additive tubes 5-10 times (do not shake). 8. Release the tourniquet before withdrawing the needle; apply pressure with gauze; activate the safety device and discard the needle immediately into a sharps container (no recapping). 9. Label every tube at the bedside, in the patient''s presence, with name, ID number, date, time and collector''s initials; complete the requisition. 10. Check the patient, apply a plaster; clean any spills; send samples promptly in a closed, leak-proof container at the correct temperature with the form.', null, '[{"point": "Preparation: check request form, gather equipment, hand hygiene, PPE, explain/ consent, identify patient with two identifiers", "marks": 5}, {"point": "Site selection and tourniquet (7-10 cm above, <1 min), clean with 70% alcohol and let dry", "marks": 4}, {"point": "Venipuncture technique: anchor vein, needle bevel up 15-30°, order of draw, fill to correct volume, gently invert tubes", "marks": 5}, {"point": "After: release tourniquet before withdrawing needle, pressure, sharps disposal, label tubes at bedside with ID/ date/ time/ initials, complete form, transport promptly; avoid haemolysis/ contamination", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case1', 2, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Poor specimen collection from the Emergency Department
In one of the laboratories in Bhutan, laboratory staff repeatedly receive samples from the Emergency Department (ED) of the hospital that are inappropriately labelled, with tubes and sample trays stained with blood, haemolysed blood, blood drawn in the wrong tube for the test requested, or with an insufficient quantity of blood. When laboratory staff call the nurse who drew the blood to ask for a resample, they occasionally experience hostility. In one instance, a ward boy delivered a tray of blood samples with three tubes and a requisition form, but the tubes were not labelled. When the laboratory technicians called the ED, the in-charge told them to trust that the blood tubes belonged to the patient on the requisition. The laboratory in-charge explained that the laboratory could not accept the specimen due to sampling issues. The nurse hung up the phone.

3. Name at least five types of coloured vials used for blood collection, describe their purposes, and name the anticoagulants or chemicals in each with their functions. (10 marks)', 'Red top (plain/clot activator) - no anticoagulant (or silica clot activator): blood clots to give serum for serology, biochemistry, blood bank. Yellow/gold top (SST) - clot activator with separator gel: gel forms a barrier between serum and cells; biochemistry and serology. Light blue top - 3.2% sodium citrate (1:9 ratio): binds calcium (reversible); coagulation tests (PT/INR, APTT). Green top - lithium or sodium heparin: activates antithrombin to inhibit thrombin; plasma chemistry, electrolytes, ammonia. Lavender/purple top - K2/K3 EDTA: chelates calcium, preserves cell morphology; CBC, blood film, HbA1c, blood grouping. Grey top - sodium fluoride with potassium oxalate: fluoride inhibits glycolysis (enolase), oxalate precipitates calcium; glucose and lactate. (Black top - sodium citrate 1:4 for ESR.)', null, '[{"point": "Five tubes correctly with colour, additive, function and use (2 marks each): red/plain, yellow/gold SST gel, light blue citrate, green heparin, lavender/purple EDTA, grey fluoride-oxalate, blood culture bottles", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case1', 3, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors.

1. Using the following data, calculate (i) the mean, (ii) the standard deviation (SD), (iii) the coefficient of variation (CV), (iv) mean ± 2SD and (v) mean ± 3SD.
ALT control results (IU/L), days 1-11: 26, 27, 28, 28, 29, 28, 28, 26, 26, 27, 28.
Hint: variance V = Σ(x - mean)² / (n - 1); SD = √V; CV = SD / mean x 100. (20 marks)', '(i) Mean = Σx / n = 301 / 11 = 27.36 IU/L.
(ii) Deviations squared: 26 → 1.86 (x3 = 5.58); 27 → 0.13 (x2 = 0.26); 28 → 0.40 (x5 = 2.02); 29 → 2.68. Σ(x - mean)² = 10.55. Variance = 10.55 / 10 = 1.055. SD = √1.055 = 1.03 IU/L.
(iii) CV = SD / mean x 100 = 1.03 / 27.36 x 100 = 3.75%.
(iv) Mean ± 2SD = 27.36 ± 2.05 → 25.31 to 29.42 IU/L.
(v) Mean ± 3SD = 27.36 ± 3.08 → 24.28 to 30.44 IU/L.
(No value lies outside ±2SD, so all 11 results are kept when trimming.)', null, '[{"point": "(i) Mean = 301/11 = 27.36 IU/L", "marks": 4}, {"point": "(ii) Σ(x - x̄)² = 10.55; V = 1.055; SD = 1.03", "marks": 6}, {"point": "(iii) CV = 1.03/27.36 x 100 = 3.75%", "marks": 4}, {"point": "(iv) Mean ± 2SD = 25.31 - 29.42", "marks": 3}, {"point": "(v) Mean ± 3SD = 24.28 - 30.44", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case2', 1, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors.

2. In the control chart shown (Levey-Jennings chart, AST level I, days 1-27), identify the control rule violations. For each violation state the possible causes and suggest corrective actions. (10 marks)', 'Day 8 - one result above +3SD: 1-3s violation (random error, possibly gross). Causes: pipetting error, air bubble or clot in the analyser, wrong control or reconstitution error, electrical fluctuation. Action: reject the run, repeat with a fresh control; if within limits, continue; check pipettes and the sample probe. Days 11-17 - seven consecutive results below -1SD (and below the mean): 4-1s violation (and a shift if continued to 10x) - systematic error. Causes: new reagent or calibrator lot, calibration drift, deteriorating control material, change in technique/personnel, temperature changes. Action: stop reporting, recalibrate, check reagent and control lots and storage, perform maintenance, re-run control and affected patient samples. Days 18-27 - a steady downward trend over ten days, with days 25-26 below -2SD (2-2s), day 27 below -3SD (1-3s) and days 23-27 beyond -1SD (4-1s): systematic error (drift). Causes: gradual reagent deterioration or evaporation, ageing photometer lamp, dirty cuvettes, drift in incubator temperature, deteriorating control. Action: reject runs, recalibrate, replace reagents/controls, perform maintenance (lamp, cuvettes), verify with fresh control, and re-test patient samples since the trend began; document all actions.', null, '[{"point": "Day 8: 1-3s (single value > +3SD) - random error: pipetting, bubbles, sample/control handling, electrical fluctuation; action reject run, repeat with fresh control, troubleshoot", "marks": 3}, {"point": "Days 11-17: values consecutively below -1SD/ mean - 4-1s (and run below mean) - systematic shift: reagent/ calibration/ lot change, deteriorating control; recalibrate, new reagent/control", "marks": 3}, {"point": "Days 18-27: steady downward trend; 2-2s at days 25-26 and 1-3s at day 27; 4-1s days 23-27 - systematic drift: reagent deterioration, lamp ageing, temperature, evaporation; stop reporting, maintenance, recalibrate, new reagents, repeat patient samples", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case2', 2, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2025-lj-chart.png')
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors.

3. Use the diagram (normal Gaussian distribution and control chart) to state the THREE most important properties of the normal Gaussian distribution applied in the internal quality control system. (5 marks)', '1. The distribution is symmetrical and bell-shaped about the mean (mean = median = mode), so control results scatter equally above and below the mean. 2. A fixed proportion of results falls within each SD band: about 68.2% within ±1SD, 95.5% within ±2SD and 99.7% within ±3SD. 3. Therefore results outside ±2SD (about 1 in 20) or ±3SD (about 3 in 1000) are unlikely to happen by chance, so they are used as warning and rejection limits on the Levey-Jennings chart; patterns such as many points on one side of the mean indicate systematic error.', null, '[{"point": "Symmetrical bell-shaped curve around the mean (mean = median = mode)", "marks": 1.5}, {"point": "68.2% within ±1SD, 95.5% within ±2SD, 99.7% within ±3SD", "marks": 2}, {"point": "Results outside ±2SD (4.5%)/±3SD (0.3%) are unlikely by chance - basis of warning/ rejection limits", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case2', 3, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2025-gaussian.png')
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors.

4. Four frequency distributions of repeated control results are described below, each relative to the true (target) value. For each, choose the most appropriate pair of terms: accurate and precise; inaccurate and precise; inaccurate and imprecise; accurate and imprecise.
Diagram 1: a wide, flat curve centred away from the target value.
Diagram 2: a narrow, tall curve centred away from the target value.
Diagram 3: a wide, flat curve centred on the target value.
Diagram 4: a narrow, tall curve centred on the target value. (5 marks)', 'Diagram 1 - inaccurate and imprecise (mean away from the target, wide spread). Diagram 2 - inaccurate but precise (results agree closely but are biased). Diagram 3 - accurate but imprecise (mean on target, wide spread). Diagram 4 - accurate and precise (centred on target, narrow spread). Accuracy is closeness of the mean to the true value; precision is the closeness of repeated results to each other.', null, '[{"point": "1 inaccurate, imprecise; 2 inaccurate, precise; 3 accurate, imprecise; 4 accurate, precise; with reasoning (accuracy = closeness to true value, precision = spread)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case2', 4, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control in clinical chemistry
A robust internal quality control (IQC) system has been established in clinical chemistry and haematology in all laboratories in Bhutan since 2011 to monitor the precision and accuracy of laboratory results. In the Biochemistry section at JDWNRH, Mr Jigme Tenzin establishes his IQC for ALT using control results for 11 consecutive days. The control results of 11 days are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (LJ) chart and Westgard multi-rules are used to detect errors.

5. The Royal Centre for Disease Control (RCDC) evaluates district laboratories every year using sputum panel slides. RCDC sent 50 unstained slides to Trashigang hospital: 45 AFB negative and 5 positive. The Trashigang laboratory technician reported 48 negative and 2 positive. Complete a 2 x 2 table (Trashigang result against RCDC result) and calculate: (i) sensitivity, (ii) specificity, (iii) false positive rate, (iv) false negative rate. (10 marks)', 'Assuming the two slides reported positive were truly positive:
Trashigang positive: RCDC positive 2 (TP), RCDC negative 0 (FP) - total 2.
Trashigang negative: RCDC positive 3 (FN), RCDC negative 45 (TN) - total 48.
Totals: RCDC positive 5, RCDC negative 45, overall 50.
(i) Sensitivity = TP / (TP + FN) = 2/5 = 40%.
(ii) Specificity = TN / (TN + FP) = 45/45 = 100%.
(iii) False positive rate = FP / (FP + TN) = 0/45 = 0%.
(iv) False negative rate = FN / (FN + TP) = 3/5 = 60%.
Three missed positives (major errors) show unacceptable performance; the laboratory needs retraining in smear staining and reading, checking of reagents and microscope, and follow-up EQA.', null, '[{"point": "Table: TP 2, FP 0, FN 3, TN 45; totals 5/45/50 (assuming the 2 reported positives were true positives)", "marks": 4}, {"point": "Sensitivity 2/5 = 40%; specificity 45/45 = 100%", "marks": 3}, {"point": "FPR 0/45 = 0%; FNR 3/5 = 60%; comment on poor performance and retraining", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2025-case2', 5, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of microscopy is best for examining unstained living cells such as motile organisms in a wet mount?', null, 'Phase-contrast microscopy increases contrast of transparent, unstained living cells.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electron', false, 1), ('B', 'Polarising', false, 2), ('C', 'Bright-field', false, 3), ('D', 'Phase-contrast', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Blood components such as platelets should be prepared from whole blood and stored at', null, 'Platelets are stored at 20-24 °C with gentle agitation; refrigeration damages them.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20-24 °C with continuous agitation', true, 1), ('B', '37 °C', false, 2), ('C', '2-6 °C', false, 3), ('D', '-30 °C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
commit;
