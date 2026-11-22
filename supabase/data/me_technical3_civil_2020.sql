-- ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a particular grade of concrete, with lowering of the grade of steel, the limiting percentage of tension reinforcement pt,lim (for a singly reinforced section)', null, 'pt,lim = 0.36 (xu,max/d) fck/(0.87 fy) x 100: a lower fy gives a larger xu,max/d and a smaller denominator, so pt,lim increases (for M25: Fe 250 ≈ 2.19 %, Fe 415 ≈ 1.20 %, Fe 500 ≈ 0.95 %).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'sometime increases and sometime decreases.', false, 1), ('B', 'decreases.', false, 2), ('C', 'remains constant.', false, 3), ('D', 'increases.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The cross-section of a thermo-mechanically treated (TMT) reinforcing bars has', null, 'Quenching and self-tempering give TMT bars a tough, ductile ferrite-pearlite core with a hard tempered-martensite rim.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'soft ferrite-pearlite throughout.', false, 1), ('B', 'hard martensite throughout.', false, 2), ('C', 'a soft ferrite-pearlite core with hard martensite rim.', true, 3), ('D', 'a hard martensite core with a soft pearlite-bainitic rim.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Closed contours of decreasing values towards their centre represent', null, 'Closed contours with values decreasing towards the centre represent a depression (increasing towards the centre - a hill).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a river bed.', false, 1), ('B', 'a depression.', true, 2), ('C', 'a saddle or pass.', false, 3), ('D', 'a hill.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The layer at the centre of gravity of the beam shown in the figure (equal and opposite moments M at the two ends) will be', null, 'Under pure bending the centroidal layer is the neutral axis: no bending stress (neither tension nor compression).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m6.png')
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'in tension.', false, 1), ('B', 'None of the above.', false, 2), ('C', 'neither in tension nor in compression.', true, 3), ('D', 'in compression.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a simply supported beam carrying a uniformly distributed load w per unit length, the point of contraflexure', null, 'In a simply supported beam under UDL the bending moment is sagging everywhere - there is no point of contraflexure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'does not exist.', true, 1), ('B', 'depends upon the length of beam.', false, 2), ('C', 'lies in the centre of the beam.', false, 3), ('D', 'lies at the ends of the beam.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The total length of a valley formed by two gradients - 3% and + 2% curve between the two tangent points to provide a rate of change of centrifugal acceleration 0.6 m/sec2, for a design speed 100 kmph, is', null, 'L = 2√(NV³/C) with N = 0.03 + 0.02 = 0.05, V = 100/3.6 = 27.78 m/s, C = 0.6 m/s³: L = 2√(0.05 x 21 433/0.6) = 84.5 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '84.6 m', true, 1), ('B', '16.0 m', false, 2), ('C', 'None of the above.', false, 3), ('D', '42.3 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The critical depth (h) of flow in a rectangular channel, in terms of the critical velocity v, is', null, 'At critical flow in a rectangular channel the Froude number is 1: v = √(gh), so h = v²/g (specific energy = 1.5 h).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'h = v/g', false, 1), ('B', 'h = v²/g', true, 2), ('C', 'h = v/2g', false, 3), ('D', 'h = v²/2g', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The rate of rainfall for successive 10 minute periods of a 60 minute duration storm is shown in the figure (as cm/hour for each 10-minute period). If the value of the φ-index is 3 cm/hour, the runoff will be', null, 'Runoff = Σ(i - φ) x Δt for i > φ: (6 - 3) + (10 - 3) + (8 - 3) + (7 - 3) = 19 cm/h x 1/6 h = 3.17 cm ≈ 3 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m13.png')
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3 cm', true, 1), ('B', '4 cm', false, 2), ('C', '5 cm', false, 3), ('D', '2 cm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If there are m unknown member forces, r unknown reaction components and j number of joints, then the degree of static indeterminacy of a pin-jointed plane frame is given by', null, 'Pin-jointed plane frame: Ds = (m + r) - 2j.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'm + r + 2j', false, 1), ('B', 'm + r - 2j', true, 2), ('C', 'm - r + 2j', false, 3), ('D', 'm + r - 3j', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main reason for providing number of reinforcing bars at a support in a simply supported beam is to resist', null, 'At simple supports the tension bars must be anchored: IS 456 cl 26.2.3.3 limits bar size by Ld ≤ 1.3M1/V + L0, so more (smaller) bars are provided to satisfy bond/ development length.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Shear stress', false, 1), ('B', 'Bond stress', true, 2), ('C', 'Tensile stress', false, 3), ('D', 'Compressive stress', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The stress-strain curve of the concrete as per IS: 456 is', null, 'IS 456 Fig. 21: parabolic up to a strain of 0.002, then constant stress (0.446 fck design) up to 0.0035.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'linear up to 0.002 strain value and uniform up to failure.', false, 1), ('B', 'straight line up to 0.002 strain value and then parabolic up to failure.', false, 2), ('C', 'parabolic up to 0.002 strain value and then uniform up to failure.', true, 3), ('D', 'a perfect straight line up to failure.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The exact equation for super-elevation (θ = angle of super-elevation, f = coefficient of lateral friction) is', null, 'Resolving forces on a banked curve with friction: V²/gR = (tanθ + f)/(1 - f tanθ); the approximate form is e + f = V²/gR.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'V²/gR = (1 - f tanθ)/(f + tanθ)', false, 1), ('B', 'V²/gR = (f - tanθ)/(1 + f tanθ)', false, 2), ('C', 'V²/gR = (f + tanθ)/(1 - f tanθ)', true, 3), ('D', 'V²/gR = (1 + f tanθ)/(f - tanθ)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In selecting a rolled I-section for a simply supported beam, along with minimum sectional modulus, a minimum value of span/depth ratio is also ensured. This is stipulated to ensure that', null, 'A maximum span/depth ratio (i.e. a minimum depth) is specified to keep deflections within permissible limits.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the bending stress in compression is within permissible limits.', false, 1), ('B', 'the shear stress in beam remains within permissible limits.', false, 2), ('C', 'the buckling of beam does not take place.', false, 3), ('D', 'the deflection of beam remains within permissible limits.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two beams, one having square cross-section and other circular cross-section are subjected to the same amount of bending moment. If the cross-sectional area as well as the material of both the beams are same, then', null, 'For equal areas the circle has the smaller section modulus (0.141A^1.5 vs 0.167A^1.5 for the square), so it develops the higher bending stress.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the circular beam will experience more bending stress than the square one.', true, 1), ('B', 'the square beam experiences more bending stress than the circular one.', false, 2), ('C', 'maximum bending stress developed in both the beams is the same.', false, 3), ('D', 'both the beams will experience the same deformation as the material is the same.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A pipe is replaced by two parallel pipes, each with the half the cross-sectional area of the original pipe. The discharge will', null, 'For the same head loss Q ∝ D^2.5. Each new pipe has D/√2: 2 x (1/√2)^2.5 = 0.84 - the discharge falls by about 16 %.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'change by less than 5%.', false, 1), ('B', 'decrease by more than 10%.', true, 2), ('C', 'remain the same.', false, 3), ('D', 'increase by more than 10%.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the propped cantilever beam (fixed at A, propped at B) carrying a uniformly distributed load of w per unit length shown in the figure, the reaction at the support B is', null, 'Propped cantilever with UDL: prop reaction RB = 3wL/8 (fixed end 5wL/8, fixing moment wL²/8).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m24.png')
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(5/8) wL', false, 1), ('B', '(3/4) wL', false, 2), ('C', '(1/2) wL', false, 3), ('D', '(3/8) wL', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The circular water pipes shown in the sketch are flowing full: pipe P (diameter 4 m) carries 6 m/s into the junction, pipe Q (diameter 4 m) carries 5 m/s out of it. The velocity of flow (in m/s) in the branch pipe ''R'' (diameter 2 m) is', null, 'Continuity: (π/4)4² x 6 = (π/4)4² x 5 + (π/4)2² x v → 96 = 80 + 4v → v = 4 m/s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m25.png')
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4', true, 1), ('B', '3', false, 2), ('C', '5', false, 3), ('D', '6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the design of a reinforced concrete beam the requirement for the bond is not satisfied. The economical option to satisfy the requirement for the bond is', null, 'Bond (development) is improved economically by using smaller-diameter bars in larger number: more perimeter for the same steel area.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'bonding of bars.', false, 1), ('B', 'providing large diameter bars more in number.', false, 2), ('C', 'providing same diameter bars more in number.', false, 3), ('D', 'providing smaller diameter bars more in number.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the state of stress (in MPa) shown in the figure, the maximum shear stress (in MPa) is', null, 'σx = -2 (compression - arrows point into the element), σy = +4, τ = 4: τmax = √(((4 - (-2))/2)² + 4²) = √(9 + 16) = 5 MPa.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m29.png')
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5', true, 1), ('B', '0', false, 2), ('C', '4', false, 3), ('D', '2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ground conditions at a site are shown in the figure (sand, water table at ground level, water content 20 %, specific gravity of solids 2.7, unit weight of water 10 kN/m³). The saturated unit weight of the sand (kN/m³) is', null, 'Saturated: e = wG = 0.2 x 2.7 = 0.54; γsat = (G + e)γw/(1 + e) = 3.24 x 10/1.54 = 21.0 kN/m³.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-m30.png')
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '18', false, 1), ('B', '24', false, 2), ('C', '21', true, 3), ('D', '15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A horizontal cantilever 2.5 m long is of rectangular cross-section 50 mm wide throughout its length, with depth varying uniformly from 50 mm at the free end to 150 mm at the fixed end. A load of 3 kN acts at the free end. Find the position of the most highly stressed section and the value of the maximum bending stress induced. Neglect the self-weight of the cantilever.', 'Take x (in m) from the free end. The depth increases by 100 mm over 2.5 m, i.e. 40 mm per metre: d = 50 + 40x (mm). Width b = 50 mm.
Bending moment M = 3 kN x x = 3 x 10⁶ x Nmm. Section modulus Z = b d²/6 = 50 (50 + 40x)²/6.
Bending stress σ = M/Z = 6 x 3 x 10⁶ x/[50 (50 + 40x)²] = 360 000 x/(50 + 40x)² N/mm².
For a maximum, d/dx [x/(50 + 40x)²] = 0 → (50 + 40x) - 2 x 40x = 0 → x = 50/40 = 1.25 m from the free end (mid-length), where d = 100 mm (twice the depth at the free end).
σmax = 360 000 x 1.25/100² = 45 N/mm².
(Check: at the fixed end, x = 2.5 m, σ = 360 000 x 2.5/150² = 40 N/mm² < 45 N/mm².)
So the most highly stressed section is 1.25 m from the free end, with a maximum bending stress of 45 N/mm².', null, '[{"point": "At x (m) from the free end: depth d = 50 + 40x mm; M = 3x kNm = 3 x 10⁶ x Nmm", "marks": 1}, {"point": "σ = M/Z = 6M/(b d²) = 6 x 3 x 10⁶ x/(50 (50 + 40x)²) = 360 000 x/(50 + 40x)²", "marks": 1.5}, {"point": "dσ/dx = 0 → 50 + 40x = 80x → x = 1.25 m from the free end (where d = 100 mm, twice the free-end depth)", "marks": 1.5}, {"point": "σmax = 360 000 x 1.25/100² = 45 N/mm² (fixed end only 40 N/mm²)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A building having a non-uniform distribution of mass is shown in the figure (plan 24 m x 10 m; the top-left part 12 m x 5 m has 1500 kg/m², the rest 1200 kg/m²). Locate the centre of mass with respect to the lower left corner A of the building.', 'Divide the plan into the heavy top-left rectangle and the remainder.
Part 1: 12 m x 5 m = 60 m² at 1500 kg/m² → m1 = 90 000 kg, centroid (6.0, 7.5) m from A.
Part 2: the rest = 240 - 60 = 180 m² at 1200 kg/m² → m2 = 216 000 kg. Its centroid (whole rectangle minus the top-left rectangle, both of uniform density): x = (240 x 12 - 60 x 6)/180 = 14.0 m; y = (240 x 5 - 60 x 7.5)/180 = 4.17 m.
Total mass M = 306 000 kg.
x̄ = (90 000 x 6 + 216 000 x 14.0)/306 000 = (540 000 + 3 024 000)/306 000 = 11.65 m.
ȳ = (90 000 x 7.5 + 216 000 x 4.167)/306 000 = (675 000 + 900 000)/306 000 = 5.15 m.
The centre of mass is at (11.65 m, 5.15 m) from corner A - shifted slightly left of and above the geometric centre (12, 5) towards the heavier zone.', null, '[{"point": "Part 1 (top-left 12 x 5 m): m1 = 60 x 1500 = 90 000 kg at (6, 7.5)", "marks": 1}, {"point": "Part 2 (rest, 180 m²): m2 = 180 x 1200 = 216 000 kg; its centroid (whole minus part) = (14.0, 4.17) m", "marks": 1.5}, {"point": "x̄ = (90 000 x 6 + 216 000 x 14)/306 000 = 11.65 m", "marks": 1.25}, {"point": "ȳ = (90 000 x 7.5 + 216 000 x 4.17)/306 000 = 5.15 m from A", "marks": 1.25}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-building.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following data are available for an embankment:
Soil from the borrow pit: natural density = 1.75 Mg/m³ (printed as 17.5), natural water content = 12 %.
Soil after compaction: density = 2.0 Mg/m³, water content = 18 %.
For every 100 m³ of compacted soil in the embankment, estimate:

a) The quantity of soil to be excavated from the borrow pit. (2.5 marks)', 'a) Mass of solids is the same in the borrow pit and in the embankment.
Compacted soil: dry density ρd = ρ/(1 + w) = 2.0/1.18 = 1.695 Mg/m³; mass of solids in 100 m³ = 169.5 Mg.
Borrow pit: ρd = 1.75/1.12 = 1.5625 Mg/m³.
Volume to be excavated = 169.5/1.5625 = 108.5 m³ (for every 100 m³ of embankment).', null, '[{"point": "Compacted: dry density = 2.0/1.18 = 1.695 Mg/m³; dry mass of solids in 100 m³ = 169.5 Mg; borrow pit dry density = 1.75/1.12 = 1.5625 Mg/m³", "marks": 1.5}, {"point": "Volume to excavate = 169.5/1.5625 = 108.5 m³", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-s3', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'S3a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The following data are available for an embankment:
Soil from the borrow pit: natural density = 1.75 Mg/m³ (printed as 17.5), natural water content = 12 %.
Soil after compaction: density = 2.0 Mg/m³, water content = 18 %.
For every 100 m³ of compacted soil in the embankment, estimate:

b) The amount of water to be added. (2.5 marks)', 'b) Water already present in the excavated soil = 0.12 x 169.5 = 20.3 Mg.
Water required at 18 % = 0.18 x 169.5 = 30.5 Mg.
Water to be added = 30.5 - 20.3 = 10.17 Mg, i.e. about 10.2 m³ (10 170 litres) for every 100 m³ of compacted embankment (plus an allowance for evaporation in practice).', null, '[{"point": "Water in borrow soil = 0.12 x 169.5 = 20.3 Mg; needed = 0.18 x 169.5 = 30.5 Mg", "marks": 1.5}, {"point": "Water to add = 0.06 x 169.5 = 10.17 Mg ≈ 10.2 m³ (10 170 litres)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-s3', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'S3b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'It is proposed to widen a 30 km stretch of a single-lane road to two lanes at a total cost of Nu 5 million per km; the rate of interest is 8 % per year. The annual maintenance cost of the existing single-lane road is Nu 500 000 per km and that of the improved road would be Nu 700 000 per km. The average vehicle operation cost on the existing road is Nu 3.0 per vehicle-km and on the improved road Nu 1.75 per vehicle-km. Present traffic is 2500 motor vehicles per day and by the end of the 15-year design period the traffic is expected to double. Determine whether the investment is economically viable during the 15-year period. (Capital recovery factor CRF = i(1 + i)ⁿ/((1 + i)ⁿ - 1).)', 'Annual cost of the improvement:
Capital cost = 30 km x Nu 5 million = Nu 150 million.
CRF = 0.08 x 1.08¹⁵/(1.08¹⁵ - 1) = 0.08 x 3.172/2.172 = 0.1168.
Equivalent annual capital cost = 150 x 0.1168 = Nu 17.52 million.
Additional maintenance = (700 000 - 500 000) x 30 = Nu 6.0 million per year.
Total annual cost = 17.52 + 6.0 = Nu 23.52 million.
Annual benefit (saving in vehicle operation cost):
Saving per vehicle-km = 3.00 - 1.75 = Nu 1.25.
Traffic grows from 2500 to 5000 vehicles/day; taking the average over 15 years, 3750 vehicles/day.
Annual vehicle-km = 3750 x 365 x 30 = 41.06 million; annual saving = 1.25 x 41.06 = Nu 51.3 million.
Benefit/cost ratio = 51.3/23.52 ≈ 2.2 > 1. Even with the present traffic only (2500 vehicles/day: saving Nu 34.2 million/yr), B/C = 1.45 > 1.
Hence the road widening is economically viable over the 15-year period.', null, '[{"point": "Capital cost = 30 x 5 = Nu 150 million; CRF (8 %, 15 yr) = 0.08 x 3.172/2.172 = 0.1168 → annual capital cost = Nu 17.52 million", "marks": 1.5}, {"point": "Extra maintenance = (0.7 - 0.5) x 30 = Nu 6.0 million/yr; total annual cost = Nu 23.52 million", "marks": 1}, {"point": "Benefit: VOC saving = 3.0 - 1.75 = Nu 1.25/veh-km; average traffic (2500 → 5000) = 3750 veh/day → 3750 x 365 x 30 x 1.25 = Nu 51.3 million/yr", "marks": 1.5}, {"point": "B/C = 51.3/23.5 ≈ 2.2 > 1 (even with present traffic only: 34.2/23.5 = 1.45) → economically viable", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Portal frame with an overhang - analysis and RC design
Analyse the 2D portal frame shown in the figure by the moment distribution method, considering lateral sway. All measurements in mm.
Frame: columns AB (EI = 1.5EI) and DC (EI) are 5000 high, fixed at A and D; beam BC (2EI) spans 6000 and carries a UDL of 20 kN/m; a cantilever BE 2500 long projects to the left of B with a 10 kN point load at E; a horizontal load of 30 kN acts on AB at 2500 above A.

1. Find the responses in each member due to the combination of all loads, considering sway, and draw the bending moment diagram. (30 marks)', 'Fixed-end moments (clockwise positive): beam BC: MFBC = -wL²/12 = -20 x 6²/12 = -60 kNm, MFCB = +60 kNm. Column AB with 30 kN at mid-height: MFAB = -PL/8 = -18.75, MFBA = +18.75 kNm (sign depending on the side). Cantilever BE (statically determinate): moment at B = 10 x 2.5 = 25 kNm (hogging), applied to joint B.
Stiffness (4EI/L): kBA = 4(1.5EI)/5 = 1.2EI; kBC = 4(2EI)/6 = 1.333EI; kCD = 4EI/5 = 0.8EI. Distribution factors: joint B - BA 1.2/2.533 = 0.474, BC 0.526 (the cantilever takes no share); joint C - CB 1.333/2.133 = 0.625, CD 0.375.
Analysis: (1) non-sway moment distribution with a horizontal prop at beam level; (2) sway analysis with an arbitrary sway (FEMs -6EIΔ/L² in each column); (3) superpose so that the column shears balance the 30 kN horizontal load (HA + HD = 30 kN).
Final results (verified by a stiffness analysis; magnitudes):
MA = 29.9 kNm; moment under the 30 kN load = 11.6 kNm; MBA = 21.8 kNm; MBE = 25.0 kNm; MBC = 46.8 kNm (hogging) - joint B balances: 21.8 + 25.0 = 46.8.
MCB = MCD = 39.0 kNm (hogging); MD = 27.9 kNm.
Reactions: A - horizontal 16.6 kN, vertical 71.3 kN, moment 29.9 kNm; D - horizontal 13.4 kN, vertical 58.7 kN, moment 27.9 kNm (ΣH = 30, ΣV = 120 + 10 = 130 kN ✓).
Beam BC: shear 61.3 kN at B and 58.7 kN at C; zero shear at 61.3/20 = 3.07 m from B, maximum sagging moment = -46.8 + 61.3 x 3.07 - 20 x 3.07²/2 = 47.2 kNm.
Axial forces: AB 71.3 kN, CD 58.7 kN (compression); BC about 13.4 kN.
BMD: cantilever BE - triangle 0 at E to 25 kNm at B (hogging); beam BC - hogging 46.8 at B and 39.0 at C with a parabolic sagging peak of 47.2 kNm; column AB - 29.9 at A, 11.6 at the load point, 21.8 at B (changing sign below the load); column DC - 27.9 at D to 39.0 at C on opposite faces (contraflexure about 2.1 m above D). The frame sways to the right (in the direction of the 30 kN load).', null, '[{"point": "FEMs: BC = ±wL²/12 = ±60 kNm; AB with 30 kN at mid-height = ±PL/8 = ±18.75 kNm; cantilever moment at B = 10 x 2.5 = 25 kNm", "marks": 4}, {"point": "Stiffness/DFs (4EI/L): BA 1.2EI, BC 1.333EI, CD 0.8EI; joint B: BA 0.474, BC 0.526; joint C: CB 0.625, CD 0.375", "marks": 4}, {"point": "Non-sway distribution + sway correction (shear equation: HA + HD = 30 kN)", "marks": 6}, {"point": "Final moments (kNm, magnitudes): MA = 29.9, MB(column) = 21.8, MB(cantilever) = 25.0, MB(beam) = 46.8, MC = 39.0, MD = 27.9; under the 30 kN load on AB 11.6", "marks": 8}, {"point": "Reactions: A - H 16.6 kN, V 71.3 kN; D - H 13.4 kN, V 58.7 kN; beam end shears 61.3 (B), 58.7 (C); max sagging in BC 47.2 kNm at 3.07 m from B", "marks": 5}, {"point": "BMD sketched with values and contraflexure points", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case1.png')
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 18.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 7.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Portal frame with an overhang - analysis and RC design
Analyse the 2D portal frame shown in the figure by the moment distribution method, considering lateral sway. All measurements in mm.
Frame: columns AB (EI = 1.5EI) and DC (EI) are 5000 high, fixed at A and D; beam BC (2EI) spans 6000 and carries a UDL of 20 kN/m; a cantilever BE 2500 long projects to the left of B with a 10 kN point load at E; a horizontal load of 30 kN acts on AB at 2500 above A.

2. Design member BC as a reinforced concrete beam (M25, Fe 500, cover 25 mm). (10 marks)', 'Design forces (load factor 1.5): Mu,sag = 1.5 x 47.2 = 70.8 kNm; Mu,hog at B = 1.5 x 46.8 = 70.2 kNm; Vu = 1.5 x 61.3 = 92 kN.
Trial section: b = 250 mm, D = 450 mm, cover 25 mm, 8 mm stirrups, 16 mm bars → d = 450 - 25 - 8 - 8 = 409 ≈ 410 mm.
Limiting moment (Fe 500): Mu,lim = 0.133 fck b d² = 0.133 x 25 x 250 x 410² = 139.7 kNm > 70.8 kNm → singly reinforced.
Steel: 70.8 x 10⁶ = 0.87 x 500 x Ast x 410 (1 - 500 Ast/(250 x 410 x 25)) → Ast ≈ 433 mm². Provide 3 bars of 16 mm (603 mm², pt = 0.59 %) at the bottom in the span and 3-16 mm at the top over the supports (hogging Ast ≈ 430 mm²). Minimum Ast = 0.85 b d/fy = 174 mm² ✓; maximum 4 % ✓.
Shear: τv = 92 x 10³/(250 x 410) = 0.90 N/mm²; for pt ≈ 0.59 %, τc ≈ 0.52 N/mm² (M25), τc,max = 3.1 ✓. Vus = 92 - 0.52 x 250 x 410/1000 = 38.7 kN. With 2-legged 8 mm stirrups (Asv = 100.5 mm²): sv = 0.87 x 500 x 100.5 x 410/38 700 = 463 mm → limited to 0.75d = 307 mm and 300 mm → 2L-8 mm @ 300 c/c, closer (e.g. 150 c/c) near the supports.
Deflection: L/d = 6000/410 = 14.6 < 26 x modification factor (≈ 1.2 for pt 0.59 %) ✓. Provide 2-12 mm hanger bars and development lengths as per IS 456.', null, '[{"point": "Design moments (1.5 factor): Mu = 1.5 x 47.2 = 70.8 kNm sagging, 70.2 kNm hogging at B; Vu = 1.5 x 61.3 = 92 kN", "marks": 2}, {"point": "Trial section 250 x 450 mm, d ≈ 410 mm; Mu,lim = 0.133 fck b d² = 139.7 kNm > Mu → singly reinforced", "marks": 2}, {"point": "Ast from Mu = 0.87 fy Ast d (1 - Ast fy/(b d fck)) ≈ 433 mm² → 3 bars of 16 mm (603 mm²) bottom at mid-span and top at supports; > minimum 0.85bd/fy = 174 mm²", "marks": 3}, {"point": "Shear: τv = 0.90 MPa > τc ≈ 0.52 (pt ≈ 0.59 %, M25) → Vus = 92 - 53 = 39 kN; 2-legged 8 mm stirrups, spacing limited to 0.75d/300 mm → 8 mm @ 300 c/c (closer near supports); check deflection L/d = 14.6 < 26", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case1.png')
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Portal frame with an overhang - analysis and RC design
Analyse the 2D portal frame shown in the figure by the moment distribution method, considering lateral sway. All measurements in mm.
Frame: columns AB (EI = 1.5EI) and DC (EI) are 5000 high, fixed at A and D; beam BC (2EI) spans 6000 and carries a UDL of 20 kN/m; a cantilever BE 2500 long projects to the left of B with a 10 kN point load at E; a horizontal load of 30 kN acts on AB at 2500 above A.

3. Design member CD as a reinforced concrete column (M25, Fe 500, cover 40 mm). (10 marks)', 'Design actions: Pu = 1.5 x 58.7 = 88 kN; Mu (top, at C) = 1.5 x 39.0 = 58.5 kNm; e = Mu/Pu ≈ 0.66 m - the column behaves mainly in bending.
Trial section: 300 x 400 mm with bending about the major axis (D = 400 mm), cover 40 mm, so d'' ≈ 40 + 8 + 10 = 58 mm, d''/D ≈ 0.15.
Slenderness: in a sway frame the effective length is about 1.2L = 6.0 m; le/D = 6000/400 = 15 > 12 → slender. Additional moment Ma = (Pu D/2000)(le/D)² = (88 x 0.4/2000) x 15² ≈ 4.0 kNm (can be reduced by the factor k); total Mu ≈ 62 kNm.
Using SP 16 interaction chart for Fe 500, d''/D = 0.15: Pu/(fck b D) = 88 x 10³/(25 x 300 x 400) = 0.029; Mu/(fck b D²) = 62 x 10⁶/(25 x 300 x 400²) = 0.052 → p/fck ≈ 0.04, p ≈ 1.0 % (approximate chart reading).
As = 0.010 x 300 x 400 = 1200 mm² → provide 4 bars of 20 mm (1257 mm²) or 6 bars of 16 mm (1206 mm²), equally on the two faces; within 0.8 %-4 % ✓.
Lateral ties: diameter ≥ φ/4 and 6 mm → 8 mm; pitch ≤ least of b (300 mm), 16φ (256 mm with 16 mm bars) and 300 mm → 8 mm ties @ 250 c/c.
(The chart reading should be confirmed with SP 16; a 300 x 300 column would need about 2 % steel.)', null, '[{"point": "Design actions: Pu = 1.5 x 58.7 = 88 kN; Mu = 1.5 x 39.0 = 58.5 kNm (at C); small axial load, large eccentricity", "marks": 2}, {"point": "Trial section 300 x 400 mm (bending about the 400 mm side); slenderness: le (sway frame, ≈1.2L) = 6.0 m → le/D = 15 > 12, slender: add Ma = Pu D/2000 (le/D)² ≈ 4 kNm", "marks": 2}, {"point": "SP 16 chart (d''/D ≈ 0.15, Fe 500): Pu/(fck bD) = 0.03, Mu/(fck bD²) ≈ 0.05 → p/fck ≈ 0.04 → p ≈ 1.0 % → As ≈ 1200 mm² (e.g. 4-20 mm, 1257 mm², or 6-16 mm)", "marks": 4}, {"point": "Detailing: ≥ 0.8 % and ≤ 4 %; ties 8 mm @ ≤ least of b, 16φ, 300 mm (e.g. 8 mm @ 250 c/c); cover 40 mm", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case1.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Wind load on a free-standing bus-stand roof
The Royal Government of Bhutan intends to build bus stands along the Thimphu-Babesa expressway to give commuters better waiting areas. The architectural consultant has proposed a free-standing sloped (V-shaped, troughed) roof supported on a central column, with dimensions as shown in the figure (bays of 6000 mm along the length). The roof angle α is 10°.
Basic data: basic wind velocity Vb = 44 m/s; terrain category 2; topography factor k3 = 1.0; weight of PPGI sheet = 0.465 kg/m²; weight of purlins = 200 N/m²; weight of bracing = 12 N/m².
The paper provides extracts of IS 875 (Part 3): Table 1 (k1), Table 2 (k2), Tables 4-11 (pressure coefficients, including Table 8 for free-standing double-sloped roofs) and IS 1161 steel tube properties.

1. Calculate the wind pressures and design forces on the roof so that the member components of the roof can be designed. (30 marks)', '1. Design wind speed (IS 875 Part 3: 1987): Vz = Vb k1 k2 k3.
k1 = 1.0 - all general buildings and structures, 50-year life (Table 1, Vb = 44 m/s).
k2 - terrain category 2, height of the roof ≤ 10 m: class A (< 20 m) 1.00, class B (20-50 m) 0.98. The roof is 5 x 6 = 30 m long, so class B: k2 = 0.98.
k3 = 1.0 (given). Vz = 44 x 1.0 x 0.98 x 1.0 = 43.1 m/s.
2. Design wind pressure: pz = 0.6 Vz² = 0.6 x 43.1² = 1116 N/m² ≈ 1.12 kN/m².
3. Dead load on plan/ slope: PPGI sheet 0.465 kg/m² x 9.81 = 4.6 N/m²; purlins 200 N/m²; bracing 12 N/m²; total ≈ 217 N/m² (0.22 kN/m²), plus the self-weight of the trusses (estimate, e.g. 0.1 kN/m²).
4. Pressure coefficients: the roof is a free-standing double-sloped roof with the slopes falling towards the centre (troughed, negative roof angle -10°), so Table 8 applies:
overall coefficients for -10°: maximum (largest +ve, downward) Cp = +0.4; minimum (largest -ve, uplift) Cp = -0.6 for solidity ratio φ = 0 (nothing stored under the roof) and -0.8 for φ = 1 (fully blocked - e.g. a bus standing under it). Local coefficients for the edge strips (width W/10 and L/10) and the valley are higher (Table 8 local columns) and are used for sheeting and purlin fixings.
5. Design pressures: downward p = 0.4 x 1.116 = 0.45 kN/m²; uplift p = 0.6 x 1.116 = 0.67 kN/m² (0.89 kN/m² with φ = 1).
As Table 8 requires, check (a) both slopes at the maximum coefficient, (b) both slopes at the minimum, and (c) one slope at the maximum and the other at the minimum - the unbalanced case, which produces the overturning moment on the central column. The centre of pressure is at the centre of each slope.
6. Load combinations (limit state, IS 800/ IS 875 Part 5): 1.5 (DL + WL) for downward; 0.9 DL - 1.5 WL for uplift (this governs the rafters and fixings): net ≈ 0.9 x 0.22 - 1.5 x 0.67 = -0.81 kN/m² (uplift) with φ = 0. Line loads on a truss = pressure x truss spacing (6.0 m), e.g. uplift ≈ 0.81 x 6 = 4.9 kN/m along the rafter, and purlin loads = pressure x purlin spacing x 6 m span.
(The span of each slope and the column height must be taken from the drawing; they are not legible in the copy available.)', null, '[{"point": "Design wind speed Vz = Vb k1 k2 k3: k1 = 1.0 (general structure, 50 years, Table 1); k2 = 0.98 (terrain category 2, class B as the roof length 30 m is 20-50 m, height ≤ 10 m; 1.00 if class A); k3 = 1.0 → Vz = 43.1 m/s", "marks": 6}, {"point": "Design wind pressure pz = 0.6 Vz² = 0.6 x 43.1² = 1116 N/m² ≈ 1.12 kN/m²", "marks": 4}, {"point": "Dead load: PPGI 0.465 x 9.81 = 4.6 N/m² + purlins 200 + bracing 12 = 217 N/m² (+ self-weight of trusses)", "marks": 4}, {"point": "Coefficients (Table 8, free-standing double-sloped roof, roof angle -10° - troughed/ V shape): overall Cp max +0.4 (downward), min -0.6 (φ = 0, empty under the roof) or -0.8 (φ = 1, blocked); local coefficients at edges and the valley as in Table 8", "marks": 6}, {"point": "Pressures: downward 0.4 x 1.116 = 0.45 kN/m²; uplift 0.6 x 1.116 = 0.67 kN/m² (0.89 with φ = 1); cases: both slopes max, both min, one max/ other min (unbalanced - overturning on the column); centre of pressure at the centre of each slope", "marks": 6}, {"point": "Load combinations (IS 875 Part 5/ IS 800): DL + WL; 0.9 DL - 1.5 WL governs uplift: net uplift ≈ 0.9 x 0.22 - 1.5 x 0.67 ≈ -0.81 kN/m²; line loads on rafters = pressure x truss spacing (6 m)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["FLAGGED: drawing dimensions are not legible; member sizes in the model answer are a procedure only - a structural engineer must complete them before publishing.", "Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case2.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 18.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 7.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Wind load on a free-standing bus-stand roof
The Royal Government of Bhutan intends to build bus stands along the Thimphu-Babesa expressway to give commuters better waiting areas. The architectural consultant has proposed a free-standing sloped (V-shaped, troughed) roof supported on a central column, with dimensions as shown in the figure (bays of 6000 mm along the length). The roof angle α is 10°.
Basic data: basic wind velocity Vb = 44 m/s; terrain category 2; topography factor k3 = 1.0; weight of PPGI sheet = 0.465 kg/m²; weight of purlins = 200 N/m²; weight of bracing = 12 N/m².
The paper provides extracts of IS 875 (Part 3): Table 1 (k1), Table 2 (k2), Tables 4-11 (pressure coefficients, including Table 8 for free-standing double-sloped roofs) and IS 1161 steel tube properties.

2. Calculate the resultant wind load on the rafter of the proposed truss and design it as a tubular steel section. (10 marks)', 'Resultant wind load on a rafter: for each slope, F = Cp x pz x (slope length) x (truss spacing 6 m), acting normal to the roof surface through the centre of the slope. For example, uplift on one slope = 0.67 kN/m² x 6 m = 4.0 kN per metre of slope (net of 0.9 DL: ≈ 4.9 kN/m factored), and downward 0.45 kN/m² x 6 = 2.7 kN/m plus dead load.
Analysis: convert to panel-point loads at the purlin locations and analyse the truss (method of joints/ sections) for each case - downward (rafter in compression or tension depending on the cantilever form) and uplift (force reversal). The worst tension and the worst compression in the rafter are both checked.
Design as a circular hollow section (IS 1161, YSt 310, fy = 310 MPa):
- Tension: Td = Ag fy/γm0 (γm0 = 1.1) ≥ Tu.
- Compression: effective length = distance between panel points (purlin positions restrained by bracing); slenderness λ = KL/r ≤ 180; design compressive stress fcd from IS 800 Table 9 (buckling class a for hot-finished tubes); Pd = Ae fcd ≥ Pu.
- Choose the lightest tube from the IS 1161 table (printed with the paper) that satisfies both, e.g. try a 48.3 mm or 60.3 mm OD medium tube and increase if necessary.
(The numerical member force depends on the slope length and truss depth on the drawing - FLAGGED for completion by a structural engineer.)', null, '[{"point": "Resultant on one slope = Cp pz x slope length x truss spacing (e.g. uplift 0.67 kN/m² x 6 m per metre of slope), acting normal to the slope at its centre; combine with DL", "marks": 3}, {"point": "Analyse the truss (rafter forces from panel-point loads; reversal - rafter may go into compression under uplift)", "marks": 2}, {"point": "Select a tube from IS 1161 (YSt 310/ 240): check tension capacity Ag fy/γm0 and compression with effective length = panel length, λ = KL/r ≤ 180, fcd from IS 800 buckling curve a", "marks": 4}, {"point": "State the chosen section (e.g. a 48.3 - 60.3 mm OD medium tube, to be confirmed with the actual member force)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["FLAGGED: drawing dimensions are not legible; member sizes in the model answer are a procedure only - a structural engineer must complete them before publishing.", "Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case2.png')
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Wind load on a free-standing bus-stand roof
The Royal Government of Bhutan intends to build bus stands along the Thimphu-Babesa expressway to give commuters better waiting areas. The architectural consultant has proposed a free-standing sloped (V-shaped, troughed) roof supported on a central column, with dimensions as shown in the figure (bays of 6000 mm along the length). The roof angle α is 10°.
Basic data: basic wind velocity Vb = 44 m/s; terrain category 2; topography factor k3 = 1.0; weight of PPGI sheet = 0.465 kg/m²; weight of purlins = 200 N/m²; weight of bracing = 12 N/m².
The paper provides extracts of IS 875 (Part 3): Table 1 (k1), Table 2 (k2), Tables 4-11 (pressure coefficients, including Table 8 for free-standing double-sloped roofs) and IS 1161 steel tube properties.

3. Calculate the resultant forces on the vertical member supporting the truss and design it as a compression member (tubular steel section). (10 marks)', 'Forces on the central column (one truss every 6 m):
- Axial compression = (dead load + downward wind) x roof plan width x 6 m (+ self-weight of the truss); in the uplift case the column is in tension, and the holding-down bolts must resist it.
- Bending moment from the unbalanced wind case (one slope at Cp = +0.4, the other at -0.6): each slope''s resultant acts at its centre, so with plan length b of each slope, M ≈ (0.4 + 0.6) x pz x 6 x b x (b/2) = 3.35 b² kNm (pz = 1.116 kN/m²); a horizontal drag/ friction force on the roof adds a moment = force x column height.
Design as a compression member with bending: the column is a vertical cantilever (fixed base, free top), so the effective length = 2.0 x height. Check:
(1) compression capacity Pd = Ae fcd using KL/r (≤ 180),
(2) bending capacity Md = Ze fy/γm0 for the tube,
(3) interaction (IS 800 cl 9.3.2): Pu/Pd + Ky Mu/Md ≤ 1.0.
Because of the large overturning moment on a single central column, a large-diameter heavy tube (or a pair of tubes) is needed; choose the section from IS 1161 so that the interaction ratio ≤ 1.0, and design the base plate, anchor bolts and foundation for the moment and uplift.
(FLAGGED: the slope length and column height are not legible on the drawing; the numbers must be completed by a structural engineer.)', null, '[{"point": "Axial force = (DL + downward wind) on the tributary area (roof width x 6 m spacing); uplift case gives tension", "marks": 3}, {"point": "Moment from the unbalanced case: one slope +0.4, other -0.6 → M = (0.4 + 0.6) pz x 6 x b x b/2 (b = slope plan length), plus horizontal drag", "marks": 3}, {"point": "Design as a cantilever column (base fixed, top free): effective length 2.0L; check combined axial + bending interaction (IS 800 cl 9.3) with a large tube", "marks": 3}, {"point": "Foundation: fixed base, holding-down bolts for uplift and moment", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["FLAGGED: drawing dimensions are not legible; member sizes in the model answer are a procedure only - a structural engineer must complete them before publishing.", "Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "source": {"title": "BCSE 2020 Main Examination, Technical Paper III, Civil Engineering", "year": 2020, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2020-case2', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2020-case2.png')
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2020 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the maximum spacing of vertical stirrups in a beam shall not exceed 0.75d or', null, 'IS 456 cl 26.5.1.5: maximum spacing of vertical stirrups is the lesser of 0.75d and 300 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '600 mm', false, 1), ('B', '300 mm', true, 2), ('C', '450 mm', false, 3), ('D', '200 mm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A sand is considered well graded when its coefficient of curvature Cc lies between', null, 'Well graded: Cc = D30²/(D10 x D60) between 1 and 3, with Cu > 6 for sand (> 4 for gravel).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 and 3', true, 1), ('B', '6 and 10', false, 2), ('C', '0 and 1', false, 3), ('D', '3 and 6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The toughness (resistance to impact) of road aggregates is determined by the', null, 'The aggregate impact value test measures toughness; Los Angeles - hardness/abrasion; crushing value - strength; soundness - weathering.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'soundness test', false, 1), ('B', 'aggregate crushing value test', false, 2), ('C', 'Los Angeles abrasion test', false, 3), ('D', 'aggregate impact value test', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'By Rankine''s formula, the minimum depth of foundation for a soil of unit weight γ, angle of shearing resistance φ and bearing pressure p is', null, 'Rankine: Df = (p/γ) x ((1 - sinφ)/(1 + sinφ))² = (p/γ) Ka².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(p/γ) (1 - sinφ)/(1 + sinφ)', false, 1), ('B', '(γ/p) ((1 - sinφ)/(1 + sinφ))²', false, 2), ('C', '(p/γ) ((1 + sinφ)/(1 - sinφ))²', false, 3), ('D', '(p/γ) ((1 - sinφ)/(1 + sinφ))²', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The method of slices for analysing the stability of slopes along a circular slip surface is commonly known as the', null, 'The Swedish (Fellenius) slip-circle method divides the sliding mass into vertical slices; Culmann''s method assumes a plane failure surface.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Culmann method', false, 1), ('B', 'Swedish circle (Fellenius) method', true, 2), ('C', 'Rankine method', false, 3), ('D', 'Coulomb wedge method', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Hardy Cross method is used for the analysis of', null, 'Hardy Cross balances heads (or flows) by successive corrections around the loops of a pipe network.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'groundwater flow to wells', false, 1), ('B', 'open channel flow', false, 2), ('C', 'pipe networks in water distribution systems', true, 3), ('D', 'flood routing through reservoirs', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The SI unit of the coefficient of permeability of a soil is', null, 'Darcy''s law v = k i, with i dimensionless, so k has the units of velocity (m/s).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 's/m', false, 1), ('B', 'm/s', true, 2), ('C', 'm³/s', false, 3), ('D', 'm²/s', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A soil with a liquidity index less than zero is in the', null, 'IL = (w - wP)/IP < 0 means the water content is below the plastic limit - semi-solid or solid (IL = 0 at wP, 1 at wL).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'plastic state', false, 1), ('B', 'liquid state', false, 2), ('C', 'state at the liquid limit', false, 3), ('D', 'semi-solid or solid state', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The theoretical effective length of a column of length L with both ends fixed (no sway) is', null, 'Both ends fixed: 0.5L theoretically (IS 456 recommends 0.65L for design); one fixed one hinged 0.7L; both hinged L; cantilever 2L.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.0 L', false, 1), ('B', '2.0 L', false, 2), ('C', '0.5 L', true, 3), ('D', '0.7 L', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The whole circle bearing of a survey line is measured directly with a', null, 'A prismatic compass reads whole circle bearings (0-360°); a surveyor''s compass reads quadrantal bearings.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2020, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'prismatic compass', true, 1), ('B', 'dumpy level', false, 2), ('C', 'cross staff', false, 3), ('D', 'plane table', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N10';
commit;
