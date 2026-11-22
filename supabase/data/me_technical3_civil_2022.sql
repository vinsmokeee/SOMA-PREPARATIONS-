-- ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Zero hardness of water is achieved by', null, 'Ion exchange (zeolite/ resin) softening removes calcium and magnesium almost completely - zero hardness; lime-soda leaves 30-50 mg/L.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'excess lime treatment.', false, 1), ('B', 'using lime soda process.', false, 2), ('C', 'using excess alum dosage.', false, 3), ('D', 'ion exchange method.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For an area developed in haphazard way, the type of layout of water distribution system preferred is', null, 'Old towns that grew haphazardly, with irregular streets, are served by the dead-end (tree) system.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'dead end system.', true, 1), ('B', 'ring system.', false, 2), ('C', 'radial system.', false, 3), ('D', 'grid iron system.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is NOT a groundwater?', null, 'Rooftop rainwater stored in a tank is surface (rain) water, not groundwater; wells, infiltration galleries and springs draw groundwater.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'From riverside radial collector wells.', false, 1), ('B', 'Rooftop water stored in underground tank.', true, 2), ('C', 'From infiltration galleries.', false, 3), ('D', 'Water from natural springs.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cross staff is an instrument used for', null, 'A cross staff is used to set out right angles (offsets) in chain surveying.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'measuring approximate horizontal angles.', false, 1), ('B', 'None of the above.', false, 2), ('C', 'measuring bearings of the lines.', false, 3), ('D', 'setting out right angles.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In surveying principle "work from whole to part is recommended" since', null, 'Working from the whole to the part localises errors and prevents them from accumulating.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'there is no chance of omitting any required measurement.', false, 1), ('B', 'it is easy to use measurements for plotting.', false, 2), ('C', 'it leads to errorless maps.', false, 3), ('D', 'it localizes error.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For hilly region, the ideal method of contouring is', null, 'In hilly areas contours are located by the radial line method (radial lines from a central station, often with a tacheometer).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'method of squares.', false, 1), ('B', 'cross section method.', false, 2), ('C', 'radial line method.', true, 3), ('D', 'direct method.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To obtain good bonding in brick masonry', null, 'Good bond needs good bricks, vertical joints of alternate courses in plumb (no continuous vertical joints) and closers/ bats where needed to complete the bond.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above.', true, 1), ('B', 'bats are used where necessary.', false, 2), ('C', 'vertical joints in alternate courses are kept in plumb line.', false, 3), ('D', 'first class bricks are used.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The best irrigation method that suits area scarcity of irrigation water is', null, 'Drip irrigation delivers water to the root zone with 90 % or more efficiency - best where water is scarce.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'sprinkler irrigation.', false, 1), ('B', 'furrow irrigation.', false, 2), ('C', 'drip irrigation.', true, 3), ('D', 'check flooding.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Water logging is due to', null, 'Water logging results from over-irrigation, seepage, inadequate drainage and impervious layers that stop water percolating.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'inadequate drainage.', false, 1), ('B', 'All of the above.', true, 2), ('C', 'impervious obstruction.', false, 3), ('D', 'over irrigation.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cavity wall is generally provided for', null, 'The air gap of a cavity wall gives heat and sound insulation and prevents dampness passing to the inner leaf.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'heat insulation.', false, 1), ('B', 'sound insulation.', false, 2), ('C', 'prevention of dampness.', false, 3), ('D', 'All of the above.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Hydraulic jump is used for', null, 'A hydraulic jump dissipates the excess kinetic energy of supercritical flow (e.g. below spillways).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'reducing the energy of flow.', true, 1), ('B', 'reducing the velocity of flow.', false, 2), ('C', 'increasing the flow rate.', false, 3), ('D', 'reducing the flow rate.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most economical section for a compression member is', null, 'A hollow circular (tube) section has the largest radius of gyration for its area in all directions, so it is the most economical in compression.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'rectangular.', false, 1), ('B', 'hollow circular.', true, 2), ('C', 'i-shaped.', false, 3), ('D', 'circular.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is NOT a type of culvert?', null, 'Culverts are pipe, box, slab and arch culverts; ''through'' describes a bridge type (deck/ through), not a culvert.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pipe culvert', false, 1), ('B', 'Box culvert', false, 2), ('C', 'Through culvert', true, 3), ('D', 'Slab culvert', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Maximum bearing capacity of soil is that of', null, 'Of these, soft rock has the highest safe bearing capacity (about 440 kN/m² or more vs 100-450 for soils).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'soft rock.', true, 1), ('B', 'sand clay mixture.', false, 2), ('C', 'coarse sand.', false, 3), ('D', 'fine sand.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Fire resistance is highest in case of', null, 'Well-burnt brick masonry has the highest fire resistance; RCC spalls and loses strength, stone cracks, timber burns.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RCC works.', false, 1), ('B', 'brick masonry.', true, 2), ('C', 'stone masonry.', false, 3), ('D', 'timber structure.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A green building is the', null, 'A green building is designed, built and operated to reduce negative environmental impacts (energy, water, materials, waste).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'structure that aims to reduce negative environmental effects.', true, 1), ('B', 'All of the above.', false, 2), ('C', 'one with green colour.', false, 3), ('D', 'building surrounded with garden.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suitable foundation for steel column is __________________.', null, 'Heavy steel columns on soils of low bearing capacity are founded on grillage footings (layers of steel joists in concrete).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'combined footing', false, 1), ('B', 'strap footing', false, 2), ('C', 'mat foundation', false, 3), ('D', 'grillage footing', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'PVC pipes loosely fixed to walls', null, 'PVC has a large coefficient of thermal expansion, so pipes are clipped loosely to allow longitudinal expansion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'to allow longitudinal expansion.', true, 1), ('B', 'All of the above.', false, 2), ('C', 'to allow lateral expansion.', false, 3), ('D', 'since tight fitting may damage them.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Development of fine wire cracks in plastered surface is known as', null, 'Crazing is the development of a network of fine hair cracks on a plastered surface.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'flaking.', false, 1), ('B', 'crazing.', true, 2), ('C', 'cracking.', false, 3), ('D', 'blistering.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Roof in which slab is directly supported by column is known as', null, 'A flat slab is supported directly on columns (with or without drops and column heads), without beams.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'two way slab.', false, 1), ('B', 'grid floor.', false, 2), ('C', 'beam and slab floor.', false, 3), ('D', 'flat slab.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In cantilever retaining walls', null, 'The toe is pushed up by soil pressure (bends up, tension at bottom); the heel is loaded down by the soil above (bends down, tension at top).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'toe slab bends down and heel slab bends up.', false, 1), ('B', 'both toe and heel slabs bend up.', false, 2), ('C', 'toe slab bends up and heel slab bends down.', true, 3), ('D', 'both toe and heel slabs bend down.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'IS 456-2000 recommends that the unsupported length of any column should not exceed ________times the least lateral dimension of the column.', null, 'IS 456 cl 25.3.1: the unsupported length shall not exceed 60 times the least lateral dimension.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '40', false, 1), ('B', '60', true, 2), ('C', '70', false, 3), ('D', '20', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Advantage of pre-stressed concrete member over equivalent strength RCC member is', null, 'Prestressed concrete is crack-free (more durable), deflects less and uses smaller, lighter sections than equivalent RCC.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above.', true, 1), ('B', 'more durable.', false, 2), ('C', 'deformation is much less.', false, 3), ('D', 'dead weight is less.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For water retaining structures, minimum grade of concrete to be used is', null, 'IS 3370 (Part 2): 2009 requires at least M30 for reinforced concrete water-retaining structures (M25 for PCC; older editions allowed M20).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'M 35', false, 1), ('B', 'M 25', false, 2), ('C', 'M 30', true, 3), ('D', 'M 15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of voids to total volume of soil mass is called', null, 'Porosity n = volume of voids / total volume; void ratio e = Vv/Vs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'degree of saturation.', false, 1), ('B', 'void ratio.', false, 2), ('C', 'water content ratio.', false, 3), ('D', 'Porosity.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are the reasons for drying of water sources in Bhutan? Any solutions you can think of to address this issue?', 'Reasons:
1. Climate change - more erratic and reduced winter/ pre-monsoon rainfall, longer dry spells, higher temperatures and evaporation, so springs and streams that depend on rainfall recharge dry up in the lean season.
2. Changes in land use in the catchments - deforestation and forest fires reduce infiltration; road construction, hydropower and building works cut across aquifers and divert or block spring flow; landslides bury sources; overgrazing compacts soil.
3. Increasing demand and over-abstraction - growing towns and irrigation draw more than the sources can sustain.
4. Poor source protection and management - sources not fenced or protected, catchments not identified, intakes and pipelines not maintained, no monitoring.
Solutions:
1. Springshed and catchment management - map sources and their recharge areas (hydrogeology), declare them protected under the Water Act, plant native trees, fence and restrict construction and grazing.
2. Artificial recharge - contour trenches, percolation pits and ponds, check dams and gully plugs in the recharge zone.
3. Rainwater harvesting at household and institutional level, and storage reservoirs to carry water through the dry season.
4. Efficient use - reduce leakage and non-revenue water, metering and fair tariffs, efficient irrigation (drip/ sprinkler), reuse of grey water.
5. Governance and awareness - an inventory and regular monitoring of sources, integrated water resources management with community participation (water user groups), environmental assessment of roads and projects near sources, public awareness.', null, '[{"point": "Reasons: climate change - erratic/ reduced rainfall, shorter monsoon, warmer temperature, glacier retreat", "marks": 1}, {"point": "Land use - deforestation, forest fires, road cutting and construction disturbing aquifers/ spring catchments, landslides, overgrazing", "marks": 1}, {"point": "Over-extraction and poor management - growing demand, unprotected sources, no catchment protection, poor maintenance", "marks": 0.5}, {"point": "Solutions: protect and restore spring catchments (plantation, fencing, no-construction zones, community/ Water Act protection), springshed management with hydrogeology mapping", "marks": 1}, {"point": "Recharge: contour trenches, recharge pits/ ponds, check dams; rainwater harvesting; water storage reservoirs", "marks": 1}, {"point": "Efficient use and governance: reduce leakage (NRW), metering and tariffs, inventory and monitoring of sources, awareness, integrated water resources management", "marks": 0.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Given P1 = 200 N (vertical, downward at B) and P2 = 500 N (horizontal, at B), find the forces in each member of the truss shown in the figure (A hinged, C on rollers; B is 5 m above AC, 3 m from A and 4 m from C).', 'Geometry: A (0, 0), B (3, 5), C (7, 0) in metres. AB = √(3² + 5²) = 5.831 m; BC = √(4² + 5²) = 6.403 m.
Reactions (A hinge, C roller):
ΣMA = 0: Cy x 7 = P1 x 3 + P2 x 5 = 200 x 3 + 500 x 5 = 3100 → Cy = 442.86 N (upward).
ΣFy = 0: Ay = 200 - 442.86 = -242.86 N, i.e. 242.86 N acting downward at A.
ΣFx = 0: Ax = 500 N acting to the left.
Joint C (forces assumed tensile): vertical: 442.86 + FCB x 5/6.403 = 0 → FCB = -567.1 N (compression). Horizontal: -FCA - FCB x 4/6.403 = 0 → FCA = 567.1 x 0.6247 = 354.3 N (tension).
Joint A: vertical: -242.86 + FAB x 5/5.831 = 0 → FAB = 283.2 N (tension). Check horizontal: -500 + 283.2 x 3/5.831 + 354.3 = -500 + 145.7 + 354.3 = 0 ✓.
Answer: AB = 283.2 N tension, BC = 567.1 N compression, AC = 354.3 N tension.', null, '[{"point": "Reactions: ΣMA = 0: Cy x 7 = 200 x 3 + 500 x 5 → Cy = 442.9 N (up); Ay = 200 - 442.9 = -242.9 N (i.e. 242.9 N downward); Ax = 500 N (to the left)", "marks": 2}, {"point": "Joint C: FCB (5/√41) + 442.9 = 0 → FCB = -567.1 N (compression); FCA = 354.3 N (tension)", "marks": 1.5}, {"point": "Joint A: FAB (5/√34) = 242.9 → FAB = 283.2 N (tension); check ΣFx at A: -500 + 283.2 x 3/√34 + 354.3 = 0", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-truss1.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Find the force in member GI of the truss shown in the figure (span AL = 6 x 5 m = 30 m, rise at F = 5.33 m; 1 kN at B, D, F, H, J; 5 kN at C, E, G; reactions 12.50 kN at A and 7.50 kN at L).', 'Use the method of sections. Cut the truss through members FH (top chord), GH (diagonal) and GI (bottom chord), and take moments about H, where the other two cut members meet, so only FGI appears.
Geometry: the top chord rises uniformly from L (x = 30 m) to F (x = 15 m, height 5.33 m), so H at x = 20 m (10 m from L) is at height 5.33 x 10/15 = 3.553 m. GI lies along the bottom chord, so its lever arm about H is 3.553 m.
Right-hand part (joints H, I, J, K, L): forces are the reaction 7.50 kN at L (10 m to the right of H) and the 1 kN load at J (5 m to the right of H); the load at H has no moment.
ΣMH = 0: 7.50 x 10 - 1 x 5 - FGI x 3.553 = 0 → FGI = 70/3.553 = 19.70 kN.
FGI is positive when assumed pulling away from the cut, so GI is in tension: FGI ≈ 19.7 kN (tension).
Check with the left part: moment of the loads and reaction about H = 12.50 x 20 - 1 x (15 + 10 + 5) - 5 x (15 + 10 + 5) = 250 - 30 - 150 = 70 kNm, giving the same 19.7 kN.', null, '[{"point": "Method of sections: cut FH, GH and GI; take moments about H, where FH and GH meet", "marks": 1.5}, {"point": "Height of H = 5.33 x 10/15 = 3.553 m (top chord slope), H is 20 m from A (10 m from L)", "marks": 1}, {"point": "Right part: ΣMH = 0: 7.5 x 10 - 1 x 5 - FGI x 3.553 = 0", "marks": 1.5}, {"point": "FGI = 70/3.553 = 19.7 kN (tension); check with left part: 12.5 x 20 - [1(15 + 10 + 5) + 5(15 + 10 + 5)] = 70 kNm", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-truss2.png')
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Determine the cross-sectional area and the values x̄ and ȳ to locate the position of the centroid for the section shown in the figure (flange 2400 x 150 mm on top of a 100 mm thick, 3600 mm deep web). Take the origin at the bottom left-hand corner of the section.', 'Divide the T-section into two rectangles (origin at the bottom left-hand corner of the section''s bounding box, i.e. level with the bottom of the web and the left end of the flange):
1. Web: 100 x 3600 = 360 000 mm², centroid at x = 1200 mm, y = 3600/2 = 1800 mm.
2. Flange: 2400 x 150 = 360 000 mm², centroid at x = 1200 mm, y = 3600 + 150/2 = 3675 mm.
Total area A = 720 000 mm² = 0.72 m².
x̄ = (360 000 x 1200 + 360 000 x 1200)/720 000 = 1200 mm (the section is symmetric about the centre line of the web).
ȳ = (360 000 x 1800 + 360 000 x 3675)/720 000 = (648.0 x 10⁶ + 1323.0 x 10⁶)/720 000 = 2737.5 mm from the bottom (i.e. 1012.5 mm below the top of the flange).', null, '[{"point": "Areas: flange 2400 x 150 = 360 000 mm²; web 100 x 3600 = 360 000 mm²; total A = 720 000 mm² (0.72 m²)", "marks": 1.5}, {"point": "x̄: section symmetric about the vertical axis of the web (web centred under the flange) → x̄ = 2400/2 = 1200 mm", "marks": 1.5}, {"point": "ȳ = (360 000 x 1800 + 360 000 x (3600 + 75))/720 000 = (648 + 1323) x 10⁶/720 000 = 2737.5 mm from the bottom", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-tsection.png')
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Overhanging beam - shear force and bending moment
Determine the values and draw the diagrams for shear force and bending moment due to the imposed load on the overhanging beam shown in the figure, and find the position of the points of contraflexure, if any.
Beam A-G (all distances in mm): AB = 7000, BC = 4000, CD = 7000, DE = 4000, EF = 4000, FG = 6000. Supports at B and F. Loads: 1 kN at A (free end), uniformly distributed load 5 kN/m on CD, 4 kN at E, 2 kN at G (free end).

1. Find the support reactions VB and VF. (10 marks)', 'Positions from A (m): B = 7, C = 11, D = 18, E = 22, F = 26, G = 32. UDL on CD = 5 x 7 = 35 kN acting at 14.5 m (7.5 m right of B). Total load = 1 + 35 + 4 + 2 = 42 kN.
ΣMB = 0 (clockwise positive): -1 x 7 + 35 x 7.5 + 4 x 15 + 2 x 25 - VF x 19 = 0 → -7 + 262.5 + 60 + 50 = 365.5 = 19 VF → VF = 19.24 kN.
ΣFy = 0: VB = 42 - 19.24 = 22.76 kN.
Check, ΣMF = 0 (the 1 kN at A, the UDL and the 4 kN at E are left of F; the 2 kN at G is right of F): VB x 19 = 1 x 26 + 35 x 11.5 + 4 x 4 - 2 x 6 = 26 + 402.5 + 16 - 12 = 432.5 → VB = 22.76 kN ✓.
VB = 22.76 kN (upward), VF = 19.24 kN (upward).', null, '[{"point": "Total load = 1 + 5 x 7 + 4 + 2 = 42 kN; UDL resultant 35 kN at 14.5 m from A", "marks": 2}, {"point": "ΣMB = 0 (B at 7 m, F at 26 m): VF x 19 = -1 x 7 + 35 x 7.5 + 4 x 15 + 2 x 25 → VF = 365.5/19 = 19.24 kN", "marks": 4}, {"point": "VB = 42 - 19.24 = 22.76 kN; check by ΣMF = 0", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-beam.png')
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Overhanging beam - shear force and bending moment
Determine the values and draw the diagrams for shear force and bending moment due to the imposed load on the overhanging beam shown in the figure, and find the position of the points of contraflexure, if any.
Beam A-G (all distances in mm): AB = 7000, BC = 4000, CD = 7000, DE = 4000, EF = 4000, FG = 6000. Supports at B and F. Loads: 1 kN at A (free end), uniformly distributed load 5 kN/m on CD, 4 kN at E, 2 kN at G (free end).

2. Draw the shear force diagram. (15 marks)', 'Shear force (taking upward forces on the left part as positive):
A to B: V = -1 kN (from the 1 kN load at A).
At B the reaction 22.76 kN: V = -1 + 22.76 = +21.76 kN, constant from B to C.
C to D (UDL 5 kN/m): V decreases linearly from +21.76 kN to 21.76 - 35 = -13.24 kN at D; V = 0 at 21.76/5 = 4.35 m from C, i.e. x = 15.35 m from A (maximum BM there).
D to E: V = -13.24 kN.
At E (4 kN): V = -17.24 kN from E to F.
At F (reaction 19.24 kN): V = -17.24 + 19.24 = +2.0 kN from F to G.
At G the 2 kN load brings V back to 0 ✓.
SFD: a small negative rectangle (-1) over AB; a positive rectangle (+21.76) over BC; a sloping straight line over CD crossing zero at 15.35 m; negative rectangles -13.24 (DE) and -17.24 (EF); a positive rectangle +2 over FG.', null, '[{"point": "A to B: V = -1 kN", "marks": 2}, {"point": "Just right of B: -1 + 22.76 = +21.76 kN, constant to C", "marks": 3}, {"point": "C to D: falls at 5 kN/m from +21.76 to 21.76 - 35 = -13.24 kN; zero at 21.76/5 = 4.35 m from C (x = 15.35 m)", "marks": 4}, {"point": "D to E: -13.24 kN; E to F: -17.24 kN; F to G: -17.24 + 19.24 = +2 kN; closes to 0 at G", "marks": 4}, {"point": "Diagram drawn with values, steps at point loads/ supports and sloping line under UDL", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-beam.png')
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Overhanging beam - shear force and bending moment
Determine the values and draw the diagrams for shear force and bending moment due to the imposed load on the overhanging beam shown in the figure, and find the position of the points of contraflexure, if any.
Beam A-G (all distances in mm): AB = 7000, BC = 4000, CD = 7000, DE = 4000, EF = 4000, FG = 6000. Supports at B and F. Loads: 1 kN at A (free end), uniformly distributed load 5 kN/m on CD, 4 kN at E, 2 kN at G (free end).

3. Draw the bending moment diagram. (15 marks)', 'Bending moments (sagging positive), x from A:
MA = 0.
MB = -1 x 7 = -7.0 kNm (hogging).
MC = -1 x 11 + 22.76 x 4 = 80.05 kNm.
Maximum (where V = 0, x = 15.35 m): M = 80.05 + 21.76 x 4.353 - 5 x 4.353²/2 = 80.05 + 94.73 - 47.37 = 127.4 kNm (sagging) - the maximum bending moment.
MD (x = 18): -1 x 18 + 22.76 x 11 - 35 x 3.5 = 109.9 kNm.
ME (x = 22): 109.9 - 13.24 x 4 = 56.9 kNm.
MF (x = 26): from the right, -2 x 6 = -12.0 kNm (hogging).
MG = 0.
BMD: straight line from 0 at A to -7 at B, rising linearly to +80.05 at C, parabolic curve over CD peaking at +127.4 kNm (x = 15.35 m) and falling to +109.9 at D, straight lines to +56.9 at E and -12.0 at F, then back to 0 at G. Hogging moments occur over both supports (the overhangs).', null, '[{"point": "MA = 0; MB = -1 x 7 = -7 kNm (hogging)", "marks": 3}, {"point": "MC = -1 x 11 + 22.76 x 4 = +80.05 kNm", "marks": 3}, {"point": "Maximum at x = 15.35 m: M = 80.05 + 21.76 x 4.35 - 5 x 4.35²/2 = +127.4 kNm (sagging)", "marks": 3}, {"point": "MD = +109.9 kNm; ME = +56.9 kNm; MF = -2 x 6 = -12 kNm (hogging); MG = 0", "marks": 4}, {"point": "Shape: straight lines A-B-C, parabola C-D, straight lines D-E-F-G", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-beam.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Overhanging beam - shear force and bending moment
Determine the values and draw the diagrams for shear force and bending moment due to the imposed load on the overhanging beam shown in the figure, and find the position of the points of contraflexure, if any.
Beam A-G (all distances in mm): AB = 7000, BC = 4000, CD = 7000, DE = 4000, EF = 4000, FG = 6000. Supports at B and F. Loads: 1 kN at A (free end), uniformly distributed load 5 kN/m on CD, 4 kN at E, 2 kN at G (free end).

4. Find the points of contraflexure between BC and between EF. (10 marks)', 'A point of contraflexure is where the bending moment changes sign.
Between B and C (7 ≤ x ≤ 11): M = -1 x x + 22.76 (x - 7) = 21.76 x - 159.3 = 0 → x = 7.32 m from A, i.e. about 0.32 m to the right of support B.
Between E and F (22 ≤ x ≤ 26): M = ME - 17.24 (x - 22) = 56.95 - 17.24 (x - 22) = 0 → x - 22 = 3.30 m → x = 25.30 m from A, i.e. 3.30 m right of E (about 0.70 m left of support F).
So there are two points of contraflexure: 0.32 m right of B and 0.70 m left of F.', null, '[{"point": "Between B and C: M = -1(x) + 22.76(x - 7) = 0 → x = 7.32 m from A, i.e. 0.32 m right of B", "marks": 5}, {"point": "Between E and F: M = 56.9 - 17.24(x - 22) = 0 → x = 25.30 m, i.e. 3.30 m right of E (0.70 m left of F)", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case1', 4, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-beam.png')
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Analysis of a fixed-base portal frame
Determine the values and draw the bending moment diagram for the portal frame ABCD shown in the figure. Columns AB and DC are 4000 mm high with fixed bases at A and D; beam BC is 8000 mm long and carries a vertical point load of 80 kN at 5000 mm from B (3000 mm from C). All members have the same moment of inertia I (EI constant). All dimensions in mm.

1. Analyse the portal frame (find the end moments). (20 marks)', 'Fixed-end moments (clockwise positive) for beam BC (L = 8 m, a = 5 m from B, b = 3 m):
MFBC = -W a b²/L² = -80 x 5 x 9/64 = -56.25 kNm; MFCB = +W a² b/L² = +80 x 25 x 3/64 = +93.75 kNm. Columns carry no span load: MF = 0.
Because the load is not central, the frame sways. Using slope-deflection with unknowns θB, θC and sway Δ (columns L = 4 m, beam L = 8 m, EI constant):
MAB = (2EI/4)(θB - 3Δ/4); MBA = (2EI/4)(2θB - 3Δ/4); MBC = -56.25 + (2EI/8)(2θB + θC); MCB = 93.75 + (2EI/8)(2θC + θB); MCD = (2EI/4)(2θC - 3Δ/4); MDC = (2EI/4)(θC - 3Δ/4).
Conditions: MBA + MBC = 0; MCB + MCD = 0; shear condition (MAB + MBA)/4 + (MCD + MDC)/4 = 0 (no horizontal load).
Solving: EIθB = 41.25, EIθC = -78.75 (clockwise positive) and EIΔ = 37.5, the frame swaying towards A (to the left).
Final end moments (magnitudes): MA = 34.69 kNm, MB = 55.31 kNm, MC = 64.69 kNm, MD = 25.31 kNm.
Horizontal reactions: H = (MA + MB)/4 = (34.69 + 55.31)/4 = 22.5 kN at A and (64.69 + 25.31)/4 = 22.5 kN at D, equal and opposite (acting inwards).
(The same result is obtained by moment distribution: distribution factors at B and C are 2/3 to the column and 1/3 to the beam, carry-over 1/2, non-sway analysis plus a sway correction.)', null, '[{"point": "Fixed-end moments for BC: MFBC = -Wab²/L² = -80 x 5 x 3²/8² = -56.25 kNm; MFCB = +Wa²b/L² = +80 x 5² x 3/8² = +93.75 kNm; columns 0", "marks": 4}, {"point": "Unsymmetric load → sway; method: slope-deflection (unknowns θB, θC, Δ) or moment distribution with a sway correction; stiffness: columns 4EI/4 = EI, beam 4EI/8 = 0.5EI (DF at B and C: column 2/3, beam 1/3)", "marks": 5}, {"point": "Equations: joint B, joint C equilibrium and shear (sway) condition (MAB + MBA)/4 + (MCD + MDC)/4 = 0", "marks": 5}, {"point": "Results: MA = 34.7 kNm, MB = 55.3 kNm, MC = 64.7 kNm, MD = 25.3 kNm (magnitudes); horizontal reactions 22.5 kN each, inward; frame sways towards A (Δ = 37.5/EI)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-frame.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Analysis of a fixed-base portal frame
Determine the values and draw the bending moment diagram for the portal frame ABCD shown in the figure. Columns AB and DC are 4000 mm high with fixed bases at A and D; beam BC is 8000 mm long and carries a vertical point load of 80 kN at 5000 mm from B (3000 mm from C). All members have the same moment of inertia I (EI constant). All dimensions in mm.

2. Find the vertical reactions VA and VD. (15 marks)', 'Take beam BC as a free body. The end moments are hogging: MB = 55.31 kNm and MC = 64.69 kNm.
ΣMB = 0: VC x 8 = 80 x 5 + 64.69 - 55.31 = 409.38 → VC = 51.17 kN.
VB = 80 - 51.17 = 28.83 kN.
The vertical forces pass down the columns, so VA = 28.83 kN and VD = 51.17 kN (both upward); ΣV = 80 kN ✓.
(Simple-beam reactions would be 80 x 3/8 = 30 kN and 80 x 5/8 = 50 kN; the unequal end moments shift (64.69 - 55.31)/8 = 1.17 kN towards D.)
Other reactions: HA = HD = 22.5 kN (inwards); MA = 34.69 kNm, MD = 25.31 kNm.', null, '[{"point": "Beam BC as a free body with end moments MB = 55.31 (hogging) and MC = 64.69 (hogging)", "marks": 4}, {"point": "ΣMB = 0: VC x 8 = 80 x 5 + 64.69 - 55.31 → VC = 51.17 kN = VD", "marks": 5}, {"point": "VB = 80 - 51.17 = 28.83 kN = VA; check simple-beam reactions 30/50 kN corrected by (MC - MB)/L = 1.17 kN", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-frame.png')
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Analysis of a fixed-base portal frame
Determine the values and draw the bending moment diagram for the portal frame ABCD shown in the figure. Columns AB and DC are 4000 mm high with fixed bases at A and D; beam BC is 8000 mm long and carries a vertical point load of 80 kN at 5000 mm from B (3000 mm from C). All members have the same moment of inertia I (EI constant). All dimensions in mm.

3. Draw the bending moment diagram. (15 marks)', 'Beam BC: the end moments are hogging, 55.31 kNm at B and 64.69 kNm at C. The free bending moment of a simply supported span under the 80 kN load is W a b/L = 80 x 5 x 3/8 = 150 kNm. Net sagging moment under the load = 150 - (55.31 x 3/8 + 64.69 x 5/8) = 150 - 61.17 = 88.8 kNm (check: -55.31 + 28.83 x 5 = 88.8 kNm).
Points of contraflexure in the beam: from B, M = -55.31 + 28.83 x = 0 → x = 1.92 m; from C, M = -64.69 + 51.17 x = 0 → x = 1.26 m (both lie between the knees and the load).
Columns (no lateral load, so the BM varies linearly): AB - 34.69 kNm at A and 55.31 kNm at B on opposite faces, zero at 4 x 34.69/90 = 1.54 m above A; DC - 25.31 kNm at D and 64.69 kNm at C, zero at 4 x 25.31/90 = 1.13 m above D.
BMD: draw on the frame - straight lines on both columns crossing zero at the contraflexure points, hogging peaks at the knees B (55.3) and C (64.7), and a triangular sagging peak of 88.8 kNm under the load.', null, '[{"point": "Beam: hogging 55.31 at B and 64.69 at C; free (simply supported) moment under load 80 x 5 x 3/8 = 150 kNm", "marks": 4}, {"point": "Net sagging under the load: 150 - (55.31 x 3/8 + 64.69 x 5/8) = 88.8 kNm (check: -55.31 + 28.83 x 5 = 88.8)", "marks": 4}, {"point": "Columns: linear; AB from 34.69 at A to 55.31 at B, changing sign (contraflexure 1.54 m above A); DC from 25.31 at D to 64.69 at C (contraflexure 1.13 m above D)", "marks": 4}, {"point": "Sketch drawn on the frame with values and points of contraflexure in beam (≈1.92 m from B and ≈1.26 m from C)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper III, Civil Engineering", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2022-case2', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2022-frame.png')
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, a compression member is treated as a short column when the ratio of its effective length to its least lateral dimension is less than', null, 'IS 456 cl 25.1.2: short column if lex/D and ley/b are both less than 12; otherwise slender.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '20', false, 1), ('B', '12', true, 2), ('C', '15', false, 3), ('D', '8', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the minimum area of longitudinal reinforcement in an RCC column is', null, 'IS 456 cl 26.5.3.1: longitudinal steel in a column is 0.8 % to 6 % of the gross area (4 % practical maximum).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.8 percent of the gross area', true, 1), ('B', '4.0 percent of the gross area', false, 2), ('C', '0.4 percent of the gross area', false, 3), ('D', '1.0 percent of the gross area', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the standard Proctor (light compaction) test as per IS 2720 (Part 7), the rammer has a mass of', null, 'Light compaction: 2.6 kg rammer, 310 mm drop, 3 layers x 25 blows (heavy compaction: 4.9 kg, 450 mm, 5 layers).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10 kg', false, 1), ('B', '2.6 kg', true, 2), ('C', '6.5 kg', false, 3), ('D', '4.9 kg', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Le Chatelier apparatus is used to test cement for', null, 'Le Chatelier expansion (and the autoclave test) measure soundness; Vicat apparatus is for consistency and setting time.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'setting time', false, 1), ('B', 'standard consistency', false, 2), ('C', 'soundness', true, 3), ('D', 'fineness', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the final deflection of a beam or slab due to all loads, including temperature, creep and shrinkage, should not normally exceed', null, 'IS 456 cl 23.2 (a): final deflection ≤ span/250; deflection after partitions/ finishes ≤ span/350 or 20 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2022, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'span/150', false, 1), ('B', 'span/350', false, 2), ('C', 'span/250', true, 3), ('D', 'span/500', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
commit;
