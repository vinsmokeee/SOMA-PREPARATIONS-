-- ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'medical-laboratory-technology', 'Medical Laboratory Technology' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'medical-laboratory-technology') is null then raise exception 'unknown specialisation medical-laboratory-technology'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All of the following are acid-fast organisms EXCEPT:', null, 'Mycobacteria, Nocardia (weakly) and Isospora oocysts are acid-fast; Staphylococcus is not.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nocardia', false, 1), ('B', 'Staphylococcus', true, 2), ('C', 'Mycobacterium tuberculosis', false, 3), ('D', 'Isospora belli', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Identify correct statement regarding bacteria:', null, 'All three statements are standard textbook facts (mesosome functions, capsule roles, heterotrophs).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Respiration, cell division and sporulation are the functions of mesosome in bacteria.', false, 1), ('B', 'All the above', true, 2), ('C', 'Capsule in bacteria enables adherence to surface and protection against phagocytosis', false, 3), ('D', 'Heterotrophs are the bacteria that are unable to synthesize their own food materials.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is most resistant to sterilization?', null, 'Prions are the most resistant infectious agents to standard sterilisation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Viruses', false, 1), ('B', 'Spores', false, 2), ('C', 'Prions', true, 3), ('D', 'Tubercle bacilli', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Anti-D given to a Rh negative pregnant woman with Rh- positive fetus, before delivery is an example of:', null, 'Giving preformed antibody (anti-D immunoglobulin) is artificial passive immunity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Artificial active immunity', false, 1), ('B', 'Adaptive immunity', false, 2), ('C', 'Natural passive immunity', false, 3), ('D', 'Artificial passive immunity', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The basic component of Leishman''s stain is:', null, 'Methylene blue (and its oxidation products, azures) is the basic component of Romanowsky stains such as Leishman''s; eosin is the acidic dye.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'Methylene blue', true, 2), ('C', 'Eosin', false, 3), ('D', 'Malachite green', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a Romanowsky stain', null, 'Leishman, Giemsa and Jenner are all Romanowsky-type stains.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Leishman’s stain', false, 1), ('B', 'Jenners stain', false, 2), ('C', 'All the above', true, 3), ('D', 'Giemsas stain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following types of microscopy is valuable in the identification of crystals that are able to rotate light?', null, 'Polarising microscopy identifies birefringent crystals (e.g. urate, CPPD).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polarizing', true, 1), ('B', 'Compound bright field', false, 2), ('C', 'Dark field', false, 3), ('D', 'Phase-contrast', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the usual concentration of the commercial formaldehyde available:', null, 'Commercial formalin is 37-40% formaldehyde gas in water.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '40 to 50%', false, 1), ('B', '37 to 40%', true, 2), ('C', '17 to 27%', false, 3), ('D', '7 to 10%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What vein/veins is not used to obtain a venous blood sample:', null, 'The femoral vein is not used for routine venous sampling.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'femoral vein', true, 1), ('B', 'cephalic vein', false, 2), ('C', 'medial cubital vein', false, 3), ('D', 'basilica vein', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A blood specimen collected in a heparinized tube is centrifuged. It will separate into:', null, 'Heparin prevents clotting, so centrifuged blood separates into plasma, buffy coat and red cells.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plasma, buffy coat, RBC', true, 1), ('B', 'Serum and clot', false, 2), ('C', 'Plasma and clot', false, 3), ('D', 'Serum and plasma', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which statement is false when setting up an ESR:', null, 'An ESR must be set up away from vibration, e.g. not near a centrifuge - so b is false.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'it should be performed on fresh blood', false, 1), ('B', 'it should be set up near a centrifuge', true, 2), ('C', 'the blood level must be at exactly zero', false, 3), ('D', 'it must be read in exactly one hour', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which microscope makes things appear three dimensional?', null, 'A dissection (stereo) microscope gives a three-dimensional view.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Compound microscope', false, 1), ('B', 'Dissection microscope', true, 2), ('C', 'Simple microscope', false, 3), ('D', 'Phase contrast microscope', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During the window period of patient with AIDS, best diagnostic test is:', null, 'In the window period antibodies are not yet detectable; RT-PCR detects viral RNA.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RT-PCR', true, 1), ('B', 'Western Blot', false, 2), ('C', 'ELISA', false, 3), ('D', 'Rapid test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Method of sterilization used for culture media is:', null, 'Culture media are sterilised by autoclaving.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Autoclave', true, 1), ('B', 'None of the above', false, 2), ('C', 'Pasteurization', false, 3), ('D', 'Hot air oven', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Temperature range used for autoclaving is:', null, 'Standard autoclaving: 121 °C (15 psi) for 15 minutes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100°C for 30 min', false, 1), ('B', '100°C for 10 min', false, 2), ('C', '121°C for 15 min', true, 3), ('D', '121°C for 30 min', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ''word'' which refers to the ''closeness of a result on repeated analysis'' is', null, 'Precision is the closeness of repeated results (reproducibility).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Specificity', false, 1), ('B', 'Sensitivity', false, 2), ('C', 'Accuracy', false, 3), ('D', 'Precision', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose the most correct cause of random laboratory errors from the following:', null, 'Inconsistent pipetting causes random error; calibration, reagent lot change and expired reagents cause systematic error.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inappropriate pipetting', true, 1), ('B', 'Calibration errors', false, 2), ('C', 'Expiring of reagents', false, 3), ('D', 'Change in the reagent lot', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following Westgard control rules detect systematic error except:', null, 'The R4s rule detects random error; 10x, 7T and 3(1s) detect systematic error.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10x rule', false, 1), ('B', '7T rule', false, 2), ('C', '3(1s) rule', false, 3), ('D', 'R4s rule', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'End point method of measurement involves:', null, 'End-point methods read absorbance once the reaction is complete.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Recording of absorbance at the fixed time when the reaction is about to be completed.', false, 1), ('B', 'Recording of absorbance at the beginning of the reaction.', false, 2), ('C', 'Recording of absorbance at the fixed time when the reaction is completed.', true, 3), ('D', 'Recording of absorbance at the certain interval of time during the chemical reactions.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following are incorrect statement of the Beer’s-Lambert Law Except:', null, 'Beer-Lambert: A = εlc - absorbance is directly proportional to path length (cuvette thickness) and concentration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Absorbance is indirectly proportional to the concentration of the solution in the cuvette.', false, 1), ('B', 'Absorbance is indirectly proportional to the intensity of the monochromatic light striking the cuvette with solution.', false, 2), ('C', 'Absorbance is indirectly proportional to the temperature of the solution.', false, 3), ('D', 'Absorbance is directly proportional to the thickness of the cuvette.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following tests are lipid panels EXCEPT:', null, 'LDH is an enzyme (cardiac/ tissue damage), not part of the lipid panel.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'LDL/HDL', false, 1), ('B', 'Cholesterol', false, 2), ('C', 'LDH', true, 3), ('D', 'Triglyceride', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose any of the following parameters which can be used to calculate coefficient variation in the Laboratory IQC:', null, 'CV = SD / mean x 100.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Median and variance', false, 1), ('B', 'Square root of Variance', false, 2), ('C', 'Standard deviation and the mean', true, 3), ('D', 'Variance and mean', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Following are the categories of biochemistry tests performed routinely at Jigme Dorji Wangchuck National Referral Hospital (JDWNRH). Write at least three laboratory tests in each category: (1) diabetic profile tests; (2) liver function tests; (3) renal function tests; (4) serum electrolytes; (5) lipid profile tests; (6) cardiac profile tests; (7) protein panel; (8) hormone tests; (9) tumour markers. (5 marks)', '(1) Diabetic profile: fasting and random blood glucose, post-prandial glucose/ OGTT, HbA1c (urine microalbumin). (2) Liver function: total and direct bilirubin, ALT, AST, ALP, GGT, total protein and albumin. (3) Renal function: urea (BUN), creatinine, uric acid (eGFR). (4) Serum electrolytes: sodium, potassium, chloride (bicarbonate). (5) Lipid profile: total cholesterol, triglycerides, HDL-cholesterol, LDL-cholesterol (VLDL). (6) Cardiac profile: troponin I/T, CK-MB, CK, LDH (myoglobin, NT-proBNP). (7) Protein panel: total protein, albumin, globulin, A/G ratio. (8) Hormones: TSH, free T3, free T4 (also beta-hCG, prolactin, cortisol). (9) Tumour markers: AFP, CEA, PSA, CA-125 (CA 19-9).', null, '[{"point": "Correct tests for each of the nine categories (about 0.5 mark per category, 3 tests each)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
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
  values ('ME', 'short_answer', 'Explain the principle, procedure and clinical significance of the indirect Coombs test performed in the blood bank. (5 marks)', 'Principle: the indirect antiglobulin (Coombs) test detects free IgG antibodies in the patient''s serum against red cell antigens. In the first stage, serum is incubated with red cells so that any antibody coats (sensitises) the cells in vitro; in the second stage antihuman globulin (Coombs reagent) is added, which bridges the antibody-coated cells and causes visible agglutination. Procedure: mix 2 drops of patient serum with 1 drop of 3-5% suspension of reagent (group O screening) or donor red cells; incubate at 37 °C for 30-60 minutes (or with LISS for 15 minutes); wash the cells three times with saline to remove unbound globulins; add 2 drops of AHG reagent, centrifuge and read for agglutination; confirm negative results by adding IgG-coated (Coombs control) cells, which should agglutinate. Clinical significance: antibody screening and the compatibility cross-match before transfusion (prevents haemolytic transfusion reactions); antenatal screening of mothers (e.g. Rh-negative women) for anti-D and other antibodies that cause haemolytic disease of the fetus and newborn; antibody identification; and weak D and red cell phenotyping.', null, '[{"point": "Principle: detects in vitro sensitisation - patient''s serum incubated with reagent red cells; antibodies (IgG) coat cells, antihuman globulin (Coombs reagent) bridges them → agglutination", "marks": 2}, {"point": "Procedure: patient serum + O screening cells (or donor cells), incubate 37 °C, wash 3x with saline, add AHG, centrifuge, read agglutination; check negatives with Coombs control cells", "marks": 1.5}, {"point": "Significance: antibody screening and cross-matching before transfusion, antenatal screening (anti-D) for HDFN, identifying alloantibodies, weak D", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
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
  values ('ME', 'short_answer', 'Explain what you understand from the two graphs shown regarding the catalytic action of enzymes (an energy diagram of a reaction with and without enzyme, and a curve of initial velocity against substrate concentration). Explain Vmax and Km, and write some important characteristics of a catalyst. (5 marks)', 'Graph 1 (energy diagram): reactants must pass an energy barrier (activation energy) to become products. The enzyme provides an alternative pathway with a much lower activation energy (lower peak), so more molecules can react and the rate increases greatly; the energy of reactants and products and the overall energy released (ΔG) are unchanged. Graph 2 (Michaelis-Menten curve): at low substrate concentration the initial velocity rises almost linearly (first order); as substrate increases the enzyme''s active sites become saturated and the curve levels off towards a maximum (zero order). Vmax is the maximum velocity when all enzyme molecules are saturated with substrate; it depends on enzyme amount. Km (Michaelis constant) is the substrate concentration at which the velocity is half of Vmax; a low Km means high affinity of the enzyme for its substrate. Characteristics of a catalyst: increases the rate of reaction by lowering activation energy; is not consumed or permanently changed; acts in small amounts; does not change the equilibrium or ΔG, only how fast it is reached; enzymes are highly specific, are proteins, and are affected by temperature, pH, cofactors and inhibitors.', null, '[{"point": "Graph 1: enzyme lowers activation energy (lower peak) without changing overall energy released (ΔG) or the reactant/ product energy levels - reaction faster", "marks": 1.5}, {"point": "Graph 2: Michaelis-Menten hyperbola - velocity rises with substrate then plateaus as enzyme saturates; Vmax = maximum rate at saturation; Km = substrate concentration at ½Vmax, inverse measure of affinity", "marks": 2}, {"point": "Catalyst characteristics: speeds reaction, not consumed, small amounts, does not change equilibrium/ ΔG, specific (enzymes), affected by temperature, pH, inhibitors", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2024-michaelis.png')
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
  values ('ME', 'short_answer', 'Explain the difference between DNA and RNA in terms of location, structure and function. (5 marks)', 'Location: DNA is found mainly in the nucleus (chromosomes), with small amounts in mitochondria; RNA is synthesised in the nucleus (nucleolus for rRNA) and works mainly in the cytoplasm and ribosomes. Structure: DNA is a double-stranded helix of two antiparallel strands held by hydrogen bonds, with deoxyribose sugar and the bases adenine, guanine, cytosine and thymine (A-T, G-C pairing); it is very long and chemically stable. RNA is usually single-stranded (may fold), contains ribose sugar and uracil instead of thymine, is much shorter and less stable. Function: DNA stores the genetic information and passes it on through replication; RNA carries out gene expression - messenger RNA carries the code from DNA to ribosomes, transfer RNA brings amino acids, ribosomal RNA forms ribosomes and catalyses peptide bonds, and small RNAs regulate genes.', null, '[{"point": "Location: DNA mainly nucleus (also mitochondria); RNA made in nucleus, functions mainly in cytoplasm/ ribosomes", "marks": 1.5}, {"point": "Structure: DNA double-stranded helix, deoxyribose, bases A, T, G, C, long, stable; RNA usually single-stranded, ribose, uracil instead of thymine, shorter, less stable", "marks": 2}, {"point": "Function: DNA stores and transmits genetic information (replication); RNA expresses it - mRNA (message), tRNA (carries amino acids), rRNA (ribosomes), regulatory RNAs", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
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
  values ('ME', 'passage', 'Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative.

1. What is the primary disease diagnosed by the doctor from the clinical symptoms supported by the laboratory results? (5 marks)', 'Alcoholic hepatitis (alcoholic liver disease) causing hepatocellular jaundice, with features of chronic liver damage (low albumin and oedema). Supporting points: regular alcohol use, jaundice, fever, abdominal pain, AST raised about twice ALT (AST:ALT 2:1 is typical of alcohol), raised ALP and bilirubin, low albumin and total protein, and negative hepatitis B, C and HIV tests. (The mildly raised AFP fits regeneration/ inflammation, but hepatocellular carcinoma should be excluded by imaging and follow-up.)', null, '[{"point": "Alcoholic hepatitis/ alcoholic liver disease (hepatocellular jaundice) with hypoalbuminaemia; reasoning (alcohol, jaundice, AST:ALT 2:1, viral tests negative)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case1', 1, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative.

2. List all the clinical symptoms and abnormal tests which supported the doctor''s diagnosis of the primary disease for this patient. (10 marks)', 'Clinical: history of regular alcohol drinking; yellowish skin and eyes (jaundice); pallor; acute abdominal pain and nausea; high fever (40 °C); tachycardia (120/min) and tachypnoea (25/min); raised BP (130/90); swelling of legs and ankles (oedema from low albumin); shabby look and abnormal behaviour (possible hepatic encephalopathy or alcohol effects). Abnormal laboratory results: AST 300 U/L and ALT 150 U/L (hepatocellular injury, AST:ALT ratio 2:1 typical of alcoholic liver disease); ALP 530 U/L (cholestasis); total bilirubin 9.5 mg/dL and direct bilirubin 2.0 mg/dL (jaundice); LDH 250 U/L (tissue damage); total protein 4.6 g/dL and albumin 2.4 g/dL (reduced liver synthesis, malnutrition - causing oedema); sodium 130 and chloride 92 mmol/L (hyponatraemia, hypochloraemia, common in liver disease and fluid retention); potassium 5.0 mmol/L (slightly high); AFP 60 ng/mL (mildly raised).', null, '[{"point": "Clinical: alcohol history, jaundice (yellow skin/ eyes), pallor, abdominal pain, nausea, fever 40 °C, tachycardia 120, tachypnoea 25, raised BP, leg/ ankle oedema, abnormal behaviour (possible encephalopathy)", "marks": 4}, {"point": "Abnormal tests: AST 300, ALT 150 (AST:ALT 2:1), ALP 530, total bilirubin 9.5, direct 2.0, LDH 250, low total protein 4.6 and albumin 2.4, Na 130, Cl 92, K 5.0, AFP 60", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case1', 2, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative.

3. List all the tests advised by the doctor which were normal, and explain why you think the doctor prescribed those tests. (10 marks)', 'Normal tests: lipase (53 U/L), amylase (130 U/L), calcium (2.3 mmol/L), fasting blood glucose (122 mg/dL), urea (8 mg/dL), creatinine (0.9 mg/dL), and negative rapid tests for HBsAg, HCV and HIV. Reasons: lipase and amylase - an alcoholic with acute abdominal pain, nausea and fever may have acute pancreatitis, so these exclude it; calcium - falls in severe pancreatitis and reflects nutrition; urea and creatinine - assess kidney function, which can fail in severe liver disease (hepatorenal syndrome) and dehydration, and guide drug dosing; fasting glucose - liver disease can cause hypoglycaemia or diabetes, and low glucose can explain abnormal behaviour; HBsAg, HCV and HIV - viral hepatitis is a common cause of jaundice and liver damage and HIV may co-exist, so they were tested to exclude infectious causes.', null, '[{"point": "Normal tests: lipase, amylase, calcium, fasting glucose, urea, creatinine, HBsAg/ HCV/ HIV negative", "marks": 4}, {"point": "Reasons: lipase/ amylase - exclude acute pancreatitis (alcohol, abdominal pain); urea/ creatinine - kidney function (hepatorenal syndrome, drug dosing); glucose - diabetes/ hypoglycaemia in liver disease, altered behaviour; calcium - pancreatitis/ nutrition; viral markers - exclude viral hepatitis and HIV as causes/ co-infection", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case1', 3, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
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
  values ('ME', 'passage', 'Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative.

4. Which type of bilirubin is increased in this patient? Explain the general causes of increased bilirubin. (5 marks)', 'Both fractions are raised: total bilirubin 9.5 mg/dL with direct (conjugated) 2.0 mg/dL, so indirect (unconjugated) bilirubin = 9.5 - 2.0 = 7.5 mg/dL - mainly unconjugated with raised conjugated bilirubin, a mixed picture typical of hepatocellular (hepatic) jaundice, where damaged liver cells cannot take up, conjugate and excrete bilirubin well. General causes of raised bilirubin: (1) pre-hepatic - excess bilirubin production from haemolysis (haemolytic anaemias, transfusion reactions, malaria) - unconjugated; (2) hepatic - liver cell damage or defective conjugation: viral, alcoholic and drug-induced hepatitis, cirrhosis, Gilbert''s and Crigler-Najjar syndromes, physiological neonatal jaundice - unconjugated or mixed; (3) post-hepatic (obstructive) - blocked bile flow by gallstones, tumours of the pancreas head or bile ducts, strictures - conjugated, with pale stools and dark urine.', null, '[{"point": "Both raised: total 9.5, direct (conjugated) 2.0 → indirect (unconjugated) 7.5 mg/dL predominantly; mixed pattern of hepatocellular jaundice", "marks": 2}, {"point": "Causes: pre-hepatic (haemolysis - unconjugated), hepatic (hepatitis, cirrhosis, alcohol, drugs, Gilbert''s, neonatal - mixed), post-hepatic (obstruction: gallstones, tumours - conjugated)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case1', 4, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Jaundice in a woman who drinks alcohol
A 30-year-old woman came to the emergency department with a shabby look and abnormal behaviour, complaining of acute abdominal pain, nausea and fever. On examination her skin and eyes appeared yellowish and pale, and there was swelling of the legs and ankles. The attendant revealed that she is a regular alcohol drinker. She was kept under observation for 24 hours.
Vital signs (reference in brackets): BP 130/90 mmHg (≤120/≤80); temperature 40 °C (36.1-37.2 °C); heart rate 120/min (60-100); respiration 25/min (12-20).
Blood/ serum results (reference): lipase 53 U/L (0-60); amylase 130 U/L (30-150); AST 300 U/L (<40); ALT 150 U/L (<40); ALP 530 U/L (30-130); total bilirubin 9.5 mg/dL (<1); direct bilirubin 2.0 mg/dL (0.1-0.3); LDH 250 U/L (100-225); K+ 5.0 mmol/L (3.3-4.8); Na+ 130 mmol/L (133-146); Cl- 92 mmol/L (96-109); Ca2+ 2.3 mmol/L (2.1-2.6); total protein 4.6 g/dL (6-7.8); albumin 2.4 g/dL (3.5-5.5); fasting blood glucose 122 mg/dL (80-140); urea 8 mg/dL (7-18); creatinine 0.9 mg/dL (0.6-1.2); alpha-fetoprotein 60 ng/mL (0-40); rapid tests for HBsAg, HCV and HIV negative.

5. Explain the steps of bilirubin metabolism with a flow diagram, in terms of its formation, storage, transport and excretion. (20 marks)', 'Formation: about 80% of bilirubin comes from old red blood cells (life span about 120 days), which are destroyed by macrophages of the reticuloendothelial system, mainly in the spleen (also liver and bone marrow); the rest comes from other haem proteins (myoglobin, cytochromes) and ineffective erythropoiesis. Haemoglobin is split into globin (amino acids reused) and haem; haem oxygenase opens the haem ring to form biliverdin, releasing iron (stored as ferritin and reused) and carbon monoxide; biliverdin reductase reduces biliverdin to unconjugated (indirect) bilirubin, about 250-300 mg a day.
Transport: unconjugated bilirubin is insoluble in water, so it is carried in the blood tightly bound to albumin to the liver (drugs such as sulphonamides can displace it).
Uptake and storage in the liver: at the hepatocyte membrane bilirubin is separated from albumin and taken up by carrier-mediated transport; inside the cell it binds to ligandin (glutathione S-transferase) and other proteins, which hold (store) it and prevent it flowing back to the blood.
Conjugation: in the smooth endoplasmic reticulum, the enzyme UDP-glucuronyl transferase conjugates bilirubin with glucuronic acid to form bilirubin diglucuronide (conjugated, direct bilirubin), which is water-soluble.
Excretion: conjugated bilirubin is actively secreted (the rate-limiting step) into the bile canaliculi and passes with bile through the bile ducts (stored and concentrated in the gall bladder) into the intestine. In the large intestine bacterial β-glucuronidases remove glucuronic acid and bacteria reduce bilirubin to colourless urobilinogen. Most urobilinogen is oxidised to stercobilin, which gives faeces their brown colour; about 10-20% is reabsorbed into the portal blood (enterohepatic circulation), mostly re-excreted by the liver, and a small amount is excreted by the kidneys in urine as urobilinogen, oxidised to urobilin (yellow colour of urine).
Flow diagram: old RBCs → (spleen, RE cells) haemoglobin → haem + globin → (haem oxygenase) biliverdin + Fe + CO → (biliverdin reductase) unconjugated bilirubin → bound to albumin in blood → liver uptake, bound to ligandin → (UDP-glucuronyl transferase) conjugated bilirubin diglucuronide → bile → intestine → (bacteria) urobilinogen → stercobilinogen → stercobilin in faeces; part of urobilinogen → reabsorbed → liver (enterohepatic) / kidney → urobilin in urine.', null, '[{"point": "Formation: senescent RBCs broken down in reticuloendothelial system (spleen) → haemoglobin → haem + globin; haem oxygenase → biliverdin + Fe + CO; biliverdin reductase → unconjugated bilirubin (~80% from RBCs)", "marks": 5}, {"point": "Transport: unconjugated bilirubin (water-insoluble) bound to albumin in blood to liver; uptake into hepatocytes by carrier, binds ligandin (storage/ intracellular binding)", "marks": 5}, {"point": "Conjugation and excretion: UDP-glucuronyl transferase conjugates with glucuronic acid → bilirubin diglucuronide (water-soluble) → actively secreted into bile → intestine; bacteria → urobilinogen; most → stercobilinogen/ stercobilin (faeces); some reabsorbed (enterohepatic) → urine urobilin", "marks": 6}, {"point": "Clear labelled flow diagram showing sequence", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case1', 5, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control for glucose
Internal quality control for glucose has been established using the results of control level I for 12 consecutive days: day 1: 98; day 2: 101; day 3: 88; day 4: 89; day 5: 95; day 6: 87; day 7: 96; day 8: 91; day 9: 96; day 10: 93; day 11: 94; day 12: 86 (mg/dL). The control results are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (L-J) chart and Westgard''s multi-rules are used to detect errors. The L-J chart shown was generated from control level I over 31 days (mean 92.84; ±1SD 88.15/97.53; ±2SD 83.46/102.22; ±3SD 78.77/106.91 mg/dL).

1. Complete the table (Xi - X̄ and (Xi - X̄)² for each day) and calculate the following parameters, showing correct steps and units: (a) standard deviation (SD); (b) coefficient of variation (CV); (c) mean ± 2SD; (d) mean ± 3SD. (25 marks)', 'Mean X̄ = ΣXi / n = (98 + 101 + 88 + 89 + 95 + 87 + 96 + 91 + 96 + 93 + 94 + 86)/12 = 1114/12 = 92.83 mg/dL.
Table (Xi; Xi - X̄; (Xi - X̄)²): day 1: 98; 5.17; 26.69 | day 2: 101; 8.17; 66.69 | day 3: 88; -4.83; 23.36 | day 4: 89; -3.83; 14.69 | day 5: 95; 2.17; 4.69 | day 6: 87; -5.83; 34.03 | day 7: 96; 3.17; 10.03 | day 8: 91; -1.83; 3.36 | day 9: 96; 3.17; 10.03 | day 10: 93; 0.17; 0.03 | day 11: 94; 1.17; 1.36 | day 12: 86; -6.83; 46.69. Σ(Xi - X̄)² = 241.67.
(a) SD = √[Σ(Xi - X̄)²/(n - 1)] = √(241.67/11) = √21.97 = 4.69 mg/dL.
(b) CV = (SD / mean) x 100 = (4.69/92.83) x 100 = 5.05%.
(c) Mean ± 2SD = 92.83 ± 2(4.69) = 92.83 ± 9.37 → 83.46 to 102.21 mg/dL.
(d) Mean ± 3SD = 92.83 ± 3(4.69) = 92.83 ± 14.06 → 78.77 to 106.89 mg/dL.
These limits match the L-J chart (±2SD 83.46/102.22, ±3SD 78.77/106.91).', null, '[{"point": "Mean = ΣXi/n = 1114/12 = 92.83 mg/dL; table of deviations and squared deviations completed (Σ(Xi - X̄)² = 241.67)", "marks": 7}, {"point": "(a) SD = √[Σ(Xi - X̄)²/(n - 1)] = √(241.67/11) = √21.97 = 4.69 mg/dL", "marks": 6}, {"point": "(b) CV = SD/mean x 100 = 4.69/92.83 x 100 = 5.05%", "marks": 4}, {"point": "(c) Mean ± 2SD = 92.83 ± 9.37 = 83.46 to 102.21 mg/dL", "marks": 4}, {"point": "(d) Mean ± 3SD = 92.83 ± 14.06 = 78.77 to 106.89 mg/dL", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case2', 1, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2024-ljchart.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Internal quality control for glucose
Internal quality control for glucose has been established using the results of control level I for 12 consecutive days: day 1: 98; day 2: 101; day 3: 88; day 4: 89; day 5: 95; day 6: 87; day 7: 96; day 8: 91; day 9: 96; day 10: 93; day 11: 94; day 12: 86 (mg/dL). The control results are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (L-J) chart and Westgard''s multi-rules are used to detect errors. The L-J chart shown was generated from control level I over 31 days (mean 92.84; ±1SD 88.15/97.53; ±2SD 83.46/102.22; ±3SD 78.77/106.91 mg/dL).

2a. Name the control rule violations seen in the L-J chart. (10 marks)', 'Violations: (1) 1(2s) warning - a single value at/beyond ±2SD (e.g. days 13 and 21), which triggers inspection with the other rules. (2) 4(1s) - four consecutive values above +1SD (days 4-7, continuing to day 14). (3) 10x - ten or more consecutive values on the same side (above) of the mean (days 4-14). (4) 7T - seven or more consecutive results steadily increasing (days 15 to 23). (5) 2(2s) - two consecutive values beyond +2SD (days 21 and 22, with day 23 also high). (6) 1(3s) - a value at/beyond +3SD (day 23) and a value below -3SD (day 27).', null, '[{"point": "4(1s): four or more consecutive values above +1SD (days 4-7 onwards); 10x: ten or more consecutive values on the same side of the mean (days 4-14)", "marks": 4}, {"point": "7T: seven or more consecutive points steadily increasing (days 15-23); 2(2s): two consecutive values beyond +2SD (days 21-22)", "marks": 4}, {"point": "1(3s): value beyond +3SD (day 23) and below -3SD (day 27); 1(2s) warnings (e.g. day 13, 21)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case2', 2, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2024-ljchart.png')
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
  values ('ME', 'passage', 'Case II: Internal quality control for glucose
Internal quality control for glucose has been established using the results of control level I for 12 consecutive days: day 1: 98; day 2: 101; day 3: 88; day 4: 89; day 5: 95; day 6: 87; day 7: 96; day 8: 91; day 9: 96; day 10: 93; day 11: 94; day 12: 86 (mg/dL). The control results are trimmed at ±2SD or by using the CLIA CV. Daily IQC results are plotted on a Levey-Jennings (L-J) chart and Westgard''s multi-rules are used to detect errors. The L-J chart shown was generated from control level I over 31 days (mean 92.84; ±1SD 88.15/97.53; ±2SD 83.46/102.22; ±3SD 78.77/106.91 mg/dL).

2b. For each rule violation, state the possible causes and suggest corrective actions. (15 marks)', 'Systematic error rules - 4(1s), 10x, 7T and 2(2s): possible causes include calibration drift or an incorrect calibrator; a change of reagent or control lot; deterioration of reagents or controls (improper storage, expiry, evaporation); gradual instrument problems such as an ageing photometer lamp, temperature changes in the incubator, a partly blocked or misaligned sample probe or pipette; and changes in technique or operator. Corrective action: stop releasing patient results; check reagent and control lots, expiry and storage; recalibrate the assay; perform instrument maintenance (lamp, probe, temperature); rerun the controls, and when in control, repeat patient samples analysed since the last acceptable run; document everything. A 7T trend especially suggests progressive deterioration (lamp, reagent), while 10x and 4(1s) suggest a shift (new lot, calibration). Random error rule - 1(3s) (and 1(2s) warning): possible causes include pipetting or sampling errors, air bubbles or clots, improperly mixed or reconstituted control, a mislabelled or wrong sample, transcription errors, and electrical or power fluctuations. Corrective action: reject the run; check for obvious errors; prepare fresh control and repeat; if the problem persists troubleshoot the instrument and procedure; repeat affected patient samples; and record the event and corrective action in the QC log.', null, '[{"point": "Systematic error rules (4(1s), 10x, 7T, 2(2s)): causes - calibration drift/ wrong calibrator, new reagent or control lot, reagent deterioration, instrument drift (lamp ageing, temperature, pipette/ probe), change in technique; actions - stop reporting, recalibrate, check/ replace reagents and controls, maintenance, rerun controls and patient samples", "marks": 9}, {"point": "Random error rule (1(3s)) and 1(2s): causes - pipetting/ sampling error, bubbles, clots, mislabelling, transcription error, electrical fluctuation, improperly mixed/ reconstituted control; actions - rerun control, check sample handling, fresh control, then if confirmed troubleshoot and repeat patient results since last good run; document corrective action", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Medical Laboratory Technology", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mlt2024-case2', 3, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), '/papers/me/tech3-mlt-2024-ljchart.png')
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
  values ('ME', 'mcq', 'The anticoagulant of choice for a complete blood count (CBC) is', null, 'EDTA (lavender top) preserves cell morphology for haematology.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sodium fluoride', false, 1), ('B', 'Heparin', false, 2), ('C', 'Sodium citrate', false, 3), ('D', 'EDTA', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'After Gram staining, Gram-positive bacteria appear', null, 'Gram-positive cells retain the crystal violet-iodine complex.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Colourless', false, 1), ('B', 'Purple/ violet', true, 2), ('C', 'Pink/ red', false, 3), ('D', 'Green', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary stain in the Ziehl-Neelsen method is', null, 'Hot carbol fuchsin, decolourised with acid-alcohol, counterstained with methylene blue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Methylene blue', false, 1), ('B', 'Safranin', false, 2), ('C', 'Crystal violet', false, 3), ('D', 'Carbol fuchsin', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Coagulation tests such as PT and APTT are done on blood collected in', null, 'Citrate (light-blue top, 9:1 blood to anticoagulant) binds calcium reversibly.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3.2% sodium citrate', true, 1), ('B', 'Sodium fluoride', false, 2), ('C', 'Plain tube', false, 3), ('D', 'EDTA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is a non-treponemal screening test for syphilis?', null, 'VDRL and RPR are non-treponemal screening tests; TPHA and FTA-ABS are confirmatory.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'TPHA', false, 1), ('B', 'VDRL', true, 2), ('C', 'FTA-ABS', false, 3), ('D', 'Widal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The universal red cell donor blood group is', null, 'O negative red cells lack A, B and D antigens.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'O negative', true, 1), ('B', 'A negative', false, 2), ('C', 'AB positive', false, 3), ('D', 'B positive', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which enzyme is the most specific marker of liver cell injury?', null, 'ALT is found mainly in the liver; AST is also in heart and muscle.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Amylase', false, 1), ('B', 'ALP', false, 2), ('C', 'ALT', true, 3), ('D', 'AST', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Blood glucose samples are collected in tubes containing sodium fluoride because it', null, 'Fluoride inhibits enolase, stopping glycolysis by blood cells.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'medical-laboratory-technology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Medical Laboratory Technology): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'medical-laboratory-technology'), null)
  returning id
)
insert into me_q select 'N8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'preserves cell morphology', false, 1), ('B', 'prevents clotting only', false, 2), ('C', 'activates platelets', false, 3), ('D', 'inhibits glycolysis', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N8';
commit;
