-- ME Paper II (Technical, Engineering): BCSE 2011, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'engineering-general-subject-knowledge', 'Engineering: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '(a + b + c)³ is equal to:', null, 'Standard identity: (a + b + c)³ = a³ + b³ + c³ + 3(a + b)(b + c)(c + a).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a² + 2ab³ + c²', false, 1), ('B', '(a − b)(a² + b² + c²)', false, 2), ('C', 'a³ + b³ + 3ab(a + b)', false, 3), ('D', 'a³ + b³ + c³ + 3(a + b)(b + c)(c + a)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '[ ( ⁴√(x^(−3/4)) )^(−4/3) ]⁴ equals:', null, '⁴√(x^(−3/4)) = x^(−3/16); raised to −4/3 gives x^(1/4); raised to 4 gives x.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'x', true, 1), ('B', 'x⁻²', false, 2), ('C', 'x²', false, 3), ('D', 'x^(1/3)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The determinant of the matrix A = [1 3 −2; 4 1 −1; 5 −3 2] (rows separated by semicolons) is:', null, '1(2 − 3) − 3(8 + 5) + (−2)(−12 − 5) = −1 − 39 + 34 = −6.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '−10', false, 1), ('B', '−8', false, 2), ('C', '5', false, 3), ('D', '−6', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'π/3 radians is the same as:', null, 'π radians = 180°, so π/3 = 60°.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '45°', false, 1), ('B', '90°', false, 2), ('C', '60°', true, 3), ('D', '270°', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Evaluate lim (x → 0) of cos x/(x + 2).', null, 'The function is continuous at 0: cos 0/(0 + 2) = 1/2.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', false, 1), ('B', '½', true, 2), ('C', '2', false, 3), ('D', '1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Let y = x^(2/3) + 2x². Then dy/dx is equal to:', null, 'd/dx x^(2/3) = (2/3)x^(−1/3) and d/dx 2x² = 4x.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'x^(−1/3) + 4x', false, 1), ('B', '5x + x^(2/3)', false, 2), ('C', '(2/3)x^(−1/3) + 4x', true, 3), ('D', 'x + 4x^(2/3)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If log_a √2 = 1/6, then a is equal to:', null, 'a^(1/6) = 2^(1/2), so a = 2³ = 8.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0', false, 1), ('B', '8', true, 2), ('C', '6', false, 3), ('D', '4', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A square plot 40 m × 40 m has a quarter circle of radius 14 m shaded at each corner, as shown. The total area of the unshaded part will be:', null, 'Four quarter circles make one full circle: π × 14² ≈ 616 m². 1600 − 616 ≈ 984 m².', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, '/papers/me/tech2-eng-2011-square.png')
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '984 m²', true, 1), ('B', '1300 m²', false, 2), ('C', '1000 m²', false, 3), ('D', '780 m²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If 3[x y; z w] = [4 x+y; z+w 3] + [x 6; −1 2w] (2 × 2 matrices, rows separated by semicolons), x is equal to:', null, 'Comparing the top-left entries: 3x = 4 + x, so x = 2.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4', false, 1), ('B', '2', true, 2), ('C', '8', false, 3), ('D', '12', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A line passes through (−3, 2) and is perpendicular to the line x + 3y − 5 = 0. Its equation is:', null, 'The given line has slope −1/3, so the perpendicular slope is 3: y − 2 = 3(x + 3), i.e. y − 3x − 11 = 0.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'y − x − 10 = 0', false, 1), ('B', 'y − 3x − 11 = 0', true, 2), ('C', 'y − 5x + 1 = 0', false, 3), ('D', 'y + 2x − 3 = 0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The mean of 100 observations is 50. If one observation of 50 is replaced by 150, the new mean is:', null, 'The total rises from 5000 to 5100, so the mean = 5100/100 = 51.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '57', false, 1), ('B', '101', false, 2), ('C', '151', false, 3), ('D', '51', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a = 1 − √2, the value of (a − 1/a)³ is:', null, '1/a = 1/(1 − √2) = −(1 + √2), so a − 1/a = (1 − √2) + (1 + √2) = 2, and 2³ = 8.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '9', false, 1), ('B', '12', false, 2), ('C', '16', false, 3), ('D', '8', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Karma and Mindu appear in an interview for 2 vacancies. The probability of Karma''s selection is 1/3 and of Mindu''s 1/5. The probability that only one of them is selected is:', null, 'P = (1/3)(4/5) + (2/3)(1/5) = 4/15 + 2/15 = 6/15 = 2/5.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3/5', false, 1), ('B', '1/7', false, 2), ('C', '2/5', true, 3), ('D', '2/3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The modulus of the complex number (2 + 3i)/(3 + 2i) is:', null, '|2 + 3i| = |3 + 2i| = √13, so the modulus of the quotient is 1.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1', true, 1), ('B', '7', false, 2), ('C', '2', false, 3), ('D', '3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Differentiating y = e^(sin x) with respect to x gives:', null, 'Chain rule: dy/dx = e^(sin x) × cos x.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'sin x · e^(cos x)', false, 1), ('B', 'cos x · eˣ', false, 2), ('C', 'cos x · e^(sin x)', true, 3), ('D', 'sin x', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '∫ 1/√x dx is equal to (C is a constant):', null, '∫x^(−1/2) dx = 2x^(1/2) + C = 2√x + C.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2√x', false, 1), ('B', '√x + 2', false, 2), ('C', '1/(2x) + C', false, 3), ('D', '2√x + C', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '∫₀^(π/2) cos x dx is equal to:', null, '[sin x] from 0 to π/2 = 1 − 0 = 1.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'sin x', false, 1), ('B', '2', false, 2), ('C', '1', true, 3), ('D', '0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If ω and ω² are the complex cube roots of unity, (2 − ω + 2ω²)(2 + 2ω − ω²) is equal to:', null, 'Using 1 + ω + ω² = 0: 2 − ω + 2ω² = −3ω and 2 + 2ω − ω² = −3ω². Product = 9ω³ = 9.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7ω', false, 1), ('B', '9', true, 2), ('C', 'ω', false, 3), ('D', '5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The value of the determinant |cos A sin A; −sin A cos A| is:', null, 'cos²A − (−sin²A) = cos²A + sin²A = 1.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2', false, 1), ('B', '1', true, 2), ('C', '2/3', false, 3), ('D', '1/3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The radius and height of a cylinder are in the ratio 2 : 3. If the volume of the cylinder is 1617 cm³, the radius of its base is (π = 22/7):', null, 'r = 2k, h = 3k: (22/7)(4k²)(3k) = 1617, so k³ = 42.875, k = 3.5 and r = 7 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '11 cm', false, 1), ('B', '4 cm', false, 2), ('C', '3.5 cm', false, 3), ('D', '7 cm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sn is the chemical symbol of', null, 'Sn (stannum) is tin; silicon is Si, antimony Sb, strontium Sr.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Antimony', false, 1), ('B', 'Tin', true, 2), ('C', 'Silicon', false, 3), ('D', 'Strontium', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is used as a moderator in nuclear reactors?', null, 'Graphite (or heavy water) slows neutrons down; boron steel absorbs them (control rods); CO₂ is a coolant.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Graphite', true, 1), ('B', 'Aluminium', false, 2), ('C', 'Carbon dioxide', false, 3), ('D', 'Boron steel', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Heating rubber with sulphur is known as', null, 'Vulcanisation cross-links rubber with sulphur, making it harder and more elastic.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sulphonation', false, 1), ('B', 'Vulcanisation', true, 2), ('C', 'Bessemerisation', false, 3), ('D', 'Galvanisation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The pH of a solution whose hydrogen ion concentration is 0.005 mol/L is', null, 'pH = −log 0.005 ≈ 2.3 - acidic, below 7.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Below 7', true, 1), ('B', '7', false, 2), ('C', 'Above 7', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which law states that the amounts of different substances liberated by the same quantity of electricity are proportional to their equivalent weights?', null, 'This is Faraday''s second law of electrolysis (the first: mass ∝ charge passed).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hess''s law', false, 1), ('B', 'Faraday''s first law of electrolysis', false, 2), ('C', 'Faraday''s second law of electrolysis', true, 3), ('D', 'Faraday''s third law of electrolysis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Concentrated nitric acid does not react with', null, 'Concentrated HNO₃ makes aluminium passive by forming a protective oxide layer.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Copper', false, 1), ('B', 'Silver', false, 2), ('C', 'Tin', false, 3), ('D', 'Aluminium', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The functional group of an aldehyde is', null, 'Aldehydes contain −CHO; −OH is alcohol, −COOH carboxylic acid, R−X alkyl halide.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '−COOH', false, 1), ('B', '−X (R−X)', false, 2), ('C', '−OH', false, 3), ('D', '−CHO', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The common name of the compound C₂H₅OH is', null, 'C₂H₅OH is ethanol - ethyl alcohol.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'propyl alcohol', false, 1), ('B', 'ethyl alcohol', true, 2), ('C', 'butanol', false, 3), ('D', 'methyl alcohol', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Biogas is produced by the anaerobic digestion or fermentation of biodegradable materials such as biomass, manure, sewage, municipal and green waste, plant material and crops. Biogas consists primarily of', null, 'Biogas is mostly methane (50-70%) with carbon dioxide.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M31', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M31' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Octane', false, 1), ('B', 'Butane', false, 2), ('C', 'Ethane', false, 3), ('D', 'Methane', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M31';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Natural rubber is a', null, 'Natural rubber is cis-1,4-polyisoprene.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M32', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M32' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'polyester', false, 1), ('B', 'polysaccharide', false, 2), ('C', 'polyamide', false, 3), ('D', 'polyisoprene', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M32';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A buffer solution is a mixture of a', null, 'An acidic buffer is a weak acid with its conjugate base (salt), e.g. CH₃COOH/CH₃COONa.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M33', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M33' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'weak acid and its conjugate base', true, 1), ('B', 'weak base and strong acid', false, 2), ('C', 'weak base and weak acid', false, 3), ('D', 'weak acid and conjugate acid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M33';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The correct name for NH₄ClO₄ is', null, 'ClO₄⁻ is perchlorate (ClO₃⁻ is chlorate), so NH₄ClO₄ is ammonium perchlorate.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M34', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M34' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ammonium chlorate', false, 1), ('B', 'Ammonium chloric acid', false, 2), ('C', 'Ammonium chloric oxide', false, 3), ('D', 'Ammonium perchlorate', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M34';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Isomers have the same', null, 'Isomers share a molecular formula but differ in structure and properties.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M35', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M35' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'chemical properties', false, 1), ('B', 'molecular formula', true, 2), ('C', 'physical properties', false, 3), ('D', 'structural formula', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M35';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Phenol is also called', null, 'Phenol (C₆H₅OH) is commonly called carbolic acid.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M36', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M36' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'benzyl alcohol', false, 1), ('B', 'salol', false, 2), ('C', 'carbolic acid', true, 3), ('D', 'salicylic acid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M36';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The oxidising power of the halogens is in the order:', null, 'Oxidising power decreases down the group: F > Cl > Br > I.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M37', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M37' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cl < I < Br < F', false, 1), ('B', 'I < F < Cl < Br', false, 2), ('C', 'Cl < Br < I < F', false, 3), ('D', 'I < Br < Cl < F', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M37';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is the weakest base?', null, 'Zn(OH)₂ is amphoteric and only slightly soluble - the weakest base; NaOH and KOH are strong.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M38', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M38' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'NaOH', false, 1), ('B', 'Ca(OH)₂', false, 2), ('C', 'Zn(OH)₂', true, 3), ('D', 'KOH', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M38';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The free energy change (ΔG) of a spontaneous reaction is', null, 'A reaction is spontaneous when ΔG is negative; ΔG = 0 at equilibrium.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M39', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M39' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '= 0', false, 1), ('B', '< 0', true, 2), ('C', 'None of the above', false, 3), ('D', '> 0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M39';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The reaction of H₂ and Cl₂ over the surface of water in the presence of sunlight is an example of a', null, 'This photochemical reaction is the classic example of a zero-order reaction: its rate depends on light intensity, not on reactant concentrations.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M40', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M40' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Third order reaction', false, 1), ('B', 'Zero order reaction', true, 2), ('C', 'Second order reaction', false, 3), ('D', 'First order reaction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M40';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following properties of a solid would change if it were taken from the earth to the moon?', null, 'Weight = mg depends on gravity; mass, density and volume do not change.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M41', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M41' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'weight', true, 1), ('B', 'volume', false, 2), ('C', 'mass', false, 3), ('D', 'density', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M41';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Force per unit mass is equivalent to:', null, 'F/m = a (Newton''s second law).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M42', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M42' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thrust', false, 1), ('B', 'Density', false, 2), ('C', 'Acceleration', true, 3), ('D', 'Pressure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M42';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A stone of mass 0.2 kg is projected by a catapult with a velocity of 20 m/s. The kinetic energy of the stone will be:', null, 'KE = ½ × 0.2 × 20² = 40 J.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M43', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M43' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '40 J', true, 1), ('B', '70 J', false, 2), ('C', '55 J', false, 3), ('D', '60 J', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M43';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two plane mirrors are placed with their surfaces at right angles and a small object is placed between them. How many reflected images of the object can be seen?', null, 'Number of images = 360°/90° − 1 = 3.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M44', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M44' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', true, 1), ('B', '4', false, 2), ('C', '1', false, 3), ('D', '2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M44';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A ray of light is shone onto a prism. The light cannot be:', null, 'A prism deviates, disperses and can reflect light, but it does not bring light to a focus like a lens.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M45', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M45' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'reflected', false, 1), ('B', 'deviated', false, 2), ('C', 'focused', true, 3), ('D', 'dispersed', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M45';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following electromagnetic radiations has the shortest wavelength?', null, 'Order of wavelength: radio > infrared > ultraviolet > X-rays.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M46', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M46' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'X-rays', true, 1), ('B', 'Infrared', false, 2), ('C', 'Ultraviolet', false, 3), ('D', 'Radio waves', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M46';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Aap Dorji sees ''steam'' start to come from a factory whistle and hears the sound 3 seconds later. If the speed of sound in air is 360 m/s, the distance from Aap Dorji to the whistle (in metres) is:', null, 'Light arrives almost instantly, so d = 360 × 3 = 1080 m.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M47', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M47' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '960', false, 1), ('B', '120', false, 2), ('C', '780', false, 3), ('D', '1080', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M47';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Many tall buildings are protected from lightning by lightning conductors. Which of the following about a lightning conductor is NOT true?', null, 'A lightning conductor is a pointed copper strip running down the building to an earth plate; being insulated is not a requirement.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M48', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M48' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is made of copper', false, 1), ('B', 'Its lower end is buried in the earth', false, 2), ('C', 'It is insulated from the building', true, 3), ('D', 'It has a point at its top', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M48';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The current flowing through a 4 Ω resistor when a potential difference of 6 V is applied across it is:', null, 'I = V/R = 6/4 = 1.5 A.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M49', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M49' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.5 A', true, 1), ('B', '2 A', false, 2), ('C', '3 A', false, 3), ('D', '5 A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M49';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The e.m.f. of a cell is quoted as 1.5 V. This means that the cell can supply:', null, '1 volt = 1 joule per coulomb, so the e.m.f. is the energy supplied per unit charge.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M50', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M50' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.5 A of current', false, 1), ('B', '1.5 joules of energy per coulomb of charge', true, 2), ('C', '1.5 Ω of resistance', false, 3), ('D', '1.5 coulombs of charge', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M50';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The depolariser used in a dry cell is:', null, 'MnO₂ oxidises the hydrogen formed at the carbon rod, preventing polarisation.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M51', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M51' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'manganese(IV) oxide', true, 1), ('B', 'carbon', false, 2), ('C', 'ammonium chloride', false, 3), ('D', 'zinc chloride', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M51';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An atom of lithium contains 3 electrons, 3 protons and 4 neutrons. Its mass number is:', null, 'Mass number = protons + neutrons = 3 + 4 = 7.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M52', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M52' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '7', true, 1), ('B', '3', false, 2), ('C', '6', false, 3), ('D', '4', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M52';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Certain atoms emit gamma radiation because:', null, 'Gamma rays are emitted when unstable (excited) nuclei lose energy.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M53', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M53' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'they have a large nucleon number', false, 1), ('B', 'their nuclei emit electrons', false, 2), ('C', 'their nuclei are unstable', true, 3), ('D', 'their nuclei contain protons and neutrons', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M53';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How do the frequency and wavelength change when waves in a ripple tank pass through a narrow gap in a barrier?', null, 'In diffraction the waves spread out but frequency, wavelength and speed are unchanged.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M54', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M54' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'One increases and the other decreases', false, 1), ('B', 'They increase', false, 2), ('C', 'They are unchanged', true, 3), ('D', 'They decrease', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M54';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A leaf which contains only a green pigment is illuminated with monochromatic red light. The leaf will appear to be:', null, 'A green pigment reflects only green and absorbs red, so under red light nothing is reflected and the leaf looks black.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M55', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M55' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'black', true, 1), ('B', 'yellow', false, 2), ('C', 'green', false, 3), ('D', 'red', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M55';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A concave mirror may be used for all but one of the following. Which one?', null, 'Car wing (rear-view) mirrors are convex, for a wide field of view.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M56', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M56' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A dentist''s mirror', false, 1), ('B', 'A torch reflector', false, 2), ('C', 'A car wing mirror', true, 3), ('D', 'A magnifying (shaving) mirror', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M56';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a capacitor is connected to a battery:', null, 'A charging current flows at first and falls to zero as the capacitor charges to the battery voltage.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M57', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M57' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'alternating current flows through the circuit', false, 1), ('B', 'a current flows but soon decreases to zero', true, 2), ('C', 'the current increases to a maximum when the capacitor is fully charged', false, 3), ('D', 'no current flows in the circuit at all', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M57';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Light appears to travel in straight lines because:', null, 'Light''s very small wavelength means diffraction around everyday objects is negligible, so it appears to travel in straight lines.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M58', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M58' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'it is reflected by the upper part of the atmosphere', false, 1), ('B', 'it is not absorbed by the atmosphere', false, 2), ('C', 'its wavelength is very small', true, 3), ('D', 'its speed is very high', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M58';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The conductivity of semiconductors:', null, 'More electrons are excited across the band gap at higher temperature, so conductivity increases.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M59', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M59' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'increases with rise of temperature', true, 1), ('B', 'does not depend on temperature', false, 2), ('C', 'increases with decrease of temperature', false, 3), ('D', 'decreases with rise of temperature', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M59';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The core used in transformers is laminated because it:', null, 'Thin insulated laminations break up eddy-current paths, reducing eddy-current loss.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M60', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M60' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'decreases the residual magnetism of the core', false, 1), ('B', 'increases the magnetic field', false, 2), ('C', 'increases the magnetic saturation level of the core', false, 3), ('D', 'decreases the eddy current loss in the core', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M60';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The information stored in ……… is erased when the computer is turned off.', null, 'RAM is volatile: it loses its contents without power.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M61', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M61' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'CPU', false, 1), ('B', 'BIOS', false, 2), ('C', 'RAM', true, 3), ('D', 'ROM', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M61';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Laptop computers fall under which computer hardware generation?', null, 'Laptops use VLSI microprocessors - fourth-generation technology.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M62', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M62' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Second generation', false, 1), ('B', 'First generation', false, 2), ('C', 'Third generation', false, 3), ('D', 'Fourth generation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M62';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'USB is used to connect devices and to store data (USB drives). USB stands for', null, 'USB = Universal Serial Bus.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M63', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M63' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Unlimited Service Band', false, 1), ('B', 'Unlimited Serial Bus', false, 2), ('C', 'Universal Serial Bus', true, 3), ('D', 'Universal Service Bus', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M63';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Software or hardware that checks information coming from the Internet or a network and then either blocks it or allows it to pass through to your computer, depending on its settings, is called a', null, 'A firewall filters network traffic according to rules.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M64', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M64' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Firewall', true, 1), ('B', 'Antivirus', false, 2), ('C', 'Spyware', false, 3), ('D', 'Security system', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M64';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Every computer connected to the Internet is identified by a unique four-part string, known as its', null, 'An IPv4 address has four numbers separated by dots, e.g. 192.168.1.1.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M65', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M65' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Domain name', false, 1), ('B', 'IP address', true, 2), ('C', 'Host name', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'ENIAC was the first general-purpose electronic computer. ENIAC stands for', null, 'ENIAC = Electronic Numerical Integrator And Computer (1945).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M66', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M66' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electronic Numerical Integrated Automatic Computer', false, 1), ('B', 'Electronic Network Interactive Analytic Computer', false, 2), ('C', 'Electronic Network Integrated Analytical Computer', false, 3), ('D', 'Electronic Numerical Integrator And Computer', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M66';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following memories must be refreshed many times per second?', null, 'DRAM stores bits as charge on tiny capacitors that leak, so it must be refreshed constantly.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M68', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M68' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ROM', false, 1), ('B', 'Dynamic RAM', true, 2), ('C', 'Static RAM', false, 3), ('D', 'EPROM', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M68';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A .PNG file is what kind of file?', null, 'PNG (Portable Network Graphics) is an image format.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M69', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M69' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Movie/animation file', false, 1), ('B', 'Image file', true, 2), ('C', 'Audio file', false, 3), ('D', 'MS Office document', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M69';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A network whose elements may be far apart, usually joining two or more smaller networks by dedicated high-speed telephone lines, is known as a', null, 'A WAN covers a large area, linking LANs over leased lines.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'M70', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'M70' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wide Area Network', true, 1), ('B', 'Local Area Network', false, 2), ('C', 'Metropolitan Area Network', false, 3), ('D', 'World Wide Web', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M70';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Differentiate the following function with respect to x: (4x³ − 5x² + 1)⁴ (3 marks)', 'Let u = 4x³ − 5x² + 1, so y = u⁴.
dy/dx = 4u³ × du/dx = 4(4x³ − 5x² + 1)³ × (12x² − 10x) = 8x(6x − 5)(4x³ − 5x² + 1)³.', null, '[{"point": "Chain rule: d/dx[u⁴] = 4u³ · du/dx with u = 4x³ − 5x² + 1", "marks": 1}, {"point": "du/dx = 12x² − 10x", "marks": 1}, {"point": "dy/dx = 4(4x³ − 5x² + 1)³(12x² − 10x) = 8x(6x − 5)(4x³ − 5x² + 1)³", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Solve the integral ∫ sin³x cos x dx. (3 marks)', 'Let u = sin x, so du = cos x dx. Then ∫sin³x cos x dx = ∫u³ du = u⁴/4 + C = (sin⁴x)/4 + C.', null, '[{"point": "Substitute u = sin x, du = cos x dx", "marks": 1}, {"point": "∫u³ du = u⁴/4", "marks": 1}, {"point": "= sin⁴x/4 + C", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'From Paro, Druk Air flies 200 km in the direction S 52°12'' E towards Bangkok via Kolkata. How far south and how far east of the starting point is the plane? (3 marks)', 'The bearing S 52°12'' E is measured from the south direction, 52.2° towards the east.
Distance south = 200 cos 52.2° = 200 × 0.613 ≈ 122.6 km.
Distance east = 200 sin 52.2° = 200 × 0.790 ≈ 158.0 km.
(Check: √(122.6² + 158.0²) ≈ 200 km.)', null, '[{"point": "S 52°12'' E means 52.2° from south towards east", "marks": 1}, {"point": "South component = 200 cos 52.2° ≈ 122.6 km", "marks": 1}, {"point": "East component = 200 sin 52.2° ≈ 158.0 km", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Monochromatic light of wavelength λ = 589 × 10⁻⁹ m is incident from air on a water surface. What are the wavelength, frequency and speed of (i) the reflected light and (ii) the refracted light? The refractive index of water is 1.33. (3 marks)', 'Frequency depends only on the source, so it is the same for reflected and refracted light: f = c/λ = 3 × 10⁸/(589 × 10⁻⁹) ≈ 5.09 × 10¹⁴ Hz.
(i) Reflected light (still in air): speed 3 × 10⁸ m/s, wavelength 589 nm, frequency 5.09 × 10¹⁴ Hz.
(ii) Refracted light (in water): speed v = c/n = 3 × 10⁸/1.33 ≈ 2.26 × 10⁸ m/s; wavelength λ = 589/1.33 ≈ 443 nm; frequency 5.09 × 10¹⁴ Hz.', null, '[{"point": "Frequency is unchanged in both: f = c/λ = 3 × 10⁸/589 × 10⁻⁹ ≈ 5.09 × 10¹⁴ Hz", "marks": 1}, {"point": "(i) Reflected light stays in air: λ = 589 nm, v = 3 × 10⁸ m/s", "marks": 1}, {"point": "(ii) Refracted light in water: v = c/n = 2.26 × 10⁸ m/s, λ = 589/1.33 ≈ 443 nm", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A metal piece and a stone of the same size and shape are dropped from the same height near the earth''s surface. Which one will reach the ground earlier, and why? (3 marks)', 'If air resistance is negligible (or in a vacuum), both fall with the same acceleration g = 9.8 m/s², independent of mass, and reach the ground together (Galileo).
In real air, both objects have the same size and shape, so they experience the same air resistance at a given speed. The metal piece is denser and heavier, so this resistance is a smaller fraction of its weight; its net acceleration (g − F/m) is larger. The metal piece therefore reaches the ground slightly earlier, though over a short height the difference is very small.', null, '[{"point": "Without air resistance both reach together: acceleration g is the same for all masses", "marks": 1}, {"point": "In air, both meet the same air resistance (same size and shape) at the same speed", "marks": 1}, {"point": "The metal piece is heavier (denser), so the resistance slows it relatively less: it reaches slightly earlier", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A brass ball is dropped from the top of a tower 60 m high. With what velocity will it strike the ground, and how long will it take to reach the ground? (g = 9.8 m/s²) (3 marks)', 'u = 0, h = 60 m, g = 9.8 m/s².
v² = 2gh = 2 × 9.8 × 60 = 1176, so v ≈ 34.3 m/s (downwards).
t = v/g = 34.3/9.8 ≈ 3.5 s (check: h = ½gt² = ½ × 9.8 × 3.5² ≈ 60 m).', null, '[{"point": "v² = u² + 2gh with u = 0", "marks": 1}, {"point": "v = √(2 × 9.8 × 60) ≈ 34.3 m/s", "marks": 1}, {"point": "t = v/g = 34.3/9.8 ≈ 3.5 s (or h = ½gt²)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are some of the important applications of electrolysis? Explain briefly. (3 marks)', '1. Extraction of reactive metals: metals such as aluminium (Hall-Héroult process, alumina in molten cryolite), sodium and magnesium cannot be obtained by carbon reduction and are extracted by electrolysis of their molten compounds.
2. Electroplating: a thin layer of a metal (chromium, nickel, silver, gold) is deposited on an object made the cathode, to prevent corrosion or improve appearance.
3. Electrorefining: impure copper is made the anode and pure copper deposits on the cathode, giving 99.9% pure copper for wiring.
4. Manufacture of chemicals: electrolysis of brine (chlor-alkali process) produces sodium hydroxide, chlorine and hydrogen.
Other uses: anodising aluminium, producing hydrogen and oxygen from water.', null, '[{"point": "Extraction of reactive metals: aluminium from alumina in molten cryolite; sodium, magnesium from molten chlorides", "marks": 1}, {"point": "Electroplating (coating with Ni, Cr, Ag, Au to prevent corrosion/decorate) and electrorefining (purifying copper)", "marks": 1}, {"point": "Manufacture of chemicals: NaOH, chlorine and hydrogen from brine; also anodising aluminium, electrotyping", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'State three differences between nuclear fission and nuclear fusion. (3 marks)', '1. Process: fission is the splitting of a heavy nucleus (e.g. U-235) into two medium-sized nuclei plus neutrons; fusion is the joining of light nuclei (e.g. deuterium and tritium) to form a heavier nucleus (helium).
2. Conditions: fission is triggered by slow neutrons and proceeds as a chain reaction at normal temperatures; fusion needs extremely high temperatures (about 10⁷ K) and pressures to overcome the repulsion between nuclei.
3. Energy and products: fusion releases more energy per kilogram of fuel and produces little long-lived radioactive waste; fission produces highly radioactive waste.
Uses: fission is used in nuclear power stations and atom bombs; fusion powers the sun and stars and the hydrogen bomb (controlled fusion power is still experimental).', null, '[{"point": "Fission splits a heavy nucleus (U-235, Pu-239) into two lighter nuclei; fusion joins light nuclei (hydrogen isotopes) into a heavier one (helium)", "marks": 1}, {"point": "Fission is started by neutron bombardment as a chain reaction at ordinary temperatures; fusion needs extremely high temperature and pressure (millions of degrees, as in the sun)", "marks": 1}, {"point": "Fission products are radioactive waste; fusion releases more energy per unit mass and gives little radioactive waste; fission is used in power reactors/atom bombs, fusion powers stars and hydrogen bombs", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain what superconductivity is. Give examples of substances which possess superconductivity. (3 marks)', 'Superconductivity is the property of certain materials whose electrical resistance drops suddenly to zero when they are cooled below a critical temperature (Tc). A current set up in a superconducting loop flows indefinitely without energy loss, and the material expels magnetic fields from its interior (the Meissner effect), which allows magnetic levitation.
Examples: mercury (the first, discovered by Kamerlingh Onnes in 1911, Tc ≈ 4.2 K), lead (7.2 K), niobium and niobium-titanium alloy (used in MRI magnets), and ceramic ''high-temperature'' superconductors such as yttrium barium copper oxide YBa₂Cu₃O₇ (Tc ≈ 92 K, above the boiling point of liquid nitrogen).', null, '[{"point": "Superconductivity: the electrical resistance of certain materials falls to exactly zero below a critical temperature Tc", "marks": 1}, {"point": "The superconductor also expels magnetic fields (Meissner effect), so a current can flow without loss", "marks": 1}, {"point": "Examples: mercury (Tc ≈ 4.2 K), lead, niobium, niobium-titanium alloy; high-Tc ceramics such as YBa₂Cu₃O₇ (≈ 92 K)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is a hyperlink? How is it created? Give an example. (3 marks)', 'A hyperlink is a word, phrase or image in a web page or document that, when clicked, takes the user to another web page, a file, an e-mail address or another part of the same document. Links are usually shown underlined or in a different colour.
It is created in HTML with the anchor tag <a> and its href attribute: <a href="address">link text</a>. In programs such as MS Word or a web editor you select the text and choose Insert → Link (Ctrl + K) and type the address.
Example: <a href="https://www.rcsc.gov.bt">Royal Civil Service Commission</a> shows the words ''Royal Civil Service Commission'', which open the RCSC website when clicked.', null, '[{"point": "A hyperlink is clickable text or an image in a document/web page that takes the user to another page, file or place when clicked", "marks": 1}, {"point": "Created in HTML with the anchor tag <a href=\"URL\">text</a> (or Insert → Link in Word/web editors)", "marks": 1}, {"point": "Example: <a href=\"https://www.rcsc.gov.bt\">RCSC website</a>", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "source": {"title": "BCSE 2011 Main Examination, Technical Paper II, Engineering", "year": 2011, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'S10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2011 from me_q where key = 'S10' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a noble gas?', null, 'Argon (Group 18) has a full outer shell; the others are reactive non-metals.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hydrogen', false, 1), ('B', 'Chlorine', false, 2), ('C', 'Nitrogen', false, 3), ('D', 'Argon', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The valency of carbon in most of its compounds is', null, 'Carbon has 4 valence electrons and forms 4 covalent bonds (e.g. CH₄).', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4', true, 1), ('B', '3', false, 2), ('C', '1', false, 3), ('D', '2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following file extensions is used for a Microsoft Excel workbook?', null, '.xlsx is Excel; .docx Word, .pptx PowerPoint, .txt plain text.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'engineering-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Engineering): BCSE 2011, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'engineering'), null, null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '.txt', false, 1), ('B', '.xlsx', true, 2), ('C', '.pptx', false, 3), ('D', '.docx', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
