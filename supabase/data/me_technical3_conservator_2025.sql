-- ME Paper III (Technical, Conservator): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'conservator', 'Conservator' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'conservator') is null then raise exception 'unknown specialisation conservator'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'conservator');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'conservator'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Conservator');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'conservator'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Conservator');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'conservator'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Conservator');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a function of a museum?', null, 'Tax collection is not a museum function.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Exhibition', false, 1), ('B', 'Education', false, 2), ('C', 'Tax collection', true, 3), ('D', 'Conservation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Bhutan, the primary purpose of heritage conservation is to:', null, 'Conservation in Bhutan preserves cultural identity and spiritual values.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Modernize all historical structures', false, 1), ('B', 'Boost tourism revenue only', false, 2), ('C', 'Preserve cultural identity and spiritual values', true, 3), ('D', 'Replace outdated buildings', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an intangible cultural heritage?', null, 'Mask dance (cham) is intangible heritage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mask dance', true, 1), ('B', 'Bronze statue', false, 2), ('C', 'Religious manuscript', false, 3), ('D', 'Stone pillar', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best defines a museologist?', null, 'A museologist specialises in museum theory and practice.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A researcher of ancient texts', false, 1), ('B', 'A conservation architect', false, 2), ('C', 'A person who builds museums', false, 3), ('D', 'A specialist in museum theory and practice', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary goal of preventive conservation?', null, 'Preventive conservation minimises deterioration before damage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Restoring damaged artifacts', false, 1), ('B', 'Reproducing lost artifacts', false, 2), ('C', 'Minimizing deterioration before damage occurs', true, 3), ('D', 'Displaying only newly acquired objects', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Accessioning an object means:', null, 'Accessioning formally enters an object into the collection with a unique number.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Selling the object', false, 1), ('B', 'Entering it into the museum''s collection with a unique ID', true, 2), ('C', 'Creating replicas for education', false, 3), ('D', 'Disposing of duplicate objects', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an appropriate material for archival storage?', null, 'Acid-free tissue is archival quality.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Colored cardboard', false, 1), ('B', 'Acid-free tissue paper', true, 2), ('C', 'Plastic bags', false, 3), ('D', 'Newspaper', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does an exhibition label typically contain?', null, 'Labels give title, date, material and brief context.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Price of the object', false, 1), ('B', 'Full research article on the object', false, 2), ('C', 'Artist’s personal history only', false, 3), ('D', 'Object title, date, material, and brief context', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following systems is used for digital documentation of collections?', null, 'A Collections Management System documents collections digitally.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Photoshop', false, 1), ('B', 'Excel only', false, 2), ('C', 'Collections Management System (CMS)', true, 3), ('D', 'Microsoft Word', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term “deaccession” in museums refers to:', null, 'Deaccession is formal removal from the collection.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Removal of an object from the collection', true, 1), ('B', 'Temporary loans for exhibition', false, 2), ('C', 'Purchasing a new artifact', false, 3), ('D', 'Importing items from abroad', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which international organization provides guidelines for museum ethics and professional standards?', null, 'ICOM sets the Code of Ethics for Museums.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ICOM (International Council of Museums).', true, 1), ('B', 'UNESCO (United Nations Educational, Scientific, and Cultural Organization).', false, 2), ('C', 'ICCROM (International Center for the Study of Preservation and Restoration of Cultural Property).', false, 3), ('D', 'UNDP (United Nations Development Programme).', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best describes the use of UV fluorescence in the conservation of heritage objects?', null, 'UV fluorescence reveals biological growth, retouching and varnish.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To clean delicate surfaces without physical contact.', false, 1), ('B', 'To detect biological growths, overpainting, or varnish layers not visible to the naked eye.', true, 2), ('C', 'To assess the weight and density of organic artifacts.', false, 3), ('D', 'To measure temperature fluctuations in storage rooms', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following environments is ideal for storing organic materials like textiles and paper?', null, 'Stable moderate RH (45-55%) and about 20 °C suit organic materials.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dry with temperature above 35°C', false, 1), ('B', 'Uncontrolled outdoor environment.', false, 2), ('C', 'High humidity and warm temperature', false, 3), ('D', 'Moderate relative humidity (45–55%) and stable temperature (~20°C)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term "intangible cultural heritage" includes:', null, 'Songs, dances and rituals are intangible heritage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Manuscripts', false, 1), ('B', 'Historic buildings', false, 2), ('C', 'Songs, dances, and rituals', true, 3), ('D', 'Weaponry', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does “provenance” refer to in museum practice?', null, 'Provenance is the history of ownership and origin.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The display method', false, 1), ('B', 'The material used', false, 2), ('C', 'The artistic style of an object', false, 3), ('D', 'The history of ownership and origin of an object', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Relative humidity (RH) is important because:', null, 'RH fluctuations cause swelling, shrinking, cracking and corrosion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Higher RH helps preserve all materials.', false, 1), ('B', 'It determines ticket pricing', false, 2), ('C', 'Fluctuations can cause physical stress and damage to organic and inorganic materials', true, 3), ('D', 'It affects how clean a museum looks', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the best cleaning method for dusty textile surfaces?', null, 'Low-suction vacuuming through a screen is safest for textiles.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gently vacuuming through a protective screen', true, 1), ('B', 'Rubbing with alcohol', false, 2), ('C', 'Rinsing with water', false, 3), ('D', 'Using a wire brush.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An object infested by insects should first be:', null, 'Isolate infested objects, then assess and treat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Displayed immediately', false, 1), ('B', 'Sent abroad', false, 2), ('C', 'Washed with detergent', false, 3), ('D', 'Isolated and assessed for pest control treatment', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of a condition report?', null, 'A condition report records an object''s physical state before and after handling or loans.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To record the display position of objects', false, 1), ('B', 'To list visitor feedback', false, 2), ('C', 'To document the physical state of an object before and after handling or loan.', true, 3), ('D', 'To check employee performance', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following light sources is least harmful to sensitive materials?', null, 'UV-filtered LED is least harmful.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'LED lighting with UV filters', true, 1), ('B', 'Halogen lamp', false, 2), ('C', 'Incandescent spotlight', false, 3), ('D', 'Natural daylight', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the event of a mold outbreak, the first step is to:', null, 'Isolate mouldy objects in a dry, ventilated space and lower RH.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Close the room and increase temperature.', false, 1), ('B', 'Remove affected objects to a dry, ventilated space and reduce RH', true, 2), ('C', 'Vacuum all objects', false, 3), ('D', 'Repaint the room.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Preventive conservation involves:', null, 'Preventive conservation: environment, storage, pest control.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Environmental monitoring, storage, and pest control', true, 1), ('B', 'Increasing footfall in galleries', false, 2), ('C', 'Repairing broken statues', false, 3), ('D', 'Redesigning labels', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most suitable gloves for handling metal artifacts are:', null, 'Nitrile, powder-free gloves - cotton can snag and lets moisture through to metal.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nitrile or powder-free gloves', true, 1), ('B', 'Woolen gloves', false, 2), ('C', 'Rubber gloves', false, 3), ('D', 'Cotton gloves', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Tarnishing of silver is caused primarily by:', null, 'Silver tarnishes from sulphur compounds (H₂S).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oxygen', false, 1), ('B', 'Sulphur compounds in the air', true, 2), ('C', 'Water exposure', false, 3), ('D', 'Dust', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ideal way to store a thangka is:', null, 'Roll thangkas loosely with acid-free tissue on an archival tube, dark and stable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rolled tightly and tied with string', false, 1), ('B', 'Rolled with acid-free tissue on an archival tube in a dark, stable environment', true, 2), ('C', 'Hung in direct light', false, 3), ('D', 'Folded into a box', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an ethical principle in conservation?', null, 'Minimum intervention and reversibility are core ethics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Use of synthetic paints to modernize artwork', false, 1), ('B', 'Repainting ancient murals for clarity', false, 2), ('C', 'Changing the object''s appearance to suit exhibition', false, 3), ('D', 'Minimum intervention and full reversibility of treatment', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A good educational program in a museum:', null, 'Good programmes engage all ages and learning levels.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Replaces exhibitions', false, 1), ('B', 'Engages all age groups and learning levels', true, 2), ('C', 'Uses only lectures', false, 3), ('D', 'Focuses only on students', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A museum’s code of ethics ensures that:', null, 'A code of ethics upholds professional conduct, public trust and stewardship.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Professional behavior upholds public trust and stewardship', true, 1), ('B', 'Staff follow office dress code', false, 2), ('C', 'Operations are profit-oriented', false, 3), ('D', 'Loans are made freely without agreements.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a non-invasive method of conservation?', null, 'Controlling temperature and humidity is non-invasive.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Repainting missing areas', false, 1), ('B', 'Applying varnish', false, 2), ('C', 'Using adhesive on artifacts', false, 3), ('D', 'Regulating temperature and humidity', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During an emergency like a flood or fire, the first step in collections response is to:', null, 'People''s safety first: evacuate, then assess.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Turn on heating systems', false, 1), ('B', 'Evacuate staff and assess the situation', true, 2), ('C', 'Relabel objects', false, 3), ('D', 'Call the press', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Identify and briefly explain three core functions of a museum. (1 mark)', 'a) Collecting and documenting objects of significance; preserving and conserving them for future generations; researching, exhibiting and interpreting them to educate and inspire the public.', null, '[{"point": "Collect/acquire, preserve/conserve, research, exhibit/educate (any three)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s1', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Explain how museums in Bhutan can actively contribute to community engagement and public education. Include one or two specific examples. (2 marks)', 'b) By holding school visits and curriculum-linked programmes, workshops with weavers and artisans, special exhibitions during national days and tshechus, travelling or digital exhibitions to rural areas, and involving communities in collecting oral histories. Example: the Folk Heritage Museum''s demonstrations of traditional rural life and crafts; the Textile Museum''s weaving demonstrations and programmes for students.', null, '[{"point": "Community engagement and education with examples (school programmes, festivals, workshops with artisans, travelling exhibitions, digital outreach)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s1', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'c) Name two museums of Bhutan and their thematic focus. (2 marks)', 'c) National Museum of Bhutan (Ta Dzong, Paro) - Bhutanese art, history, religion and natural history; Royal Heritage Museum (Ta Dzong, Trongsa) - history of the Wangchuck dynasty and the Trongsa Penlop; also the Royal Textile Academy/Textile Museum (Thimphu) - textiles and weaving, and the Folk Heritage Museum (Thimphu) - traditional rural life.', null, '[{"point": "Two museums with focus (e.g. National Museum Paro - art/history; Royal Heritage Museum Trongsa - monarchy; Textile Museum Thimphu - textiles; Folk Heritage Museum - rural life)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s1', 3, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Define the difference between tangible and intangible cultural heritage. Support your explanation with one relevant example of each from Bhutan. (2 marks)', 'a) Tangible heritage is physical - objects, buildings and sites (e.g. Punakha Dzong, thangkas, textiles); intangible heritage is living practice, knowledge and expression passed between generations (e.g. mask dances (cham) at tshechus, zhungdra and boedra songs, driglam namzha, traditional crafts knowledge).', null, '[{"point": "Tangible: physical objects/places (dzongs, thangkas); intangible: practices, knowledge, expressions (cham dances, zhungdra, driglam namzha)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s2', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) What is a Collections Management System in the context of museum operations? Explain its role and significance in the preservation, documentation and accessibility of museum collections. (3 marks)', 'b) A Collections Management System is a database (software) holding the complete record of every object: accession number, description, images, provenance, location, condition and conservation history, loans and exhibitions. It supports preservation (condition and treatment history, monitoring), documentation and accountability (knowing what the museum holds and where), security and insurance, research and planning, and accessibility - staff, researchers and the public can search and view collections online.', null, '[{"point": "CMS: database/software for records of all objects; roles: accession, location tracking, condition and conservation history, loans, images, search/online access, security", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s2', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Write a brief press release announcing the opening of a new gallery at the Royal Heritage Museum, Trongsa. The release should highlight the gallery''s theme, the significance of the launch, and its expected impact on cultural preservation and public engagement. (3 marks)', 'a) FOR IMMEDIATE RELEASE - Trongsa, [date]. Royal Heritage Museum opens new gallery on ''The Path to Unity''. The Royal Heritage Museum, Trongsa, will open a new gallery tracing the role of the Trongsa Penlops and the founding of the Wangchuck dynasty. Featuring historic objects, documents and textiles, the gallery celebrates the heritage that shaped modern Bhutan. It will strengthen cultural preservation through improved care and display of royal collections and offer school programmes and guided tours for visitors. Opening on [date] at [time]; open to the public daily. Contact: [name, phone, email].', null, '[{"point": "Press release format (headline, date/place, theme, significance, impact, opening details, contact)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s3', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Draft a concise exhibition label (40-50 words) for a 19th-century handwoven Kishuthara kira. Your label should include the object''s title, period, region of origin, material and cultural significance. (2 marks)', 'b) Kishuthara Kira. Late 19th century, Kurtoe, Lhuentse Dzongkhag. Handwoven silk supplementary-weft patterns on a cotton/silk ground. Kishuthara, with its intricate, colourful motifs, is among Bhutan''s most prestigious textiles, worn by women on festive and formal occasions and reflecting the mastery of Kurtoe weavers. (about 45 words)', null, '[{"point": "Label 40-50 words with title, period, region (Kurtoe/Lhuentse), material (silk/cotton), significance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s3', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Identify and briefly describe three key preventive conservation measures used to safeguard museum collections, and explain how each contributes to long-term preservation. (3 marks)', 'a) 1. Environmental control - keeping relative humidity (45-55%), temperature and light (low lux, UV-filtered) stable slows chemical and physical decay. 2. Integrated pest management - monitoring with sticky traps, good housekeeping and quarantine of new objects prevents insect and rodent damage. 3. Proper storage, handling and security - acid-free materials, supports, gloves and trained staff, plus disaster plans, reduce physical damage and loss.', null, '[{"point": "Three measures with contribution: environmental control (RH/temperature/light), integrated pest management, proper storage/handling/security/disaster preparedness", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s4', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) A visitor accidentally knocks over and damages an object on display. Outline the immediate actions a museum professional should take, including object handling, documentation and communication procedures. (2 marks)', 'b) Secure the area and check the visitor is unhurt; stop people touching the object; do not try to repair it; carefully collect all fragments in labelled containers; photograph the scene and object; complete an incident and condition report; inform the conservator, curator and management (and insurer if relevant); move the object to the conservation lab; review the display and barriers to prevent recurrence.', null, '[{"point": "Secure area, ensure visitor safety, do not attempt repair, collect all fragments, photograph, condition/incident report, inform conservator/management, insurer, review display", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-s4', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations.

1. Describe the key steps you would take to document and assess the condition of the mural, including any tools or techniques you would use. (10 marks)', 'Seek permission and consult the lam and community, and research the lhakhang''s history and any past repairs. Document the mural: overall and detailed photography with a scale and colour chart, raking-light photography to show flaking and relief, UV fluorescence to reveal overpaint and varnish, measured drawings or photogrammetry. Carry out a condition survey, mapping on drawings the losses, flaking and lifting paint, cracks, plaster detachment (tap test), salts, soot from butter lamps, water staining and biological growth; use a magnifier, moisture meter and temperature/RH data logger. Prepare a written condition report with damage maps, photos and priorities.', null, '[{"point": "Permission and consultation with lam/community; history and research", "marks": 2}, {"point": "Photographic documentation (overall, detail, raking light, UV), measured drawings/mapping", "marks": 3}, {"point": "Condition survey: map losses, flaking, cracks, salts, soot, water damage; tools - magnifier, moisture meter, data logger, UV lamp", "marks": 3}, {"point": "Written condition report with damage maps and priorities", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case1', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations.

2. How would you identify the primary causes of deterioration? (5 marks)', 'Monitor temperature and relative humidity over seasons with data loggers; inspect the building for roof leaks, rising damp and cracks; map where damage is worst and relate it to sources (damp walls, near butter lamps, near doors). Look at human and ritual factors - soot from butter lamps and incense, touching, earlier repainting with incompatible paints - plus structural movement (earthquakes), salt efflorescence, insects and rodents. Where possible, analyse small samples of plaster, pigments and salts and consult specialists.', null, '[{"point": "Environmental monitoring (RH, temperature, moisture sources - roof leaks, rising damp)", "marks": 2}, {"point": "Human/ritual factors: butter lamps, incense soot, touching, previous repairs; structural movement, salts, pests", "marks": 2}, {"point": "Analysis of samples/expert advice; link patterns of damage to causes", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case1', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations.

3. Based on your assessment, recommend either a preventive or an interventive conservation approach and justify your choice. (10 marks)', 'Recommend mainly preventive conservation with minimal interventive stabilisation, rather than full repainting to the ''original'' look. Justification: authenticity and historic value lie in the original 18th-century paint; repainting would destroy it; damage will continue unless causes (leaks, damp, soot) are fixed; minimal treatment keeps the mural safe and respects reversibility. Actions: repair the roof and drainage, control damp and soot, then stabilise flaking paint with compatible, reversible consolidants, secure detached plaster, gently clean soot by trained conservators, and fill losses only to make them visually less disturbing without inventing imagery.', null, '[{"point": "Clear recommendation (usually preventive first, minimal interventive stabilisation)", "marks": 3}, {"point": "Justification: authenticity, minimum intervention, reversibility, causes must be fixed first, community/ritual use", "marks": 5}, {"point": "What it involves", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case1', 3, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations.

4. How would you explain key conservation principles, such as minimum intervention and reversibility, to the lam and community in a culturally respectful manner? (10 marks)', 'Meet the lam and community respectfully, listen to their spiritual reasons for wanting restoration, and speak in Dzongkha or the local language. Explain simply: minimum intervention means doing only what is needed to keep the original painting by the old masters alive - like caring for an elder rather than replacing them; reversibility means using materials that can later be removed without harm, so future generations have options. Link to Buddhist values of merit and care for sacred objects, show before-and-after examples from other lhakhangs, involve them in decisions and ceremonies, and agree acceptable compromises (e.g. consecration rituals, a newly painted mural or thangka elsewhere for worship).', null, '[{"point": "Respectful approach: meet with lam, listen to spiritual concerns, use Dzongkha/ local language, auspicious timing", "marks": 3}, {"point": "Explain minimum intervention and reversibility simply using analogies and Buddhist values (impermanence, merit, care)", "marks": 4}, {"point": "Show examples, involve them in decisions, agree compromises (e.g. new thangka/replica for ritual use)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case1', 4, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Conservation of an 18th-century wall mural in a community lhakhang
You have been assigned to assess and advise on the conservation of an 18th-century mural in a remote lhakhang. The mural shows signs of deterioration, and the local lam and community members request that it be restored to its original appearance. You must balance professional conservation principles with community expectations.

5. Recommend preventive measures to reduce further deterioration of the mural. Describe how you would support the development of local capacity for regular monitoring and basic care of the site. (15 marks)', 'Preventive measures: repair the roof and drainage and remove sources of damp; improve ventilation; move butter lamps and incense away from the walls or use enclosures/alternative lamps; prevent touching with barriers; control direct sunlight; manage pests and birds; and avoid new paint or nails on the walls. Capacity: train the caretaker (konyer), monks and community volunteers to inspect the mural regularly, record changes with photographs, read simple temperature/RH meters, clean the room safely, recognise warning signs (flaking, damp, cracks) and report to the Department of Culture and Dzongkha Development; provide a simple illustrated guideline and checklist in Dzongkha, a monitoring schedule and follow-up visits by conservators.', null, '[{"point": "Preventive measures: roof/drainage repair, damp control, ventilation, move butter lamps/incense away, barriers, light control, pest control, avoid touching", "marks": 7}, {"point": "Capacity: train caretakers/konyer and monks in inspection, cleaning, documentation, simple RH monitoring, reporting", "marks": 5}, {"point": "Guidelines, checklist, schedule and support from the Department of Culture", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case1', 5, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan''s sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact.

1. What systematic steps would you take to document the artefact, assess its historical context, and verify its authenticity and provenance, especially in the absence of formal records? (10 marks)', 'Receive it with a temporary receipt, then a deed of gift; give it an accession number; photograph it from all sides with a scale; measure and weigh it; prepare a detailed description and condition report (corrosion on the tip). Assess history: examine style, iconography, inscriptions and workmanship; compare with documented phurbas of Pema Lingpa''s lineage (e.g. at Tamshing, Kurjey); scientific analysis such as XRF of the metal and study of tool marks; interview the donor about how and from whom it was obtained; consult religious authorities, the Pema Lingpa lineage holders and scholars; check that it was not stolen from a lhakhang. Record all findings and state clearly where provenance remains unverified.', null, '[{"point": "Accession procedure: deed of gift, temporary receipt, unique number, photography, measurements, condition report", "marks": 3}, {"point": "Research: style, iconography, inscriptions, metal analysis (XRF), tool marks, comparison with known Pema Lingpa objects", "marks": 4}, {"point": "Oral history from donor and religious lineages, consult scholars; record uncertainty honestly", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case2', 1, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan''s sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact.

2. How would you approach curating an exhibition around this phurba? What central theme or narrative would you explore to frame the object within Bhutan''s spiritual and historical traditions? (10 marks)', 'Process: research, develop a concept with religious and scholarly advisers, select related objects (texts, thangkas, cham costumes), plan design, labels, multimedia, conservation, mounting and security. Theme: ''Pema Lingpa and the Terma (hidden treasure) tradition'' - presenting the phurba as a ritual implement of Vajrakilaya for subduing obstacles, linked to Pema Lingpa''s discoveries, the Peling cham dances and his descendants including the Wangchuck dynasty. Display it respectfully - elevated, well-lit, in a secure case with stable RH - perhaps in a shrine-like setting.', null, '[{"point": "Curatorial process: research, concept, object selection, design, conservation and security, consultation", "marks": 4}, {"point": "Theme e.g. ''Pema Lingpa and the treasure tradition'' / the phurba as a tool to overcome obstacles (Vajrakilaya)", "marks": 4}, {"point": "Supporting objects, media and respectful display (sacred setting, height, lighting)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case2', 2, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan''s sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact.

3. How would you interpret the object meaningfully for both Bhutanese and international audiences? (10 marks)', 'Use layered interpretation: a short, clear main label in Dzongkha and English, with deeper information panels. For Bhutanese visitors, connect to lived faith, Pema Lingpa''s legacy and festivals; for international visitors, explain what a phurba is, its symbolism (three-sided blade cutting through ignorance, attachment and aversion; Vajrakilaya), how it is used in ritual and the terma tradition, without exoticising or treating it as a weapon. Add photographs or film of rituals, audio guides, guided tours, a catalogue and online content, and note honestly what is known and uncertain about its history.', null, '[{"point": "Layered interpretation: bilingual labels (Dzongkha/English), simple main text plus deeper content", "marks": 3}, {"point": "Explain meaning, symbolism and use, context of Pema Lingpa; avoid exoticising", "marks": 4}, {"point": "Media: images/video of rituals, audio guides, guided tours, catalogues, online", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case2', 3, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan''s sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact.

4. How would you involve relevant stakeholders such as religious authorities, cultural scholars and local communities in the decision-making process? (10 marks)', 'Identify stakeholders: the Zhung Dratshang (Central Monastic Body), lamas of the Pema Lingpa lineage (e.g. Gangtey, Tamshing), the Department of Culture and Dzongkha Development, historians and scholars, the donor and communities in Bumthang. Form an advisory committee; hold consultations to share research findings; ask religious authorities about appropriate display, handling and any rituals before and during exhibition; let scholars review the labels; agree whether the object may be shown publicly or only in certain ways; document all decisions and give acknowledgement.', null, '[{"point": "Identify stakeholders: Zhung Dratshang/ Central Monastic Body, Pema Lingpa lineage holders, DoC&DD, scholars, donor, Bumthang communities", "marks": 3}, {"point": "Consultation methods: advisory committee, meetings, review of interpretation and display, rituals", "marks": 4}, {"point": "Shared decisions on display, handling, ritual access, documentation of agreements", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case2', 4, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Handling a donated artefact and developing an exhibit
The National Museum of Bhutan has received a donation of a rare 18th-century ritual object, a phurba (ritual dagger), believed to have belonged to Terton Pema Lingpa. The object shows minor corrosion on the metal tip, and there is limited accompanying documentation. No archival records exist to verify its provenance. The donor, a private collector from Thimphu, wishes the object to be publicly exhibited as part of Bhutan''s sacred heritage. You are tasked with leading the documentation, conservation and exhibition planning process for this artefact.

5. Identify any ethical considerations that may arise in displaying or interpreting a sacred object like the phurba. (10 marks)', 'Respect for its sacred nature - religious authorities may require rituals, restricted handling, appropriate height and placement, or that it is not displayed at all. Provenance and legality - with no records, the museum must do due diligence to ensure it was not removed illegally from a lhakhang (ICOM Code of Ethics, 1970 UNESCO Convention principles) and be ready to return it. Honest interpretation - do not present the attribution to Terton Pema Lingpa as fact without evidence. Cultural sensitivity in images and text, avoiding sensationalism. Conservation ethics - treat corrosion minimally and reversibly without ''polishing'' away history, and balance donor wishes with museum standards.', null, '[{"point": "Sacredness and respect: appropriate placement, handling by monks, consecration/rituals, possible restrictions on display", "marks": 3}, {"point": "Provenance and legality: unverified ownership, possibility of theft from a lhakhang, due diligence; ICOM code", "marks": 3}, {"point": "Accurate interpretation: avoid unverified claims (attribution to Pema Lingpa), cultural sensitivity", "marks": 2}, {"point": "Conservation ethics: minimal intervention on corrosion, community wishes vs museum standards", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'conservator'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-cons2025-case2', 5, null, null, (select id from public.specialisations where code = 'conservator'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
commit;
