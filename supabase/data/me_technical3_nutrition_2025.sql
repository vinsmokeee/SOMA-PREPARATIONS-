-- ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'nutrition-and-dietetics', 'Nutrition and Dietetics' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'nutrition-dietetics') is null then raise exception 'unknown specialisation nutrition-dietetics'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'nutrition-dietetics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'nutrition-dietetics'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'nutrition-dietetics'), null, 2, 'Section A Part II: Short answer questions (6 questions)', 'short_answer', 1, 20, null, 'BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'nutrition-dietetics'), null, 3, 'Section B: Two compulsory case questions', 'passage', 2, 25, null, 'BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the best source of heme iron?', null, 'Chicken liver is rich in haem iron; plant foods give non-haem iron.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Beans', false, 1), ('B', 'Lentils', false, 2), ('C', 'Spinach', false, 3), ('D', 'Chicken liver', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary dietary recommendation for managing hypertension?', null, 'The DASH diet is the main dietary approach for hypertension.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase sodium intake', false, 1), ('B', 'Increase saturated fat intake', false, 2), ('C', 'Follow the DASH diet', true, 3), ('D', 'Consume high-cholesterol foods', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which macronutrient is most calorie-dense?', null, 'Fat gives 9 kcal/g, more than alcohol (7), protein or carbohydrate (4).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fat', true, 1), ('B', 'Protein', false, 2), ('C', 'Carbohydrates', false, 3), ('D', 'Alcohol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which vitamin deficiency is most associated with night blindness?', null, 'Vitamin A deficiency causes night blindness.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin A', true, 1), ('B', 'Vitamin D', false, 2), ('C', 'Vitamin E', false, 3), ('D', 'Vitamin B12', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A gluten-free diet is primarily indicated for which condition?', null, 'A gluten-free diet treats coeliac disease.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Irritable bowel syndrome', false, 1), ('B', 'Ulcerative colitis', false, 2), ('C', 'Crohn’s disease', false, 3), ('D', 'Celiac disease', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following foods is contraindicated in a patient with galactosemia?', null, 'Galactosaemia: avoid lactose/galactose, e.g. cow''s milk.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cow’s milk', true, 1), ('B', 'Soy milk', false, 2), ('C', 'Bananas', false, 3), ('D', 'Rice', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which mineral is critical in preventing neural tube defects in newborns?', null, 'Folate (folic acid) prevents neural tube defects.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Iron', false, 1), ('B', 'Folate', true, 2), ('C', 'Zinc', false, 3), ('D', 'Calcium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is the most effective intervention to prevent iodine deficiency?', null, 'Universal salt iodisation is the most effective strategy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Multivitamin distribution', false, 1), ('B', 'Promote eating seafood', false, 2), ('C', 'Universal salt iodization', true, 3), ('D', 'Iodine injection', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Stunting in children is best described as:', null, 'Stunting = low height-for-age.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Low weight for height', false, 1), ('B', 'Low height for age', true, 2), ('C', 'High BMI for age', false, 3), ('D', 'Low weight for age', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which foodborne illness is most likely in improperly prepared fermented foods?', null, 'Improperly prepared fermented or preserved foods can cause botulism.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Typhoid', false, 1), ('B', 'Salmonella', false, 2), ('C', 'Norovirus', false, 3), ('D', 'Botulism', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following macronutrients provides the most energy per gram?', null, 'Fat provides 9 kcal per gram.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Protein', false, 1), ('B', 'Fiber', false, 2), ('C', 'Fat', true, 3), ('D', 'Carbohydrate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which vitamin is most sensitive to light exposure?', null, 'Riboflavin is the vitamin most sensitive to light.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin C', false, 1), ('B', 'Riboflavin', true, 2), ('C', 'Vitamin B12', false, 3), ('D', 'Vitamin A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an essential fatty acid?', null, 'Linoleic acid (omega-6) is an essential fatty acid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oleic acid', false, 1), ('B', 'Stearic acid', false, 2), ('C', 'Linoleic acid', true, 3), ('D', 'Palmitic acid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main function of dietary fiber includes:', null, 'Fibre supports regular bowel movements.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Providing energy', false, 1), ('B', 'Supporting bowel movement', true, 2), ('C', 'Promoting calcium absorption', false, 3), ('D', 'Enhancing iron uptake', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Vitamin K is primarily required for:', null, 'Vitamin K is needed for clotting factors.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Blood clotting', true, 1), ('B', 'Wound healing', false, 2), ('C', 'Bone formation', false, 3), ('D', 'Vision', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Basal Metabolic Rate (BMR) is influenced by all of the following EXCEPT:', null, 'BMR depends on age, sex and body composition, not sleep duration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Body composition', false, 1), ('B', 'Sleep duration', true, 2), ('C', 'Gender', false, 3), ('D', 'Age', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of diet is recommended for a patient with chronic kidney disease?', null, 'Non-dialysis CKD: controlled protein and restricted potassium (and phosphate, sodium).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High-sodium diet', false, 1), ('B', 'High-protein diet', false, 2), ('C', 'Low-protein, low-potassium diet', true, 3), ('D', 'Gluten-free diet', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Glycemic Index is a measure of:', null, 'GI measures how quickly a carbohydrate food raises blood glucose.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fat content in food', false, 1), ('B', 'Blood sugar rise after carbohydrate intake', true, 2), ('C', 'Sodium content in food', false, 3), ('D', 'Protein content in food', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Enteral nutrition is preferred over parenteral nutrition because:', null, 'Enteral feeding maintains gut integrity and immunity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It maintains gut integrity', true, 1), ('B', 'It bypasses the gut', false, 2), ('C', 'It is more expensive', false, 3), ('D', 'It reduces food allergies', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Diabetic patients should aim to include which type of carbohydrates?', null, 'Complex, high-fibre carbohydrates suit diabetes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Refined carbohydrates', false, 1), ('B', 'Complex carbohydrates with fiber', true, 2), ('C', 'High GI carbohydrates', false, 3), ('D', 'Simple carbohydrates', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which food helps improve iron absorption?', null, 'Vitamin C (lemon) increases non-haem iron absorption.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Milk', false, 1), ('B', 'Tea', false, 2), ('C', 'Rice', false, 3), ('D', 'Lemon', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient recovering from surgery should have a diet rich in:', null, 'Protein supports tissue repair after surgery.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamins only', false, 1), ('B', 'Carbohydrates', false, 2), ('C', 'Proteins', true, 3), ('D', 'Fats', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The recommended daily salt intake for adults as per WHO guidelines is:', null, 'WHO: less than 5 g salt per day.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3 grams', false, 1), ('B', '8 grams', false, 2), ('C', '10 grams', false, 3), ('D', '5 grams', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a waterborne disease?', null, 'Cholera is waterborne.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tuberculosis', false, 1), ('B', 'Influenza', false, 2), ('C', 'Dengue', false, 3), ('D', 'Cholera', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following best defines food fortification?', null, 'Fortification adds nutrients during processing.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Adding nutrients to food during processing', true, 1), ('B', 'Adding flavor to food', false, 2), ('C', 'Removing calories from food', false, 3), ('D', 'Replacing fat with protein', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the recommended daily intake of protein for a patient undergoing hemodialysis?', null, 'Haemodialysis patients need about 1.2-1.5 g protein/kg/day.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.8 g/kg body weight', false, 1), ('B', '1.0 g/kg body weight', false, 2), ('C', '2.0 g/kg body weight', false, 3), ('D', '1.2-1.5 g/kg body weight', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of conducting a Hazard Analysis Critical Control Point (HACCP) plan in a foodservice operation?', null, 'HACCP prevents foodborne illness.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prevent foodborne illness', true, 1), ('B', 'Ensure nutritional adequacy', false, 2), ('C', 'Improve employee satisfaction', false, 3), ('D', 'Reduce food cost', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which lab value is most commonly monitored in iron deficiency anemia?', null, 'Serum ferritin reflects iron stores.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Serum calcium', false, 1), ('B', 'Serum albumin', false, 2), ('C', 'Serum ferritin', true, 3), ('D', 'Serum bilirubin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Refeeding syndrome is most likely to occur in:', null, 'Refeeding syndrome occurs when severely malnourished patients are fed aggressively.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A severely malnourished patient started on aggressive feeding', true, 1), ('B', 'A patient with type 1 diabetes', false, 2), ('C', 'A well-nourished patient receiving supplements', false, 3), ('D', 'A patient with high cholesterol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which hormone is primarily responsible for lowering blood glucose levels after a meal?', null, 'Insulin lowers blood glucose after meals.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cortisol', false, 1), ('B', 'Insulin', true, 2), ('C', 'Epinephrine', false, 3), ('D', 'Glucagon', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 1. Discuss the role of diet in the prevention and management of type 2 diabetes mellitus. (2.5 marks)', 'Prevention: maintaining a healthy weight (5-7% weight loss in overweight people reduces risk), a diet high in fibre, vegetables, pulses and whole grains (red rice, buckwheat), limiting sugar, sugary drinks and refined carbohydrates, choosing healthy fats, plus physical activity. Management: control the amount and type of carbohydrate (consistent portions spread through the day, low-GI foods, plate method with half vegetables), regular meal timing matched to medication, weight reduction, limiting saturated fat (butter, fatty meat) and salt to protect the heart and kidneys, avoiding alcohol and sweets, and monitoring blood glucose to adjust diet.', null, '[{"point": "Prevention: healthy weight, high fibre/ whole grains, limit sugar and refined carbs, healthy fats, activity", "marks": 1}, {"point": "Management: carbohydrate control/ consistency, low GI, regular meals, portion control, weight loss, reduce saturated fat/ salt, avoid sugary drinks and alcohol, links to medication", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 2. Discuss the nutritional management of a patient with chronic kidney disease (CKD). (2.5 marks)', 'Aims: slow progression, control symptoms and prevent malnutrition. Protein: limit to about 0.6-0.8 g/kg/day before dialysis (mostly high-quality protein), increase to 1.2 g/kg on dialysis. Energy: adequate (30-35 kcal/kg) to prevent muscle breakdown. Sodium: less than about 2 g/day to control BP and fluid. Potassium and phosphorus: restrict when levels are high (limit bananas, potatoes, dairy, processed foods; leaching vegetables; phosphate binders). Fluid restriction in later stages. Control blood glucose and lipids, and give vitamin D/iron as needed under monitoring.', null, '[{"point": "Protein control by stage (0.6-0.8 g/kg pre-dialysis, 1.2 g/kg on dialysis), adequate energy", "marks": 1}, {"point": "Restrict sodium, potassium, phosphorus as needed; fluid control; manage diabetes/ BP; vitamins; avoid malnutrition", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 3. Explain the rationale behind the DASH diet for managing hypertension. (2.5 marks)', 'DASH (Dietary Approaches to Stop Hypertension) emphasises fruits, vegetables, whole grains, low-fat dairy, legumes, nuts, fish and poultry, and limits saturated fat, red and processed meat, sugar and sodium. Rationale: it is rich in potassium, magnesium and calcium, which help blood vessels relax and the kidneys excrete sodium; high fibre and low saturated fat improve weight and lipids; with sodium restriction it reduces blood volume and pressure. Trials show DASH lowers systolic BP by about 8-14 mmHg, similar to a drug.', null, '[{"point": "DASH: rich in fruits, vegetables, whole grains, low-fat dairy, nuts/ legumes; low saturated fat, red meat, sweets, sodium", "marks": 1}, {"point": "Rationale: high potassium, magnesium, calcium, fibre help lower BP (vasodilation, natriuresis); low sodium reduces fluid volume; lowers SBP ~8-14 mmHg; weight/ lipid benefits", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 4. What dietary modifications are required for peptic ulcer disease? (2.5 marks)', 'There is no strict ''ulcer diet''; modifications are individual: eat a balanced diet with regular, small, frequent meals and avoid eating just before bed; avoid alcohol, smoking and excessive coffee/caffeine and carbonated drinks, which increase acid; limit very spicy foods (e.g. ema datshi with lots of chilli) and acidic foods if they cause pain; include fibre, fruits and vegetables; avoid milk as a ''remedy'' (it can increase acid later); and take medicines (and avoid NSAIDs) as advised - H. pylori eradication is the main treatment.', null, '[{"point": "Balanced diet, small frequent meals, avoid late-night eating", "marks": 1}, {"point": "Avoid/ limit irritants that worsen symptoms: alcohol, smoking, coffee/ caffeine, very spicy foods (chilli) and acidic foods if they cause pain; NSAIDs; individual tolerance; fibre, fruits/ vegetables allowed", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 5. Differentiate between high-density lipoprotein (HDL) and low-density lipoprotein (LDL) in terms of structure, function, health implications and dietary influences. (5 marks)', 'Structure: HDL is the smallest and densest lipoprotein, with a high proportion of protein (apolipoprotein A-I) and less cholesterol; LDL is larger, less dense and cholesterol-rich, carrying apolipoprotein B-100. Function: HDL carries excess cholesterol from tissues and artery walls back to the liver (reverse cholesterol transport); LDL delivers cholesterol from the liver to body cells. Health implications: high HDL (''good cholesterol'') protects against heart disease; high LDL (''bad cholesterol'') deposits in artery walls, causing atherosclerosis, heart attack and stroke - LDL is the main treatment target. Dietary influences: LDL rises with saturated fats (butter, ghee, fatty meat), trans fats and dietary cholesterol, and falls with soluble fibre (oats, pulses), unsaturated oils, nuts and plant sterols; HDL rises with regular exercise, weight loss, not smoking and unsaturated fats, and falls with trans fats, refined carbohydrates and obesity.', null, '[{"point": "Structure: HDL small, dense, high protein (apo A-I), low cholesterol; LDL larger, less dense, cholesterol-rich, apo B-100", "marks": 1.5}, {"point": "Function: HDL reverse cholesterol transport from tissues to liver; LDL delivers cholesterol to tissues", "marks": 1}, {"point": "Health: high HDL protective; high LDL atherogenic, CVD risk; targets", "marks": 1}, {"point": "Dietary influences: LDL raised by saturated/ trans fats, cholesterol; lowered by fibre, unsaturated fats, plant sterols; HDL raised by exercise, weight loss, unsaturated fats, not smoking; lowered by trans fats, refined carbs", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 6. Describe the steps involved in assessing a client''s nutritional needs and identifying any dietary restrictions. (5 marks)', '1. Screening with a validated tool (e.g. MUST, NRS-2002) to identify risk. 2. Full assessment (ABCD): Anthropometry - weight, height, BMI, weight change, MUAC, waist circumference; Biochemistry - haemoglobin, albumin, glucose/HbA1c, lipids, kidney and liver function, electrolytes; Clinical - medical history, diagnosis, medications, physical signs of deficiency, appetite, chewing and swallowing, bowel function; Dietary - 24-hour recall, food frequency, diet history, eating pattern, culture and food security. 3. Estimate requirements - energy (e.g. 25-35 kcal/kg), protein, fluids and micronutrients according to age, activity and condition. 4. Identify restrictions - food allergies and intolerances, disease-related restrictions (salt, potassium, sugar), drug-nutrient interactions, religious or cultural practices (vegetarian, fasting), personal preferences and texture modifications. 5. Make a nutrition diagnosis (PES statement), set goals and a care plan, and monitor and evaluate.', null, '[{"point": "ABCD assessment: anthropometry (weight, height, BMI, MUAC, waist), biochemical (Hb, albumin, glucose, lipids, renal), clinical (signs, medical history, medications), dietary (24-h recall, food frequency, diet history)", "marks": 3}, {"point": "Estimate needs (energy, protein, fluid) and identify restrictions: allergies/ intolerances, disease-related (renal, diabetes), religious/ cultural/ preferences, drug-nutrient interactions, swallowing; nutrition diagnosis (PES) and plan, screening tools (MUST)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-part2', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

1. Identify two dietary concerns based on Mr Sonam Wangchuk''s lifestyle and medical history. (2 marks)', '1. Poor glycaemic control - a diet high in refined carbohydrates with irregular meals, reflected in blood glucose 240 mg/dL and HbA1c 8.5%. 2. High saturated fat intake with overweight and sedentary lifestyle, worsening dyslipidaemia, hypertension and atherosclerosis - the cause of his ischaemic stroke (also likely high salt intake).', null, '[{"point": "Two concerns: poor glycaemic control/ hyperglycaemia (high refined carbohydrates, HbA1c 8.5%, BG 240); high saturated fat - dyslipidaemia/ atherosclerosis and stroke risk; overweight; sodium/ hypertension; irregular meals", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

2. Explain why it is important to monitor carbohydrate intake in Mr Sonam Wangchuk''s nutrition therapy. (3 marks)', 'Carbohydrate has the greatest effect on blood glucose. In the acute stroke and ICU setting, hyperglycaemia (240 mg/dL) is linked to larger brain damage, worse neurological outcome, infections and poor wound healing, while hypoglycaemia is also dangerous in an unconscious patient who cannot report symptoms. Monitoring the amount and type of carbohydrate in the tube feed (e.g. a diabetes-specific, low-GI, higher-fibre formula given continuously or at regular times) and matching it with insulin keeps glucose in the target range (about 140-180 mg/dL).', null, '[{"point": "Carbohydrate is main determinant of blood glucose; hyperglycaemia (240) worsens stroke outcome, infection, healing", "marks": 1.5}, {"point": "Consistent controlled amount in feeds matched to insulin avoids hyper/ hypoglycaemia; target 140-180 mg/dL in ICU; diabetes-specific formula", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

3. Write one PES (problem, aetiology, signs/symptoms) statement for his diabetes. (3 marks)', 'Altered nutrition-related laboratory values (blood glucose) related to a diet high in refined carbohydrates, irregular meal timing and insulin resistance, as evidenced by blood glucose of 240 mg/dL and HbA1c of 8.5%.', null, '[{"point": "Problem: e.g. altered nutrition-related laboratory values (glucose) / excessive carbohydrate intake / inconsistent carbohydrate intake", "marks": 1}, {"point": "Aetiology: related to high refined carbohydrate diet, irregular meals, insulin resistance", "marks": 1}, {"point": "Signs: as evidenced by BG 240 mg/dL, HbA1c 8.5%", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

4. Write one PES statement related to his ICU admission and feeding status. (3 marks)', 'Inadequate oral intake (inability to eat) related to unconsciousness and impaired swallowing following ischaemic stroke, as evidenced by ICU admission and the need for nasogastric tube feeding to meet nutritional needs.', null, '[{"point": "Problem: inadequate oral intake / swallowing difficulty / need for enteral nutrition", "marks": 1}, {"point": "Aetiology: related to unconsciousness after ischaemic stroke", "marks": 1}, {"point": "Signs: as evidenced by unconscious state, NG tube feeding, ICU admission", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

5. Suggest two considerations when starting nutrition support via NG tube for Mr Sonam Wangchuk. (4 marks)', '1. Requirements and formula - estimate needs (about 20-25 kcal/kg, around 1500-1800 kcal/day, protein 1.2-1.5 g/kg) and choose a diabetes-specific or standard high-fibre formula; start at a low rate and increase gradually to target within 48-72 hours, adjusting insulin to keep glucose 140-180 mg/dL. 2. Safety and tolerance - confirm tube position (pH/X-ray) before feeding, keep the head of the bed raised 30-45° to prevent aspiration pneumonia, flush the tube regularly, and monitor gastric residuals, vomiting, diarrhoea, blood glucose, electrolytes and fluid balance.', null, '[{"point": "Formula choice and requirements: diabetes-specific/ standard formula, energy ~25 kcal/kg (adjusted for overweight), protein 1.2-1.5 g/kg, fluids", "marks": 2}, {"point": "Safety: confirm tube position, head elevation 30-45° to prevent aspiration, start slowly and advance, monitor glucose, tolerance (residuals, diarrhoea), refeeding risk, electrolytes", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

6. Recommend two dietary modifications to support stroke recovery and prevent recurrence. (4 marks)', '1. Follow a DASH/Mediterranean-style heart-healthy diet: limit salt to less than 5 g/day (less suja, ezay and processed food) to control blood pressure; replace saturated fats (butter, fatty pork) with unsaturated oils, nuts and fish to lower LDL cholesterol. 2. Increase fruits, vegetables, whole grains and pulses (fibre) with controlled, consistent carbohydrate portions to improve glycaemic control and support gradual weight loss. Also: adequate protein for muscle recovery and texture-modified food if swallowing is impaired, and no alcohol or smoking.', null, '[{"point": "Two modifications with reasons: reduce sodium (<5 g salt) for BP; reduce saturated/ trans fat, increase unsaturated fats, omega-3 for lipids; increase fruits/ vegetables/ whole grains/ fibre (DASH/ Mediterranean); controlled carbohydrate/ weight loss; adequate protein for recovery; texture modification for dysphagia", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

7. Propose one strategy to improve his glycaemic control after discharge. (3 marks)', 'Give structured diabetes nutrition education to Mr Sonam Wangchuk and his family (who will prepare his food): a written meal plan using the plate method (half vegetables, a quarter protein, a quarter whole-grain carbohydrate such as red rice), three regular meals with planned snacks at consistent times matched to his medicines, limiting sweets and sugary drinks, with home blood glucose monitoring and regular follow-up with the dietitian and diabetes clinic to adjust the plan.', null, '[{"point": "One strategy explained: structured meal plan with carbohydrate counting/ plate method and regular meal times, with diabetes education for patient and family, glucose self-monitoring, medication adherence, follow-up with dietitian; physical activity as tolerated", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 7, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Nutrition support after stroke in a man with diabetes
Patient: Mr Sonam Wangchuk, 68-year-old man. Height 165 cm, weight 75 kg, BMI 27.5 kg/m² (overweight).
Medical history: type 2 diabetes mellitus, ischaemic stroke (ICU admission), hypertension, dyslipidaemia.
Current condition: unconscious and receiving nasogastric (NG) tube feeding; blood glucose 240 mg/dL; HbA1c 8.5%; creatinine normal.
Lifestyle before the stroke: sedentary; diet high in refined carbohydrates and saturated fats; poor glycaemic control and irregular meal times.

8. Identify one short-term and one long-term nutrition goal for Mr Sonam Wangchuk. (3 marks)', 'Short-term: within 3-5 days, receive at least 80-100% of estimated energy and protein needs by NG tube with blood glucose kept between 140 and 180 mg/dL and no aspiration. Long-term: over 3-6 months, achieve HbA1c below 7%, a 5-7% weight reduction and controlled BP and LDL cholesterol, and transition safely to an oral heart-healthy diabetic diet to prevent another stroke.', null, '[{"point": "Short-term: e.g. meet 80-100% of energy/ protein needs via NG within 3-5 days with BG 140-180 mg/dL, no aspiration", "marks": 1.5}, {"point": "Long-term: e.g. HbA1c < 7%, gradual 5-7% weight loss, LDL/ BP targets, safe oral diet, prevent recurrent stroke", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case1', 8, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

1. Identify two dietary concerns based on Mr Sangay Dorji''s post-operative condition. (3 marks)', '1. Inadequate oral intake - eating less than 30% of needs because of nausea and early satiety, putting him at high risk of post-operative malnutrition. 2. Increased requirements - infection and wound dehiscence raise energy and protein needs (hypermetabolism), while low albumin and haemoglobin indicate protein depletion, inflammation and anaemia (also needs for zinc, vitamin C and iron for healing).', null, '[{"point": "Inadequate energy and protein intake (<30% needs, nausea, early satiety) - risk of malnutrition", "marks": 1.5}, {"point": "Increased requirements for wound healing and infection (hypermetabolism), low albumin and anaemia - protein, micronutrients (zinc, vitamin C, iron)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 1, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

2. Explain the significance of his low albumin level for post-operative recovery. (3 marks)', 'An albumin of 2.8 g/dL (normal 3.5-5.0) indicates high risk. Albumin falls during infection and inflammation (it is a negative acute-phase protein) as well as in protein malnutrition, so it reflects illness severity more than recent intake. Low albumin is associated with poor wound healing, tissue oedema (including at the bowel anastomosis), reduced drug binding, more infections and complications, longer hospital stay and higher mortality - so it signals the need for aggressive nutrition support, monitored with weight, intake and prealbumin/CRP.', null, '[{"point": "Albumin 2.8 g/dL low (<3.5) - marker of inflammation/ illness severity and nutritional risk (negative acute phase protein), not just intake", "marks": 1.5}, {"point": "Associated with poor wound healing, oedema, infection, complications, longer stay, mortality; monitor with other markers", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 2, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

3. Discuss two potential dietary strategies to improve Mr Sangay Dorji''s nutritional status. (4 marks)', '1. Food fortification and oral nutritional supplements - offer six small, frequent, energy- and protein-dense meals and snacks (eggs, milk, curd, lentils, fortified porridge, soups with added protein), plus high-protein oral supplements 2-3 times a day; manage nausea with antiemetics, cold or bland foods and avoiding large or greasy meals. 2. Escalate nutrition support if oral intake stays below about 60% of needs for 3-5 days - nasogastric/nasojejunal enteral feeding (or parenteral nutrition if the gut cannot be used), with micronutrient supplements (zinc, vitamin C, iron, multivitamin) for wound healing.', null, '[{"point": "Strategy 1: small, frequent, energy- and protein-dense meals and snacks; oral nutritional supplements (high-protein); manage nausea (antiemetics, cold/ dry foods)", "marks": 2}, {"point": "Strategy 2: if intake remains < 60% for several days, enteral tube feeding (or parenteral if gut not usable); micronutrient support (zinc, vitamin C, iron, multivitamin)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 3, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

4. Propose a full diet plan for Mr Sangay Dorji, including energy and macronutrient calculations, to support wound healing and recovery. (10 marks)', 'Calculations (weight 64 kg): energy 30-35 kcal/kg = 1920-2240 kcal → about 2200 kcal/day. Protein 1.5-1.8 g/kg = 96-115 g → about 110 g (440 kcal, 20% of energy). Fat about 30% of energy = 660 kcal → about 73 g. Carbohydrate the remainder = 2200 - 440 - 660 = 1100 kcal → about 275 g. Fluids about 30-35 mL/kg ≈ 2-2.2 L/day (more with fever). Micronutrients: multivitamin and mineral with vitamin C, zinc and iron (for Hb 10.5).
Sample plan (six small meals, soft, low-fat, initially lower residue):
- Early morning: milk tea with milk powder added + 2 biscuits.
- Breakfast: rice or wheat porridge made with milk + 1 boiled egg + banana.
- Mid-morning: high-protein oral supplement (about 300 kcal, 15-20 g protein).
- Lunch: soft rice (1 cup) + dal (1 bowl) + chicken or fish stew (60-90 g) + cooked vegetables (pumpkin, carrot) + curd.
- Afternoon: oral supplement or milk with fortified flour porridge + egg/paneer.
- Dinner: soft rice or noodles + egg curry or minced meat + vegetable soup + fruit stewed.
- Bedtime: warm milk.
This provides about 2200 kcal and 105-115 g protein. Practical points: eat small amounts slowly, cold or room-temperature foods when nauseated, liquids between meals, antiemetics before meals; progress fibre as tolerated; monitor intake and adjust; move to tube feeding if targets are not met.', null, '[{"point": "Energy: 30-35 kcal/kg x 64 kg ≈ 1920-2240 kcal (e.g. ~2200 kcal)", "marks": 2}, {"point": "Protein: 1.5-2.0 g/kg ≈ 96-128 g (e.g. ~110 g, ~20% energy)", "marks": 2}, {"point": "Fat ~30% (~70-75 g), carbohydrate remainder (~270-300 g); fluids ~30-35 mL/kg (~2 L); micronutrients", "marks": 2}, {"point": "Meal plan: 6 small meals with local foods and supplements, distributing protein; texture/ low-residue initially as needed", "marks": 3}, {"point": "Practical points: nausea management, monitoring, progression", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 4, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

5. Identify one short-term and one long-term nutrition goal for Mr Sangay Dorji. (3 marks)', 'Short-term: within 5-7 days, meet at least 75% of estimated energy (about 2200 kcal) and protein (about 110 g) needs through food and supplements, with nausea controlled. Long-term: over the next 2-3 months, achieve complete wound healing, maintain or regain body weight, normalise albumin and haemoglobin, and be well-nourished to tolerate any further cancer treatment, then follow a healthy, high-fibre diet for colorectal cancer survivorship.', null, '[{"point": "Short-term: e.g. increase intake to ≥75% of energy and protein needs within 5-7 days; nausea controlled", "marks": 1.5}, {"point": "Long-term: e.g. complete wound healing, maintain/ regain weight, normal albumin/ Hb, tolerate oncology treatment, healthy diet for cancer survivorship", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 5, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Nutrition after colorectal surgery
Patient: Mr Sangay Dorji, 60 years. Height 168 cm, weight 64 kg, BMI 22.7 kg/m².
Surgery: right hemicolectomy for colorectal cancer. Complications: wound dehiscence and signs of infection (fever, raised CRP, high WBC).
Oral intake: less than 30% of estimated needs; nausea and early satiety. Labs: albumin 2.8 g/dL, haemoglobin 10.5 g/dL.

6. Mention one way to monitor Mr Sangay Dorji''s progress in nutritional recovery. (2 marks)', 'Keep a daily food and supplement intake chart (calorie and protein count) to check that he meets at least 75% of targets, together with weekly weight, wound healing progress and laboratory markers (prealbumin/albumin with CRP, haemoglobin) - for example prealbumin rising as CRP falls shows recovery.', null, '[{"point": "One method explained: daily food intake/ calorie count charts, weekly weight, wound healing, labs (albumin/ prealbumin, CRP, Hb), handgrip strength", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'nutrition-and-dietetics'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Nutrition and Dietetics): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Nutrition and Dietetics", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-nutri2025-case2', 6, null, null, (select id from public.specialisations where code = 'nutrition-dietetics'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
commit;
