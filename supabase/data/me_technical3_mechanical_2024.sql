-- ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'mechanical-engineering', 'Mechanical Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'mechanical-engineering') is null then raise exception 'unknown specialisation mechanical-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Topology optimization (printed as ''Typology'') in modern engineering design refers to:', null, 'Topology optimisation finds the best distribution of material within a design space for given loads and constraints.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Enhancing the visual aesthetics of a product', false, 1), ('B', 'Optimizing material distribution within a given design space', true, 2), ('C', 'Simplifying the design process for a product', false, 3), ('D', 'Reducing the number of components in a design', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The polar moment of inertia of a hollow shaft with inner and outer diameters di and do respectively is:', null, 'J = π(do⁴ - di⁴)/32 for a hollow circular shaft.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(π/32)(do⁴ - di⁴)', true, 1), ('B', '(π/32)(do² - di²)', false, 2), ('C', '(π/32)(do - di)', false, 3), ('D', '(π/32)(do³ - di³)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following production system has the ability to produce highly customized products with minimal lead times?', null, 'Agile manufacturing responds quickly to customised demand with short lead times.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Agile manufacturing system', true, 1), ('B', 'Mass production system', false, 2), ('C', 'Lean manufacturing system', false, 3), ('D', 'Batch production system', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A man falling down from a height “h” starts rotating mid-way of his fall. The vertical velocity with which he will touch the ground will be:', null, 'Rotation does not change the vertical motion of the centre of mass: v = √(2gh).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '> √(2gh)', false, 1), ('B', '= 0', false, 2), ('C', '= √(2gh)', true, 3), ('D', '< √(2gh)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The process of removing oxygen from metal ores is called:', null, 'Smelting reduces ore (removes oxygen) with heat and a reducing agent.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Tempering', false, 1), ('B', 'Smelting', true, 2), ('C', 'Galvanizing', false, 3), ('D', 'Annealing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The value of one bar (in SI units) is equal to:', null, '1 bar = 10⁵ N/m² (100 kPa).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '100 N/m2', false, 1), ('B', '1000 N/m2', false, 2), ('C', '1×104 N/m2', false, 3), ('D', '1×105 N/m2', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of inertia force to viscous force is referred to as:', null, 'Reynolds number = inertia force / viscous force.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Froude Number', false, 1), ('B', 'Reynolds Number', true, 2), ('C', 'Nusselt Number', false, 3), ('D', 'Prandtl Number', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'With increase in pressure,', null, 'The enthalpy of dry saturated steam rises with pressure up to about 30 bar, then falls.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'enthalpy of dry saturated steam remains same', false, 1), ('B', 'enthalpy of dry saturated steam increases', false, 2), ('C', 'enthalpy of dry saturated steam first increases and then decreases', true, 3), ('D', 'enthalpy of dry saturated steam decreases', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a belt drive is transmitting maximum power:', null, 'For maximum power, centrifugal tension Tc = T/3, so the tight-side driving tension T1 = T - Tc = 2Tc.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'effective tension is equal to the centrifugal tension', false, 1), ('B', 'effective tension is half of the centrifugal tension', false, 2), ('C', 'driving tension in slack side is equal to the centrifugal tension', false, 3), ('D', 'driving tension in tight side is twice the centrifugal tension', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following statements is correct?', null, 'Evaporative cooling lowers dry-bulb temperature while adding moisture: cooling and humidification.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Evaporative cooling and sensible cooling are the same', false, 1), ('B', 'Evaporative cooling is not effective for hot and dry climates', false, 2), ('C', 'Evaporative cooling is a cooling and dehumidification process', false, 3), ('D', 'Evaporative cooling is a cooling and humidification process', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In SI units, the value of the universal gas constant is', null, 'R = 8.314 J/(mol·K).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '831.4 J/mole/K', false, 1), ('B', '8314 J/mole/K.', false, 2), ('C', '8.314 J/mole/K', true, 3), ('D', '83.14 J/mole/K', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Programmable Logic Controller, the primary function of a ladder diagram is:', null, 'A ladder diagram represents the PLC control logic graphically, like relay circuits.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To control the physical layout of the system', false, 1), ('B', 'To represent electrical connections', false, 2), ('C', 'To provide a graphical representation of the control logic', true, 3), ('D', 'To document the hardware specification', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Force required to punch a hole of diameter d in a metal plate of thickness t is equal to ________, where τu = ultimate shear strength of the plate material.', null, 'Shear area = πdt, so F = π·d·t·τu.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'π·d·t·τu', true, 1), ('B', '(π/4)·d²·τu', false, 2), ('C', '(π/4)·d²·t·τu', false, 3), ('D', 'π²·d·t·τu', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a thermosetting plastic?', null, 'Bakelite is a thermosetting plastic; the others are thermoplastics.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Polystyrene', false, 1), ('B', 'Polyethylene', false, 2), ('C', 'Bakelite', true, 3), ('D', 'Polyvinyl chloride', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Computer-Aided Design, parametric modeling refers to ___________.', null, 'In parametric modelling, changing a dimension or parameter updates the model.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Modelling where dimensions can be changed and the model updates accordingly', true, 1), ('B', '2D modelling only', false, 2), ('C', 'Modelling without constraints', false, 3), ('D', 'Modelling based on fixed dimensions', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of sensor is most commonly used in automation for distance measurement?', null, 'Ultrasonic sensors measure distance from echo time.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ultrasonic sensor', true, 1), ('B', 'Pressure sensor', false, 2), ('C', 'Thermocouple', false, 3), ('D', 'Proximity sensor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term "cyber-physical systems" refers to?', null, 'Cyber-physical systems tightly integrate physical machines and electronics with networked software.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Robotic systems that operate without human intervention', false, 1), ('B', 'Systems where mechanical and electronic components are deeply integrated with networked software', true, 2), ('C', 'The use of AI in mechanical engineering', false, 3), ('D', 'The integration of software into physical machines', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In transverse fillet welded joint, the size of weld is equal to:', null, 'For a 45° fillet weld, throat = 0.707 x size, so size = √2 x throat.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '√(2 × Throat of weld)', false, 1), ('B', 'Throat of weld / √2', false, 2), ('C', '2 × Throat of weld', false, 3), ('D', '√2 × Throat of weld', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the role of an actuator in automation?', null, 'An actuator converts control (electrical) signals into mechanical motion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To control the flow of data', false, 1), ('B', 'To sense the environment', false, 2), ('C', 'To convert electrical signals into mechanical movement', true, 3), ('D', 'To process data', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A rivet is specified by', null, 'A rivet is specified by its shank diameter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'length of tail', false, 1), ('B', 'shank diameter', true, 2), ('C', 'type of head', false, 3), ('D', 'length of rivet', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following manufacturing processes is classified as a subtractive process?', null, 'Machining removes material, so it is subtractive.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3D Printing', false, 1), ('B', 'Forging', false, 2), ('C', 'Machining', true, 3), ('D', 'Casting', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a typical disc clutch, W = axial force with which the friction surfaces are held together, μ = coefficient of friction and R = mean radius of the friction surfaces. The torque developed by the clutch is given by:', null, 'With uniform wear, T = μ·W·R (per pair of friction surfaces), R being the mean radius.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'T = ½·μ·W·R', false, 1), ('B', 'T = μ·W·R', true, 2), ('C', 'T = ¾·μ·W·R', false, 3), ('D', 'T = ¼·μ·W·R', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which manufacturing technique involves the layer-by-layer addition of material to create a product?', null, 'Additive manufacturing (3D printing) builds parts layer by layer.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Subtractive machining', false, 1), ('B', 'Forging', false, 2), ('C', 'Casting', false, 3), ('D', 'Additive manufacturing', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The taper on cotter varies from:', null, 'The taper on a cotter is usually 1 in 48 to 1 in 24.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 in 32 to 1 in 24', false, 1), ('B', '1 in 24 to 1 in 20', false, 2), ('C', '1 in 15 to 1 in 10', false, 3), ('D', '1 in 48 to 1 in 24', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A flanged pipe joint will be leakproof if the circumferential pitch of the bolts is _______, where d is the diameter of the bolts.', null, 'For a leakproof flanged joint, the bolt pitch is kept between 20√d and 30√d.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'between 20√d and 30√d', true, 1), ('B', '> 30√d', false, 2), ('C', '> 20√d', false, 3), ('D', '< 20√d', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '________ are commonly used in the aerospace industry due to its high strength-to-weight ratio and resistance to fatigue?', null, 'Titanium alloys have high strength-to-weight ratio and fatigue resistance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Coppers', false, 1), ('B', 'Titanium alloys', true, 2), ('C', 'Polystyrenes', false, 3), ('D', 'Cast irons', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Following are the data relating to the screw jack shown: pitch of the threaded screw = 8 mm; diameter of the threaded screw = 40 mm; coefficient of friction between screw and nut = 0.1; load = 20 kN. Assuming that the load rotates with the screw, determine:

a) The ratio of the torques required to raise and lower the load. (3 marks)', 'a) Taking 40 mm as the mean diameter: tan α = p/(π d) = 8/(π x 40) = 0.0637; tan φ = μ = 0.1. Because the load rotates with the screw, there is no collar friction. Torque to raise: T1 = W tan(α + φ) d/2, with tan(α + φ) = (0.0637 + 0.1)/(1 - 0.0637 x 0.1) = 0.1647, so T1 = 20 000 x 0.1647 x 0.020 = 65.9 N·m. Torque to lower: T2 = W tan(φ - α) d/2, with tan(φ - α) = (0.1 - 0.0637)/(1 + 0.0637 x 0.1) = 0.0361, so T2 = 20 000 x 0.0361 x 0.020 = 14.4 N·m. Ratio T1/T2 = 0.1647/0.0361 ≈ 4.56.', null, '[{"point": "tan α = p/(πd) = 8/(π x 40) = 0.0637; μ = tan φ = 0.1; T raise = W tan(α + φ) d/2 = 65.9 N·m; T lower = W tan(φ - α) d/2 = 14.4 N·m (no collar friction as load rotates)", "marks": 2}, {"point": "Ratio = tan(α + φ)/tan(φ - α) = 0.1647/0.0361 ≈ 4.56", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s1', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), '/papers/me/tech3-mech-2024-screwjack.png')
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Following are the data relating to the screw jack shown: pitch of the threaded screw = 8 mm; diameter of the threaded screw = 40 mm; coefficient of friction between screw and nut = 0.1; load = 20 kN. Assuming that the load rotates with the screw, determine:

b) The efficiency of the machine. (2 marks)', 'b) Efficiency η = tan α/tan(α + φ) = 0.0637/0.1647 = 0.387, about 38.7% (less than 50%, so the screw is self-locking - φ > α).', null, '[{"point": "η = tan α/tan(α + φ) = 0.0637/0.1647 ≈ 38.7%", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s1', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), '/papers/me/tech3-mech-2024-screwjack.png')
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Answer the following:

a) What is meant by firing order in an internal combustion engine? (2 marks)', 'a) The firing order is the sequence in which the cylinders of a multi-cylinder engine fire (deliver their power strokes). It is chosen so that power impulses are evenly spaced, the engine is well balanced with less vibration, crankshaft and bearing loads are reduced, and heat is spread evenly for cooling.', null, '[{"point": "Firing order: sequence in which the cylinders deliver power strokes; chosen for balance, even torque, cooling, reduced vibration and crankshaft stress", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s2', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
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
  values ('ME', 'short_answer', 'Answer the following:

b) What firing orders are used in 4- and 6-cylinder inline engines? (3 marks)', 'b) 4-cylinder inline engines: 1-3-4-2 (most common) or 1-2-4-3. 6-cylinder inline engines: 1-5-3-6-2-4 (most common) or 1-4-2-6-3-5.', null, '[{"point": "4-cylinder inline: 1-3-4-2 (or 1-2-4-3); 6-cylinder inline: 1-5-3-6-2-4 (or 1-4-2-6-3-5)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s2', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
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
  values ('ME', 'short_answer', 'Answer the following:

a) Explain the two types of dry friction. (2.5 marks)', 'a) Dry (Coulomb) friction between unlubricated surfaces is of two types: static friction - the resisting force before motion starts, up to the limiting value F = μs N; and kinetic (dynamic) friction - the resisting force while surfaces slide, F = μk N, usually smaller than static friction (rolling friction, the resistance when a body rolls, is also often listed).', null, '[{"point": "Static friction (limiting friction before motion starts, μs) and kinetic/ dynamic friction (sliding friction during motion, μk < μs); also rolling friction as a form", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s3', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
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
  values ('ME', 'short_answer', 'Answer the following:

b) Explain two types of friction besides dry friction. (2.5 marks)', 'b) Besides dry friction: fluid (viscous) friction - when surfaces are completely separated by a lubricant film, resistance comes from the shearing of fluid layers, depending on viscosity and speed (as in hydrodynamic bearings); and boundary (greasy/ thin-film) friction - when only a very thin layer of lubricant is present, so asperities partly touch, giving friction between dry and fluid values.', null, '[{"point": "Fluid (viscous) friction - between layers of fluid/ lubricated surfaces fully separated; boundary (thin-film) friction - partial lubrication; or internal/ skin friction", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-s3', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
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
  values ('ME', 'short_answer', 'A welded platform top is made of 20 mm steel plates requiring 10 joints of 1 m length each, welded from one side only with semi-automatic submerged arc welding using a 4 SWG electrode. Labour charges are Nu 50 per hour. The electrode length required per metre run is 2.5 m and it costs Nu 25 per metre. Power consumption is 6.0 kWh per metre of weld at Nu 5 per kWh. The time to weld 1 m is 18 minutes. Assuming overhead charges of Nu 25 per hour, electrode loss of 5% due to spatter and vaporisation, and a fatigue allowance of 30% for the welder, calculate the cost of welding.', 'Total weld length = 10 joints x 1 m = 10 m. Time: 10 x 18 = 180 minutes = 3.0 h; with a 30% fatigue allowance, time = 3.0 x 1.30 = 3.9 h. Labour cost = 3.9 x 50 = Nu 195.00. Overhead = 3.9 x 25 = Nu 97.50. Electrode: 2.5 m per metre x 10 = 25 m needed in the weld; allowing 5% loss, electrode used = 25/0.95 = 26.32 m, cost = 26.32 x 25 = Nu 657.90. Power: 6.0 x 10 = 60 kWh x Nu 5 = Nu 300.00. Total cost of welding = 195.00 + 97.50 + 657.90 + 300.00 = Nu 1250.40 (about Nu 1249 if the loss is taken as 25 x 1.05 = 26.25 m).', null, '[{"point": "Time: 10 m x 18 min = 180 min = 3 h; with 30% fatigue allowance 3.9 h → labour 3.9 x 50 = Nu 195; overhead 3.9 x 25 = Nu 97.5", "marks": 2}, {"point": "Electrode: 10 x 2.5 = 25 m; with 5% loss 25/0.95 = 26.3 m x Nu 25 = Nu 658 (≈ Nu 656 if 25 x 1.05)", "marks": 1.5}, {"point": "Power: 6 x 10 = 60 kWh x Nu 5 = Nu 300; total ≈ Nu 1250", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
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
  values ('ME', 'passage', 'Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation.

i. Types of maintenance system. (10 marks)', '(1) Breakdown (corrective/ reactive) maintenance - equipment runs until it fails and is then repaired; low planning cost and suitable for cheap, non-critical items, but causes unplanned downtime, secondary damage and safety risks. (2) Preventive (scheduled) maintenance - inspection, lubrication, adjustment and part replacement at fixed time or usage intervals (e.g. every 500 hours); reduces breakdowns and extends life, but may replace parts too early and needs planning, spares and shutdown windows. (3) Predictive (condition-based) maintenance - condition monitoring (vibration analysis, oil analysis, thermography, ultrasonic, motor current) decides when to act; maximises component life and prevents failures, but needs instruments, data analysis skills and investment. (4) Proactive approaches - root-cause analysis and design-out maintenance eliminate repeated failures; opportunistic maintenance uses planned shutdowns. Challenges in implementing any system include management commitment, skilled manpower, reliable records (CMMS), spare parts availability and the cost of downtime for planned work.', null, '[{"point": "Breakdown/ corrective (run-to-failure)", "marks": 2}, {"point": "Preventive/ scheduled (time- or usage-based)", "marks": 2}, {"point": "Predictive/ condition-based (vibration, oil, thermography)", "marks": 2}, {"point": "Others: proactive/ RCM, opportunistic, design-out", "marks": 1}, {"point": "Benefits and challenges of each (cost, downtime, data/ skills, spares)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case1', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation.

ii. RCM (reliability-centred maintenance). (10 marks)', 'Reliability-centred maintenance is a structured process for deciding what must be done to ensure each physical asset continues to do what its users want in its present operating context. It asks seven questions (SAE JA1011): what are the functions and performance standards; how can the asset fail to fulfil them (functional failures); what causes each failure (failure modes); what happens when it fails (effects); in what way does each failure matter (safety, environmental, operational, non-operational consequences); what can be done to predict or prevent it (proactive tasks - condition-based, scheduled restoration or discard); and what if no suitable task exists (run-to-failure, failure-finding, redesign). It uses FMEA/FMECA and decision logic, focusing effort on critical equipment. Benefits: higher reliability and availability, better safety and environmental compliance, cost-effective maintenance (no unnecessary tasks), better knowledge of equipment. Challenges: time-consuming analysis, need for good failure data, trained cross-functional teams, management support and keeping the analysis updated.', null, '[{"point": "Definition: systematic process to decide the most effective maintenance for each asset based on its functions, failure modes and consequences (SAE JA1011)", "marks": 3}, {"point": "Process: functions and performance standards, functional failures, FMEA (failure modes, effects), consequences (safety, environment, operational), select tasks (predictive, preventive, run-to-failure, redesign)", "marks": 4}, {"point": "Benefits (reliability, safety, cost-effective task selection) and challenges (time, data, cross-functional team, training)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case1', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation.

iii. TPM (total productive maintenance). (10 marks)', 'Total productive maintenance (developed in Japan, Nakajima) involves everyone - from top management to operators - in maintaining equipment, aiming at zero breakdowns, zero defects and zero accidents and measuring success with overall equipment effectiveness (OEE = availability x performance rate x quality rate). Its foundation is 5S (sort, set in order, shine, standardise, sustain) and it has eight pillars: autonomous maintenance (operators do daily cleaning, inspection, lubrication and tightening), planned maintenance, focused improvement (kaizen on losses), quality maintenance, early equipment management, education and training, office (administrative) TPM, and safety, health and environment. Benefits: higher OEE and productivity, fewer breakdowns and defects, operators'' ownership and skills, safer, cleaner workplaces and lower costs. Challenges: needs a culture change and long-term management commitment, training time, overcoming the ''I operate, you fix'' mindset, and sustaining the programme beyond initial enthusiasm.', null, '[{"point": "TPM: Japanese approach involving all employees to maximise overall equipment effectiveness (OEE = availability x performance x quality); zero breakdowns, defects, accidents", "marks": 3}, {"point": "Eight pillars: autonomous maintenance (operators clean, inspect, lubricate), planned maintenance, focused improvement, quality maintenance, early equipment management, training, office TPM, safety/ health/ environment; 5S foundation", "marks": 4}, {"point": "Benefits (OEE, fewer breakdowns, ownership, quality) and challenges (culture change, time, training, sustaining)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case1', 3, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation.

iv. Kaizen. (10 marks)', 'Kaizen (Japanese for ''change for the better'') is a philosophy of continuous, small, incremental improvement involving everyone, from managers to shop-floor workers. It follows the Plan-Do-Check-Act cycle, focuses on the actual workplace (gemba), eliminates waste (muda) and standardises each improvement before the next. In maintenance it appears as operator suggestions to reduce minor stoppages, kaizen events to cut set-up and repair times (SMED), better lubrication points, visual controls, 5S housekeeping and simple tools that prevent recurring faults. Benefits: low-cost improvements, high employee participation and morale, cumulative gains in productivity, quality and safety, and a culture of problem solving. Challenges: results are gradual so support can fade; it needs management commitment, recognition of suggestions, time for teams, measurement of results and overcoming resistance to change.', null, '[{"point": "Kaizen: continuous, incremental improvement by everyone (Japanese ''change for better''); PDCA cycle, gemba, standardisation", "marks": 3}, {"point": "Application in maintenance: small improvements to reduce downtime, set-up times, waste (muda), 5S, suggestion schemes, kaizen events/ blitz", "marks": 4}, {"point": "Benefits (low cost, participation, cumulative gains, morale) and challenges (sustaining, management support, measuring, resistance)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case1', 4, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Maintenance management
Maintenance management is one of the key responsibilities of a mechanical engineer recruited in industries and plants. Describe what you understand about each of the following, and their likely benefits and challenges in implementation.

v. Application of big data and data analytics in maintenance management systems. (10 marks)', 'Modern plants generate large volumes of data from IoT sensors (vibration, temperature, pressure, flow, motor current), PLC/SCADA systems, computerised maintenance management systems (work orders, failure history), ERP (spares, costs) and operating logs. Big data platforms store and integrate these, and analytics turn them into decisions: real-time condition monitoring and alarms; predictive maintenance using machine-learning models that detect anomalies and estimate the remaining useful life of bearings, motors or pumps; digital twins to simulate equipment behaviour; root-cause and failure-pattern analysis across many machines; optimising maintenance schedules around production; forecasting spare-parts demand; and dashboards of KPIs such as MTBF, MTTR, availability and OEE. Benefits: fewer unplanned failures, longer equipment life, lower maintenance and inventory costs, better safety and data-driven decisions. Challenges: investment in sensors, connectivity and software; poor data quality and incompatible legacy systems; cybersecurity risks; and shortage of data-analytics and reliability skills, so implementation should start with critical assets and build capability step by step.', null, '[{"point": "Data sources: IoT sensors (vibration, temperature, pressure, current), SCADA/ PLC, CMMS work orders, ERP, operating logs", "marks": 2}, {"point": "Applications: condition monitoring, predictive maintenance with machine learning (remaining useful life, anomaly detection), digital twins, root-cause analysis, spare-parts forecasting, scheduling optimisation, KPIs (MTBF, MTTR, OEE)", "marks": 5}, {"point": "Benefits (fewer failures, lower cost, optimised spares) and challenges (sensor/ IT cost, data quality, integration, cybersecurity, skills)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case1', 5, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Machining and inventory management
(i) Machining removes material from the workpiece to produce a specific geometry at a definite degree of accuracy and surface quality; the process has evolved significantly over time. (ii) Inventory management keeps the right materials and spares available at the lowest total cost.

i. (a) Give a brief history of machining. (5 marks)
(b) Describe the principles of the various traditional machining processes, in particular machining by cutting and machining by abrasion and their types, with sketches. (10 marks)
(c) Describe the principles of the various non-traditional machining processes, in particular single-action non-traditional machining and hybrid machining processes and their types. (10 marks) (25 marks)', '(a) History: machining began with hand tools for shaping wood, stone and metal; bow lathes were used in ancient Egypt. The Industrial Revolution brought power-driven machine tools - John Wilkinson''s boring mill (1775) for steam-engine cylinders, Henry Maudslay''s screw-cutting lathe (about 1800), Eli Whitney''s milling machine and later grinding machines. High-speed steel (1900s), cemented carbide (1920s-30s) and ceramic and CBN tools increased cutting speeds. Numerical control (1950s) and CNC with CAD/CAM (1970s onwards) automated machining, and non-traditional processes (EDM, ECM, lasers) appeared from the 1940s for hard materials and complex shapes; today multi-axis CNC and hybrid machines are common.
(b) Traditional machining: (1) Machining by cutting - a tool with defined cutting edges, harder than the workpiece, moves relative to it and removes material as chips by shear deformation. Types: turning (single-point tool, rotating work, lathe - cylindrical surfaces), facing, boring, drilling (rotating twist drill making holes), milling (rotating multi-tooth cutter, flat and contoured surfaces), shaping and planing (reciprocating single-point tool, flat surfaces), broaching (multi-tooth broach for keyways), and sawing. (2) Machining by abrasion - hard abrasive grains (alumina, silicon carbide, diamond, CBN) with undefined cutting edges remove very small chips. Types: grinding (rotating bonded wheel - surface, cylindrical, centreless), honing (abrasive stones for bores), lapping (loose abrasive in a carrier), superfinishing and polishing; they give high accuracy and surface finish. [Sketches show the tool, workpiece and motions for turning, drilling, milling and grinding.]
(c) Non-traditional machining removes material without a conventional sharp tool, using mechanical, thermal, chemical or electrical energy. Single-action processes: mechanical - ultrasonic machining (USM: abrasive slurry hammered by a tool vibrating at about 20 kHz), abrasive jet machining (AJM) and water-jet/abrasive water-jet machining (WJM/AWJM); thermal - electrical discharge machining (EDM and wire EDM: sparks erode conductive material), laser beam (LBM), electron beam (EBM) and plasma arc machining (PAM); chemical and electrochemical - chemical machining/milling (CHM: etchant with masks) and electrochemical machining (ECM: anodic dissolution, reverse electroplating). Hybrid processes combine two actions to improve rate or finish: electrochemical grinding (ECG: abrasion plus electrochemical dissolution), electrical discharge grinding (EDG), ultrasonic-assisted EDM or turning, laser-assisted turning (laser softens hard material), and electrochemical discharge machining (ECDM) for glass and ceramics. They machine very hard, brittle or heat-resistant materials and complex shapes, without mechanical stress, but with lower removal rates and higher cost.', null, '[{"point": "(a) History: hand tools → water/ steam-powered lathes, boring mills (Wilkinson 1775), Maudslay screw-cutting lathe, milling machine (Whitney), grinding; HSS/ carbide tools; NC (1950s), CNC, CAD/CAM; non-traditional processes from 1940s", "marks": 5}, {"point": "(b) Cutting: tool harder than work, chip formation by shear; turning, drilling, milling, shaping/ planing, boring, broaching, sawing - sketches; abrasion: grinding, honing, lapping, superfinishing, polishing - abrasive grains remove small chips, high finish/ accuracy", "marks": 10}, {"point": "(c) Non-traditional: mechanical (USM, AJM, WJM/ AWJM), thermal (EDM, wire EDM, LBM, EBM, PAM), chemical/ electrochemical (CHM, ECM); hybrid: ECG, EDG, ultrasonic-assisted EDM/ turning, laser-assisted machining - combine actions for hard materials/ complex shapes", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case2', 1, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Machining and inventory management
(i) Machining removes material from the workpiece to produce a specific geometry at a definite degree of accuracy and surface quality; the process has evolved significantly over time. (ii) Inventory management keeps the right materials and spares available at the lowest total cost.

ii. Explain the following concepts in inventory management: VEN, ABC, VED, SDE and EOQ. (5 marks each) (25 marks)', 'VEN analysis classifies items (especially medicines and health supplies) as Vital (life-saving, must always be available), Essential (important for routine care) and Non-essential (useful but can be done without); budgets and stock priority go to vital and essential items.
ABC analysis classifies items by annual consumption value (Pareto principle): A items - about 10-20% of items accounting for about 70-80% of value, controlled tightly with frequent review, accurate forecasting and low stocks; B items - about 20-30% of items, 15-20% of value, moderate control; C items - about 50-70% of items but only 5-10% of value, simple control with bulk ordering.
VED analysis classifies spares and materials by criticality to production: Vital (shortage stops production - keep adequate stock), Essential (shortage causes loss but can be managed briefly) and Desirable (little effect). It is often combined with ABC in a matrix to set stock policies (e.g. vital-C items generously stocked).
SDE analysis classifies items by availability in the market: Scarce (imported, long lead time, rationed - long-term contracts, safety stock), Difficult (available with effort or delay) and Easy (readily available locally - minimal stock). It is useful in landlocked Bhutan where many spares are imported.
EOQ (economic order quantity) is the order size that minimises the total of ordering cost and inventory carrying cost: EOQ = √(2DS/H), where D = annual demand, S = cost per order and H = carrying cost per unit per year; for example D = 1200 units, S = Nu 500, H = Nu 30 gives EOQ = √(2 x 1200 x 500/30) = 200 units per order. It assumes constant demand, fixed lead time, constant costs and no shortages.', null, '[{"point": "VEN: Vital, Essential, Non-essential - criticality classification mainly for medicines/ health supplies; priority for vital", "marks": 5}, {"point": "ABC: by annual consumption value - A ~10-20% items ~70-80% value (tight control), B, C ~70% items ~5-10% value (simple control); Pareto", "marks": 5}, {"point": "VED: Vital, Essential, Desirable - criticality of spares to production; stock levels; combined ABC-VED matrix", "marks": 5}, {"point": "SDE: Scarce, Difficult, Easy - availability/ lead time in market; procurement strategy, safety stock", "marks": 5}, {"point": "EOQ: quantity minimising total ordering + carrying cost: EOQ = √(2DS/H); assumptions; example", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Mechanical Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-mech2024-case2', 2, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In which joining process is the filler metal melted above 450 °C, without melting the base metals?', null, 'Brazing uses a filler that melts above 450 °C but below the base metals'' melting point; soldering is below 450 °C.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Brazing', true, 1), ('B', 'Riveting', false, 2), ('C', 'Fusion welding', false, 3), ('D', 'Soldering', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a sand casting gating system, the vertical channel through which molten metal first flows down from the pouring basin is the', null, 'The sprue carries metal down from the pouring basin; runners distribute it horizontally to the gates.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vent', false, 1), ('B', 'Sprue', true, 2), ('C', 'Runner', false, 3), ('D', 'Riser', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a single-cylinder four-stroke engine, one power stroke occurs every', null, 'The four-stroke cycle takes two crankshaft revolutions, with one power stroke.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Four revolutions', false, 1), ('B', 'One revolution', false, 2), ('C', 'Half revolution', false, 3), ('D', 'Two revolutions', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Car radiators are typically which type of heat exchanger?', null, 'Radiators are compact cross-flow tube-and-fin exchangers: coolant in tubes, air across the fins.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'mechanical-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Mechanical Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'mechanical-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Compact cross-flow (tube-and-fin) heat exchanger', true, 1), ('B', 'Double pipe', false, 2), ('C', 'Regenerative storage type', false, 3), ('D', 'Shell and tube', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
