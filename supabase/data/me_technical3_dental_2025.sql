-- ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'dental-surgery', 'Dental Surgery' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'dental-surgery') is null then raise exception 'unknown specialisation dental-surgery'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'dental-surgery');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'dental-surgery'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Dental Surgery');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'dental-surgery'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Dental Surgery');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'dental-surgery'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Dental Surgery');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following bacteria is most commonly associated with dental caries?', null, 'Streptococcus mutans is the main cariogenic organism.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Streptococcus mutans', true, 1), ('B', 'Lactobacillus', false, 2), ('C', 'Staphylococcus aureus', false, 3), ('D', 'Streptococcus pyogenes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which tooth is most commonly involved in dens invaginatus?', null, 'Dens invaginatus most often affects the maxillary lateral incisor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maxillary central incisor', false, 1), ('B', 'Maxillary lateral incisor', true, 2), ('C', 'Mandibular first molar', false, 3), ('D', 'Mandibular canine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of pulpitis is:', null, 'Caries is the commonest cause of pulpitis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Trauma', false, 1), ('B', 'Periodontal disease', false, 2), ('C', 'Attrition', false, 3), ('D', 'Dental caries', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the safe dose of Lidocaine with epinephrine for an adult (mg/kg)?', null, 'Lidocaine with adrenaline: about 7 mg/kg (max 500 mg).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5 mg/kg', false, 1), ('B', '10 mg/kg', false, 2), ('C', '3 mg/kg', false, 3), ('D', '7 mg/kg', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The key hormone in calcium homeostasis is:', null, 'PTH is the key calcium-regulating hormone.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Calcitonin', false, 1), ('B', 'Insulin', false, 2), ('C', 'Parathyroid hormone', true, 3), ('D', 'Thyroxine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cyst found in the jaws is:', null, 'Radicular (periapical) cyst is the commonest jaw cyst.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dentigerous cyst', false, 1), ('B', 'Radicular cyst', true, 2), ('C', 'Nasopalatine cyst', false, 3), ('D', 'Odontogenic keratocyst', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a sign of irreversible pulpitis?', null, 'Spontaneous, lingering pain suggests irreversible pulpitis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thermal sensitivity only', false, 1), ('B', 'Spontaneous pain', true, 2), ('C', 'Pain on biting', false, 3), ('D', 'Cold sensitivity that resolves', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A butterfly-shaped rash is commonly seen in:', null, 'Malar butterfly rash: SLE.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Systemic lupus erythematosus', true, 1), ('B', 'Pemphigus vulgaris', false, 2), ('C', 'Psoriasis', false, 3), ('D', 'Eczema', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A primary tooth with furcal radiolucency likely has:', null, 'Furcation radiolucency in a primary molar indicates pulp necrosis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Enamel hypoplasia', false, 1), ('B', 'Pulp necrosis', true, 2), ('C', 'Physiologic root resorption', false, 3), ('D', 'Pericoronitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which cranial nerve supplies the muscles of mastication?', null, 'The mandibular division of the trigeminal nerve supplies the muscles of mastication.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Trigeminal nerve', true, 1), ('B', 'Facial nerve', false, 2), ('C', 'Hypoglossal nerve', false, 3), ('D', 'Glossopharyngeal nerve', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of dry socket is:', null, 'Dry socket follows loss/breakdown of the blood clot.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bacterial infection', false, 1), ('B', 'Antibiotic overuse', false, 2), ('C', 'Excessive bleeding', false, 3), ('D', 'Loss of blood clot', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pulp of the tooth originates from:', null, 'Pulp comes from neural crest-derived ectomesenchyme (dental papilla).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neural crest', true, 1), ('B', 'Mesoderm', false, 2), ('C', 'Endoderm', false, 3), ('D', 'Ectoderm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A high-pitched metallic sound on percussion of a tooth may indicate:', null, 'A metallic percussion note suggests ankylosis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hyper cementosis', false, 1), ('B', 'Ankylosis', true, 2), ('C', 'Reversible pulpitis', false, 3), ('D', 'Apical periodontitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which vitamin deficiency causes scurvy?', null, 'Vitamin C deficiency causes scurvy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin A', false, 1), ('B', 'Vitamin B1', false, 2), ('C', 'Vitamin C', true, 3), ('D', 'Vitamin D', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The junction between the crown and the root is called:', null, 'The crown meets the root at the cemento-enamel junction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Apical foramen', false, 1), ('B', 'Periodontal ligament', false, 2), ('C', 'Alveolar crest', false, 3), ('D', 'Cemento-enamel junction', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main function of the periodontal ligament is to:', null, 'The PDL anchors the tooth to the alveolar bone.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prevent caries', false, 1), ('B', 'Secrete dentin', false, 2), ('C', 'Anchor tooth to alveolar bone', true, 3), ('D', 'Supply blood to the pulp', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The preferred antibiotic for odontogenic infection is:', null, 'Amoxicillin is first choice for odontogenic infections.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Amoxicillin', true, 1), ('B', 'Metronidazole', false, 2), ('C', 'Ciprofloxacin', false, 3), ('D', 'Tetracycline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Taurodontism is best diagnosed by:', null, 'Taurodontism (enlarged pulp chamber) is seen on radiographs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pulp testing', false, 1), ('B', 'Tooth mobility test', false, 2), ('C', 'Radiograph', true, 3), ('D', 'Clinical examination', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following has the highest fluoride concentration?', null, 'Varnish (about 22,600 ppm) has the highest fluoride concentration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fluoride varnish', true, 1), ('B', 'Fluoride mouth rinse', false, 2), ('C', 'Fluoridated water', false, 3), ('D', 'Toothpaste', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is the most radiopaque dental material?', null, 'Amalgam is the most radiopaque.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zinc oxide eugenol', false, 1), ('B', 'Amalgam', true, 2), ('C', 'Gutta-percha', false, 3), ('D', 'Composite', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The leeway space in permanent dentition is:', null, 'Leeway space is greater in the mandible (about 1.7 mm per side vs 0.9 mm).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Equal in both arches', false, 1), ('B', 'Greater in maxilla', false, 2), ('C', 'Greater in mandible', true, 3), ('D', 'Not clinically relevant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which malocclusion is characterized by anterior crossbite and prognathic mandible?', null, 'Anterior crossbite with a prognathic mandible is Class III.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Class II div 2', false, 1), ('B', 'Class I', false, 2), ('C', 'Class II div 1', false, 3), ('D', 'Class III', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best method to diagnose a vertical root fracture is:', null, 'CBCT best shows vertical root fractures.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Percussion', false, 1), ('B', 'Cone beam CT', true, 2), ('C', 'Radiograph', false, 3), ('D', 'Thermal test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which fluoride compound is commonly used in community water fluoridation?', null, 'Of the options, sodium fluoride is used in water fluoridation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sodium fluoride', true, 1), ('B', 'Calcium fluoride', false, 2), ('C', 'Ammonium fluoride', false, 3), ('D', 'Tin fluoride', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common cause of gingival bleeding is:', null, 'Plaque-induced gingivitis is the commonest cause.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plaque-induced gingivitis', true, 1), ('B', 'Vitamin K deficiency', false, 2), ('C', 'Trauma', false, 3), ('D', 'Periodontitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most reliable indicator of past caries experience is:', null, 'DMFT records past caries experience.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Saliva test', false, 1), ('B', 'Fluoride intake', false, 2), ('C', 'Oral hygiene index', false, 3), ('D', 'DMFT score', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which tooth is most commonly impacted?', null, 'Mandibular third molars are most often impacted.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maxillary first premolar', false, 1), ('B', 'Mandibular second premolar', false, 2), ('C', 'Maxillary lateral incisor', false, 3), ('D', 'Mandibular third molar', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best time for oral health education is:', null, 'Education is best before disease occurs (prevention).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'At the time of treatment', false, 1), ('B', 'After treatment', false, 2), ('C', 'Before disease occurs', true, 3), ('D', 'When patient complains', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pain from a cracked tooth is usually:', null, 'Cracked tooth: sharp pain on biting/release.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Spontaneous', false, 1), ('B', 'Triggered only by cold', false, 2), ('C', 'Sharp on biting pressure', true, 3), ('D', 'Constant and dull', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What do you understand by "morsicatio buccarum"? State the aetiologies of morsicatio buccarum. Explain the consequences of such an untreated condition. (5 marks)', 'Morsicatio buccarum is chronic biting or chewing of the cheek mucosa, giving white, shaggy, frayed patches with small erosions along the occlusal plane. Aetiology: a habit linked to stress, anxiety or boredom; psychological disorders; malocclusion, sharp teeth, broken restorations or ill-fitting dentures. If untreated: repeated trauma causes ulcers, pain and secondary infection, hyperkeratosis that can be mistaken for leukoplakia (causing anxiety and unnecessary biopsy), and a persistent habit; management includes reassurance, removing sharp edges, a night guard and counselling.', null, '[{"point": "Definition: chronic cheek biting/chewing causing frayed, white, shaggy buccal mucosa along the occlusal line", "marks": 2}, {"point": "Aetiology: habit, stress/anxiety, malocclusion, sharp teeth/restorations, psychological conditions", "marks": 1.5}, {"point": "Consequences: ulceration, pain, infection, hyperkeratosis, possible confusion with leukoplakia, TMJ/psychological effects", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is removable orthodontics? List three common conditions that can be treated with removable orthodontics and the appliances used. (5 marks)', 'Removable orthodontics uses appliances that the patient can take out and put back, made of an acrylic baseplate with clasps (e.g. Adams) and active springs or bows, for simple tipping movements, habit breaking, retention and growth modification. Examples: anterior crossbite of a single incisor - upper removable appliance with a Z-spring (double cantilever) and posterior bite plane; spacing or a midline diastema - Hawley appliance with active labial bow/finger springs; thumb-sucking or tongue-thrust habit - habit-breaker (tongue crib); Class II skeletal pattern in a growing child - functional appliance such as a twin block; and retention after treatment - Hawley retainer.', null, '[{"point": "Definition: appliances the patient can insert and remove, applying light forces for simple tooth movements/growth modification", "marks": 2}, {"point": "Three conditions with appliances (e.g. anterior crossbite - Hawley with Z-spring; spacing/diastema - Hawley with labial bow; habits - habit breaker/crib; space maintenance; Class II growth - functional appliance (twin block))", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A patient with persistent oozing from an infected mandibular first molar presents with a draining sinus on the cheek. What would be your differential diagnosis and how will you approach its management? (5 marks)', 'Most likely a cutaneous sinus tract of odontogenic origin from a chronic apical abscess of the necrotic first molar. Differentials: osteomyelitis of the mandible, infected odontogenic cyst, actinomycosis, tuberculosis, and primary skin lesions (furuncle, infected epidermoid cyst, basal cell carcinoma). Approach: history and examination, pulp vitality testing, periapical radiograph/OPG and tracing the sinus with a gutta-percha point to locate the source. Treat the cause: root canal treatment if restorable, otherwise extraction with curettage; antibiotics only if spreading infection or systemic signs; the skin sinus usually heals within weeks once the source is removed, scar revision if needed. Avoid treating with antibiotics alone or excising the skin lesion only.', null, '[{"point": "Differential: cutaneous odontogenic sinus tract from chronic periapical abscess; also osteomyelitis, infected cyst, actinomycosis, skin lesions (furuncle, BCC), TB", "marks": 2}, {"point": "Investigations: vitality test, periapical radiograph/OPG, gutta-percha sinus tracing", "marks": 1.5}, {"point": "Management: remove source - root canal treatment or extraction; antibiotics if systemic signs; sinus heals; scar revision if needed", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is a "dentifrice"? Have you heard of "fluoride"? If yes, does it have any role in caries prevention, and how? What are the different forms of fluoride available in the world and in Bhutan? (5 marks)', 'A dentifrice is a substance (paste, gel or powder) used with a toothbrush to clean the teeth and deliver agents such as fluoride. Fluoride prevents caries by forming more acid-resistant fluorapatite, promoting remineralisation of early lesions and reducing demineralisation, and inhibiting bacterial enzymes and acid production. Forms worldwide: fluoridated toothpaste (1000-1500 ppm), water, salt and milk fluoridation, fluoride tablets and drops, mouth rinses, gels/foams, varnish (22,600 ppm) and silver diamine fluoride. In Bhutan the main sources are fluoridated toothpaste and professionally applied fluoride varnish (e.g. in school oral health programmes); community water fluoridation is not used.', null, '[{"point": "Dentifrice: paste/powder/gel used with a toothbrush to clean teeth", "marks": 1}, {"point": "Fluoride role: fluorapatite formation, enhances remineralisation, inhibits demineralisation and bacterial enzymes", "marks": 2}, {"point": "Forms: fluoridated toothpaste, varnish, gels, mouth rinses, water/salt/milk fluoridation, tablets/drops, SDF; in Bhutan mainly toothpaste, varnish in school programmes", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

1. Name some common vesiculo-bullous lesions/diseases (autoimmune, inflammatory and infectious). (5 marks)', 'Autoimmune: pemphigus vulgaris, bullous and mucous membrane pemphigoid, linear IgA disease, epidermolysis bullosa acquisita, paraneoplastic pemphigus. Inflammatory/hypersensitivity: erythema multiforme, Stevens-Johnson syndrome/TEN, bullous lichen planus, drug eruptions. Infectious: primary herpetic gingivostomatitis and recurrent herpes, varicella and herpes zoster, hand-foot-and-mouth disease, herpangina, bullous impetigo.', null, '[{"point": "Autoimmune: pemphigus vulgaris, mucous membrane/bullous pemphigoid, linear IgA disease, epidermolysis bullosa acquisita", "marks": 2}, {"point": "Inflammatory/immune: erythema multiforme, SJS/TEN, lichen planus (bullous)", "marks": 1.5}, {"point": "Infectious: herpes simplex, varicella-zoster, hand-foot-mouth disease, herpangina, bullous impetigo", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 1, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

2. Give your differential diagnosis with justifications in this patient. (5 marks)', '1. Pemphigus vulgaris - most likely: oral and skin blisters that rupture quickly leaving erosions, involvement of trunk, thighs and genitalia, progressive course; previous long-term steroids/methotrexate may have suppressed it and stopping them may have unmasked it. 2. Bullous pemphigoid - common in the elderly, but skin blisters are tense and oral involvement is less common. 3. Mucous membrane pemphigoid - mucosal predominance, but genital and skin spread less typical. 4. Erythema multiforme/SJS - sudden onset, but needs a trigger (drug, infection) and target lesions. 5. Viral (disseminated herpes/zoster) in an older diabetic patient. 6. Paraneoplastic pemphigus - exclude malignancy given his fear of cancer.', null, '[{"point": "Pemphigus vulgaris most likely: elderly, oral lesions first, flaccid blisters rupture to erosions, skin involvement, previous immunosuppression masked disease", "marks": 2.5}, {"point": "Others: bullous pemphigoid (elderly, tense skin blisters), mucous membrane pemphigoid, erythema multiforme/SJS (drug), herpes zoster/HSV (immune-compromised), paraneoplastic pemphigus", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 2, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

3. Give a detailed history relevant to this patient. (5 marks)', 'Presenting complaint: when and where lesions started, whether mouth or skin first, blisters intact or bursting, pain, burning, bleeding, difficulty eating and swallowing, eye, nose or genital symptoms, fever, weight loss. Past medical history: control of diabetes and hypertension, rheumatoid arthritis, what condition the prednisolone and methotrexate were prescribed for (possibly earlier bullous disease), why and how they were stopped, any recent new drugs (e.g. ACE inhibitors, penicillamine, NSAIDs, antibiotics), infections or vaccinations, symptoms of malignancy. Drug allergies, family history of autoimmune disease, social history (smoking, alcohol, doma), diet and nutrition, and the patient''s anxiety about cancer.', null, '[{"point": "Presenting complaint: onset, sites, sequence, pain, eating difficulty, weight loss, fever", "marks": 1.5}, {"point": "Medical history: diabetes and BP control, RA, previous diagnosis for which steroids/methotrexate given, why stopped, any new drugs (ACE inhibitors, penicillamine), infections", "marks": 2}, {"point": "Family, social (smoking, alcohol, diet), allergy, malignancy symptoms, psychological impact", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 3, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

4. What investigations will you do for this patient? Give justifications for your investigations. (10 marks)', '1. Incisional biopsy of the edge of a fresh lesion for histopathology - shows suprabasal (intraepithelial) split with acantholysis in pemphigus, subepithelial split in pemphigoid. 2. Perilesional biopsy in Michel''s medium for direct immunofluorescence - the gold standard to confirm the type. 3. Serum indirect immunofluorescence and ELISA for anti-desmoglein 3/1 (pemphigus) or BP180/230 (pemphigoid) antibodies - confirm diagnosis and monitor activity. 4. Tzanck smear for acantholytic cells; viral swab/PCR to exclude herpes infection. 5. Baseline tests before steroid/immunosuppressive therapy: complete blood count, fasting glucose and HbA1c (diabetic), renal and liver function, electrolytes, blood pressure, chest X-ray and TB screening, hepatitis B status, bone density if feasible. 6. Screening for malignancy if paraneoplastic pemphigus is suspected.', null, '[{"point": "Incisional biopsy of perilesional tissue for histopathology (acantholysis, intraepithelial split vs subepithelial)", "marks": 3}, {"point": "Perilesional biopsy for direct immunofluorescence; serum for indirect IF/ELISA (desmoglein 1 and 3, BP180/230)", "marks": 3}, {"point": "Tzanck smear (acantholytic cells); viral PCR/culture to exclude herpes", "marks": 2}, {"point": "Baseline bloods before steroids: CBC, blood glucose/HbA1c, renal and liver function, electrolytes, BP; chest X-ray/TB screen, bone density", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 4, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

5. What is Nikolsky''s sign? How do you do it? What is the gold standard investigation to establish the proper diagnosis in such a case? Have you heard of immunofluorescence studies - what can you see? How is direct immunofluorescence (DIF) done? (10 marks)', 'Nikolsky''s sign: firm lateral (sliding) pressure with a finger or blunt instrument on apparently normal skin or mucosa near a lesion causes the epithelium to slide off or a new blister to form - positive in pemphigus vulgaris (also SJS/TEN), showing loss of cell adhesion. Gold standard: perilesional biopsy for direct immunofluorescence together with routine histopathology. Immunofluorescence shows where antibodies are deposited: in pemphigus, IgG and C3 between epidermal cells in a ''fishnet/chicken-wire'' pattern; in pemphigoid, a linear band along the basement membrane zone. DIF technique: take a biopsy of clinically normal-looking perilesional mucosa, transport fresh/frozen or in Michel''s medium (not formalin), cut cryostat sections, incubate with fluorescein-labelled anti-human IgG, IgA, IgM and C3, and examine under a fluorescence microscope. (Indirect IF uses the patient''s serum on a substrate to detect circulating antibodies.)', null, '[{"point": "Nikolsky''s sign: lateral pressure on normal-looking mucosa/skin causes separation of epithelium (positive in pemphigus)", "marks": 2}, {"point": "How: firm sliding pressure with finger/blunt instrument near a lesion", "marks": 1}, {"point": "Gold standard: perilesional biopsy with DIF (plus histopathology)", "marks": 2}, {"point": "IF findings: pemphigus - intercellular IgG/C3 ''chicken-wire/fishnet''; pemphigoid - linear band at basement membrane", "marks": 2.5}, {"point": "DIF method: perilesional biopsy in Michel''s medium, frozen sections, fluorescein-labelled anti-human IgG/IgA/IgM/C3, fluorescence microscopy", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 5, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

6. Enlist your management protocol in this patient. (10 marks)', '1. Reassure the patient that this appears to be a treatable autoimmune blistering disease, not cancer, and refer to/co-manage with a dermatologist and physician. 2. Confirm the diagnosis (biopsy, DIF, serology) and obtain baseline investigations. 3. Systemic treatment: corticosteroids (e.g. prednisolone) with a steroid-sparing agent (azathioprine, mycophenolate) or rituximab, as advised by the specialist. 4. Oral care: topical steroids (clobetasol/triamcinolone in adhesive base), benzydamine or lignocaine viscous rinses for pain, chlorhexidine mouthwash, antifungal prophylaxis, soft bland diet, fluids and nutrition, gentle oral hygiene. 5. Skin care, infection control and pain relief. 6. Tight control of diabetes and blood pressure; monitor for steroid side effects (hyperglycaemia, hypertension, infection, osteoporosis - calcium, vitamin D, gastric protection). 7. Regular follow-up, slow tapering and education about relapse.', null, '[{"point": "Reassure (not cancer), explain; refer/co-manage with dermatologist/physician", "marks": 2}, {"point": "Systemic therapy after confirmation: corticosteroids with steroid-sparing agents (azathioprine, mycophenolate) or rituximab", "marks": 3}, {"point": "Local oral care: topical steroids, analgesic/anaesthetic rinses, chlorhexidine, antifungal, soft diet, hydration, nutrition", "marks": 3}, {"point": "Control diabetes/BP during steroids, monitor side effects (glucose, BP, infection, bone), regular follow-up and tapering", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 6, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
A 70-year-old man comes to your clinic with blistering mouth and skin lesions that started suddenly 10 days ago and increased progressively over time. He states that it started as blisters and vesicles in the mouth and on the skin of the trunk, thighs and genitalia. No intact blisters were found in the oral cavity as they had already ruptured, leaving only ulcerations. He thinks that he has oral cancer and will not be able to live a normal life again. He gives a history of hypertension, type 2 diabetes mellitus and rheumatoid arthritis and has taken medicines like systemic steroid (prednisolone) and methotrexate for many years. He stopped all the medicines 2 years ago (not on any medication now). Answer the questions based on this complaint (complaint-based treatment).

7. Will you manage this patient with corticosteroids? If so, what type of steroids will you use? Mention your treatment plan. (5 marks)', 'Yes - corticosteroids are the first-line treatment of pemphigus, but used cautiously because he is elderly, diabetic and hypertensive, under physician/dermatologist supervision. Plan: systemic prednisolone about 0.5-1 mg/kg/day taken in the morning (possibly with an early steroid-sparing agent such as azathioprine or mycophenolate, or rituximab) until no new blisters form for about 2 weeks, then taper slowly over months; topical potent steroids (e.g. clobetasol 0.05% in orabase) for oral lesions. Monitor blood glucose (adjust diabetic drugs/insulin), blood pressure, weight, infection and bone health; give calcium, vitamin D and gastric protection; never stop steroids abruptly.', null, '[{"point": "Yes - corticosteroids are first-line, but with caution because of diabetes and hypertension", "marks": 1.5}, {"point": "Systemic prednisolone (about 0.5-1 mg/kg/day) in the morning with steroid-sparing agent; topical potent steroids for oral lesions", "marks": 2}, {"point": "Plan: induction until no new lesions, then gradual taper; monitor glucose, BP, infection; gastric and bone protection; specialist supervision", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case1', 7, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

1. What is this condition commonly called? (2 marks)', 'Vasovagal syncope - a simple faint, the commonest medical emergency in the dental chair (anxiety, pain, fasting).', null, '[{"point": "Vasovagal syncope (simple faint)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 1, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

2. What is the percentage of lignocaine used for dental local anaesthesia, and what is the maximum dose you can administer to your patient? (2 marks)', 'Dental lignocaine is 2% (20 mg/ml; a 2.2 ml cartridge contains 44 mg). Maximum dose: with adrenaline about 7 mg/kg up to 500 mg (often quoted 4.4 mg/kg up to 300 mg for plain lignocaine) - e.g. about 350 mg for a 50 kg adult.', null, '[{"point": "2% lignocaine (20 mg/ml)", "marks": 1}, {"point": "Max with adrenaline about 7 mg/kg (≤ 500 mg); plain about 4.4 mg/kg (≤ 300 mg)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 2, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

3. What is the ratio of adrenaline to lignocaine commonly used in dental local anaesthesia? (2 marks)', '2% lignocaine with adrenaline 1:80,000 (12.5 µg/ml) is commonly used; 1:100,000 and 1:200,000 are also available.', null, '[{"point": "Adrenaline 1:80,000 (or 1:100,000/1:200,000) with 2% lignocaine", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 3, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

4. What do you understand by "exodontia"? Explain. (2 marks)', 'Exodontia is the branch of oral surgery concerned with the extraction (removal) of teeth - the painless removal of a whole tooth or root with minimal trauma to surrounding tissues, by simple (forceps) or surgical methods, with proper indications, technique and aftercare.', null, '[{"point": "Exodontia: the art and science of removing teeth painlessly with minimal trauma; branch of oral surgery; includes simple and surgical extraction", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 4, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

5. Was the history taking complete? If not, what else should have been taken additionally? (2 marks)', 'No - only dental history was taken. A full medical history was needed: cardiovascular and respiratory disease, epilepsy, diabetes, bleeding disorders, current medicines and allergies (including to local anaesthetics), pregnancy and last menstrual period, previous fainting or reactions to dental treatment, anxiety level, and whether she had eaten - plus baseline vital signs.', null, '[{"point": "No - full medical history was needed: cardiac/respiratory disease, epilepsy, diabetes, bleeding disorders, drugs, allergies (to LA), pregnancy/LMP, previous fainting/anxiety, last meal", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 5, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

6. How do you manage the above case of fainting? (5 marks)', 'Stop the procedure and remove instruments from the mouth; lay her flat with legs raised (supine/Trendelenburg) to improve blood flow to the brain; loosen tight clothing; open and maintain the airway; give oxygen; monitor pulse, breathing and blood pressure. Recovery is usually within 1-2 minutes; then reassure, give a sweet drink once fully conscious, and postpone or continue treatment only when she is well and less anxious. If she does not recover quickly, consider other causes (hypoglycaemia, anaphylaxis, LA toxicity, cardiac event), call emergency help and start BLS/CPR if there is no pulse or breathing; record the event.', null, '[{"point": "Stop procedure, call for help, place supine with legs raised (Trendelenburg)", "marks": 2}, {"point": "Loosen tight clothing, maintain airway, oxygen, monitor pulse/BP/breathing", "marks": 1.5}, {"point": "Recovery: reassure, sugary drink if conscious; if no quick recovery - consider other causes, BLS/CPR, emergency referral", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 6, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

7. What sort of complications do you need to rule out in this patient immediately? (5 marks)', 'Rule out: anaphylaxis/allergic reaction to the anaesthetic (rash, wheeze, hypotension); local anaesthetic toxicity or accidental intravascular injection (tingling, confusion, seizures, arrhythmia) and adrenaline reaction (palpitations, hypertension); hypoglycaemia (if fasting); epileptic seizure; cardiac events (arrhythmia, angina/MI, cardiac arrest); hyperventilation syndrome; airway obstruction or aspiration; pregnancy-related hypotension. Check pulse, blood pressure, breathing, oxygen saturation and blood glucose.', null, '[{"point": "Anaphylaxis/allergic reaction to LA", "marks": 1}, {"point": "LA toxicity/intravascular injection (CNS excitation, seizures, arrhythmia) and adrenaline reaction", "marks": 1}, {"point": "Hypoglycaemia, seizure/epilepsy", "marks": 1}, {"point": "Cardiac events (arrhythmia, MI, cardiac arrest), hyperventilation, airway obstruction/aspiration", "marks": 1}, {"point": "Pregnancy-related causes; check vitals to differentiate", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 7, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

8. What are the complications of extraction? Mention all the complications that can occur (i) pre-operatively, (ii) during the operation and (iii) post-operatively. (15 marks)', '(i) Pre-operative: vasovagal syncope and other medical emergencies; local anaesthetic complications - toxicity, allergy, needle breakage, haematoma, trismus, transient facial nerve palsy; wrong patient or wrong tooth.
(ii) During operation: fracture of the crown or root, alveolar bone, maxillary tuberosity or (rarely) mandible; damage to adjacent teeth or restorations; soft-tissue lacerations; displacement of roots into the maxillary sinus or tissue spaces; oro-antral communication; haemorrhage; injury to the inferior alveolar or lingual nerve; dislocation of the TMJ; swallowing or aspiration of tooth/instruments.
(iii) Post-operative: pain, swelling and bruising; reactionary or secondary haemorrhage; dry socket (alveolar osteitis); infection and abscess; trismus; paraesthesia; oro-antral fistula and sinusitis; osteomyelitis; osteoradionecrosis or medication-related osteonecrosis in at-risk patients.', null, '[{"point": "(i) Pre-operative: syncope, LA complications (toxicity, allergy, needle breakage, haematoma, trismus, facial nerve palsy), medical emergencies, wrong tooth/patient", "marks": 5}, {"point": "(ii) Intra-operative: fracture of tooth/root/alveolar bone/tuberosity/mandible, damage to adjacent teeth, soft tissue injury, oro-antral communication, root displacement, haemorrhage, nerve injury, TMJ dislocation, swallowing/aspiration", "marks": 5}, {"point": "(iii) Post-operative: pain, swelling, bleeding, dry socket, infection, trismus, paraesthesia, sinus problems, osteomyelitis, osteonecrosis", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 8, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

9. How do you manage a post-extraction bleeding case that comes to you about one to two hours after extraction? What prophylaxis would you give if your patient has a mitral valve prosthesis? (5 marks)', 'Reassure the patient, check vitals and history (anticoagulants, bleeding disorders, liver disease). Clean the mouth and remove the loose clot to locate the bleeding; apply firm pressure with damp gauze for 10-20 minutes. If bleeding continues: inject LA with adrenaline, place a haemostatic agent (oxidised cellulose, gelatin sponge) and suture the socket; tranexamic acid mouthwash or soaked gauze; give post-op instructions. Refer for blood tests (INR, CBC) if persistent. For a patient with a prosthetic mitral valve (high risk of infective endocarditis): antibiotic prophylaxis before the extraction - amoxicillin 2 g orally 30-60 minutes before (clindamycin/azithromycin if allergic), and check the INR on the day if on warfarin (do not stop it without the physician; extraction is usually done if INR is within the safe range).', null, '[{"point": "Assess (history, vitals, anticoagulants), clean clot, local pressure with gauze for 10-20 min", "marks": 2}, {"point": "Local measures: LA with adrenaline, haemostatic agents (oxidised cellulose/gelatin sponge, tranexamic acid), suturing; investigations/referral if persistent", "marks": 1.5}, {"point": "Prosthetic valve: antibiotic prophylaxis against infective endocarditis - amoxicillin 2 g orally 30-60 min before (clindamycin if allergic); check INR on warfarin", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 9, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

10. Classify the different types of third molar impactions (with diagrams if required). State the mechanism of action of local anaesthesia. (5 marks)', 'Classification of mandibular third molar impaction: Winter''s (angulation) - mesioangular (commonest), vertical, horizontal, distoangular, plus buccoangular, linguoangular and inverted; Pell and Gregory - relation to the ramus (Class I, II, III, by space available) and depth relative to the occlusal plane (Position A, B, C); also by soft-tissue or bony impaction. Mechanism of local anaesthesia: the un-ionised (lipid-soluble) form crosses the nerve membrane, becomes ionised inside and blocks voltage-gated sodium channels, preventing sodium influx and depolarisation, so nerve impulses are not conducted and pain is not felt.', null, '[{"point": "Winter''s classification by angulation: mesioangular, distoangular, vertical, horizontal (also buccal/lingual, inverted)", "marks": 1.5}, {"point": "Pell and Gregory: ramus relationship Class I, II, III; depth Position A, B, C", "marks": 1.5}, {"point": "LA mechanism: blocks voltage-gated Na⁺ channels, preventing depolarisation and nerve impulse conduction (un-ionised form crosses membrane)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 10, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A young woman came to your clinic for a wisdom tooth extraction. After taking her dental history, you examined her and advised extraction as the tooth might give her repeated problems later on. She agreed. A little over 5 minutes after giving her the required lignocaine local anaesthetic block, she became unresponsive and fainted in the dental chair.

11. What is alveolar osteitis? Is it manageable in our set-up? Explain how you manage a case of post-extraction dry socket. (5 marks)', 'Alveolar osteitis (dry socket) is breakdown or loss of the blood clot (fibrinolysis), leaving exposed bone in the socket, with severe radiating pain 2-4 days after extraction and bad taste/odour; it is commoner after lower molar extraction, in smokers and women on oral contraceptives. Yes, it is easily managed in our clinics: give LA if needed, irrigate gently with warm saline or chlorhexidine, remove debris without curetting the bone, place a medicated obtundent dressing (e.g. Alvogyl or zinc oxide-eugenol on iodoform gauze), prescribe analgesics, advise warm saline rinses and no smoking, and review every 2-3 days changing the dressing until pain settles; antibiotics only if there are signs of infection.', null, '[{"point": "Alveolar osteitis: dry socket - breakdown/loss of clot, exposed bone, severe pain 2-4 days after extraction, bad smell", "marks": 2}, {"point": "Yes, manageable in any dental clinic", "marks": 1}, {"point": "Management: irrigate with warm saline/chlorhexidine, gentle debridement, medicated dressing (e.g. Alvogyl/ZOE), analgesics, review every 2-3 days; antibiotics only if infection; prevention", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Dental Surgery", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-dental2025-case2', 11, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The number of teeth in the complete primary dentition is', null, '20 primary (deciduous) teeth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'dental-surgery'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Dental Surgery): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'dental-surgery'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '32', false, 1), ('B', '20', true, 2), ('C', '24', false, 3), ('D', '16', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
