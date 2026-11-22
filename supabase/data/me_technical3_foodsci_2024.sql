-- ME Paper III (Technical, Food Science): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'food-science', 'Food Science' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'food-science') is null then raise exception 'unknown specialisation food-science'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the name of water that is trapped in a crystal?', null, 'Water held in crystals (water of crystallisation) is bound water, not available for microbes or reactions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bound water', true, 1), ('B', 'Adsorbed water', false, 2), ('C', 'Free water', false, 3), ('D', 'Absorbed water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'After slaughtering the stored glycogen in animal is converted into:', null, 'After slaughter, glycogen is broken down anaerobically to lactic acid, lowering meat pH.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Citric acid', false, 1), ('B', 'Glucose', false, 2), ('C', 'Lactic acid', true, 3), ('D', 'Acetic acid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an example for hermetic packaging?', null, 'Cans are hermetically sealed - airtight against gases and microbes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cans', true, 1), ('B', 'Wood baskets', false, 2), ('C', 'Nets', false, 3), ('D', 'Polyethylene cover', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The process of separation of suspended particle from fluid by passing it through a porous medium is:', null, 'Filtration separates suspended particles by passing the fluid through a porous medium.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sedimentation', false, 1), ('B', 'Filtration', true, 2), ('C', 'Extraction', false, 3), ('D', 'Centrifugation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Development of unstable fat crystal on the surface of chocolate is called:', null, 'Fat bloom is the greyish-white layer of unstable fat crystals on chocolate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fat crack', false, 1), ('B', 'Fat dot', false, 2), ('C', 'Fat bloom', true, 3), ('D', 'Fat blush', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which from the following is a primary additive used in whole egg mayonnaise.', null, 'Mayonnaise is an oil-in-water emulsion stabilised by egg yolk lecithin - an emulsifier.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Humectant', false, 1), ('B', 'Emulsifier', true, 2), ('C', 'Acidulant', false, 3), ('D', 'Antioxidant', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The yellow coloration of milk fat is due to the presence of:', null, 'Carotenoids (mainly β-carotene) from the feed give milk fat its yellow colour.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anthocyanin', false, 1), ('B', 'Curcumin', false, 2), ('C', 'Chlorophyl', false, 3), ('D', 'Carotenoid', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two different type of fermentation is involved in the production of:', null, 'Vinegar needs alcoholic fermentation by yeast, then acetic fermentation by Acetobacter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vinegar', true, 1), ('B', 'Yoghurt', false, 2), ('C', 'Wine', false, 3), ('D', 'Pickle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the third HACCP step?', null, 'HACCP principles: 1 hazard analysis, 2 determine CCPs, 3 establish critical limits.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Set critical limit', true, 1), ('B', 'Conduct hazard analysis', false, 2), ('C', 'Determine Critical Control Points', false, 3), ('D', 'Establish a monitoring system', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Controlled Atmosphere storage for apples, the recommended oxygen content in the cold storage room should be:', null, 'Apples are commonly stored at low oxygen (about 2-3%) in controlled atmosphere.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6%', false, 1), ('B', '5%', false, 2), ('C', '3%', true, 3), ('D', '4%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Food heats up in a microwave oven primarily due to vibration of:', null, 'Microwaves make water molecules (dipoles) rotate and vibrate, generating heat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Protein', false, 1), ('B', 'Water', true, 2), ('C', 'Carbohydrate', false, 3), ('D', 'Fat', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A food that contains 3 grams of fat, 4 grams of protein and 5 grams of carbohydrate would have calories equal to:', null, '3 x 9 + 4 x 4 + 5 x 4 = 27 + 16 + 20 = 63 kcal.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '48', false, 1), ('B', '63', true, 2), ('C', '83', false, 3), ('D', '68', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What happens to the boiling point of water when it is heated at high altitudes?', null, 'Lower air pressure at altitude lowers the boiling point of water.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It stays the same', false, 1), ('B', 'Water doesn’t boil at high altitude', false, 2), ('C', 'It increases', false, 3), ('D', 'It decreases', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Degumming is an initial purification stage of refining process in oil to remove:', null, 'Degumming removes phosphatides (gums) such as lecithin.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Free fatty acid', false, 1), ('B', 'Dirt', false, 2), ('C', 'Phosphatides', true, 3), ('D', 'Water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Adulteration of wheat flour with sand and stones can be inferred by:', null, 'Acid-insoluble ash is mainly silica, showing sand or dirt.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crude fibre', false, 1), ('B', 'Total Ash', false, 2), ('C', 'Total Solids', false, 3), ('D', 'Acid Insoluble Ash', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A toxin commonly found in corn and peanuts is:', null, 'Aflatoxins from Aspergillus moulds contaminate maize and groundnuts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Protease', false, 1), ('B', 'Aflatoxins', true, 2), ('C', 'Goitrogens', false, 3), ('D', 'Solanine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following pertains to the misuse of additives:', null, 'Additives must not be used to deceive consumers, disguise faulty processing or hide inferior raw materials.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To disguise the use of faulty processing and handling techniques', false, 1), ('B', 'All of the above', true, 2), ('C', 'To deceive the consumers into a false sense of assurance on the sensory attributes', false, 3), ('D', 'To disguise the use of inferior quality of raw materials', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which among the following is NOT a change that take place during baking?', null, 'Baking loses moisture by evaporation; moisture adsorption is not a baking change.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Moisture adsorption', true, 1), ('B', 'Starch gelatinization', false, 2), ('C', 'Dough-crumb transition', false, 3), ('D', 'Gas vaporization with increase in temperature', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '______ interaction between muscle proteins is responsible for muscle contraction.', null, 'Actin and myosin form actomyosin during contraction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Collagen', false, 1), ('B', 'Globulin', false, 2), ('C', 'Actomyosin', true, 3), ('D', 'Elastin', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is stated by the First Law of Thermodynamics?', null, 'Energy cannot be created or destroyed, only converted (conservation of energy).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The organization of the universe is steadily increasing', false, 1), ('B', 'Energy can be created or destroyed by physical processes', false, 2), ('C', 'Entropy always increases', false, 3), ('D', 'Energy cannot be created or destroyed', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following food ingredient can be used for both emulsification and aeration:', null, 'Egg emulsifies (yolk lecithin) and aerates (white proteins form foams).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Egg', true, 1), ('B', 'Vinegar', false, 2), ('C', 'Corn flour', false, 3), ('D', 'Flour', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Fibre is a type of', null, 'Dietary fibre is a carbohydrate (non-starch polysaccharides) that humans cannot digest.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sugar', false, 1), ('B', 'Fat', false, 2), ('C', 'Protein', false, 3), ('D', 'Carbohydrate', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per the Bhutan Mandatory Standard for Labelling of Prepackaged Food (BMS-12:2017), exemption from mandatory labeling requirement relating to ingredient declaration applies when:', null, 'Small units with a largest surface area below 10 cm² may be exempt from listing ingredients (as in Codex).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Irradiated food', false, 1), ('B', 'Functional food', false, 2), ('C', 'Small units where the package surface area is less than 10cm2', true, 3), ('D', 'Quantity of food is less than 250gm/ml.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To control crystal size when making candy, an interfering agent such as ______ is added.', null, 'Cream of tartar (or corn syrup) interferes with sucrose crystallisation, keeping crystals small.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cream of tartar', true, 1), ('B', 'Salt', false, 2), ('C', 'Sugar', false, 3), ('D', 'Water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Non-essential amino acids are:', null, 'Non-essential amino acids can be made by the body, so they need not come from food.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Naturally produced in animals and can be found in meant', false, 1), ('B', 'Naturally produced by the human body', true, 2), ('C', 'All of the above', false, 3), ('D', 'Not essential for the body', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Viscoelastic nature of wheat dough is due to', null, 'Gliadin gives extensibility and glutenin elasticity: together gluten gives viscoelastic dough.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gliadin', false, 1), ('B', 'Both', true, 2), ('C', 'Glutenin', false, 3), ('D', 'None', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main advantage of MAP in case of bakery products is', null, 'Modified atmosphere packaging (high CO2) mainly inhibits mould growth in bakery products.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of above', false, 1), ('B', 'Inhibition of ripening', false, 2), ('C', 'Mold growth inhibition', true, 3), ('D', 'Lowered respiration', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the correct pairing of essential fatty acids?', null, 'Linoleic (omega-6) and linolenic (omega-3) acids are the essential fatty acids.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Linolenic acid and Laurie acid', false, 1), ('B', 'Oleic acids and Lenoleic acid', false, 2), ('C', 'Linolenic acid and Oleic acid', false, 3), ('D', 'Lenoleic acid and Linolenic acid', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain hydrogenation of fat and give a practical application of this process in the food industry. Despite being bad for health, give two reasons why hydrogenated fats are so popular in the food industry. (printed 2+1+2 = 5 marks; marked out of 4)', 'Hydrogenation is the addition of hydrogen to the double bonds of unsaturated fatty acids in oils, using a nickel catalyst at about 150-200 °C under pressure. It converts liquid oils into semi-solid or solid fats with higher melting points; partial hydrogenation also forms trans fatty acids, which raise LDL cholesterol. Application: making vanaspati, margarine and bakery shortening from vegetable oils. Popular because: (1) they resist oxidation and rancidity, giving long shelf life and stable frying oils; (2) they provide the solid, plastic texture needed for flaky pastries, biscuits and creams at a low cost compared with butter.', null, '[{"point": "Hydrogenation: adding H2 to unsaturated fatty acid double bonds with nickel catalyst, heat and pressure, turning liquid oils into semi-solid fats; partial hydrogenation forms trans fats", "marks": 1.5}, {"point": "Application: vanaspati/ margarine/ shortening for bakery and frying", "marks": 1}, {"point": "Popularity: longer shelf life/ oxidative stability, desired solid texture/ plasticity for baking, cheap, high smoke point/ reuse in frying", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the isoelectric point of a protein and what factor is responsible for it? What is its significance in food processing? Give an example of a processed product resulting from this phenomenon. (printed 2+1+1+1 = 5 marks; marked out of 4)', 'The isoelectric point (pI) is the pH at which a protein carries no net electric charge - its positive and negative charges balance - so repulsion between molecules is lowest, solubility is minimum and the protein tends to aggregate and precipitate. It depends on the protein''s amino acid composition (the proportion of acidic and basic side groups) and is reached by changing the pH. Significance: used to precipitate and separate proteins, and it affects water-holding, emulsifying, foaming and texture of foods. Example: casein precipitates at about pH 4.6 - the basis of acid curd, paneer, cottage cheese and yoghurt gel formation (and acid casein production).', null, '[{"point": "Isoelectric point: pH at which protein has zero net charge, minimum solubility, proteins aggregate/ precipitate", "marks": 1.5}, {"point": "Factor: the pH and the protein''s amino acid composition (acidic and basic side-chain groups)", "marks": 1}, {"point": "Significance and example: protein precipitation/ separation, texture, functionality; cheese/ curd, paneer, yoghurt, tofu, casein production (casein pI ~4.6)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What do a rheometer and a viscometer specifically measure? State one important difference between Newtonian and non-Newtonian fluids. (printed 3+2 = 5 marks; marked out of 4)', 'A viscometer measures viscosity - a fluid''s resistance to flow - usually at one or a few shear conditions (e.g. capillary, falling-ball or rotational viscometers). A rheometer measures the wider rheological behaviour: how viscosity changes with shear rate and time, yield stress, and the viscoelastic properties of semi-solids such as dough and gels (storage and loss moduli) under controlled stress or strain. Difference: a Newtonian fluid (water, milk, vegetable oil) has a constant viscosity whatever the shear rate, whereas a non-Newtonian fluid''s viscosity changes with shear rate or time - shear-thinning (ketchup, yoghurt), shear-thickening (cornstarch slurry) or with a yield stress (mayonnaise).', null, '[{"point": "Viscometer: viscosity (resistance to flow) at a set shear condition; rheometer: full flow and deformation behaviour - viscosity vs shear rate, viscoelastic properties (storage/ loss modulus), yield stress", "marks": 2.5}, {"point": "Difference: Newtonian - viscosity constant regardless of shear rate (water, oil); non-Newtonian - viscosity changes with shear rate/ time (ketchup, dough)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Define thermal death time, D value and Z value. (printed 1+2+2 = 5 marks; marked out of 4)', 'Thermal death time (TDT, F value at a reference temperature) is the time needed at a specified temperature to destroy a given number of microorganisms or spores completely. D value (decimal reduction time) is the time at a constant temperature needed to destroy 90% of the population, i.e. to reduce it by one log cycle (e.g. D121 of Clostridium botulinum ≈ 0.21 min). Z value is the change in temperature (°C) required to change the D value by a factor of 10 (one log cycle) - it shows how sensitive the organism is to temperature (often about 10 °C for spores). Together they are used to design canning and sterilisation processes.', null, '[{"point": "Thermal death time: time at a given temperature to kill all microorganisms/ spores of a given population", "marks": 1}, {"point": "D value: time at a constant temperature to reduce the population by 90% (one log cycle)", "marks": 1.5}, {"point": "Z value: temperature change needed to change the D value by a factor of 10 (one log cycle)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Food chemistry, packaging and labelling
Answer the following questions on food chemistry, packaging materials and food labelling.

1. Explain or define the following with one example each, and their implication for the quality of a food product: 1.1 Dextrinisation; 1.2 Gelatinisation; 1.3 Use of shortening in baked products. (4 marks each) (12 marks)', '1.1 Dextrinisation is the breakdown of starch into shorter chains (dextrins) by dry heat (or acid/enzymes), e.g. toasting bread or browning flour for a roux; it produces a brown colour, toasted flavour and slightly sweet taste and reduces thickening power. 1.2 Gelatinisation is the swelling and bursting of starch granules when heated in water (about 55-80 °C), so they absorb water and leach amylose, thickening the liquid; e.g. custard, cooked rice, sauces - it gives viscosity, smooth texture and better digestibility, and on cooling may set to a gel. 1.3 Shortening (fat) in baked products coats flour proteins and starch, preventing gluten strands from forming long networks (''shortening'' them); e.g. biscuits, pie crust, cakes - giving a tender, crumbly or flaky texture, trapping air during creaming for volume, improving moistness and extending shelf life.', null, '[{"point": "1.1 Dextrinisation: dry heat breaks starch into dextrins - browning, flavour, crust/ toast colour; example toast, roux", "marks": 4}, {"point": "1.2 Gelatinisation: starch granules swell and burst in water with heat, viscosity/ thickening, digestibility; example custard, rice cooking, sauces", "marks": 4}, {"point": "1.3 Shortening: fat coats gluten strands, shortens them - tender, flaky, crumbly texture, aeration, moistness, shelf life; example biscuits, pastry, cakes", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case1', 1, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Food chemistry, packaging and labelling
Answer the following questions on food chemistry, packaging materials and food labelling.

2. Write two differences between each of the following: 2.1 HDL and LDL; 2.2 HDPE and LDPE; 2.3 density and grammage of packaging material; 2.4 plate heat exchanger and tubular heat exchanger; 2.5 flavouring substances and flavour enhancers; 2.6 climacteric and non-climacteric fruit. (3 marks each) (18 marks)', '2.1 HDL (high-density lipoprotein) has more protein and carries cholesterol from tissues back to the liver - ''good'' cholesterol that protects the heart; LDL (low-density lipoprotein) is richer in cholesterol and carries it to tissues, where excess deposits in arteries - ''bad'' cholesterol raising heart-disease risk. 2.2 HDPE has linear chains, higher density (0.94-0.97 g/cm³), is stiffer, opaque, with higher melting point and better moisture barrier (milk and oil bottles); LDPE has branched chains, lower density (0.91-0.93), is flexible, transparent and easily heat-sealed (films, bags, liners). 2.3 Density is mass per unit volume (g/cm³) of a material; grammage is mass per unit area (g/m²) used for paper and board, indicating its weight and strength. 2.4 A plate heat exchanger has thin corrugated plates giving a large area in a small space, high efficiency and easy cleaning, suited to low-viscosity liquids like milk; a tubular heat exchanger uses tubes, handles viscous and particulate products and higher pressures but is less compact and efficient. 2.5 Flavouring substances give their own flavour (vanillin, fruit essences, spices); flavour enhancers have little flavour themselves but intensify existing flavours (monosodium glutamate, inosinate). 2.6 Climacteric fruits show a sharp rise in respiration and ethylene during ripening and can ripen after harvest (banana, mango, apple, tomato); non-climacteric fruits have no such rise and do not ripen further after harvest (citrus, grapes, strawberries).', null, '[{"point": "2.1 HDL: high protein, carries cholesterol to liver, ''good'', protective; LDL: more cholesterol, carries to tissues, deposits in arteries, ''bad''", "marks": 3}, {"point": "2.2 HDPE: linear, dense (0.94-0.97), stiff, opaque, higher melting, better barrier - bottles; LDPE: branched, flexible, clear, lower melting - films, bags", "marks": 3}, {"point": "2.3 Density: mass per unit volume (g/cm³), material property; grammage: mass per unit area (g/m²), used for paper/ board, relates to thickness/ strength", "marks": 3}, {"point": "2.4 Plate: thin corrugated plates, large area, compact, efficient, easy cleaning, low-viscosity liquids (milk pasteurisation); tubular: tubes, handles viscous/ particulate foods, higher pressure, less efficient, more space", "marks": 3}, {"point": "2.5 Flavouring substances impart flavour themselves (vanillin, essences); flavour enhancers have little flavour but intensify existing flavours (MSG, nucleotides)", "marks": 3}, {"point": "2.6 Climacteric: respiration and ethylene burst during ripening, ripen after harvest (banana, mango, apple, tomato); non-climacteric: no burst, must ripen on plant (citrus, grapes, strawberry)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 18,
    1944, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case1', 2, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 11.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Food chemistry, packaging and labelling
Answer the following questions on food chemistry, packaging materials and food labelling.

3. Tetra Pak cartons are an example of composite packaging; their multiple layers keep food shelf-stable for months at ambient temperature without refrigeration. The picture shows the layers.
3.1 Four different types of packaging material are used. Explain their functional roles based on their properties and how the materials are arranged in six layers. (9 marks)
3.2 Give two advantages and two disadvantages of Tetra Pak cartons for packing milk instead of glass bottles. (3 marks) (12 marks)', '3.1 The four materials are polyethylene, paperboard, aluminium foil and an adhesion polymer (a polyethylene-based tie layer). From outside to inside: (1) outer polyethylene - protects against outside moisture and scuffing and protects the print; (2) paperboard - about 75% of the carton, gives stiffness, strength and shape and is the printing surface; (3) polyethylene - laminating layer bonding the paperboard to the foil; (4) aluminium foil (about 6 µm) - the barrier against light, oxygen and odours, essential for long ambient shelf life of aseptically packed products; (5) adhesion polymer - bonds the foil to the inner plastic; (6) inner polyethylene - food-contact layer that keeps the liquid in and allows heat sealing.
3.2 Advantages over glass bottles: light and unbreakable, so cheaper and safer to transport and store (rectangular shape saves space); with UHT aseptic filling the milk keeps for months without refrigeration. Disadvantages: the composite layers are difficult to separate and recycle (less recycling capacity, especially in Bhutan); cartons are single-use whereas glass can be reused, and the product cannot be seen.', null, '[{"point": "3.1 Six layers outside to inside: polyethylene (moisture/ print protection), paperboard (strength, stiffness, printing), polyethylene (lamination/ adhesion), aluminium foil (barrier to light, oxygen, odours), adhesion polymer/ PE (binds foil), polyethylene (inner food-contact, liquid barrier, heat seal) - roles explained", "marks": 9}, {"point": "3.2 Advantages: light, unbreakable, aseptic long shelf life without refrigeration, space-efficient/ cheaper transport; disadvantages: hard to recycle (composite), not reusable, opaque (cannot see product), dependence on specialised plant", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case1', 3, null, null, (select id from public.specialisations where code = 'food-science'), '/papers/me/tech3-food-2024-tetrapak.jpg')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Food chemistry, packaging and labelling
Answer the following questions on food chemistry, packaging materials and food labelling.

4. Organic farming and products are gaining momentum as consumers become aware of the benefits of products free from chemicals. As per the Bhutan Food and Drug Authority, list four labelling requirements for ingredients, origin and declaration on the label of organic products. (8 marks)', 'Labelling requirements (following the national organic standard and labelling regulations, aligned with Codex): (1) The term ''organic'' may be used only when the product is certified and at least 95% of agricultural ingredients (by weight, excluding water and salt) are organically produced; products with less may only identify the organic ingredients in the ingredient list. (2) Ingredients must be listed in descending order of weight, with organic ingredients clearly identified. (3) The name or code number of the certification/inspection body and the certification mark (e.g. Bhutan Organic logo) must appear. (4) The country of origin and the name and address of the producer, processor or packer must be declared, along with the usual mandatory information (product name, net quantity, date marking, lot number), without any misleading claims. [Expert: check against the current BFDA/ Bhutan Organic Standard text.]', null, '[{"point": "Four requirements explained (2 marks each), e.g.: ''organic'' claim only if ingredients meet organic standard (≥95% organic ingredients, rest permitted); list of ingredients with organic ones identified; name/ code of the certification body and certification mark; country/ place of origin; name and address of producer/ packer; no misleading claims", "marks": 8}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Expert check: confirm the BFDA organic labelling requirements."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case1', 4, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Extrusion, sensory evaluation and frying
Answer the following questions on extrusion processing, sensory evaluation and the quality of fried foods.

1. Extrusion processing is widely used for snacks, breakfast cereals, pasta and more.
1.1 Define extrusion processing and explain the principle of hot extrusion. (4 marks)
1.2 Food extruders have five main parts - pre-conditioning, feeding system, screw, barrel or sleeves, and die and cutting mechanism. Explain each part and its function. (10 marks)
1.3 List four properties of the feed materials that strongly influence product texture and colour. (4 marks)
1.4 What are the four most important operating parameters of an extruder? (4 marks) (22 marks)', '1.1 Extrusion is a continuous process in which moistened ingredients are mixed, kneaded, sheared, heated and forced through a shaped die. In hot (high-temperature short-time) extrusion, mechanical shear and barrel heating raise the dough to about 120-180 °C under high pressure, gelatinising starch and denaturing proteins into a viscous melt; when it exits the die, the sudden pressure drop flashes superheated water to steam, expanding (puffing) the product, which is then cut and dried.
1.2 Pre-conditioning: raw materials are mixed with water and steam to hydrate and partly pre-cook them, improving uniformity and reducing wear. Feeding system: a hopper with a volumetric or gravimetric feeder supplies material at a constant rate. Screw: rotates to convey, compress, knead and shear the material, generating heat and pressure (flights and pitch vary along its length). Barrel or sleeves: the cylinder enclosing the screw, often grooved, with heating/cooling jackets that control temperature. Die and cutting mechanism: the die shapes the product and creates back-pressure, controlling expansion; a rotating knife cuts it to length.
1.3 Feed properties: moisture content, starch content and type (amylose:amylopectin ratio), protein content, fat/oil content, sugar and fibre content, and particle size - they determine expansion, crispness, density and browning (Maillard reaction).
1.4 Operating parameters: barrel temperature, screw speed, feed rate and moisture (water/steam addition); die geometry and specific mechanical energy also matter.', null, '[{"point": "1.1 Extrusion: forcing material through a die after mixing, kneading, shearing, heating; hot extrusion (HTST): high temperature, pressure, shear cook starch/ proteins, sudden pressure drop at die flashes water to steam → expansion/ puffing", "marks": 4}, {"point": "1.2 Five parts with functions: pre-conditioning (moistening/ steam heating), feeding (controlled feed rate), screw (conveying, compressing, shearing, mixing), barrel (houses screw, heating/ cooling jackets, grooves), die and cutter (shape, pressure, expansion, length)", "marks": 10}, {"point": "1.3 Feed factors: moisture content, starch content/ type (amylose:amylopectin), protein content, fat/ oil content, sugar, fibre, particle size, pH", "marks": 4}, {"point": "1.4 Operating parameters: barrel temperature, screw speed, feed rate, moisture/ water addition (also die size/ pressure, specific mechanical energy)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 22,
    2376, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case2', 1, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 13.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Extrusion, sensory evaluation and frying
Answer the following questions on extrusion processing, sensory evaluation and the quality of fried foods.

2. Sensory evaluation is important in food product development; different methods assess consumers'' acceptance.
2.1 Write four objectives of sensory evaluation. (4 marks)
2.2 Discuss how the duo-trio test and the triangle test are conducted. (4 marks)
2.3 Which test method is superior and why? (2 marks) (10 marks)', '2.1 Objectives: to develop new products and improve existing ones; to check quality and consistency in production (quality control); to find whether a change in ingredients, process or packaging is noticeable; to determine shelf life; and to measure consumer acceptance and preference compared with competitors.
2.2 Duo-trio test: the panelist first tastes a labelled reference sample, then two coded samples - one identical to the reference and one different - and identifies which coded sample matches the reference. Triangle test: the panelist receives three coded samples, two identical and one different, presented in randomised order, and identifies the odd sample. In both, many panelists are used and the number of correct answers is compared with statistical tables to decide if a difference exists.
2.3 The triangle test is superior statistically: the chance of guessing correctly is 1/3 instead of 1/2 in the duo-trio test, so it is more sensitive and needs fewer panelists to detect a difference (though it causes more fatigue with strong-flavoured samples).', null, '[{"point": "2.1 Objectives: product development/ improvement, quality control, shelf-life testing, consumer acceptance/ preference, matching competitors, effect of ingredient/ process changes", "marks": 4}, {"point": "2.2 Duo-trio: reference given, then two coded samples (one same as reference), panelist picks the one matching reference; triangle: three coded samples, two identical, one different, panelist identifies odd one; randomised, statistical tables", "marks": 4}, {"point": "2.3 Triangle test superior statistically: chance probability 1/3 vs 1/2, more sensitive/ efficient; (but more tiring)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case2', 2, null, null, (select id from public.specialisations where code = 'food-science'), null)
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
  values ('ME', 'passage', 'Case II: Extrusion, sensory evaluation and frying
Answer the following questions on extrusion processing, sensory evaluation and the quality of fried foods.

3. Fried foods are widely consumed snacks, but because they are heated in oil at high temperature they are not a healthy option.
3.1 Discuss two adverse effects of fried food on human health. (2 marks)
3.2 List and discuss five factors that control the quality of fried food. (5 marks)
3.3 Define the following values and their significance: (i) anisidine value; (ii) peroxide value; (iii) acid value. (6 marks) (13 marks)', '3.1 Fried foods are high in fat and calories, contributing to obesity, high blood cholesterol and heart disease; repeatedly heated oil forms trans fats, oxidised and polymerised compounds and, in starchy foods, acrylamide (a probable carcinogen).
3.2 Factors: (1) type and quality of oil (stability, smoke point, fatty acid profile); (2) frying temperature (about 170-190 °C - too low causes greasy food, too high burns and degrades oil); (3) frying time; (4) the food''s moisture, composition, size and surface (batter or coating affects oil uptake); (5) oil turnover and handling - food-to-oil ratio, topping up with fresh oil, filtering and limiting reuse.
3.3 (i) Anisidine value measures secondary oxidation products, mainly aldehydes (2-alkenals) - it shows the past oxidation history and rancid flavour potential of an oil. (ii) Peroxide value measures primary oxidation products (hydroperoxides) in milliequivalents of oxygen per kg - an indicator of early oxidation and freshness. (iii) Acid value is the mg of KOH needed to neutralise the free fatty acids in 1 g of fat - it shows hydrolytic breakdown; a high value means deteriorated oil that should be discarded.', null, '[{"point": "3.1 Two effects: high fat/ calories → obesity, heart disease; trans fats/ oxidised and polymerised compounds, acrylamide (carcinogen), cholesterol", "marks": 2}, {"point": "3.2 Five factors: oil type and quality, frying temperature, frying time, food moisture/ composition/ surface, oil-to-food ratio/ turnover and replenishment, reuse/ filtration, coating/ batter", "marks": 5}, {"point": "3.3 Anisidine value: secondary oxidation products (aldehydes) - past oxidation/ rancidity; peroxide value: primary oxidation (hydroperoxides, meq O2/kg) - early rancidity; acid value: mg KOH to neutralise free fatty acids in 1 g - hydrolysis/ oil deterioration, discard limit (2 marks each)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 13,
    1404, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case2', 3, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 8.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Extrusion, sensory evaluation and frying
Answer the following questions on extrusion processing, sensory evaluation and the quality of fried foods.

4. The table shows changes in physical parameters of oil during deep-fat frying and their causes. Fill in the blanks following the example in row 1:
Row 1: Refractive index/UV - increases - accumulation of conjugated fatty acids (example)
Row 2: Density - ______ - polymerised triacylglycerols
Row 3: ______ - becomes more intense and darker - Maillard reaction products
Row 4: Smoke point - ______ - volatile oxidised decomposition products
Row 5: Specific heat - increases - ______
Row 6: Viscosity - increases - ______ (5 marks)', 'Row 2: density increases (polymerised triacylglycerols are denser). Row 3: the parameter is colour - it becomes more intense and darker due to Maillard reaction products and oxidation. Row 4: smoke point decreases, because volatile oxidised decomposition products and free fatty acids smoke at lower temperatures. Row 5: specific heat increases because of the accumulation of polar and polymerised compounds (dimers, polymers). Row 6: viscosity increases due to polymerisation - formation of high-molecular-weight dimers and polymers of triacylglycerols.', null, '[{"point": "Density increases; Colour (becomes darker); Smoke point decreases; Specific heat increases due to polymerised/ oxidised products (polar compounds); Viscosity increases due to polymerised triacylglycerols/ dimers - one mark each", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Food Science", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-foodsci2024-case2', 4, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most abundant myofibrillar protein in meat muscle is', null, 'Myosin (with actin) makes up most of the myofibrillar protein; myoglobin is a pigment and collagen is connective tissue.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Elastin', false, 1), ('B', 'Myoglobin', false, 2), ('C', 'Collagen', false, 3), ('D', 'Myosin', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which membrane process removes mainly water and small ions, retaining almost all solutes, as in desalination?', null, 'Reverse osmosis membranes have the smallest pores and retain salts and sugars, passing mainly water.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'food-science'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Food Science): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'food-science'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reverse osmosis', true, 1), ('B', 'Sieving', false, 2), ('C', 'Microfiltration', false, 3), ('D', 'Ultrafiltration', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
commit;
