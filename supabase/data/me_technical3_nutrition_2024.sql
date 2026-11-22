-- ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'nutrition-and-dietetics', 'Nutrition and Dietetics' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'nutrition-dietetics') is null then raise exception 'unknown specialisation nutrition-dietetics'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following amino acids is considered conditionally essential during periods of rapid growth, illness, or stress?', null, 'Glutamine becomes conditionally essential in illness, trauma and rapid growth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Leucine', false, 1), ('B', 'Methionine', false, 2), ('C', 'Glutamine', true, 3), ('D', 'Valine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which enzyme is responsible for the initial breakdown of starch in the mouth?', null, 'Salivary amylase (ptyalin) begins starch digestion in the mouth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lipase', false, 1), ('B', 'Pepsin', false, 2), ('C', 'Maltase', false, 3), ('D', 'Amylase', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which vitamin is involved in the carboxylation of glutamic acid residues on proteins required for blood clotting?', null, 'Vitamin K is the cofactor for gamma-carboxylation of glutamate residues in clotting factors II, VII, IX and X.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin K', true, 1), ('B', 'Vitamin C', false, 2), ('C', 'Vitamin E', false, 3), ('D', 'Vitamin B6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary function of the urea cycle in the liver?', null, 'The urea cycle converts toxic ammonia into urea for excretion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Synthesize fatty acids', false, 1), ('B', 'Detoxify ammonia', true, 2), ('C', 'Produce ketone bodies', false, 3), ('D', 'Convert glucose to glycogen', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which dietary pattern is most recommended for patients with chronic kidney disease to manage hyperkalemia?', null, 'Hyperkalaemia in CKD is managed with a low-potassium diet.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Low-potassium diet', true, 1), ('B', 'Low-fat diet', false, 2), ('C', 'High-fiber diet', false, 3), ('D', 'High-protein diet', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which nutrient deficiency is commonly associated with the development of microcytic anemia?', null, 'Iron deficiency causes microcytic, hypochromic anaemia (B12 and folate cause macrocytic anaemia).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin D', false, 1), ('B', 'Vitamin B12', false, 2), ('C', 'Iron', true, 3), ('D', 'Folate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the management of type 1 diabetes, what is the primary benefit of continuous glucose monitoring (CGM)?', null, 'CGM shows glucose levels and trends in real time, guiding insulin and food decisions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reducing insulin resistance', false, 1), ('B', 'Increasing physical activity levels', false, 2), ('C', 'Preventing ketoacidosis', false, 3), ('D', 'Tracking blood glucose trends in real time', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which inventory management method involves tracking the expiration dates of perishable items and using the oldest items first?', null, 'FIFO uses the oldest stock first.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'FIFO (First In, First Out)', true, 1), ('B', 'JIT (Just In Time)', false, 2), ('C', 'ABC method', false, 3), ('D', 'LIFO (Last In, First Out)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary goal of a quality improvement program in a healthcare foodservice setting?', null, 'Quality improvement in healthcare foodservice aims at better patient outcomes and satisfaction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Enhance patient outcomes', true, 1), ('B', 'Increase revenue', false, 2), ('C', 'Reduce food waste', false, 3), ('D', 'Improve employee morale', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an example of a water-soluble vitamin?', null, 'Vitamin C (and the B vitamins) are water-soluble; A, D, E and K are fat-soluble.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin E', false, 1), ('B', 'Vitamin D', false, 2), ('C', 'Vitamin A', false, 3), ('D', 'Vitamin C', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which foodborne pathogen is most commonly associated with undercooked poultry?', null, 'Salmonella (and Campylobacter) are typically linked to undercooked poultry.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Escherichia coli (E. coli)', false, 1), ('B', 'Salmonella', true, 2), ('C', 'Listeria', false, 3), ('D', 'Clostridium botulinum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary purpose of blanching vegetables before freezing them?', null, 'Blanching inactivates enzymes that would degrade colour, flavour and nutrients during frozen storage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Inactivate enzymes', true, 1), ('B', 'Improve flavour', false, 2), ('C', 'Enhance texture', false, 3), ('D', 'Increase nutrient content', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a common food additive used to prevent oxidation in processed foods?', null, 'Ascorbic acid is an antioxidant additive.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High fructose corn syrup', false, 1), ('B', 'Sodium chloride', false, 2), ('C', 'Monosodium glutamate (MSG)', false, 3), ('D', 'Ascorbic acid', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which nutrient is most susceptible to destruction during cooking and food processing?', null, 'Vitamin C is water-soluble and easily destroyed by heat, oxygen and light.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin K', false, 1), ('B', 'Vitamin D', false, 2), ('C', 'Vitamin A', false, 3), ('D', 'Vitamin C', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a randomized controlled trial, what is the primary purpose of randomization?', null, 'Randomisation reduces selection bias and confounding by balancing groups.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ensure blinding', false, 1), ('B', 'Reduce bias', true, 2), ('C', 'Increase sample size', false, 3), ('D', 'Simplify data analysis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which statistical test is used to compare the means of two independent groups?', null, 'An independent-samples t-test compares the means of two groups.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Correlation', false, 1), ('B', 'Chi-square test', false, 2), ('C', 'T-test', true, 3), ('D', 'ANOVA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main function of lipoproteins in the body?', null, 'Lipoproteins transport triglycerides and cholesterol in the blood.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maintain fluid balance', false, 1), ('B', 'Catalyze chemical reactions', false, 2), ('C', 'Store vitamins', false, 3), ('D', 'Transport fats and cholesterol', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which nutrient deficiency is commonly observed in Bhutan due to limited dietary diversity and reliance on staple foods like rice and maize?', null, 'Iron deficiency anaemia is a major public health problem in Bhutan, linked to diets based on cereals with little animal food.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Iron', true, 1), ('B', 'Vitamin A', false, 2), ('C', 'Calcium', false, 3), ('D', 'Vitamin C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the most appropriate initial step in assessing a patient with suspected malnutrition in a clinical setting?', null, 'Assessment starts with gathering data such as a comprehensive diet history/ recall before any plan or prescription; albumin is not a reliable marker of nutritional status.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prescribing a high-protein diet', false, 1), ('B', 'Measuring serum albumin levels', false, 2), ('C', 'Conducting a comprehensive dietary recall', true, 3), ('D', 'Initiating a nutrition care plan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What disease is caused by SARS-CoV-2?', null, 'SARS-CoV-2 causes COVID-19.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Severe Acute Respiratory Syndrome (SARS)', false, 1), ('B', 'H1N1 Influenza', false, 2), ('C', 'COVID-19', true, 3), ('D', 'Middle East Respiratory Syndrome (MERS)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Increased susceptibility to infection is a clinical impact of', null, 'Malnutrition weakens the immune system, increasing susceptibility to infection.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Immune system', true, 1), ('B', 'Neurological effects', false, 2), ('C', 'Endocrine system', false, 3), ('D', 'Gastrointestinal system', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Breast milk has almost no amount of', null, 'Breast milk contains almost no fluoride.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Magnesium', false, 1), ('B', 'Fluoride', true, 2), ('C', 'Iron', false, 3), ('D', 'Potassium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An index used to measure stunting or chronic malnutrition', null, 'Low height-for-age indicates stunting (chronic malnutrition).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'MUAC for age, sex and height', false, 1), ('B', 'Weight for age', false, 2), ('C', 'Height for age', true, 3), ('D', 'Weight for height or length', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 1. Describe key differences between Type 1 and Type 2 diabetes. (2.5 marks)', 'Type 1 diabetes is caused by autoimmune destruction of the pancreatic beta cells, giving absolute insulin deficiency; it usually starts in children or young adults, often lean, with abrupt onset and a tendency to ketoacidosis, and always needs insulin. Type 2 diabetes is caused by insulin resistance with relative insulin deficiency; it usually occurs in adults, is strongly linked to obesity, inactivity and family history, develops gradually (often found on screening), rarely causes ketoacidosis, and is managed with diet, physical activity and oral drugs, with insulin later if needed. It accounts for about 90% of diabetes.', null, '[{"point": "Type 1: autoimmune destruction of beta cells, absolute insulin deficiency, usually young, lean, abrupt onset, ketoacidosis prone, needs insulin", "marks": 1.5}, {"point": "Type 2: insulin resistance with relative deficiency, adults/ obesity, gradual, strong lifestyle/ family link, managed by diet, exercise, oral drugs, later insulin", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 2. Discuss the impact of insulin on glucose metabolism in the body. (2.5 marks)', 'Insulin, released by beta cells after a meal, lowers blood glucose. It increases glucose uptake into muscle and adipose tissue by moving GLUT4 transporters to the cell membrane; stimulates glycogen synthesis (glycogenesis) in liver and muscle and glucose use (glycolysis); inhibits glycogen breakdown (glycogenolysis) and new glucose production (gluconeogenesis) in the liver; and promotes conversion of excess glucose to fat while inhibiting lipolysis and ketone formation, and promotes protein synthesis. Lack of insulin or resistance to it causes hyperglycaemia.', null, '[{"point": "Increases glucose uptake into muscle and fat (GLUT4), glycogenesis in liver/ muscle, glycolysis", "marks": 1.5}, {"point": "Inhibits glycogenolysis and gluconeogenesis; promotes fat and protein synthesis, inhibits lipolysis/ ketogenesis → lowers blood glucose", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 3. Explain the role of dietary fibre in health. (2.5 marks)', 'Dietary fibre is the part of plant foods that human enzymes cannot digest. Soluble fibre (oats, barley, pulses, fruits such as apples) forms a gel in the gut; insoluble fibre (wheat bran, whole grains, vegetables, red rice) adds bulk. Roles: increases stool bulk and speeds transit, preventing constipation, haemorrhoids and diverticular disease; soluble fibre binds bile acids and lowers LDL cholesterol; slows glucose absorption, improving blood sugar control in diabetes; increases satiety, helping weight control; is fermented by gut bacteria to short-chain fatty acids that nourish the colon and support a healthy microbiota; and is linked to lower risk of colorectal cancer and heart disease. Adults need about 25-30 g a day, with adequate fluid.', null, '[{"point": "Types: soluble (oats, pulses, fruit - forms gel) and insoluble (bran, whole grains, vegetables - adds bulk)", "marks": 1}, {"point": "Benefits: prevents constipation/ diverticular disease, lowers LDL cholesterol, slows glucose absorption (diabetes), satiety/ weight control, feeds gut bacteria (short-chain fatty acids), lower colorectal cancer risk; recommended ~25-30 g/day", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 4. Explain the role of gut microbiota in the development of obesity. (2.5 marks)', 'The gut microbiota can influence obesity in several ways. An altered microbial balance (dysbiosis - for example a higher Firmicutes to Bacteroidetes ratio, reported in some studies) increases the energy harvested from food by fermenting undigested carbohydrates into short-chain fatty acids, and promotes fat storage (e.g. by suppressing an inhibitor of lipoprotein lipase). Dysbiosis can increase gut permeability, letting bacterial endotoxin (lipopolysaccharide) into the blood, causing low-grade inflammation and insulin resistance. Microbes also affect appetite and satiety hormones (GLP-1, PYY) and bile acid metabolism. Transferring microbiota from obese mice to germ-free mice increased fat gain. Diet shapes the microbiota: high-fibre, plant-rich diets support beneficial bacteria, while high-fat, high-sugar diets promote dysbiosis.', null, '[{"point": "Dysbiosis (e.g. altered Firmicutes:Bacteroidetes) increases energy harvest from food via fermentation to short-chain fatty acids, fat storage", "marks": 1.5}, {"point": "Increased gut permeability/ endotoxin (LPS) → low-grade inflammation, insulin resistance; effects on appetite hormones (GLP-1, PYY); diet (high fibre) shapes microbiota", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 5. Discuss the nutritional management of a patient with acute and chronic liver disease (e.g. cirrhosis). (5 marks)', 'Goals: prevent and treat malnutrition and muscle wasting (very common in cirrhosis), support liver regeneration, and prevent complications such as ascites, hepatic encephalopathy and hypoglycaemia; complete abstinence from alcohol. Energy: about 30-35 kcal/kg/day. Protein: 1.2-1.5 g/kg/day - protein should not be restricted even in hepatic encephalopathy; spread it through the day and use vegetable and dairy proteins, with branched-chain amino acid supplements if intolerant. Meal pattern: small, frequent meals (4-6 a day) and a late-evening carbohydrate-rich snack to shorten overnight fasting and reduce muscle breakdown. Sodium: restrict to about 2 g a day (no added salt, avoid salty processed foods) for ascites and oedema; restrict fluid only when there is severe hyponatraemia. Micronutrients: replace thiamine (especially in alcohol use), folate, zinc, vitamin D and other deficiencies. Soft foods for those with oesophageal varices; oral nutritional supplements or tube feeding if oral intake is inadequate. Monitor weight (allowing for fluid), muscle mass, intake and laboratory values.', null, '[{"point": "Goals: prevent/ treat malnutrition and muscle wasting, support liver regeneration, prevent complications (ascites, encephalopathy, hypoglycaemia); stop alcohol", "marks": 1}, {"point": "Energy 30-35 kcal/kg; protein 1.2-1.5 g/kg (do not restrict protein in encephalopathy; vegetable/ dairy protein, BCAA if intolerant); small frequent meals and late-evening carbohydrate snack", "marks": 2}, {"point": "Sodium restriction (<2 g/day) for ascites/ oedema, fluid restriction only if severe hyponatraemia; vitamins and minerals (thiamine, folate, zinc, vitamin D), soft foods if varices, monitoring weight/ muscle, enteral feeding if intake poor", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 6. Describe the process and significance of using the Nutrition Care Process (NCP) in dietetic practice. (5 marks)', 'The Nutrition Care Process is a systematic, standardised four-step framework for providing nutrition care: (1) Nutrition assessment - collecting and interpreting data on anthropometry, biochemical tests, clinical findings, diet history and client history (often after screening and referral); (2) Nutrition diagnosis - identifying the specific nutrition problem that dietetics can treat, written as a PES statement (Problem related to Etiology as evidenced by Signs/Symptoms); (3) Nutrition intervention - planning and implementing actions (food and nutrient delivery, education, counselling, coordination of care) aimed at the cause of the problem; (4) Nutrition monitoring and evaluation - measuring progress against goals and outcome indicators and revising the plan. Significance: it promotes critical thinking and evidence-based practice, provides consistent quality care, uses standard terminology for clear documentation and communication across the team, allows outcomes to be measured and researched, and demonstrates the value and accountability of dietitians.', null, '[{"point": "Steps: (1) nutrition assessment (ABCDE - anthropometry, biochemical, clinical, dietary, client history); (2) nutrition diagnosis (PES statement); (3) nutrition intervention (planning and implementation); (4) nutrition monitoring and evaluation; screening/ referral before", "marks": 3}, {"point": "Significance: systematic, standardised, evidence-based, critical thinking, standard terminology (IDNT), documentation and communication, outcome measurement, quality and accountability", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-part2', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

1. Identify two dietary concerns based on Mr. Dorji Tshering''s current diet. (2 marks)', '1. High intake of red meat - excess protein increases the workload on his damaged kidneys and urea production, and red meat is high in purines, raising uric acid and gout attacks. 2. High intake of salty foods - raises blood pressure and fluid retention, speeding CKD progression. (Also: low fruit and vegetable intake gives little fibre, vitamins and antioxidants.)', null, '[{"point": "High red meat: excess protein (CKD load) and purines (gout)", "marks": 1}, {"point": "High salt: worsens hypertension/ fluid retention and CKD; low fruit/ vegetables - low fibre/ antioxidants", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

2. Explain why it is important to monitor Mr. Dorji Tshering''s protein intake given his chronic kidney disease. (3 marks)', 'Breakdown of protein produces urea and other nitrogenous wastes, which the kidneys at stage 3 cannot clear well, leading to uraemia. A high protein intake also increases glomerular pressure (hyperfiltration), speeding the decline of kidney function, and adds phosphorus and acid load. Monitoring allows a moderate restriction - about 0.55-0.8 g/kg/day, i.e. roughly 40-55 g/day for his 70 kg, with at least half from high biological value sources - while avoiding too little protein, which would cause muscle wasting and malnutrition in an older man.', null, '[{"point": "Protein metabolism produces urea/ nitrogenous wastes the failing kidney cannot excrete → uraemia; high protein causes hyperfiltration and faster decline; also phosphorus/ acid load", "marks": 2}, {"point": "Too little causes muscle wasting/ malnutrition; target 0.55-0.8 g/kg (≈40-55 g/day), half high biological value", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

3. Write one PES (Problem, Etiology, Signs/Symptoms) statement for Mr. Dorji Tshering''s chronic kidney disease. (3 marks)', 'Excessive protein intake related to food preferences and lack of knowledge about protein needs in chronic kidney disease, as evidenced by a diet history high in red meat and a diagnosis of CKD stage 3. (Alternative: Excessive sodium intake related to frequent consumption of salty foods, as evidenced by diet history and hypertension with CKD stage 3.)', null, '[{"point": "Correct PES format: Problem (e.g. excessive protein intake / excessive sodium intake) related to etiology (food- and nutrition-related knowledge deficit, preference for red meat/ salty foods) as evidenced by signs (diet history high in red meat/ salty foods, CKD stage 3, hypertension)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

4. Write one PES statement related to his gout. (3 marks)', 'Excessive intake of purine-rich foods (excessive bioactive substance intake) related to limited knowledge of the link between diet and gout, as evidenced by frequent red meat intake in the diet history and a diagnosis of gout. (Alternative: Food- and nutrition-related knowledge deficit related to no previous nutrition education, as evidenced by a diet high in red meat despite gout.)', null, '[{"point": "Correct PES: Problem (e.g. excessive intake of purine-rich foods / food- and nutrition-related knowledge deficit) related to etiology (frequent red meat, lack of knowledge about purines) as evidenced by signs (diet history, gout diagnosis/ raised uric acid)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

5. Suggest two dietary changes to help manage Mr. Dorji Tshering''s chronic kidney disease. (4 marks)', '1. Reduce protein to about 0.6-0.8 g/kg/day (about 40-55 g/day): eat smaller portions of meat (a palm-sized portion once a day), replace red meat with eggs, fish or chicken, and fill the plate with rice, vegetables and other low-protein foods. 2. Reduce sodium to less than 2 g a day (about one teaspoon of salt): cook with less salt, avoid salty snacks, pickles, processed and dried salted meats, instant noodles and salty cheese, and flavour food with herbs, ginger, garlic, chilli and lemon. (If potassium or phosphorus rise, these will also need limiting.)', null, '[{"point": "Reduce protein to about 0.6-0.8 g/kg (≈ 40-55 g/day): smaller portions of meat, replace some red meat with eggs, fish, chicken, legumes in moderation", "marks": 2}, {"point": "Reduce sodium to <2 g/day (≈5 g salt): cook with less salt, avoid salty snacks, pickles, processed meats, instant noodles, salty cheese/ suja; use herbs, spices, lemon", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

6. Recommend two dietary changes to help manage Mr. Dorji Tshering''s gout. (4 marks)', '1. Limit purine-rich foods - red meat, organ meats (liver, kidney), meat extracts and gravies, and shellfish and oily fish - replacing them with low-fat milk and curd (which lower uric acid), eggs and moderate plant proteins. 2. Avoid alcohol, especially beer and spirits such as ara, and sugar-sweetened drinks high in fructose, which increase uric acid; drink adequate water (about 2 litres a day, unless the doctor restricts fluids for his kidneys) to help excrete uric acid, and avoid crash dieting or fasting.', null, '[{"point": "Limit purine-rich foods: red meat, organ meats, shellfish/ some fish, meat gravies; choose low-fat dairy, plant proteins in moderation", "marks": 2}, {"point": "Avoid alcohol (especially beer, ara) and sugary drinks/ fructose; drink plenty of fluids (as kidney function allows); maintain weight", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

7. Propose one strategy to increase Mr. Dorji Tshering''s intake of fruits and vegetables. (3 marks)', 'Use the ''half-plate'' method: at lunch and dinner fill half his plate with vegetables (e.g. cabbage, beans, cauliflower, cucumber, green leaves cooked with less salt), and replace salty snacks with a piece of fruit between meals (e.g. apple, pear, guava or a few slices of papaya). Because he has CKD, choose lower-potassium options and soak and boil high-potassium vegetables (potatoes) if blood potassium is raised, and involve the person who cooks for him.', null, '[{"point": "A practical strategy explained, e.g. half-plate vegetables at each meal, add vegetables to curries/ soups, fruit as snack replacing salty snacks; choose lower-potassium options (apple, pear, cabbage, beans) because of CKD", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 7, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Mr. Dorji Tshering
Patient information: 65-year-old man; height 170 cm; weight 70 kg; BMI 24.2 kg/m² (normal weight).
Medical history: chronic kidney disease (stage 3); hypertension; gout.
Lifestyle: moderate physical activity, enjoys walking; diet high in red meats and salty foods, and low in fruits and vegetables.

8. Identify one short-term and one long-term goal for Mr. Dorji Tshering''s nutrition care plan. (3 marks)', 'Short-term: within 2-4 weeks, limit red meat to small portions (no more than 3 times a week), keep salt below one teaspoon a day, and include vegetables at two meals daily. Long-term: over 6-12 months, keep his BP below 130/80 mmHg, slow CKD progression (stable eGFR), keep serum uric acid below 6 mg/dL with no gout attacks, and maintain a healthy weight and good nutritional status.', null, '[{"point": "Short-term: e.g. within 2-4 weeks reduce red meat to small portions and sodium to <2 g/day, add vegetables to meals", "marks": 1.5}, {"point": "Long-term: e.g. over 6-12 months maintain BP <130/80, stable eGFR, uric acid <6 mg/dL, no gout flares, healthy weight", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case1', 8, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

1. Identify two dietary concerns based on Ms. Yeshi Choden''s current diet. (3 marks)', '1. High intake of refined carbohydrates and sugary snacks - causes rapid rises in blood glucose and insulin, worsening insulin resistance, which drives PCOS symptoms and her prediabetes. 2. Low fruit and vegetable intake - gives little fibre, vitamins, minerals and antioxidants, which help glucose control, weight and heart health. (Also: alcohol adds empty calories and can affect blood sugar and anxiety.)', null, '[{"point": "High refined carbohydrates and sugary snacks: worsen insulin resistance, PCOS and prediabetes", "marks": 1.5}, {"point": "Low fruit and vegetable intake (low fibre, micronutrients); alcohol adds empty calories", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

2. Explain the significance of Ms. Yeshi Choden''s HbA1c level in the context of her family history of type 2 diabetes. (3 marks)', 'An HbA1c of 5.7% reflects her average blood glucose over the past 2-3 months and lies in the prediabetes range (5.7-6.4%); her fasting glucose of 102 mg/dL also shows impaired fasting glucose (100-125). Combined with a family history of type 2 diabetes and PCOS, which involves insulin resistance, she is at high risk of developing type 2 diabetes (and gestational diabetes in pregnancy). This is an important warning: lifestyle changes - healthy diet, physical activity and avoiding weight gain - can prevent or delay diabetes (by about 58% in prevention trials), and she needs yearly monitoring.', null, '[{"point": "HbA1c 5.7% = prediabetes (5.7-6.4%), with fasting glucose 102 (impaired fasting glucose 100-125); reflects 2-3 months average glucose", "marks": 1.5}, {"point": "With family history and PCOS (insulin resistance) high risk of progressing to type 2 diabetes; lifestyle changes can prevent/ delay (≈58%); needs regular monitoring", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

3. Discuss two potential dietary strategies to help manage Ms. Yeshi Choden''s polycystic ovary syndrome (PCOS). (4 marks)', '1. Low glycaemic index, high-fibre carbohydrate pattern: replace white rice, sweets, biscuits and sugary drinks with whole grains (red rice, buckwheat, oats), legumes and plenty of vegetables, and spread carbohydrates evenly through the day. This lowers post-meal glucose and insulin; lower insulin reduces ovarian androgen production and can improve cycle regularity and ovulation. 2. Balanced, anti-inflammatory meals: include lean protein at each meal (eggs, fish, chicken, dal, tofu), healthy fats (nuts, seeds, oily fish, vegetable oils rich in omega-3 and mono-unsaturated fats) and limit saturated fat and alcohol - similar to a Mediterranean pattern. This improves satiety, insulin sensitivity and lipids, and helps maintain a healthy weight.', null, '[{"point": "Low glycaemic index, high-fibre carbohydrates (whole grains, red rice, legumes, vegetables) and reduced refined sugar → lower insulin, improved ovulation/ androgens", "marks": 2}, {"point": "Balanced meals with lean protein and healthy fats (anti-inflammatory/ Mediterranean pattern, omega-3), regular meal timing, limit alcohol; maintain weight", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

4. Propose a full diet plan for Ms. Yeshi Choden that addresses her PCOS, prediabetic status and lifestyle. Include calculations of her estimated daily calorie requirements and macronutrient distribution (carbohydrates, proteins and fats) based on these needs. (10 marks)', 'Energy (Mifflin-St Jeor for women): BMR = 10 x 60 + 6.25 x 160 - 5 x 30 - 161 = 600 + 1000 - 150 - 161 = 1289 kcal. Activity factor 1.55 (moderately active, yoga 3 times a week): 1289 x 1.55 ≈ 2000 kcal/day. Her BMI is normal, so this is for weight maintenance (a small deficit of about 200 kcal can be used if she gains weight).
Macronutrients (2000 kcal): carbohydrate 45% = 900 kcal = 225 g (mainly low-GI, high-fibre); protein 20% = 400 kcal = 100 g (about 1.7 g/kg); fat 35% = 700 kcal ≈ 78 g (mostly unsaturated, saturated fat below 10%); fibre at least 25-30 g; added sugar below 5% of energy.
Sample day:
- Breakfast: oats or buckwheat porridge made with low-fat milk + 1 boiled egg + a handful of nuts.
- Mid-morning: 1 apple or guava + green tea.
- Lunch: 1 cup red rice + dal + chicken or fish curry (palm-sized) + half plate of vegetables (ema datshi with little cheese, beans, spinach) + salad.
- Afternoon: plain curd with seeds, or roasted chickpeas.
- Dinner: 1 cup red rice or 2 whole-wheat chapatis + egg or paneer or tofu curry + mixed vegetables + vegetable soup.
- Bedtime (if hungry): warm low-fat milk without sugar.
Guidance: no sugary snacks, biscuits or sweet drinks; drink water; limit alcohol (preferably avoid); eat regular meals; continue yoga and add 150 minutes a week of brisk walking, plus stress management for her anxiety.', null, '[{"point": "Energy: Mifflin-St Jeor BMR = 10(60) + 6.25(160) - 5(30) - 161 = 1289 kcal; x 1.55 (moderately active) ≈ 2000 kcal (maintenance; or ~1800-2000)", "marks": 3}, {"point": "Macronutrients e.g. carbohydrate 45% (≈225 g, low GI), protein 20% (≈100 g), fat 35% (≈78 g, mainly unsaturated), fibre ≥25-30 g", "marks": 3}, {"point": "Sample day: meals and snacks with whole grains, vegetables, lean protein, fruit, healthy fats, no sugary snacks, limited alcohol; practical/ cultural foods", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

5. Identify one short-term and one long-term nutritional goal for Ms. Yeshi Choden. (3 marks)', 'Short-term: within 4 weeks, stop sugary snacks (replace with fruit, nuts or curd), switch to whole grains at least once a day, and eat at least 5 servings of vegetables and fruit daily. Long-term: within 6-12 months, return HbA1c to below 5.7% and fasting glucose below 100 mg/dL, improve lipid levels, achieve more regular menstrual cycles and maintain a healthy weight.', null, '[{"point": "Short-term: e.g. within 4 weeks replace sugary snacks with fruit/ nuts and eat ≥5 servings of vegetables and fruit daily", "marks": 1.5}, {"point": "Long-term: e.g. within 6-12 months bring HbA1c below 5.7% and fasting glucose below 100 mg/dL, regular cycles, maintain healthy weight", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: Ms. Yeshi Choden
Patient information: 30-year-old woman; height 160 cm; weight 60 kg; BMI 23.4 kg/m² (normal weight).
Medical history: polycystic ovary syndrome (PCOS); irregular menstrual cycles; history of mild anxiety; family history of type 2 diabetes.
Lifestyle: moderately active, practises yoga 3 times a week; diet high in refined carbohydrates and sugary snacks; drinks alcohol occasionally (1-2 drinks per week); limited fruit and vegetable intake.
Laboratory results: fasting blood glucose 102 mg/dL; HbA1c 5.7%; total cholesterol 190 mg/dL; LDL 120 mg/dL; HDL 45 mg/dL; triglycerides 140 mg/dL.

6. Mention one way to monitor Ms. Yeshi Choden''s progress in managing her PCOS and prediabetic status. (2 marks)', 'Repeat her HbA1c and fasting blood glucose every 3-6 months to check that they return to the normal range, together with a record of her menstrual cycles, weight and waist circumference, and a food diary reviewed at follow-up visits.', null, '[{"point": "One method explained: repeat HbA1c/ fasting glucose every 3-6 months; or food diary, weight/ waist, menstrual cycle record", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2024-case2', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Deficiency of which vitamin causes night blindness?', null, 'Vitamin A is needed for rhodopsin in the retina.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin D', false, 1), ('B', 'Vitamin A', true, 2), ('C', 'Vitamin C', false, 3), ('D', 'Vitamin B1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How much energy does 1 g of fat provide?', null, 'Fat gives about 9 kcal/g; carbohydrate and protein about 4 kcal/g; alcohol 7 kcal/g.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12 kcal', false, 1), ('B', '9 kcal', true, 2), ('C', '4 kcal', false, 3), ('D', '7 kcal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Kwashiorkor is mainly associated with a diet deficient in', null, 'Kwashiorkor: protein deficiency with oedema; marasmus: deficiency of both energy and protein.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'fat-soluble vitamins only', false, 1), ('B', 'iodine', false, 2), ('C', 'protein, with relatively adequate energy', true, 3), ('D', 'vitamin C', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which mineral is an essential part of thyroid hormones?', null, 'Thyroxine (T4) and triiodothyronine (T3) contain iodine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zinc', false, 1), ('B', 'Iodine', true, 2), ('C', 'Calcium', false, 3), ('D', 'Iron', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
