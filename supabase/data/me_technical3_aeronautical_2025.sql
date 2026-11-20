-- ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'aeronautical-engineering', 'Aeronautical Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'aeronautical-engineering') is null then raise exception 'unknown specialisation aeronautical-engineering'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'aeronautical-engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'aeronautical-engineering'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'aeronautical-engineering'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'aeronautical-engineering'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In computer architecture, a byte is defined as a collection of how many bits?', null, 'A byte is 8 bits.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '8', true, 1), ('B', 'Equivalent to one hexadecimal digit', false, 2), ('C', 'Half of a word in a 16-bit system', false, 3), ('D', '2ⁿ where n = 1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following engines should be used by a subsonic passenger transport airplane for minimum specific fuel consumption?', null, 'High-bypass turbofans give the lowest specific fuel consumption at subsonic speeds.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Turbofan engine', true, 1), ('B', 'Ramjet engine', false, 2), ('C', 'Turbojet engine with afterburner', false, 3), ('D', 'Scramjet engine', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Total pressure at a point is defined as the pressure when the flow is brought to rest', null, 'Total (stagnation) pressure: flow brought to rest isentropically.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Isobarically', false, 1), ('B', 'Isentropically', true, 2), ('C', 'Isothermally', false, 3), ('D', 'adiabatically', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On which one of the following thermodynamic cycles does an ideal ramjet operate?', null, 'An ideal ramjet follows the Brayton cycle.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Carnot cycle', false, 1), ('B', 'The Otto cycle', false, 2), ('C', 'The Rankine cycle', false, 3), ('D', 'The Brayton cycle', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In steady, level turning flight of an aircraft at a load factor ''n'', the ratio of the horizontal component of lift and aircraft weight is', null, 'Horizontal lift = W√(n² − 1) in a level turn, so the ratio is √(n² − 1).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '√(n + 1)', false, 1), ('B', '√(n² + 1)', false, 2), ('C', '√(n − 1)', false, 3), ('D', '√(n² − 1)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following high lift device results in higher stalling angle?', null, 'Leading-edge devices delay stall to a higher angle of attack.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Leading-edge flap', true, 1), ('B', 'Plain flap', false, 2), ('C', 'Split flap', false, 3), ('D', 'Fowler flap', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A turbofan engine has a bypass ratio of 5 and a total mass flow rate of 120 kg/s. The mass flow rate through the bypass duct is', null, 'Bypass ratio 5: bypass flow = 120 × 5/6 = 100 kg/s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100 kg/s', true, 1), ('B', '20 kg/s', false, 2), ('C', '120 kg/s', false, 3), ('D', '600 kg/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sam is going to assemble a computer by himself. He has the choice of chips from two brands, a hard drive from four, memory from three, and an accessory bundle from five local stores. How many different ways can Sam order the parts?', null, '2 × 4 × 3 × 5 = 120.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '130', false, 1), ('B', '100', false, 2), ('C', '120', true, 3), ('D', '125', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'At a certain point in a horizontal pipeline, the water’s speed is 2.50 m/s and the gauge pressure is 1.80 x 104 Pa. Find the gauge pressure at a second point in the line if the cross-sectional area at the second point is twice that at the first. (Take ρ = 1000 kg/m3)', null, 'v₂ = 1.25 m/s; p₂ = 1.80×10⁴ + ½(1000)(2.5² − 1.25²) = 2.03×10⁴ Pa.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.95 x 104 Pa', false, 1), ('B', '2.03 x 104 Pa', true, 2), ('C', '2.20 x 104 Pa', false, 3), ('D', '1.80 x 104 Pa', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During reentry, the space shuttle creates a shock-wave cone that makes an angle of 58.0∘ with its direction of motion. If the speed of sound at this altitude is 331 m/s, what is the Mach number of the shuttle at this instant?', null, 'sin μ = 1/M: M = 1/sin 58° = 1.18.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.85', false, 1), ('B', '1.50', false, 2), ('C', '1.75', false, 3), ('D', '1.18', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements correctly distinguishes the Otto cycle from the Brayton cycle?', null, 'Otto: spark ignition, constant-volume heat addition; Brayton: gas turbines, constant-pressure heat addition.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The Otto cycle is typically used in spark-ignition engines with constant-volume heat addition, whereas the Brayton cycle is used in gas turbines with constant-pressure heat addition.', true, 1), ('B', 'The Otto cycle is used for gas turbines with constant-pressure heat addition, while the Brayton cycle is used for spark-ignition engines with constant-volume heat addition.', false, 2), ('C', 'The Brayton cycle is a practical cycle for internal combustion engines with adiabatic heat rejection, while the Otto cycle is idealized with isobaric processes.', false, 3), ('D', 'Both the Otto and Brayton cycles operate with isothermal compression and expansion, but the Otto cycle has constant-pressure heat addition.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For an airplane to be statically stable, its centre of gravity must always be', null, 'For static longitudinal stability the CG must be ahead of the neutral point.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'aft of the wing aerodynamic centre', false, 1), ('B', 'ahead of neutral point', true, 2), ('C', 'ahead of wing aerodynamic centre', false, 3), ('D', 'aft of neutral point', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A main objective of by-pass in a turbo-fan engine is to increase', null, 'Bypass raises the mass flow handled by the engine, improving propulsive efficiency.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'mass flow rate through exhaust nozzle', false, 1), ('B', 'compressor pressure ratio', false, 2), ('C', 'turbine inlet temperature', false, 3), ('D', 'mass flow rate through engine inlet', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Thermodynamic cycle on which the jet engine operates can be', null, 'Jet engines work on the Brayton cycle, open or closed.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'open Brayton cycle only', false, 1), ('B', 'either open or closed Rankine cycle', false, 2), ('C', 'either open or closed Brayton cycle', true, 3), ('D', 'open Rankine cycle only', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In an un-powered glide of an aircraft having weight W, lift L and drag D, the equilibrium glide angle is defined as', null, 'Glide angle γ = tan⁻¹(D/L).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'tan-1 (W/L)', false, 1), ('B', 'tan-1 (D/L)', true, 2), ('C', 'tan-1 (L/W)', false, 3), ('D', 'tan-1 (L/D)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Lift on an aircraft climbing vertically up is', null, 'In a vertical climb thrust balances weight and drag; lift is zero.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'equal to the drag', false, 1), ('B', 'equal to its weight', false, 2), ('C', 'zero', true, 3), ('D', 'equal to the thrust', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the context of Prandtl’s lifting line theory for a finite wing, which of the following combinations of statements is TRUE? P: The bound vortex is responsible for the lift force Q: The trailing vortices are responsible for the induced drag R: The bound vortex is responsible for the induced drag S: The trailing vortices are responsible for the lift force', null, 'Bound vortex gives lift (P); trailing vortices give downwash and induced drag (Q).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'P,Q', true, 1), ('B', 'R,S', false, 2), ('C', 'P,S )*', false, 3), ('D', 'Q,R', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bernoulli’s equation is valid under steady state', null, 'Bernoulli holds along a streamline in inviscid flow, and between any two points in irrotational (potential) flow.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'only along a streamline in both inviscid flow and potential flow.', false, 1), ('B', 'between any two points in inviscid flow, and only along a streamline in potential flow.', false, 2), ('C', 'only along a streamline in inviscid flow, and between any two points in potential flow.', true, 3), ('D', 'between any two points in both inviscid flow and potential flow.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Mach angle for a flow at Mach 2.0 is', null, 'μ = sin⁻¹(1/2) = 30°.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '60°', false, 1), ('B', '45°', false, 2), ('C', '30°', true, 3), ('D', '90°', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is the most stable configuration of an airplane in roll?', null, 'Sweep back, dihedral and a high wing all add roll stability.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Sweep forward, anhedral and high wing', false, 1), ('B', 'Sweep back, anhedral and low wing', false, 2), ('C', 'Sweep forward, dihedral and low wing', false, 3), ('D', 'Sweep back, dihedral and high wing', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a NACA 4415 airfoil, the location of maximum camber, as a fraction of the chord length from the leading edge, is', null, 'NACA 4415: second digit 4 → maximum camber at 0.4 chord.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.04', false, 1), ('B', '0.40', true, 2), ('C', '0.15', false, 3), ('D', '0.44', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'At what bank angle must an aircraft fly to maintain a coordinated turn on a circular path of radius 120 m at a velocity of 53 m/s?', null, 'tan φ = V²/(rg) = 53²/(120 × 9.81) = 2.39 → φ ≈ 67°.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '67°', true, 1), ('B', '45°', false, 2), ('C', '60°', false, 3), ('D', '75°', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A significant limitation of carbon-fibre-reinforced plastics (CFRP) that must be considered in aircraft design is:', null, 'CFRP is brittle and can hide impact damage (barely visible impact damage).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Low stiffness compared to glass-reinforced plastic (GRP)', false, 1), ('B', 'Plastic yielding under stress concentrations', false, 2), ('C', 'High resistance to fatigue failure', false, 3), ('D', 'Brittleness and susceptibility to invisible impact damage', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following systems is most suitable for short range navigation of airplanes?', null, 'VOR is the standard short-range navigation aid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Instrument Landing System (ILS)', false, 1), ('B', 'VHF Omni-directional Range (VOR)', true, 2), ('C', 'Global Positioning System (GPS)', false, 3), ('D', 'Distance Measuring Equipment (DME)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following engines has no moving parts like compressors or turbines?', null, 'Ramjets and scramjets compress air by ram effect; no compressor or turbine.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ramjet only', false, 1), ('B', 'Scramjet only', false, 2), ('C', 'Both Ramjet and Scramjet', true, 3), ('D', 'Neither Ramjet nor Scramjet', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Consider an airfoil in a flow of air, where far ahead (upstream) of the airfoil, the pressure, velocity, and density are 2116 lb/ft2, 146.7 ft/s, and 0.002377 slug/ft3, respectively. At a given point A on the airfoil, the pressure is 2070 lb/ft2. What is the velocity at point A ?', null, '½ρ(V_A² − V∞²) = 46 → V_A² = 146.7² + 2(46)/0.002377 → V_A ≈ 245.4 ft/s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '248.0 ft/s', false, 1), ('B', '250.5 ft/s', false, 2), ('C', '242.0 ft/s', false, 3), ('D', '245.4 ft/s', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) A high-speed aircraft is cruising in still air. How will the temperature of air at the nose of the aircraft differ from the temperature of air at some distance from the aircraft? (2 marks)', 'a) The air at the nose is hotter. It is brought to rest (stagnation point), so its kinetic energy is converted to internal energy: T₀ = T + V²/(2cp). Away from the aircraft the air is at the ambient static temperature.', null, '[{"point": "Higher at the nose: air is brought to rest, kinetic energy becomes heat (stagnation temperature T₀ = T + V²/2cp)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s1', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) What four processes make up the simple ideal Brayton cycle? (2 marks)', 'b) 1-2 isentropic compression (compressor); 2-3 constant-pressure heat addition (combustor); 3-4 isentropic expansion (turbine/nozzle); 4-1 constant-pressure heat rejection (to atmosphere).', null, '[{"point": "Isentropic compression, constant-pressure heat addition, isentropic expansion, constant-pressure heat rejection", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s1', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'c) What is Reynolds number? Explain briefly why it is important in determining the type of flow over a wing. (1 mark)', 'c) Re = ρVL/μ, the ratio of inertial to viscous forces. Low Re gives a laminar boundary layer, high Re turbulent; it fixes transition, skin friction and separation (stall) behaviour of the wing.', null, '[{"point": "Re = ρVL/μ, inertia/viscous forces; decides laminar or turbulent boundary layer", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s1', 3, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Explain why flow separation occurs more easily in a laminar boundary layer compared to a turbulent boundary layer, and discuss its impact on lift and drag characteristics of an airfoil at high angles of attack. (3 marks)', 'a) In a laminar boundary layer the velocity near the wall is low and there is little mixing, so the fluid has little momentum to push against an adverse pressure gradient; it stops and reverses early. A turbulent layer mixes high-momentum air down to the wall, so it stays attached longer. At high angles of attack separation spreads forward over the upper surface: lift falls (stall) and pressure drag rises sharply.', null, '[{"point": "Laminar layer has low momentum near the wall, cannot resist adverse pressure gradient; turbulent mixing re-energises it", "marks": 1.5}, {"point": "Separation at high AoA: loss of lift (stall) and large rise in pressure drag", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s2', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Explain the engineering principles and design strategies used in modern aircraft to ensure protection against lightning strikes. (2 marks)', 'b) Give the current a continuous low-resistance path through the airframe: metal skin, or copper/aluminium mesh and foil in composite parts; electrical bonding of panels and parts; diverter strips on radomes; static wicks; shielding and surge protection of wiring and avionics; fuel tanks and vents designed so no spark can ignite vapour; tested to lightning-zone certification standards.', null, '[{"point": "Conductive path (metal skin, mesh/foil in composites), bonding, static wicks, diverter strips, shielding, fuel-system protection", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s2', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) An aircraft is cruising at an altitude of 9 km. The free-stream static pressure and density at this altitude are 3.08 × 10⁴ N/m² and 0.467 kg/m³ respectively. A Pitot tube mounted on the wing senses a pressure of 3.31 × 10⁴ N/m². Ignoring compressibility effects, calculate the cruising speed of the aircraft. (3 marks)', 'a) p₀ − p = 3.31×10⁴ − 3.08×10⁴ = 2,300 N/m² = ½ρV², so V = √(2 × 2300 / 0.467) = √9,850 ≈ 99.2 m/s.', null, '[{"point": "p₀ − p = ½ρV²: 2300 = ½(0.467)V²", "marks": 1.5}, {"point": "V ≈ 99.2 m/s", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s3', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Air enters an aircraft engine at a velocity of 180 m/s with a flow rate of 94 kg/s. The engine combustor requires 9.2 kg/s of air to burn 1 kg/s of fuel. The velocity of gas exiting from the engine is 640 m/s. Calculate the momentum thrust (in N) developed by the engine. (2 marks)', 'b) Fuel flow = 94/9.2 = 10.22 kg/s. Momentum thrust F = (ṁa + ṁf)Ve − ṁaVi = (104.22)(640) − (94)(180) = 66,700 − 16,920 ≈ 49,780 N (about 49.8 kN).', null, '[{"point": "fuel = 94/9.2 = 10.22 kg/s; F = (94 + 10.22)(640) − 94(180)", "marks": 1}, {"point": "F ≈ 49,800 N", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s3', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) In a converging duct, area and velocity at section P are 1 m² and 15 m/s respectively. The temperature of the fluid is 300 K. Air flow through the nozzle can be assumed to be inviscid and isothermal. Characteristic gas constant is 287 J/(kg·K) and ratio of specific heats is 1.4 for air. To ensure that the air flow remains incompressible (Mach number M ≤ 0.3) in the duct, calculate the minimum area required at section Q. (3 marks)', 'a) Speed of sound a = √(γRT) = √(1.4 × 287 × 300) = 347.2 m/s (same throughout, isothermal). Largest allowed speed V_Q = 0.3 × 347.2 = 104.2 m/s. Continuity (incompressible): A_Q = A_P V_P / V_Q = (1 × 15)/104.2 ≈ 0.144 m².', null, '[{"point": "a = √(1.4 × 287 × 300) = 347 m/s; V_max = 0.3a = 104 m/s", "marks": 1.5}, {"point": "A_Q = A_P V_P / V_Q = 15/104 ≈ 0.144 m²", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s4', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) A Drukair Airbus A320 aircraft is cruising at a standard altitude of 30,000 ft with a velocity of 550 mi/h. At this altitude the standard temperature is 411.86 °R. Take the gas constant for air as 1716 ft·lb/(slug·°R) and the ratio of specific heats as 1.4 (1 mile = 5280 feet). Calculate its Mach number. (2 marks)', 'b) V = 550 × 5280 / 3600 = 806.7 ft/s. a = √(1.4 × 1716 × 411.86) = √989,450 ≈ 994.7 ft/s. M = 806.7/994.7 ≈ 0.81.', null, '[{"point": "V = 550 × 5280/3600 = 806.7 ft/s; a = √(1.4 × 1716 × 411.86) ≈ 994.7 ft/s", "marks": 1}, {"point": "M ≈ 0.81", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-s4', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements.

Question 1 (Design and propulsion fundamentals): Explain how lift, thrust-to-weight ratio, and stability requirements differ between a conventional fixed-wing aircraft and a tilt-rotor eVTOL design. (10 marks)', 'Lift: a fixed-wing aircraft gets lift only from the wing, so it needs forward speed and a runway. A tilt-rotor eVTOL gets lift from rotor thrust in hover, from a mix of rotor and wing in transition, and from the wing in cruise.
Thrust-to-weight: a fixed-wing airliner cruises with T/W well below 1 (thrust only overcomes drag). An eVTOL must lift its full weight vertically, so T/W must exceed 1 (about 1.2 or more) with margin for a failed motor; this drives large motors and battery power peaks.
Stability: a fixed-wing aircraft is stable by design (CG ahead of neutral point, tail, dihedral). In hover the eVTOL has almost no aerodynamic stability and depends on fast flight-control computers varying rotor speed/tilt; the transition between hover and wing-borne flight is the most demanding phase and must be shown to be controllable after failures.', null, '[{"point": "Lift: wing lift in cruise vs rotor thrust in hover and transition", "marks": 3}, {"point": "Thrust-to-weight: fixed-wing T/W < 1; eVTOL needs T/W > 1 (about 1.2+) to hover, with margin for engine-out", "marks": 4}, {"point": "Stability: aerodynamic stability vs active fly-by-wire stabilisation, critical transition phase", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case1', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements.

Question 2 (Certification and compliance challenges): List and explain five key airworthiness requirements that should be considered during the certification of an eVTOL aircraft. (10 marks)', '1. Certification basis: no conventional category fits, so CAA should adopt a special condition (e.g. EASA SC-VTOL or FAA powered-lift rules) as the basis and validate the foreign type certificate.
2. Energy storage and electric propulsion: battery cell and pack safety, prevention and containment of thermal runaway, state-of-charge monitoring, reserves for diversion.
3. Flight control systems and software: fly-by-wire with development assurance (DO-178C software, DO-254 hardware), redundancy and failure analysis.
4. Structures and crashworthiness: strength, fatigue, bird strike, lightning and HIRF protection, occupant protection and emergency exits.
5. Performance and handling: hover and transition performance in Bhutan''s high-altitude, mountainous conditions, controllability with one rotor/motor failed, continued safe flight and landing; noise for urban use.', null, '[{"point": "Five requirements, 2 marks each, e.g. certification basis (special conditions such as EASA SC-VTOL / FAA powered-lift)", "marks": 2}, {"point": "Battery and electric propulsion safety (thermal runaway, containment)", "marks": 2}, {"point": "Flight control / software and avionics assurance (DO-178C, DO-254)", "marks": 2}, {"point": "Structural strength, crashworthiness, bird strike, lightning, HIRF", "marks": 2}, {"point": "Performance, controllability after failure, continued safe flight and landing; noise and emissions", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case1', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements.

Question 3 (Continuing airworthiness and maintenance): Define the Aircraft Maintenance Programme (AMP) and formulate a structured framework for the approval of a Maintenance Programme specific to eVTOL aircraft, with focused considerations on battery systems, electric propulsion units, the airframe, associated systems, and software update management. (10 marks)', 'AMP: the operator''s approved document listing the scheduled maintenance tasks, their intervals and procedures needed to keep each aircraft airworthy.
Framework for approval: (1) the operator submits an AMP based on the manufacturer''s maintenance planning data and the type certificate; (2) tailor it to local conditions (altitude, weather, utilisation); (3) CAA reviews tasks, intervals and the reliability programme; (4) approval with conditions and periodic review using in-service data.
Battery systems: charge-cycle counting, state-of-health tests, thermal-management checks, cell balancing, connector inspection, storage and disposal rules.
Electric propulsion units: motor and inverter inspection, bearing and vibration monitoring, cooling, life-limited parts.
Airframe and systems: composite damage inspections (impact, delamination), tilt-mechanism and actuator checks, landing gear, avionics.
Software: configuration control, approved service bulletins, testing before release, records of each version installed.', null, '[{"point": "Definition: approved document of scheduled maintenance tasks, intervals and procedures for continuing airworthiness", "marks": 2}, {"point": "Framework: based on manufacturer data (MRB/MPD), operator''s environment, reliability programme, CAA review and approval, periodic revision", "marks": 3}, {"point": "Battery and propulsion: cycle/health checks, thermal, cell balancing, motor/inverter inspections and life limits", "marks": 3}, {"point": "Airframe/systems and software: composite inspections, tilt mechanisms; configuration control of software updates", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case1', 3, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements.

Question 4 (Safety and risk assessment): Analyze how system redundancy and fail-safe architecture in eVTOL designs influence certification decisions. Provide two practical examples. (10 marks)', 'Certification requires that no single failure is catastrophic and that catastrophic failure conditions are extremely improbable (about 10⁻⁹ per flight hour). Redundant, independent systems and fail-safe design are how an eVTOL meets this, and the regulator judges them through the safety assessment (functional hazard assessment, FMEA, fault trees, common-cause analysis) and ground/flight tests. Strong redundancy can allow approval for passenger flights; weak redundancy leads to limitations or refusal.
Example 1: distributed electric propulsion - several rotors, so the aircraft can still hover and land with one motor or inverter failed.
Example 2: triple-redundant flight-control computers and sensors with voting, and separate battery packs/buses so one battery fault does not cut all power.', null, '[{"point": "Redundancy lets the aircraft meet failure-probability targets (catastrophic ≤ 10⁻⁹/h); no single failure catastrophic", "marks": 4}, {"point": "Influence on certification: system safety assessment (FHA, FMEA, fault trees), tests, approval of limitations", "marks": 2}, {"point": "Two examples, e.g. distributed propulsion with motor-out capability; triple-redundant flight computers / dual battery buses", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case1', 4, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I: Certification and Airworthiness Challenges of eVTOL Aircraft
The Civil Aviation Authority (CAA) of Bhutan has received an application from an operator proposing to introduce electric vertical take-off and landing (eVTOL) capable powered-lift aircraft for short-range urban air mobility (UAM). These aircraft are intended for passenger transport between key urban and semi-urban areas. The proposed design is a fully electric, tilt-rotor eVTOL capable of carrying 4 passengers with a range of 100 km per charge.
The operator claims the aircraft is safe, sustainable, and compliant with international standards. However, eVTOL technology introduces unique challenges in terms of airworthiness certification, battery reliability, maintenance, continuing airworthiness management, and integration into existing airspace.
As an Airworthiness Officer/Flight Safety Officer in the CAA, you are required to evaluate the application and assess the potential risks, compliance aspects, and regulatory requirements.

Question 5 (Personnel licensing): Considering that eVTOL aircraft may operate in piloted, remotely piloted, or autonomous modes, and that they also require routine maintenance and inspection, how should the CAA define the licensing and training requirements for both pilots and maintenance engineers? (10 marks)', 'Pilots: create a powered-lift category and eVTOL type rating; training on hover, transition and wing-borne flight, battery energy management, failures and emergency landing; simulator training; medical and recurrent checks.
Remote pilots and supervisors of autonomous flights: a remote pilot licence covering the ground control station, command-and-control link loss, airspace and BVLOS procedures, and monitoring automation.
Maintenance engineers: AME licence with added modules on high-voltage electrical systems, batteries, electric motors, composites and software loading; manufacturer type training and safe work with high voltage.
For all: recurrent training, competency assessment, and rules aligned with ICAO and the state of design.', null, '[{"point": "Pilots: powered-lift category/type rating, training on transition, energy management, emergencies; simulator", "marks": 4}, {"point": "Remote pilots/operators of autonomous systems: remote pilot licence, C2-link and ground station training", "marks": 2}, {"point": "Engineers: AME licence with electrical/battery/software modules, type training, high-voltage safety", "marks": 3}, {"point": "Recurrent training, competency checks, alignment with ICAO", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case1', 5, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace.

Question 1 (Structural and aerodynamic considerations): (i) What do you understand by the term ''Drones''? [2 marks] (ii) Analyze the aerodynamic challenges associated with mounting heavy payloads on large UAS. In your answer, discuss effects on stability, control authority, center of gravity shifts, induced drag, and potential flow disturbances, and how these factors influence the overall airworthiness of the drone. [8 marks] (10 marks)', '(i) A drone is an unmanned aircraft - flown without a pilot on board, either remotely from a ground station or autonomously - and with its control station and link it forms an unmanned aircraft system (UAS).
(ii) A 100 kg payload on a 250 kg aircraft moves the CG; if it moves aft the static margin falls and the drone may become unstable, if forward the elevator may lack authority for take-off and landing. Dropping or shifting cargo changes the CG in flight. The higher weight needs a higher lift coefficient, so induced drag (∝ CL²) rises and endurance falls. External pods add parasite drag and disturb the flow over the tail and propellers, reducing control effectiveness and causing vibration. These factors set the certified weight and CG envelope, require load and balance checks before each flight and flight testing at the limits.', null, '[{"point": "(i) Aircraft without a pilot on board, flown remotely or autonomously (UAV/UAS)", "marks": 2}, {"point": "(ii) CG shifts and stability/trim margins; control authority limits", "marks": 3}, {"point": "(ii) Higher weight → higher CL and induced drag; external payload drag and flow disturbance on tail/propellers", "marks": 3}, {"point": "(ii) Effect on airworthiness: envelope limits, load/CG checks", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case2', 1, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace.

Question 2 (Propulsion systems): Propose two alternative propulsion or energy solutions to improve endurance or payload capacity of the drone. For each solution, analyze its feasibility, engineering trade-offs, and integration challenges with the existing airframe and autonomous systems. (10 marks)', '1. Hybrid-electric: a small engine-generator charges batteries in flight. Feasible with today''s technology and gives 2-4 times the range/endurance. Trade-offs: extra weight, fuel system, noise, emissions and maintenance; integration needs space, cooling, vibration isolation, CG re-balancing and power-management software linked to the autopilot.
2. Hydrogen fuel cell (or higher-energy-density batteries such as lithium-sulphur/solid-state): much higher specific energy, quiet, no CO₂. Trade-offs: cost, hydrogen supply and storage in Bhutan, high-pressure tank safety, slower response (needs a buffer battery). Integration: tank placement and CG, thermal management, new failure modes for the flight computer to monitor, certification of the new system.', null, '[{"point": "Solution 1, e.g. hybrid-electric (engine-generator + battery): feasibility, trade-offs (range vs weight, noise, emissions), integration", "marks": 5}, {"point": "Solution 2, e.g. hydrogen fuel cell or higher-energy batteries: feasibility, trade-offs, integration (storage, cooling, safety, CG)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case2', 2, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace.

Question 3 (Flight control and autonomy): Discuss the role of redundancy in sensors, communication links, and actuators in ensuring flight safety. (10 marks)', 'Redundancy means that one failure does not cause loss of control. Sensors: duplicated GNSS, IMUs, air-data and altitude sensors cross-checked by the flight computer, which rejects a faulty one (important in mountains where GNSS may be blocked). Communication: two independent command-and-control links (for example radio line-of-sight and satellite or mobile network), so the ground pilot keeps override; if both fail, a pre-programmed lost-link procedure (return home, hold, land at a safe point). Actuators and power: duplicated servos or split control surfaces, separate power buses, with failure detection and automatic reconfiguration. Together these allow the drone to continue or end the flight safely and are key evidence for BVLOS approval.', null, '[{"point": "Sensors: multiple GNSS, IMU, air-data, altimeters with voting / cross-checking", "marks": 3}, {"point": "Communication: dual C2 links (radio + satellite/4G), lost-link procedures", "marks": 3}, {"point": "Actuators/servos and power: duplicated, failure detection and reconfiguration", "marks": 3}, {"point": "No single failure causes loss of control; safe return/landing", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case2', 3, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace.

Question 4 (Safety and risk mitigation): Assess the consequences of in-flight propulsion failure and discuss various mitigation strategies. (10 marks)', 'Consequences: with one motor lost the drone has asymmetric thrust and reduced climb; losing both (or the battery) means no thrust - it can only glide, which in Bhutan''s mountains may mean impact with terrain, loss of the cargo and risk to people and property below.
Mitigation: design so the drone can fly and land on one motor; separate battery packs and power buses so a single fault cannot stop both motors; real-time monitoring of motor temperature, current and battery health with automatic return or landing; pre-planned emergency landing sites along the route; a ballistic parachute; routes over unpopulated areas; strict pre-flight checks and maintenance; and operating limits for weather and altitude.', null, '[{"point": "Consequences: loss of thrust/power, loss of altitude, crash in terrain, cargo loss, third-party risk", "marks": 4}, {"point": "Mitigation: twin-motor redundancy and engine-out capability, battery isolation", "marks": 3}, {"point": "Mitigation: health monitoring, emergency landing sites, parachute, route planning away from people, maintenance", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case2', 4, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II: Airworthiness and Technical Challenges of Heavy-Payload UAS (Cargo Drones)
A private operator in Bhutan has proposed the use of a large Unmanned Aircraft System (UAS) for cargo transportation in remote and mountainous regions. The system is designed with a maximum take-off weight of 250 kg, a payload capacity of 100 kg, and is powered by twin electric motors supported by swappable lithium battery packs. It has a composite airframe with fixed landing gear, can operate autonomously with ground station override, and offers an endurance of 2.5 hours with a range of up to 200 km, including beyond visual line of sight (BVLOS) capability.
The operator highlights that this UAS could reduce costs and environmental impacts compared to short-haul manned cargo flights. However, introducing such heavy-payload drones presents significant engineering, airworthiness and operational challenges. Key concerns include structural integrity of the airframe, reliability of the propulsion and power systems, handling of loss-of-link scenarios, and ensuring safe integration into controlled civil airspace.

Question 5 (Continuing airworthiness and operational safety): (i) Recommend six critical inspection, maintenance, or monitoring tasks for ensuring continuing airworthiness of heavy-payload UAS. Include both structural and system-level checks. [6 marks] (ii) Explain how engineering and operational data such as flight logs, battery cycle life, structural fatigue monitoring, etc. can support decisions regarding continuing airworthiness. [4 marks] (10 marks)', '(i) 1. Inspect the composite airframe for cracks, delamination and impact damage. 2. Check landing gear and payload attachment points for wear and loose fasteners. 3. Inspect motors, mounts and propellers (balance, nicks, vibration). 4. Test battery packs - state of health, cycle count, swelling, connector condition. 5. Check wiring, connectors and avionics, including the flight controller and sensors calibration. 6. Test command-and-control links, failsafe functions and confirm approved software/firmware versions.
(ii) Flight logs show hours, loads, hard landings and fault messages; battery data (cycles, capacity loss, temperatures) shows when packs must be retired; fatigue and vibration monitoring reveals structural or motor wear early. Trends let the operator move to condition-based maintenance, change inspection intervals, find recurring defects and give the CAA evidence that the fleet remains airworthy.', null, '[{"point": "(i) Six tasks, 1 mark each (composite airframe/landing gear inspection, payload mounts, motors/propellers, battery health and connectors, wiring/avionics, C2 link and software/firmware checks)", "marks": 6}, {"point": "(ii) Data trends → condition-based maintenance, retire batteries, adjust intervals, detect faults early, evidence for regulator", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Aeronautical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-aero2025-case2', 5, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the speed of sound in air at 288 K? (γ = 1.4, R = 287 J/kg·K)', null, 'a = √(γRT) = √(1.4 × 287 × 288) ≈ 340 m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '360 m/s', false, 1), ('B', '340 m/s', true, 2), ('C', '320 m/s', false, 3), ('D', '300 m/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to thin airfoil theory, the lift-curve slope of a thin airfoil is', null, 'dCl/dα = 2π per radian.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2π per radian', true, 1), ('B', '4π per radian', false, 2), ('C', 'π per radian', false, 3), ('D', 'π/2 per radian', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The induced drag coefficient of a finite wing is given by', null, 'CDi = CL²/(πeAR): it falls as aspect ratio rises.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'CL × AR', false, 1), ('B', 'CL²/(πeAR)', true, 2), ('C', 'πeAR/CL²', false, 3), ('D', 'CL/AR', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ailerons primarily control an aircraft''s motion in', null, 'Ailerons give roll control about the longitudinal axis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'aeronautical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Aeronautical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'aeronautical-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'yaw', false, 1), ('B', 'thrust', false, 2), ('C', 'roll', true, 3), ('D', 'pitch', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
