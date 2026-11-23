-- ME Paper II (Technical, Engineering): BCSE 2012, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'engineering-general-subject-knowledge', 'Engineering: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which diagram is used to represent sets?', null, 'A Venn diagram shows sets as overlapping circles.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'PERT chart', false, 1), ('B', 'Pie chart', false, 2), ('C', 'Venn diagram', true, 3), ('D', 'Bar chart', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of the circumference of a circle to its diameter is:', null, 'C = πd, so C/d = π.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'π', true, 1), ('B', '0.5', false, 2), ('C', '2', false, 3), ('D', '2π', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Half of a sphere is called a:', null, 'Half a sphere is a hemisphere (half a circle is a semicircle).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'circle', false, 1), ('B', 'circum-sphere', false, 2), ('C', 'hemisphere', true, 3), ('D', 'semicircle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A number that has only two factors, one and itself, is a:', null, 'A prime number has exactly two factors: 1 and itself.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Odd number', false, 1), ('B', 'Fraction', false, 2), ('C', 'Unique number', false, 3), ('D', 'Prime number', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Find a number which, when increased by 17, is equal to 60 times the reciprocal of the number.', null, 'x + 17 = 60/x gives x² + 17x − 60 = 0 = (x + 20)(x − 3), so x = 3 (check: 3 + 17 = 20 = 60/3).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6', false, 1), ('B', '8', false, 2), ('C', '2', false, 3), ('D', '3', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A man is five times as old as his son, and the sum of the squares of their ages is 2106. Find their ages.', null, 'x² + (5x)² = 26x² = 2106, so x² = 81: son 9, father 45.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Son 5 years, father 25 years', false, 1), ('B', 'Son 9 years, father 45 years', true, 2), ('C', 'Son 10 years, father 50 years', false, 3), ('D', 'Son 7 years, father 35 years', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two numbers are in the ratio 5 : 8. If 9 is added to each, they are in the ratio 8 : 11. Find the numbers.', null, '(5k + 9)/(8k + 9) = 8/11 gives 55k + 99 = 64k + 72, so k = 3: the numbers are 15 and 24.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '15, 24', true, 1), ('B', '20, 32', false, 2), ('C', '8, 11', false, 3), ('D', '5, 8', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Find the 5th term of the series 3, 6, 12, …', null, 'Geometric with ratio 2: the 5th term = 3 × 2⁴ = 48.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '192', false, 1), ('B', '24', false, 2), ('C', '96', false, 3), ('D', '48', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What would be the total accumulated amount in 5 years if Nu. 10,000 is deposited in a bank at an interest rate of 6% per annum compounded monthly?', null, 'A = 10,000 × (1 + 0.06/12)⁶⁰ = 10,000 × 1.005⁶⁰ ≈ Nu. 13,488.50.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu. 13,488.50', true, 1), ('B', 'Nu. 13,300.00', false, 2), ('C', 'Nu. 13,500.00', false, 3), ('D', 'Nu. 13,000.00', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A man whose height is 1.5 m, standing 8 m from a lamp-post, observes that his shadow cast by the light is 1.25 m long. How high is the light?', null, 'Similar triangles: h/(8 + 1.25) = 1.5/1.25, so h = 9.25 × 1.2 = 11.1 m.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10.0 m', false, 1), ('B', '12.0 m', false, 2), ('C', '11.1 m', true, 3), ('D', '9.0 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the length of the edge of a cube whose total surface area is 24 m²?', null, '6a² = 24, so a² = 4 and a = 2 m.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3 m', false, 1), ('B', '6 m', false, 2), ('C', '4 m', false, 3), ('D', '2 m', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many solid spheres 6 cm in diameter could be moulded from a solid metal cylinder whose length is 45 cm and diameter 4 cm?', null, 'Cylinder: π × 2² × 45 = 180π cm³. Sphere: (4/3)π × 3³ = 36π cm³. 180π/36π = 5.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '6', false, 1), ('B', '5', true, 2), ('C', '8', false, 3), ('D', '10', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The large hand of a clock is 71.12 cm long. How many centimetres does its tip move in 20 minutes?', null, 'In 20 minutes the hand turns 1/3 of a circle: (2π × 71.12)/3 ≈ 148.95 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '150.00 cm', false, 1), ('B', '160.00 cm', false, 2), ('C', '148.95 cm', true, 3), ('D', '120.00 cm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The angle of elevation of the top of a tower is 30°; on walking 100 m nearer, the elevation is found to be 60°. Find the height of the tower.', null, 'h = x tan 60° = (x + 100) tan 30°, so 3x = x + 100, x = 50 and h = 50√3 m (≈ 86.6 m).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '50√3 m', true, 1), ('B', '40√3 m', false, 2), ('C', '45√3 m', false, 3), ('D', '55√3 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cow is tied to a pole in a meadow with a nylon rope 10 m long. The total grazing area is:', null, 'The cow can graze a circle of radius 10 m: π × 10² ≈ 314.2 m².', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100 m²', false, 1), ('B', '314.2 m²', true, 2), ('C', '250 m²', false, 3), ('D', '62.84 m²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The level of sound D in decibels is defined as D = 4 log(I/10⁻⁸), where I is the sound intensity in watts/cm². Find D for a sound of intensity I = 10⁻⁴ watts/cm².', null, 'D = 4 log(10⁻⁴/10⁻⁸) = 4 log 10⁴ = 4 × 4 = 16.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4 decibels', false, 1), ('B', '10 decibels', false, 2), ('C', '8 decibels', false, 3), ('D', '16 decibels', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an identity?', null, 'sin 2x = 2 sin x cos x holds for all x; the others are false in general.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'cos(x + y) = cos x + cos y', false, 1), ('B', 'sin 2x = 2 sin x cos x', true, 2), ('C', 'cos 2x = 2 cos x', false, 3), ('D', 'sin(x − y) = sin x − sin y', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'lim (x → ∞) of (x⁴ + 9x³ − 11x)/(6x⁴) is equal to:', null, 'Divide top and bottom by x⁴: (1 + 9/x − 11/x³)/6 → 1/6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1/6', true, 1), ('B', '1/4', false, 2), ('C', '∞', false, 3), ('D', '1/10', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many 6-letter words can be made using the letters of the word QUALITY without repetition?', null, 'QUALITY has 7 different letters: ⁷P₆ = 7!/1! = 5040.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3528', false, 1), ('B', '5040', true, 2), ('C', '6040', false, 3), ('D', '720', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The partial fractions of (5x + 10)/(x(x + 5)) are:', null, 'A/x + B/(x + 5): A = 10/5 = 2; at x = −5, B = (−25 + 10)/(−5) = 3. So 2/x + 3/(x + 5).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2/x + 3/(x + 5)', true, 1), ('B', '3/(2x + 5)', false, 2), ('C', '2/(3x) + 10/(x + 5)', false, 3), ('D', '5/(2x) + 3/(x + 5)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A substance in which the components exist together without combining chemically is called a(n)', null, 'In a mixture the components keep their own properties and are not chemically combined.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mixture', true, 1), ('B', 'Compound', false, 2), ('C', 'Element', false, 3), ('D', 'Molecule', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which element is sometimes considered a non-metal and at other times a metal, depending mainly on its state?', null, 'Hydrogen is a non-metallic gas normally, but under extreme pressure it becomes metallic hydrogen (it is also placed with the alkali metals in Group 1).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Water', false, 1), ('B', 'Mercury', false, 2), ('C', 'Helium', false, 3), ('D', 'Hydrogen', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the chemical equation 2Al + ? F₂ → 2AlF₃, what is the value in place of the question mark?', null, '2AlF₃ contains 6 F atoms = 3F₂.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4', false, 1), ('B', '2', false, 2), ('C', '3', true, 3), ('D', '5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An instrument used for measuring the pressure of a gas is a', null, 'A manometer measures the pressure of an enclosed gas; a barometer measures atmospheric pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Barometer', false, 1), ('B', 'Thermometer', false, 2), ('C', 'Seismometer', false, 3), ('D', 'Manometer', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Chemical reactions accompanied by the liberation of heat are said to be', null, 'Exothermic reactions release heat (ΔH negative).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reverse reactions', false, 1), ('B', 'Exothermic', true, 2), ('C', 'Forward reactions', false, 3), ('D', 'Endothermic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An atom bomb works on the principle of:', null, 'An atom bomb uses an uncontrolled nuclear fission chain reaction; a reactor uses controlled fission and a hydrogen bomb fusion.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Uncontrolled fission reaction', true, 1), ('B', 'Uncontrolled fusion reaction', false, 2), ('C', 'Controlled fission reaction', false, 3), ('D', 'Controlled fusion reaction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following conducts electricity?', null, 'Copper is a metal with free electrons; dry ice, diamond and rubber are insulators.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rubber', false, 1), ('B', 'Diamond', false, 2), ('C', 'Copper', true, 3), ('D', 'Dry ice', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one is incorrect regarding the properties of the noble gases?', null, 'Noble gases have full outer shells and are almost unreactive (inert).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Colourless', false, 1), ('B', 'Chemically inert', false, 2), ('C', 'Odourless', false, 3), ('D', 'Chemically reactive', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of these elements is not a noble gas?', null, 'Bromine is a halogen (Group 17); Kr, Ar and Ne are noble gases.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M31' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neon', false, 1), ('B', 'Argon', false, 2), ('C', 'Krypton', false, 3), ('D', 'Bromine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The reaction between a reactive metal and a dilute acid generally gives:', null, 'Metal + dilute acid → salt + hydrogen (e.g. Zn + 2HCl → ZnCl₂ + H₂). (Copper and nitric acid are an exception.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M32' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Salt and water', false, 1), ('B', 'Hydrogen only', false, 2), ('C', 'Salt and hydrogen', true, 3), ('D', 'Salt and oxygen', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Organic compounds are characterised by the presence of', null, 'Organic chemistry is the chemistry of carbon compounds.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M33', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M33' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Chlorine atoms', false, 1), ('B', 'Oxygen atoms', false, 2), ('C', 'Carbon atoms', true, 3), ('D', 'Nitrogen atoms', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The chemical formula C₆H₆ refers to which hydrocarbon?', null, 'C₆H₆ is benzene (methane CH₄, propane C₃H₈, butane C₄H₁₀).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M34' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Butane', false, 1), ('B', 'Methane', false, 2), ('C', 'Propane', false, 3), ('D', 'Benzene', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When calcium carbonate is heated, one of the products of the reaction is', null, 'CaCO₃ → CaO + CO₂ on heating.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M35' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'CO₂', true, 1), ('B', 'CO', false, 2), ('C', 'N₂', false, 3), ('D', 'O₂', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When no heat is allowed to enter or leave a system, the process is called:', null, 'Adiabatic: Q = 0. (Isothermal: constant T; isobaric: constant P; isochoric: constant V.)', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M36' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Isobaric', false, 1), ('B', 'Isochoric', false, 2), ('C', 'Isothermal', false, 3), ('D', 'Adiabatic', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You can avoid scurvy by eating foods rich in vitamin C, such as citrus fruits. Vitamin C is also known as:', null, 'Vitamin C is ascorbic acid.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M37' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ascorbic acid', true, 1), ('B', 'Citric acid', false, 2), ('C', 'Nitric acid', false, 3), ('D', 'Carbonic acid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Amino acids are the building blocks of:', null, 'Proteins are chains of amino acids (DNA is built from nucleotides).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M38' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Protein', true, 1), ('B', 'Lipid', false, 2), ('C', 'DNA', false, 3), ('D', 'Carbohydrate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is not a radioactive element?', null, 'Natural strontium is stable (only some isotopes, such as man-made Sr-90, are radioactive); U, Th and Ra are radioactive elements.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M39' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Uranium', false, 1), ('B', 'Strontium', true, 2), ('C', 'Radium', false, 3), ('D', 'Thorium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The cleansing action of soap is due to:', null, 'Soap molecules surround oily dirt (micelles), emulsifying it so it washes away in water.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M40' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neutrality of water', false, 1), ('B', 'Coagulation of water', false, 2), ('C', 'Emulsification of dirt', true, 3), ('D', 'Temperature of water', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a particle''s position is given by x = 4 − 12t + 3t², where t is in seconds and x in metres, what is its velocity at t = 1 s?', null, 'v = dx/dt = −12 + 6t; at t = 1, v = −6 m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M41' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '−12 m/s', false, 1), ('B', '6 m/s', false, 2), ('C', '12 m/s', false, 3), ('D', '−6 m/s', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Raindrops fall to Earth from a cloud 1700 m above the Earth''s surface. If they were not slowed by air resistance, how fast would the drops be moving when they struck the ground?', null, 'v = √(2gh) = √(2 × 9.8 × 1700) = √33,320 ≈ 182.5 m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M42' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '182.5 m/s', true, 1), ('B', '150.0 m/s', false, 2), ('C', '120.0 m/s', false, 3), ('D', '250.0 m/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A coin placed on a book begins to slide down when the book is tilted at 13° to the horizontal. What is the coefficient of static friction between the coin and the book?', null, 'At the point of slipping μs = tan θ = tan 13° ≈ 0.23.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M43' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.30', false, 1), ('B', '0.23', true, 2), ('C', '0.20', false, 3), ('D', '0.15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 75 kg man is riding on a 39 kg cart travelling at 2.3 m/s. He jumps off with zero horizontal speed. What is the resulting change in the speed of the cart?', null, 'Momentum: (75 + 39) × 2.3 = 262.2 = 39v, so v ≈ 6.72 m/s. The change in speed = 6.72 − 2.3 ≈ 4.4 m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M44' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5.5 m/s', false, 1), ('B', '6.7 m/s', false, 2), ('C', '4.4 m/s', true, 3), ('D', '2.3 m/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A student sitting on a stool that can rotate freely about a vertical axis is set rotating slowly while holding two dumbbells in outstretched hands. If he pulls his arms in, his angular speed will', null, 'Angular momentum Iω is conserved; pulling the arms in reduces I, so ω increases.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M45' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'increase', true, 1), ('B', 'none of the above', false, 2), ('C', 'decrease', false, 3), ('D', 'remain the same', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If you wear a red shirt and stand under green light, the shirt will appear:', null, 'A red shirt reflects only red light and absorbs green, so under pure green light it reflects nothing and looks black.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M46' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Red', false, 1), ('B', 'Black', true, 2), ('C', 'Yellow', false, 3), ('D', 'Blue', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a body moves in a circular path (uniform circular motion), the work done by the centripetal force is equal to:', null, 'The centripetal force is always perpendicular to the motion, so it does no work.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M47' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'Infinity', false, 2), ('C', 'Mass × acceleration', false, 3), ('D', 'Zero', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The period of oscillation of a simple pendulum depends on the', null, 'T = 2π√(l/g): it depends on the length (and g), not on the mass.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M48' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Length of the string', true, 1), ('B', 'Mass of the ball and length of the string', false, 2), ('C', 'All of the above', false, 3), ('D', 'Mass of the ball', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An aluminium flagpole is 33 m high. By how much does its length increase as the temperature increases by 15 °C? (Coefficient of linear expansion of aluminium = 23 × 10⁻⁶ /°C)', null, 'ΔL = αLΔT = 23 × 10⁻⁶ × 33 × 15 = 0.0114 m = 11.4 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M49' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.114 mm', false, 1), ('B', '11.4 mm', true, 2), ('C', '1.14 mm', false, 3), ('D', '114.0 mm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An ammeter is an instrument used to measure the', null, 'An ammeter measures current (a voltmeter measures potential difference).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M50' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Potential difference between two points in a circuit', false, 1), ('B', 'Current in a wire', true, 2), ('C', 'None of the above', false, 3), ('D', 'Resistance of a wire', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An electric heater in your home converts:', null, 'A heater turns electrical energy into heat (Joule heating).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M51' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electric energy to heat energy', true, 1), ('B', 'Electric energy to chemical energy', false, 2), ('C', 'Heat energy to electric energy', false, 3), ('D', 'Mechanical energy to electric energy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Three resistors of 6 Ω, 10 Ω and 15 Ω are connected in series across a 230 V supply. Calculate the current flowing in the circuit.', null, 'R = 6 + 10 + 15 = 31 Ω; I = 230/31 ≈ 7.419 A.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M52' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.143 A', false, 1), ('B', '12 A', false, 2), ('C', '10 A', false, 3), ('D', '7.419 A', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The cathode ray tube was used in which of the following household items?', null, 'Older (CRT) televisions and monitors use a cathode ray tube to form the picture.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M53' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Radio', false, 1), ('B', 'Television', true, 2), ('C', 'Microwave oven', false, 3), ('D', 'Refrigerator', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A private radio station transmits its signal at a frequency of 90 kHz. If the speed of radio waves in air is 3 × 10⁸ m/s, the wavelength of the radio waves will be:', null, 'λ = v/f = 3 × 10⁸/(90 × 10³) ≈ 3333.33 m.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M54' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3333.33 m', true, 1), ('B', '33333.33 m', false, 2), ('C', '3333333.33 m', false, 3), ('D', '333333.33 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a spoon is placed in a beaker of water it appears broken because of the phenomenon of:', null, 'Light bends (refracts) as it passes from water to air, so the submerged part appears displaced.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M55', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M55' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reflection of light', false, 1), ('B', 'Radiation of light', false, 2), ('C', 'Refraction of light', true, 3), ('D', 'Absorption of light', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A natural phenomenon in which a pool of water appears to lie on the road some distance ahead on a sunny day, but can never be reached, is called a(n)', null, 'A mirage is caused by refraction (and total internal reflection) of light in hot air layers near the road.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M56', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M56' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Illusion', false, 1), ('B', 'Mirage', true, 2), ('C', 'Picture', false, 3), ('D', 'Image', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M56';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The image formed in the rear-view (convex) mirror of a car will be', null, 'A convex mirror always forms a virtual, erect, diminished image - giving a wide field of view.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M57', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M57' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The same size as the real object', false, 1), ('B', 'None of the above', false, 2), ('C', 'Larger than the real object', false, 3), ('D', 'Smaller than the real object', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Infrared radiation is used for photography in fog because it is:', null, 'Longer-wavelength infrared is scattered much less by fog particles than visible light.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M58', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M58' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reflected by fog', false, 1), ('B', 'Scattered more by fog', false, 2), ('C', 'Scattered less by fog', true, 3), ('D', 'Absorbed by fog', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If there is a sudden fall in barometric height (pressure), it indicates the:', null, 'A sudden sharp fall in pressure signals a storm; a gradual fall indicates rain.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M59', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M59' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plenty of sunshine', false, 1), ('B', 'Arrival of a storm', true, 2), ('C', 'Arrival of snow', false, 3), ('D', 'Arrival of rain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most widely accepted model for how the universe began is known as the:', null, 'The Big Bang model describes the universe expanding from a hot, dense state about 13.8 billion years ago.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M60', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M60' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kepler''s planetary model', false, 1), ('B', 'Newton model', false, 2), ('C', 'Big Bang model', true, 3), ('D', 'Natural selection model', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M60';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In computer graphics, the ratio between the width and height of an image is called the:', null, 'Aspect ratio = width : height (e.g. 16 : 9).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M61', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M61' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aspect ratio', true, 1), ('B', 'None of the above', false, 2), ('C', 'Resolution ratio', false, 3), ('D', 'Focus ratio', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'WYSIWYG is a feature of some application programs with graphical user interfaces. WYSIWYG stands for:', null, 'WYSIWYG = What You See Is What You Get.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M62', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M62' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'What You Set Is What You Get', false, 1), ('B', 'What You See Is What You Get', true, 2), ('C', 'What You See Is What You Graph', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M62';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Inside the computer, most of the mathematical calculations are carried out by the', null, 'The ALU in the CPU performs arithmetic and logic operations.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M63', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M63' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Processing unit', false, 1), ('B', 'Internal memory', false, 2), ('C', 'Arithmetic logic unit', true, 3), ('D', 'External memory', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The language used to create hypertext documents for use on the World Wide Web is:', null, 'Web pages are written in HTML; HTTP is the protocol that transfers them.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M64', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M64' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'HyperText Transfer Protocol', false, 1), ('B', 'COBOL', false, 2), ('C', 'HyperText Markup Language (HTML)', true, 3), ('D', 'FORTRAN', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A group of eight bits is called a byte. The number of combinations of 0 and 1 in each byte is:', null, 'Each bit has 2 states: 2⁸ = 256 combinations.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M65', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M65' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10⁸', false, 1), ('B', '2⁸', true, 2), ('C', '1⁸', false, 3), ('D', '64', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A computer-readable code of thick and thin parallel lines representing binary digits, used for product identification and tracking sales, is known as a:', null, 'A barcode encodes data in parallel bars and is read by a scanner at the point of sale.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M66', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M66' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Barcode', true, 1), ('B', 'Digital code', false, 2), ('C', 'Binary code', false, 3), ('D', 'Line code', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M66';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The size of a program and the amount of data that a computer can process at any one time depend on the size of its:', null, 'Programs and data being processed are held in RAM (main memory).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M68', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M68' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Programmable Read Only Memory', false, 1), ('B', 'Random Access Memory', true, 2), ('C', 'Read Only Memory', false, 3), ('D', 'Rapid Access Memory', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M68';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most well-known protocol that allows a computer to use a standard telephone line and a modem to connect to the Internet is:', null, 'PPP (Point-to-Point Protocol) is the standard dial-up protocol; SLIP is its older, simpler predecessor and PSTN is the telephone network itself.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M69', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'M69' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Public Switched Telephone Network', false, 1), ('B', 'Point-to-Point Protocol', true, 2), ('C', 'Serial Line Internet Protocol', false, 3), ('D', 'Point-to-Node Protocol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Solve the equation 8^(5 − 3x) = 12^(4 − 2x) for x, given log 2 = 0.30103 and log 3 = 0.47712. (3 marks)', 'Taking logarithms: (5 − 3x) log 8 = (4 − 2x) log 12.
log 8 = 3 log 2 = 0.90309; log 12 = 2 log 2 + log 3 = 0.60206 + 0.47712 = 1.07918.
0.90309(5 − 3x) = 1.07918(4 − 2x)
4.51545 − 2.70927x = 4.31672 − 2.15836x
4.51545 − 4.31672 = 2.70927x − 2.15836x
0.19873 = 0.55091x, so x = 0.19873/0.55091 ≈ 0.3607.', null, '[{"point": "Take logs: (5 − 3x) log 8 = (4 − 2x) log 12, with log 8 = 3 log 2 = 0.90309 and log 12 = 2 log 2 + log 3 = 1.07918", "marks": 1}, {"point": "4.51545 − 2.70927x = 4.31672 − 2.15836x, so 0.19873 = 0.55091x", "marks": 1}, {"point": "x ≈ 0.3607", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Find ∫₀¹ 2x/√(x² + 5) dx. (3 marks)', 'Let u = x² + 5, so du = 2x dx. Then ∫2x/√(x² + 5) dx = ∫u^(−1/2) du = 2√u = 2√(x² + 5).
∫₀¹ = 2√6 − 2√5 = 2(2.449 − 2.236) ≈ 0.427.', null, '[{"point": "Substitute u = x² + 5, du = 2x dx: ∫u^(−1/2) du = 2√u", "marks": 1}, {"point": "Antiderivative 2√(x² + 5); limits 0 to 1: 2√6 − 2√5", "marks": 1}, {"point": "≈ 4.899 − 4.472 = 0.427", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The centre of a circle is at (2, −5) and its radius is 3. Find the equation of the circle. (3 marks)', 'A circle with centre (h, k) and radius r has equation (x − h)² + (y − k)² = r².
Here: (x − 2)² + (y + 5)² = 9.
Expanding: x² − 4x + 4 + y² + 10y + 25 = 9, so x² + y² − 4x + 10y + 20 = 0.', null, '[{"point": "Standard form (x − h)² + (y − k)² = r²", "marks": 1}, {"point": "(x − 2)² + (y + 5)² = 9", "marks": 1}, {"point": "Expanded: x² + y² − 4x + 10y + 20 = 0", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The radioisotope cobalt-60 is used to destroy cancerous cells by directing γ-rays into the cancerous tissue. Calculate the fraction of a cobalt-60 sample left after 20.00 years. The half-life of cobalt-60 is 5.27 years. (3 marks)', 'Number of half-lives: n = t/t½ = 20.00/5.27 = 3.795.
Fraction remaining = (1/2)ⁿ = (1/2)^3.795 = 0.0720.
(Equivalently N/N₀ = e^(−λt) with λ = 0.693/5.27 = 0.1315 per year: e^(−2.630) = 0.072.) So about 7.2% of the cobalt-60 is left.', null, '[{"point": "Number of half-lives n = 20.00/5.27 = 3.795", "marks": 1}, {"point": "Fraction left = (1/2)ⁿ = (1/2)^3.795", "marks": 1}, {"point": "≈ 0.072 (about 7.2% remains)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Write balanced equations illustrating how nitric acid is produced from ammonia. List some uses of nitric acid. (3 marks)', 'Nitric acid is made from ammonia by the Ostwald process:
1. Catalytic oxidation of ammonia (platinum-rhodium gauze, about 800 °C): 4NH₃ + 5O₂ → 4NO + 6H₂O.
2. Oxidation of nitric oxide: 2NO + O₂ → 2NO₂.
3. Absorption in water: 3NO₂ + H₂O → 2HNO₃ + NO (overall with excess air: 4NO₂ + O₂ + 2H₂O → 4HNO₃).
Uses: manufacture of fertilisers such as ammonium nitrate and calcium ammonium nitrate; explosives (TNT, nitroglycerine); dyes, plastics (nylon) and drugs; etching and cleaning metals, separating gold from silver, and (with HCl) aqua regia; oxidiser in rocket fuel.', null, '[{"point": "Ostwald process: 4NH₃ + 5O₂ → 4NO + 6H₂O (Pt-Rh catalyst, about 800 °C)", "marks": 1}, {"point": "2NO + O₂ → 2NO₂; 4NO₂ + O₂ + 2H₂O → 4HNO₃ (or 3NO₂ + H₂O → 2HNO₃ + NO)", "marks": 1}, {"point": "Uses: fertilisers (ammonium nitrate, CAN), explosives (TNT, nitroglycerine), dyes and drugs, purifying/etching metals (parting gold and silver, aqua regia)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A catfish is 2.00 m below the surface of a smooth lake. What is the diameter of the circle on the surface through which the fish can see the world outside the water? If the fish descends, does the diameter of the circle increase, decrease or remain the same? (Refractive index of water = 1.33, air = 1.00) (3 marks)', 'The fish sees the outside world only through rays that refract into the water at angles up to the critical angle C (rays grazing the surface).
sin C = n_air/n_water = 1/1.33, so C ≈ 48.8°.
The radius of the circle on the surface is r = d tan C = 2.00 × tan 48.8° = 2.00 × 1.14 ≈ 2.28 m, so the diameter ≈ 4.56 m.
Since r = d tan C and C is fixed, the circle''s diameter increases in proportion to depth when the fish descends.', null, '[{"point": "Light from outside reaches the fish only within the critical angle: sin C = 1/1.33, C ≈ 48.8°", "marks": 1}, {"point": "Radius r = d tan C = 2.00 × tan 48.8° ≈ 2.28 m, so diameter ≈ 4.56 m", "marks": 1}, {"point": "r = d tan C, so the diameter increases as the fish goes deeper", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A block of wood floats in water with two-thirds of its volume submerged. In oil the block floats with 0.90 of its volume submerged. Find the density of (a) the wood and (b) the oil. (Density of water = 1000 kg/m³) (3 marks)', 'For a floating body, weight = buoyant force: ρ_body × V = ρ_liquid × V_submerged.
(a) In water: ρ_wood = (2/3) × 1000 ≈ 667 kg/m³ (0.667 g/cm³).
(b) In oil: ρ_wood = 0.90 ρ_oil, so ρ_oil = 667/0.90 ≈ 741 kg/m³ (0.741 g/cm³).', null, '[{"point": "Floating: weight = weight of liquid displaced, so ρ_wood V = ρ_liquid × (fraction submerged) × V", "marks": 1}, {"point": "(a) ρ_wood = (2/3) × 1000 ≈ 667 kg/m³", "marks": 1}, {"point": "(b) ρ_oil = 667/0.90 ≈ 741 kg/m³", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Assume the tariff of a transmission and distribution company for its low-voltage consumers is: Block I 0-100 kWh/month at Nu. 0.80/kWh; Block II 101-300 kWh at Nu. 1.20/kWh; Block III above 300 kWh at Nu. 1.85/kWh; plus a fixed charge of Nu. 50/month. If the total power drawn by your appliances is 2 kW and you use them for five hours each day, what will your electricity bill be for a 30-day month? (3 marks)', 'Energy used = power × time = 2 kW × 5 h/day × 30 days = 300 kWh.
Block I (first 100 kWh): 100 × 0.80 = Nu. 80.
Block II (next 200 kWh, 101-300): 200 × 1.20 = Nu. 240.
Nothing falls in Block III.
Total = 80 + 240 + 50 (fixed) = Nu. 370 for the month. (A 31-day month: 310 kWh, adding 10 × 1.85 = Nu. 18.50, total Nu. 388.50.)', null, '[{"point": "Energy = 2 kW × 5 h × 30 days = 300 kWh", "marks": 1}, {"point": "Block I: 100 × 0.80 = Nu. 80; Block II: 200 × 1.20 = Nu. 240", "marks": 1}, {"point": "Bill = 80 + 240 + 50 fixed = Nu. 370", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the Clean Development Mechanism (CDM)? Name three greenhouse gases. How can CDM projects benefit developing countries? (3 marks)', 'The Clean Development Mechanism is one of the flexible mechanisms of the Kyoto Protocol (1997). It allows industrialised (Annex I) countries with emission-reduction commitments to fund projects that reduce greenhouse-gas emissions in developing countries. Each tonne of CO₂-equivalent reduced earns a Certified Emission Reduction (CER) credit, which the investor can count towards its own target.
Greenhouse gases: carbon dioxide (CO₂), methane (CH₄) and nitrous oxide (N₂O) (also HFCs, PFCs and SF₆).
Benefits to developing countries: new investment and income from selling carbon credits, transfer of clean technology and know-how, and support for sustainable development - renewable energy, cleaner industry, jobs and reduced local pollution. Bhutan, for example, registered the Dagachhu hydropower project under the CDM.', null, '[{"point": "CDM: a Kyoto Protocol mechanism letting industrialised (Annex I) countries invest in emission-reduction projects in developing countries and earn certified emission reduction (CER) credits towards their targets", "marks": 1}, {"point": "Greenhouse gases (any three): carbon dioxide (CO₂), methane (CH₄), nitrous oxide (N₂O), HFCs, PFCs, SF₆", "marks": 1}, {"point": "Benefits: foreign investment and income from selling carbon credits, transfer of clean technology, sustainable development such as renewable energy and jobs (e.g. Bhutan''s Dagachhu hydropower was registered under CDM)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Draw an XOR gate with inputs A and B and output X, and give the truth table for the XOR gate. (3 marks)', 'Symbol: the XOR gate is drawn like an OR gate (curved input side, pointed output) with an extra curved line just before the inputs. Inputs A and B enter on the left; the output X leaves on the right. X = A ⊕ B = A''B + AB''.
Truth table:
A | B | X
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 0
The output is 1 only when the two inputs are different.', null, '[{"point": "Symbol: an OR-gate shape with an extra curved line on the input side; inputs A, B; output X = A ⊕ B = A''B + AB''", "marks": 1}, {"point": "Truth table rows: A=0,B=0 → X=0; A=0,B=1 → X=1", "marks": 1}, {"point": "A=1,B=0 → X=1; A=1,B=1 → X=0 (output is 1 only when the inputs differ)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "source": {"title": "BCSE 2012 Main Examination, Technical Paper II, Engineering", "year": 2012, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2012 from me_q where key = 'S10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which element has the electronic configuration 2, 8, 1?', null, 'Sodium (Z = 11) has 2, 8, 1 - one valence electron, so it is an alkali metal.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neon', false, 1), ('B', 'Potassium', false, 2), ('C', 'Sodium', true, 3), ('D', 'Magnesium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following gases is the main cause of the greenhouse effect from burning fossil fuels?', null, 'Burning coal, oil and gas releases carbon dioxide, the main human-made greenhouse gas.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Argon', false, 1), ('B', 'Nitrogen', false, 2), ('C', 'Carbon dioxide', true, 3), ('D', 'Oxygen', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an output device?', null, 'A monitor displays output; the others are input devices.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Microphone', false, 1), ('B', 'Keyboard', false, 2), ('C', 'Scanner', false, 3), ('D', 'Monitor', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ''brain'' of the computer that executes instructions is the', null, 'The central processing unit (CPU) fetches, decodes and executes program instructions.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2012, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RAM', false, 1), ('B', 'Motherboard', false, 2), ('C', 'Hard disk', false, 3), ('D', 'CPU', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
