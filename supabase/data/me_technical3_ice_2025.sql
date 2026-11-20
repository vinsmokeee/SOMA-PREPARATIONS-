-- ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'instrumentation-and-control-engineering', 'Instrumentation and Control Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'instrumentation-control-engineering') is null then raise exception 'unknown specialisation instrumentation-control-engineering'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'instrumentation-control-engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a primary element in a measurement system?', null, 'A controller is not part of the measurement system; sensor, transducer and signal conditioner are.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Controller', true, 1), ('B', 'Transducer', false, 2), ('C', 'Signal conditioner', false, 3), ('D', 'Sensor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The range of a 4 – 20 mA signal is chosen because:', null, 'A live zero (4 mA) lets a broken loop (0 mA) be detected.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'It avoids zero current for fault detection', true, 1), ('B', 'It’s cheaper than other ranges', false, 2), ('C', 'It allows bidirectional transmission', false, 3), ('D', 'It works only for digital systems', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A thermocouple works on which principle?', null, 'Thermocouples use the Seebeck effect.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Piezoelectric effect', false, 1), ('B', 'Seebeck effect', true, 2), ('C', 'Hall effect', false, 3), ('D', 'Doppler effect', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a PID controller, the proportional term:', null, 'Proportional action speeds up response but leaves steady-state offset.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reduces overshoot', false, 1), ('B', 'Increases speed of response', true, 2), ('C', 'Filters noise', false, 3), ('D', 'Eliminates steady-state error', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the output of an LVDT proportional to?', null, 'LVDT output is proportional to core displacement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Acceleration', false, 1), ('B', 'Force', false, 2), ('C', 'Velocity', false, 3), ('D', 'Displacement', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which sensor is most suitable for non-contact temperature measurement?', null, 'Infrared thermometers measure without contact.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Infrared thermometer', true, 1), ('B', 'RTD', false, 2), ('C', 'Thermistor', false, 3), ('D', 'Thermocouple', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which control strategy is best for processes with large dead time?', null, 'The Smith predictor compensates for large dead time.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Feedforward only', false, 1), ('B', 'Smith predictor', true, 2), ('C', 'Cascade control', false, 3), ('D', 'PID control', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In HART communication, the digital signal is superimposed on:', null, 'HART superimposes an FSK digital signal on the 4-20 mA current loop.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Optical fiber', false, 1), ('B', 'Voltage', false, 2), ('C', 'Current loop', true, 3), ('D', 'Pressure', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a secondary transducer?', null, 'The strain gauge on a Bourdon tube converts its displacement (from the primary element) into an electrical signal.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Thermistor', false, 1), ('B', 'LVDT', false, 2), ('C', 'Bourdon tube with strain gauge', true, 3), ('D', 'Thermocouple', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is NOT a final control element?', null, 'An RTD is a sensor, not a final control element.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pneumatic control valve', false, 1), ('B', 'Electric motor', false, 2), ('C', 'Solenoid valve', false, 3), ('D', 'RTD sensor', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In PLC programming, which instruction is used for counting events?', null, 'CTU (count up) counts events.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'TON', false, 1), ('B', 'CTU', true, 2), ('C', 'MOV', false, 3), ('D', 'PID', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main advantage of a 3-wire RTD over a 2-wire RTD is:', null, 'A 3-wire RTD compensates for lead-wire resistance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Higher temperature range', false, 1), ('B', 'Better linearity', false, 2), ('C', 'Compensation for lead wire resistance', true, 3), ('D', 'Higher sensitivity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Ziegler–Nichols tuning method is used for:', null, 'Ziegler-Nichols is a controller tuning method.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Designing sensors', false, 1), ('B', 'Tuning controller parameters', true, 2), ('C', 'Selecting actuators', false, 3), ('D', 'Measuring system gain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a control loop, the actuator’s main function is to:', null, 'The actuator converts the control signal into physical action.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Measure the process variable', false, 1), ('B', 'Calculate error', false, 2), ('C', 'Filter noise', false, 3), ('D', 'Convert control signal into physical action', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which sensor type uses a Wheatstone bridge for measurement?', null, 'Strain gauges are measured with a Wheatstone bridge.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ultrasonic sensor', false, 1), ('B', 'Strain gauge', true, 2), ('C', 'Hall effect sensor', false, 3), ('D', 'Thermocouple', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Dead time in a process can cause:', null, 'Dead time causes oscillation and can destabilise the loop.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lower process gain', false, 1), ('B', 'More stability', false, 2), ('C', 'Faster response', false, 3), ('D', 'Oscillation and instability', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term “span” in instrumentation refers to:', null, 'Span = upper range value - lower range value.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Time delay in response', false, 1), ('B', 'Maximum possible output signal', false, 2), ('C', 'Difference between upper and lower range limits', true, 3), ('D', 'Measurement accuracy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which controller action produces the fastest response to sudden disturbances?', null, 'Derivative action responds to the rate of change, so it reacts fastest.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Derivative', true, 1), ('B', 'Integral', false, 2), ('C', 'On/Off', false, 3), ('D', 'Proportional', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In SCADA systems, the RTU stands for:', null, 'RTU = Remote Terminal Unit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Real-Time Unit', false, 1), ('B', 'Remote Transducer Unit', false, 2), ('C', 'Remote Terminal Unit', true, 3), ('D', 'Remote Transfer Utility', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which valve characteristic provides a linear relationship between flow rate and valve position?', null, 'A linear characteristic gives flow proportional to valve position.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Linear', true, 1), ('B', 'Globe', false, 2), ('C', 'Quick opening', false, 3), ('D', 'Equal percentage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The transfer function of a first-order system is:', null, 'A first-order system has G(s) = K / (τs + 1).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 / s', false, 1), ('B', 'K / (s² + 1)', false, 2), ('C', 'K / (τs)', false, 3), ('D', 'K / (τs + 1)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a DCS, the control logic is generally executed in:', null, 'DCS control logic runs in the controller modules.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Controller module', true, 1), ('B', 'PLC only', false, 2), ('C', 'Operator workstation', false, 3), ('D', 'Engineering workstation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which parameter is NOT usually measured in process control?', null, 'Weightlifting capacity is not a process variable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pressure', false, 1), ('B', 'Weightlifting capacity', true, 2), ('C', 'Flow', false, 3), ('D', 'Temperature', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which sensor type works based on change in inductance?', null, 'The LVDT works on changing mutual inductance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Capacitive sensor', false, 1), ('B', 'Ultrasonic sensor', false, 2), ('C', 'LVDT', true, 3), ('D', 'Hall effect sensor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main purpose of a signal conditioner is to:', null, 'Signal conditioners filter, amplify and convert sensor signals.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Convert electrical signals into mechanical signals', false, 1), ('B', 'Change AC to DC', false, 2), ('C', 'Filter noise and amplify signals', true, 3), ('D', 'Control the process directly', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a non-contact displacement sensor?', null, 'Laser triangulation measures displacement without contact.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Strain gauge', false, 1), ('B', 'LVDT', false, 2), ('C', 'Potentiometer', false, 3), ('D', 'Laser triangulation sensor', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cascade control is mainly used to:', null, 'Cascade control rejects disturbances in the inner (secondary) loop before they affect the primary variable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reduce effect of load disturbances', true, 1), ('B', 'Increase process gain', false, 2), ('C', 'Improve sensor accuracy', false, 3), ('D', 'Reduce dead time', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A pneumatic signal standard range is:', null, 'The standard pneumatic signal is 3-15 psi.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3–15 psi', true, 1), ('B', '0–100 psi', false, 2), ('C', '4–20 psi', false, 3), ('D', '1–10 psi', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The sampling theorem states that the sampling frequency must be at least:', null, 'Sampling frequency must be at least twice the highest frequency in the signal.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Half the signal frequency', false, 1), ('B', 'Twice the highest frequency component of the signal', true, 2), ('C', 'Equal to the signal frequency', false, 3), ('D', 'Twice the Nyquist rate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is an example of a smart transmitter?', null, 'A HART-enabled pressure transmitter is a smart transmitter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Manual pressure gauge', false, 1), ('B', 'Bimetallic thermometer', false, 2), ('C', 'Analog-only 4–20 mA transmitter', false, 3), ('D', 'HART-enabled pressure transmitter', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Discuss the concept of feedback control and feedforward control in industrial processes. Give examples of situations where each control strategy is most effective.', 'Feedback control measures the controlled (process) variable, compares it with the set point and acts on the error (e.g. PID). It corrects any disturbance or model error, but only after the output has already deviated, so it is slow for processes with long dead time. Most effective for: temperature, level or pressure loops with unmeasured disturbances, e.g. tank level control with a level transmitter and inlet valve.
Feedforward control measures a major disturbance and adjusts the manipulated variable before the output is affected, using a model of the process. It can cancel measured disturbances quickly but cannot correct unmeasured disturbances or model errors, so it is usually combined with feedback. Most effective where a large, measurable disturbance exists, e.g. boiler drum level (steam flow feedforward to feedwater: three-element control), or heat exchanger outlet temperature with feed-flow changes.', null, '[{"point": "Feedback: measures controlled variable, corrects error after it occurs; robust to unknown disturbances", "marks": 1.5}, {"point": "Feedforward: measures disturbance and acts before it affects output; needs process model; no correction of model error", "marks": 1.5}, {"point": "Examples for each (and combined feedforward + feedback)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is a 4-20 mA current loop and why is it widely used in process control?', 'A 4-20 mA current loop transmits an analogue measurement or control signal as a current: 4 mA = 0% (lower range value) and 20 mA = 100% (upper range value). A DC power supply (usually 24 V), the transmitter and the receiver (PLC/DCS input via a 250 Ω resistor giving 1-5 V) are connected in series, so the same current flows through all of them.
Reasons for wide use: current is the same everywhere in the loop, so it is not affected by wire resistance or voltage drops and works over long distances; it is less sensitive to electrical noise; the ''live zero'' (4 mA) distinguishes a true 0% reading from a broken wire or failed device (0 mA or <3.6 mA alarms); the 4 mA minimum can power two-wire transmitters; it is a simple, cheap, universal standard and can carry HART digital communication on top.', null, '[{"point": "Definition: analogue signal transmission where current 4-20 mA represents 0-100% of range; loop with power supply, transmitter, receiver", "marks": 2}, {"point": "Reasons: immune to voltage drop/wire resistance and noise, live zero detects faults, long distance, two-wire powering, standard, HART", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the working principle of an RTD and mention its advantages over a thermocouple.', 'A resistance temperature detector (RTD) uses the fact that the electrical resistance of a pure metal (usually platinum) rises almost linearly with temperature: R_T = R0 (1 + αT), where for Pt100 R0 = 100 Ω at 0 °C and α = 0.00385 Ω/Ω/°C. A small constant current is passed (or a Wheatstone bridge is used) and the resistance is converted to temperature; 3- or 4-wire connections compensate for lead resistance.
Advantages over a thermocouple: higher accuracy and better linearity; better long-term stability and repeatability; no cold-junction compensation needed; stronger signal and less noise; ideal for precise measurement in the range about -200 to 600 °C. (Thermocouples are cheaper, faster and cover higher temperatures.)', null, '[{"point": "Principle: metal resistance increases with temperature; Pt100 R = R0(1 + αT), α = 0.00385; measured via bridge/constant current, 2/3/4-wire", "marks": 2.5}, {"point": "Advantages: higher accuracy, linearity, stability/repeatability, no cold-junction compensation, good at low-medium temperatures", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the concept of gain scheduling in process control and give one example where it is used.', 'Many processes are nonlinear: their gain, time constant or dead time change with operating point, so one set of PID settings is good at one load but sluggish or oscillatory at another. In gain scheduling, the controller parameters (gain, integral and derivative times) are changed automatically according to a measured scheduling variable (e.g. load, flow, level or set point), using a table of tunings found for different operating regions, with smooth interpolation between them.
Example: pH neutralisation, where process gain is very high near pH 7 and low far from it - lower controller gain is used near neutrality. Others: level control in a conical or spherical tank (gain varies with level), boiler or turbine control at different loads, and aircraft autopilots at different speeds and altitudes.', null, '[{"point": "Concept: controller parameters changed according to operating condition (scheduling variable) for nonlinear processes", "marks": 3}, {"point": "Example: pH control, level in conical tank, boiler at different loads, aircraft, valve with nonlinear characteristic", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Temperature control of a jacketed mixing tank
A food plant uses a jacketed mixing tank to heat a product to 70.0 °C. The control system has:
- A Pt100 RTD (3-wire) measuring product temperature, wired to a temperature transmitter (4-20 mA).
- A control valve actuated by an I/P converter (4-20 mA → 3-15 psi) controlling steam to the jacket.
- A PLC performing a single-loop PID (temperature control).
- Typical operating point: valve opening about 0.35 (35% fraction); product flow and feed composition are roughly steady.
During commissioning the following observations and test data were recorded:
1. The RTD/transmitter shows +0.6 °C higher than a calibrated reference thermometer at 70.0 °C.
2. A step test on valve opening from 0.30 → 0.40 (Δu = 0.10) produced a delayed rise in product temperature with approximately first-order-plus-dead-time (FOPDT) behaviour: steady change ΔT∞ = +3.0 °C, apparent time constant τ = 120 s and dead time θ = 8 s.
3. The I/P response test shows outputs slightly nonlinear near the low end (3-5 psi) but approximately linear over most of the span.
4. Operators report: when the set point is 70.0 °C, temperature oscillates between 68.5 and 71.5 °C; when the set point is raised to 71.0 °C the rise is slow, and it sometimes overshoots by 1.2 °C on cooling when the set point is reduced.

1. List six likely causes (control, instrumentation and process) for the observed oscillations, slow rise and overshoots. For each cause give a one-line explanation. Give one priority corrective action you would do first and why. (12 marks)', '1. PID too aggressive (high gain or short integral time) for the process - causes sustained oscillation of ±1.5 °C. 2. Integral windup during large set-point changes - integral term keeps pushing, giving overshoot. 3. Dead time (8 s) plus sensor lag (RTD in thermowell) - delays feedback and reduces stability margin. 4. Control valve stiction/hysteresis or I/P nonlinearity at low openings - causes stick-slip limit cycles. 5. Transmitter bias (+0.6 °C) and noise amplified by derivative action - wrong measurement and jittery valve. 6. Steam supply pressure fluctuations or poor mixing in the tank - disturbance and uneven temperature. (Also: valve oversized so operation near 30-40% with high gain; slow cooling as process is asymmetric - heating by steam, cooling only by losses.)
Priority action: first retune the PID using the step-test FOPDT model (K = 3.0/0.10 = 30 °C per unit, τ = 120 s, θ = 8 s), e.g. with IMC/lambda tuning, add anti-windup and set-point ramping - because the measured process is easy to control (θ/τ ≈ 0.07), so the oscillation is most likely caused by poor tuning, and retuning is cheap, quick and safe. (Check valve stiction with a bump test at the same time.)', null, '[{"point": "Six plausible causes with one-line explanations (1.5 each): aggressive gain / too short integral time, integral windup, dead time, valve stiction/hysteresis or I/P nonlinearity, sensor bias/lag (thermowell), noise with derivative, steam pressure fluctuation, poor mixing", "marks": 9}, {"point": "Priority action with justification (e.g. retune PID from FOPDT model, check valve stiction first)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case1', 1, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Temperature control of a jacketed mixing tank
A food plant uses a jacketed mixing tank to heat a product to 70.0 °C. The control system has:
- A Pt100 RTD (3-wire) measuring product temperature, wired to a temperature transmitter (4-20 mA).
- A control valve actuated by an I/P converter (4-20 mA → 3-15 psi) controlling steam to the jacket.
- A PLC performing a single-loop PID (temperature control).
- Typical operating point: valve opening about 0.35 (35% fraction); product flow and feed composition are roughly steady.
During commissioning the following observations and test data were recorded:
1. The RTD/transmitter shows +0.6 °C higher than a calibrated reference thermometer at 70.0 °C.
2. A step test on valve opening from 0.30 → 0.40 (Δu = 0.10) produced a delayed rise in product temperature with approximately first-order-plus-dead-time (FOPDT) behaviour: steady change ΔT∞ = +3.0 °C, apparent time constant τ = 120 s and dead time θ = 8 s.
3. The I/P response test shows outputs slightly nonlinear near the low end (3-5 psi) but approximately linear over most of the span.
4. Operators report: when the set point is 70.0 °C, temperature oscillates between 68.5 and 71.5 °C; when the set point is raised to 71.0 °C the rise is slow, and it sometimes overshoots by 1.2 °C on cooling when the set point is reduced.

2. Sensor calibration and its effect
(i) Compute the Pt100 resistance at 70.0 °C (use R0 = 100 Ω, α = 0.00385 Ω/Ω/°C).
(ii) Compute the resistance error corresponding to the +0.6 °C transmitter bias.
(iii) Explain qualitatively how this +0.6 °C bias affects the control loop behaviour. (12 marks)', '(i) R70 = R0 (1 + αT) = 100 x (1 + 0.00385 x 70.0) = 100 x 1.2695 = 126.95 Ω.
(ii) ΔR = R0 x α x ΔT = 100 x 0.00385 x 0.6 = 0.231 Ω; i.e. the transmitter behaves as if it saw 127.18 Ω (equivalent to 70.6 °C).
(iii) The controller acts on the measured value, so with a +0.6 °C bias it holds the measured temperature at 70.0 °C while the actual product is about 69.4 °C - a steady offset in the true temperature that may affect product quality or pasteurisation. It does not cause the oscillation (a constant bias does not change loop gain or dynamics), but it shifts the whole operating point and makes the ±0.5 °C target meaningless relative to the true value. Correct it by calibrating/trimming the transmitter (or applying an offset in the PLC) against the reference thermometer, and check the 3-wire lead compensation.', null, '[{"point": "(i) R = 100(1 + 0.00385 x 70) = 126.95 Ω", "marks": 4}, {"point": "(ii) ΔR = 100 x 0.00385 x 0.6 = 0.231 Ω (reads as 127.18 Ω)", "marks": 4}, {"point": "(iii) Bias makes controller hold actual product 0.6 °C lower (69.4 °C); offset not oscillation; quality/safety effect; fix by calibration/trim", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case1', 2, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Temperature control of a jacketed mixing tank
A food plant uses a jacketed mixing tank to heat a product to 70.0 °C. The control system has:
- A Pt100 RTD (3-wire) measuring product temperature, wired to a temperature transmitter (4-20 mA).
- A control valve actuated by an I/P converter (4-20 mA → 3-15 psi) controlling steam to the jacket.
- A PLC performing a single-loop PID (temperature control).
- Typical operating point: valve opening about 0.35 (35% fraction); product flow and feed composition are roughly steady.
During commissioning the following observations and test data were recorded:
1. The RTD/transmitter shows +0.6 °C higher than a calibrated reference thermometer at 70.0 °C.
2. A step test on valve opening from 0.30 → 0.40 (Δu = 0.10) produced a delayed rise in product temperature with approximately first-order-plus-dead-time (FOPDT) behaviour: steady change ΔT∞ = +3.0 °C, apparent time constant τ = 120 s and dead time θ = 8 s.
3. The I/P response test shows outputs slightly nonlinear near the low end (3-5 psi) but approximately linear over most of the span.
4. Operators report: when the set point is 70.0 °C, temperature oscillates between 68.5 and 71.5 °C; when the set point is raised to 71.0 °C the rise is slow, and it sometimes overshoots by 1.2 °C on cooling when the set point is reduced.

3. I/P nonlinearity and valve
(i) Explain how moderate I/P nonlinearity near low pressure (3-5 psi) would affect small-signal control around low valve openings.
(ii) Propose two practical fixes (one instrumentation fix, one control/software fix) and explain the expected benefit. (12 marks)', '(i) Near 3-5 psi the I/P output does not change in proportion to the controller output, so the effective loop gain changes: small controller moves may produce too little (dead-band-like) or too much valve movement. A PID tuned for the linear region becomes sluggish (low gain) or oscillatory (high gain) there; together with valve friction this can create limit cycles and poor fine control at low openings (at low load or during cooling/start-up).
(ii) Instrumentation fix: fit a smart valve positioner (closed-loop on actual stem position) or recalibrate/replace the I/P, and if needed resize/trim the valve so the normal operating point is in the linear mid-range - benefit: valve position follows the controller output accurately and repeatably. Control/software fix: add a characterisation (linearising) function in the PLC that inverts the measured I/P curve, or use gain scheduling of the PID at low output - benefit: constant effective loop gain over the whole span, so the same tuning works at all openings.', null, '[{"point": "(i) Local gain varies (lower/higher), dead band, hysteresis; controller tuned for linear range becomes sluggish or oscillatory near low openings; limit cycles; poor small corrections", "marks": 6}, {"point": "(ii) Instrumentation fix: valve positioner/ recalibrate or replace I/P, resize valve so operating point is mid-range", "marks": 3}, {"point": "Software fix: characterisation/linearisation curve in PLC or gain scheduling", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case1', 3, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Temperature control of a jacketed mixing tank
A food plant uses a jacketed mixing tank to heat a product to 70.0 °C. The control system has:
- A Pt100 RTD (3-wire) measuring product temperature, wired to a temperature transmitter (4-20 mA).
- A control valve actuated by an I/P converter (4-20 mA → 3-15 psi) controlling steam to the jacket.
- A PLC performing a single-loop PID (temperature control).
- Typical operating point: valve opening about 0.35 (35% fraction); product flow and feed composition are roughly steady.
During commissioning the following observations and test data were recorded:
1. The RTD/transmitter shows +0.6 °C higher than a calibrated reference thermometer at 70.0 °C.
2. A step test on valve opening from 0.30 → 0.40 (Δu = 0.10) produced a delayed rise in product temperature with approximately first-order-plus-dead-time (FOPDT) behaviour: steady change ΔT∞ = +3.0 °C, apparent time constant τ = 120 s and dead time θ = 8 s.
3. The I/P response test shows outputs slightly nonlinear near the low end (3-5 psi) but approximately linear over most of the span.
4. Operators report: when the set point is 70.0 °C, temperature oscillates between 68.5 and 71.5 °C; when the set point is raised to 71.0 °C the rise is slow, and it sometimes overshoots by 1.2 °C on cooling when the set point is reduced.

4. Validation test and performance check: design a short validation test plan (3 steps) to confirm the loop meets ±0.5 °C stability around 70.0 °C after you apply your fixes/tuning. For each step state the purpose, action, expected result and what you will measure. (14 marks)', 'Step 1 - Instrument check. Purpose: confirm measurement and final element are correct. Action: compare the RTD/transmitter with the calibrated reference at 70 °C after calibration; stroke the valve 0-100% and small 1-2% steps around 35%. Expected: agreement within ±0.1-0.2 °C; valve moves smoothly with no stiction and linear response. Measure: temperature difference, valve position vs output, dead band.
Step 2 - Steady-state stability test. Purpose: verify ±0.5 °C at set point under normal load. Action: run in automatic at SP 70.0 °C for at least 30-60 min (several time constants) with normal flow. Expected: PV within 69.5-70.5 °C, no sustained oscillation. Measure: max/min deviation, standard deviation, valve output variation (trend recording).
Step 3 - Set-point and disturbance response. Purpose: check dynamic performance and robustness. Action: step SP 70 → 71 → 70 °C, and apply a disturbance (e.g. 10% change in product flow or steam pressure). Expected: settles within ±0.5 °C in a few minutes, overshoot <0.5 °C, no windup, quick recovery from disturbance. Measure: rise time, overshoot, settling time, IAE, maximum deviation. Document results and sign off.', null, '[{"point": "Step 1: sensor/valve check (calibration vs reference, valve stroke test) - purpose, action, expected, measure", "marks": 4}, {"point": "Step 2: steady-state stability at 70 °C for a period - measure deviation, valve movement", "marks": 5}, {"point": "Step 3: set-point step and disturbance test - overshoot, settling time, recovery", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 14,
    1512, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case1', 4, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 8.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator.

1. Draw a block diagram of the batch reactor process control system showing major inputs, outputs, sensors and actuators. (10 marks)', 'Diagram: a central PLC/DCS block (with HMI/operator station). Inputs on the left with arrows into the controller: Start pushbutton, E-Stop (hard-wired), RTD → temperature transmitter (4-20 mA), level sensor/switches, heater status contact, cooling valve position feedback. Outputs on the right with arrows from the controller to actuators: charging valve, heater contactor (on/off), cooling valve actuator, discharge valve, alarm horn/lamp. The reactor vessel is drawn in the middle with the charging line and valve at the top, heater and cooling jacket around it, RTD and level sensor in the vessel, and discharge valve at the bottom, each connected to the corresponding input/output.', null, '[{"point": "Central PLC/DCS controller block with HMI", "marks": 2}, {"point": "Inputs shown: Start, E-Stop, RTD (via transmitter), level sensor, heater status, cooling valve feedback", "marks": 3}, {"point": "Outputs/actuators: charging valve, heater, cooling valve, discharge valve, alarm", "marks": 3}, {"point": "Reactor with sensors and actuators connected, signal directions/arrows clear", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case2', 1, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator.

2. Write a high-level logic sequence for the batch process, explaining each step''s control action in the PLC/DCS program. (10 marks)', 'Step 0 Idle: check permissives - E-Stop released, all valves closed, heater off, RTD and level signals healthy; wait for Start.
Step 1 Charging: open charging valve; when level sensor reaches charge level, close it (alarm if not reached within a time limit).
Step 2 Heating: heater ON (temperature controller with set point 150 °C, cooling valve closed); when T ≥ 150 °C go to step 3; alarm if heating takes too long or overshoots a high limit.
Step 3 Reaction: hold 150 °C ±tolerance by switching/controlling the heater; start 2-hour timer; when done, go to step 4.
Step 4 Cooling: heater OFF, open cooling valve (confirm by position feedback); when T ≤ 50 °C, close cooling valve.
Step 5 Discharge: open discharge valve until level low/empty confirmed, then close it.
Step 6 Complete: increment batch counter, record batch data, reset sequence to Idle. Any fault or E-Stop sends the sequence to a safe hold state with alarm.', null, '[{"point": "Idle/permissives: E-Stop healthy, valves closed, sensors OK, Start pressed", "marks": 2}, {"point": "Charging: open charging valve until level high, close, confirm", "marks": 2}, {"point": "Heating to 150 °C (heater on, PID/on-off), transition at 150", "marks": 2}, {"point": "Reaction hold 2 h with temperature control; cooling to 50 °C via cooling valve, heater off", "marks": 2}, {"point": "Discharge until level low, close valve, batch complete, count, reset; alarms throughout", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case2', 2, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator.

3. Explain how you would implement safety interlocks in the PLC program to handle emergency stop and sensor failures. (10 marks)', 'E-Stop: wired as a normally-closed contact through a safety relay that directly de-energises the heater contactor and closes the charging/discharge valves independently of the PLC; the PLC also reads it, latches an emergency state, stops the sequence and sounds the alarm; restart only after the E-Stop is reset and the operator acknowledges. Sensor failures: monitor the RTD signal for open/short or out-of-range values (<3.6 mA or >21 mA, rate-of-change limits); compare output commands with feedback (heater status, cooling valve position) using discrepancy timers; check that the level changes as expected during charging/discharge. Actions on fault: fail-safe outputs - heater OFF, and if overtemperature, open cooling; hold the step; raise alarms; prevent moving to the next step until healthy. Add an independent high-high temperature switch that trips the heater, design outputs to fail safe on loss of power, and protect interlocks from bypass (password, logging).', null, '[{"point": "E-Stop: hard-wired, normally-closed, safety relay cuts heater and closes valves; PLC latches stop state, manual reset required", "marks": 3}, {"point": "Sensor failure detection: RTD open/short/out of range, 4-20 mA <3.6 or >21 mA, level sensor disagreement, valve feedback mismatch, heater status mismatch with timers", "marks": 4}, {"point": "Fail-safe actions: heater off, cooling on if overtemperature, hold sequence, alarm; high-temperature independent trip; bypass control/ permissives", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case2', 3, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator.

4. Describe how the PLC/DCS can use timers and counters to control the reaction hold time and the batch count. (10 marks)', 'Reaction hold time: when the reactor reaches 150 °C in step 3, enable a timer with preset 2 h (7200 s). A retentive timer (RTO) is best: it accumulates time only while the temperature is within the allowed band (e.g. 148-152 °C) and pauses (without resetting) if the temperature drops out, so the batch gets a full 2 hours at temperature; its done bit moves the sequence to cooling, then it is reset. Timers are also used as watchdogs for each step (e.g. alarm if charging or heating takes too long) and for delays (valve travel). Batch count: an up-counter (CTU) is incremented by a one-shot (rising edge) when step 6 ''batch complete'' is reached; its accumulated value shows batches produced, and a preset can stop production or request maintenance after a target number of batches; it is reset by the operator or at the shift/day change, and the value is logged to the HMI/historian.', null, '[{"point": "Hold time: retentive timer (RTO/TON) preset 2 h = 7200 s, enabled only when T within band; pause/hold behaviour on deviation", "marks": 5}, {"point": "Batch count: CTU incremented at end of each batch (rising edge), preset target, reset, stored for reports; step watchdog timers", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case2', 4, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Batch reactor sequence control
A chemical plant uses a batch reactor to produce a specialty polymer. The process involves the following steps controlled by a PLC/DCS system:
1. Charging: raw materials are charged into the reactor.
2. Heating: reactor temperature is raised from ambient to 150 °C.
3. Reaction: maintain temperature at 150 °C for 2 hours.
4. Cooling: cool the reactor down to 50 °C.
5. Discharge: product is discharged from the reactor.
The PLC/DCS program must manage the following inputs and outputs:
Inputs: Start pushbutton; Emergency stop (E-Stop); temperature sensor (RTD) feedback; level sensor for charging and discharge confirmation; heater status (on/off); cooling valve position feedback.
Outputs: charging valve control; heater on/off; cooling valve actuator; discharge valve control; alarm indicator.

5. Discuss the advantages of using a DCS over a PLC for this batch reactor process, and situations where a PLC might be preferred. (10 marks)', 'Advantages of a DCS: integrated engineering, operator HMI, alarm management and historian in one system; built-in batch management (ISA-88 recipes, phases, batch records and reports) suited to specialty polymer production; strong continuous/regulatory control with many PID loops and advanced control; high availability with redundant controllers, networks and I/O; easier plant-wide expansion and coordination of several reactors. A PLC may be preferred for a small, stand-alone reactor or packaged skid with mostly discrete on/off logic; when cost and budget are limited; when fast scan times for interlocks are needed; when local technicians are familiar with PLCs; or as part of a hybrid (PLC for equipment control, SCADA for supervision).', null, '[{"point": "DCS advantages: integrated HMI, historian, alarm management, built-in batch management (ISA-88), recipes, many PID loops, redundancy, plant-wide", "marks": 6}, {"point": "PLC preferred: small/stand-alone unit, fast discrete logic, lower cost, simpler maintenance, packaged equipment", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'instrumentation-and-control-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Instrumentation and Control Engineering): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Instrumentation and Control Engineering", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ice2025-case2', 5, null, null, (select id from public.specialisations where code = 'instrumentation-control-engineering'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
commit;
