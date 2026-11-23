-- ME Paper II (Technical, Engineering): BCSE 2013, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'engineering-general-subject-knowledge', 'Engineering: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Find the value of the determinant |2 5 7; 0 1 −8; 0 −3 4| (rows separated by semicolons).', null, 'Expand along the first column: 2 × (1 × 4 − (−8)(−3)) = 2 × (4 − 24) = −40.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2', false, 1), ('B', '-7', false, 2), ('C', '– 40', true, 3), ('D', '47', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a box, there are 6 red socks and 4 blue socks, what is the probability of getting 3 red socks in a draw of three socks from the box?', null, 'P = C(6, 3)/C(10, 3) = 20/120 = 1/6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1/6', true, 1), ('B', '3/6', false, 2), ('C', '3/10', false, 3), ('D', '1/10', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Evaluate sin(cos⁻¹(3/5)).', null, 'If cos θ = 3/5 (θ acute) then sin θ = √(1 − 9/25) = 4/5.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3/5', false, 1), ('B', '5/3', false, 2), ('C', '1', false, 3), ('D', '4/5', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Dorji can paint a room in 60 minutes, Karma can paint it in 30 minutes, and Wangmo can paint it in 20 minutes. How much time will they take to paint the same together?', null, 'Combined rate = 1/60 + 1/30 + 1/20 = (1 + 2 + 3)/60 = 1/10 room per minute, so 10 minutes.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '24 minutes', false, 1), ('B', '10 minutes', true, 2), ('C', '36 minutes', false, 3), ('D', '5 minutes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Evaluate ∫ cos 2x dx.', null, '∫cos 2x dx = (1/2) sin 2x + c.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '−½ cos x + c', false, 1), ('B', '½ cos 2x + c', false, 2), ('C', '½ cos x + c', false, 3), ('D', '½ sin 2x + c', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Lhamo spends 25% of her salary on housing, 25% on food, 10% on clothing, 20% on fuel and rest on miscellaneous items. If she spends Nu. 2500 on miscellaneous items, her salary is', null, 'Miscellaneous = 100 − (25 + 25 + 10 + 20) = 20% of salary = Nu. 2500, so salary = 2500/0.20 = Nu. 12,500.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nu. 10,500', false, 1), ('B', 'Nu. 13,500', false, 2), ('C', 'Nu. 11,500', false, 3), ('D', 'Nu. 12,500', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Using all the letters of the word "BHUTAN", how many words (arrangements) can be formed if every word must begin with the letter "U"?', null, 'BHUTAN has 6 different letters. With U fixed first, the other 5 can be arranged in 5! = 120 ways.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '60', false, 1), ('B', '120', true, 2), ('C', '540', false, 3), ('D', '720', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following fractions is less than 3/4?', null, '2/3 ≈ 0.667 < 0.75; 5/6, 7/8 and 8/9 are all greater than 3/4.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '8/9', false, 1), ('B', '2/3', true, 2), ('C', '5/6', false, 3), ('D', '7/8', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A worker is paid at a rate of US $ 10 per hour and ½ the rate for any hours worked over 7 hours in a day. If the consultant started working at 9:00 A.M. and left work at 8:18 P.M with 30 minutes lunch break in between. How much will he get paid for that day?', null, '9:00 A.M. to 8:18 P.M. = 11 h 18 min; minus 30 min lunch = 10.8 h. First 7 h × $10 = $70; 3.8 h × $5 = $19. Total $89.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'US $ 89', true, 1), ('B', 'US $ 87', false, 2), ('C', 'US $ 110', false, 3), ('D', 'US $ 100', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A garment store sold 560 ghos on 1st day of school and 800 ghos on 2nd day of school. What is the percent increase in the number of ghos sold by the store?', null, 'Increase = 240; 240/560 × 100 ≈ 42.9% ≈ 43%.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '30%', false, 1), ('B', '70%', false, 2), ('C', '43%', true, 3), ('D', '143%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Factor and solve 2x² − 5x + 3 = 0.', null, '2x² − 5x + 3 = (2x − 3)(x − 1) = 0, so x = 1 or x = 3/2.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'x = 1, x = 3/2', true, 1), ('B', 'x = 5, x = 3', false, 2), ('C', 'x = −2, x = −3/2', false, 3), ('D', 'x = −1, x = −3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Convert 135° into radians.', null, '135 × π/180 = 3π/4.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3π/4', true, 1), ('B', 'π/2', false, 2), ('C', '4π/3', false, 3), ('D', '2π', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The volume of a cylinder with a radius of 3 cm and height of 4 cm is', null, 'V = πr²h = π × 9 × 4 = 36π ≈ 113.1 cm³.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '75.36 cm³', false, 1), ('B', '113.11 cm³', true, 2), ('C', '150.72 cm³', false, 3), ('D', '36 cm³', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A wire is bent to form a square of area 100 cm². If the same wire is then bent to form a circle, the radius of the circle will be', null, 'Side = 10 cm, so the wire is 40 cm. 2πr = 40 gives r = 40/(2π) ≈ 6.37 ≈ 6.4 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4.5 cm', false, 1), ('B', '5.6 cm', false, 2), ('C', '6.4 cm', true, 3), ('D', '10 cm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Karma is 8 years older than his sister. If he is 29 years old in 2013, in which year was his sister born?', null, 'The sister is 29 − 8 = 21 in 2013, so she was born in 1992.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1992', true, 1), ('B', '1994', false, 2), ('C', '2005', false, 3), ('D', '1984', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Find the area of the shaded region in the figure (a 12 cm wide, 8 cm high figure with an unshaded 6 cm wide middle part, two shaded side strips and a shaded right triangle of base 6 cm and height 5 cm on top).', null, 'Side strips: (12 − 6)/2 = 3 cm wide, so 2 × 3 × 8 = 48 cm²; triangle ½ × 6 × 5 = 15 cm². Total = 63 cm².', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, '/papers/me/tech2-eng-2013-shaded.png')
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '72 cm²', false, 1), ('B', '63 cm²', true, 2), ('C', '48 cm²', false, 3), ('D', '30 cm²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How many subsets does the set {a, e, i, o, u} have?', null, 'A set with n elements has 2ⁿ subsets: 2⁵ = 32.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12', false, 1), ('B', '5', false, 2), ('C', '32', true, 3), ('D', '26', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The value of tan⁻¹(1) + cos⁻¹(−1/2) + sin⁻¹(−1/2) is', null, 'tan⁻¹1 = π/4, cos⁻¹(−1/2) = 2π/3, sin⁻¹(−1/2) = −π/6. Sum = (3π + 8π − 2π)/12 = 9π/12 = 3π/4.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2π/3', false, 1), ('B', 'π', false, 2), ('C', 'π/2', false, 3), ('D', '3π/4', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The coordinates of the point which divides the line joining (1, 3, 7) and (6, 3, 2) internally in the ratio 2 : 3 are', null, 'Section formula (m : n = 2 : 3): x = (2·6 + 3·1)/5 = 3, y = (2·3 + 3·3)/5 = 3, z = (2·2 + 3·7)/5 = 5. Point (3, 3, 5).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(3,4,5)', false, 1), ('B', '(3,3,5)', true, 2), ('C', '(7,6,9)', false, 3), ('D', '(6,9,10)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If y = 4x³ + 4x² + 3x + 10, the second derivative d²y/dx² is', null, 'dy/dx = 12x² + 8x + 3; d²y/dx² = 24x + 8.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '24x² + 3x', false, 1), ('B', '12x + 8', false, 2), ('C', '24x + 8', true, 3), ('D', '12x² + 8x + 3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ba is the Chemical symbol of which element?', null, 'Ba is barium (boron B, beryllium Be, bromine Br).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Beryllium', false, 1), ('B', 'Boron', false, 2), ('C', 'Barium', true, 3), ('D', 'Bromine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Atomic Number would refer to the', null, 'Atomic number = number of protons (the proton number).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Proton Number', true, 1), ('B', 'All of the above', false, 2), ('C', 'No. of Protons and Neutrons', false, 3), ('D', 'Nucleon Number', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is not an Alkali Metal', null, 'I (iodine) is a halogen; Li, Na and K are alkali metals.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'K', false, 1), ('B', 'Na', false, 2), ('C', 'I', true, 3), ('D', 'Li', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the value in place of the question mark in the chemical equation 2Fe + 3Cl₂ → ? FeCl₃', null, '2Fe + 3Cl₂ → 2FeCl₃ (2 Fe and 6 Cl on each side).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', false, 1), ('B', '5', false, 2), ('C', '4', false, 3), ('D', '2', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When the electrons are either lost or gained, which type of chemical bonds form?', null, 'Transfer (loss and gain) of electrons forms ionic bonds; sharing forms covalent bonds.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Metallic', false, 1), ('B', 'Covalent', false, 2), ('C', 'Ionic', true, 3), ('D', 'Van Der Waal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pH value of pure dihydrogen monoxide (water) at 25 °C is generally considered to be:', null, 'Pure water is neutral: pH = 7 at 25 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'More than 7', false, 1), ('B', 'Less than 7', false, 2), ('C', 'equal to 7', true, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The formulas CH₄ and C₆H₁₂O₆ stand for which compounds?', null, 'CH₄ is methane and C₆H₁₂O₆ is glucose (sucrose is C₁₂H₂₂O₁₁, benzene C₆H₆).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Benzene and methane', false, 1), ('B', 'Methane and glucose', true, 2), ('C', 'Benzene and sucrose', false, 3), ('D', 'Glucose and sucrose', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which acid is used for manufacturing TNT and CAN (calcium ammonium nitrate) and for separating gold from silver impurities?', null, 'Nitric acid nitrates toluene to TNT, makes ammonium nitrate for CAN, and dissolves silver (not gold) in ''parting'' gold from silver.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'H₂SO₄', false, 1), ('B', 'HCl', false, 2), ('C', 'CH₃COOH', false, 3), ('D', 'HNO₃', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a chemical reaction, what is the role of a catalyst?', null, 'A catalyst lowers the activation energy; it does not change ΔH, the products or the equilibrium constant.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To change the Equilibrium Constant', false, 1), ('B', 'To change the Product of the Reaction', false, 2), ('C', 'To change the Activation Energy', true, 3), ('D', 'To change the Heat of Reaction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An isothermal process is best described by which of the following?', null, 'Isothermal means constant temperature (ΔT = 0) while heat is exchanged (Q ≠ 0).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ΔT ≠ 0 and Q ≠ 0', false, 1), ('B', 'All of the above', false, 2), ('C', 'ΔT ≠ 0 but Q = 0', false, 3), ('D', 'ΔT = 0 but Q ≠ 0', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Complete the reaction: H₂ + Cl₂ →', null, 'H₂ + Cl₂ → 2HCl.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M31' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2HCl', true, 1), ('B', 'Cl₂H', false, 2), ('C', 'HCl + H', false, 3), ('D', 'H₂Cl₂', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Molarity is usually denoted in which of the following units:', null, 'Molarity = moles of solute per litre of solution: mol L⁻¹.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M32' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'mol × L', false, 1), ('B', 'mol L⁻¹', true, 2), ('C', 'L × mol', false, 3), ('D', 'L/mol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following dissolves in “King’s Water” or the “Aqua Regia”?', null, 'Aqua regia (3 HCl : 1 HNO₃) dissolves the noble metals gold and platinum.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M34' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gold and Platinum', true, 1), ('B', 'Titanium and Iridium', false, 2), ('C', 'Tantalum and Osmium', false, 3), ('D', 'Ruthenium and rhodium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The chemical equation H₂SO₄ + 2NH₄OH → (NH₄)₂SO₄ + 2H₂O represents which type of chemical reaction?', null, 'Acid + base → salt + water: a neutralisation reaction.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M35' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Synthesis reaction', false, 1), ('B', 'Decomposition reaction', false, 2), ('C', 'Combustion reaction', false, 3), ('D', 'Neutralization reaction', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following has the highest boiling point?', null, 'Mercury boils at 357 °C; water at 100 °C, oxygen at −183 °C, and olive oil decomposes (smokes) before boiling.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M36' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Water', false, 1), ('B', 'Oxygen', false, 2), ('C', 'Mercury', true, 3), ('D', 'Olive oil', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The process of evaporation of a liquid is accompanied by:', null, 'Evaporation turns an ordered liquid into a disordered gas, so randomness (entropy) increases.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M37' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'No change in the free energy', false, 1), ('B', 'An increase of “sum of the internal Energy”', false, 2), ('C', 'An increase in the “Randomness or the disorder of the system”', true, 3), ('D', 'A decrease in the “Randomness or the disorder of the system”', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bauxite, Corrundum and Cryolite are Important ores of which of the following metal', null, 'Bauxite, corundum (Al₂O₃) and cryolite (Na₃AlF₆) are aluminium minerals.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M38' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aluminium', true, 1), ('B', 'Gold', false, 2), ('C', 'Tin', false, 3), ('D', 'Silver', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If two organic compounds have same molecular formula but different structural formula, they are called?', null, 'Same molecular formula, different structures - isomers.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M39' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Isotopes', false, 1), ('B', 'Allotrops', false, 2), ('C', 'Polymers', false, 3), ('D', 'Isomers', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following would give maximum energy in metabolic process?', null, 'Lipids (fats) give about 9 kcal/g, more than carbohydrates or proteins (about 4 kcal/g); vitamins give no energy.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M40' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamins', false, 1), ('B', 'Carbohydrates', false, 2), ('C', 'Proteins', false, 3), ('D', 'Lipids', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What force (in newtons) will produce an acceleration of 3.5 m/s² in a body of mass 12.5 kg?', null, 'F = ma = 12.5 × 3.5 = 43.75 N.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M41' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '42.75 N', false, 1), ('B', '40.15 N', false, 2), ('C', '43.75 N', true, 3), ('D', '41.15 N', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What type of electric charge would a glass rod develop, when it is rubbed with silk?', null, 'Glass loses electrons to silk, so the glass rod becomes positively charged.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M42' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Negative charge', false, 1), ('B', 'No electricity at all', false, 2), ('C', 'Positive charge', true, 3), ('D', 'May be positive or negative', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Calculate the work done in lifting a mass of 8 kg to a height of 2.5 m. Assume g = 9.8 m/s².', null, 'W = mgh = 8 × 9.8 × 2.5 = 196 J.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M43' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '78.4 J', false, 1), ('B', '196 J', true, 2), ('C', '24.5 J', false, 3), ('D', '20 J', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Calculate the kinetic energy of a 20 kg mass moving with a speed of 4 m/s.', null, 'KE = ½mv² = ½ × 20 × 16 = 160 J.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M44' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '160 J', true, 1), ('B', '784 J', false, 2), ('C', '40 J', false, 3), ('D', '80 J', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The mechanical advantage of a machine is given by', null, 'Mechanical advantage = load/effort.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M45' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Load/effort', true, 1), ('B', 'All of the above', false, 2), ('C', 'Load x effort', false, 3), ('D', 'Effort / load', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is true about Class III levers?', null, 'In a class III lever (e.g. tweezers, forearm) the effort is between the fulcrum and the load.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M46' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Load is in between fulcrum and the effort', false, 1), ('B', 'None of the above', false, 2), ('C', 'Fulcrum is in between load and the effort', false, 3), ('D', 'Effort is in between fulcrum and the load', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statement is Not True about the liquid pressure?', null, 'Liquid pressure p = hρg is directly (not inversely) proportional to density.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M47' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Is inversely proportional to density of the liquid', true, 1), ('B', 'Is same at all points in a horizontal plane in a liquid', false, 2), ('C', 'Depends on depth', false, 3), ('D', 'Is same in all directions about a point in a liquid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A parallel beam of light enters a box through an opening, as shown in the diagram. Which device should be placed in the box (in place of the question mark) to produce a tiny spot of light on the screen?', null, 'A convex (converging) lens brings the parallel beam to a focus - a tiny bright spot on the screen.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, '/papers/me/tech2-eng-2013-lens-box.png')
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M48' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A convex lens', true, 1), ('B', 'A concave lens', false, 2), ('C', 'An opaque sheet', false, 3), ('D', 'A prism', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The unit of Resistivity is:', null, 'ρ = RA/L, so the unit is Ω × m²/m = ohm-metre.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M49' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'ohm per metre (Ω/m)', false, 2), ('C', 'ohm (Ω)', false, 3), ('D', 'ohm-metre (Ω m)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What potential difference is required to pass a current of 0.3 A through a copper wire of resistance 40 Ω?', null, 'V = IR = 0.3 × 40 = 12 V.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M50' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.0075 V', false, 1), ('B', '12 V', true, 2), ('C', '120 V', false, 3), ('D', '133.33 V', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A uniform magnetic field is represented by a set of lines which are:', null, 'A uniform field is shown by parallel, equally spaced lines.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M51' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Parallel', true, 1), ('B', 'None of the above', false, 2), ('C', 'Convergent', false, 3), ('D', 'Divergent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which statement is true of an equipotential surface?', null, 'All points on an equipotential surface are at the same potential, so no work is done moving a charge along it; field lines are perpendicular to it.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M52' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Work done in moving any charge from one point to the other on an equipotential surface is infinity', false, 1), ('B', 'Work done in moving any charge from one point to the other on an equipotential surface is Zero', true, 2), ('C', 'All of the above', false, 3), ('D', 'A line of force is always at parallel to an equipotential surface', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In an electromagnetic wave, the electric and magnetic fields are :', null, 'In an electromagnetic wave E and B are perpendicular to each other (and to the direction of travel).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M53' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Parallel to each other', false, 1), ('B', 'Inclined at acute angle', false, 2), ('C', 'Inclined at obtuse angle', false, 3), ('D', 'Perpendicular to each other', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following does NOT support the wave nature of light?', null, 'The photoelectric effect shows the particle (photon) nature of light; the others are wave effects.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M54' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Interference', false, 1), ('B', 'Polarisation', false, 2), ('C', 'Photoelectric effect', true, 3), ('D', 'Diffraction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The wavelength of an electromagnetic wave of frequency 100 Hz is (c = 3 × 10⁸ m/s):', null, 'λ = c/f = 3 × 10⁸/100 = 3 × 10⁶ m.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M55', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M55' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3 × 10⁶ m', true, 1), ('B', '4 × 10⁶ m', false, 2), ('C', '5 × 10⁶ m', false, 3), ('D', '2 × 10⁶ m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The focal length of a convex (glass) lens is 30 cm when measured in air. When it is measured in water, the focal length is', null, 'In water the lens bends light less (smaller relative refractive index), so its focal length becomes longer than 30 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M56', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M56' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Equal to 30 cm', false, 1), ('B', 'None of the above', false, 2), ('C', 'Less than 30 cm', false, 3), ('D', 'Greater than 30 cm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M56';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cathode rays are:', null, 'Cathode rays are streams of electrons emitted from the cathode.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M57', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M57' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A beam of electrons emitted by the cathode', true, 1), ('B', 'A beam of negatively charged ions moving towards the anode', false, 2), ('C', 'Electromagnetic waves', false, 3), ('D', 'A beam of atoms moving towards the cathode', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is used as fuel by the nuclear reactor?', null, 'Uranium (U-235) is the fuel; heavy water and graphite are moderators and cadmium absorbs neutrons in control rods.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M58', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M58' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Graphite', false, 1), ('B', 'Uranium', true, 2), ('C', 'Heavy water', false, 3), ('D', 'Cadmium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is true about semiconductors?', null, 'Semiconductors have a small band gap (about 1 eV) between the valence and conduction bands.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M59', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M59' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Their valence band is unfilled', false, 1), ('B', 'They have a small gap between the conduction band and the valence band', true, 2), ('C', 'None of the above', false, 3), ('D', 'They have a big gap between the conduction band and the valence band', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A URL is a formatted text string used by web browsers, e-mail clients and other software to identify a network resource on the Internet. URL stands for', null, 'URL = Uniform Resource Locator.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M61', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M61' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Universal Reference Link', false, 1), ('B', 'Unlimited Resource Locator', false, 2), ('C', 'Uniform Resource Locator', true, 3), ('D', 'Universal Resource Link', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A physical device that joins multiple networks together is called a', null, 'A router joins (routes traffic between) different networks.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M62', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M62' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bluetooth', false, 1), ('B', 'Driver', false, 2), ('C', 'Router', true, 3), ('D', 'Cable', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M62';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '……….is a technology that allows telephone calls to be made over computer networks like the Internet.', null, 'VoIP (Voice over Internet Protocol) carries telephone calls over IP networks.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M63', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M63' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'GSM', false, 1), ('B', 'VoIP', true, 2), ('C', 'Modem', false, 3), ('D', 'CDMA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To identify TCP/IP errors such as connection problems…….command can be used', null, 'Ping tests whether a host can be reached over TCP/IP and measures the round-trip time.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M64', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M64' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'FTP', false, 1), ('B', 'Ping', true, 2), ('C', 'STP', false, 3), ('D', 'POP3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Software is a set of programs, which is designed to perform a well defined function and there are two types of software, application and system. The following are all application software except for', null, 'Microsoft Windows is an operating system (system software); Word, Excel and PowerPoint are applications.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M66', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M66' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Microsoft Windows', true, 1), ('B', 'Microsoft Power Point', false, 2), ('C', 'Microsoft Word', false, 3), ('D', 'Microsoft Excel', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M66';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '1 gigabyte (GB) is equal to', null, '1 GB = 1024 MB.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M67', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M67' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1024 KB', false, 1), ('B', '1024 bytes', false, 2), ('C', '1024 TB', false, 3), ('D', '1024 MB', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M67';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The fourth generation computers are based on', null, 'Fourth-generation computers use VLSI microprocessors.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M68', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M68' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ULSI microprocessor', false, 1), ('B', 'Transistor', false, 2), ('C', 'Integrated circuit', false, 3), ('D', 'VLSI microprocessor', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M68';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the following are computer input devices except for', null, 'A printer is an output device.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M69', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M69' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Keyboard', false, 1), ('B', 'Printer', true, 2), ('C', 'Mouse', false, 3), ('D', 'Joy Stick', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A CD-RW drive has a speed rating of 12x 10x 32x. What do the three numbers refer to, in order?', null, 'CD-RW speed ratings are given as write × rewrite × read: 12x write, 10x rewrite, 32x read.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M70', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'M70' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Read, write, rewrite', false, 1), ('B', 'Write, rewrite, read', true, 2), ('C', 'Write, read, rewrite', false, 3), ('D', 'Rewrite, read, write', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M70';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Divide the number 10 into 2 parts so that the product of the square of the first number and the cube of the second number is the greatest possible. (3 marks)', 'Let the first part be x and the second 10 − x. P = x²(10 − x)³.
dP/dx = 2x(10 − x)³ − 3x²(10 − x)² = x(10 − x)²[2(10 − x) − 3x] = x(10 − x)²(20 − 5x).
Setting dP/dx = 0 (with 0 < x < 10) gives x = 4. P increases for x < 4 and decreases for x > 4, so x = 4 gives the maximum.
The parts are 4 and 6, and the greatest product is 4² × 6³ = 16 × 216 = 3,456.', null, '[{"point": "Let the parts be x and 10 − x; maximise P = x²(10 − x)³", "marks": 1}, {"point": "dP/dx = x(10 − x)²(20 − 5x) = 0 gives x = 4 (second derivative/sign check shows a maximum)", "marks": 1}, {"point": "Parts 4 and 6; maximum product 4² × 6³ = 3,456", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'If y = √(1 + x²), find dy/dx. (3 marks)', 'y = (1 + x²)^(1/2). By the chain rule, dy/dx = ½(1 + x²)^(−1/2) × d/dx(1 + x²) = ½(1 + x²)^(−1/2) × 2x = x/√(1 + x²).', null, '[{"point": "Write y = (1 + x²)^(1/2) and use the chain rule", "marks": 1}, {"point": "dy/dx = ½(1 + x²)^(−1/2) × 2x", "marks": 1}, {"point": "dy/dx = x/√(1 + x²)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Given that log₉(x) = 15, find the value of log₃(x/9). (3 marks)', 'log₉x = 15 means x = 9¹⁵ = (3²)¹⁵ = 3³⁰, so log₃x = 30.
log₃(x/9) = log₃x − log₃9 = 30 − 2 = 28.', null, '[{"point": "x = 9¹⁵ = 3³⁰ (or log₃x = 2 log₉x = 30)", "marks": 1}, {"point": "log₃(x/9) = log₃x − log₃9", "marks": 1}, {"point": "= 30 − 2 = 28", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'List three important differences between atoms and ions. (3 marks)', '1. Charge: an atom has equal numbers of protons and electrons and is neutral; an ion has more or fewer electrons than protons, so it is charged (cation +, anion −).
2. Stability and reactivity: ions are formed when atoms lose or gain electrons, generally achieving a stable noble-gas configuration, so many ions are more stable than their atoms (e.g. Na⁺ vs Na).
3. Size: a cation is smaller than its atom (fewer electrons, same nuclear charge) and an anion is larger than its atom.
Also: ions in solution or molten salts conduct electricity, and ions have different chemical properties from their atoms (Cl⁻ is harmless, Cl₂ is toxic).', null, '[{"point": "Charge: an atom is electrically neutral (protons = electrons); an ion carries a positive or negative charge (protons ≠ electrons)", "marks": 1}, {"point": "Formation/stability: ions form when atoms lose or gain electrons, usually reaching a stable (noble-gas) configuration; most atoms (except noble gases) are reactive", "marks": 1}, {"point": "Size: a cation is smaller and an anion larger than its parent atom (also: ions can exist in solution/lattices and conduct electricity when free; atoms of most elements do not exist independently)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'When 5.5 g of a substance is dissolved in 50 g of water, it lowers the freezing point of water by 1.15 °C. Calculate the relative molecular mass of the substance. (Kf for water = 1.86 °C kg mol⁻¹) (3 marks)', 'ΔTf = Kf × m, where m is the molality.
m = 1.15/1.86 = 0.618 mol per kg of water.
Moles of solute in 50 g (0.050 kg) of water = 0.618 × 0.050 = 0.0309 mol.
Molar mass = 5.5/0.0309 ≈ 178 g/mol.
(In one line: M = Kf × w × 1000/(ΔTf × W) = 1.86 × 5.5 × 1000/(1.15 × 50) ≈ 178.)', null, '[{"point": "ΔTf = Kf × m, so molality m = 1.15/1.86 = 0.618 mol/kg", "marks": 1}, {"point": "Moles of solute = 0.618 × 0.050 kg = 0.0309 mol", "marks": 1}, {"point": "M = 5.5/0.0309 ≈ 178 g/mol (relative molecular mass ≈ 178)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the first law of thermodynamics? Based on this law, briefly explain the terms (i) isochoric process and (ii) adiabatic process. (3 marks)', 'First law of thermodynamics: energy can neither be created nor destroyed. Heat Q supplied to a system goes into increasing its internal energy ΔU and doing work W: Q = ΔU + W.
(i) Isochoric process: the volume stays constant, so the system does no work (W = 0). Then ΔU = Q - all heat supplied raises the internal energy (temperature), e.g. heating gas in a rigid closed container.
(ii) Adiabatic process: no heat enters or leaves (Q = 0), e.g. a well-insulated or very fast process. Then ΔU = −W: when the gas expands and does work its internal energy falls and it cools; when it is compressed it heats up (as in a bicycle pump).', null, '[{"point": "First law: energy is conserved - heat supplied to a system = increase in internal energy + work done by the system (Q = ΔU + W)", "marks": 1}, {"point": "Isochoric: volume constant, so no work is done (W = 0) and all heat changes the internal energy: ΔU = Q", "marks": 1}, {"point": "Adiabatic: no heat exchange (Q = 0), so ΔU = −W: work done by the gas lowers its internal energy (it cools), work done on it heats it", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The half-life of one isotope of radium is about 1,600 years. In a given sample of this isotope, about how long will it take for 15/16 of the radium atoms to decay? (3 marks)', 'If 15/16 of the atoms decay, 1/16 remains. After n half-lives the fraction left is (1/2)ⁿ; (1/2)⁴ = 1/16, so n = 4.
Time = 4 × 1,600 = 6,400 years.', null, '[{"point": "If 15/16 decays, 1/16 remains", "marks": 1}, {"point": "1/16 = (1/2)⁴, so 4 half-lives have passed", "marks": 1}, {"point": "Time = 4 × 1,600 = 6,400 years", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Two bulbs have these ratings: bulb (a) 100 W / 220 V and bulb (b) 1000 W / 220 V. If the two bulbs are connected in series, which one will glow more brightly? Explain. (3 marks)', 'Resistance of each bulb: R = V²/P.
R_a = 220²/100 = 484 Ω; R_b = 220²/1000 = 48.4 Ω.
In series the same current I flows through both, so the power in each is P = I²R. Since R_a is ten times R_b, bulb (a) dissipates ten times as much power.
So the 100 W bulb (a) glows more brightly (and the 1000 W bulb glows only dimly).', null, '[{"point": "R = V²/P: R_a = 220²/100 = 484 Ω; R_b = 220²/1000 = 48.4 Ω", "marks": 1}, {"point": "In series the same current flows through both, so power P = I²R is larger in the larger resistance", "marks": 1}, {"point": "Bulb (a), the 100 W bulb, glows more brightly", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The diagram shows the free-body diagram of an object of mass 100 kg on a very smooth inclined surface at 45°. Using vector resolution, find the weight (F_gravity) and the net force (F_net) on the object. (Assume negligible friction and air resistance; g = 9.8 m/s².) (3 marks)', 'Weight: F_gravity = mg = 100 × 9.8 = 980 N, acting vertically downward.
Resolve the weight along and perpendicular to the incline (angle 45°):
• perpendicular to the surface: mg cos 45° = 980 × 0.707 ≈ 693 N, balanced by the normal reaction of the surface;
• along the surface: mg sin 45° = 980 × 0.707 ≈ 693 N.
With no friction, the net force is F_net = mg sin 45° ≈ 693 N, directed down the slope, giving an acceleration of g sin 45° ≈ 6.93 m/s².', null, '[{"point": "F_gravity = mg = 100 × 9.8 = 980 N, vertically downward", "marks": 1}, {"point": "Resolve: component perpendicular to the slope mg cos 45° ≈ 693 N is balanced by the normal reaction", "marks": 1}, {"point": "F_net = mg sin 45° = 980 × 0.707 ≈ 693 N down the slope (acceleration g sin 45° ≈ 6.93 m/s²)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, '/papers/me/tech2-eng-2013-incline.png')
  returning id
)
insert into me_q select 'S9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Spam is unsolicited e-mail from an unknown source which can create problems for your computer. Mention two ways of preventing spam. (3 marks)', '1. Use spam filters: switch on the junk-mail/spam filter of the e-mail service or client and keep antivirus and anti-malware software updated, so suspicious mail is moved aside automatically.
2. Protect your address and behave carefully: do not post your e-mail address openly on websites, never reply to or click links/attachments in unknown mail, block persistent senders, and use a separate address for online sign-ups.
(Also: report spam to the e-mail provider; use ''unsubscribe'' only for genuine companies.)', null, '[{"point": "Use spam filters / junk-mail settings in the e-mail service and keep antivirus/anti-malware updated", "marks": 1.5}, {"point": "Do not publish your address openly or reply to/click links in unknown mail; block senders, use unsubscribe only for genuine senders, use a separate address for sign-ups", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "source": {"title": "BCSE 2013 Main Examination, Technical Paper II, Engineering", "year": 2013, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2013 from me_q where key = 'S10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The number of moles in 22 g of carbon dioxide (CO₂) is', null, 'Molar mass of CO₂ = 12 + 2 × 16 = 44 g/mol; 22/44 = 0.5 mol.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.5', true, 1), ('B', '2', false, 2), ('C', '1', false, 3), ('D', '0.25', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A body of mass 2 kg moving at 3 m/s has a momentum of', null, 'Momentum p = mv = 2 × 3 = 6 kg m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '18 kg m/s', false, 1), ('B', '6 kg m/s', true, 2), ('C', '1.5 kg m/s', false, 3), ('D', '5 kg m/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which number system has base 16?', null, 'Hexadecimal uses 16 symbols: 0-9 and A-F.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2013, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Decimal', false, 1), ('B', 'Octal', false, 2), ('C', 'Binary', false, 3), ('D', 'Hexadecimal', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
