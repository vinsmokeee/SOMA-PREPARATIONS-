-- ME Paper II (Technical, Conservator): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'conservator-general-subject-knowledge', 'Conservator: general subject knowledge' on conflict (subject_id, slug) do nothing;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-2') and subject_group_id is not distinct from (select id from public.subject_groups where code = 'conservator');
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'conservator'), 90, 15, 100, 'BCSE 2025 Main Examination, Technical Paper II, Conservator') on conflict (paper_id, subject_group_id) do update set duration_minutes = excluded.duration_minutes, reading_minutes = excluded.reading_minutes, max_marks = excluded.max_marks, source = excluded.source;
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'conservator'), null, 1, 'Part I: Multiple choice questions', 'mcq', 70, 1, null, 'BCSE 2025 Main Examination, Technical Paper II, Conservator');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-2'), (select id from public.subject_groups where code = 'conservator'), null, 2, 'Part II: Short answer questions', 'short_answer', 9, 5, 6, 'BCSE 2025 Main Examination, Technical Paper II, Conservator');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an ethical obligation of a conservator?', null, 'Treatments should be reversible where possible.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Permanent alteration', false, 1), ('B', 'Total restoration of missing parts', false, 2), ('C', 'Reversibility of treatment', true, 3), ('D', 'Speed over documentation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A condition report is typically prepared:', null, 'Condition reports are made before and after loans or treatments.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'When displaying objects', false, 1), ('B', 'Before and after loans or treatments', true, 2), ('C', 'After conservation only', false, 3), ('D', 'During inventory checks only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Who is primarily responsible for maintaining collections records?', null, 'The collections manager maintains collection records.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Director', false, 1), ('B', 'Collections manager', true, 2), ('C', 'Front desk staff', false, 3), ('D', 'Gallery assistant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which document legally records ownership transfer of an object?', null, 'A deed of gift legally transfers ownership.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Deed of gift', true, 1), ('B', 'Loan agreement', false, 2), ('C', 'Accession record', false, 3), ('D', 'Condition report', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Inventory in museums is:', null, 'An inventory is a complete list of the collections.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A funding report', false, 1), ('B', 'A list of missing items', false, 2), ('C', 'A marketing tool', false, 3), ('D', 'A complete list of all collections', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which field in a collection record is essential?', null, 'Object condition is an essential record field.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Entry ticket revenue', false, 1), ('B', 'Object condition', true, 2), ('C', 'Personal opinions', false, 3), ('D', 'Artist’s biography', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What is an accession number?', null, 'The accession number uniquely identifies each item.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Unique identifier for a collection item', true, 1), ('B', 'Material type', false, 2), ('C', 'Security code', false, 3), ('D', 'Object size', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The purpose of cataloging is to:', null, 'Cataloguing gives detailed object descriptions.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Provide detailed object descriptions', true, 1), ('B', 'Sell objects', false, 2), ('C', 'Promote exhibitions', false, 3), ('D', 'Organize ticket sales', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What is the main purpose of digitization in collections?', null, 'Digitisation gives online access and supports preservation.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase physical storage', false, 1), ('B', 'Enable e-commerce', false, 2), ('C', 'Improve ticketing systems', false, 3), ('D', 'Provide online access and preservation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Who typically approves high-value acquisitions in a museum?', null, 'High-value acquisitions are approved by the board or acquisition committee.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Visitors', false, 1), ('B', 'Board or acquisition committee', true, 2), ('C', 'Conservators', false, 3), ('D', 'Guards', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The best place to store collection records is:', null, 'Keep records securely in both physical and digital form.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'In secure physical and digital formats', true, 1), ('B', 'In open folders', false, 2), ('C', 'In public galleries', false, 3), ('D', 'On paper only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following helps ensure accurate collection tracking?', null, 'Barcodes or RFID tags help track objects accurately.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Random inspections', false, 1), ('B', 'Loan agreements', false, 2), ('C', 'Lighting checks', false, 3), ('D', 'Barcode or RFID tagging', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Loan documentation includes:', null, 'Loan files include the agreement and insurance details.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ticket sales', false, 1), ('B', 'Loan agreements and insurance details', true, 2), ('C', 'Artist payments', false, 3), ('D', 'Object recipes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not typically included in a condition report?', null, 'Loan terms belong in the loan agreement, not the condition report.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Photographs', false, 1), ('B', 'Damage notes', false, 2), ('C', 'Object description', false, 3), ('D', 'Loan terms', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Relative humidity should ideally be maintained at:', null, 'About 45-55% RH suits most mixed collections.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '30–35%', false, 1), ('B', '90–95%', false, 2), ('C', '45–55%', true, 3), ('D', '10–15%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which is NOT a preventive conservation measure?', null, 'Structural restoration is an interventive treatment, not preventive.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pest control', false, 1), ('B', 'Stable storage environment', false, 2), ('C', 'Structural restoration', true, 3), ('D', 'Fire safety systems', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Museum pests include all except:', null, 'Earthworms are not museum pests.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Termites', false, 1), ('B', 'Earthworms', true, 2), ('C', 'Silverfish', false, 3), ('D', 'Carpet beetles', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which material is most sensitive to humidity?', null, 'Textiles (organic, hygroscopic) are most sensitive to humidity among these.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Metal', false, 1), ('B', 'Stone', false, 2), ('C', 'Textile', true, 3), ('D', 'Ceramic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Light damage is particularly severe for:', null, 'Paper, textiles and photographs are most light-sensitive.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Painted walls', false, 1), ('B', 'Bronze sculptures', false, 2), ('C', 'Wooden masks', false, 3), ('D', 'Paper, textile, and photographs', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'How can pests be detected early in a museum?', null, 'Sticky (blunder) traps and regular inspection detect pests early.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Painting galleries', false, 1), ('B', 'Using light sensors', false, 2), ('C', 'Conducting audience surveys', false, 3), ('D', 'Using sticky traps and inspections', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What is the function of silica gel in storage?', null, 'Silica gel buffers relative humidity.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Humidity control', true, 1), ('B', 'Flame retardant', false, 2), ('C', 'Cleaning agent', false, 3), ('D', 'Pest repellent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Integrated Pest Management focuses on:', null, 'IPM relies on monitoring and non-toxic controls.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Killing all pests immediately', false, 1), ('B', 'Using pesticides regularly', false, 2), ('C', 'Monitoring and non-toxic controls', true, 3), ('D', 'Biological collections', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following should NOT be used in storage?', null, 'Unsealed wood emits acids that damage objects.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Acid-free tissue', false, 1), ('B', 'Archival-quality boxes', false, 2), ('C', 'Wooden boxes with no sealant', true, 3), ('D', 'Mylar sleeves', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Microclimate control is often used in:', null, 'Microclimates are created inside display cases for sensitive objects.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Display cases for sensitive materials', true, 1), ('B', 'Ticket counters', false, 2), ('C', 'Outdoor exhibits', false, 3), ('D', 'Museum gardens', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The ideal light level for paper-based items is:', null, 'About 50 lux for light-sensitive paper.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '500 lux', false, 1), ('B', '100 lux', false, 2), ('C', '50 lux', true, 3), ('D', '1000 lux', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following materials is most vulnerable to oxidation?', null, 'Metals oxidise (corrode).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Metal', true, 1), ('B', 'Textile', false, 2), ('C', 'Ceramic', false, 3), ('D', 'Stone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Fluctuating environmental conditions can cause:', null, 'Fluctuations cause cracking, warping and mould.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Staff fatigue', false, 1), ('B', 'Cracking, warping, and mold', true, 2), ('C', 'Increased security', false, 3), ('D', 'Better visitor experiences', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Best practice for cleaning display cases is:', null, 'Clean regularly with suitable dry methods.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Monthly with water', false, 1), ('B', 'Annually with oils', false, 2), ('C', 'Daily with soap', false, 3), ('D', 'Regularly with appropriate dry methods', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a major pollutant in museums?', null, 'Sulphur dioxide is a major damaging pollutant.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inert gases', false, 1), ('B', 'Sulfur dioxide', true, 2), ('C', 'Oxygen', false, 3), ('D', 'Carbon monoxide', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Relative humidity below 30% can cause:', null, 'Very low RH dries out and cracks organic materials.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mold growth', false, 1), ('B', 'Insect infestation', false, 2), ('C', 'Rusting', false, 3), ('D', 'Drying and cracking', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Buffer zones in museum buildings help with:', null, 'Buffer zones stabilise the environment.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M33', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Emergency exits', false, 1), ('B', 'Visitor parking', false, 2), ('C', 'Object tagging', false, 3), ('D', 'Environmental stabilization', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which principle requires that all conservation work be undoable?', null, 'Reversibility: treatments can be undone.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Efficiency', false, 1), ('B', 'Reversibility', true, 2), ('C', 'Minimalism', false, 3), ('D', 'Transparency', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The Royal Heritage Museum of Bhutan is located in:', null, 'The Royal Heritage Museum is in the Ta Dzong of Trongsa.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Trongsa', true, 1), ('B', 'Paro', false, 2), ('C', 'Bumthang', false, 3), ('D', 'Thimphu', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Conservation of sacred objects must also consider:', null, 'Sacred objects need consideration of ritual significance and the community.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ritual significance and community consultation', true, 1), ('B', 'Legal ownership', false, 2), ('C', 'Age of the item', false, 3), ('D', 'Only scientific values', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which Bhutanese authority regulates cultural heritage?', null, 'The Department of Culture and Dzongkha Development regulates heritage.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'MoEA', false, 1), ('B', 'Department of Culture & Dzongkha Development', true, 2), ('C', 'Ministry of Labour', false, 3), ('D', 'NEC', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which material is used in traditional Bhutanese mural painting?', null, 'Traditional murals use natural earth (mineral) pigments.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Acrylic', false, 1), ('B', 'Natural earth pigments', true, 2), ('C', 'Synthetic dyes', false, 3), ('D', 'Oil', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT an ethical principle in conservation?', null, 'Irreversible alteration violates conservation ethics.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Documentation', false, 1), ('B', 'Minimum intervention', false, 2), ('C', 'Reversibility', false, 3), ('D', 'Irreversible alteration', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Who must often be consulted before treating sacred artifacts in Bhutan?', null, 'Monastic representatives or lams must be consulted for sacred objects.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Art dealers', false, 1), ('B', 'Insurance agents', false, 2), ('C', 'Tour guides', false, 3), ('D', 'Monastic representatives or lams', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In Bhutan, heritage sites are considered:', null, 'Heritage sites in Bhutan are living cultural spaces.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Living cultural spaces', true, 1), ('B', 'Commercial centers', false, 2), ('C', 'Tourist zones', false, 3), ('D', 'Ruins', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What is a “Salvage Priority List” in a Disaster Management Plan?', null, 'It ranks collections for rescue by value and vulnerability.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Budget allocation sheet', false, 1), ('B', 'Emergency contacts only', false, 2), ('C', 'Ranking of collections by cultural and conservation value for rescue', true, 3), ('D', 'List of pest control chemicals', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a key component of emergency preparedness?', null, 'First-aid and emergency training are part of preparedness.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Catalog publication', false, 1), ('B', 'First-aid training', true, 2), ('C', 'Climate survey', false, 3), ('D', 'Audio guides', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The most appropriate first step when a flood threatens museum collections is:', null, 'Move objects to a secure, dry area first.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Close ticket counters', false, 1), ('B', 'Turn off lights', false, 2), ('C', 'Inform the media', false, 3), ('D', 'Remove objects to a secure dry area', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The "Triangle of Fire" includes:', null, 'Fuel, oxygen and heat.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fuel, oxygen, heat', true, 1), ('B', 'Flame, object, person', false, 2), ('C', 'Water, electricity, fuel', false, 3), ('D', 'Smoke, light, gas', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Cellulose-based materials (e.g., paper and textiles) degrade mainly due to:', null, 'Acid hydrolysis breaks cellulose chains (e.g. acidic paper).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Photochemical reactions', false, 1), ('B', 'Acid hydrolysis', true, 2), ('C', 'Salt accumulation', false, 3), ('D', 'Microbial activity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the primary purpose of a museum?', null, 'Museums preserve heritage and educate.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Preservation and education', true, 1), ('B', 'Tourism only', false, 2), ('C', 'Entertainment', false, 3), ('D', 'Commercial trade', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Copper artifacts commonly develop a green layer called:', null, 'The green layer on copper is patina (copper carbonates).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Carbonate', false, 1), ('B', 'Silicate', false, 2), ('C', 'Tannin', false, 3), ('D', 'Patina', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What accelerates corrosion in iron artifacts?', null, 'Chlorides with fluctuating humidity accelerate iron corrosion.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Constant freezing', false, 1), ('B', 'Fluctuating RH and chlorides', true, 2), ('C', 'Strong light', false, 3), ('D', 'Humidity below 30%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which chemical is used to detect acidic degradation in paper?', null, 'pH indicators reveal acidity in paper.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vinegar', false, 1), ('B', 'Acetone', false, 2), ('C', 'pH indicator (methyl orange or phenolphthalein)', true, 3), ('D', 'Ethanol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Minimum intervention in conservation means:', null, 'Minimum intervention: avoid unnecessary treatment.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Using modern synthetic coatings', false, 1), ('B', 'Always replacing missing parts', false, 2), ('C', 'Fully restoring damaged objects', false, 3), ('D', 'Avoiding unnecessary treatment', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which international body developed the 1970 Convention on cultural property?', null, 'The 1970 Convention on illicit trafficking is a UNESCO convention.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'UNESCO', true, 1), ('B', 'ICOMOS', false, 2), ('C', 'UNHCR', false, 3), ('D', 'ICCROM', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'What should be included in a conservation treatment report?', null, 'Treatment reports record steps, materials and photographs.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Loan history', false, 1), ('B', 'Steps taken, materials used, and photographs', true, 2), ('C', 'Artist biography', false, 3), ('D', 'Visitor numbers', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Ethics in conservation require:', null, 'Ethics require transparency and documentation.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M56', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Artistic interpretation', false, 1), ('B', 'Fast treatments only', false, 2), ('C', 'Transparency and documentation', true, 3), ('D', 'Secrecy of treatments', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M56';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which document is referred to for the ethical return of looted cultural objects?', null, 'The UNESCO 1970 Convention guides return of illicitly exported property.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M57', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'UNESCO 2003 Convention', false, 1), ('B', 'Hague Convention', false, 2), ('C', 'UNESCO 1970 Convention', true, 3), ('D', 'Paris Protocol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Bhutanese textiles are often dyed with:', null, 'Traditional Bhutanese dyes are vegetable and mineral.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M58', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plastic-based pigments', false, 1), ('B', 'Synthetic dyes only', false, 2), ('C', 'Animal blood', false, 3), ('D', 'Vegetable and mineral dyes', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'When handling fragile textiles, one must:', null, 'Wear gloves and support fragile textiles on trays.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M59', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fold tightly for storage', false, 1), ('B', 'Wear gloves and use support trays', true, 2), ('C', 'Wash before display', false, 3), ('D', 'Use plastic wrap', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The best way to store sacred textiles long-term is:', null, 'Roll on acid-free tubes and keep in low light.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M60', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Folded in wooden cabinets', false, 1), ('B', 'Hanging in direct light', false, 2), ('C', 'Sealed in airtight plastic', false, 3), ('D', 'Rolled on acid-free tubes in low light', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M60';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'In digitization, which of the following is most important?', null, 'Careful handling and good metadata matter most.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M61', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increasing ticket sales', false, 1), ('B', 'Selling online', false, 2), ('C', 'Physical handling care and metadata entry', true, 3), ('D', 'Color correction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The ideal temperature range for most museum storage is:', null, 'About 18-22 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M63', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0–5°C', false, 1), ('B', '18–22°C', true, 2), ('C', '10–18°C', false, 3), ('D', '25–30°C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a preventive conservation method?', null, 'Conservation-grade mount board is a preventive measure.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M64', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Humidifying a painting', false, 1), ('B', 'Reweaving damaged textile areas', false, 2), ('C', 'Using a conservation-grade mount board', true, 3), ('D', 'Repainting flaked areas', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'A digital Collections Management System (CMS) helps museums to:', null, 'A CMS tracks, documents and manages collections.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M65', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Track, document, and manage collections efficiently', true, 1), ('B', 'Store visitor data', false, 2), ('C', 'Display virtual exhibitions only', false, 3), ('D', 'Print tickets', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'UV light exposure primarily affects:', null, 'UV damages organic materials such as textiles and paper.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M66', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ceramics', false, 1), ('B', 'Stone', false, 2), ('C', 'Metal', false, 3), ('D', 'Organic materials like textiles and paper', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M66';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Ta Dzong, which houses the National Museum, is historically significant because:', null, 'Ta Dzong was a watchtower with distinctive round architecture.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M67', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is the seat of government', false, 1), ('B', 'It is the oldest palace in Bhutan', false, 2), ('C', 'It served as a watchtower and has unique architecture', true, 3), ('D', 'It was built by foreign conservators', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M67';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Conservation of thangkas often requires:', null, 'Thangkas need minimal handling and stable storage.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M69', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Retouching the paint', false, 1), ('B', 'Removing silk covers', false, 2), ('C', 'Minimal handling and stabilized storage', true, 3), ('D', 'Framing under glass', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Bronze disease in metal artifacts is caused by:', null, 'Bronze disease is caused by copper chlorides with moisture.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'M70', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Copper chlorides and moisture', true, 1), ('B', 'Fungus growth', false, 2), ('C', 'High temperature', false, 3), ('D', 'Dust accumulation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M70';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Explain the principle of preventive conservation with two practical examples. (5 marks)', 'Preventive conservation means taking indirect measures to avoid or slow deterioration of whole collections by controlling the agents of deterioration (light, relative humidity, temperature, pests, pollutants, handling, disasters), instead of waiting to treat damaged objects. It is cheaper and less invasive than interventive treatment. Example 1: controlling the environment, e.g. keeping relative humidity around 45-55% and temperature 18-22 °C using dehumidifiers, silica gel and sealed cases, which prevents mould, cracking and corrosion. Example 2: integrated pest management - regular inspection, sticky traps, good housekeeping and quarantine of new objects - and limiting light to about 50 lux with UV filters for textiles, thangkas and paper.', null, '[{"point": "Principle: indirect measures that slow deterioration of whole collections by controlling the environment and risks, rather than treating individual objects", "marks": 2}, {"point": "Example 1 explained (e.g. RH/temperature control with dehumidifiers, silica gel)", "marks": 1.5}, {"point": "Example 2 explained (e.g. light control, IPM, proper storage and handling, disaster preparedness)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'What are the main components of a Conservation Guideline Policy, and why are they important? (5 marks)', 'A Conservation Guideline Policy usually includes: (1) purpose, scope and ethical principles such as minimum intervention, reversibility and respect for the cultural and religious significance of objects; (2) preventive conservation standards for environment, storage, display, handling, pest management and emergency preparedness; (3) procedures for examination, treatment proposals, approval and use of qualified conservators; (4) documentation requirements; (5) roles, training, resources and periodic review. It is important because it ensures all staff follow the same standards, makes decisions transparent and accountable, prevents harmful or unauthorised treatments, and protects collections for future generations.', null, '[{"point": "Purpose, scope and ethical principles (minimum intervention, reversibility, respect for cultural/religious value)", "marks": 1.5}, {"point": "Preventive conservation standards (environment, storage, handling, pest, emergency) and treatment procedures/approval", "marks": 1.5}, {"point": "Documentation, responsibilities/qualified staff, training, review", "marks": 1}, {"point": "Importance: consistency, accountability, protects collections long term, guides decisions", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Define Collections Management Policy and outline its key impacts on museum operations. (5 marks)', 'A Collections Management Policy is a formal document, approved by the museum''s governing body, that sets out the museum''s purpose and the rules for acquiring, accessioning, documenting, caring for, using, lending and deaccessioning its collections. Impacts: it guides what may be acquired and how objects are disposed of; it standardises documentation, inventory and loan procedures; it sets standards for storage, conservation and security; it defines access for research, exhibitions and communities; and it ensures legal and ethical compliance and accountability, helping management plan resources and avoid inappropriate decisions.', null, '[{"point": "Definition: formal document approved by the governing body stating how the museum acquires, documents, cares for, uses, lends and disposes of its collections", "marks": 2}, {"point": "Impacts: guides acquisition and deaccession decisions; standardises documentation and loans; access/use rules; risk and care standards", "marks": 2}, {"point": "Accountability, legal/ethical compliance, planning and resource allocation", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Explain how environmental factors (temperature, humidity, light) affect collections. (5 marks)', 'Temperature: heat speeds up chemical reactions such as oxidation and acid hydrolysis and encourages insects and mould; rapid changes make materials expand and contract, causing cracks. Relative humidity: high RH (above about 65%) causes mould, corrosion of metals and swelling of wood and textiles; low RH (below about 30%) dries and cracks wood, paint, leather and paper; fluctuating RH causes warping and flaking of paint layers. Light: visible and especially ultraviolet light fade dyes and pigments, yellow paper and weaken textiles; the damage is cumulative and irreversible, so light levels and exposure time must be limited.', null, '[{"point": "Temperature: high temperature speeds chemical decay and pest activity; fluctuations cause expansion/contraction", "marks": 1.5}, {"point": "Humidity: high RH - mould, corrosion, swelling; low RH - drying, cracking, brittleness; fluctuation - warping, flaking", "marks": 2}, {"point": "Light (visible and UV): fading, yellowing, embrittlement of organic materials; damage is cumulative", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Describe the key components of a Conservation Guideline Policy and its impact on the long-term preservation of museum collections. (5 marks)', 'Key components: statement of ethical principles (minimum intervention, reversibility, respect for sacred and cultural values); standards for environment, storage, display and handling; integrated pest management; procedures for condition surveys, treatment proposals and approval by qualified conservators; documentation of all examinations and treatments; emergency and disaster planning; and staff roles and training. Impact: the policy ensures consistent, ethical care; reduces risky or unnecessary treatments; controls agents of deterioration before damage occurs; and keeps records that guide future conservators, so collections survive longer for future generations.', null, '[{"point": "Components: ethics and principles, preventive conservation standards, treatment procedures and approval, documentation, emergency planning, roles and training", "marks": 3}, {"point": "Impact: consistent care, fewer damaging interventions, early risk control, records for future, sustained preservation", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Outline the steps involved in assessing and treating a fragile textile object in a heritage museum. Include ethical considerations. (5 marks)', '1. Examine and document: handle minimally with gloves and support; record condition with notes and photographs; identify fibres, dyes and earlier repairs; assess causes of damage. 2. Research significance and consult the curator and, for sacred textiles, the monastic body or community. 3. Prepare a treatment proposal and obtain approval. 4. Treat using the least invasive, reversible methods: gentle surface cleaning with low-suction vacuum through screening, controlled humidification to relax creases, and stabilising tears by stitching onto a dyed support fabric with fine silk thread rather than replacing missing parts. 5. Re-house on acid-free supports, rolled or flat, in low light and stable RH, and record the full treatment. Ethics: minimum intervention, reversibility, honesty (no disguised additions), full documentation and respect for the object''s ritual meaning.', null, '[{"point": "Assessment: examination, condition report, photographs, identify fibres/dyes, causes of damage; research significance", "marks": 1.5}, {"point": "Treatment plan agreed (with curator/community); minimal, reversible methods: surface cleaning (low suction), humidification, support stitching onto fabric, padded mounts", "marks": 1.5}, {"point": "Storage/display after treatment: acid-free, rolled or flat, low light, stable RH", "marks": 1}, {"point": "Ethics: minimum intervention, reversibility, documentation, respect for religious significance and consult monastic body", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'What are the essential elements of a Disaster Management Plan for museums, especially those housed in heritage buildings like Ta Dzongs? (5 marks)', 'Essential elements: (1) risk assessment of hazards such as fire (butter lamps, old wiring, wooden structures), earthquakes, floods, storms and theft; (2) prevention and mitigation: fire detection and suppression, safe electrical wiring, lightning protection, seismic strengthening, secure storage; (3) an emergency response plan with an emergency team, clear roles, contact lists, evacuation routes for visitors and staff, and a salvage priority list of the most important objects with emergency kits; (4) recovery procedures for drying, stabilising and documenting damaged objects, insurance and conservation; (5) regular training and drills, coordination with fire services, Desuups and the Dzongkhag, and periodic review of the plan.', null, '[{"point": "Risk assessment of hazards (fire, earthquake, flood, theft) and building vulnerabilities; prevention measures (fire detectors, extinguishers, wiring, seismic strengthening)", "marks": 1.5}, {"point": "Emergency response: team roles, contact list, evacuation routes for people, salvage priority list and grab kits", "marks": 1.5}, {"point": "Recovery: salvage procedures, documentation, insurance, conservation of damaged objects", "marks": 1}, {"point": "Training, drills, coordination with fire services/Dzongkhag, regular review", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Discuss the role of preventive conservation in museum collections care. Give examples relevant to Bhutan''s climate and materials. (5 marks)', 'Preventive conservation protects whole collections by controlling risks before damage happens, which is more effective and cheaper than repairing objects later. In Bhutan, the summer monsoon brings high humidity that causes mould on thangkas, textiles and manuscripts and encourages insects, while dry, cold winters cause wooden masks, painted objects and leather to crack; daily temperature swings, earthquakes and fire from butter lamps are further risks. Examples: using dehumidifiers, silica gel and sealed cases during the monsoon; integrated pest management with traps and inspections for textiles and paper; limiting light and UV for thangkas; storing manuscripts and textiles in acid-free boxes; keeping butter lamps away from collections and installing fire detection; and securing objects against earthquakes.', null, '[{"point": "Role: slows deterioration of whole collections, cost-effective, reduces need for treatment", "marks": 1.5}, {"point": "Bhutan climate: humid monsoon (mould, insects) and dry cold winters (cracking); altitude and temperature swings; earthquakes, fire from butter lamps", "marks": 1.5}, {"point": "Examples for Bhutanese materials: thangkas, textiles, wooden masks, manuscripts - dehumidifiers/silica gel, IPM, low light, acid-free storage, fire safety", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'short_answer', 'Explain the importance of documentation in conservation treatments. How does it support accountability and future decision-making? (5 marks)', 'Documentation is a permanent record of an object''s condition before, during and after treatment, including photographs, test results, the treatment steps, materials and methods used, dates and the conservator''s name. It supports accountability because it shows exactly what was done, why and by whom, so owners, curators and religious communities can check that ethical standards were followed and that no undisclosed changes were made. It supports future decisions because later conservators know which materials were added and can reverse or avoid them, can compare condition over time to judge whether deterioration is continuing, and can use the information for research, loans, insurance and disaster recovery.', null, '[{"point": "Documentation records condition before, during and after treatment: photographs, analysis, methods, materials, dates, conservator", "marks": 1.5}, {"point": "Accountability: proves what was done and why, by whom; transparency to owners, curators, communities; meets ethics", "marks": 1.5}, {"point": "Future decisions: shows previous materials so they can be reversed/avoided; tracks change over time; supports research, loans, insurance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper II, Conservator", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'S9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 1.0, 3 from me_q where key = 'S9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The process of formally recording an object as part of a museum''s permanent collection is called', null, 'Accessioning formally adds an object to the collection.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'exhibition', false, 1), ('B', 'conservation', false, 2), ('C', 'accessioning', true, 3), ('D', 'deaccessioning', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'The book in which accession numbers and basic details of all accessioned objects are written in order is the', null, 'The accession register is the permanent master record.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'accession register', true, 1), ('B', 'condition report', false, 2), ('C', 'visitor book', false, 3), ('D', 'loan agreement', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which insect is a major pest of wool and silk textiles in museums?', null, 'Larvae of clothes moths feed on keratin in wool and silk.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mosquito', false, 1), ('B', 'Housefly', false, 2), ('C', 'Clothes moth', true, 3), ('D', 'Termite', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT an agent of deterioration?', null, 'Documentation protects collections; the others damage them.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Proper documentation', true, 1), ('B', 'Pests', false, 2), ('C', 'Incorrect relative humidity', false, 3), ('D', 'Light', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Removing an object permanently from a museum collection is called', null, 'Deaccessioning is the formal removal of an object.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'accessioning', false, 1), ('B', 'deaccessioning', true, 2), ('C', 'cataloguing', false, 3), ('D', 'digitisation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, image_url)
  values ('ME', 'mcq', 'Acid-free materials are used in storage mainly to', null, 'Acid-free materials do not release acids into objects.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'conservator-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Conservator): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'conservator'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'prevent acid migration and yellowing', true, 1), ('B', 'attract pests', false, 2), ('C', 'make boxes heavier', false, 3), ('D', 'increase humidity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
commit;
