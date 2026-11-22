-- ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'electrical-engineering', 'Electrical Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'electrical-engineering-2025') is null then raise exception 'unknown specialisation electrical-engineering-2025'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the closed loop system shown, the transfer function E(s)/R(s) is:', null, 'E = R - HC and C = GE, so E(1 + GH) = R and E/R = 1/(1 + GH).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-mcq1.png')
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'GH/(1+GH)', false, 1), ('B', '1/(1+GH)', true, 2), ('C', '1/(1+G)', false, 3), ('D', 'G/(1+GH)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Calculate the zeros and poles of the transfer function G(s) = 5(s+2)/(s² + 3s + 2), given as zero, (poles):', null, 'Zero where s + 2 = 0: s = -2. Poles: s² + 3s + 2 = (s + 1)(s + 2) = 0, so s = -1 and -2.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2, (1, 2)', false, 1), ('B', '2, (-1, 2)', false, 2), ('C', '-2, (-1, -2)', true, 3), ('D', '-2, (1, -2)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most powerful controller is:', null, 'PID combines proportional, integral (removes steady-state error) and derivative (improves stability and speed) action.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'PID Controller', true, 1), ('B', 'PD controller', false, 2), ('C', 'PI Controller', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a JK flip-flop, what happens when both J and K inputs are 1?', null, 'With J = K = 1 the JK flip-flop toggles on each clock pulse.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Set', false, 1), ('B', 'Reset', false, 2), ('C', 'No change', false, 3), ('D', 'Toggle', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Convert the 127 decimal number into binary:', null, '127 = 64 + 32 + 16 + 8 + 4 + 2 + 1 = 1111111 (binary).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1100111', false, 1), ('B', '111111', false, 2), ('C', '1111011', false, 3), ('D', '1111111', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Charge stores in:', null, 'A capacitor stores electric charge (Q = CV).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Capacitor', true, 1), ('B', 'Transistor', false, 2), ('C', 'Diode', false, 3), ('D', 'Resistor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a frequency of 200 Hz, the time period will be:', null, 'T = 1/f = 1/200 = 0.005 s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.05 S', false, 1), ('B', '0.5 S', false, 2), ('C', '0.0005 S', false, 3), ('D', '0.005 S', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When the gate signal from a thyristor is removed, it will remain in its forward conduction mode. This characteristics of thyristor is called…:', null, 'Once the anode current exceeds the latching current, the thyristor stays on without gate signal - latching.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'get-on', false, 1), ('B', 'latching', true, 2), ('C', 'ever conducting', false, 3), ('D', 'off-blocking', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which semiconductor power device, out of the following is not a current triggered device:', null, 'A MOSFET is voltage controlled at the gate; thyristor, GTO and TRIAC are current triggered.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thyristor', false, 1), ('B', 'GTO', false, 2), ('C', 'TRIAC', false, 3), ('D', 'MOSFET', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You need to design a DC-DC converter to power a 5V microcontroller from a 9V battery. Which type of converter would be most suitable?', null, 'A buck converter steps a DC voltage down, here 9 V to 5 V, efficiently.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Boost Converter', false, 1), ('B', 'Buck Converter', true, 2), ('C', 'Flyback Converter', false, 3), ('D', 'Buck-Boost Converter', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Linear Variable Differential Transformer has:', null, 'An LVDT has one primary winding and two secondary windings connected in series opposition.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Two primary coils and two secondary coils', false, 1), ('B', 'One primary coil and one secondary coil', false, 2), ('C', 'One primary coil and two secondary coils', true, 3), ('D', 'Two primary coils and one secondary coil', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a disadvantage of a proportional-only controller?', null, 'Proportional-only control leaves a steady-state error (offset).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It cannot respond to changes in the setpoint', false, 1), ('B', 'It cannot measure the process variable', false, 2), ('C', 'It can result in a steady-state error', true, 3), ('D', 'It is too complex to implement', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the circuit shown (10 V DC source in series with a 5 Ω resistor and a 1 F capacitor), determine the steady-state current I flowing through the 5 Ω resistance:', null, 'With a DC source, the capacitor charges fully and blocks current: steady-state current = 0.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-mcq15.png')
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0', true, 1), ('B', '0.5 A', false, 2), ('C', '20 A', false, 3), ('D', '2 A', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A network of resistors is connected as shown. Compute the equivalent resistance of the network:', null, '6||6 = 3 Ω, 4||4 = 2 Ω; series total = 3 + 2 + 2 + 1 = 8 Ω.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-mcq16.png')
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '22 Ω', false, 1), ('B', '23 Ω', false, 2), ('C', '7 Ω', false, 3), ('D', '8 Ω', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When short circuit occurs, current flow in circuit will be:', null, 'A short circuit has (ideally) zero impedance, so the current becomes very large - theoretically infinite.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Very low', false, 1), ('B', 'Zero', false, 2), ('C', 'Infinite', true, 3), ('D', 'Normal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a synchronous generator connected to a power station, increase in excitation will:', null, 'Raising the excitation of a grid-connected generator increases its reactive power output; active power depends on the prime mover.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase reactive power generation', true, 1), ('B', 'Decrease active power generation', false, 2), ('C', 'Increase active power generation', false, 3), ('D', 'Decrease reactive power generation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Length of the cable is doubled, its capacitance C will be:', null, 'Cable capacitance is proportional to length, so doubling the length doubles C.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'One-fourth', false, 1), ('B', 'Doubled', true, 2), ('C', 'One-half', false, 3), ('D', 'Unchanged', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In an interconnected power system, what is the effect of a large increase in load on system frequency?', null, 'A sudden load increase exceeds generation, generators slow down and frequency falls until governors respond.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Oscillations in frequency', false, 1), ('B', 'No change in frequency', false, 2), ('C', 'Decrease in frequency', true, 3), ('D', 'Increase in frequency', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 800 kV transmission line has a maximum power transfer capacity of P. If it is operated at 400 kV with the series reactance unchanged, the new maximum power transfer capacity is approximately:', null, 'Pmax = V²/X (Vs Vr/X); halving the voltage gives one quarter: P/4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2P', false, 1), ('B', 'P', false, 2), ('C', 'P/4', true, 3), ('D', 'P/2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'High voltage transmission line are transposed because:', null, 'Transposition equalises the inductance and capacitance of the phases, reducing voltage unbalance (and interference).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Phase voltage imbalance can be minimized', true, 1), ('B', 'Voltage drop in the lines can be minimized', false, 2), ('C', 'Corona loss can be minimized', false, 3), ('D', 'Computation of inductance becomes easier', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A transformer has a primary voltage of 110 kV and a secondary voltage of 11kV. If the transformer is supplying 100 A on the secondary side, what is the current on the primary side, assuming no losses?', null, 'Turns ratio 110/11 = 10, so primary current = 100/10 = 10 A.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '12 A', false, 1), ('B', '11 A', false, 2), ('C', '1000 A', false, 3), ('D', '10 A', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The rating of a circuit breaker is generally determined on the basis of:', null, 'Breaking capacity is based on the symmetrical three-phase fault current at the location.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Symmetrical fault current', true, 1), ('B', 'Line-to-line fault current', false, 2), ('C', 'Double line to ground fault current', false, 3), ('D', 'Single line to ground fault current', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Steady state stability of a power system is the ability of a power system to:', null, 'Steady-state stability is the ability to keep the machines in synchronism after small, gradual changes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Maintain synchronism between machines and on external tie lines', true, 1), ('B', 'Maintain voltage at the rated voltage level', false, 2), ('C', 'Maintain frequency exactly at 50 Hz', false, 3), ('D', 'Maintain spinning reserves margin at all time', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Buses for load flow studies are classified as (i) load bus, (ii) generator bus and (iii) slack bus. The correct quantities specified for (load bus; generator bus; slack bus) are:', null, 'Load bus: P and Q specified; generator (PV) bus: P and |V|; slack bus: |V| and δ.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'P, |V|; P, Q; P, δ', false, 1), ('B', 'P, Q; P, |V|; |V|, δ', true, 2), ('C', '|V|, Q; P, δ; P, Q', false, 3), ('D', 'P, δ; |V|, Q; Q, δ', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 6 pole, 50 Hz, 3-phase induction motor has a full load slip of 3%, what is the rotor speed at full load?', null, 'Ns = 120 x 50/6 = 1000 rpm; N = 1000 x (1 - 0.03) = 970 rpm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '980 r.p.m.', false, 1), ('B', '1000 r.p.m', false, 2), ('C', '950 r.p.m.', false, 3), ('D', '970 r.p.m.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An under-excited synchronous motor behaves as:', null, 'An under-excited synchronous motor draws lagging current, behaving like an inductor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A resistor', false, 1), ('B', 'An inductor', true, 2), ('C', 'A capacitor', false, 3), ('D', 'None of the above.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The field winding of an alternator is:', null, 'The field winding of an alternator is excited by direct current.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'none of the above.', false, 1), ('B', 'both d.c. and a.c. excited', false, 2), ('C', 'd.c. excited', true, 3), ('D', 'a.c. excited', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The nameplate of a motor gives power = 15 kW and efficiency = 0.9. Using a power meter, the actual three-phase power drawn is found to be 8 kW. Find the loading of the motor.', null, 'Output = 8 x 0.9 = 7.2 kW; loading = 7.2/15 = 48%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '50%', false, 1), ('B', '48%', true, 2), ('C', '55%', false, 3), ('D', '49%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Consider a circuit with three inputs (A, B, C) and an output Y. An XOR gate takes inputs A and B, and an AND gate takes the output of the XOR gate and input C. What will be the output Y for all possible input combinations of A, B and C? Construct the truth table.', 'The output is Y = (A ⊕ B) · C: it is 1 only when A and B are different and C = 1.
A B C | A⊕B | Y
0 0 0 | 0 | 0
0 0 1 | 0 | 0
0 1 0 | 1 | 0
0 1 1 | 1 | 1
1 0 0 | 1 | 0
1 0 1 | 1 | 1
1 1 0 | 0 | 0
1 1 1 | 0 | 0
So Y = 1 for (A, B, C) = (0, 1, 1) and (1, 0, 1), and 0 for all other combinations.', null, '[{"point": "Expression Y = (A ⊕ B)·C", "marks": 1}, {"point": "Truth table for all 8 combinations correct: Y = 1 only for A B C = 0 1 1 and 1 0 1", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions (see figure (a) and (b)):

a) Write the mesh equations using KVL for the circuit in figure (a). (2 marks)', 'a) Taking clockwise mesh currents I1 (left mesh) and I2 (right mesh): Mesh 1: Vs - I1 R1 - (I1 - I2) R2 = 0, i.e. Vs = I1 (R1 + R2) - I2 R2. Mesh 2: -(I2 - I1) R2 - I2 R3 = 0, i.e. 0 = -I1 R2 + I2 (R2 + R3).', null, '[{"point": "Mesh 1: Vs = I1(R1 + R2) - I2 R2; Mesh 2: 0 = I2(R2 + R3) - I1 R2", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-s2', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-saq2.png')
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions (see figure (a) and (b)):

b) Use Thevenin''s theorem to find the current through the 5 Ω resistance in the circuit in figure (b). (3 marks)', 'b) Remove the 5 Ω load between A and B. Thevenin voltage: with no current in the 15 Ω resistor, VAB equals the voltage across the 20 Ω resistor: Vth = 10 x 20/(10 + 20) = 6.67 V. Thevenin resistance (source shorted): Rth = (10 || 20) + 15 = 6.67 + 15 = 21.67 Ω. Current through 5 Ω: I = Vth/(Rth + 5) = 6.67/26.67 = 0.25 A.', null, '[{"point": "Remove 5 Ω: Vth = 10 x 20/(10 + 20) = 6.67 V; Rth = (10 || 20) + 15 = 21.67 Ω; I = 6.67/(21.67 + 5) = 0.25 A", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-s2', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-saq2.png')
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions:

a) Write the differences between an induction motor and a synchronous motor. (2.5 marks)', 'a) Differences: (1) Speed - an induction motor runs slightly below synchronous speed (with slip) and its speed falls with load; a synchronous motor runs exactly at synchronous speed at all loads. (2) Excitation - the induction motor is singly excited (AC to the stator only); the synchronous motor is doubly excited (AC stator, DC rotor field). (3) Starting - the induction motor is self-starting; the synchronous motor is not and needs damper windings or another starting method. (4) Power factor - the induction motor always works at lagging power factor; the synchronous motor''s power factor can be made lagging, unity or leading by changing excitation (synchronous condenser). (5) Cost and use - induction motors are cheaper, simpler and robust for general drives; synchronous motors are used for constant speed and power-factor correction.', null, '[{"point": "Speed: induction runs below Ns (slip), synchronous at Ns constant; excitation: induction single (AC) supply, synchronous needs DC field; starting: induction self-starting, synchronous not; pf: induction lagging, synchronous adjustable (leading/lagging); cost/ use", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-s3', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following questions:

b) Why can a 3-phase induction motor not run at synchronous speed? (2.5 marks)', 'b) Torque in an induction motor is produced by currents induced in the rotor by the relative motion between the rotating magnetic field and the rotor conductors. If the rotor reached synchronous speed there would be no relative motion, so no emf, no rotor current and no torque; the rotor would slow down. Therefore it always runs below synchronous speed, with a small slip.', null, '[{"point": "Torque needs relative motion: at Ns no relative speed between rotating field and rotor, no emf/ current induced in rotor, no torque; so rotor always slips behind", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-s3', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The system shown in the figure is initially on no load with the generators at rated voltage and their emfs in phase. The ratings and percentage reactances of the generators and the transformer are marked on the diagram; resistances are neglected. The line impedance is j160 Ω. A three-phase balanced fault occurs at the receiving end of the transmission line. Determine the short-circuit current and the short-circuit MVA.', 'Choose base 100 MVA, 30 kV on the generator side and 400 kV on the line. Generator 1: X = 0.24 x 100/60 = 0.40 pu. Generator 2: X = 0.24 x 100/40 = 0.60 pu. In parallel: 0.40 x 0.60/(0.40 + 0.60) = 0.24 pu. Transformer: 0.16 pu (already on 100 MVA). Line: base impedance = 400²/100 = 1600 Ω, so X = 160/1600 = 0.10 pu. Total reactance to the fault = 0.24 + 0.16 + 0.10 = 0.50 pu. Fault current = 1.0/0.50 = 2.0 pu; base current at 400 kV = 100 x 10⁶/(√3 x 400 x 10³) = 144.3 A, so Isc = 2 x 144.3 ≈ 289 A (at 400 kV). Short-circuit MVA = base MVA/X = 100/0.50 = 200 MVA.', null, '[{"point": "Base 100 MVA, 30 kV/ 400 kV: G1 0.24 x 100/60 = 0.4 pu; G2 0.24 x 100/40 = 0.6 pu; parallel 0.24 pu; transformer 0.16 pu", "marks": 2}, {"point": "Line base Z = 400²/100 = 1600 Ω; j160 = 0.1 pu; total X = 0.5 pu", "marks": 1}, {"point": "Isc = 1/0.5 = 2 pu; Ibase = 100 MVA/(√3 x 400 kV) = 144.3 A → Isc ≈ 289 A; SC MVA = 100/0.5 = 200 MVA", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2024-saq4.png')
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

1. Calculate the installed capacity of the plant. (2 marks)', 'P = ρ g Q Hnet η = 1000 x 9.81 x 19.55 x 208.05 x 0.906 W = 36.15 x 10⁶ W ≈ 36 MW installed capacity (for example 2 x 18 MW units).', null, '[{"point": "P = ρ g Q H η = 1000 x 9.81 x 19.55 x 208.05 x 0.906 W ≈ 36.15 MW (≈ 36 MW installed)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
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
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

2. Using this installed capacity, calculate the economical transmission voltage for a 3-phase AC system. Considering technical and economic factors, propose an appropriate voltage level and justify your choice. (5 marks)', 'Still''s formula: V (kV) = 5.5 √(0.62 L + 3P/150), with L = 30 km and P = 36 150 kW: V = 5.5 √(18.6 + 723) = 5.5 x 27.2 ≈ 150 kV. The nearest standard voltage used in Bhutan (66, 132, 220, 400 kV) is 132 kV. Justification: at 132 kV the line current for 36 MW is only about 170 A, so I²R losses and voltage drop over 30 km are low; one single-circuit line has capacity for the plant with a margin for future units or nearby projects; insulation and tower costs are moderate compared with 220 kV. Because the Olathang substation is a 66/33 kV substation, the 132 kV option needs a 132/66 kV transformer bay there (or upgrading the substation); the alternative is a 66 kV double-circuit line directly into the 66 kV bus. The final choice should compare the cost of line, transformers and losses over the project life; 132 kV is proposed for lower losses and future expansion, with a cost check against 66 kV. [Expert: confirm against BPC/DGPC grid plans.]', null, '[{"point": "Still''s formula V = 5.5 √(0.62 L + 3P/150), L = 30 km, P = 36 150 kW → ≈ 150 kV", "marks": 2}, {"point": "Propose standard 132 kV (Bhutan standard levels 66/132/220/400 kV); justification: losses, voltage regulation, capacity margin, future expansion, cost of line and substations; note Olathang is 66 kV - needs 132/66 kV transformation or alternative 66 kV double circuit compared economically", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

3. Assuming a catchment area of 613 km², average annual rainfall of 100 cm and 30% evaporation loss, calculate the average power that can be generated. (5 marks)', 'Annual rainfall volume on the catchment = 613 x 10⁶ m² x 1.0 m = 613 x 10⁶ m³; after 30% evaporation loss the runoff is 0.7 x 613 x 10⁶ = 429.1 x 10⁶ m³ per year. Average flow = 429.1 x 10⁶/(365 x 24 x 3600) = 13.6 m³/s. Average power = ρ g Q H η = 1000 x 9.81 x 13.6 x 208.05 x 0.906 ≈ 25.2 MW. If the E-flow of 0.32 m³/s must be released, Q = 13.29 m³/s and the average power ≈ 24.6 MW - well below the 36 MW installed capacity, showing the effect of reduced rainfall.', null, '[{"point": "Runoff volume = 613 x 10⁶ m² x 1.0 m x 0.7 = 429.1 x 10⁶ m³/year", "marks": 2}, {"point": "Average flow = 429.1 x 10⁶/(365 x 24 x 3600) = 13.6 m³/s", "marks": 1}, {"point": "Average power = 9.81 x 13.6 x 208.05 x 0.906 ≈ 25.2 MW (≈ 24.6 MW after releasing 0.32 cumec E-flow)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 3, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

4. What do you understand by E-flow and IMHP? (3 marks)', 'Environmental flow (E-flow) is the minimum quantity of water that must be released downstream of a dam or weir at all times to keep the river ecosystem healthy - aquatic life, water quality and downstream users and religious/cultural needs - here 0.32 m³/s. An Integrated Multipurpose Hydropower Project (IMHP) is a project, usually with storage, planned to provide several benefits together: electricity generation plus drinking water supply, irrigation, flood and drought management, and sometimes recreation and tourism - for example supplying water to Paro while generating power.', null, '[{"point": "E-flow: minimum environmental flow released downstream of the dam/ weir to sustain river ecology, aquatic life and downstream users (here 0.32 cumec)", "marks": 1.5}, {"point": "IMHP: Integrated Multipurpose Hydropower Project - storage/ hydropower project designed to give several benefits besides power: water supply, irrigation, flood control, recreation, drought resilience", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 4, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
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
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

5. For a 3-phase overhead line with ACSR conductors of 15 mm diameter placed at the corners of an equilateral triangle of side 1.5 m, calculate the inductance and capacitance per phase. (4 marks)', 'r = 7.5 mm, D = 1500 mm (equilateral spacing, so D is the equivalent spacing). Inductance per phase: L = 2 x 10⁻⁷ ln(D/r'') H/m, with r'' = 0.7788 r = 5.84 mm: L = 2 x 10⁻⁷ x ln(1500/5.84) = 2 x 10⁻⁷ x 5.548 = 1.11 x 10⁻⁶ H/m = 1.11 mH/km (33.3 mH for 30 km). Capacitance per phase to neutral: C = 2πε₀/ln(D/r) = 2π x 8.854 x 10⁻¹²/ln(200) = 55.6 x 10⁻¹²/5.298 = 10.5 x 10⁻¹² F/m = 0.0105 µF/km (0.315 µF for 30 km).', null, '[{"point": "Inductance: L = 2 x 10⁻⁷ ln(D/r''), r'' = 0.7788 x 7.5 mm = 5.84 mm; L = 2 x 10⁻⁷ ln(1500/5.84) = 1.11 x 10⁻⁶ H/m = 1.11 mH/km", "marks": 2}, {"point": "Capacitance: C = 2πε₀/ln(D/r) = 55.6 x 10⁻¹²/ln(200) = 10.5 x 10⁻¹² F/m = 0.0105 µF/km (to neutral)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 5, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
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
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

6. Olathang substation has 2 x 20 MVA, 66/33 kV transformers, three outgoing 33 kV feeders (Drugyel, Shaba and Tshongdu) and an incoming 66 kV single-circuit line from Jamjee; the Parochhu IMHP will also be connected. Draw the single line diagram of the substation showing the equipment for protection, measurement and communication. (10 marks)', 'The single line diagram should show: 66 kV side - (1) incoming bay from Jamjee and (2) incoming bay from Parochhu IMHP, each with lightning arresters at the entry, capacitive voltage transformer (for metering, protection and PLCC), wave trap (if PLCC is used), line isolator with earth switch, current transformers and SF6 circuit breaker, connected to a single (or main and transfer) 66 kV bus with a bus PT. Transformer bays - two 20 MVA, 66/33 kV transformers, each with 66 kV isolator and breaker, CTs, lightning arresters, the transformer itself (protected by differential, restricted earth fault, Buchholz, oil and winding temperature and pressure relief devices, plus backup overcurrent/earth fault), 33 kV CTs and breaker. 33 kV side - a 33 kV bus with bus PT, and three outgoing feeder bays (Drugyel, Shaba, Tshongdu), each with isolator, vacuum circuit breaker, CTs, lightning arrester, energy meter and overcurrent/earth-fault relays; plus a station service transformer. Measurement and communication: CTs and PTs feeding meters (kWh, kVArh, ammeters, voltmeters), distance/differential protection for the lines, a SCADA RTU/ substation automation linked to the load dispatch centre over PLCC or OPGW fibre, and DC batteries with chargers for protection and control.', null, '[{"point": "66 kV side: two incoming bays (Jamjee line, Parochhu IMHP line) each with lightning arrester, CVT (line/ PLCC), wave trap, line isolator with earth switch, SF6 circuit breaker, CTs; 66 kV bus (with bus PT)", "marks": 3}, {"point": "Two 66/33 kV, 20 MVA transformer bays: isolators, 66 kV breaker, CTs, LAs, transformer (with differential, Buchholz, OTI/ WTI, REF protection), 33 kV breaker, CTs", "marks": 3}, {"point": "33 kV bus with PT; three feeder bays (Drugyel, Shaba, Tshongdu) each with breaker (VCB), CTs, isolators, LA, energy meter, overcurrent/ earth-fault relays; station transformer", "marks": 2}, {"point": "Measurement/ communication: CT/PT metering, relays (distance for lines, OC/EF), SCADA/ RTU, PLCC/ OPGW fibre, battery and charger; neat labelled diagram", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 6, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

7. A medium-voltage (MV) industry connected to this substation operates at an average power factor of 0.72 with an average demand of 627 kW.
(i) Explain power factor with the help of a diagram. (5 marks)
(ii) What are the methods of power factor improvement? (5 marks)
(iii) The industry is charged a demand charge of Nu 170/kVA/month. What will be the monthly saving if the power factor is improved to 0.95, and how many kVAr are required? (5 marks) (15 marks)', '(i) Power factor is the ratio of real power (kW) to apparent power (kVA): pf = kW/kVA = cos φ, where φ is the angle between voltage and current. In the power triangle, kW is the horizontal side, kVAr (reactive power) the vertical side and kVA the hypotenuse; in the phasor diagram an inductive load''s current lags the voltage by φ. A low power factor means more current for the same useful power, so higher losses, voltage drop, larger cables and transformers, and higher demand charges.
(ii) Methods: installing static capacitor banks (fixed, or automatic power factor correction panels switched in steps) close to the loads; synchronous condensers (over-excited synchronous motors); phase advancers for large induction motors; avoiding lightly loaded motors and transformers; and using efficient equipment and variable-speed drives with good power factor.
(iii) kVA at 0.72 = 627/0.72 = 870.8 kVA; at 0.95 = 627/0.95 = 660.0 kVA. Reduction in demand = 210.8 kVA, so the monthly saving = 210.8 x 170 ≈ Nu 35 840. Required compensation: kVAr = P (tan φ1 - tan φ2) = 627 x (0.964 - 0.329) ≈ 398 kVAr (a capacitor bank of about 400 kVAr).', null, '[{"point": "(i) pf = cos φ = kW/kVA; power triangle (kW, kVAr, kVA) and phasor diagram with lagging current; low pf means more current, losses, larger equipment", "marks": 5}, {"point": "(ii) Methods: static capacitor banks (fixed/ automatic APFC), synchronous condensers, phase advancers for induction motors, avoiding lightly loaded motors/ transformers, use of energy-efficient equipment", "marks": 5}, {"point": "(iii) kVA at 0.72 = 870.8; at 0.95 = 660.0; saving = 210.8 kVA x Nu 170 ≈ Nu 35 840/month; kVAr = 627 (tan 43.9° - tan 18.2°) = 627 (0.964 - 0.329) ≈ 398 kVAr", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 7, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Power evacuation for the Parochhu Integrated Multipurpose Hydropower Project
You are an electrical engineer in the Department of Energy, Ministry of Energy and Natural Resources. The Department is carrying out a feasibility study for a potential Integrated Multipurpose Hydropower Project (IMHP) in Tsento Gewog, Paro (intake about 45 minutes'' walk from the road head at Shana). Salient features:
- Full reservoir level 2934 m; tail race outfall (TRT) 2715 m; river bed level 2929 m; powerhouse ground 2720 m; raised weir 5 m.
- Gross head 219 m; total head loss 10.95 m; net head 208.05 m; g = 9.81 m/s².
- Combined efficiency 0.906; environmental flow (E-flow) 0.32 cumec; design discharge 19.55 cumec; average lean-season flow in a 90% dependable year 2.53 cumec.
The power is to be pooled at the Olathang substation, 30 km from the pothead yard, and you must design the power evacuation arrangement.

8. Draw the zero-sequence equivalent circuits for the following transformer winding arrangements and comment on the zero-sequence currents:
(i) Star-star with isolated neutrals. (2 marks)
(ii) Star-star with one neutral grounded. (2 marks)
(iii) Star-delta with the neutral grounded on the star side. (2 marks) (6 marks)', '(i) Star-star, both neutrals isolated: there is no path for zero-sequence currents on either side, so the equivalent circuit is open between both terminals and the reference - no zero-sequence current flows.
(ii) Star-star with only one neutral grounded: zero-sequence current needs a return path on both sides to flow through the transformer; with the other neutral isolated, the circuit is still open between the two sides, so no zero-sequence current flows through the transformer (the series path is broken).
(iii) Grounded star-delta: on the star side the zero-sequence impedance Z0 is connected from the terminal to the reference bus, so zero-sequence current can flow in the grounded star winding; on the delta side the terminal is open (isolated from the reference), because the induced zero-sequence currents circulate inside the delta and do not leave it into the lines.', null, '[{"point": "(i) Y-Y isolated: open circuit on both sides - no zero-sequence current can flow", "marks": 2}, {"point": "(ii) Y-Y with one neutral grounded: still open between sides (the other neutral isolated) - zero-sequence current cannot flow through the transformer; grounded side has no return path through windings", "marks": 2}, {"point": "(iii) Yg-Δ: grounded star side connected to reference through Z0; delta side open to line - zero-sequence current circulates in the delta, flows in grounded star side but not into delta-side lines", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case1', 8, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

1. Name the regulation that governs electrical wiring systems and electrical installations in Bhutan. (2 marks)', 'Electrical installations in Bhutan are regulated by the Bhutan Electricity Authority under the Electricity Act of Bhutan, through its regulations for electrical installations and wiring (and the Bhutan Building Rules for buildings), which follow Indian and IEC standards such as IS 732 (Code of practice for electrical wiring installations). [Expert: confirm the exact title of the current regulation.]', null, '[{"point": "Names the applicable Bhutan regulation/ code for electrical installations (expert to confirm the exact title) and mentions the standards it follows (e.g. IS 732 / IEC)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Expert check: confirm the exact title of Bhutan''s regulation for electrical wiring/installations."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

2. What are the different types of routine inspection and test that need to be carried out as per the regulation? (4 marks)', 'Before a new installation is connected and at regular intervals afterwards: (1) visual inspection - quality of workmanship, cable sizes, correct rating of fuses/MCBs, switches in the phase conductor, earthing connections, labelling and absence of damage; (2) insulation resistance test with a megger, between conductors and between conductors and earth (not less than the required value, e.g. 1 MΩ at 500 V); (3) earth continuity test of protective conductors and earth electrode resistance test; (4) polarity test - all switches and fuses in the phase conductor; (5) testing the operation of RCCBs/ELCBs and checking protective devices; and (6) issuing a test certificate, with periodic inspection and testing thereafter.', null, '[{"point": "Visual inspection: workmanship, sizes, protective devices, earthing, labelling, polarity of switches in phase", "marks": 1}, {"point": "Insulation resistance test (megger) between conductors and to earth; earth continuity and earth electrode resistance tests", "marks": 1.5}, {"point": "Polarity test, continuity of ring/ protective conductors, RCD operation test, verification of protective devices; periodic re-inspection and test certificate before energising", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

3. What are the reasons for providing the fuse on the phase wire? What will be the effect on the wiring if a fuse wire of much higher rating is installed? (3 marks)', 'The fuse is placed in the phase (live) wire so that when it blows, the whole circuit beyond it is disconnected from the supply and becomes dead, making it safe; if it were in the neutral, the appliance would stay connected to the live wire even after the fuse blows, creating a shock hazard. If a fuse wire of much higher rating is used, it will not melt on overloads or some faults, so excessive current keeps flowing: the cables overheat, the insulation deteriorates and may catch fire, and appliances may be damaged - the circuit is effectively unprotected.', null, '[{"point": "Fuse on phase: when it blows the circuit beyond is disconnected from supply (dead), safe for maintenance; fuse in neutral would leave equipment live, shock risk", "marks": 1.5}, {"point": "Higher rating fuse: does not melt on overload/ some faults, cables overheat, insulation damage, fire, equipment damage - no protection", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 3, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

4. A short-circuit current must be broken immediately, whereas an overload current is allowed to persist for some time before it is broken. Give a short explanation. (4 marks)', 'A short circuit produces a very large current - many times the rated current - which causes intense heating (proportional to I²t), arcing and strong electromagnetic forces; cables, switchgear and equipment can be destroyed and fires started within a fraction of a second, so it must be interrupted immediately (the magnetic/instantaneous trip of an MCB, or a fuse). An overload is only a moderate excess current; heating builds up slowly, and cables and machines can carry it for some time without damage. Short overloads occur normally, such as motor starting currents, so an inverse-time (thermal) characteristic lets them persist briefly and trips only if the overload continues long enough to cause harmful heating - avoiding unnecessary tripping.', null, '[{"point": "Short circuit: very high current (many times rated), huge I²t heating and electromagnetic forces, arcing, fire, damage to cables/ equipment within milliseconds - must be cleared instantly (magnetic trip)", "marks": 2}, {"point": "Overload: modest excess current, heating is gradual; equipment can withstand for a time; allows normal temporary surges (motor starting) without nuisance tripping - inverse time (thermal) characteristic", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 4, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

5. Is it desirable to have a low or high earthing resistance? What measures will you adopt to achieve the desired value? (5 marks)', 'A low earthing resistance is desirable (typically less than about 1 Ω for substations and a few ohms for buildings, as per the standards), so that fault current flows easily to earth, fuses/MCBs/RCDs operate quickly, the touch voltage on metal parts stays low, and lightning and surge currents are dissipated safely. Measures: use a larger plate or pipe electrode and drive it deeper to reach moist soil; use several electrodes in parallel (spaced apart); treat the pit with charcoal and salt layers or bentonite/ chemical earthing compound to reduce soil resistivity; provide a watering pipe to keep the soil moist; choose a location with moist soil away from foundations; use proper size earth conductors with good, corrosion-free connections; and test the earth resistance periodically, especially in the dry season.', null, '[{"point": "Low earth resistance desirable (e.g. < 1-5 Ω per standard): fault current flows easily, protective devices operate, touch voltage low, lightning dissipation", "marks": 2}, {"point": "Measures: deeper/ longer electrodes or multiple electrodes in parallel, chemical earthing/ charcoal and salt/ bentonite treatment, keep soil moist (watering pipe), larger plate area, proper connections, locate in moist soil, periodic testing", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 5, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

6. Explain the importance of load balancing in a three-phase system and the possible consequences of poor load distribution. (3 marks)', 'In a three-phase system the single-phase loads should be shared equally among the three phases so that the phase currents are equal, the neutral current is minimal and the transformer and cables are used efficiently with balanced voltages. Poor distribution causes a large neutral current (overheating of the neutral), voltage unbalance (low voltage on the heavily loaded phase and over-voltage on lightly loaded ones, damaging appliances), one phase overloading and tripping while others are underused, overheating and reduced life of three-phase motors, higher losses, and the need to derate the transformer.', null, '[{"point": "Importance: equal phase currents, minimum neutral current, efficient use of transformer/ cables, balanced voltages", "marks": 1.5}, {"point": "Consequences: neutral current and overheating, voltage unbalance (some consumers low/ high voltage), overloaded phase tripping, motor heating and reduced life, higher losses, transformer derating", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 6, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

7. The owner of a building wants electrical connections with the following points: Verandah - 2 lamps (60 W), 1 fan (60 W), 1 socket (5 A, 100 W); Room 1 - 1 lamp, 1 fan, 1 fluorescent lamp (40 W), 1 socket (15 A, 1000 W); Room 2 - 1 lamp, 1 fan, 1 fluorescent lamp, 1 socket (5 A, 100 W).
(i) Decide the number of final sub-circuits. (5 marks)
(ii) Decide the ratings of the components on the main board, giving reasons. (5 marks)
(iii) Write a short note on: isolator, MCB, RCCB, ELCB and RCBO. (5 marks)
(iv) What is the standard wire size for light points and power points? (3 marks) (18 marks)', '(i) Lighting and small power load: lamps 4 x 60 = 240 W, fans 3 x 60 = 180 W, fluorescent 2 x 40 = 80 W, 5 A sockets 2 x 100 = 200 W - total 700 W in 11 points. Since a lighting sub-circuit is limited to about 10 points and 800 W (IS 732 practice), use 2 lighting sub-circuits (e.g. verandah and Room 2 on one, Room 1 on the other). The 15 A, 1000 W socket needs its own power sub-circuit. Number of final sub-circuits = 3.
(ii) Total connected load ≈ 700 + 1000 = 1700 W, i.e. about 7.4 A at 230 V. Main board: a double-pole main switch/isolator of 32 A (or a 2-pole main MCB of 16-20 A) for safe isolation; an RCCB of 25 A, 30 mA sensitivity for protection against shock and earth leakage; 6 A MCBs for each lighting sub-circuit (matched to 1.5 mm² cable) and a 16 A MCB for the power sub-circuit (matched to its cable), so each circuit is protected and faults are isolated selectively; plus a neutral link and earth bar.
(iii) Isolator - a manually operated switch used to disconnect a circuit for maintenance when no current flows (off-load); it gives no protection. MCB (miniature circuit breaker) - automatically trips on overload (thermal) and short circuit (magnetic), and can be reset. RCCB (residual current circuit breaker) - trips when the currents in phase and neutral differ by more than its rating (e.g. 30 mA), protecting people from shock and earth-fault fires; it does not protect against overload. ELCB (earth leakage circuit breaker) - older term for earth-leakage devices (voltage-operated types sense the earth wire voltage; current-operated types are RCCBs). RCBO (residual current breaker with overcurrent protection) - combines an RCCB and an MCB in one device, giving earth-leakage, overload and short-circuit protection for one circuit.
(iv) Light points: 1.5 mm² copper (PVC insulated) cable; power points: 2.5 mm² copper for 5/6 A and general sockets and 4 mm² copper for 15/16 A power sockets and heavy loads, with an earth continuity conductor of appropriate size.', null, '[{"point": "(i) Lighting load: 4 lamps 240 W + 3 fans 180 W + 2 fluorescent 80 W + 2 x 5 A sockets 200 W = 700 W in 11 points; limit about 10 points/ 800 W per light sub-circuit → 2 lighting sub-circuits; 15 A socket on separate power sub-circuit → total 3 final sub-circuits", "marks": 5}, {"point": "(ii) Total ≈ 1700 W ≈ 7.4 A at 230 V; main: DP isolator/ main switch 32 A (or MCB 16-20 A), RCCB 25 A/ 30 mA, MCBs 6 A for each lighting circuit, 16 A for power circuit; reasons: load, cable rating, discrimination, safety", "marks": 5}, {"point": "(iii) Isolator: off-load disconnection; MCB: automatic overload and short-circuit protection; RCCB: trips on residual (earth leakage) current, no overcurrent; ELCB: earth leakage (voltage/ current operated, older); RCBO: RCCB + MCB combined", "marks": 5}, {"point": "(iv) Light points 1.5 mm² copper (1/1.13); power points 2.5-4 mm² copper (15 A sockets 4 mm² or 2.5 mm² as per code); earth conductor sizes", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 18,
    1944, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 7, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 11.0, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.5, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Safe electrical installations in buildings
Accurate design of electrical installations in buildings prevents short circuits, overloading and other faults that cause fires. It involves selecting appropriate materials, following correct installation procedures and keeping to safety standards and regulations, so that exposed wires, faulty connections and inadequate earthing are avoided. In Bhutan a significant number of house fires are blamed on electrical faults. As an electrical engineer, answer the following.

8. A residential consumer has 10 lamps of 40 W. The demand is: 12 midnight to 5 AM - 40 W; 5 AM to 6 PM - no load; 6 PM to 7 PM - 320 W; 7 PM to 9 PM - 360 W; 9 PM to 12 midnight - 160 W.
(i) Find the average load, maximum load, load factor and energy consumption during the day. (6 marks)
(ii) The tariff in Bhutan is Nu 1.28/kWh for 0-100 kWh and Nu 2.66/kWh above 100 kWh. Calculate the monthly bill. (5 marks) (11 marks)', '(i) Energy in the day: 12-5 AM: 40 W x 5 h = 200 Wh; 5 AM-6 PM: 0; 6-7 PM: 320 W x 1 h = 320 Wh; 7-9 PM: 360 W x 2 h = 720 Wh; 9 PM-12: 160 W x 3 h = 480 Wh. Total = 1720 Wh = 1.72 kWh per day. Average load = 1720/24 = 71.7 W. Maximum load = 360 W. Load factor = average/maximum = 71.7/360 = 0.199, about 20%.
(ii) Monthly consumption (30 days) = 1.72 x 30 = 51.6 kWh, which lies within the first slab (0-100 kWh), so the bill = 51.6 x 1.28 = Nu 66.05 (about Nu 66 per month, plus any fixed/meter charges). For a 31-day month: 53.3 kWh x 1.28 = Nu 68.25.', null, '[{"point": "Energy = 40 x 5 + 320 x 1 + 360 x 2 + 160 x 3 = 1720 Wh = 1.72 kWh/day", "marks": 2}, {"point": "Average load = 1720/24 = 71.7 W; maximum load = 360 W; load factor = 71.7/360 = 19.9%", "marks": 4}, {"point": "Monthly (30 days) = 51.6 kWh, within 0-100 slab → bill = 51.6 x 1.28 ≈ Nu 66 (plus any fixed charges)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 11,
    1188, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Electrical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2024-case2', 8, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q8';
commit;
