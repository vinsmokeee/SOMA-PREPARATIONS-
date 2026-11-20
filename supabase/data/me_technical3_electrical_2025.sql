-- ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'electrical-engineering', 'Electrical Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'electrical-engineering-2025') is null then raise exception 'unknown specialisation electrical-engineering-2025'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'electrical-engineering-2025');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A system with poles at -1, -2, and +3 is:', null, 'A pole in the right half-plane (+3) makes the system unstable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Unstable', true, 1), ('B', 'Stable', false, 2), ('C', 'Marginally stable', false, 3), ('D', 'Conditionally stable', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Nyquist sampling rate is given by:', null, 'Nyquist rate Fs = 2Fm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fs = 3 Fm', false, 1), ('B', 'Fs = 4 Fm', false, 2), ('C', 'Fs = Fm', false, 3), ('D', 'Fs = 2 Fm', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a universal gate:', null, 'NAND is a universal gate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'OR', false, 1), ('B', 'AND', false, 2), ('C', 'NOT', false, 3), ('D', 'NAND', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The resulting logic circuit obtained when both inputs of NOR and NAND gates are connected together is:', null, 'Tying both inputs of NAND or NOR together gives NOT.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'XOR', false, 1), ('B', 'NOT', true, 2), ('C', 'OR', false, 3), ('D', 'AND', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How much time is the output power of a full bridge inverter to a half bridge inverter?', null, 'Full bridge gives twice the output voltage, so four times the power.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Three times', false, 1), ('B', 'Four times', true, 2), ('C', 'Two times', false, 3), ('D', 'One time', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a Boost converter, the output voltage is always:', null, 'A boost converter steps voltage up.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '200 Volts', false, 1), ('B', 'Equal to the input voltage', false, 2), ('C', 'Greater than the input voltage', true, 3), ('D', 'Less than the input voltage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The power electronic converter shown in the figure below has a single-pole double-throw switch. The pole 𝑃 of the switch is connected alternately to throw 𝐴 and 𝐵. The converter shown is a:', null, 'Switching between Vin and ground into an L-R output is a buck converter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2025-converter.png')
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Buck converter', true, 1), ('B', 'Boost converter', false, 2), ('C', 'Chopper converter', false, 3), ('D', 'Half wave rectifier', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following devices is used to measure relatively high temperatures, such as encountered in furnaces:', null, 'Pyrometers measure high furnace temperatures.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Barometer', false, 1), ('B', 'Pyrometer', true, 2), ('C', 'Ammeter', false, 3), ('D', 'Fluxmeter', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A voltmeter is connected in a ………. with the circuit component across which potential difference is to be measured:', null, 'A voltmeter is connected in parallel.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Series', false, 1), ('B', 'None of the above', false, 2), ('C', 'Series or parallel', false, 3), ('D', 'Parallel', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A heater is rated as 230 V, 10 kW, A.C. The value 230 V refers to:', null, 'AC ratings are r.m.s. values.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'none of the above', false, 1), ('B', 'r.m.s. voltage', true, 2), ('C', 'peak voltage', false, 3), ('D', 'Average voltage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Four capacitors each of 40 µF are connected in parallel, the equivalent capacitance of the system will be:', null, 'Parallel capacitors add: 4 × 40 = 160 µF.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '160 µF', true, 1), ('B', '40 µF', false, 2), ('C', '5 µF', false, 3), ('D', '10 µF', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Find the Thevenin equivalent (VTH and RTH) between terminals A and B of the circuit given below.', null, 'VTH = 100 × 120/288 = 41.67 V; RTH = 120 ∥ 168 = 70 Ω.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2025-thevenin.png')
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4.16 V, 120 Ω', false, 1), ('B', '41.6 V, 120 Ω', false, 2), ('C', '41.67 V, 70 Ω', true, 3), ('D', '4.16 V, 70 Ω', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When short circuit occurs, voltage in circuit will be:', null, 'At the short-circuit point the voltage falls to nearly zero.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Nearly Zero', true, 1), ('B', 'Cannot be determined', false, 2), ('C', 'Infinite', false, 3), ('D', 'Rated supply voltage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which variables are specified by slack bus in the load flow studies:', null, 'The slack bus specifies |V| and δ.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Q, δ', false, 1), ('B', 'P, Q', false, 2), ('C', '|V|, δ', true, 3), ('D', '|V|, P', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Four identical alternators each are rated as 20 MVA, 11 kV having a subtransient reactance of 16% are working in parallel. The short circuit level at the busbar is:', null, 'Four 20 MVA, 16% machines in parallel: X = 0.04 pu on 20 MVA; SC level = 20/0.04 = 500 MVA.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '125 MVA', false, 1), ('B', '500 MVA', true, 2), ('C', '400 MVA', false, 3), ('D', '100 MVA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the fault current is 2000 A, the relay setting is 50% and CT ratio is 400 : 5, then plug setting multiplier will be:', null, 'Secondary = 2000 × 5/400 = 25 A; setting 50% × 5 = 2.5 A; PSM = 10.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10', true, 1), ('B', '25', false, 2), ('C', '50', false, 3), ('D', '15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Over excitation synchronous phase modifier works as:', null, 'An over-excited synchronous condenser supplies reactive power like a shunt capacitor.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Shunt reactor', false, 1), ('B', 'Series capacitor', false, 2), ('C', 'Shunt capacitor', true, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The transmission voltage levels in Bhutan are:', null, 'Bhutan''s grid uses 400, 220, 132 and 66 kV transmission.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '800kV, 765 kV, 400 kV, 220 kV', false, 1), ('B', '800 kV, 400 kV, 220 kV, 132 kV', false, 2), ('C', '765 kV, 400 kV, 220 kV, 132 kV', false, 3), ('D', '400 kV, 220 kV, 132 kV, 66 kV', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The zero-sequence current flows in a power system during:', null, 'Zero-sequence current flows only in faults involving ground (e.g. LLG).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Symmetrical three phase fault', false, 1), ('B', 'Double line to ground fault', true, 2), ('C', 'Line to line fault', false, 3), ('D', 'Open conductor fault', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main purpose of a tap-changing transformer is to:', null, 'Tap changers regulate voltage.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Improve power factor', false, 1), ('B', 'Increase fault current', false, 2), ('C', 'Reduce harmonics', false, 3), ('D', 'Regulate voltage', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The back EMF in a DC motor is given by:', null, 'Eb = V − IaRa.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Eb = V/Ia', false, 1), ('B', 'Eb = V − IaRa', true, 2), ('C', 'Eb = V × Ia', false, 3), ('D', 'Eb = V + Ia Ra', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The slip of a 4-pole, 50 Hz induction motor running at 1440 rpm is:', null, 'Ns = 1500 rpm; s = (1500 − 1440)/1500 = 4%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4 %', true, 1), ('B', '2 %', false, 2), ('C', '8 %', false, 3), ('D', '6 %', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A synchronous motor operates at unity power factor when:', null, 'Unity pf when excitation gives zero reactive power.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It is under-excited', false, 1), ('B', 'It is over-excited', false, 2), ('C', 'Field current is adjusted for zero reactive power', true, 3), ('D', 'Load torque is maximum', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Why does an induction motor never run at synchronous speed?', null, 'At synchronous speed there is no relative motion, so no induced current or torque.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Rotor windings would burn out', false, 1), ('B', 'Back EMF would exceed supply voltage', false, 2), ('C', 'This is incorrect, induction motors can reach synchronous speed', false, 3), ('D', 'No relative motion means no induced current/torque', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A transformer works on the principle of:', null, 'Transformers work by mutual induction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Electrostatic induction', false, 1), ('B', 'Electromagnetic conduction', false, 2), ('C', 'Mutual – induction', true, 3), ('D', 'Self – induction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The frequency of electrical grid in Bhutan is:', null, 'Bhutan''s grid frequency is 50 Hz.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '50 Hz', true, 1), ('B', '55 Hz', false, 2), ('C', '60 Hz', false, 3), ('D', '100 Hz', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What percentage of Bhutan''s total electricity generation comes from hydropower?', null, 'Almost all (≈ 99%+) of Bhutan''s generation is hydropower.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '30 – 40 %', false, 1), ('B', '70 – 80 %', false, 2), ('C', '99 – 100 %', true, 3), ('D', '50 – 60 %', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Power is exported to India from a hydropower plant through a three-phase, 50 Hz, completely transposed 400 kV, 150 km transmission line with positive-sequence constants z = 0.032 + j0.35 Ω/km and y = j4.2 × 10⁻⁶ S/km. Full load at the receiving end is 700 MW at 0.99 power factor leading and at 95% of rated voltage. Assuming a medium-length line (nominal π), compute the A, B, C and D parameters. (5 marks)', 'Total series impedance Z = (0.032 + j0.35) × 150 = 4.8 + j52.5 Ω; total shunt admittance Y = j4.2 × 10⁻⁶ × 150 = j6.3 × 10⁻⁴ S.
ZY = (4.8 + j52.5)(j6.3 × 10⁻⁴) = −0.03308 + j0.00302.
A = D = 1 + ZY/2 = 0.9835 + j0.0015 (≈ 0.9835∠0.09°).
B = Z = 4.8 + j52.5 Ω (≈ 52.72∠84.8° Ω).
C = Y(1 + ZY/4) = j6.3 × 10⁻⁴ × (0.9917 + j0.00076) ≈ −4.8 × 10⁻⁷ + j6.248 × 10⁻⁴ S. (Check: AD − BC ≈ 1.) The load data are not needed for A, B, C, D.', null, '[{"point": "Z = (0.032 + j0.35) × 150 = 4.8 + j52.5 Ω; Y = j6.3 × 10⁻⁴ S", "marks": 1}, {"point": "A = D = 1 + ZY/2 ≈ 0.9835 + j0.0015", "marks": 1.5}, {"point": "B = Z = 4.8 + j52.5 Ω (≈ 52.7∠84.8° Ω)", "marks": 1}, {"point": "C = Y(1 + ZY/4) ≈ −4.8 × 10⁻⁷ + j6.25 × 10⁻⁴ S", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Draw an impedance diagram for the power system shown, with all impedances in per unit on a 100 MVA base. Choose 20 kV as the voltage base for the generators. Ratings: G1 90 MVA, 20 kV, X = 9%; T1 80 MVA, 20/200 kV, X = 16%; T2 80 MVA, 200/20 kV, X = 20%; G2 90 MVA, 18 kV, X = 9%; line 200 kV, X = 120 Ω; load 200 kV, S = 48 MW + j64 Mvar. (5 marks)', 'Bases: 100 MVA; 20 kV at the generators, 200 kV on the line (Z_base line = 200²/100 = 400 Ω).
G1: X = 0.09 × (100/90) = 0.1 pu. T1: 0.16 × (100/80) = 0.2 pu. T2: 0.20 × (100/80) = 0.25 pu. G2 (rated 18 kV on a 20 kV base): 0.09 × (18/20)² × (100/90) = 0.081 pu. Line: 120/400 = 0.3 pu.
Load (as constant impedance): Z = V²/S* = 200²/(48 − j64) = 300 + j400 Ω → (300 + j400)/400 = 0.75 + j1.0 pu.
Diagram: source E1 - j0.1 - j0.2 - bus 1 (load 0.75 + j1.0 to reference) - j0.3 - bus 2 - j0.25 - j0.081 - source E2.', null, '[{"point": "G1 = 0.09 × 100/90 = 0.1 pu; T1 = 0.16 × 100/80 = 0.2 pu; T2 = 0.2 × 100/80 = 0.25 pu", "marks": 2}, {"point": "G2 = 0.09 × (18/20)² × 100/90 = 0.081 pu", "marks": 1}, {"point": "Line: Z_base = 200²/100 = 400 Ω → 0.3 pu; load Z = V²/S* = 300 + j400 Ω → 0.75 + j1.0 pu", "marks": 1}, {"point": "Correct diagram connecting the per-unit reactances", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2025-power-system.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Reduce the circuit between terminals a and b (see the figure) to a single resistor. (5 marks)', 'Between c and d: 2 ∥ 3 ∥ 6 → 1/(1/2 + 1/3 + 1/6) = 1 Ω. Path a-c-d-e: 1 + 1 + 6 = 8 Ω, in parallel with the 8 Ω from a to e: 8 ∥ 8 = 4 Ω. Then 4 + 16 (e to b) = 20 Ω. So R_ab = 20 Ω.', null, '[{"point": "2 ∥ 3 ∥ 6 Ω = 1 Ω between c and d", "marks": 2}, {"point": "Series a-c-d-e: 1 + 1 + 6 = 8 Ω, in parallel with 8 Ω → 4 Ω", "marks": 2}, {"point": "Plus 16 Ω: R_ab = 20 Ω", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), '/papers/me/tech3-ee-2025-resistors.png')
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In a factory, a three-phase, 4 kV, 400 kVA synchronous machine is installed along with induction motors. Loads: induction motors 500 kVA at 0.8 power factor lagging; synchronous motor 300 kVA at unity power factor. Determine the overall power factor of the factory loads. (5 marks)', 'Induction motors: P = 500 × 0.8 = 400 kW, Q = 500 × 0.6 = 300 kvar (lagging). Synchronous motor at unity pf: P = 300 kW, Q = 0. Total: P = 700 kW, Q = 300 kvar, S = √(700² + 300²) = 761.6 kVA. Overall pf = 700/761.6 ≈ 0.92 lagging.', null, '[{"point": "Induction motors: P = 400 kW, Q = 300 kvar lagging", "marks": 2}, {"point": "Synchronous motor: P = 300 kW, Q = 0", "marks": 1}, {"point": "Total P = 700 kW, Q = 300 kvar, S = 761.6 kVA; pf = 0.919 lagging", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

1. Explain how integrating solar PV and pumped storage with hydropower enhances grid reliability and addresses winter shortages. (5 marks)', 'In winter, river flows fall and run-of-river hydropower output drops sharply, so Bhutan imports power; but winter days are dry and sunny, so solar PV output is high - the two are complementary. Pumped storage stores surplus solar energy by pumping water uphill and releases it at night and during peaks. Hydropower''s fast ramping smooths solar variability. Together they give firm, reliable supply, reduce winter imports and use the grid more fully.', null, '[{"point": "Winter: river flows low, hydro output drops; solar is strong in dry sunny winters - complementary", "marks": 2}, {"point": "Pumped storage stores surplus energy (solar/summer) and supplies peaks and night demand", "marks": 2}, {"point": "Hydro reservoirs balance solar variability → reliability, less imports", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

2. Define grid inertia. How does large-scale integration of inverter-based solar PV affect system inertia and stability? (5 marks)', 'Grid inertia is the kinetic energy stored in the rotating masses of synchronous generators and motors, which resists sudden changes in frequency after a disturbance. Inverter-based solar PV has no rotating mass, so displacing synchronous hydro units lowers total inertia: frequency changes faster (higher rate of change of frequency) and dips deeper after a generator trip, risking under-frequency load shedding, protection mis-operation and instability. Remedies include grid-forming inverters with synthetic inertia, battery storage for fast frequency response, keeping enough hydro units online, and synchronous condensers.', null, '[{"point": "Inertia: kinetic energy in rotating synchronous machines that resists frequency change", "marks": 2}, {"point": "PV inverters have no rotating mass → lower inertia, faster RoCoF, larger frequency deviations, stability and protection issues", "marks": 2}, {"point": "Mitigation: synthetic/virtual inertia, grid-forming inverters, BESS, keep hydro units", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

3. Describe how black-start capability could be affected in a grid with high solar penetration. (5 marks)', 'Black start is restoring the grid after a total blackout using units that can start without external power and energise lines - in Bhutan typically hydro units with diesel/auxiliary supplies. Conventional PV inverters are grid-following: they need an existing voltage and frequency, provide little fault current or inertia, cannot help at night, and their output varies with weather, so a solar-heavy grid has fewer black-start resources. Black-start capability must be kept by retaining hydro black-start units, adding grid-forming batteries/inverters, and updating restoration procedures.', null, '[{"point": "Black start needs units that can start without grid power and energise lines - usually hydro", "marks": 2}, {"point": "Solar inverters are grid-following: need a voltage reference, no output at night, low fault current/inertia", "marks": 2}, {"point": "So keep hydro black-start units, add grid-forming BESS/inverters, update restoration plans", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 3, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

4. Propose two strategies to address seasonal variation of hydropower generation in line with NEP 2025. (5 marks)', '1. Build storage: reservoir and pumped-storage hydropower to store summer water and generate in winter, as NEP 2025 promotes. 2. Diversify: large-scale solar (and wind) plants that peak in the dry winter, combined with hybrid hydro-solar operation. Other options: cross-border power trade and energy banking with India (export in summer, import in winter), energy efficiency and demand-side management, and battery storage.', null, '[{"point": "Strategy 1 explained (e.g. reservoir/pumped-storage projects to store summer water)", "marks": 2.5}, {"point": "Strategy 2 explained (e.g. solar/wind diversification, cross-border trade/banking, demand-side management)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 4, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

5. Total Harmonic Distortion (THD) at the substation bus was measured as 7%. State the IEEE-recommended limits for THD and suggest two mitigation measures. (5 marks)', 'IEEE 519-2014 limits voltage THD at the point of common coupling to 8% for ≤ 1 kV, 5% for 1-69 kV, 2.5% for 69-161 kV and 1.5% above 161 kV (individual harmonics about 3%), so 7% at a substation bus is too high. Mitigation: install passive tuned or active harmonic filters near the sources; use multi-pulse (12/18-pulse) converters or phase-shifting transformers; require inverters with low-harmonic PWM control; and use detuned reactors with capacitor banks to avoid resonance.', null, '[{"point": "IEEE 519-2014 voltage THD: ≤ 8% (≤ 1 kV), 5% (1-69 kV), 2.5% (69-161 kV), 1.5% (> 161 kV); so 7% exceeds the limit at substation level", "marks": 2.5}, {"point": "Two mitigations: passive/active harmonic filters, multi-pulse converters, proper inverter design/PWM, phase-shifting transformers, detuned capacitor banks", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 5, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

6. The PV modules are rated at 400 W each at STC. (i) Estimate the total number of modules required for a 100 MWp solar plant. [3 marks] (ii) If the modules are connected in strings of 25, how many strings are needed? [2 marks] (5 marks)', '(i) Number of modules = 100 MWp/400 W = 100,000,000/400 = 250,000 modules. (ii) Strings = 250,000/25 = 10,000 strings.', null, '[{"point": "(i) 100,000,000/400 = 250,000 modules", "marks": 3}, {"point": "(ii) 250,000/25 = 10,000 strings", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 6, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

7. The 100 MWp plant is planned with an inverter loading ratio (ILR) of 1.2. (i) Calculate the required AC inverter capacity (MW). [2 marks] (ii) If each inverter is rated at 2.5 MW, how many inverters are needed? [3 marks] (5 marks)', '(i) AC capacity = DC capacity/ILR = 100/1.2 ≈ 83.3 MW. (ii) 83.3/2.5 = 33.3, so 34 inverters (rounding up).', null, '[{"point": "(i) AC capacity = 100/1.2 ≈ 83.3 MW", "marks": 2}, {"point": "(ii) 83.3/2.5 = 33.3 → 34 inverters", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 7, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

8. Explain how phasor measurement units (PMUs) can improve monitoring of renewable-rich grids. (5 marks)', 'PMUs measure voltage and current phasors, frequency and rate of change of frequency at 25-50 samples per second, time-stamped by GPS, so measurements from across the grid can be compared directly. In a grid with variable solar, they give real-time wide-area visibility of power swings, oscillations, low-inertia frequency events and voltage problems that SCADA (every few seconds) misses; enable early warnings and automatic control; help locate faults and post-event analysis; and validate dynamic models of inverter-based plants.', null, '[{"point": "PMUs measure voltage/current phasors, frequency and RoCoF, GPS time-synchronised, many samples per second", "marks": 2}, {"point": "Wide-area monitoring: real-time visibility of oscillations, frequency events, renewable variability, stability margins", "marks": 2}, {"point": "Better protection/control, fault location, model validation", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 8, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

9. Describe one example of how artificial intelligence (AI) could support Bhutan''s grid operations under NEP 2025. (5 marks)', 'Example: machine-learning forecasting of solar output (using weather and satellite data), river inflows (using rainfall and snow data) and electricity demand. Better forecasts let the system operator schedule hydro reservoirs and pumped storage, plan exports and winter imports, keep reserves and reduce curtailment. Other uses: predictive maintenance of transformers and lines, fault detection and smart outage management.', null, '[{"point": "A concrete AI application (e.g. forecasting solar/hydro inflows and demand)", "marks": 3}, {"point": "How it improves operation (dispatch, storage scheduling, trade, fewer outages)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 9, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE I
Bhutan has officially launched the National Energy Policy 2025 (NEP 2025) with the vision of transforming the country''s power sector through modernisation, diversification and sustainability. The policy sets ambitious targets of achieving 25,000 MW installed capacity by 2040, of which 20,000 MW is expected from hydropower and 5,000 MW from solar. The policy also emphasises private and foreign investment, promotion of pumped storage and hybrid systems, and adoption of energy efficiency, grid flexibility and smart technologies.

10. Suggest one policy-oriented research area universities in Bhutan could focus on to strengthen NEP 2025 implementation. (5 marks)', 'Example: research on the least-cost mix and siting of hydropower, solar and pumped storage for winter energy security, including tariff and market design for private investment (feed-in tariffs, power purchase agreements, cross-border trading). Findings would guide licensing, investment incentives and grid planning under NEP 2025; other areas include grid codes for inverter-based generation, energy-efficiency standards and the impact of climate change on hydrology.', null, '[{"point": "A clear research area (e.g. optimal hydro-solar-storage mix and pricing/market design; grid codes for inverter-based resources; energy efficiency policy)", "marks": 3}, {"point": "Why it matters and how findings feed policy", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case1', 10, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C1Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

1. Define power system stability and differentiate between transient, dynamic and steady-state stability. (6 marks)', 'Power system stability is the ability of the system to remain in synchronism and regain an acceptable equilibrium after a disturbance, with voltages and frequency within limits. Steady-state stability: ability to stay in synchronism under small, gradual changes in load (limit P_max = EV/X). Transient stability: ability to remain in synchronism after large, sudden disturbances such as faults, line trips or loss of generation, judged over the first swing (a few seconds). Dynamic (small-signal) stability: ability to damp small oscillations over a longer period, including the effect of governors, excitation systems and PSS.', null, '[{"point": "Definition: ability to regain equilibrium after a disturbance with variables within limits", "marks": 1.5}, {"point": "Steady-state: small gradual changes", "marks": 1.5}, {"point": "Transient: large sudden disturbances, first swing", "marks": 1.5}, {"point": "Dynamic: small disturbances over longer time with controls (oscillations)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 1, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

2. Explain the equal area criterion and its application in transient stability analysis. (5 marks)', 'For a single machine connected to an infinite bus, the swing equation relates rotor acceleration to the difference between mechanical input Pm and electrical output Pe = (EV/X) sin δ. During a fault Pe falls, the rotor accelerates and δ increases (accelerating area A1). After clearing, Pe > Pm and the rotor decelerates (decelerating area A2). The system is stable if A2 can equal A1 before δ passes the maximum angle. It is used to find the critical clearing angle and critical clearing time, showing why fast protection and auto-reclosing improve stability.', null, '[{"point": "Based on swing equation and power-angle curve for a machine-infinite bus", "marks": 1.5}, {"point": "Accelerating area A1 (Pm > Pe during fault) must equal decelerating area A2 for stability", "marks": 2}, {"point": "Application: critical clearing angle/time, effect of fault clearing speed", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 2, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

3. What is the role of system inertia in power system stability? (4 marks)', 'Inertia of rotating generators stores kinetic energy that is released or absorbed instantly when generation and load become unbalanced, slowing the rate of change of frequency and limiting how far frequency falls or rises. This gives governors and other controls time to respond and reduces rotor-angle swings, so higher inertia improves frequency and transient stability; low inertia makes the system more sensitive to disturbances such as load rejection.', null, '[{"point": "Inertia stores kinetic energy, slows rate of frequency change after imbalance", "marks": 2}, {"point": "Gives time for governors/controls; higher inertia improves frequency and transient stability", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 3, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

4. If the line reactance is 0.3 pu on a 100 MVA base and the sending- and receiving-end voltages are equal, determine the maximum power transfer capability using the power-angle equation. (5 marks)', 'P = (V_s V_r/X) sin δ, maximum when δ = 90°. With V_s = V_r = 1 pu: P_max = 1/0.3 = 3.33 pu = 3.33 × 100 = 333 MVA ≈ 333 MW.', null, '[{"point": "P = (V_s V_r/X) sin δ; maximum at δ = 90°", "marks": 2}, {"point": "P_max = 1 × 1/0.3 = 3.33 pu", "marks": 2}, {"point": "= 333 MW on 100 MVA base", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 4, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

5. A fault occurs at 90% of the line length from the sending end. Explain how a distance relay determines the fault location using impedance measurement and time delay. (6 marks)', 'A distance (impedance) relay measures voltage and current at its location and computes the apparent impedance Z = V/I, which is proportional to the line length up to the fault. It compares Z with set zones: Zone 1 covers about 80-85% of the line and trips instantly; Zone 2 covers about 120% (the rest of the line plus part of the next) with a time delay of about 0.3-0.4 s; Zone 3 is remote backup with a longer delay. A fault at 90% of the line is outside Zone 1 (to avoid overreach due to errors) but inside Zone 2, so the sending-end relay trips after the Zone 2 delay - unless a communication-aided scheme (permissive/inter-trip) gives instantaneous tripping; the receiving-end relay sees it in its Zone 1.', null, '[{"point": "Relay measures V/I = apparent impedance proportional to distance to fault", "marks": 2}, {"point": "Zones: Zone 1 ≈ 80-85% instantaneous; Zone 2 ≈ 120% with delay (0.3-0.4 s); Zone 3 backup with longer delay", "marks": 2}, {"point": "Fault at 90% is beyond Zone 1, so tripped by Zone 2 after delay (or instantly with carrier/communication scheme)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 5, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

6. Explain the difference between radial and ring distribution systems. Discuss their reliability and fault isolation characteristics. (4 marks)', 'Radial: feeders run outward from the substation in one path; simple, cheap and easy to protect, but any fault or maintenance interrupts all consumers beyond that point - low reliability. Ring (loop): feeders form a closed loop so each point can be fed from two directions; a faulted section can be isolated by switches/breakers while the rest stays supplied - higher reliability and voltage regulation, but more cost and more complex protection.', null, '[{"point": "Radial: single path from source, simple and cheap; a fault interrupts all downstream consumers", "marks": 2}, {"point": "Ring: closed loop, two paths; faulted section isolated by breakers and supply maintained - more reliable, costlier, complex protection", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 6, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

7. During a three-phase fault at the middle of the line, the measured fault current was 10 kA. If the CT ratio is 1000:1, calculate the secondary current entering the relay. (4 marks)', 'Secondary current = 10,000 A/1000 = 10 A.', null, '[{"point": "I_sec = 10,000/1000", "marks": 2}, {"point": "= 10 A", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 7, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

8. Define the concept of voltage stability margin and describe how it can be monitored using P-V and Q-V curves. (6 marks)', 'Voltage stability margin is how far the system is from voltage collapse - the extra load (MW) or reactive demand (Mvar) it can take before voltages can no longer be maintained. P-V curve: bus voltage plotted against load; the ''nose'' is the maximum loadability, and the MW margin is the distance from the operating point to the nose. Q-V curve: reactive power injection needed at a bus versus its voltage; the minimum of the curve shows the reactive power reserve margin (positive minimum means unstable). Operators compute these curves with continuation load flow and monitor margins in real time using SCADA/PMU data, adding reactive support or shedding load before the margin is too small.', null, '[{"point": "Margin: distance (MW or Mvar) from current operating point to voltage collapse point", "marks": 2}, {"point": "P-V curve: voltage vs load; nose point = maximum loadability; margin = P_max − P_operating", "marks": 2}, {"point": "Q-V curve: reactive power needed vs voltage; bottom of curve = reactive reserve margin; monitored in real time with SCADA/PMUs", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 8, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

9. Compare the use of SVC and STATCOM for reactive power support on this line. Which is better and why? (5 marks)', 'SVC (static var compensator) uses thyristor-controlled reactors and thyristor-switched capacitors; it is mature and cheaper, but its reactive output falls with the square of voltage, so support weakens exactly when voltage collapses, it responds more slowly and produces harmonics. STATCOM uses a voltage-source converter; it can supply near-rated reactive current even at low voltage, responds faster, has a smaller footprint and can help damp oscillations. For voltage instability during peak demand and disturbances, a STATCOM is better, though more expensive.', null, '[{"point": "SVC: thyristor-controlled reactors/switched capacitors, reactive output falls with V² at low voltage, slower, larger, harmonics", "marks": 2}, {"point": "STATCOM: VSC-based, constant current at low voltage, faster response, smaller footprint, better for voltage instability", "marks": 2}, {"point": "Conclusion: STATCOM better for this case (voltage instability, transients), SVC cheaper", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 9, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'CASE II
A 220 kV double-circuit transmission line connects a large hydropower plant (600 MW) to a regional load centre. The system recently experienced multiple disturbances: a single line-to-ground fault causing relay misoperation; power swings during sudden load rejection; and voltage instability during peak demand. As an electrical engineer in the transmission utility, you are tasked with analysing the situation.

10. A generator is operating at 0.85 lagging power factor. Explain the impact of this condition on reactive power demand and voltage regulation. (5 marks)', 'At 0.85 lagging pf the generator is over-excited and supplies reactive power to inductive loads: Q = P tan(cos⁻¹ 0.85) ≈ 0.62 P (about 62 Mvar for every 100 MW). This raises current for the same real power, increasing I²R losses and heating, and reduces the real-power capability within the machine''s rating. The large reactive flow causes bigger voltage drops along the 220 kV line, so voltage regulation at the load end worsens; the generator''s excitation supports voltage but may hit its field-current limit, so local reactive compensation (capacitors, STATCOM) near the load centre is needed.', null, '[{"point": "Lagging pf: generator supplies reactive power (over-excited) to inductive loads: Q = P tan(cos⁻¹0.85) ≈ 0.62 P", "marks": 2}, {"point": "Higher current, losses, reduced real power capability", "marks": 1.5}, {"point": "Voltage drop along lines larger; generator supports voltage but nearing excitation limits; need compensation", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Electrical Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ee2025-case2', 10, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q10';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The SI unit of magnetic flux is the', null, 'Magnetic flux is measured in webers (Wb).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'gauss', false, 1), ('B', 'henry', false, 2), ('C', 'tesla', false, 3), ('D', 'weber', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Power factor of an AC circuit is', null, 'Power factor = real power/apparent power = cos φ.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'P/S = cos φ', true, 1), ('B', 'S/P', false, 2), ('C', 'P/Q', false, 3), ('D', 'Q/S', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a balanced star-connected three-phase system, the line voltage equals', null, 'V_L = √3 V_ph in star.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'electrical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Electrical Engineering): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'electrical-engineering-2025'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'phase voltage/√3', false, 1), ('B', '√3 × phase voltage', true, 2), ('C', '3 × phase voltage', false, 3), ('D', 'the phase voltage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
commit;
