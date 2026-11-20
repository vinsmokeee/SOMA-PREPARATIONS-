-- ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'mbbs-medicine', 'MBBS / Medicine' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'mbbs-medicine') is null then raise exception 'unknown specialisation mbbs-medicine'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'mbbs-medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mbbs-medicine'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mbbs-medicine'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mbbs-medicine'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following vaccine must be given within 24 hours of birth?', null, 'The hepatitis B birth dose should be given within 24 hours of birth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'BCG', false, 1), ('B', 'Pentavalent', false, 2), ('C', 'Oral Polio vaccine', false, 3), ('D', 'Hepatitis B', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is a Serious Adverse Event Following Immunization (AEF)?', null, 'Seizures after vaccination are a serious AEFI; local reactions and fever are minor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pain at the site of vaccination', false, 1), ('B', 'Fever after vaccination', false, 2), ('C', 'Seizure after vaccination', true, 3), ('D', 'Redness of the skin at the site of vaccination.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is used in the prevention of complications of measles?', null, 'Vitamin A reduces complications and deaths from measles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Antibiotics', false, 1), ('B', 'Vitamin A', true, 2), ('C', 'Antipyretics', false, 3), ('D', 'Analgesics', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which test is designed to assess the body’s ability to metabolize blood glucose?', null, 'The oral glucose tolerance test assesses glucose metabolism.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fasting Plasma Glucose', false, 1), ('B', 'Random blood glucose.', false, 2), ('C', 'Oral Glucose tolerance test', true, 3), ('D', 'Postprandial glucose', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Side effect of metformin is', null, 'Gastrointestinal upset is the commonest side effect of metformin.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypoglycemia', false, 1), ('B', 'Weight loss', false, 2), ('C', 'Gastrointestinal disturbances', true, 3), ('D', 'Weight gain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the recommended target blood pressure for patients receiving antihypertensive treatment, according to current guidelines?', null, 'WHO recommends a target below 140/90 mmHg for most treated patients.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '130-140mmHg systolic and 70-80mmHg diastolic.', false, 1), ('B', 'Less than 140mmHg systolic and 90mmg diastolic', true, 2), ('C', '120-130mmHg systolic and 80-90mmHg diastolic.', false, 3), ('D', '120-130mmHg systolic and 70-80mmHg diastolic.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common position of appendix is', null, 'The retrocaecal position is the most common.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pre-ileal', false, 1), ('B', 'Retrocecal', true, 2), ('C', 'Ileocecal', false, 3), ('D', 'Subcecal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Most feared side effect of Anti snake venom is', null, 'Anaphylaxis is the most feared reaction to anti-snake venom.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Renal Failure', false, 1), ('B', 'Congestive cardiac failure.', false, 2), ('C', 'Paralysis', false, 3), ('D', 'Anaphylaxis.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 30-year-old woman has had headaches for 6 months, worsened over the past 5 days but improved after stopping analgesics. What is the likely diagnosis?', null, 'Headache improving after stopping analgesics suggests medication-overuse headache.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tension headache', false, 1), ('B', 'Medication overuse headache', true, 2), ('C', 'Chronic migraine', false, 3), ('D', 'Cluster headache', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Crohn’s disease', null, 'Crohn''s disease can affect any part of the GI tract from mouth to anus.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is the disease of small intestine only', false, 1), ('B', 'Can affect any part of the gastrointestinal tract', true, 2), ('C', 'Spreads to the lymph nodes', false, 3), ('D', 'Mostly involve the colon', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common organism causing urinary tract infection is', null, 'E. coli is the commonest cause of UTI.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Escherichia Coli', true, 1), ('B', 'Proteus', false, 2), ('C', 'Klebsiella', false, 3), ('D', 'Streptococcus aureus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is true for ventricular tachycardia?', null, 'AV dissociation is characteristic of VT (wide QRS; does not respond to vagal manoeuvres).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Narrow QRS complex in ECG', false, 1), ('B', 'Intravenous adenosine is the treatment of choice', false, 2), ('C', 'Responds to carotid sinus massage', false, 3), ('D', 'There is atrioventricular dissociation.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 36-week pregnant woman has breathlessness, excessive abdominal distension, a tense but non- tender abdomen, symphysis-fundal height of 41 cm, muffled fetal heart sounds, and difficulty palpating foetal parts.', null, 'Large-for-dates, tense uterus, muffled heart sounds and hard-to-feel parts suggest polyhydramnios.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polyhydramnios', true, 1), ('B', 'Abruptio placenta', false, 2), ('C', 'Hydrocephalus of foetus', false, 3), ('D', 'Fetal-maternal ascites', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A young man presents with a painless ulcer on the genital region, with non-tender swelling of the inguinal lymph nodes. What is the most likely diagnosis?', null, 'A painless ulcer with non-tender nodes suggests primary syphilis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Herpes Genitalis', false, 1), ('B', 'Granuloma inguinale', false, 2), ('C', 'Syphilis', true, 3), ('D', 'Chancroid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 30-year male presents to the emergency after a road traffic accident with thigh pain, swelling, and deformity. What is the most immediate life-threatening complication of femoral shaft fracture?', null, 'Haemorrhagic shock (blood loss up to 1-1.5 L) is the most immediate threat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Deep vein thrombosis', false, 1), ('B', 'Fat embolism syndrome', false, 2), ('C', 'Pulmonary embolism', false, 3), ('D', 'Hemorrhagic shock', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following red cell indices indicates the size of red blood cells?', null, 'MCV indicates red cell size.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RDW', false, 1), ('B', 'Hemoglobin concentration', false, 2), ('C', 'MCHC', false, 3), ('D', 'MCV', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All vaccines should be stored within a specific temperature range of', null, 'Vaccines are stored at +2 °C to +8 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '+2°C to +8°C', true, 1), ('B', '0°C to 8°C', false, 2), ('C', '-2°C to -8°C', false, 3), ('D', '+4°C to +10°C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many antenatal visits are recommended by the WHO for a low-risk pregnancy?', null, 'WHO (2016) recommends at least eight antenatal contacts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4 visits', false, 1), ('B', '8 visits', true, 2), ('C', '2 visits', false, 3), ('D', '6 visits', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents to the outpatient department (OPD) with hand tremors, tachycardia, and significant weight loss. Which of the following thyroid function test profiles is most indicative of hyperthyroidism?', null, 'Hyperthyroidism: low TSH with raised T3 and T4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Low TSH, raised T3 and T4', true, 1), ('B', 'Normal TSH, normal T3, raised T4', false, 2), ('C', 'Low TSH, T3 and T4', false, 3), ('D', 'raised TSH, low T3 and T4', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient stopped alcohol consumption for 3 days and presented with irritability, disorientation, paranoid delusions, agitation, visual hallucinations, and altered sensorium. What is the likely diagnosis in this case?', null, 'Delirium tremens occurs 2-4 days after stopping alcohol.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Delirium tremens', true, 1), ('B', 'Korsakoff psychosis', false, 2), ('C', 'Wernicke’s encephalopathy', false, 3), ('D', 'Alcohol-induced psychosis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following systemic disease is most commonly associated with early cataract formation?', null, 'Diabetes causes early cataract.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Asthma', false, 1), ('B', 'Hypertension', false, 2), ('C', 'Diabetes mellitus', true, 3), ('D', 'Hyperthyroidism', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On otoscopic examination, a classic finding in acute otitis media is', null, 'Acute otitis media shows a bulging, red tympanic membrane.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Perforated tympanic membrane with granulation tissue', false, 1), ('B', 'Normal translucent tympanic membrane', false, 2), ('C', 'Retracted tympanic membrane', false, 3), ('D', 'Bulging and erythematous tympanic membrane', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the most common congenital heart defect?', null, 'VSD is the commonest congenital heart defect.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tetralogy of Fallot', false, 1), ('B', 'Atrial Septal Defect (ASD)', false, 2), ('C', 'Patent Ductus Arteriosus (PDA)', false, 3), ('D', 'Ventricular Septal Defect (VSD)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Beriberi is caused by deficiency of', null, 'Beriberi is thiamine (vitamin B1) deficiency.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Niacin', false, 1), ('B', 'Vitamin A', false, 2), ('C', 'Vitamin B1', true, 3), ('D', 'Vitamin E alpha', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A newborn baby looked normal at birth but within few hours her lips are blue. A harsh murmur is heard on auscultation. What is the most likely cause of the cyanosis?', null, 'Of the options, only Ebstein''s anomaly causes early cyanosis with a murmur.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ebstein’s anomaly', true, 1), ('B', 'Atrial septal defect', false, 2), ('C', 'Coaractation of aorta', false, 3), ('D', 'Ventricular septal defect', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In females, Neisseria gonorrhoeae infection typically presents with which type of vaginal discharge?', null, 'Gonorrhoea causes mucopurulent cervical discharge.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thin, scanty, white and frothy', false, 1), ('B', 'Copious, yellow-green and frothy.', false, 2), ('C', 'Mucupurulent discharge', true, 3), ('D', 'Thick white and curd like', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Screening of gestational diabetes mellitus should be performed between or at', null, 'GDM screening is done at 24-28 weeks (earlier if high risk).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'First antenatal visit', false, 1), ('B', '24th week and 28th week of gestation', true, 2), ('C', 'First trimester', false, 3), ('D', '12th week and 18th week of gestation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Neonates die during resuscitation because of the failure to', null, 'Failure to oxygenate/ventilate is the main reason neonates die during resuscitation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'oxygenate', true, 1), ('B', 'diagnose the condition', false, 2), ('C', 'preform CPR', false, 3), ('D', 'intubate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a vaccine vial monitor (VVM) the active ingredient is in the', null, 'The heat-sensitive active material is in the inner square of the VVM.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inner white square', true, 1), ('B', 'Outer white square', false, 2), ('C', 'Inner grey circle', false, 3), ('D', 'Outer grey circle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old man presents to the OPD with fever, productive cough and right-sided pleuritic chest pain for 3 days. On examination he is febrile, has a respiratory rate of 28/min, and crepitations are heard in the lower zone of the right lung.

a) What is the most likely diagnosis? (1 mark)', 'a) Community-acquired pneumonia of the right lower lobe.', null, '[{"point": "Community-acquired pneumonia (right lower lobe)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s1', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old man presents to the OPD with fever, productive cough and right-sided pleuritic chest pain for 3 days. On examination he is febrile, has a respiratory rate of 28/min, and crepitations are heard in the lower zone of the right lung.

b) Mention two common causative organisms. (2 marks)', 'b) Streptococcus pneumoniae (commonest) and Haemophilus influenzae; also Mycoplasma pneumoniae, Staphylococcus aureus, Klebsiella.', null, '[{"point": "Streptococcus pneumoniae, Haemophilus influenzae (also Mycoplasma, Staph aureus, Klebsiella)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s1', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 45-year-old man presents to the OPD with fever, productive cough and right-sided pleuritic chest pain for 3 days. On examination he is febrile, has a respiratory rate of 28/min, and crepitations are heard in the lower zone of the right lung.

c) How will you treat the patient? (2 marks)', 'c) Confirm with chest X-ray and blood tests; assess severity (CURB-65 - RR ≥30 or other features may need admission). Give antibiotics: oral amoxicillin (plus a macrolide such as azithromycin for atypical cover) for mild disease; IV ceftriaxone or co-amoxiclav plus a macrolide if moderate/severe. Supportive care: oxygen if SpO2 low, fluids, paracetamol for fever and pain, rest, and review response in 48-72 hours.', null, '[{"point": "Assess severity (CURB-65); antibiotics (amoxicillin/ co-amoxiclav ± macrolide; ceftriaxone if severe), supportive: oxygen, fluids, antipyretics, chest X-ray", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s1', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old man is hit by a car and brought to the emergency department within 10 minutes. Vital signs on arrival: BP 90/60 mmHg, pulse 140/min, respiratory rate 30/min, temperature 37 °C.

a) Is this patient critically ill? If so, why? (2 marks)', 'a) Yes. After high-energy trauma he is hypotensive (90/60), very tachycardic (140/min) and tachypnoeic (30/min) - signs of shock and possible respiratory compromise, so he is a priority (red) emergency.', null, '[{"point": "Yes - hypotension, tachycardia 140, tachypnoea 30 after major trauma: signs of shock/ triage red", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s2', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old man is hit by a car and brought to the emergency department within 10 minutes. Vital signs on arrival: BP 90/60 mmHg, pulse 140/min, respiratory rate 30/min, temperature 37 °C.

b) On further examination, the pulse oximeter reading is 85% and the patient responds only to pain. The skin is cool and pale, the pulse weak and thready, and capillary refill time is 5 seconds. What is the immediate management of the airway to prevent complications? (2 marks)', 'b) Airway with cervical spine protection: manual in-line stabilisation/collar; jaw thrust (no head tilt); suction blood/secretions; oropharyngeal airway; high-flow oxygen (15 L/min via non-rebreather mask); because he responds only to pain (GCS ≤8 likely) and SpO2 is 85%, secure a definitive airway by endotracheal intubation (rapid sequence induction) to prevent aspiration and hypoxia.', null, '[{"point": "Airway with cervical spine protection: jaw thrust, suction, airway adjunct, high-flow oxygen; definitive airway (intubation) as GCS low (responds to pain)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s2', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 25-year-old man is hit by a car and brought to the emergency department within 10 minutes. Vital signs on arrival: BP 90/60 mmHg, pulse 140/min, respiratory rate 30/min, temperature 37 °C.

c) What life-threatening condition may the patient be suffering from? (1 mark)', 'c) Haemorrhagic (hypovolaemic) shock, class III-IV, from internal or external bleeding (possibly with head injury).', null, '[{"point": "Haemorrhagic (hypovolaemic) shock", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s2', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 40-year-old man comes to the OPD with headache and blurred vision for one month. His BP is 160/100 mmHg. He is not a known case of any chronic disease and is not on any medication.

a) What is your next step? (1 mark)', 'a) Confirm the BP by repeated measurements (after rest, correct cuff, both arms) and examine the fundi and other target organs; since he has symptoms (blurred vision), look for hypertensive retinopathy/urgency.', null, '[{"point": "Confirm BP with repeat measurements (correct technique, both arms) and fundoscopy/ assess target organ damage", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s3', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 40-year-old man comes to the OPD with headache and blurred vision for one month. His BP is 160/100 mmHg. He is not a known case of any chronic disease and is not on any medication.

b) What type of hypertension is the patient suffering from? (1 mark)', 'b) Stage 2 (grade 2) hypertension (≥160/100), most likely primary (essential) hypertension; secondary causes should be excluded in a young patient.', null, '[{"point": "Stage 2 (grade 2) hypertension; likely primary (essential) - symptomatic", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s3', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 40-year-old man comes to the OPD with headache and blurred vision for one month. His BP is 160/100 mmHg. He is not a known case of any chronic disease and is not on any medication.

c) Mention the basic investigations required for the patient. (2 marks)', 'c) Urine routine (protein, blood), serum creatinine and electrolytes (urea, Na, K), fasting blood glucose/HbA1c, lipid profile, ECG (LVH), fundoscopy; if indicated, echocardiography, TSH and renal ultrasound.', null, '[{"point": "Urine routine (protein), serum creatinine/ electrolytes, blood glucose, lipid profile, ECG, fundoscopy (± echo, TSH)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s3', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 40-year-old man comes to the OPD with headache and blurred vision for one month. His BP is 160/100 mmHg. He is not a known case of any chronic disease and is not on any medication.

d) Name one angiotensin receptor blocker used to treat hypertension. (1 mark)', 'd) Losartan (or telmisartan, valsartan, olmesartan).', null, '[{"point": "Losartan / telmisartan / olmesartan", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s3', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S3d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old woman working in a hotel feels tired easily, is intolerant to cold and has menstrual irregularities. A few days ago her friends noticed hoarseness of her voice. On examination her heart rate is 60/min, BP 120/80 mmHg, and she has dry skin and cold hands.

a) What is the most likely diagnosis? (1 mark)', 'a) Hypothyroidism (most likely primary, e.g. Hashimoto''s thyroiditis).', null, '[{"point": "Hypothyroidism", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s4', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old woman working in a hotel feels tired easily, is intolerant to cold and has menstrual irregularities. A few days ago her friends noticed hoarseness of her voice. On examination her heart rate is 60/min, BP 120/80 mmHg, and she has dry skin and cold hands.

b) How would you confirm the diagnosis? (1 mark)', 'b) Thyroid function tests - serum TSH and free T4 (± T3).', null, '[{"point": "Thyroid function test (TSH, free T4)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s4', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old woman working in a hotel feels tired easily, is intolerant to cold and has menstrual irregularities. A few days ago her friends noticed hoarseness of her voice. On examination her heart rate is 60/min, BP 120/80 mmHg, and she has dry skin and cold hands.

c) How would the test report confirm the diagnosis? (2 marks)', 'c) Primary hypothyroidism: raised TSH with low free T4 (subclinical if TSH high but T4 normal); positive anti-TPO antibodies suggest autoimmune (Hashimoto''s) thyroiditis.', null, '[{"point": "Raised TSH with low free T4 (primary); ± anti-TPO antibodies for Hashimoto''s", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s4', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 35-year-old woman working in a hotel feels tired easily, is intolerant to cold and has menstrual irregularities. A few days ago her friends noticed hoarseness of her voice. On examination her heart rate is 60/min, BP 120/80 mmHg, and she has dry skin and cold hands.

d) Name the drug used to treat the condition. (1 mark)', 'd) Levothyroxine (L-thyroxine), taken once daily on an empty stomach, dose adjusted by TSH.', null, '[{"point": "Levothyroxine", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-s4', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'S4d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

a) What condition is the patient suffering from? (1 marks)', 'Pre-eclampsia with severe-range blood pressure (new-onset hypertension after 20 weeks in a previously normotensive woman; if no proteinuria or features, gestational hypertension - severe). Fundal height smaller than dates also suggests foetal growth restriction.', null, '[{"point": "Pre-eclampsia (severe range BP) - new hypertension after 20 weeks (gestational hypertension/ pre-eclampsia)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

b) How is the condition diagnosed? (2 marks)', 'Blood pressure ≥140/90 mmHg on two occasions at least 4 hours apart (≥160/110 confirmed within minutes) after 20 weeks of gestation, plus proteinuria (≥300 mg/24 h, protein/creatinine ratio ≥0.3, or dipstick ≥2+), or, without proteinuria, maternal organ dysfunction (raised creatinine, raised liver enzymes, low platelets, neurological symptoms, pulmonary oedema) or uteroplacental dysfunction (foetal growth restriction).', null, '[{"point": "BP ≥140/90 on two occasions ≥4 h apart after 20 weeks", "marks": 1}, {"point": "Plus proteinuria (≥300 mg/24 h, PCR ≥0.3, dipstick ≥2+) or maternal organ dysfunction/ uteroplacental dysfunction", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

c) List the severe (fulminant) features of the condition. (3 marks)', 'Systolic BP ≥160 or diastolic ≥110 mmHg; severe persistent headache or visual disturbances; epigastric or right upper quadrant pain; thrombocytopenia (<100,000/µL); raised liver enzymes (twice normal) - HELLP syndrome; renal impairment (creatinine >1.1 mg/dL or doubling) or oliguria; pulmonary oedema; seizures (eclampsia); foetal growth restriction or placental abruption.', null, '[{"point": "Any six: BP ≥160/110, severe headache/visual disturbance, epigastric/RUQ pain, platelets <100,000, raised liver enzymes (HELLP), creatinine >1.1/ oliguria, pulmonary oedema, eclampsia, FGR/ abruption", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

d) When the condition is accompanied by seizures, what is it called? (1 marks)', 'Eclampsia.', null, '[{"point": "Eclampsia", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

e) What is the target blood pressure with treatment? (1 marks)', 'Aim for about 140-150 / 90-100 mmHg (e.g. below 150/100, diastolic 85-100), lowering gradually to protect placental perfusion; urgent treatment if ≥160/110.', null, '[{"point": "About 140-150/90-100 mmHg (avoid sudden drop; e.g. <150/100, diastolic 85-100)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 5, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

f) How will you manage the seizures (the second condition)? (10 marks)', 'Call for help; place the woman in the left lateral position; protect her from injury (do not restrain); maintain airway, suction secretions, give oxygen; insert IV line and send bloods (CBC, platelets, LFT, RFT, coagulation, urine protein); catheterise and monitor fluid intake/output (restrict fluids to about 80 mL/h). Give magnesium sulphate - loading dose 4 g IV over 5-15 minutes plus 10 g IM (5 g in each buttock) (Pritchard), then 5 g IM 4-hourly in alternate buttocks (or 1 g/h IV infusion - Zuspan) for 24 hours after delivery or the last seizure, monitoring for toxicity. Control severe BP with labetalol IV, hydralazine IV or oral nifedipine to 140-150/90-100. Monitor BP, pulse, RR, reflexes, SpO2 and urine output, and the foetus. Stabilise, then plan delivery (eclampsia is an indication for delivery regardless of gestation - vaginal or caesarean as indicated); give steroids if preterm and time permits. Continue monitoring postpartum, as seizures can occur after delivery.', null, '[{"point": "Call for help, left lateral position, protect from injury, airway, suction, oxygen, IV access, do not leave alone", "marks": 3}, {"point": "Magnesium sulphate loading and maintenance (Pritchard or Zuspan), monitoring", "marks": 3}, {"point": "Control BP (labetalol/ hydralazine/ nifedipine)", "marks": 2}, {"point": "Delivery after stabilisation, fluid balance, monitoring/ investigations, foetal monitoring, postpartum care", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 6, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

g) How will you prepare the loading dose of the drug? (5 marks)', 'Intravenous part: take 4 g magnesium sulphate = 8 mL of the 50% solution and dilute with 12 mL of sterile water or normal saline to make 20 mL of a 20% solution; give slowly IV over 5-15 minutes. Intramuscular part (Pritchard regimen): 10 g = 20 mL of 50% solution; give 5 g (10 mL) by deep IM injection into the upper outer quadrant of each buttock, each mixed with 1 mL of 2% lignocaine, using aseptic technique.', null, '[{"point": "IV: 4 g = 8 mL of 50% MgSO4 diluted with 12 mL sterile water/saline to 20 mL (20% solution), given slowly over 5-15 min", "marks": 3}, {"point": "IM: 10 g = 20 mL of 50% solution, 5 g (10 mL) deep IM in each buttock with 1 mL 2% lignocaine, aseptic technique", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 7, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

h) Mention three things you will check for toxicity of the drug. (3 marks)', 'Before each dose and regularly: 1. Patellar (knee-jerk) reflex must be present. 2. Respiratory rate must be at least 16 breaths/min (stop if below 12). 3. Urine output must be at least 30 mL/hour (100 mL in 4 hours). (Serum magnesium if available: therapeutic 4-7 mEq/L.)', null, '[{"point": "Patellar (knee) reflex present", "marks": 1}, {"point": "Respiratory rate ≥16/min (≥12)", "marks": 1}, {"point": "Urine output ≥30 mL/h (≥100 mL in 4 h)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 8, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

i) Name the antidote for the drug. (1 marks)', 'Calcium gluconate (10%).', null, '[{"point": "Calcium gluconate", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 9, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

j) How will you give the antidote? (2 marks)', 'Give 1 g calcium gluconate = 10 mL of 10% solution IV slowly over about 10 minutes, stop the magnesium sulphate, and support breathing (oxygen, bag-mask ventilation or intubation if respiratory arrest).', null, '[{"point": "10 mL of 10% calcium gluconate (1 g) IV slowly over 10 minutes; support breathing/ventilation, stop magnesium", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 10, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

k) The seizures continue after the loading dose. How much of the drug will you give and by what route? (2 marks)', 'Give an additional 2 g of magnesium sulphate IV (4 mL of 50% solution diluted to a 20% solution) slowly over 5 minutes (2 g if under 70 kg, up to 4 g if heavier).', null, '[{"point": "Further 2 g MgSO4 (4 mL of 50% diluted to 20%) IV over 5 minutes (2-4 g)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 11, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

l) What is this condition called?

Two hours later the patient delivered a 2 kg baby boy. The placenta was delivered normally but there was per vaginal bleeding of about 1000 mL. The blood pressure was 90/60 mmHg, pulse rate 100/min, and the uterus was soft. (1 marks)', 'Primary postpartum haemorrhage (PPH) - blood loss ≥500 mL within 24 hours of vaginal delivery (here 1000 mL with shock: severe PPH), most likely due to uterine atony.', null, '[{"point": "Primary postpartum haemorrhage (due to uterine atony)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 12, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

m) Mention three causes of the condition.

Two hours later the patient delivered a 2 kg baby boy. The placenta was delivered normally but there was per vaginal bleeding of about 1000 mL. The blood pressure was 90/60 mmHg, pulse rate 100/min, and the uterus was soft. (3 marks)', 'The ''4 Ts'': Tone - uterine atony (most common; e.g. after magnesium sulphate, prolonged labour, grand multiparity, overdistension); Trauma - tears of the cervix, vagina or perineum, uterine rupture or inversion; Tissue - retained placenta or membranes; Thrombin - coagulation disorders such as DIC or HELLP in pre-eclampsia.', null, '[{"point": "4 Ts: Tone (atony), Trauma (tears, rupture, inversion), Tissue (retained placenta/ products), Thrombin (coagulopathy, e.g. HELLP/ DIC) - any three", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 13, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q13', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q13';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

n) Differentiate between placenta praevia and abruptio placentae. (5 marks)', 'Placenta praevia: placenta implanted wholly or partly in the lower uterine segment; painless, causeless, recurrent, bright red bleeding (revealed); uterus soft and non-tender; foetal parts easily felt, malpresentation or high head common; maternal condition in proportion to visible blood loss; foetal heart usually normal; diagnosed by ultrasound; vaginal examination is contraindicated. Abruptio placentae: premature separation of a normally situated placenta; painful bleeding, dark blood, may be concealed; uterus tense, tender, ''woody hard'', foetal parts difficult to feel; shock out of proportion to visible bleeding; foetal distress or death common; associated with hypertension/pre-eclampsia, trauma, smoking; risk of DIC and renal failure.', null, '[{"point": "Definition: praevia - placenta implanted in lower segment; abruption - premature separation of normally sited placenta", "marks": 1}, {"point": "Bleeding: praevia painless, causeless, recurrent, bright red, revealed; abruption painful, may be concealed, dark", "marks": 1}, {"point": "Uterus: praevia soft, non-tender, malpresentation/high head; abruption tense, tender, woody hard", "marks": 1}, {"point": "Shock proportional to visible loss in praevia; out of proportion in abruption; foetal heart usually normal vs distressed/ absent", "marks": 1}, {"point": "Associations and diagnosis: praevia - USG, no PV exam; abruption - hypertension/ pre-eclampsia, trauma, DIC risk", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 14, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q14', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q14';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q14';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Hypertension in pregnancy and postpartum haemorrhage
A 29-year-old woman, gravida 3, had a blood pressure of 160/110 mmHg at her first antenatal visit at 24 weeks of gestation. She is not a known hypertensive. On examination the fundal height was 22 weeks. The foetal heart was present. There was no pallor or pedal oedema.

o) How will you manage the patient?

Two hours later the patient delivered a 2 kg baby boy. The placenta was delivered normally but there was per vaginal bleeding of about 1000 mL. The blood pressure was 90/60 mmHg, pulse rate 100/min, and the uterus was soft. (10 marks)', 'Call for help (senior obstetrician, anaesthetist); assess and resuscitate - airway, breathing (oxygen), circulation: two large-bore IV cannulae, send blood for grouping and cross-match, CBC, coagulation; rapid crystalloids and transfuse blood early; keep warm; catheterise and monitor urine output, BP and pulse. Stop bleeding: rub up the uterus (fundal massage) and give uterotonics - oxytocin 10 IU IM/IV then infusion (20-40 IU in 1 L at about 40-60 drops/min); misoprostol 800 µg sublingual/rectal; carboprost (15-methyl PGF2α) 250 µg IM if needed (caution in asthma). Avoid ergometrine because she has pre-eclampsia (hypertension). Give tranexamic acid 1 g IV over 10 minutes within 3 hours of birth (repeat once if bleeding continues). Check the placenta for completeness and examine the genital tract for tears; repair tears and remove retained tissue. If bleeding continues: bimanual uterine compression, external aortic compression, uterine balloon tamponade, then surgery (B-Lynch sutures, uterine/internal iliac artery ligation, hysterectomy as a last resort). Correct coagulopathy (FFP, platelets). After control, monitor closely in HDU, continue magnesium sulphate with dose monitoring, and treat anaemia.', null, '[{"point": "Call for help, ABC, oxygen, two large-bore IV cannulae, bloods (cross-match, CBC, coagulation), crystalloids, blood transfusion, catheterise, monitor", "marks": 3}, {"point": "Uterine massage and uterotonics: oxytocin 10 IU IM/IV then infusion 20-40 IU; misoprostol 800 µg; carboprost; avoid ergometrine (pre-eclampsia)", "marks": 3}, {"point": "Tranexamic acid 1 g IV within 3 h; examine placenta, explore for tears/ retained tissue; bimanual/aortic compression, balloon tamponade", "marks": 2}, {"point": "If fails: surgical - uterine compression sutures (B-Lynch), artery ligation, hysterectomy; post-PPH monitoring; continue MgSO4 cautiously", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case1', 15, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C1Q15', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q15';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q15';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

a) Mention the causes of chest pain. (10 marks)', 'Cardiovascular: acute coronary syndrome (STEMI, NSTEMI, unstable angina), stable angina, aortic dissection, pericarditis, myocarditis, aortic stenosis, hypertrophic cardiomyopathy. Respiratory: pulmonary embolism, pneumothorax, pneumonia and pleurisy, pulmonary hypertension. Gastrointestinal: gastro-oesophageal reflux, oesophageal spasm or rupture, peptic ulcer, biliary colic/cholecystitis, pancreatitis. Musculoskeletal: costochondritis, muscle strain, rib fracture. Others: herpes zoster, anxiety/panic attack.', null, '[{"point": "Cardiac: ACS/MI, stable angina, pericarditis, myocarditis, aortic dissection, aortic stenosis", "marks": 3}, {"point": "Pulmonary: PE, pneumonia, pneumothorax, pleurisy", "marks": 3}, {"point": "GI: GERD, oesophageal spasm/rupture, peptic ulcer, gallbladder, pancreatitis", "marks": 2}, {"point": "Musculoskeletal/ others: costochondritis, rib fracture, herpes zoster, anxiety", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 1, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

b) What could be the cause of this patient''s chest pain? Justify. (5 marks)', 'Acute coronary syndrome, most likely acute myocardial infarction. Justification: male smoker (risk factor); chest pain for 5 hours (longer than angina) radiating to the left arm; sweating (sympathetic activation); breathlessness and tachycardia; low SpO2 (possible left ventricular dysfunction); clear chest makes pneumonia or pneumothorax less likely. Pulmonary embolism and aortic dissection should still be considered.', null, '[{"point": "Acute coronary syndrome, most likely acute myocardial infarction (STEMI)", "marks": 2}, {"point": "Justification: smoker, 5 h pain radiating to left arm, sweating, tachycardia, breathlessness, hypoxia; clear chest", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 2, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

c) What urgent investigations would you request to confirm the diagnosis? (7 marks)', 'A 12-lead ECG within 10 minutes of arrival (repeated serially, with right-sided/posterior leads if needed); cardiac biomarkers - high-sensitivity troponin I or T (at presentation and repeated at 1-3 or 3-6 hours), CK-MB; bedside echocardiography for wall-motion abnormality; plus chest X-ray, arterial blood gas, CBC, electrolytes, renal function, glucose and lipids.', null, '[{"point": "12-lead ECG within 10 minutes, serial ECGs", "marks": 3}, {"point": "Cardiac biomarkers: high-sensitivity troponin I/T (serial), CK-MB", "marks": 3}, {"point": "Supporting: echocardiography, chest X-ray, ABG, electrolytes", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 3, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

d) What findings in the reports would confirm the cause of the pain? (7 marks)', 'ECG: ST-segment elevation of ≥1 mm in two contiguous limb leads or ≥2 mm in contiguous chest leads (or new left bundle branch block) with reciprocal ST depression - STEMI; hyperacute T waves early; later pathological Q waves and T inversion. (ST depression or T-wave inversion with raised troponin indicates NSTEMI.) The leads involved localise the infarct (e.g. V1-V4 anterior, II, III, aVF inferior). Troponin: raised above the 99th percentile upper reference limit with a rising and/or falling pattern confirms myocardial necrosis. Echo: new regional wall-motion abnormality.', null, '[{"point": "ECG: ST elevation ≥1 mm in two contiguous limb leads (≥2 mm chest leads), new LBBB; reciprocal depression; later Q waves, T inversion; or ST depression/ T inversion in NSTEMI", "marks": 4}, {"point": "Troponin rise above 99th percentile with rise/fall", "marks": 2}, {"point": "Echo regional wall motion abnormality", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 4, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

e) How will you manage the patient? (10 marks)', 'Admit to the resuscitation area/CCU with continuous ECG monitoring and defibrillator ready; give oxygen to keep SpO2 above 90-94%; IV access; aspirin 300 mg chewed; a P2Y12 inhibitor (clopidogrel 300-600 mg or ticagrelor 180 mg); sublingual/IV nitrates for pain if BP adequate; IV morphine for persistent pain with an antiemetic. Reperfusion for STEMI within 12 hours of onset: primary PCI if available within 120 minutes, otherwise thrombolysis (e.g. streptokinase 1.5 million units over 60 minutes or tenecteplase) after checking contraindications, followed by transfer for angiography. Anticoagulation with unfractionated heparin or enoxaparin. Then high-intensity statin (atorvastatin 80 mg), beta-blocker and ACE inhibitor once stable; treat complications; strict smoking cessation, risk-factor control, cardiac rehabilitation and long-term dual antiplatelet therapy.', null, '[{"point": "Immediate: monitor, oxygen (SpO2 80%), IV access, aspirin 300 mg chewed, P2Y12 inhibitor (clopidogrel 300-600 mg/ ticagrelor), nitrates if BP allows, morphine for pain", "marks": 4}, {"point": "Reperfusion: primary PCI within 120 min if available, else thrombolysis (streptokinase/ tenecteplase/ alteplase) within 12 h, check contraindications", "marks": 3}, {"point": "Anticoagulation (heparin/ enoxaparin), high-dose statin, beta-blocker, ACE inhibitor when stable; CCU care, smoking cessation, rehab", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 5, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

f) What are the complications if the condition is not treated or treatment is delayed? (8 marks)', 'Arrhythmias - ventricular fibrillation/tachycardia (sudden death), heart block, atrial fibrillation; acute left ventricular failure, pulmonary oedema and cardiogenic shock; mechanical complications - papillary muscle rupture with acute mitral regurgitation, ventricular septal rupture, free wall rupture with cardiac tamponade; left ventricular aneurysm; mural thrombus with systemic embolism and stroke; pericarditis and later Dressler''s syndrome; recurrent ischaemia/reinfarction; chronic heart failure and death.', null, '[{"point": "Arrhythmias (VF/VT - sudden death, heart block, AF)", "marks": 2}, {"point": "Heart failure, cardiogenic shock", "marks": 2}, {"point": "Mechanical: papillary muscle rupture/ mitral regurgitation, VSD, free wall rupture/ tamponade, LV aneurysm", "marks": 2}, {"point": "Pericarditis/ Dressler''s, mural thrombus and embolism/ stroke, reinfarction, death", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 6, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Chest pain in a smoker
A 41-year-old male smoker presented to the emergency department with chest pain of 5 hours'' duration. He also had breathlessness and a dry cough. On examination his pulse rate was 110/min, BP 139/89 mmHg and SpO2 80%. He was sweating. The chest was clear. On further history taking, the patient says the chest pain radiates to the left hand.

g) What additional investigations would you request once the patient is stabilised? (3 marks)', 'Echocardiography to assess left ventricular function and complications; coronary angiography (for PCI or CABG planning); fasting lipid profile, HbA1c/blood glucose, renal and liver function, thyroid function if indicated; and later exercise stress testing or Holter monitoring as needed.', null, '[{"point": "Echocardiography (LV function), coronary angiography, lipid profile, HbA1c/ glucose, renal function, stress testing as indicated", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, MBBS / Medicine", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mbbs2025-case2', 7, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which drug is used first-line to prevent and treat eclamptic seizures?', null, 'Magnesium sulphate is the drug of choice for preventing and treating eclampsia.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mbbs-medicine'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, MBBS / Medicine): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mbbs-medicine'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Phenobarbitone', false, 1), ('B', 'Magnesium sulphate', true, 2), ('C', 'Phenytoin', false, 3), ('D', 'Diazepam', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
