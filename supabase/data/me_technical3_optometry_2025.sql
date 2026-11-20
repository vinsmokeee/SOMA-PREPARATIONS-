-- ME Paper III (Technical, Optometry): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'optometry', 'Optometry' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'optometry') is null then raise exception 'unknown specialisation optometry'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'optometry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'optometry'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Optometry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'optometry'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Optometry');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'optometry'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Optometry');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which anterior segment condition is commonly associated with HLA-B27 positive spondyloarthropathies?', null, 'Acute anterior uveitis is associated with HLA-B27 spondyloarthropathies.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Infectious keratitis', false, 1), ('B', 'Pterygium', false, 2), ('C', 'Anterior uveitis', true, 3), ('D', 'Episcleritis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 58-year-old patient on long term systemic medication complains of gradual visual blurring. Fundus reveals microaneurysms, hard exudates, and few dot-blot hemorrhages. What is the most likely diagnosis?', null, 'Microaneurysms, hard exudates and dot-blot haemorrhages = non-proliferative diabetic retinopathy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Non-proliferative diabetic retinopathy', true, 1), ('B', 'Central serous chorioretinopathy', false, 2), ('C', 'Hypertensive retinopathy', false, 3), ('D', 'Retinal vein occlusion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During low vision assessment, which is the most appropriate magnifier type for a patient with severe hand tremors?', null, 'A stand magnifier rests on the page, so tremor does not matter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hand-held magnifier', false, 1), ('B', 'Clip-on telescope', false, 2), ('C', 'Stand magnifier', true, 3), ('D', 'Dome lens', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A visually impaired child with albinism and nystagmus benefits most from:', null, 'Filters for photophobia and high-contrast magnification help albinism.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Filters and high-contrast magnifiers', true, 1), ('B', 'Tinted contact lenses', false, 2), ('C', 'Pinhole occluder', false, 3), ('D', 'Cylindrical correction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are leading an eye health program in rural Bhutan. Which refractive service model is most cost-effective and scalable?', null, 'Vision technician-led screening with referral is scalable and cost-effective in rural areas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mobile spectacle van with optometrist only', false, 1), ('B', 'Eye hospital-based full refraction for all', false, 2), ('C', 'Vision technician-led screening with referral', true, 3), ('D', 'Free spectacles through hospital only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with myopia and high lag of accommodation may benefit from which management during near work?', null, 'A low plus add reduces accommodative demand and lag at near.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Concave prisms', false, 1), ('B', 'Cycloplegics', false, 2), ('C', 'Minus add', false, 3), ('D', 'Low plus addition lenses', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Maddox rod test is primarily used to detect', null, 'The Maddox rod measures heterophoria.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Heterophoria', true, 1), ('B', 'Accommodative lag', false, 2), ('C', 'Heterochromia', false, 3), ('D', 'Steropsis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the use of the instrument shown in the picture?', null, 'The Jackson cross cylinder refines astigmatic axis and power.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), '/papers/me/tech3-optom-2025-cross-cylinder.png')
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Perform objective refraction', false, 1), ('B', 'Confirm binocular vision', false, 2), ('C', 'Measure accommodation amplitude', false, 3), ('D', 'Refine astigmatism axis and power', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following conditions is most acceptable for elective corneal transplantation using stored tissue?', null, 'Optical keratoplasty for pseudophakic bullous keratopathy is an elective graft using stored tissue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Optical keratoplasty in pseudophakic bullous keratopathy', true, 1), ('B', 'Fungal keratitis unresponsive to antifungals', false, 2), ('C', 'Peripheral ulcerative keratitis associated with rheumatoid arthritis', false, 3), ('D', 'Traumatic full-thickness corneal laceration with iris prolapse', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which drug is contraindicated in narrow-angle glaucoma?', null, 'Phenylephrine dilates the pupil and can precipitate angle closure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Timolol', false, 1), ('B', 'Latanoprost', false, 2), ('C', 'Acetazolamide', false, 3), ('D', 'Phenylephrine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which statement about accommodation-convergence relationship is CORRECT?', null, 'The AC/A ratio can be calculated by the heterophoria (calculated) method.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All near tasks require positive fusional reserve', false, 1), ('B', 'AC/A ratio is calculated using heterophoria method', true, 2), ('C', 'NRA testing isolates fusional convergence', false, 3), ('D', 'Increased accommodation reduces convergence', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which extraocular muscle originates from the anterior orbit, rather than the common tendinous ring?', null, 'The inferior oblique arises from the anterior orbital floor, not the annulus of Zinn.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inferior oblique', true, 1), ('B', 'Superior rectus', false, 2), ('C', 'Lateral rectus', false, 3), ('D', 'Medial rectus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the primary treatment for corneal ulcer due to bacterial origin?', null, 'Bacterial corneal ulcers are treated with intensive fortified antibiotics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Antiviral agents', false, 1), ('B', 'Fortified antibiotics', true, 2), ('C', 'Topical steroids', false, 3), ('D', 'Lubricating drops', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient complains of image swim and distorted peripheral vision with new progressives glasses. What is the most probable reason?', null, 'Wrong PD or fitting height puts the eyes in the distorted periphery of progressives.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Axis misalignment', false, 1), ('B', 'Wrong base curve', false, 2), ('C', 'Incorrect monocular PD and fitting height', true, 3), ('D', 'Incorrect lens material', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bhutan recently launched the WHO SPECS 2030 initiative. What is the primary aim of the initiative?', null, 'SPECS 2030 aims to scale up effective refractive error coverage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Eliminate infectious blindness', false, 1), ('B', 'Scale up effective refractive error overage', true, 2), ('C', 'Universal cataract coverage', false, 3), ('D', 'Eliminate childhood blindness by 2030', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following materials has the highest oxygen permeability among current lens options?', null, 'Silicone hydrogel has the highest oxygen permeability.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'HEMA', false, 1), ('B', 'Hydrogel', false, 2), ('C', 'PMMA', false, 3), ('D', 'Silicone hydrogel', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is considered a true ocular emergency requiring same-day referral?', null, 'Acute angle-closure glaucoma needs same-day treatment.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Macular degeneration', false, 1), ('B', 'Acute angle-closure glaucoma', true, 2), ('C', 'Non-proliferative diabetic retinopathy', false, 3), ('D', 'Congenital cataract', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 62-year-old diabetic patient presents with sudden, painless vision loss in one eye and sees “a curtain coming down.” What is the most likely diagnosis?', null, 'A curtain coming down suggests retinal detachment.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Retinal detachment', true, 1), ('B', 'Macular edema', false, 2), ('C', 'Central retinal artery occlusion', false, 3), ('D', 'Optic neuritis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a population-based survey, the prevalence of myopia among 12-year-olds was 48%. Which term best describes this value?', null, 'Proportion with the condition at one point in time = prevalence.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prevalence', true, 1), ('B', 'Odds ratio', false, 2), ('C', 'Hazard ratio', false, 3), ('D', 'Incidence', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 10-year-old boy with -3.00 D myopia progresses by -1.00 D per year. Which intervention is currently most evidence-based to slow progression?', null, 'Low-dose atropine has strong evidence for slowing myopia progression.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tinted glasses', false, 1), ('B', 'Low-dose atropine (0.01%–0.05%)', true, 2), ('C', 'Orthokeratology lenses', false, 3), ('D', 'Avoid reading', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient using monthly replacement silicone hydrogel lenses reports discomfort and dryness after 8 hours. Slit lamp shows papillae on the upper tarsal conjunctiva. The most likely diagnosis is:', null, 'Upper tarsal papillae with lens discomfort = giant papillary conjunctivitis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Allergic conjunctivitis', false, 1), ('B', 'Corneal abrasion', false, 2), ('C', 'Giant papillary conjunctivitis (GPC)', true, 3), ('D', 'Pingueculitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A child with intermittent exotropia and normal VA is undergoing vision therapy. What is a sign of successful therapy progression?', null, 'Improved fusional convergence shows therapy is working.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Decreased NPC', false, 1), ('B', 'Improved fusional convergence amplitudes', true, 2), ('C', 'Increasing accommodative lag', false, 3), ('D', 'Worsening of stereoacuity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements about congenital nasolacrimal duct obstruction (CNLDO) is TRUE?', null, 'Over 90% of CNLDO resolves spontaneously in the first year.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The most common site of obstruction is the punctum', false, 1), ('B', 'It typically presents with photophobia and redness', false, 2), ('C', 'Over 90% of cases resolve spontaneously within the first year', true, 3), ('D', 'Most cases require surgical intervention within the first month of life', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'While refracting a hyperopic patient, you notice that their visual acuity improves significantly with +1.00 DS. However, the patient complains of headache while reading. What is the likely issue?', null, 'Uncorrected latent hyperopia causes accommodative strain and headache at near.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Overcorrection', false, 1), ('B', 'Latent nystagmus', false, 2), ('C', 'Incorrect axis of cylinder', false, 3), ('D', 'Uncorrected accommodative strain', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The optimal duration of full-time occlusion therapy for moderate amblyopia in a 6-year- old is generally:', null, 'PEDIG: 2-6 hours of daily patching depending on severity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10 to 12 hours continuously for all ages', false, 1), ('B', 'Only during reading activities', false, 2), ('C', '2 to 6 hours per day, depending on severity', true, 3), ('D', '2 hours per day', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which metabolic pathway is involved in the formation of sorbitol, contributing to diabetic cataract?', null, 'Aldose reductase in the polyol pathway converts glucose to sorbitol.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Urea cycle', false, 1), ('B', 'Polyol pathway', true, 2), ('C', 'Pentose phosphate pathway', false, 3), ('D', 'TCA cycle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Draw and label the structure of the lacrimal drainage system. What is the role of the valve of Hasner?', 'Diagram: tears drain from the lacrimal lake through the upper and lower puncta → vertical (2 mm) then horizontal (8 mm) canaliculi → common canaliculus → (valve of Rosenmüller) → lacrimal sac in the lacrimal fossa → nasolacrimal duct (about 12-18 mm) running down through the bony canal → opening under the inferior turbinate in the inferior meatus of the nose, guarded by the valve of Hasner.
Valve of Hasner: a mucosal fold at the lower end of the nasolacrimal duct where it opens into the inferior meatus. It allows tears to flow into the nose but prevents air and nasal secretions refluxing up into the duct (e.g. when blowing the nose). If it fails to open at birth (imperforate membrane), it causes congenital nasolacrimal duct obstruction with watering and discharge.', null, '[{"point": "Labelled diagram: puncta, canaliculi (vertical/horizontal), common canaliculus, valve of Rosenmüller, lacrimal sac, nasolacrimal duct, valve of Hasner, inferior meatus", "marks": 3}, {"point": "Valve of Hasner: mucosal fold at lower end of NLD in inferior meatus; prevents reflux of air/ secretions from nose; imperforate valve causes congenital NLDO", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is computer vision syndrome? Explain the 20-20-20 rule.', 'Computer vision syndrome (digital eye strain) is a group of eye and vision problems from prolonged use of computers, tablets and phones. Symptoms: eye strain and fatigue, dry or burning eyes, blurred vision, difficulty refocusing, headaches, and neck and shoulder pain. Causes: reduced blink rate (dry eye), sustained accommodation and convergence at near, glare and poor contrast, uncorrected refractive error or presbyopia, and poor posture and screen position.
The 20-20-20 rule: every 20 minutes, look at something about 20 feet (6 metres) away for at least 20 seconds. This relaxes accommodation and convergence, encourages blinking and reduces fatigue. Also: correct glasses, screen slightly below eye level at arm''s length, reduce glare, and use lubricants if needed.', null, '[{"point": "CVS definition: group of eye and vision problems from prolonged digital screen use (digital eye strain); symptoms - eye strain, dryness, blur, headache, neck pain; causes - reduced blinking, accommodation demand, glare, uncorrected errors, posture", "marks": 3}, {"point": "20-20-20 rule: every 20 minutes look at something 20 feet (6 m) away for 20 seconds; relaxes accommodation, promotes blinking", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 12-year-old student with albinism has reduced distance vision (6/36 OU), nystagmus, photophobia and difficulty copying from the blackboard. He uses normal print books but struggles with contrast and glare. List and briefly explain five low vision interventions or adaptations you would recommend to improve his function in the classroom.', '1. Full refractive correction (albinism often has high astigmatism) with polycarbonate lenses. 2. Tinted or photochromic filters, plus a cap or visor indoors near windows, to reduce photophobia and glare. 3. A hand-held or spectacle-mounted distance telescope, or a phone/tablet camera or electronic magnifier, to see the blackboard. 4. Seating at the front centre of the class, away from glare from windows, with the teacher giving printed copies of board notes and using high-contrast markers (black on white). 5. Near aids and adaptations: high-contrast or large-print materials, bold-lined paper, a stand or electronic magnifier if needed, good task lighting, extra time in exams, and allowing his preferred head posture (null point) for the nystagmus.', null, '[{"point": "Five interventions explained (1 each): full refractive correction; tinted/ absorptive filters or photochromic lenses, cap/ visor; distance telescope (hand-held/ spectacle-mounted) or electronic magnifier/ phone camera for board; near magnifiers/ large print/ bold-line paper, CCTV; seating in front, away from windows, good task lighting; high-contrast materials, extra time, teacher copies of notes, null-point head posture allowed", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define eREC and eCSC. How is the quality gap calculated?', 'eREC (effective refractive error coverage) is a WHO indicator: the proportion of people with refractive error (distance, and near for presbyopia) who have received correction AND achieve good vision (e.g. 6/12 or better) with it, out of all who need correction: eREC = (met need with good outcome) / (met need + under-met need + unmet need).
eCSC (effective cataract surgical coverage) is the proportion of people who have had cataract surgery and have a good visual outcome (presenting VA 6/12 or better in the operated eye), out of all people needing or having had cataract surgery.
Quality gap: the difference between crude coverage and effective coverage - quality gap = REC - eREC (or CSC - eCSC); the relative quality gap = (REC - eREC) / REC x 100 (or (CSC - eCSC) / CSC x 100). It shows how many people received services that did not give good vision, e.g. due to poor prescriptions or surgical outcomes.', null, '[{"point": "eREC: effective refractive error coverage - proportion of people with refractive error who have adequate correction achieving good VA (e.g. 6/12) out of all who need it", "marks": 1.5}, {"point": "eCSC: effective cataract surgical coverage - proportion of people who had cataract surgery and achieved good outcome (VA 6/12) out of all needing surgery", "marks": 1.5}, {"point": "Quality gap = coverage (REC/CSC) - effective coverage (eREC/eCSC); relative quality gap = (REC - eREC)/REC x 100", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

1. Based on axial length and refraction, classify the myopia. Is it physiological or pathological? Justify using refractive and structural clues. (3 marks)', 'This is low (-1.75 D), axial, juvenile-onset (school) myopia. It is physiological (simple) rather than pathological at present: the refraction is low, the axial length (24.7 mm) is below the pathological range (usually >26 mm or <-6 D with degenerative changes), the cornea is normal and there are no lesions such as lacquer cracks or atrophy - only mild tessellation. However, the early onset, a highly myopic mother, heavy near work, little outdoor time and an axial length long for her age mean a high risk of progression to high myopia.', null, '[{"point": "Low (-1.75 D) axial school-age (juvenile-onset) myopia", "marks": 1}, {"point": "Not pathological at present: low refraction, AL 24.7 (< 26 mm), no degenerative changes except tessellation, normal topography", "marks": 1}, {"point": "But high risk of progression: young onset, high-myopic parent, near work, little outdoor time, AL long for age", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 1, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

2. Interpret the axial length findings. Is it concerning? (3 marks)', 'An axial length of 24.7 mm is long for an 8-year-old (typical about 22.5-23.5 mm), and it is the main cause of her myopia (normal corneal power). It is concerning: it lies above the expected growth curve for her age, which predicts faster progression and a higher lifetime risk of high myopia and its complications (retinal detachment, myopic maculopathy, glaucoma). It should be used as a baseline and measured every 6 months to monitor progression and the effect of myopia control.', null, '[{"point": "24.7 mm is long for an 8-year-old (normal about 22.5-23.5) - explains myopia (axial)", "marks": 1.5}, {"point": "Concerning: above age norms/ percentile, predicts progression; needs baseline and 6-monthly monitoring, myopia control", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 2, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

3. Briefly describe current evidence-based interventions to slow the progression of myopia. (10 marks)', '1. Low-dose atropine eye drops (0.01-0.05%) at night: reduce progression by roughly 30-60% in trials (0.05% most effective in LAMP study) with few side effects (mild photophobia, near blur). 2. Orthokeratology: rigid lenses worn overnight reshape the cornea, giving clear daytime vision and peripheral myopic defocus; slows axial elongation by about 40-50%. 3. Myopia control spectacle lenses (e.g. DIMS/defocus incorporated multiple segments, highly aspherical lenslets) - about 50% slowing - and soft dual-focus or multifocal contact lenses (e.g. MiSight), which create peripheral myopic defocus. 4. Behavioural measures: at least 2 hours a day outdoors (bright light releases retinal dopamine and delays onset), regular breaks from near work, good reading distance and lighting, and limited screen time. 5. Combination treatments (e.g. atropine with ortho-K or defocus lenses) for fast progressors, with 6-monthly monitoring of cycloplegic refraction and axial length. Under-correction and blue-filter lenses are not effective.', null, '[{"point": "Low-dose atropine (0.01-0.05%) - mechanism unclear, dose-dependent effect, side effects", "marks": 2}, {"point": "Orthokeratology - reshapes cornea overnight, peripheral myopic defocus, slows AL growth ~40-50%", "marks": 2}, {"point": "Myopia control spectacle lenses (DIMS, HAL) and soft multifocal/dual-focus contact lenses (MiSight) - peripheral myopic defocus", "marks": 2.5}, {"point": "Increased outdoor time (≥2 h/day) for prevention/ slowing; reduce near work, breaks", "marks": 2}, {"point": "Combination therapy and regular monitoring (AL, cycloplegic refraction 6-monthly)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 3, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

4. Draw a ray diagram to show the refractive status and how it can be corrected with a minus lens. (5 marks)', 'Diagram 1 (uncorrected myopia): parallel rays from a distant object enter the eye, are refracted by the cornea and lens and focus at a point in front of the retina (the eyeball is too long), then diverge to form a blur circle on the retina. Diagram 2 (corrected): a concave (minus) lens placed in front of the eye diverges the parallel rays so they appear to come from the eye''s far point; the eye then focuses them exactly on the retina. Label: incident rays, minus lens, cornea, crystalline lens, retina, focal point and far point.', null, '[{"point": "Uncorrected: parallel rays from distance focus in front of retina (long eyeball), diverge to blur circle on retina", "marks": 2}, {"point": "Corrected: concave (minus) lens diverges parallel rays so they appear to come from far point and focus on retina", "marks": 2}, {"point": "Labels: lens, retina, focal point, far point", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 4, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

5. What is the recommended screen time for children under 12 years? (3 marks)', 'Guidelines (WHO and paediatric associations): no recreational screen time for children under 2 (except video calls); for ages 2-5, no more than 1 hour a day of high-quality content; for school-age children (5-12), limit recreational screen time to about 2 hours a day or less, with breaks every 20-30 minutes (20-20-20 rule), good viewing distance and at least 2 hours outdoors daily.', null, '[{"point": "Under 2: no screen time (except video calls); 2-5 years: ≤1 hour/day (WHO/AAP)", "marks": 1.5}, {"point": "5-12: limit recreational screen time to ≤2 hours/day with breaks (20-20-20), balanced with ≥2 h outdoors", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 5, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

6. Discuss prescribing strategy. Would you give full correction or under-correction? Justify. (4 marks)', 'Prescribe full correction based on the cycloplegic refraction (-1.75 DS OU, the least minus giving best acuity), worn full time, preferably in a myopia control design (defocus spectacle lenses) or with another control method. Under-correction is not recommended: studies show it does not slow progression and may increase it, and it leaves her with blurred vision for the board. Review in 6 months with cycloplegic refraction and axial length.', null, '[{"point": "Full correction based on cycloplegic refraction (-1.75 DS), worn full time", "marks": 2}, {"point": "Justification: under-correction does not slow (may accelerate) progression; clear vision for school; consider myopia control lens design; review 6 months", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 6, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

7. What are ''blue-filter lenses''? Would you recommend them? Justify. (3 marks)', 'Blue-filter lenses have a coating or tint that reduces part of the blue-violet light (about 400-450 nm) from screens and daylight. I would not recommend them for myopia control: there is no good evidence that they slow myopia progression (or prevent eye strain), and they could give false reassurance. Instead advise proven methods - myopia control spectacle or contact lenses, low-dose atropine and more outdoor time.', null, '[{"point": "Lenses with coating/ tint that filters part of blue-violet light from screens/ sunlight", "marks": 1}, {"point": "Not recommended for myopia control: no evidence they slow myopia; marketing claims; recommend proven methods instead", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 7, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

8. When should ortho-K be considered? What are its risks? (4 marks)', 'Consider ortho-K for a child with progressing myopia (typically up to about -4.00 to -5.00 D with low astigmatism), normal cornea, good motivation and hygiene, and parents able to supervise lens care and attend regular follow-up; it suits active children who want to be glasses-free during the day. Risks: microbial keratitis (including Acanthamoeba from tap water), corneal staining or abrasion, discomfort, glare and haloes, variable vision if not worn regularly, and lens loss; strict hygiene, no tap water and regular aftercare reduce them.', null, '[{"point": "Indications: progressing myopia (up to about -4 to -6 D, low astigmatism), motivated child and parents with good hygiene, wanting spectacle-free days, sports", "marks": 2}, {"point": "Risks: microbial keratitis (Acanthamoeba), corneal abrasion/ staining, discomfort, glare/ haloes, lens loss; need strict hygiene and follow-up", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 8, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

9. What is the AC/A ratio? Briefly explain it. (3 marks)', 'The AC/A ratio is the amount of accommodative convergence (in prism dioptres) produced for each dioptre of accommodation. Normal is about 3-5 Δ/D. It is measured by the heterophoria (calculated) method - using the distance and near phorias and the interpupillary distance - or by the gradient method (change in near phoria with ±1.00 D lenses). A high AC/A causes more esophoria at near (e.g. convergence excess), a low one causes exophoria at near (convergence insufficiency); it helps decide whether plus adds or prisms will help.', null, '[{"point": "Definition: accommodative convergence per dioptre of accommodation (prism dioptres/D)", "marks": 1.5}, {"point": "Normal 3-5:1; measured by heterophoria (calculated) or gradient method; high causes esophoria at near, low exophoria/ convergence insufficiency; affects management", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 9, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

10. You are invited to a BBS interview to talk about myopia. List important points you would make to the public. (5 marks)', 'Myopia (short-sightedness) is increasing rapidly among Bhutanese children; it is mostly caused by eyeball elongation linked to genes, long hours of near work and screens, and too little time outdoors. Prevention: at least 2 hours outdoors every day, limit recreational screen time, take breaks (20-20-20), hold books and phones at a good distance with good lighting. Get children''s eyes checked every year or if they squint, hold things close or struggle with the board; school screening is available. Wear the prescribed glasses fully - they do not make eyes worse. Myopia control treatments (special lenses, low-dose atropine, ortho-K) can slow progression, so see an optometrist early. High myopia raises the risk of retinal detachment, glaucoma and blindness later, so regular check-ups matter. Avoid myths like eye exercises or blue-light lenses curing myopia.', null, '[{"point": "Myopia is increasing, causes, risk factors (genetics, near work, low outdoor time)", "marks": 1}, {"point": "Outdoor time ≥2 h/day, limit screen time, breaks, good lighting/ distance", "marks": 1.5}, {"point": "Regular eye checks for children (school screening), wear correct glasses", "marks": 1}, {"point": "Myopia control options available; high myopia risks (RD, glaucoma, maculopathy); avoid myths (eye exercises, blue light)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 10, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

11. Discuss the public health implications of the rising prevalence of myopia in Bhutan or South Asia, and how optometrists can support national eye health goals. (5 marks)', 'Implications: rising numbers of children with uncorrected refractive error, affecting learning and later productivity; a growing future burden of high myopia complications (retinal detachment, myopic maculopathy, glaucoma) and irreversible visual impairment; increased costs and demand on limited eye-care services and workforce, especially in rural areas. Optometrists can help by: leading school and community screening and providing affordable, quality spectacles to raise effective refractive error coverage (WHO SPECS 2030); offering myopia control and regular follow-up; educating parents, teachers and the public on outdoor time and screen habits; advocating for school policies (outdoor activity); training vision technicians and strengthening referral pathways; and collecting prevalence data for national planning.', null, '[{"point": "Implications: more uncorrected refractive error/ visual impairment, school performance, productivity, cost, more high myopia complications/ blindness later, burden on limited services", "marks": 2.5}, {"point": "Optometrists'' role: school screening, eREC/SPECS 2030, affordable spectacles, myopia control, health education, data/ research, referral pathways, training vision technicians, policy (outdoor time in schools)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 11, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Myopia in an 8-year-old girl
An 8-year-old girl presents with blurred distance vision and difficulty copying from the board. Her mother is -7.00 D and reports that her daughter reads a lot and spends little time outdoors.
On examination: uncorrected VA 6/18 (OU). Dry retinoscopy -2.00 DS (OU); cycloplegic refraction -1.75 DS (OU). AC/A ratio normal. Cover test: mild exophoria. Axial length 24.7 mm in both eyes. Corneal topography normal; fundoscopy shows tessellated fundus patterns.
The parents ask: "Can we stop her glasses from increasing every year?" They have heard about "blue-filter lenses" as myopia control lenses.

12. Briefly describe the working principle of retinoscopy. (2 marks)', 'Retinoscopy is an objective method of measuring refractive error. A streak of light is shone into the eye and the reflex from the retina is observed through the pupil while the light is moved. The reflex moves ''with'' or ''against'' the light depending on where the eye''s far point lies relative to the examiner; lenses are added (plus for ''with'', minus for ''against'') until neutrality (the pupil fills with light). The working distance lens (e.g. +1.50 D at 67 cm) is then subtracted to give the refractive error.', null, '[{"point": "Objective refraction: light reflected from retina (red reflex), movement of streak (with/against) observed while moving light; neutralised with lenses at working distance; correct for working distance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case1', 12, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C1Q12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

1. Based on the history and findings, what is your provisional diagnosis? Classify the type of macular degeneration and justify it with clinical evidence. (3 marks)', 'Provisional diagnosis: neovascular (wet, exudative) age-related macular degeneration in the right eye, with early/dry AMD changes (RPE mottling) in the left. Evidence: age 68; sudden central scotoma with metamorphopsia; VA 6/60 not improved by pinhole or refraction (not refractive); OCT shows subretinal fluid, a pigment epithelial detachment and outer retinal disruption; fundus shows a grey-green choroidal neovascular membrane under the fovea with fresh subretinal haemorrhage. Dry AMD would cause gradual loss without fluid or haemorrhage.', null, '[{"point": "Neovascular (wet/ exudative) age-related macular degeneration, right eye", "marks": 1}, {"point": "Evidence: sudden central scotoma and distortion, age 68, CNV grey-green membrane, subretinal haemorrhage, subretinal fluid, PED on OCT; VA 6/60 not improving with pinhole", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 1, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

2. Outline a referral protocol for this patient. Which specialist is involved and what additional diagnostics may be needed? (5 marks)', 'Refer urgently (same week, ideally within 1-2 weeks at most) to an ophthalmologist, preferably a medical retina specialist (e.g. at JDWNRH), because early anti-VEGF treatment preserves vision. Send a referral letter with history, VA, refraction, IOP, fundus and OCT findings and images. Additional diagnostics: fluorescein angiography and/or OCT angiography to confirm and classify the CNV, indocyanine green angiography if polypoidal choroidal vasculopathy is suspected, colour fundus photography, Amsler grid, and checks of blood pressure and blood sugar with his physician. Explain the urgency to the patient, help arrange transport/support since he lives alone, and book follow-up.', null, '[{"point": "Urgent referral (within days) to ophthalmologist/ retina specialist with referral letter (history, VA, findings, OCT images)", "marks": 2}, {"point": "Additional diagnostics: fluorescein angiography, OCT angiography, ICG angiography, Amsler grid, colour fundus photography; check BP/ blood sugar", "marks": 2}, {"point": "Communicate with patient, follow-up arranged, coordinate with physician for diabetes/ hypertension", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 2, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

3. Briefly describe low vision aids suitable for his functional limitations (reading, pouring liquids, watching TV). Include optical and non-optical devices. (5 marks)', 'Optical: illuminated hand-held or stand magnifiers and high-plus reading spectacles for reading; a hand-held or spectacle-mounted telescope for TV and recognising faces; an electronic video magnifier (CCTV) or tablet with zoom for reading. Non-optical: good task lighting; large-print materials, books and phone; high-contrast items (e.g. a white cup on a dark tray, coloured tape on step edges); a liquid-level indicator or finger technique for pouring tea; sitting closer to the TV; talking watch, audiobooks and voice assistants; and training in eccentric viewing to use the healthy retina around the scotoma (the left eye currently carries most tasks).', null, '[{"point": "Optical: hand-held/ stand illuminated magnifiers, high plus reading spectacles, telescopes for TV/ faces, electronic magnifiers (CCTV)", "marks": 2.5}, {"point": "Non-optical: good lighting, large print, high contrast items (dark cup), liquid level indicator, sitting closer to TV, talking devices, eccentric viewing training", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 3, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

4. What is the role of an optometrist in early detection and co-management of AMD in ageing populations? Include education, surveillance and rehabilitation. (5 marks)', 'Early detection: regular eye examinations for people over 50 with dilated fundus examination or imaging (OCT), Amsler grid testing, identifying drusen and pigment changes and assessing risk. Education: explain risk factors (age, smoking, family history, diet, cardiovascular disease), advise stopping smoking, a diet rich in green leafy vegetables and fish, UV protection, AREDS2 supplements for intermediate AMD, and teach patients to use the Amsler grid and report sudden distortion or blur urgently. Surveillance and co-management: monitor dry AMD, refer wet AMD promptly, share care with ophthalmologists (checking VA/OCT between anti-VEGF injections). Rehabilitation: low vision assessment, magnifiers and lighting, training, counselling for anxiety/depression, and referral to social support.', null, '[{"point": "Early detection: routine eye exams for older adults, fundus/ OCT, Amsler, identify drusen/ risk", "marks": 1.5}, {"point": "Education: risk factors (smoking, diet, UV), symptoms needing urgent attention, supplements (AREDS2) for intermediate AMD", "marks": 1.5}, {"point": "Surveillance/co-management: monitoring, prompt referral, follow-up between injections", "marks": 1}, {"point": "Rehabilitation: low vision services, aids, counselling, referral to support", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 4, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

5. List all the layers of the retina. What is the function of photoreceptors? (7 marks)', 'Layers from outer (choroid side) to inner (vitreous side): 1. retinal pigment epithelium; 2. photoreceptor layer (rod and cone outer and inner segments); 3. external limiting membrane; 4. outer nuclear layer; 5. outer plexiform layer; 6. inner nuclear layer; 7. inner plexiform layer; 8. ganglion cell layer; 9. nerve fibre layer; 10. internal limiting membrane. Photoreceptors convert light into electrical signals by phototransduction (light changes visual pigments such as rhodopsin, altering membrane potential). Rods work in dim light (scotopic, night and peripheral vision, motion); cones work in bright light, give colour vision and fine detail and are concentrated at the fovea.', null, '[{"point": "Ten layers in order (outer to inner): RPE, photoreceptor layer (rods/cones), external limiting membrane, outer nuclear, outer plexiform, inner nuclear, inner plexiform, ganglion cell, nerve fibre layer, internal limiting membrane", "marks": 5}, {"point": "Photoreceptors: rods (dim light, scotopic, periphery) and cones (colour, fine detail, photopic, fovea) convert light into electrical signals (phototransduction)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 5, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

6. List three causes of sudden loss of vision. Briefly describe one of them. (5 marks)', 'Causes: central retinal artery occlusion, central retinal vein occlusion, retinal detachment, vitreous haemorrhage (e.g. proliferative diabetic retinopathy), wet AMD, acute angle-closure glaucoma, optic neuritis, anterior ischaemic optic neuropathy (including giant cell arteritis). Example - central retinal artery occlusion: an embolus (often from carotid plaque) or thrombus blocks the central retinal artery; the patient has sudden, painless, profound loss of vision in one eye; there is a relative afferent pupillary defect, a pale swollen retina with a ''cherry-red spot'' at the fovea and narrowed arterioles. It is an emergency (eye stroke) needing immediate referral, and workup for stroke risk (carotids, heart, giant cell arteritis in older patients).', null, '[{"point": "Three causes: retinal detachment, central retinal artery/ vein occlusion, vitreous haemorrhage, wet AMD, acute angle-closure glaucoma, optic neuritis, ischaemic optic neuropathy, stroke", "marks": 2}, {"point": "One described: cause/ mechanism, symptoms, signs, urgency/ management", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 6, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

7. What is anti-VEGF? Name one commonly used anti-VEGF. (3 marks)', 'Anti-VEGF agents are drugs that block vascular endothelial growth factor, the protein that stimulates abnormal new blood vessel growth and leakage (e.g. CNV in wet AMD, diabetic macular oedema). Given as repeated intravitreal injections, they stop new vessel growth and reduce fluid and bleeding, stabilising or improving vision. Examples: ranibizumab (Lucentis), aflibercept (Eylea), bevacizumab (Avastin) or faricimab.', null, '[{"point": "Drugs blocking vascular endothelial growth factor, which drives abnormal new vessel growth and leakage; given by intravitreal injection, stops CNV growth, reduces fluid", "marks": 2}, {"point": "Examples: ranibizumab, aflibercept, bevacizumab, faricimab", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 7, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

8. Draw a ray diagram to show the type of refractive error in the left eye. (3 marks)', 'The left eye has hyperopia (+1.25 DS). Diagram: parallel rays from a distant object are refracted by the cornea and lens but come to a focus behind the retina (eyeball too short or too little refractive power), so a blur circle falls on the retina (accommodation may compensate). Correction: a convex (plus) lens in front of the eye converges the rays so they focus on the retina. Label rays, lens, retina and focal point.', null, '[{"point": "Left eye +1.25 DS = hyperopia: parallel rays focus behind the retina (short eye), blur circle on retina", "marks": 2}, {"point": "Correction with convex (plus) lens converging rays onto retina; labels", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 8, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

9. What are the different parts of a slit lamp? Name two accessories that are or can be attached to a slit lamp. (4 marks)', 'Parts: (a) illumination system - light source, condenser, slit width and height controls, filters (cobalt blue, red-free, diffuser), mirror/prism; (b) observation system - binocular stereomicroscope with eyepieces and a magnification changer; (c) mechanical system - joystick and base for movement and focusing, chin rest and forehead rest, fixation target and the common pivot that keeps illumination and microscope coupled. Accessories: Goldmann applanation tonometer; non-contact fundus lenses (90D/78D) and gonioscopy or three-mirror lenses; also a camera, Hruby lens or pachymeter attachment.', null, '[{"point": "Parts: illumination system (lamp, slit width/height controls, filters), observation system (binocular microscope, magnification changer), mechanical system (joystick, base, chin rest/ forehead rest, coaxial mounting)", "marks": 2}, {"point": "Two accessories: Goldmann applanation tonometer, 90D/78D lens, gonioscopy lens, camera, Hruby lens, pachymeter, Hertel", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 9, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

10. What is IOP? What is your observation on this patient''s IOP? (3 marks)', 'Intraocular pressure is the fluid pressure inside the eye, set by the balance between aqueous humour production (ciliary body) and outflow (trabecular meshwork and uveoscleral routes); normal is about 10-21 mmHg. Observation: OD 15 mmHg and OS 20 mmHg are both within the normal range, but the left is at the upper end and there is a 5 mmHg asymmetry, so the optic discs, central corneal thickness and visual fields should be checked and IOP monitored for glaucoma risk.', null, '[{"point": "IOP: pressure of aqueous humour inside the eye, balance of production and outflow; normal 10-21 mmHg", "marks": 1.5}, {"point": "Observation: OD 15, OS 20 - both within normal limits, but asymmetry 5 mmHg and OS at upper normal - monitor, check optic disc/ CCT, glaucoma risk", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 10, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

11. The patient asks: ''Will I go blind in the other eye?'' How would you counsel him empathetically about prognosis, monitoring and lifestyle? (4 marks)', 'Acknowledge his fear, sit with him and listen. Explain honestly but reassuringly that AMD affects central vision and does not cause total darkness - side vision usually remains, so he will be able to move around independently. His left eye has early changes and has a higher risk of developing the same problem, but with early detection modern injections can protect vision. Teach daily Amsler grid checks of the left eye and ask him to come urgently if lines become wavy or a dark spot appears; arrange regular reviews. Advise not smoking, a diet rich in leafy greens and fish, AREDS2 supplements if advised, good control of blood pressure and sugar, and sun protection. Offer low vision help and involve family or community support since he lives alone.', null, '[{"point": "Empathy: acknowledge fear, listen, honest reassurance - AMD rarely causes total blindness (peripheral vision kept)", "marks": 1}, {"point": "Prognosis: risk of fellow eye developing wet AMD (moderate), early treatment works", "marks": 1}, {"point": "Monitoring: daily Amsler grid self-check of left eye, regular reviews, urgent attention to new symptoms", "marks": 1}, {"point": "Lifestyle: stop smoking, diet, supplements, control BP/ sugar, UV protection, support since lives alone", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 11, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sudden central vision loss in a 68-year-old
A 68-year-old retired school principal presents with sudden central vision loss in the right eye for 3 days - "a black spot right in the centre" with surrounding blur and mild distortion. He finds it difficult to read, recognise faces and pour tea. He has had diabetes and hypertension for over 20 years, both moderately controlled, with a recent increase in BP medication. He lives alone and is very worried.
Findings (OD / OS):
- Uncorrected distance VA: 6/60 / 6/9
- Refraction (post-cycloplegic): +0.50 / -0.25 x 180 / +1.25 DS
- Best corrected / pinhole VA: 6/60 / 6/9
- Slit lamp: anterior segment normal in both eyes
- IOP: 15 mmHg / 20 mmHg
- OCT OD: subretinal fluid; a small dome-shaped pigment epithelial detachment (PED) under the central retina; mild disruption of the outer retinal layers (photoreceptors). OS: normal.
- Fundoscopy OD: a fresh dark-red subretinal haemorrhage just below the central macula, and a grey-green area under the fovea suggesting choroidal neovascularisation (CNV). OS: normal fundus with mild RPE mottling.

12. What eye health message would you give the public about diabetes and hypertension? (3 marks)', 'Diabetes and high blood pressure can silently damage the blood vessels of the eye (diabetic and hypertensive retinopathy, vein occlusions, macular swelling) and can lead to permanent blindness, often without early symptoms. Everyone with diabetes or hypertension should have a dilated eye examination at least once a year, even if vision seems fine. Keep blood sugar, blood pressure and cholesterol under control, take medicines regularly, eat healthily, exercise, avoid smoking and alcohol, and see an eye-care professional immediately if vision suddenly changes.', null, '[{"point": "Both can damage the eyes silently (retinopathy, vein occlusion, etc.) and cause blindness", "marks": 1}, {"point": "Annual dilated eye examination even without symptoms", "marks": 1}, {"point": "Control sugar, BP, cholesterol, take medicine, healthy lifestyle; seek care for sudden vision change", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Optometry", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-optom2025-case2', 12, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'C2Q12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A contact lens wearer sees haloes around lights at night after switching lenses. The most likely cause is', null, 'Haloes in contact lens wearers usually come from corneal oedema (hypoxia), deposits or poor lens fit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cataract in a 26-year-old', false, 1), ('B', 'Optic neuritis', false, 2), ('C', 'Retinal detachment', false, 3), ('D', 'Corneal oedema from hypoxia or lens deposits/poor fit', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Using Prentice''s rule, the prismatic effect 10 mm below the optical centre of a +4.00 D lens is', null, 'P = c(cm) x F = 1 x 4 = 4 Δ; below the centre of a plus lens the base is up.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '40 Δ base down', false, 1), ('B', '4 Δ base up', true, 2), ('C', '0.4 Δ base up', false, 3), ('D', '4 Δ base down', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which low vision device is most suitable for reading by a patient with a central scotoma from macular degeneration?', null, 'Magnification with good light and eccentric viewing helps central field loss.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plano tinted lenses only', false, 1), ('B', 'Pinhole spectacles', false, 2), ('C', 'Reverse telescope', false, 3), ('D', 'Illuminated stand magnifier with eccentric viewing training', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which spectacle lens material is usually recommended for children because of its high impact resistance and built-in UV protection?', null, 'Polycarbonate (or Trivex) is shatter-resistant and blocks UV, making it the standard choice for children.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'optometry'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Optometry): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'optometry'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polycarbonate', true, 1), ('B', 'Crown glass', false, 2), ('C', 'High-index glass', false, 3), ('D', 'CR-39', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
