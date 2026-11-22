-- ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'An inflow hydrograph is routed through a reservoir to produce an outflow hydrograph. The peak flow of the inflow hydrograph is PI and the time of occurrence of the peak if tI. The peak flow of the outflow hydrograph is Po and the time of occurrence of the peak is to. Which of the following statement is correct?', null, 'Reservoir storage attenuates and delays the flood: the outflow peak is lower and occurs later (PI > Po, tI < to).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'PI < Po and tI > to', false, 1), ('B', 'PI < Po and tI < to', false, 2), ('C', 'PI > Po and tI > to', false, 3), ('D', 'PI > Po and tI < to', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The data from a closed traverse survey PQRS (run in the clockwise direction) are given below (line: included angle) - PQ: 88°, QR: 92°, RS: 94°, SP: 89°. The closing error of the traverse PQRS (in degrees) is', null, 'Sum of interior angles of a 4-sided closed traverse = (2n - 4) x 90° = 360°; observed 88 + 92 + 94 + 89 = 363°, so the closing error is 3°.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '4', false, 1), ('B', '3', true, 2), ('C', '6', false, 3), ('D', '5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Construction of a new building founded on a clayey soil was completed in January 2010. In January 2014, the average consolidation settlement of the foundation in clay was recorded as 10 mm. The ultimate consolidation settlement was estimated in design as 40 mm. Considering double drainage to occur at the clayey soil site, the expected consolidation settlement in January 2019 (in mm, round off to the nearest integer) will be', null, 'For U < 60 %, Tv = (π/4)U², so U ∝ √t. After 4 years U = 10/40 = 25 %; after 9 years U = 25 % x √(9/4) = 37.5 % → 0.375 x 40 = 15 mm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '10', false, 1), ('B', '15', true, 2), ('C', '5', false, 3), ('D', '25', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The critical bending compressive stress in the extreme fibre of a structural steel section is 1000 Mpa. It is given that the yield strength of the steel is 250 Mpa, width of flange is 250 mm and thickness of flange is 15 mm. As per the provisions of IS : 800 -2007, the non-dimensional slenderness ratio of the steel cross-section is', null, 'IS 800: λLT = √(fy/fcr,b) = √(250/1000) = 0.5.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.75', false, 1), ('B', '2.00', false, 2), ('C', '0.25', false, 3), ('D', '0.50', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When a specimen of M25 concrete is loaded to a stress level of 12.5 Mpa, a strain of 500 × 10 −6 is recorded. If this load is allowed to stand for a long time, the strain increases to 1000 × 10 -6 . In accordance with the provisions of IS:456-2000, considering the long-term effects, the effective modulus of elasticity of the concrete (in Mpa) is', null, 'Long-term (effective) modulus = stress/total strain = 12.5/(1000 x 10⁻⁶) = 12 500 MPa (= Ec/(1 + θ) with creep coefficient θ = 1).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1250', false, 1), ('B', '125', false, 2), ('C', '250', false, 3), ('D', '12500', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a plane stress problem, the state of stress at a point P is represented by the stress element as shown in figure. By how much angle ( ) in degrees the stress element should be rotated in order to get the planes of maximum shear stress?', null, 'σx = 80 (tension), σy = -20 (compression), τ = 25 MPa: tan 2θp = 2τ/(σx - σy) = 0.5 → θp = 13.3°; maximum shear planes are at 45° from the principal planes: 13.3 - 45 = -31.7°, i.e. a rotation of 31.7°.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m8.png')
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '13.3', false, 1), ('B', '48.3', false, 2), ('C', '31.7', true, 3), ('D', '26.6', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A series of perpendicular offsets taken from a curved boundary wall to a straight survey line at an interval of 6 m are 1.22, 1.67, 2.04, 2.34, 2.14, 1.87 and 1.15 m. The area (in m 2, round off to 2 decimal places) bounded by the survey line, curved boundary wall, the first and the last offsets, determined using Simpson’s rule is', null, 'Simpson''s rule (6 intervals of 6 m): A = (6/3)[(1.22 + 1.15) + 4(1.67 + 2.34 + 1.87) + 2(2.04 + 2.14)] = 2 x 34.25 = 68.50 m².', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '68.5', true, 1), ('B', '78.5', false, 2), ('C', '88.5', false, 3), ('D', '60.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The frame shown in the figure has three beam elements OA, OB and OC with identical length L and flexural rigidity EI, subjected to an external moment M applied at joint O (A is pinned, B is free, C is fixed). The correct set of moments {MOA, MOB, MOC} that develop at O in the three elements OA, OB and OC respectively is', null, 'Stiffness at O: OA pinned at A → 3EI/L; OB free at B → 0; OC fixed → 4EI/L. Distribution factors 3/7, 0, 4/7, so MOA = 3M/7, MOB = 0, MOC = 4M/7.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m10.png')
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '{3M/8, M/8, 4M/8}', false, 1), ('B', '{3M/11, 4M/11, 4M/11}', false, 2), ('C', '{3M/7, 0, 4M/7}', true, 3), ('D', '{M/3, M/3, M/3}', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a soil investigation work at a site, Standard Penetration Test (SPT) was conducted at every 1.5 m interval up to 30 m depth. At 3 m depth, the observed number of hammer blows for three successive 150 mm penetrations were 8, 6 and 9 respectively. The SPTN-value at 3 m depth is', null, 'The first 150 mm is seating drive and is ignored: N = 6 + 9 = 15.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '14', false, 1), ('B', '15', true, 2), ('C', '23', false, 3), ('D', '17', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A planar elastic structure is subjected to uniformly distributed load, as shown in the figure. Neglecting self-weight, the maximum bending moment generated in the structure (in kNm) is', null, 'With HA = 0 (B on rollers) the arch acts as a simply supported curved beam: Mmax = wL²/8 = 12 x 8²/8 = 96 kNm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m12.png')
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '96', true, 1), ('B', '24', false, 2), ('C', '192', false, 3), ('D', '48', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Velocity of flow is proportional to the first power of hydraulic gradient in Darcy’s law. The law is applicable to', null, 'Darcy''s law (v = ki) holds for laminar flow in porous media (Reynolds number below about 1).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'turbulent flow in porous media.', false, 1), ('B', 'laminar as well as turbulent flow in porous media.', false, 2), ('C', 'laminar flow in porous media.', true, 3), ('D', 'transitional flow in porous media.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A vertical retaining wall of 5 m height has to support soil having unit weight of 18 kN/m3, effective cohesion of 12 kN/m2, and effective friction angle of 30°. As per Rankine’s earth pressure theory and assuming that a tension crack has occurred, the lateral active thrust on the wall per meter length (in kN/m) is', null, 'Ka = 1/3; tension crack depth zc = 2c/(γ√Ka) = 2 x 12/(18 x 0.577) = 2.31 m; pressure at base = KaγH - 2c√Ka = 30 - 13.86 = 16.14 kPa; thrust = ½ x 16.14 x (5 - 2.31) = 21.71 kN/m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '16.144', false, 1), ('B', '21.714', true, 2), ('C', '32.288', false, 3), ('D', '65.265', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During the process of hydration of cement, due to increase in Dicalcium Silicate (C2S) content in cement clinker, the heat of hydration', null, 'C2S hydrates slowly with low heat (about 260 J/g vs 500 J/g for C3S): more C2S lowers the heat of hydration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'initially decreases and then increases.', false, 1), ('B', 'increases.', false, 2), ('C', 'decreases.', true, 3), ('D', 'does not change.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cantilever beam PQ of uniform flexural rigidity (EI) is subjected to a concentrated moment M at R as shown in the figure. The deflection at the free end Q is', null, 'Moment M at mid-length R: θR = M(L/2)/EI, δR = M(L/2)²/2EI = ML²/8EI; δQ = δR + θR x L/2 = ML²/8EI + ML²/4EI = 3ML²/8EI.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m16.png')
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3ML²/4EI', false, 1), ('B', 'ML²/4EI', false, 2), ('C', 'ML²/6EI', false, 3), ('D', '3ML²/8EI', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The probability that a 50 year flood may NOT occur at all during 25 years life of a project is', null, 'p = 1/50 = 0.02; probability of no occurrence in 25 years = (1 - 0.02)²⁵ = 0.603 ≈ 0.6.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.6', true, 1), ('B', '0.7', false, 2), ('C', '0.8', false, 3), ('D', '0.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The speed density relationship for a road section is shown in the figure. The shape of the flow- density relationship is', null, 'q = k v: while speed is constant q rises linearly with density; once speed falls linearly with density, q = k(a - bk) is a parabola.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m20.png')
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'initially parabolic then linear.', false, 1), ('B', 'initially linear then parabolic.', true, 2), ('C', 'parabolic.', false, 3), ('D', 'piecewise linear.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The width of a square footing and the diameter of circular footing are equal. If both the footings are placed on the surface of sandy soil, the ratio of the ultimate bearing capacity of circular footing to that of square footing will be', null, 'For a surface footing on sand qu depends on the Nγ term: square 0.4γBNγ, circular 0.3γBNγ → ratio 3/4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3/4', true, 1), ('B', '1', false, 2), ('C', '4/3', false, 3), ('D', '2/3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A simply supported beam with a gradually varying load from zero at ‘B’ and ‘w’ per unit length at ‘A’ is shown in the figure below. The shear force at ‘B’ is equal to', null, 'Total load wl/2 acts at l/3 from A: RB = (wl/2)(l/3)/l = wl/6, which is the shear force at B.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m22.png')
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2wl/3', false, 1), ('B', 'wl/3', false, 2), ('C', 'wl/6', true, 3), ('D', 'wl', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The target mean strength fcm for concrete mix design obtained from the characteristic strength fck and standard deviation σ, as defined in IS:456-2000 is', null, 'IS 456 / IS 10262: target mean strength = fck + 1.65σ (5 % of results may fall below fck).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'fck + 1.55σ', false, 1), ('B', 'fck + 1.45σ', false, 2), ('C', 'fck + 1.35σ', false, 3), ('D', 'fck + 1.65σ', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of the plastic moment capacity of a beam section to its yield moment capacity is termed as', null, 'Shape factor = plastic moment Mp / yield moment My (= Zp/Ze; 1.5 for a rectangle, about 1.12-1.14 for I-sections).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Shape factor', true, 1), ('B', 'Aspect ratio', false, 2), ('C', 'Slenderness ratio', false, 3), ('D', 'Load factor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The state of stress represented by Mohr’s circle shown in the figure is', null, 'A Mohr''s circle centred at the origin has σ1 = -σ2 = τmax: the state of pure shear.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m25.png')
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'pure shear', true, 1), ('B', 'hydrostatic stress', false, 2), ('C', 'uniaxial tension', false, 3), ('D', 'biaxial tension of equal magnitude', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For an open channel flow to take place between two sections', null, 'Flow in an open channel always goes from higher to lower total energy; the bed may be adverse and the depth may increase downstream.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'the upstream depth must be larger than the downstream depth.', false, 1), ('B', 'the upstream momentum must be larger than the downstream momentum.', false, 2), ('C', 'the total energy at the upstream end must be larger than the downstream end.', true, 3), ('D', 'the channel bed must always slope in the direction of the flow.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A retaining wall of height H with smooth vertical back face supports a backfill inclined at an angle β with the horizontal. The backfill consists of cohesion less soil having angle of internal friction ϕ. If the active lateral thrust acting on the wall is Pa, which one of the following statements is TRUE?', null, 'For a smooth vertical wall with backfill sloping at β (Rankine), the active thrust acts at H/3 above the base, parallel to the backfill surface (at β to the horizontal).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pa acts at a height H/3 from the base of the wall and at an angle ϕ with the horizontal.', false, 1), ('B', 'Pa acts at a height H/3 from the base of the wall and at an angle β with the horizontal', true, 2), ('C', 'Pa acts at a height H/2 from the base of the wall and at an angle ϕ with the horizontal', false, 3), ('D', 'Pa acts at a height H/2 from the base of the wall and at an angle β with the horizontal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The sketch shows a column with a pin at the base and rollers at the top. It is subjected to an axial force P and a moment M at mid-height. The reaction(s) at R is/are', null, 'The roller at Q gives only a horizontal reaction, so R carries the vertical force P; the applied moment M is balanced by equal and opposite horizontal reactions M/h at Q and R.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m29.png')
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a vertical force equal to P/2 and a horizontal force equal to M/h', false, 1), ('B', 'a vertical force equal to P/2', false, 2), ('C', 'a vertical force equal to P', false, 3), ('D', 'a vertical force equal to P and a horizontal force equal to M/h', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Group I contains representative load-settlement curves (see the figure) for different modes of bearing capacity failure of sandy soil. Group II lists the various failure characteristics. Match the load-settlement curves with the corresponding failure characteristics.
Group I: P - Curve J; Q - Curve K; R - Curve L.
Group II: 1 - No apparent heaving of soil around the footing; 2 - Rankine''s passive zone develops imperfectly; 3 - Well defined slip surface extends to ground surface.', null, 'Curve K has a clear peak - general shear (3); curve J (loose sand, low load, settlement keeps increasing) - punching shear, no heaving (1); curve L without a clear peak - local shear, passive zone imperfect (2).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-m30.png')
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'P-1, Q-3, R-2', true, 1), ('B', 'P-3, Q-2, R-1', false, 2), ('C', 'P-3, Q-1, R-2', false, 3), ('D', 'P-1, Q-2, R-3', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A circular log of timber has diameter D. Find the strongest section of the rectangular timber beam that can be cut from this piece of log to resist the moment.', 'The moment of resistance M = f Z, so the strongest beam has the largest section modulus Z = bd²/6, where b is the breadth and d the depth of the rectangle inscribed in the circle: b² + d² = D².
Z = b(D² - b²)/6. For a maximum, dZ/db = (D² - 3b²)/6 = 0 → b = D/√3 = 0.577 D.
Then d² = D² - D²/3 = 2D²/3 → d = √(2/3) D = 0.816 D. So d/b = √2 ≈ 1.414.
(d²Z/db² = -b < 0, confirming a maximum.)
Maximum section modulus Zmax = (D/√3)(2D²/3)/6 = D³/(9√3) ≈ 0.064 D³.
Answer: the strongest rectangular beam has breadth D/√3 and depth √(2/3) D (depth/breadth = √2).', null, '[{"point": "Strength in bending ∝ section modulus Z = bd²/6, with b² + d² = D²", "marks": 1}, {"point": "Z = b(D² - b²)/6; dZ/db = (D² - 3b²)/6 = 0 → b = D/√3", "marks": 2}, {"point": "d = √(D² - b²) = √(2/3) D = 0.816 D; d/b = √2 (depth:breadth ≈ 1.41)", "marks": 1}, {"point": "Zmax = D³/(9√3) ≈ 0.064 D³", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'The network of a small construction project awarded to a contractor is shown in the figure. The normal duration, crash duration, normal cost and crash cost of all activities are given below. The indirect cost incurred by the contractor is Nu 5000 per day. If the project is to be completed in sixteen (16) days, find the total cost that would be incurred by the contractor.
Activity (normal duration, crash duration in days; normal cost, crash cost in Nu): P (6, 4; 15000, 25000); Q (5, 2; 6000, 12000); R (5, 3; 8000, 95000); S (6, 3; 7000, 10000); T (3, 2; 6000, 9000); U (2, 1; 4000, 6000); V (4, 2; 20000, 28000).
Network: P precedes Q, R and S; U follows Q; T follows R; V follows S, T and U.', '1. Paths and durations: P-Q-U-V = 6 + 5 + 2 + 4 = 17 days; P-S-V = 6 + 6 + 4 = 16 days; P-R-T-V = 6 + 5 + 3 + 4 = 18 days (critical). Normal project duration = 18 days.
2. Normal direct cost = 15 000 + 6000 + 8000 + 7000 + 6000 + 4000 + 20 000 = Nu 66 000.
3. Cost slope = (crash cost - normal cost)/(normal - crash duration): P = 10 000/2 = 5000; Q = 6000/3 = 2000; R = 87 000/2 = 43 500 (as printed); S = 3000/3 = 1000; T = 3000/1 = 3000; U = 2000/1 = 2000; V = 8000/2 = 4000 Nu/day.
4. Crash 18 → 17 days: only P-R-T-V is critical; the cheapest activity on it is T (Nu 3000/day), crash T by 1 day (to its limit of 2 days). Now P-R-T-V = 17 and P-Q-U-V = 17.
5. Crash 17 → 16 days: both paths must be shortened. Options: P (common, 5000), V (common, 4000), or R plus Q/U (43 500 + 2000). Cheapest is V by 1 day: Nu 4000. Durations: 16, 16, 15.
6. Direct cost = 66 000 + 3000 + 4000 = Nu 73 000. Indirect cost = 16 x 5000 = Nu 80 000.
Total cost for completion in 16 days = 73 000 + 80 000 = Nu 153 000. (Compared with the normal 18 days: 66 000 + 90 000 = Nu 156 000, so crashing to 16 days also saves money.)
Note: if R''s crash cost is a misprint for Nu 9500 (slope 750), crash R twice and U once: direct 66 000 + 750 + 750 + 2000 = 69 500, total Nu 149 500.', null, '[{"point": "Paths: P-Q-U-V = 17, P-S-V = 16, P-R-T-V = 18 days (critical); normal direct cost Nu 66 000", "marks": 1}, {"point": "Cost slopes (Nu/day): P 5000, Q 2000, R 43 500, S 1000, T 3000, U 2000, V 4000", "marks": 1}, {"point": "18 → 17 days: crash T by 1 day (cheapest on the critical path P-R-T-V) + Nu 3000; now P-R-T-V and P-Q-U-V both 17", "marks": 1}, {"point": "17 → 16 days: crash V by 1 day (common to both critical paths, Nu 4000 < R + Q/U = 45 500) + Nu 4000", "marks": 1}, {"point": "Total = direct 66 000 + 7000 + indirect 16 x 5000 = Nu 153 000 (if R''s crash cost were Nu 9500: crash R twice + U, total Nu 149 500)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-network.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A portal frame shown in the figure has a hinge support at joint P and a roller support at joint R. PQ is horizontal (5 m) and QR vertical (10 m). A point load of 50 kN acts at joint R in the horizontal direction. The flexural rigidity EI of each member is 1 x 10⁶ kNm². Under the applied load, find the horizontal displacement of joint R.', 'Reactions: the roller at R gives only a vertical reaction, so the hinge at P takes the horizontal force: HP = 50 kN (opposite to the load). Taking moments about P (R is 5 m to the right of and 10 m below P): VR x 5 + 50 x 10 = 0 → VR = -100 kN (i.e. 100 kN downward); VP = 100 kN upward.
Bending moments: member RQ (y measured up from R): M = 50y, from 0 at R to 500 kNm at Q. Member PQ (x from P): M = 100x, from 0 at P to 500 kNm at Q (joint equilibrium ✓).
Unit load method: apply a unit horizontal load at R; the moments are m = M/50: RQ: m = y; PQ: m = 2x.
δR = Σ ∫ M m dx/EI = (1/EI)[∫₀¹⁰ (50y)(y) dy + ∫₀⁵ (100x)(2x) dx] = (1/EI)[50 x 1000/3 + 200 x 125/3] = (16 666.7 + 8333.3)/EI = 25 000/EI.
With EI = 1 x 10⁶ kNm²: δR = 0.025 m = 25 mm, in the direction of the 50 kN load.', null, '[{"point": "Reactions: HP = 50 kN; ΣMP = 0: VR x 5 + 50 x 10 = 0 → VR = 100 kN downward, VP = 100 kN upward", "marks": 1}, {"point": "BM: QR M = 50y (0 to 500 kNm at Q); PQ M = 100x (0 at P to 500 kNm at Q)", "marks": 1}, {"point": "Unit horizontal load at R: m = M/50 (QR: y; PQ: 2x)", "marks": 1}, {"point": "δ = Σ∫Mm dx/EI = [∫₀¹⁰ 50y² dy + ∫₀⁵ 200x² dx]/EI = (16 667 + 8333)/EI = 25 000/EI", "marks": 1.5}, {"point": "δR = 25 000/10⁶ = 0.025 m = 25 mm (in the direction of the load)", "marks": 0.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-frame-pqr.png')
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Three reservoirs P, Q and R are interconnected by pipes as shown in the figure. The piezometric head at the junction S of the pipes is 100 m. Take g = 9.81 m/s² and density of water 1000 kg/m³. The pipe from S to reservoir R is 180 m long and 45 cm in diameter; the pipes from P and Q are 30 cm in diameter with flow velocities 2.56 m/s and 1.98 m/s. Considering head loss due to friction only (friction factor 0.03 for all pipes), find the height of the water level in the lowermost reservoir R with respect to the datum.', 'Reservoirs P (water level 109 m) and Q (106 m) are both above the piezometric head at S (100 m), so both supply the junction and the combined flow goes to R (continuity at S).
Discharges: area of a 30 cm pipe = (π/4)(0.30)² = 0.0707 m². QP = 0.0707 x 2.56 = 0.181 m³/s; QQ = 0.0707 x 1.98 = 0.140 m³/s. QR = 0.181 + 0.140 = 0.321 m³/s.
Velocity in pipe SR (45 cm): area = (π/4)(0.45)² = 0.159 m²; v = 0.321/0.159 = 2.02 m/s.
Friction loss (Darcy-Weisbach): hf = f L v²/(2 g D) = 0.03 x 180 x 2.02²/(2 x 9.81 x 0.45) = 5.4 x 4.07/8.83 = 2.49 m.
Water level in R = piezometric head at S - hf = 100 - 2.49 = 97.51 m above the datum (exit loss neglected as only friction is considered).', null, '[{"point": "P (109 m) and Q (106 m) are above the junction head (100 m), so both supply S; all flow goes to R", "marks": 1}, {"point": "QP = (π/4)(0.3)² x 2.56 = 0.181 m³/s; QQ = (π/4)(0.3)² x 1.98 = 0.140 m³/s; QR = 0.321 m³/s", "marks": 1.5}, {"point": "Velocity in SR: v = 0.321/((π/4)(0.45)²) = 2.02 m/s", "marks": 1}, {"point": "hf = f L v²/(2gD) = 0.03 x 180 x 2.02²/(2 x 9.81 x 0.45) = 2.49 m", "marks": 1}, {"point": "Water level in R = 100 - 2.49 = 97.51 m above datum", "marks": 0.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-reservoirs.png')
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck.

1. The stiffness of the structural frame. (7 marks)', 'Modulus of elasticity Ec = 5000 √fck = 5000 √25 = 25 000 N/mm² (2.5 x 10⁷ kN/m²).
Column moment of inertia I = b d³/12 = 450 x 450³/12 = 3.417 x 10⁹ mm⁴ (3.417 x 10⁻³ m⁴).
Assuming the floors (beams with slab) are rigid in their own plane and much stiffer than the columns (shear-building idealisation), the lateral stiffness of a column fixed at both ends is k = 12 EI/h³.
EI = 2.5 x 10⁷ x 3.417 x 10⁻³ = 85 430 kNm².
Ground storey (h = 5 m): k = 12 x 85 430/125 = 8201 kN/m per column; storey stiffness K1 = 4 x 8201 = 32 805 kN/m.
First storey (h = 4 m): k = 12 x 85 430/64 = 16 018 kN/m per column; storey stiffness K2 = 4 x 16 018 = 64 072 kN/m.
(The actual stiffness is lower because the beams are flexible; this is an upper bound used for the approximate analysis.)', null, '[{"point": "Ec = 5000√25 = 25 000 MPa; Icol = 450⁴/12 = 3.42 x 10⁹ mm⁴", "marks": 2}, {"point": "Column lateral stiffness (fixed ends, rigid beams) k = 12EI/h³", "marks": 2}, {"point": "Ground storey (h = 5 m): 8201 kN/m per column → 4 columns 32 805 kN/m", "marks": 1.5}, {"point": "First storey (h = 4 m): 16 018 kN/m per column → 64 072 kN/m", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case1.png')
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck.

2. The fundamental natural period of the building frame. (7 marks)', 'The frame is a bare RC moment resisting frame (no infill shown). By IS 1893 (Part 1): 2016 cl 7.6.2 (a): Ta = 0.075 h^0.75, with h = 5 + 4 = 9 m.
Ta = 0.075 x 9^0.75 = 0.075 x 5.196 = 0.39 s.
(A dynamic estimate from T = 2π√(m/k) with the storey stiffnesses above would need the seismic masses of each floor - slab 0.175 x 25 = 4.4 kN/m² plus beams, columns, finishes and part of the live load over the tributary width - which are not fully defined in the case, so the code formula is used.)', null, '[{"point": "Height h = 5 + 4 = 9 m; RC moment resisting frame without infill (IS 1893:2016 cl 7.6.2 a)", "marks": 2}, {"point": "Ta = 0.075 h^0.75 = 0.075 x 9^0.75 = 0.39 s", "marks": 3}, {"point": "Note: a dynamic estimate T = 2π√(m/k) needs the floor masses (slab, beams, columns, finishes), which are not given in full; the code formula is used", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case1.png')
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck.

3. Shear force in each structural member (portal method). (14 marks)', 'Portal method assumptions: (1) points of contraflexure at mid-height of all columns and at mid-span of all beams; (2) each interior column takes twice the horizontal shear of an exterior column (each bay acts as a portal).
Storey shears: first (top) storey V2 = 60 kN; ground storey V1 = 60 + 120 = 180 kN. With 3 bays, exterior : interior : interior : exterior = 1 : 2 : 2 : 1 (total 6 parts).
Column shears:
Top storey: exterior columns AE, DH = 60/6 = 10 kN; interior columns BF, CG = 20 kN.
Ground storey: exterior EI, HL = 180/6 = 30 kN; interior FJ, GK = 60 kN.
Column end moments (= shear x h/2) are needed for the beam shears: top storey exterior 10 x 2 = 20 kNm, interior 40 kNm; ground storey exterior 30 x 2.5 = 75 kNm, interior 150 kNm.
Beam shears (beam end moment x 2/L):
Roof beams AB, BC, CD: end moment at A = 20 kNm → shear = 20/3 = 6.67 kN (each roof beam).
First-floor beams EF, FG, GH: end moment at E = 20 + 75 = 95 kNm → shear = 95/3 = 31.67 kN (each).
Axial forces: exterior columns carry the accumulated beam shears - top storey 6.67 kN, ground storey 6.67 + 31.67 = 38.33 kN (tension on the windward side A-E-I, compression on the leeward side D-H-L); interior columns 0 (beam shears cancel).', null, '[{"point": "Portal method: points of contraflexure at mid-height of columns and mid-span of beams; interior columns take twice the shear of exterior columns", "marks": 3}, {"point": "Storey shears: top 60 kN, ground 60 + 120 = 180 kN; shares 1:2:2:1 (÷6)", "marks": 2}, {"point": "Column shears: top storey - exterior 10 kN, interior 20 kN; ground storey - exterior 30 kN, interior 60 kN", "marks": 4}, {"point": "Beam shears: roof beams 20 x 2/6 = 6.67 kN; first-floor beams (20 + 75) x 2/6 = 31.67 kN", "marks": 3}, {"point": "Column axial forces: exterior columns ±6.67 kN (top) and ±38.33 kN (ground) (tension windward, compression leeward); interior columns 0", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 14,
    1512, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case1.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 8.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck.

4. Bending moment in the structural members. (14 marks)', 'Columns (moment = column shear x half the storey height, equal at top and bottom, zero at mid-height):
Top storey (h/2 = 2 m): exterior AE, DH = 10 x 2 = 20 kNm; interior BF, CG = 20 x 2 = 40 kNm.
Ground storey (h/2 = 2.5 m): exterior EI, HL = 30 x 2.5 = 75 kNm; interior FJ, GK = 60 x 2.5 = 150 kNm. The base moments at I and L are 75 kNm and at J and K 150 kNm.
Beams (from joint equilibrium, beam moments are zero at mid-span):
Roof: at A, beam AB = column moment 20 kNm; at B, 40 kNm is shared 20 + 20; so every roof beam end moment = 20 kNm.
First floor: at E, beam EF = 20 (column above) + 75 (column below) = 95 kNm; at F, 40 + 150 = 190 = 95 + 95; so every first-floor beam end moment = 95 kNm.', null, '[{"point": "Column moments = shear x h/2 at top and bottom: top storey exterior 20 kNm, interior 40 kNm", "marks": 4}, {"point": "Ground storey: exterior 75 kNm, interior 150 kNm (also the base moments at I, J, K, L)", "marks": 4}, {"point": "Roof beams: end moments 20 kNm at every joint (joint equilibrium: interior joints 40 = 20 + 20)", "marks": 3}, {"point": "First-floor beams: end moments 95 kNm (exterior joint 20 + 75; interior joint 40 + 150 = 190 = 95 + 95)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 14,
    1512, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case1', 4, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case1.png')
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 8.5, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Approximate lateral-load analysis of a building frame
You are recruited by a structural design consultancy as an assistant structural designer. The immediate task is to analyse a building frame and verify the results with software. Analyse the given building frame (see the figure) for lateral load by an approximate method.
Frame: three bays of 6.0 m (column lines A, B, C, D); two storeys - ground storey 5.0 m (columns I-E, J-F, K-G, L-H, fixed at the base) and first storey 4.0 m (E-A, F-B, G-C, H-D). Lateral loads: 120 kN at first-floor level (E) and 60 kN at roof level (A). Columns 450 x 450 mm, beams 275 x 450 mm; RC slab 175 mm thick at both floors. Concrete M25, Ec = 5000 √fck.

5. Draw the bending moment diagram for the building frame. (8 marks)', 'The BMD under lateral load is antisymmetric in every member:
Columns: each column moment varies linearly from +value at one end to -value at the other, passing through zero at mid-height - top storey exterior ±20, interior ±40 kNm; ground storey exterior ±75, interior ±150 kNm (base moments 75/150/150/75 kNm).
Beams: each beam moment varies linearly from one end to the other through zero at mid-span - roof beams ±20 kNm, first-floor beams ±95 kNm.
Draw on the tension faces: with the loads acting to the right, the windward face of each column is in tension at the base and the leeward face at the top in each storey, giving the familiar ''zig-zag'' sway pattern. Maximum moments occur at the bases of the interior columns (150 kNm) and at the first-floor beam ends (95 kNm).', null, '[{"point": "Columns: straight lines, zero at mid-height, with the values above at the top and bottom of each column (opposite faces)", "marks": 3}, {"point": "Beams: straight lines, zero at mid-span; 20 kNm at roof beam ends, 95 kNm at first-floor beam ends", "marks": 3}, {"point": "Antisymmetric pattern consistent with sway to the right; larger moments in interior columns and the ground storey", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case1', 5, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case1.png')
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

1. Fixed end moments from the external loading. (2.5 marks)', 'Only beam BC carries a span load (10 kN at mid-span, L = 4 m): MFBC = -WL/8 = -10 x 4/8 = -5.0 kNm; MFCB = +5.0 kNm.
Members AB and CD carry no span loads, so their FEMs are zero; the 50 kN load acts at joint B and is handled in the sway analysis.', null, '[{"point": "Only BC is loaded: FEM = WL/8 = 10 x 4/8 = 5 kNm: MFBC = -5 kNm, MFCB = +5 kNm; AB, CD zero (the 50 kN joint load causes no FEM)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

2. Relative stiffness and distribution factors. (2.5 marks)', 'Lengths: AB = 4 m, BC = 4 m, CD = √(2² + 4²) = 4.472 m. All far ends are fixed or continuous, so k = 4EI/L: kAB = EI, kBC = EI, kCD = 0.894 EI (relative I/L = 0.25 : 0.25 : 0.224).
Distribution factors:
Joint B: DFBA = 1/(1 + 1) = 0.5, DFBC = 0.5.
Joint C: DFCB = 1/(1 + 0.894) = 0.528, DFCD = 0.894/1.894 = 0.472.
Joints A and D are fixed (DF = 0); carry-over factor = 1/2.', null, '[{"point": "Stiffness k = 4EI/L: AB = EI, BC = EI, CD = 4EI/4.472 = 0.894EI (relative I/L: 0.25, 0.25, 0.224)", "marks": 1}, {"point": "DF at B: BA 0.5, BC 0.5; at C: CB 1/1.894 = 0.528, CD 0.472; fixed ends A, D: 0", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2.5,
    270, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

3. Non-sway moments from moment distribution. (7.5 marks)', 'With a horizontal restraint preventing sway, distribute the FEMs (-5 at B on BC, +5 at C on CB):
Cycle 1: balance B (+5 x 0.5 → BA +2.5, BC +2.5) and C (-5 → CB -2.64, CD -2.36); carry over half to the far ends (AB +1.25, CB +1.25, BC -1.32, DC -1.18); repeat balancing until the joint unbalances are negligible.
Converged non-sway moments (kNm, clockwise positive):
MAB = +1.69, MBA = +3.38, MBC = -3.38, MCB = +3.16, MCD = -3.16, MDC = -1.58.
(Joint checks: MBA + MBC = 0, MCB + MCD = 0.)', null, '[{"point": "Balance and carry over (sway prevented by a horizontal restraint at C/B level) until converged", "marks": 3}, {"point": "Results (clockwise +): MAB = +1.69, MBA = +3.38, MBC = -3.38, MCB = +3.16, MCD = -3.16, MDC = -1.58 kNm", "marks": 4.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7.5,
    810, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.5, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

4. Compute the imaginary force ''P'' required to prevent sway (keep the support at the beam level ''C'' intact). (5 marks)', 'From the non-sway moments, find the horizontal reactions: column AB: HA = (MAB + MBA)/4 = (1.69 + 3.38)/4 = 1.27 kN. For the inclined leg CD the horizontal reaction at D is found from moments about C using both the vertical reaction at D (from the beam end shear) and the leg moments, because the leg is inclined.
Horizontal equilibrium of the whole restrained frame then gives the imaginary holding force due to the 10 kN load: P ≈ 2.39 kN (the restraint pushes to the right; without it the frame would sway to the left).
Since the actual frame also carries 50 kN to the right at B, the net force that the restraint would have to resist is 50 - 2.39 = 47.61 kN; this force is applied in the reverse direction in the sway analysis (the frame sways to the right).', null, '[{"point": "Column shears from the non-sway moments: HA = (MAB + MBA)/4; inclined leg: horizontal reaction at D from moments about C including the vertical reaction (leg is inclined)", "marks": 2}, {"point": "Restraint force due to the 10 kN load ≈ 2.39 kN (acting to the right, i.e. the frame would sway left)", "marks": 2}, {"point": "With the 50 kN at B, the net restraint = 50 - 2.39 = 47.61 kN, which must be released in the sway analysis", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 4, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

5. Fixed end moments due to deflection of the frame by an amount Δ (EIΔ = 100). (7.5 marks)', 'Let B and C sway horizontally by Δ (to the right). B moves perpendicular to AB (horizontally). C must move perpendicular to DC: DC has direction (-2, 4), so C moves along (4, 2), i.e. horizontally Δ and vertically Δ/2 (upwards). Hence:
AB: relative transverse displacement Δ over 4 m (chord rotates clockwise): MFAB = MFBA = -6EIΔ/L² = -6 x 100/16 = -37.5 kNm.
CD: C moves Δ√(1² + 0.5²) = 1.118Δ perpendicular to CD (length 4.472 m, L² = 20): MFCD = MFDC = -6 EI(1.118Δ)/20 = -0.3354 x 100 = -33.54 kNm.
BC: C rises Δ/2 relative to B (chord rotates anticlockwise): MFBC = MFCB = +6EI(0.5Δ)/16 = +18.75 kNm.', null, '[{"point": "Sway Δ of B and C to the right: C moves perpendicular to DC, so C also rises Δ/2 (relative to B)", "marks": 2}, {"point": "AB: FEM = -6EIΔ/L² = -6 x 100/16 = -37.5 kNm at both ends", "marks": 2}, {"point": "CD: relative perpendicular displacement = Δ√(1 + 0.25) = 1.118Δ; FEM = -6EI(1.118Δ)/4.472² = -33.54 kNm at both ends", "marks": 2}, {"point": "BC: relative displacement Δ/2 (C up): FEM = +6EI(Δ/2)/16 = +18.75 kNm at both ends", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7.5,
    810, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 5, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

6. Sway moments from moment distribution. (10 marks)', 'Distribute the sway fixed-end moments (AB -37.5/-37.5, BC +18.75/+18.75, CD -33.54/-33.54) using the same distribution factors (B: 0.5/0.5; C: 0.528/0.472) and carry-over 1/2, with the joints free to rotate but the sway held at Δ.
Converged sway moments (kNm, clockwise positive, for EIΔ = 100):
MAB = -33.53, MBA = -29.55, MBC = +29.55, MCB = +28.43, MCD = -28.43, MDC = -30.99.', null, '[{"point": "Distribute the sway FEMs with the same DFs and carry-over factors until converged", "marks": 4}, {"point": "Sway moments (EIΔ = 100, clockwise +): MAB = -33.53, MBA = -29.55, MBC = +29.55, MCB = +28.43, MCD = -28.43, MDC = -30.99 kNm", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 6, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

7. Imaginary horizontal force from the sway analysis on the frame. (5 marks)', 'From the sway moments, the horizontal shear in AB is (33.53 + 29.55)/4 = 15.77 kN; the inclined leg''s horizontal reaction is found from moments about C including the vertical reactions induced by the beam shear (the beam BC carries shear (29.55 + 28.43)/4 = 14.50 kN). Horizontal equilibrium of the frame gives the force required to hold the sway: P'' ≈ 37.87 kN (for EIΔ = 100).
The actual unbalanced horizontal force is 47.61 kN, so the sway moments must be scaled by k = 47.61/37.87 = 1.257 (the true sway is EIΔ ≈ 125.7).', null, '[{"point": "Horizontal force needed to produce this sway = sum of horizontal reactions from the sway moments (inclined leg includes the vertical-reaction effect)", "marks": 2}, {"point": "P'' ≈ 37.87 kN for EIΔ = 100", "marks": 2}, {"point": "Correction factor k = 47.61/37.87 = 1.257", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 7, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

8. Superimposed final moments. (5 marks)', 'Final moment = non-sway moment + 1.257 x sway moment (kNm, clockwise positive):
MAB = 1.69 + 1.257(-33.53) = -40.46
MBA = 3.38 + 1.257(-29.55) = -33.77
MBC = -3.38 + 1.257(29.55) = +33.77
MCB = 3.16 + 1.257(28.43) = +38.90
MCD = -3.16 + 1.257(-28.43) = -38.90
MDC = -1.58 + 1.257(-30.99) = -40.54
(These agree with an exact stiffness-matrix analysis.)', null, '[{"point": "Final = non-sway + k x sway, k = 1.257", "marks": 2}, {"point": "MAB = -40.46, MBA = -33.77, MBC = +33.77, MCB = +38.90, MCD = -38.90, MDC = -40.54 kNm (clockwise +)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 8, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Sway analysis of a portal frame with an inclined leg (moment distribution)
You are directed to analyse a portal frame (see the figure) to compare with the results of a computer model, using the moment distribution method and superimposing the responses from non-sway and sway analyses. Assume EIΔ = 100 to get the moments from the sway analysis.
Frame: A and D fixed. Column AB vertical, 4.0 m; beam BC horizontal, 4.0 m, with a 10 kN vertical point load at its mid-point; leg CD inclined - D is 2.0 m to the right of C and 4.0 m below it (length √20 = 4.472 m). A horizontal load of 50 kN acts at B. EI is the same for all members. Clockwise moments are taken as positive below.

9. Final bending moment diagram for the frame. (5 marks)', 'Draw on the tension faces:
Column AB: linear from 40.5 kNm at A to 33.8 kNm at B on the opposite face; zero at 4 x 40.46/(40.46 + 33.77) = 2.18 m above A.
Beam BC: the sway gives moments of opposite sense at the two ends (33.8 kNm at B, 38.9 kNm at C); the 10 kN load adds a triangular free moment of WL/4 = 10 kNm at mid-span, so the moment at mid-span is about (33.77 - 38.90)/2 + 10 ≈ 7.4 kNm.
Leg CD: linear from 38.9 kNm at C to 40.5 kNm at D on opposite faces; zero about 4.472 x 38.90/(38.90 + 40.54) = 2.19 m from C along the leg.
The diagram shows the typical sway shape: the 50 kN lateral load dominates, with the largest moments at the fixed bases A and D.', null, '[{"point": "Column AB: 40.5 kNm at A and 33.8 kNm at B on opposite faces, contraflexure about 2.2 m above A", "marks": 1.5}, {"point": "Beam BC: end moments 33.8 (B) and 38.9 kNm (C) of opposite sense due to sway, plus the 10 x 4/4 = 10 kNm free moment under the load (≈ 7.4 kNm at mid-span)", "marks": 2}, {"point": "Leg CD: 38.9 kNm at C and 40.5 kNm at D, opposite faces, contraflexure about 2.2 m from C along the leg", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "source": {"title": "BCSE 2021 Main Examination, Technical Paper III, Civil Engineering", "year": 2021, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2021-case2', 9, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2021-case2.png')
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2021 from me_q where key = 'C2Q9' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the maximum strain in concrete at the outermost compression fibre in the limit state of collapse in flexure is taken as', null, 'IS 456 cl 38.1 (a): 0.0035 in bending (0.002 under axial compression).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.0045', false, 1), ('B', '0.003', false, 2), ('C', '0.002', false, 3), ('D', '0.0035', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the IS soil classification system, a fine-grained soil with a liquid limit greater than 50 percent is described as having', null, 'IS 1498: L < 35 %, I 35-50 %, H > 50 % liquid limit (e.g. CH, MH).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'high compressibility', true, 1), ('B', 'no plasticity', false, 2), ('C', 'low compressibility', false, 3), ('D', 'intermediate compressibility', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the Greenshields traffic model with free-flow speed vf and jam density kj, the maximum flow (capacity) of the road is', null, 'q = vf k(1 - k/kj) is maximum at k = kj/2 and v = vf/2: qmax = vf kj/4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '2 vf kj', false, 1), ('B', 'vf kj / 4', true, 2), ('C', 'vf kj / 2', false, 3), ('D', 'vf kj', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a waste with ultimate first-stage BOD L0 and deoxygenation rate constant k (base e, per day), the 5-day BOD is', null, 'BOD exerted in t days: BODt = L0(1 - e^(-kt)); L0 e^(-kt) is the BOD remaining.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'L0 (1 - e^(-k/5))', false, 1), ('B', 'L0 (1 - e^(-5k))', true, 2), ('C', '5 k L0', false, 3), ('D', 'L0 e^(-5k)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For a beam fixed at both ends with span L carrying a central point load W, the fixed-end moment at each support is', null, 'Fixed-end moment = WL/8 (hogging) at each end and WL/8 sagging at mid-span; for a UDL w it is wL²/12.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2021, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'WL/4', false, 1), ('B', 'WL/12', false, 2), ('C', 'WL/8', true, 3), ('D', 'WL/16', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
commit;
