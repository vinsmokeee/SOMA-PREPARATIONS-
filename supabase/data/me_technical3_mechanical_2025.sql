-- ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'mechanical-engineering', 'Mechanical Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'mechanical-engineering') is null then raise exception 'unknown specialisation mechanical-engineering'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'mechanical-engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mechanical-engineering'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mechanical-engineering'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'mechanical-engineering'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If two shafts are made of same materials and diameter of one shaft is half of the other, power transmitted by the larger diameter shaft will be _________ of the smaller shaft.', null, 'For the same shear stress, torque and power ∝ d³; double diameter gives 8 times.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4 times', false, 1), ('B', '8 times', true, 2), ('C', '2 times', false, 3), ('D', '16 times', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A steel with 0.8 per cent carbon is known as', null, '0.8% carbon steel is eutectoid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'hypereutectoid steel', false, 1), ('B', 'eutectoid steel', true, 2), ('C', 'hypoeutectoid steel', false, 3), ('D', 'proeutectoid steel', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '_______ is not suitable for plastic materials.', null, 'EDM needs an electrically conducting workpiece, so it cannot machine plastics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electric Discharge Machining', true, 1), ('B', 'Laser Beam Machining', false, 2), ('C', 'Ultrasonic Machining', false, 3), ('D', 'Abrasive Jet Machining', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per __________, “if three plane bodies have relative motion among them, their instantaneous centres must lie on a straight line”.', null, 'Kennedy''s (three-centres-in-line) theorem.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Saint Venant’s Principle', false, 1), ('B', 'D’Alembert’s Principle', false, 2), ('C', 'Kennedy’s Theorem', true, 3), ('D', 'Pappus-Leisenring Theorem', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Choose the false statement from the following.', null, 'False: jigs guide the tool in drilling/reaming; fixtures are used for milling and shaping.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jigs limit and control the path of the cutting tool.', false, 1), ('B', 'The term jig is used for devices employed for operations such as milling and shaping while fixture is used if the operations are drilling and reaming.', true, 2), ('C', 'Fixtures are fixed to machines while jigs are not.', false, 3), ('D', 'Fixtures hold the work during machining operation.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cutting force (F) in sheet metal piercing is calculated as:', null, 'Piercing force F = S x p x t.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'F = S × p / t', false, 1), ('B', 'F = S × p × t', true, 2), ('C', 'F = S × t / p', false, 3), ('D', 'F = p × t / S', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the case of ________, axial thrust is minimal:', null, 'Pelton (impulse, tangential jet) has minimal axial thrust.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kaplan turbine', false, 1), ('B', 'Francis turbine', false, 2), ('C', 'Pure action turbine', false, 3), ('D', 'Pelton turbine', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a Poison’s ratio of 0.25, ratio of modulus of rigidity to bulk modulus would be:', null, 'G/K = 3(1 - 2ν) / [2(1 + ν)] = 3(0.5)/2.5 = 3/5.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5/3', false, 1), ('B', '3/5', true, 2), ('C', '2/5', false, 3), ('D', '1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The torque developed by a disc clutch is given by', null, 'With uniform wear, T = μWR (R = mean radius) per pair of friction surfaces.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T = μWR where W = Axial force with which the friction surfaces are held together, μ = Coefficient of friction; and R = Mean radius of friction surfaces.', true, 1), ('B', 'T = 0.25μWR', false, 2), ('C', 'T = 0.75μWR', false, 3), ('D', 'T = 0.5μWR', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In maintenance engineering, MTTF stands for', null, 'MTTF = Mean Time To Failure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maximum Time To Failure', false, 1), ('B', 'Median Time To Failure', false, 2), ('C', 'Minimum Time To Failure', false, 3), ('D', 'Mean Time To Failure', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Efficiency of self-locking or overhauling screw is', null, 'Self-locking screws have efficiency < 50%; overhauling screws > 50%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '< 50% or >50% respectively', true, 1), ('B', '=50% or <50% respectively', false, 2), ('C', '>50% or =50% respectively', false, 3), ('D', '>50% or <50% respectively', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In ________, molten metal is forced into a permanent metal mould under pressure.', null, 'Die casting forces molten metal into a metal die under pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Permanent mould casting', false, 1), ('B', 'Slush casting', false, 2), ('C', 'Die casting', true, 3), ('D', 'Centrifugal casting', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The product of diametral pitch and circular pitch in spur gear is equal to:', null, 'Diametral pitch x circular pitch = π.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1', false, 1), ('B', 'π', true, 2), ('C', '1/π', false, 3), ('D', 'Number of teeth × π', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If a shaft revolves at 120rpm, its angular velocity is', null, 'ω = 2πN/60 = 2π x 120/60 = 12.57 rad/s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12.57 radian per second', true, 1), ('B', '12.57 meter per second', false, 2), ('C', '12.57 rpm', false, 3), ('D', '12.57 degree', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the pressure difference between the inside and outside of a liquid droplet of 5 mm diameter is 10 N/m², the surface tension is:', null, 'For a droplet Δp = 4σ/d, so σ = 10 x 0.005/4 = 12.5 x 10⁻³ N/m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12.5 x 10-3 N/m', true, 1), ('B', '12.5 x 10-1 N/m', false, 2), ('C', '125 N/m', false, 3), ('D', '12.5 x 10-2 N/m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The failure of 10 parts out of every 1000 parts manufactured represents a reliability of:', null, 'Reliability = 990/1000 = 0.990.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '9.90', false, 1), ('B', '0.090', false, 2), ('C', '0.990', true, 3), ('D', '990', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Tolerance grade for a hole and a shaft of 8 and 7 respectively is represented as:', null, 'Hole basis uses capital letters (H8), shaft small letters (g7): H8/g7.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'H8/g7', true, 1), ('B', 'h8/g7.', false, 2), ('C', 'h8/G7', false, 3), ('D', 'H8/G7', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Addition of __________ improves machinability of steel', null, 'Sulphur, lead and phosphorus make free-machining steel.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nickel and chromium', false, 1), ('B', 'Manganese and tin', false, 2), ('C', 'Carbon and copper', false, 3), ('D', 'Sulphur, lead and phosphorus', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two non-parallel, intersecting shafts are connected by:', null, 'A Hooke''s (universal) joint connects intersecting shafts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Flanged Joint', false, 1), ('B', 'Hinge Joint', false, 2), ('C', 'Grooved Joint', false, 3), ('D', 'Hooke Joint', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The time of flight (t) of a projectile on an upward inclined plane is given by:', null, 'On an upward incline t = 2u sin(α - β) / (g cos β).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 't = 2u sin α / g', false, 1), ('B', 't = 2u sin(α + β) / (g cos β)', false, 2), ('C', 't = 2u sin(α − β) / (g cos β)', true, 3), ('D', 't = u sin(α − β) / (g cos β)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In automation, actuators', null, 'Actuators convert electrical signals into mechanical motion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Convert electrical signals into mechanical movement', true, 1), ('B', 'Control the flow of data', false, 2), ('C', 'Sense the environment', false, 3), ('D', 'Process data', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The type of gear is used to transmit power between non-parallel, intersecting shafts is', null, 'Bevel gears connect intersecting shafts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Worm Gear', false, 1), ('B', 'Spur Gear', false, 2), ('C', 'Helical Gear', false, 3), ('D', 'Bevel Gear', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is responsible for removing heat from the refrigerant in a refrigeration cycle?', null, 'The condenser rejects heat from the refrigerant.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Evaporator', false, 1), ('B', 'Expansion Valve', false, 2), ('C', 'Condenser', true, 3), ('D', 'Compressor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most common firing order for a 4-cylinder inline engine is:', null, '1-3-4-2 is the most common 4-cylinder firing order.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1-2-3-4', false, 1), ('B', '1-3-4-2', true, 2), ('C', '1-3-2-4', false, 3), ('D', '1-4-3-2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Film friction is said to occur:', null, 'Film (fluid) friction: surfaces completely separated by lubricant.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'when two surfaces in contact are completely unlubricated surfaces.', false, 1), ('B', 'When two surfaces in contact have a minute thin layer of lubricants.', false, 2), ('C', 'When two surfaces in contact are completely separated by air.', false, 3), ('D', 'When two surfaces in contact are completely separated by lubricants.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In CNC programming, G-codes are used to:', null, 'G-codes are preparatory codes setting the machining mode.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Control the flow of coolant', false, 1), ('B', 'Control spindle', false, 2), ('C', 'Prepare a machine to engage in a particular mode for machining', true, 3), ('D', 'Turn the machine on and off.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cylinder is known as thin:', null, 'A cylinder is treated as thin when d/t is more than about 15-20 (thickness small compared with diameter).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'if the ratio of its inner diameter to the wall thickness is less than 15.', false, 1), ('B', 'if the ratio of its inner diameter to the wall thickness is more than 15.', true, 2), ('C', 'if the ratio of its inner diameter to the wall thickness is less than 1.', false, 3), ('D', 'if the ratio of its inner diameter to the wall thickness is more than 1.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Single cylinder engines are generally', null, 'Single-cylinder (small) engines are usually air cooled.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Air cooled.', true, 1), ('B', 'Water cooled', false, 2), ('C', 'Not required to be cooled', false, 3), ('D', 'Oil cooled.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The temperature of air recorded by a thermometer, when the moisture present in it begins to condense is called:', null, 'Dew point is the temperature at which moisture begins to condense.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Wet bulb temperature', false, 1), ('B', 'Saturation temperature', false, 2), ('C', 'Dry bulb temperature', false, 3), ('D', 'Dew point temperature', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A rectangular cross-section bar is welded to a support by means of fillet welds as shown in the figure (load 25 kN at 500 mm from the weld; weld around a 100 mm x 150 mm section). Determine the size of the welds if the permissible shear stress in the weld is limited to 75 MPa.', 'Weld all round the 100 x 150 mm section, throat t.
Primary (direct) shear: A = t(2b + 2d) = t(2 x 100 + 2 x 150) = 500t mm²; τ1 = 25 000 / 500t = 50/t N/mm².
Bending moment M = 25 000 x 500 = 12.5 x 10⁶ N mm. Section modulus of weld (unit throat): Zu = bd + d²/3 = 100 x 150 + 150²/3 = 22 500 mm², so Z = 22 500t mm³; σb = 12.5 x 10⁶ / 22 500t = 555.6/t N/mm².
Resultant stress = √(σb² + τ1²) = √(555.6² + 50²)/t = 557.8/t = 75 → t = 7.44 mm.
Leg size h = t / 0.707 = 10.52 mm, say 11 mm fillet welds.', null, '[{"point": "Primary shear τ1 = P/(t(2b + 2d)) = 25000/(500t) = 50/t", "marks": 1}, {"point": "Bending: M = 12.5 x 10⁶ N mm; Z = t(bd + d²/3) = 22500t; σb = 555.6/t", "marks": 2}, {"point": "Resultant √(σb² + τ1²) = 557.8/t = 75 → t = 7.44 mm; leg h = t/0.707 ≈ 10.5 mm → 11 mm", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), '/papers/me/tech3-mech-2025-weld.png')
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the differences among a heat engine, a refrigerator and a heat pump with the help of schematic diagrams. Give an expression for the coefficient of performance (or efficiency) of each.', 'Heat engine: receives heat Q1 from a high-temperature source (T1), converts part into work W, rejects Q2 to a low-temperature sink (T2). Purpose: produce work. Efficiency η = W/Q1 = (Q1 - Q2)/Q1 (Carnot: 1 - T2/T1).
Refrigerator: reversed cycle - work W is supplied to extract heat Q2 from a cold space (T2) and reject Q1 = Q2 + W to the warmer surroundings (T1). Purpose: keep the cold space cold. COP_R = Q2/W = Q2/(Q1 - Q2) (Carnot: T2/(T1 - T2)).
Heat pump: same reversed cycle, but the purpose is to deliver heat Q1 to a warm space (e.g. a room) by taking heat from cold outside air or ground. COP_HP = Q1/W = Q1/(Q1 - Q2) = COP_R + 1 (Carnot: T1/(T1 - T2)).
Schematics: each drawn as a circle (device) between a hot reservoir at top and a cold reservoir at bottom - engine with arrows Q1 in from top, W out, Q2 down; refrigerator/heat pump with W in, Q2 up from the cold reservoir and Q1 out to the hot reservoir.', null, '[{"point": "Heat engine: takes Q1 from hot source, produces W, rejects Q2 to sink; η = W/Q1 = 1 - Q2/Q1", "marks": 1.5}, {"point": "Refrigerator: W input, extracts Q2 from cold space, rejects Q1 to surroundings; COP_R = Q2/W = Q2/(Q1 - Q2)", "marks": 1.5}, {"point": "Heat pump: same cycle, purpose heating; COP_HP = Q1/W = COP_R + 1", "marks": 1}, {"point": "Schematics (reservoirs, device, arrows)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following.

a) Define productivity in a manufacturing production system. (2 marks)', 'a) Productivity is the ratio of output (goods produced) to the inputs used to produce them (labour, materials, machines, energy, capital): Productivity = Output / Input. It measures how efficiently resources are used; it can be partial (e.g. labour productivity, units per man-hour) or total-factor.', null, '[{"point": "Productivity = output/input (ratio), measure of efficiency of resource use", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-s3', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following.

b) A firm manufactures a certain product. The standard time per piece is 1.5 minutes. The output of the firm is 300 units per shift of 8 hours. (i) What is the productivity of the firm per shift of 8 hours? (ii) What is the production of the firm per week (6 working days) if the firm works a double shift every day? 1.5 marks each. (3 marks)', 'b) (i) Productivity per shift = 300 units / 8 hours = 37.5 units per hour (300 units per shift). [Standard output = 480 min / 1.5 min = 320 units per shift, so the firm works at 300/320 = 93.75% of standard.]
(ii) Weekly production = 300 units/shift x 2 shifts/day x 6 days = 3600 units per week.', null, '[{"point": "(i) 300 units per shift = 37.5 units/hour (standard 320/shift, efficiency 93.75%) - 1.5; (ii) 300 x 2 x 6 = 3600 units per week - 1.5", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-s3', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Based on the following data for a proposed hydropower plant site, determine the following.
Data: available head = 140 m, catchment area = 2000 km², average annual rainfall = 145 cm, turbine efficiency = 85%, generator efficiency = 90%, percolation and evaporation losses = 16%.

a) The power generation potential. (2.5 marks)', 'a) Annual runoff = catchment area x rainfall x (1 - losses) = 2000 x 10⁶ m² x 1.45 m x 0.84 = 2.436 x 10⁹ m³/year.
Average discharge Q = 2.436 x 10⁹ / (365 x 24 x 3600) = 77.2 m³/s.
Hydraulic power = ρgQH = 1000 x 9.81 x 77.2 x 140 = 106.1 MW. Turbine output = 0.85 x 106.1 = 90.2 MW. Electrical output = 0.9 x 90.2 ≈ 81.2 MW.', null, '[{"point": "Runoff 2000 x 10⁶ x 1.45 x 0.84 = 2.436 x 10⁹ m³/yr, Q = 77.2 m³/s (1); P = ρgQH ηt ηg ≈ 81 MW (1.5)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-s4', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Based on the following data for a proposed hydropower plant site, determine the following.
Data: available head = 140 m, catchment area = 2000 km², average annual rainfall = 145 cm, turbine efficiency = 85%, generator efficiency = 90%, percolation and evaporation losses = 16%.

b) The type of turbine to be used if the runner speed is to be kept below 240 rpm. (2.5 marks)', 'b) Specific speed Ns = N√P / H^(5/4), with N = 240 rpm, P = 90 175 kW (turbine output), H = 140 m: √P = 300.3; H^(5/4) = 481; Ns = 240 x 300.3 / 481 ≈ 150. Ns of about 50-300 (and a medium head of 140 m) corresponds to a Francis turbine. (If the output is split between several units, Ns per unit is lower but still in the Francis range.)', null, '[{"point": "Ns = N√P/H^(5/4) with P in kW ≈ 150 → Francis turbine (medium head)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-s4', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Refrigeration and coupling design
Answer both questions in this case.

1. A refrigerating machine of 6 tonnes capacity working on the Bell-Coleman cycle has an upper limit pressure of 5.2 bar. The pressure and temperature at the start of compression are 1 bar and 16 °C. The compressed air is cooled at constant pressure to 41 °C and enters the expansion cylinder. Assuming both expansion and compression to be isentropic with γ = 1.4 (cp = 1.003 kJ/kg K), calculate:
(i) the coefficient of performance (5 marks)
(ii) the quantity of air in circulation per minute (5 marks)
(iii) the piston displacement of the compressor and expander (5 marks)
(iv) the bore of the compressor and expansion cylinders; the unit runs at 240 rpm, is double acting, and the stroke is 200 mm (5 marks)
(v) the power required to drive the unit. (5 marks) (25 marks)', 'T1 = 289 K, p1 = 1 bar, p2 = 5.2 bar, T3 = 314 K. (p2/p1)^((γ-1)/γ) = 5.2^0.2857 = 1.602.
(i) T2 = 289 x 1.602 = 462.9 K; T4 = 314 / 1.602 = 196.0 K.
Refrigerating effect per kg = cp(T1 - T4) = 1.003 x 93.0 = 93.2 kJ/kg; work per kg = cp[(T2 - T3) - (T1 - T4)] = 1.003 x (148.9 - 93.0) = 56.1 kJ/kg.
COP = 93.0 / 55.9 ≈ 1.66.
(ii) Capacity = 6 TR x 210 kJ/min = 1260 kJ/min; m = 1260 / 93.2 ≈ 13.5 kg/min.
(iii) Compressor displacement (suction state 1): V1 = mRT1/p1 = 13.5 x 0.287 x 289 / 100 ≈ 11.2 m³/min. Expander displacement (exhaust state 4): V4 = mRT4/p4 = 13.5 x 0.287 x 196 / 100 ≈ 7.6 m³/min.
(iv) Double acting at 240 rpm → 480 strokes/min. Per stroke: compressor 11.2/480 = 0.02335 m³; expander 7.6/480 = 0.01584 m³. With L = 0.2 m: D = √(4V/πL): compressor bore ≈ 0.386 m (386 mm); expander bore ≈ 0.318 m (318 mm).
(v) Power = m x net work = 13.5 x 56.1 / 60 ≈ 12.6 kW. (Using 1 TR = 211 kJ/min gives practically the same results.)', null, '[{"point": "(i) T2 = 289 x 5.2^0.286 = 462.9 K, T4 = 314/1.602 = 196.0 K; COP = (T1 - T4)/[(T2 - T3) - (T1 - T4)] ≈ 1.66", "marks": 5}, {"point": "(ii) RE = 6 x 210 = 1260 kJ/min; m = 1260/(1.003 x 93) ≈ 13.5 kg/min", "marks": 5}, {"point": "(iii) Vc = mRT1/p1 ≈ 11.2 m³/min; Ve = mRT4/p4 ≈ 7.6 m³/min", "marks": 5}, {"point": "(iv) per stroke /480: Dc ≈ 386 mm, De ≈ 318 mm", "marks": 5}, {"point": "(v) P = m cp[(T2 - T3) - (T1 - T4)]/60 ≈ 12.6 kW", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-case1', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Refrigeration and coupling design
Answer both questions in this case.

2. Two 35 mm shafts are connected by a flanged coupling. The flanges are fitted with 6 bolts on a 125 mm bolt circle. The shafts transmit a torque of 800 N m at 350 rpm. Safe stresses: shaft material in shear 63 MPa; bolt material 56 MPa; cast iron coupling 10 MPa; key material 46 MPa. Calculate:
(i) the diameter of the bolts (5 marks)
(ii) the thickness of the flanges (5 marks)
(iii) the key dimensions (5 marks)
(iv) the hub length (5 marks)
(v) the power transmitted. (5 marks) (25 marks)', 'Check of shaft: τ = 16T/πd³ = 16 x 800 x 10³ / (π x 35³) = 95 MPa > 63 MPa, so a 35 mm shaft is over-stressed for 800 N m (about 40 mm would be needed); the coupling is designed for the given data.
(i) Bolts in shear: T = n (π/4) db² τb (D1/2) → 800 x 10³ = 6 x (π/4) db² x 56 x 62.5 → db² = 48.5, db ≈ 7.0 mm; use standard M8 (or M10) bolts.
(ii) Hub diameter D = 2d = 70 mm. Flange in shear at the hub: T = (πD²/2) tf τc → tf = 2 x 800 x 10³ / (π x 70² x 10) = 10.4 mm; use 11-12 mm (often tf = 0.5d ≈ 18 mm is taken).
(iii) Key: square key, width = thickness ≈ d/4 = 8.75 mm (standard 10 x 8 or 10 x 10 mm). Length from shear: T = l w τk (d/2) → l = 2 x 800 x 10³ / (8.75 x 46 x 35) ≈ 114 mm (with w = 10 mm, l ≈ 99 mm).
(iv) Hub length is normally 1.5d = 52.5 mm, but the key needs about 100-114 mm, so the hub length should be taken equal to the key length, about 115 mm (or use two keys / higher-strength key material to keep the hub shorter).
(v) Power P = 2πNT/60 = 2π x 350 x 800 / 60 = 29 322 W ≈ 29.3 kW.', null, '[{"point": "(i) T = n(π/4)db²τb D1/2 → db ≈ 7 mm, use M8/M10 standard", "marks": 5}, {"point": "(ii) hub D = 2d = 70 mm; T = πD²tf τc/2 → tf ≈ 10.4 mm, use 11-12 mm", "marks": 5}, {"point": "(iii) square key w = t ≈ d/4 ≈ 9-10 mm; length from shear l = 2T/(w τk d) ≈ 114 mm (with w = 8.75)", "marks": 5}, {"point": "(iv) hub length = 1.5d ≈ 52.5 mm, or equal to key length when key governs; note shaft stress 95 MPa > 63 MPa", "marks": 5}, {"point": "(v) P = 2πNT/60 = 29.3 kW", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-case1', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Advances in mechanical engineering
Discuss five of the most recent advances and innovations in the field of mechanical engineering that are shaping the future of industries and society.

Discuss five of the most recent advances and innovations in mechanical engineering:
(i) Explain what they are, their areas of application, how they contribute to sustainability, efficiency and automation in modern engineering, and their issues and challenges.
(ii) Explain their feasibility of application in Bhutan, with issues and challenges. (50 marks)', '1. Additive manufacturing (3D printing): building parts layer by layer from polymers or metals. Applications: prototypes, spare parts, medical implants, aerospace lightweight parts. Sustainability/efficiency: less material waste, lighter optimised designs, on-demand local production. Challenges: high cost of metal printers, slow for mass production, quality certification. Bhutan: feasible for colleges, prototyping, spare parts for hydropower and vehicles in remote areas (reducing imports and waiting time); limited by cost and skills.
2. Robotics, cobots and Industry 4.0 automation: robots and collaborative robots linked with sensors, PLCs and IoT. Applications: assembly, welding, packaging, inspection. Benefits: productivity, consistent quality, safety in hazardous tasks. Challenges: investment, job displacement, maintenance skills. Bhutan: small industrial base limits scale; useful in specific plants (e.g. ferro-alloy, food processing, cement) and training institutes.
3. Digital twins, AI and IoT predictive maintenance: virtual models of machines updated with real-time sensor data; AI predicts failures. Applications: turbines, power plants, manufacturing lines. Benefits: less downtime, optimised energy use, longer equipment life. Challenges: data, connectivity, cybersecurity, expertise. Bhutan: highly relevant for hydropower plants (DGPC/Druk Green) - monitoring turbine wear from sediment, vibration; feasible with partners.
4. Electric vehicles and battery technology: EVs, fast charging, improved lithium-ion and emerging solid-state batteries. Benefits: zero tailpipe emissions, high efficiency, use of clean electricity. Challenges: battery cost, charging infrastructure, cold climate, recycling. Bhutan: very feasible because electricity is clean hydropower and fuel imports are costly; government EV policy and electric taxis; challenges are charging network on mountain roads, servicing skills and battery disposal.
5. Green hydrogen and advanced renewable/energy systems: hydrogen from electrolysis using renewable electricity; high-efficiency heat pumps; advanced turbine designs and coatings. Applications: transport, industry heat, energy storage. Benefits: decarbonising hard sectors, storing surplus seasonal power. Challenges: high cost, storage and safety, efficiency losses. Bhutan: surplus summer hydropower could produce green hydrogen (pilot studies exist) for industry or export; challenges are capital cost, markets and technical capacity.
(Other acceptable advances: advanced composites and smart materials, nanotechnology, micro/nano-electromechanical systems, smart manufacturing, sustainable HVAC, drones.)
Overall for Bhutan: the advances fit national goals of carbon neutrality, self-reliance and GMC development, but need skilled engineers, investment, policy support, partnerships and maintenance capacity; start with pilots in hydropower, transport and education.', null, '[{"point": "Five relevant recent advances identified (e.g. additive manufacturing, robotics/cobots, AI/digital twins/IoT predictive maintenance, electric vehicles and batteries, green hydrogen, advanced materials/composites, renewable energy tech such as advanced hydro turbines/heat pumps, smart manufacturing/Industry 4.0)", "marks": 10}, {"point": "Each explained with applications", "marks": 10}, {"point": "Contribution to sustainability, efficiency and automation", "marks": 10}, {"point": "Issues and challenges of each", "marks": 8}, {"point": "Feasibility in Bhutan with specific context (hydropower, EV policy, GMC, small industry, skills, cost, terrain) and challenges", "marks": 12}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50,
    5400, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2025-case2', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two shafts A and B are made of the same material, and the diameter of shaft A is twice that of shaft B. If both run at the same speed and stress, and shaft A transmits 1 MW, shaft B can transmit:', null, 'Torque (and power at the same speed) ∝ d³: (1/2)³ = 1/8, so 1 MW / 8 = 0.125 MW.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '8 MW', false, 1), ('B', '0.5 MW', false, 2), ('C', '0.125 MW', true, 3), ('D', '0.25 MW', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
