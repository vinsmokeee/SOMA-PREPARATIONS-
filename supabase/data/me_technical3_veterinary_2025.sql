-- ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'veterinary-science', 'Veterinary Science' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'veterinary-science') is null then raise exception 'unknown specialisation veterinary-science'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'veterinary-science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'veterinary-science'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Veterinary Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'veterinary-science'), null, 2, 'Section A Part II: Short answer questions (answer any five)', 'short_answer', 6, 6, 5, 'BCSE 2025 Main Examination, Technical Paper III, Veterinary Science');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'veterinary-science'), null, 3, 'Section B: Long answer questions (answer any TWO)', 'passage', 4, 20, 2, 'BCSE 2025 Main Examination, Technical Paper III, Veterinary Science');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following hormone is primarily responsible for the milk let-down reflex?', null, 'Oxytocin causes milk let-down.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oestrogen', false, 1), ('B', 'Progesterone', false, 2), ('C', 'Vasopressin', false, 3), ('D', 'Oxytocin', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary metabolic disorder that causes milk fever in cattle?', null, 'Milk fever is hypocalcaemia around calving.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypomagnesemia', false, 1), ('B', 'Hypocalcemia', true, 2), ('C', 'Hypokalemia', false, 3), ('D', 'Hypercalcemia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The trivalent FMD vaccine currently used in Bhutan consists of the following serotypes:', null, 'Bhutan''s trivalent FMD vaccine contains serotypes O, A and Asia 1.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'O, A and C', false, 1), ('B', 'O, A, SAT 1', false, 2), ('C', 'O, A and SAT 2', false, 3), ('D', 'O, A and Asia 1', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An ideal fluid therapy for treating diarrhoea is', null, 'Ringer''s lactate (balanced, with lactate to correct acidosis) suits diarrhoea.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5% dextrose', false, 1), ('B', '25% dextrose', false, 2), ('C', 'Ringer lactate', true, 3), ('D', 'Normal saline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Polyneuritis in poultry is caused by the deficiency of:', null, 'Thiamine deficiency causes polyneuritis (star-gazing) in poultry.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zinc', false, 1), ('B', 'Copper', false, 2), ('C', 'Folic acid', false, 3), ('D', 'Thiamine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which cells are the primary target of canine parvovirus infection?', null, 'Parvovirus targets rapidly dividing cells: intestinal crypts and bone marrow.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mature red blood cells', false, 1), ('B', 'Skin epithelial cells', false, 2), ('C', 'Rapidly dividing cells of the intestinal crypts and bone marrow', true, 3), ('D', 'Neurons in the brain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 5-year-old male neutered Labrador is brought to the Dzongkhag Veterinary Hospital with a 3-day history of vomiting and lethargy. On physical examination, you note a painful abdomen and a palpable mass in the mid-abdomen. Radiographs reveal a foreign body obstruction in the small intestine. What is the most appropriate next step?', null, 'Obstructive foreign bodies need exploratory laparotomy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Recommend a bland diet for 24 hours', false, 1), ('B', 'Perform an exploratory laparotomy to remove the foreign body', true, 2), ('C', 'Administer an enema to help pass the foreign body', false, 3), ('D', 'Prescribe anti-emetics and monitor for improvement', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Scooting behaviour in dog is caused by:', null, 'Dipylidium caninum segments cause perianal irritation and scooting.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Diphylidium caninum', true, 1), ('B', 'None of the above', false, 2), ('C', 'Diphylobothridium latum', false, 3), ('D', 'Echinococcus granulosus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Leptospirosis in dog is transmitted through:', null, 'Leptospires spread via urine of carriers and rodents, entering through skin and mucosa.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Urine', false, 1), ('B', 'Skin penetration', false, 2), ('C', 'All of the above', true, 3), ('D', 'Rodents', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The test used to measure the protective antibody titre against Rabies is:', null, 'RFFIT measures rabies virus-neutralising antibody titres.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Direct FAT', false, 1), ('B', 'Indirect ELISA', false, 2), ('C', 'RFFIT', true, 3), ('D', 'SNT', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The first antibiotic, Penicillin, was discovered by:', null, 'Alexander Fleming discovered penicillin (1928).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ignaz Semmelweis', false, 1), ('B', 'Alexander Fleming', true, 2), ('C', 'Gerd Binnig', false, 3), ('D', 'Paul Ehrlich', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An epidemic affecting a large geographical area or often on a global scale is called:', null, 'A pandemic covers a large region or the world.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sporadic', false, 1), ('B', 'Endemic', false, 2), ('C', 'Epidemic', false, 3), ('D', 'Pandemic', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A symbiotic relationship in which one organism benefits while the other is unaffected is called:', null, 'Commensalism: one benefits, the other is unaffected.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mutualism', false, 1), ('B', 'Parasitism', false, 2), ('C', 'Saprophytism', false, 3), ('D', 'Commensalism', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What disease is caused by Clostridium perfringens type D in lambs?', null, 'C. perfringens type D causes pulpy kidney (enterotoxaemia).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lamsiekte', false, 1), ('B', 'Black leg', false, 2), ('C', 'Pulpy kidney disease', true, 3), ('D', 'Tetanus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The routine stain used for histopathological examination is', null, 'Haematoxylin and eosin is the routine histology stain.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Giemsa stain', false, 1), ('B', 'Haematoxylin & Eosin stain', true, 2), ('C', 'Lactophenol cotton stain', false, 3), ('D', 'Leishman stain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not the characteristic of injectable anaesthetics?', null, 'Injectable anaesthetics give rapid, not slow, induction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Depth or level of anaesthesia is difficult to control', false, 1), ('B', 'Slow recovery', false, 2), ('C', 'Do not require costly and sophisticated equipment', false, 3), ('D', 'Slow induction', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Red Blood Cells are nucleated in:', null, 'Bird red cells are nucleated.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sheep', false, 1), ('B', 'Cattle', false, 2), ('C', 'Poultry', true, 3), ('D', 'Horse', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The temperature, pressure, and time required for autoclaving of surgical instruments is:', null, 'Autoclave at 121 °C, 15 psi, 15 minutes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '150°C at 15 psi for 30 minutes', false, 1), ('B', '121°C at 15 psi for 15 minutes', true, 2), ('C', '121°C at 15 psi for 60 minutes', false, 3), ('D', '350°C at 15 psi for 15 minutes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The primary reason for using atropine as a preanesthetic medication in an animal receiving xylazine is to:', null, 'Atropine prevents xylazine-induced bradycardia (and reduces salivation).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prevent bradycardia', true, 1), ('B', 'Reduce salivation', false, 2), ('C', 'Induce muscle relaxation', false, 3), ('D', 'Enhance sedation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The dose rate of xylazine in horse is:', null, 'Xylazine in horses: about 1.1 mg/kg IV.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.1 mg/kg body weight', true, 1), ('B', '0.1 mg/kg body weight', false, 2), ('C', '2.2 mg/kg body weight', false, 3), ('D', '1-2 mg/kg body weight', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The adverse effects of Xylazine are reversed with', null, 'Yohimbine (an alpha-2 antagonist) reverses xylazine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Doxapram', false, 1), ('B', 'Yohimbine hydrochloride', true, 2), ('C', 'Neostigmine', false, 3), ('D', 'Naloxone', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bioavailability of drug refers to:', null, 'Bioavailability is the fraction of dose reaching circulation unchanged.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Percentage of administered dose that reaches systemic circulation in the unchanged form', true, 1), ('B', 'Ratio of drug excreted unchanged in urine to that excreted as metabolites', false, 2), ('C', 'Ratio of oral to parenteral dose', false, 3), ('D', 'Ratio of orally administered drug to that excreted in the faeces', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Chocolates are toxic to dogs due to the presence of:', null, 'Theobromine makes chocolate toxic to dogs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Theobromine', true, 1), ('B', 'Pheneramine', false, 2), ('C', 'Terbutaline', false, 3), ('D', 'Aminophylline', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Triclabendazole is the drug of choice for:', null, 'Triclabendazole treats fasciolosis (all fluke stages).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Taeniasis', false, 1), ('B', 'Fascioliosis', true, 2), ('C', 'Ancylostomiasis', false, 3), ('D', 'Schistosomiasis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best choice of anesthesia in rumenotomy is:', null, 'Rumenotomy is done standing under paravertebral (or inverted L) block.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'General anesthesia', false, 1), ('B', 'Epidural anesthesia', false, 2), ('C', 'Paravertebral block', true, 3), ('D', 'Regional intravenous anesthesia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The causative agent of hydatidious is:', null, 'Hydatidosis is caused by Echinococcus granulosus.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Echinococcus granulosa', true, 1), ('B', 'Diphylobothrium spp.', false, 2), ('C', 'Taenia solium', false, 3), ('D', 'Taenia saginata', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Xylazine does not have the following effect:', null, 'Xylazine is not antipyretic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Antipyretic', true, 1), ('B', 'Muscle relaxant', false, 2), ('C', 'Sedative', false, 3), ('D', 'Analgesic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Abortion storm is a characteristic sign of:', null, 'Abortion storms are typical of brucellosis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vibriosis', false, 1), ('B', 'Trychomoniasis', false, 2), ('C', 'Leptospirosis', false, 3), ('D', 'Brucellosis', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best describes the pathogenesis of rabies virus after entry into the host?', null, 'After a bite the virus travels from the site along peripheral nerves to the CNS.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rabies virus primarily infects endothelial cells and spreads hematogenously to the brain', false, 1), ('B', 'Rabies virus replicates in muscle cells at the bite site, then travels via peripheral nerves to the CNS', true, 2), ('C', 'Rabies virus enters lymphatic vessels and spreads through lymph nodes before CNS invasion', false, 3), ('D', 'Rabies virus replicates immediately in the bloodstream resulting in viremia before CNS invasion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following hormones triggers the release of the oocyte from the ovarian follicle during the estrous cycle?', null, 'The LH surge triggers ovulation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Luteinizing hormone (LH)', true, 1), ('B', 'Progesterone', false, 2), ('C', 'Prolactin', false, 3), ('D', 'Follicle-stimulating hormone (FSH)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 4-month-old, unvaccinated male kitten is presented to the Dzongkhag Veterinary Hospital with acute severe lethargy, anorexia, profuse vomiting and haemorrhagic diarrhoea. There is severe dehydration and a fever of 105.8 °F. The CBC shows severe leukopenia. What is the most probable diagnosis, the line of treatment, and what would you advise the owner?', 'Most probable diagnosis: feline panleukopenia (feline parvovirus infection) - young unvaccinated kitten, vomiting, haemorrhagic diarrhoea, fever and severe leukopenia. Treatment is supportive and intensive: isolate the kitten; IV fluids (e.g. Ringer''s lactate) with potassium and dextrose to correct dehydration and electrolytes; antiemetics (maropitant/metoclopramide); broad-spectrum parenteral antibiotics (e.g. amoxicillin-clavulanate) to prevent secondary bacterial infection due to leukopenia; antipyretic care, warmth, early nutrition and nursing; blood transfusion in severe cases. Owner advice: the prognosis is guarded; keep the kitten isolated; disinfect the environment with dilute bleach (the virus survives long in the environment); vaccinate all other cats and future kittens (core vaccine from 6-8 weeks with boosters); do not bring new unvaccinated kittens into the house for several months.', null, '[{"point": "Diagnosis: feline panleukopenia (feline parvovirus)", "marks": 1.5}, {"point": "Treatment: isolation, IV fluids/ electrolytes, glucose, antiemetics, broad-spectrum antibiotics for secondary infection, nutrition, warmth; supportive", "marks": 2.5}, {"point": "Advice: guarded prognosis, vaccinate other cats, disinfect (bleach) environment, isolate, vaccination schedule", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is antimicrobial resistance (AMR)? List five key drivers of AMR in veterinary medicine.', 'Antimicrobial resistance is the ability of bacteria, viruses, fungi or parasites to resist the effects of antimicrobial drugs that previously killed or inhibited them, so infections become harder to treat in animals and people. Key drivers in veterinary medicine: 1. Overuse and misuse - treating viral infections or without diagnosis. 2. Use as growth promoters or routine mass prophylaxis in poultry and pigs. 3. Wrong dose, duration or route, and stopping treatment early. 4. Sale of antimicrobials without prescription and self-treatment by farmers. 5. Poor biosecurity, hygiene and vaccination, so more disease needs treatment. Also: lack of laboratory diagnosis and sensitivity testing, environmental contamination with residues, weak regulation and surveillance.', null, '[{"point": "Definition: ability of microorganisms to survive/ grow despite antimicrobials that would normally kill/ inhibit them", "marks": 1}, {"point": "Five drivers (1 each): overuse/ misuse, use as growth promoters/ prophylaxis, incorrect dose/ duration, over-the-counter sale without prescription, poor biosecurity/ hygiene/ infection control, lack of diagnostics/ AST, residues in environment, weak regulation/ surveillance, poor farmer awareness", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A pig farmer reports sudden high mortality in his herd, with several pigs showing high fever, reddening of the skin of the ears and abdomen and loss of appetite. Some surviving pigs are lethargic, and they are not responding to antibiotic treatment. What is the most probable diagnosis? List five of the most important immediate actions, including biosecurity measures to control further spread.', 'Most probable diagnosis: African swine fever (ASF) - high fever, skin reddening, sudden high mortality and no response to antibiotics; classical swine fever is the main differential. Both are notifiable diseases. Immediate actions: 1. Report at once to the Dzongkhag Livestock/Veterinary office and NCAH; do not move or sell any pigs (movement standstill and farm quarantine). 2. Collect samples (blood, spleen, lymph nodes) safely for laboratory confirmation. 3. Dispose of dead pigs safely by deep burial or burning on the farm under veterinary supervision - never sell, eat or throw carcasses in rivers. 4. Strict biosecurity - restrict entry of people, vehicles and other animals, use foot dips, dedicated clothing and boots, and clean and disinfect pens, equipment and vehicles. 5. Stop swill feeding, control the movement of pork products, and carry out surveillance and tracing of contact farms; stamping out and compensation follow the national contingency plan.', null, '[{"point": "Probable diagnosis: African swine fever (differential classical swine fever) - notifiable", "marks": 1.5}, {"point": "Five immediate actions: report to authorities (Dzongkhag/ NCAH), quarantine/ movement standstill, sample collection for lab confirmation, safe disposal of carcasses (burial/ burning), cleaning and disinfection, restrict visitors/ vehicles, no swill feeding, surveillance of neighbouring farms, culling/ compensation per national plan", "marks": 4.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 7-year-old Jersey cross cow from a herd grazing on marshy pasture presents with progressive weight loss, lethargy and marked submandibular oedema (bottle jaw). What is the most probable diagnosis? Outline a comprehensive treatment and control plan.', 'Most probable diagnosis: chronic fasciolosis (liver fluke infestation) - grazing on marshy land (snail habitat), weight loss, anaemia and hypoproteinaemia causing bottle jaw. Confirm by faecal sedimentation for fluke eggs (and liver enzymes). Treatment: triclabendazole (effective against immature and adult flukes) or oxyclozanide/closantel/albendazole for adults; supportive feeding with good-quality forage and minerals; treat the whole herd. Control: strategic flukicide treatment of the herd at key times (e.g. before and after the monsoon); control snails - drain or fence off marshy areas, provide piped water troughs, use molluscicides or ducks where appropriate; rotational grazing away from wet pastures in high-risk seasons; avoid feeding grass cut from snail habitats; monitor with regular faecal tests and abattoir liver condemnation records; and educate farmers (also note zoonotic risk).', null, '[{"point": "Diagnosis: chronic fasciolosis (liver fluke, Fasciola hepatica/ gigantica)", "marks": 1.5}, {"point": "Treatment: triclabendazole (all stages) or oxyclozanide/ albendazole/ closantel, supportive nutrition, confirm by faecal sedimentation", "marks": 2}, {"point": "Control: strategic deworming of herd, snail control (drainage, fencing marshy areas, molluscicides/ ducks), rotational grazing, avoid wet pastures in risk season, safe water troughs, monitoring", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe the key considerations and procedures for collecting blood samples from a cattle herd, including selection of sampling kits, techniques to maintain sample integrity, and best practices for handling, labelling and storing samples before laboratory analysis.', 'Planning: define the purpose (serology, haematology, PCR, biochemistry), select animals and sample size, prepare restraint (crush/chute, halter) and PPE, and inform the owner. Kits: plain or serum-separator tubes for serum (serology), EDTA tubes for whole blood (haematology, PCR, blood parasites), heparin for some biochemistry; vacutainer holders with 18-20 G needles, alcohol swabs, cooler box with ice packs, marker pens, data sheets, sharps container. Technique: collect from the jugular or coccygeal (tail) vein after cleaning the site; use a new needle for each animal to avoid spreading disease; fill tubes to the correct volume; gently invert anticoagulant tubes; avoid haemolysis (do not shake, use proper needle size). Handling and storage: keep serum tubes upright at room temperature to clot, then cool; separate serum within 24 hours (freeze at -20 °C if delayed); keep EDTA blood at 2-8 °C and never freeze it; label each tube clearly (animal ID, farm, date, sample type) matching the submission form; use triple packaging and send quickly to the laboratory with the cold chain maintained.', null, '[{"point": "Planning: purpose (serology, haematology, PCR), sample size, restraint, consent, biosafety PPE", "marks": 1.5}, {"point": "Kits and technique: vacutainers - plain/ SST for serum, EDTA for whole blood/ haematology/ PCR, heparin; needles (18-20 G); jugular or coccygeal vein; aseptic, one needle per animal", "marks": 2}, {"point": "Integrity and handling: gentle inversion, avoid haemolysis, let serum clot upright, separate serum, cool chain 2-8 °C (freeze serum if delayed), no freezing of whole blood; labelling with ID, date, farm; submission form; triple packaging; quick transport", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Briefly explain the pathogenesis of mastitis in dairy cattle and outline the main strategies for its prevention and control in a herd.', 'Pathogenesis: bacteria enter the udder through the teat canal - contagious pathogens (Staphylococcus aureus, Streptococcus agalactiae) spread from cow to cow at milking, environmental pathogens (E. coli, Streptococcus uberis) come from dirty bedding and surroundings. They multiply in the milk ducts and alveoli, release toxins and trigger inflammation; neutrophils flood into the milk (high somatic cell count), causing swelling, pain, abnormal milk and damage to secretory tissue; infection may be clinical (visible changes) or subclinical (only raised SCC, lower yield), and severe coliform cases can cause toxaemia. Prevention and control (five-point/ten-point plan): hygienic milking - clean, dry teats, gloves, forestripping; post-milking teat disinfection (and pre-dipping); a well-maintained milking machine; prompt treatment and recording of clinical cases; dry cow therapy at drying-off (with teat sealants); culling chronically infected cows; clean, dry housing and bedding; milking infected cows last; regular California Mastitis Test or SCC monitoring; good nutrition (vitamin E, selenium); and keeping cows standing after milking (feeding them) while teat ends close.', null, '[{"point": "Pathogenesis: bacteria (contagious - Staph aureus, Strep agalactiae; environmental - E. coli, Strep uberis) enter teat canal, multiply in udder, inflammation, neutrophil influx, raised somatic cell count, tissue damage, clinical/ subclinical", "marks": 2.5}, {"point": "Prevention/ control: milking hygiene, pre/post-milking teat dip, proper milking machine, dry cow therapy, treat clinical cases, cull chronic cases, clean dry housing/ bedding, CMT/ SCC monitoring, nutrition, milk last infected cows, records (five/ ten-point plan)", "marks": 3.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Transboundary animal diseases
Transboundary animal diseases (TADs) pose a significant and ever-present threat to global animal health and food security.

a. As a veterinarian, analyse the interplay of factors contributing to the rapid emergence and spread of TADs in a globalised world. (5 marks)', 'TADs such as FMD, ASF, avian influenza, PPR and lumpy skin disease spread rapidly because: increasing legal and illegal movement of live animals, meat and products across borders (Bhutan''s long open border with India); global travel and trade; intensification with high-density farms and poor biosecurity; smallholders with low awareness and vaccination; climate change expanding vectors (ticks, midges, mosquitoes) and altering grazing; wildlife-livestock interfaces (wild boar, migratory birds); weak surveillance, diagnostics and veterinary capacity in some countries; under-reporting for fear of trade loss; and pathogen evolution. These factors interact - e.g. trade links regions while weak surveillance delays detection, allowing wide spread before control.', null, '[{"point": "Factors: trade and movement of animals/ products (legal and illegal, porous borders), travel, intensification and high-density farming, climate change/ vectors, wildlife interface, weak veterinary services/ surveillance, poverty/ smallholder biosecurity, conflict, pathogen evolution", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case1', 1, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Transboundary animal diseases
Transboundary animal diseases (TADs) pose a significant and ever-present threat to global animal health and food security.

b. Discuss the roles of communities, local veterinary services, national authorities and international organisations (WOAH, FAO) in prevention, control and possible eradication of TADs. Also discuss the economic implications of a TAD outbreak for international trade and market access. (15 marks)', 'Communities and farmers: practise biosecurity, vaccinate their animals, report sick or dead animals early, follow movement restrictions, avoid swill feeding and illegal trade; community animal health workers and village livestock groups help in surveillance and awareness. Local veterinary services (Dzongkhag and gewog livestock offices): passive and active surveillance, clinical investigation and sampling, vaccination campaigns (FMD, rabies, HS/BQ), rapid outbreak response (quarantine, ring vaccination, culling, disinfection), farmer education and data reporting. National authorities (Department of Livestock, NCAH, Bhutan Food and Drug Authority/border quarantine): legislation and regulations (Livestock Act), border control and import risk analysis, national disease control strategies and contingency plans, reference laboratories, vaccine supply, compensation schemes, coordination with health and wildlife sectors, and official reporting. International organisations: WOAH sets standards (Terrestrial Animal Health Code), recognises official disease status, collects outbreak reports through WAHIS and evaluates veterinary services (PVS); FAO provides technical and emergency support, laboratory networks and regional programmes (e.g. GF-TADs with WOAH, progressive control pathways for FMD and PPR eradication); both support capacity building and funding. Economic implications: an outbreak triggers immediate import bans by trading partners and loss of disease-free status, closing markets for animals and products for months or years; prices collapse and farmers lose income; governments bear costs of control, vaccination, culling and compensation; related sectors (feed, transport, tourism) suffer; regaining status requires costly surveillance and evidence; for small economies like Bhutan, outbreaks also affect food security and rural livelihoods.', null, '[{"point": "Communities/ farmers: biosecurity, vaccination participation, early reporting, compliance with movement controls, community animal health workers", "marks": 3}, {"point": "Local veterinary services (Dzongkhag): surveillance, diagnosis, vaccination campaigns, outbreak response, awareness, data", "marks": 3}, {"point": "National authorities (DoL, NCAH, BAFRA): legislation, border quarantine, national strategies, contingency plans, labs, compensation, coordination", "marks": 3}, {"point": "International (WOAH, FAO): standards (Terrestrial Code), official status, reporting (WAHIS), technical/ financial support, regional programmes (GF-TADs), capacity building", "marks": 3}, {"point": "Economic implications: trade bans, loss of market access/ status, price drops, control costs, livelihood loss, tourism, recovery time", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case1', 2, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
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
  values ('ME', 'passage', 'Question 2: One Health
One Health is a collaborative, multi-sectoral and trans-disciplinary approach to achieving optimal health outcomes, recognising the interconnection between people, animals, plants and their shared environment.

a. What pivotal role does the veterinary profession play in advancing the One Health paradigm? (5 marks)', 'Veterinarians are central to One Health because about 60% of emerging human infections are zoonotic. They detect and control zoonoses at the animal source (rabies, brucellosis, avian influenza), run animal disease surveillance that gives early warning for human health, ensure food safety through meat and milk inspection and residue control, promote prudent antimicrobial use against AMR, monitor wildlife and ecosystem health, take part in joint outbreak investigations with health and environment sectors, conduct research and educate farmers and the public.', null, '[{"point": "Roles: zoonoses surveillance and control (about 60% of human infections zoonotic), food safety/ meat inspection, AMR stewardship, wildlife/ ecosystem health, early warning, public health veterinarians, research, collaboration/ joint outbreak response, education", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case2', 1, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: One Health
One Health is a collaborative, multi-sectoral and trans-disciplinary approach to achieving optimal health outcomes, recognising the interconnection between people, animals, plants and their shared environment.

b. Using highly pathogenic avian influenza (HPAI H5N1) as an example, explain how a One Health approach is crucial in its surveillance, prevention and control at community, national and global levels. (15 marks)', 'Community level: farmers and households are taught biosecurity - keep poultry fenced or housed away from wild and migratory birds, clean water and feed, no mixing of new birds; report unusual bird deaths immediately; do not handle, sell or eat sick or dead birds; use protective gear when handling poultry; community animal health workers and health assistants share information. National level: a multisectoral One Health task force (Department of Livestock, Ministry of Health/RCDC, wildlife and forest departments, local government) with a joint contingency plan; integrated surveillance in poultry, wild birds and humans (influenza-like illness and SARI); shared laboratory capacity and data; rapid response - culling and safe disposal, disinfection, movement restriction zones, compensation; protection of responders with PPE, seasonal flu vaccine and antiviral prophylaxis; joint risk communication to the public; border controls on poultry imports. Global level: the FAO-WOAH-WHO-UNEP (Quadripartite) collaboration coordinates standards and response; outbreaks are reported through WOAH-WAHIS and virus sequences shared through networks such as GISAID; monitoring of migratory bird pathways; candidate vaccine viruses and pandemic preparedness; technical and financial support to countries. Working together in this way detects H5N1 earlier, prevents spread among poultry and from animals to people, reduces economic losses and lowers pandemic risk.', null, '[{"point": "Community: farmer awareness, biosecurity (separating poultry from wild birds), reporting sick/ dead birds, safe handling, no selling sick birds, community-based surveillance", "marks": 4}, {"point": "National: joint multisectoral task force (livestock, health, wildlife, environment), integrated surveillance (poultry, wild birds, ILI/SARI in humans), lab capacity, contingency plan - culling, zoning, disinfection, compensation, protection of responders (PPE, antivirals), risk communication, border controls", "marks": 6}, {"point": "Global: WOAH/ FAO/ WHO tripartite (quadripartite) coordination, data sharing (WAHIS, GISAID), standards, vaccines/ candidate viruses, migratory bird monitoring, funding", "marks": 3}, {"point": "Shows why sectors must share data and act together", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case2', 2, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 3: Aseptic technique in veterinary surgery
Aseptic technique in veterinary surgery is essential to minimise the risk of microbial contamination, thereby preventing surgical site infections that can cause significant complications and suffering in animal patients.

a. Explain the significance of aseptic technique in preventing surgical site infections, and the core principles of asepsis. (5 marks)', 'Surgical site infections cause pain, delayed healing, wound breakdown, prolonged treatment and costs, and may kill the animal or need more antibiotics (adding to AMR); aseptic technique prevents microorganisms entering the wound. Core principles: everything that contacts the wound is sterile; prepare the patient''s skin and the surgeon (scrub, gown, gloves) to reduce microbes; maintain a sterile field - sterile items touch only sterile items, and anything doubtful is considered contaminated; keep traffic and talking in the theatre to a minimum; handle tissues gently, control bleeding and minimise dead space and surgery time (Halsted''s principles).', null, '[{"point": "Significance: SSIs cause pain, delayed healing, dehiscence, cost, death, AMR", "marks": 2}, {"point": "Principles: sterile instruments/ field, prepare patient and surgeon, minimise contamination, sterile items touch only sterile, theatre discipline, gentle tissue handling (Halsted''s principles), short surgery time", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case3', 1, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C3Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C3Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C3Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C3Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C3Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 3: Aseptic technique in veterinary surgery
Aseptic technique in veterinary surgery is essential to minimise the risk of microbial contamination, thereby preventing surgical site infections that can cause significant complications and suffering in animal patients.

b. Outline the detailed steps in the preoperative preparation of both the patient and the surgeon. (12 marks)', 'Patient: clinical examination and stabilisation (fluids, correct dehydration); withhold feed (12-48 h in ruminants, less for small animals) and water as appropriate; give prophylactic antibiotics if indicated within 60 minutes of incision; clip hair widely around the site (away from the theatre); initial skin scrub to remove dirt; position and restrain or anaesthetise; final aseptic preparation with povidone-iodine or chlorhexidine scrub, working from the incision site outwards in a concentric pattern, alternating with alcohol, three times; apply sterile drapes and towel clamps to isolate the field. Surgeon: put on clean theatre clothes, cap and mask; remove jewellery; keep nails short; perform a timed surgical hand scrub (3-5 minutes) with chlorhexidine or povidone-iodine from fingertips to elbows, hands kept above elbows; dry with a sterile towel; put on a sterile gown and gloves (closed gloving technique); keep hands above waist level and in front of the body, and touch only sterile items.', null, '[{"point": "Patient: assessment, fasting (food/ water withholding, especially ruminants), stabilise, clip hair widely, initial scrub, positioning, final aseptic skin prep (povidone-iodine/ chlorhexidine, concentric pattern, alcohol), draping, prophylactic antibiotics timing, bladder/ rumen", "marks": 6}, {"point": "Surgeon: theatre attire (cap, mask, scrubs), remove jewellery, nails short, surgical hand scrub (timed, antiseptic, fingertips to elbows), dry with sterile towel, gowning, closed gloving, maintain hands above waist", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case3', 2, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C3Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C3Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C3Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C3Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C3Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 3: Aseptic technique in veterinary surgery
Aseptic technique in veterinary surgery is essential to minimise the risk of microbial contamination, thereby preventing surgical site infections that can cause significant complications and suffering in animal patients.

c. Describe the role and importance of sterilisation methods for surgical instruments. (2 marks)', 'Sterilisation destroys all microorganisms, including bacterial spores, on instruments that enter sterile tissue, preventing surgical site infection and spread of disease between animals. The method is chosen according to the material: steam autoclaving for metal instruments and linen, ethylene oxide or plasma for heat-sensitive items, dry heat for glassware, and chemical (cold) sterilisation where needed; effectiveness is checked with chemical and biological indicators.', null, '[{"point": "Sterilisation destroys all microbes including spores on instruments, preventing SSI/ cross-infection; methods (autoclave, ethylene oxide, dry heat, chemical/ cold sterilisation) chosen by material; monitoring with indicators", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case3', 3, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C3Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C3Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C3Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C3Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C3Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 3: Aseptic technique in veterinary surgery
Aseptic technique in veterinary surgery is essential to minimise the risk of microbial contamination, thereby preventing surgical site infections that can cause significant complications and suffering in animal patients.

d. What is the most commonly used and reliable sterilisation method for surgical instruments? (1 marks)', 'Moist heat under pressure - autoclaving (e.g. 121 °C at 15 psi for 15 minutes, or 134 °C for 3-4 minutes).', null, '[{"point": "Steam under pressure - autoclave (121 °C, 15 psi, 15 min or 134 °C, 3-4 min)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case3', 4, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C3Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C3Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C3Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 4: Rumenotomy
You are called to examine a 5-year-old Jersey cross cow with inappetence, tympany and swelling of the left paralumbar fossa. Clinical examination suggests ruminal tympany with a possible foreign body impaction. A decision is made to perform a rumenotomy.

a. Describe the step-by-step surgical procedure of rumenotomy in cattle, highlighting preoperative preparation, surgical approach and postoperative care. (12 marks)', 'Preoperative preparation: confirm the diagnosis (history, auscultation/percussion, metal detector); stabilise with fluids and electrolytes; relieve tympany by stomach tube or trocar if severe; withhold feed for about 24-48 hours if possible; give prophylactic broad-spectrum antibiotics, an NSAID and tetanus prophylaxis; restrain standing in a crush. Anaesthesia and approach: clip and aseptically prepare the left paralumbar fossa; local anaesthesia by proximal paravertebral block (T13, L1, L2) or inverted-L block; make a vertical skin incision of about 20-25 cm in the middle of the fossa; incise the external and internal oblique and transverse abdominal muscles and peritoneum. Rumen fixation and opening: exteriorise the rumen wall and fix it to the skin with stay sutures or a Weingarth rumenotomy frame to prevent contamination of the peritoneal cavity; incise the rumen; remove frothy or impacted contents and foreign bodies (plastic, wire, nails); explore the reticulum for penetrating foreign bodies and adhesions, and empty and refill with healthy ruminal fluid (transfaunation) if needed. Closure: close the rumen in two inverting layers (Cushing then Lembert) with absorbable suture; clean the rumen wall and remove the stay sutures; close the peritoneum and transverse muscle, then the oblique muscles, and the skin (interrupted sutures). Postoperative care: antibiotics for 3-5 days, NSAIDs for pain, fluids, gradual reintroduction of good-quality hay and water, monitor appetite, rumination, temperature and wound; insert a rumen magnet; remove skin sutures after 10-14 days.', null, '[{"point": "Preoperative: diagnosis, stabilise (fluids), relieve tympany (stomach tube/ trocar), fasting 24-48 h, antibiotics, tetanus, NSAID, restraint standing", "marks": 3}, {"point": "Anaesthesia and approach: standing, left paralumbar fossa, aseptic prep, paravertebral or inverted-L block; vertical skin incision ~20-25 cm, through muscles and peritoneum", "marks": 3}, {"point": "Rumen fixation (Weingarth frame/ stay sutures/ rumen board), incision of rumen, removal of foreign body/ contents, explore reticulum, remove metal objects, check for abscess", "marks": 3}, {"point": "Closure: rumen two layers (Cushing/ Lembert inverting), lavage, peritoneum/ muscles, skin; postop: antibiotics, NSAIDs, fluids, gradual feeding, wound care, suture removal 10-14 days, magnet", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case4', 1, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C4Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C4Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C4Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C4Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C4Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 4: Rumenotomy
You are called to examine a 5-year-old Jersey cross cow with inappetence, tympany and swelling of the left paralumbar fossa. Clinical examination suggests ruminal tympany with a possible foreign body impaction. A decision is made to perform a rumenotomy.

b. Discuss the possible complications of rumenotomy and their management. (5 marks)', 'Peritonitis from leakage of rumen contents - prevent with good fixation and closure; treat with broad-spectrum antibiotics, fluids and peritoneal lavage. Wound infection, abscess or dehiscence - aseptic technique, drainage, local wound care and antibiotics; resuture if needed. Recurrent tympany or indigestion - correct diet, transfaunation with healthy rumen fluid, rumenatorics. Adhesions and traumatic reticuloperitonitis if foreign bodies remain - thorough exploration and a magnet. Subcutaneous emphysema or seroma - usually resolves; drain if large. Shock or dehydration - fluid therapy and monitoring.', null, '[{"point": "Complications with management: peritonitis (antibiotics, lavage), wound infection/ abscess/ dehiscence (drainage, antibiotics), cannula/ rumen fistula, recurrence of tympany/ indigestion (transfaunation, diet), adhesions, subcutaneous emphysema, shock", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case4', 2, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C4Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C4Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C4Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C4Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C4Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 4: Rumenotomy
You are called to examine a 5-year-old Jersey cross cow with inappetence, tympany and swelling of the left paralumbar fossa. Clinical examination suggests ruminal tympany with a possible foreign body impaction. A decision is made to perform a rumenotomy.

c. Explain the role of rumenotomy in the overall management of ruminal tympany and foreign body syndrome, including alternative treatment options. (3 marks)', 'Rumenotomy is indicated when tympany is caused by foreign bodies (plastic, wire) or impaction that cannot be relieved medically, for recurrent or chronic bloat, and to explore and treat traumatic reticuloperitonitis; it is both diagnostic and therapeutic. Alternatives: passing a stomach tube to release free gas; trocarisation or a temporary cannula (rumenostomy) in emergencies; antifoaming agents (poloxalene, vegetable oil, dimethicone) for frothy bloat; oral magnets for metallic foreign bodies; laxatives and rumenatorics; and prevention through diet management, introducing legumes gradually and keeping plastics and wire away from grazing areas.', null, '[{"point": "Rumenotomy indicated when conservative treatment fails, foreign bodies/ impaction, chronic recurrent bloat; also diagnostic", "marks": 1.5}, {"point": "Alternatives: stomach tube, trocar and cannula, antifoaming agents (poloxalene, oils), magnets, rumen fistula, diet change, prevention (fencing, waste management)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'veterinary-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Veterinary Science): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Veterinary Science", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-vet2025-case4', 3, null, null, (select id from public.specialisations where code = 'veterinary-science'), null)
  returning id
)
insert into me_q select 'C4Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2025 from me_q where key = 'C4Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C4Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C4Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C4Q3';
commit;
