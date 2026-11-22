-- ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For the cantilever beam shown in the figure (fixed at the left end; degrees of freedom at the free end: 1 axial, 2 transverse, 3 rotation), the stiffness coefficient K22 can be written as', null, 'K22 is the transverse force at the free end for a unit transverse displacement with the other degrees of freedom held: 12EI/L³ (6EI/L² couples translation and rotation; 4EI/L is K33).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m1.png')
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3EI/L', false, 1), ('B', '12EI/L³', true, 2), ('C', 'EI/6L²', false, 3), ('D', '6EI/L²', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two pipes, each of diameter d, converge to form a pipe of diameter 2d. If the liquid flows with velocities v1 and v2 in the two pipes, what will be the flow velocity in the third pipe?', null, 'Continuity: (π/4)d²v1 + (π/4)d²v2 = (π/4)(2d)²v3 → v3 = (v1 + v2)/4.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '(v1 + v2)/2', false, 1), ('B', 'v1 + v2', false, 2), ('C', '(v1 + v2)/4', true, 3), ('D', '2(v1 + v2)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements are true? I. The displacement method is more useful when degree of kinematic indeterminacy is greater than the degree of static indeterminacy. II. The displacement method is more useful when degree of kinematic indeterminacy is less than the degree of static indeterminacy. III. The force method is more useful when degree of static indeterminacy is greater than the degree of kinematic indeterminacy. IV. The force method is more useful when degree of static indeterminacy is less than the degree of kinematic indeterminacy.', null, 'Use the method with fewer unknowns: the displacement method when kinematic indeterminacy < static indeterminacy (II), the force method when static < kinematic (IV).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'I and III', false, 1), ('B', 'II and III', false, 2), ('C', 'I and IV', false, 3), ('D', 'II and IV', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The R.L, of the point A which is on the floor is 100 m and back sight reading on A is 2.455 m. If the foresight reading on the point B which is on the ceiling is 2.745 m, the R.L. of point B will be', null, 'For a point on the ceiling the staff is inverted, so its reading is added: RL B = 100 + 2.455 + 2.745 = 105.20 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '105.20 m', true, 1), ('B', '99.71 m', false, 2), ('C', '100.29 m', false, 3), ('D', '94.80 m', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Rise of water table above the ground surface causes', null, 'Water ponding above the ground adds the same γw x h to both total stress and pore pressure - the effective stress does not change.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'increase in pore water pressure but decrease in total stress.', false, 1), ('B', 'equal increase in pore water pressure and total stress.', true, 2), ('C', 'decrease in pore water pressure but increase in total stress.', false, 3), ('D', 'equal decrease in pore water pressure and total stress.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The design of horizontal and vertical alignments, super elevation, gradient is worst affected by', null, 'Design speed governs sight distances, curve radii, super-elevation, transition lengths and gradients.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Length of vehicle', false, 1), ('B', 'Height of vehicle', false, 2), ('C', 'Speed of vehicle', true, 3), ('D', 'Width of vehicle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A vertically immersed surface is shown in the below figure. The distance of its centre of pressure from the water surface is', null, 'Centre of pressure depth h* = x̄ + IG/(A x̄) = x̄ + (bd³/12)/(bd x̄) = d²/(12x̄) + x̄.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m7.png')
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'd²/12 + x̅', false, 1), ('B', '(d²/12 x̅ ) + x̅', true, 2), ('C', 'b²/12 + x̅', false, 3), ('D', '(bd²/12) + x̅', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Slenderness of a column is zero when', null, 'A column braced on all sides throughout its length cannot buckle - its effective length, and hence slenderness, is zero.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Length is twice the radius of gyration.', false, 1), ('B', 'Ends are firmly fixed.', false, 2), ('C', 'Column is supported on all sides throughout the length.', true, 3), ('D', 'Length is equal to radius of gyration.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most economical section of a rectangular channel is one which has hydraulic mean depth or hydraulic radius equal to', null, 'Most economical rectangular section: b = 2y, so R = A/P = 2y²/4y = y/2 (half the depth).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'half the breadth.', false, 1), ('B', 'twice the breadth.', false, 2), ('C', 'twice the depth.', false, 3), ('D', 'half the depth.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Wp and Wf are the weights of a cylinder containing partially compacted and fully compacted concrete. If the compaction factor (Wp/Wf) is 0.95, the workability of concrete is', null, 'Compaction factor 0.95 indicates high workability (about 0.78 very low, 0.85 low, 0.92 medium, 0.95 high).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'very low.', false, 1), ('B', 'high.', true, 2), ('C', 'low.', false, 3), ('D', 'extremely low.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Two different soil types are used as backfill behind a smooth vertical retaining wall as shown in the figure: Soil 1 (top 2 m): γt = 15 kN/m³, c'' = 0, φ'' = 30°; Soil 2 (next 2 m): γt = 20 kN/m³, c'' = 0, φ'' = 40°. The resultant active earth force per unit length (in kN/m) acting on the wall is', null, 'Ka1 = 1/3, Ka2 = (1 - sin40°)/(1 + sin40°) = 0.217. Soil 1: ½ x (1/3)(15 x 2) x 2 = 10.0; soil 2: pressures 0.217 x 30 = 6.52 and 0.217 x 70 = 15.22 kPa → (6.52 + 15.22)/2 x 2 = 21.7; total ≈ 31.7 kN/m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m14.png')
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '31.7', true, 1), ('B', '35.2', false, 2), ('C', '51.8', false, 3), ('D', '57.0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All the members of the planar truss (see figure), have the same properties in terms of area of cross-section (A) and modulus of elasticity (E). For the loads shown on the truss, the statement that correctly represents the nature of forces in the members of the truss is:', null, 'Joint with the downward P (bottom right): the vertical member carries P in tension, the bottom member is zero. Joint with the horizontal P (top left): the top member is in tension, the left vertical is zero. Top-right joint (horizontal support): the diagonal carries √2P in compression. So 2 tension, 1 compression, 2 zero-force members.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m15.png')
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'There are 2 members in tension, 2 members in compression, and 1 zero-force member.', false, 1), ('B', 'There are 2 members in tension, and 3 zero-force members.', false, 2), ('C', 'There are 2 members in tension, 1 member in compression, and 2 zero-force members.', true, 3), ('D', 'There are 3 members in tension, and 2 members in compression.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The factor to be considered for the source of city water supply is', null, 'Selecting a source depends on the quantity and quality of water, its elevation (gravity vs pumping) and the intervening terrain (distance, cost).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'general terrain intervening the area.', false, 1), ('B', 'elevation of the source of water.', false, 2), ('C', 'quantity and quality of the available water.', false, 3), ('D', 'All of the above.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'When footings are to be placed adjacent to an existing structure, the line from the base of the new footing to the bottom edge of the existing footing should be', null, 'The line joining the bottom edges of adjacent footings should not be steeper than 45° (1:1) so the new footing does not load the existing one.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '45 degree', true, 1), ('B', '60 degree', false, 2), ('C', '30 degree', false, 3), ('D', '90 degree', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a combined footing for two columns carrying unequal loads, the maximum hogging bending moment occurs at', null, 'Between the columns the footing bends with tension at the top (hogging); the maximum moment occurs where the shear force is zero.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'a point of zero shear force.', true, 1), ('B', 'more loaded column.', false, 2), ('C', 'A point of the maximum shear force.', false, 3), ('D', 'less loaded column.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The figure shows a simply supported beam PQ of uniform flexural rigidity EI and span L carrying two clockwise moments, M at L/3 and 2M at 2L/3 from P. The slope at P will be', null, 'Slope at the left support due to a clockwise moment M0 at distance b from the right end: θ = M0(L² - 3b²)/(6EIL). M at b = 2L/3: -ML/18EI; 2M at b = L/3: +4ML/18EI. Total = 3ML/18EI = ML/6EI.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m19.png')
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ML/9EI', false, 1), ('B', 'ML/6EI', true, 2), ('C', '0', false, 3), ('D', 'ML/3EI', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The most commonly adopted method to provide super-elevation on roads is by pivoting the road surface about', null, 'Super-elevation is most commonly obtained by rotating the pavement about the centre line (crown), raising the outer edge and lowering the inner edge.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above.', false, 1), ('B', 'inner edge so that outer edge is raised.', false, 2), ('C', 'crown so that outer edge is raised and inner edge is lowered.', true, 3), ('D', 'outer edge do that the inner edge is lowered.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Pick up the correct statement applicable to plate load test:', null, 'IS 1888: the test pit is at least five times the plate width; a central hole the size of the plate is dug to the actual foundation level.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above.', true, 1), ('B', 'At the centre of the test pit, a hole is dug out whose size is kept equal to the size of the test plate.', false, 2), ('C', 'Width of the test pit for plate load test is made five times the width of the plate.', false, 3), ('D', 'Bottom level of the hole dug at the centre of the test pit is kept at the level of actual formation.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The equivalent axial tensile load Pe, which produces an average axial tensile stress in the section equivalent to the combined stress due to axial tension P and bending M, at the extreme fibre of the section, is given by (where Z is the section modulus of the section)', null, 'Extreme fibre stress = P/A + M/Z; the equivalent axial load giving this stress uniformly is Pe = A(P/A + M/Z) = P + MA/Z.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pe = P + MA/Z', true, 1), ('B', 'Pe = P - MA/Z', false, 2), ('C', 'Pe = P + Z/MA', false, 3), ('D', 'Pe = P - Z/MA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The rigid-jointed plane frame QRS shown in the figure (QR horizontal, length L, fixed at Q; RS vertical, length L, fixed at S; EI constant) is subjected to a vertical load P at joint R. Neglect axial deformations. If the support S undergoes a settlement Δ = PL³/(βEI), the vertical reaction at S becomes zero when β is equal to', null, 'For zero force in RS, the settlement must make QR carry all of P as a cantilever while RS only restrains the rotation at R. A stiffness analysis gives Δ = PL³/7.5EI, i.e. β = 7.5 (β = 3 would ignore the rotational restraint of RS).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m26.png')
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.1', false, 1), ('B', '3.0', false, 2), ('C', '48.0', false, 3), ('D', '7.5', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'At a construction site, a contractor plans to make an excavation as shown in the figure below. The water level in the adjacent river is at an elevation of +20.0 m. Unit weight of water is 10 kN/m3. The factor of safety (up to two decimal places) against sand boiling for the proposed excavation is', null, 'Upward water pressure at the top of the sand (elevation 0) = 20 m x 10 = 200 kPa; downward weight of clay below the excavation = 10 m x 20 = 200 kPa; FS = 200/200 = 1.0.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m28.png')
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.5', false, 1), ('B', '2.0', false, 2), ('C', '1.0', true, 3), ('D', '0.75', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'At the foot of a spillway, water flows at a depth of 23 cm with a velocity of 8.1 m/s, as shown in the figure. The flow enters as an M-3 profile in a long, wide rectangular channel with bed slope 1/1800 and Manning''s n = 0.015. A hydraulic jump forms at some distance from the foot of the spillway. Take g = 9.81 m/s². Just before the hydraulic jump, the depth of flow y1 (in m, rounded to 2 decimal places) is', null, 'q = 0.23 x 8.1 = 1.863 m²/s; normal depth (wide channel) yn = (qn/√S)^(3/5) = 1.108 m = y2 of the jump; F2² = q²/(g y2³) = 0.26; y1 = (y2/2)(√(1 + 8F2²) - 1) = 0.42 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-m30.png')
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.42', true, 1), ('B', '4.20', false, 2), ('C', '0.042', false, 3), ('D', '42.0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A rectangular footing is founded at a depth of 2 m below ground level in a c-φ soil with: porosity n ≈ 40 %, G ≈ 2.67, c ≈ 15 kN/m², φ ≈ 30°. The water table is close to the ground surface. If the width of the footing is 3 m, what length is required to carry a gross allowable bearing pressure qa = 455 kN/m² with a factor of safety Fs = 3.0? Use Terzaghi''s theory of general shear failure; for φ = 30° use Nc = 37.2, Nq = 22.5 and Nγ = 19.7.', 'Soil properties: void ratio e = n/(1 - n) = 0.40/0.60 = 0.667. γsat = (G + e)γw/(1 + e) = (2.67 + 0.667) x 9.81/1.667 = 19.6 kN/m³. With the water table at the ground surface, the submerged unit weight γ'' = 19.6 - 9.81 = 9.83 kN/m³ is used in both the q and Nγ terms.
Overburden pressure at founding level: q = γ'' Df = 9.83 x 2 = 19.7 kN/m².
Terzaghi''s equation for a rectangular footing (general shear): qu = c Nc (1 + 0.3 B/L) + q Nq + 0.5 γ'' B Nγ (1 - 0.2 B/L).
Constant terms: c Nc = 15 x 37.2 = 558.0; q Nq = 19.7 x 22.5 = 442.3; 0.5 γ'' B Nγ = 0.5 x 9.83 x 3 x 19.7 = 290.5; sum = 1290.8 kN/m².
Shape terms: 558.0 x 0.3 x 3/L = 502.2/L; -290.5 x 0.2 x 3/L = -174.3/L; net +327.9/L.
Taking the gross allowable pressure as qa = qu/Fs: qu = 3 x 455 = 1365 kN/m².
1365 = 1290.8 + 327.9/L → L = 327.9/74.2 = 4.42 m. Provide a footing about 3 m x 4.5 m.
(If the allowable pressure is defined on the net basis, qa = qnu/Fs + q, then qu = 3(455 - 19.7) + 19.7 = 1325.7 kN/m² and L ≈ 9.4 m - the answer must state which definition is used.)', null, '[{"point": "Unit weights: e = n/(1 - n) = 0.667; γsat = (G + e)γw/(1 + e) = 19.6 kN/m³; γ'' = 9.83 kN/m³ (water table at ground level)", "marks": 1}, {"point": "Overburden q = γ'' Df = 9.83 x 2 = 19.7 kN/m²", "marks": 0.5}, {"point": "Terzaghi rectangular: qu = cNc(1 + 0.3B/L) + qNq + 0.5γ''BNγ(1 - 0.2B/L)", "marks": 1}, {"point": "Required qu = Fs x qa = 3 x 455 = 1365 kN/m²; terms: 558 + 442 + 290.5 = 1290.8 plus (502.2 - 174.3)/L", "marks": 1.5}, {"point": "1365 = 1290.8 + 327.9/L → L ≈ 4.4 m (on the net-pressure basis, qu = 3(455 - 19.7) + 19.7 = 1326 gives L ≈ 9.4 m - state the basis)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A wooden beam 150 mm x 250 mm is simply supported over a span of 5 m. When a concentrated load W is placed at a distance a from the left support, the maximum bending stress in the beam is 11.2 N/mm² and the maximum shear stress is 0.7 N/mm². Determine the load W and the distance a (see the figure).', 'Section: b = 150 mm, d = 250 mm. Z = b d²/6 = 150 x 250²/6 = 1.5625 x 10⁶ mm³; area = 37 500 mm².
Maximum bending moment: Mmax = σ Z = 11.2 x 1.5625 x 10⁶ = 17.5 x 10⁶ Nmm = 17.5 kNm.
Maximum shear force (rectangular section, τmax = 1.5 V/(b d)): Vmax = 0.7 x 37 500/1.5 = 17 500 N = 17.5 kN.
With the load at a from A (a < L/2), the larger reaction is RA = W(L - a)/L; this is the maximum shear, and the maximum moment under the load is RA x a.
So a = Mmax/Vmax = 17.5/17.5 = 1.0 m from the left support.
W = RA x L/(L - a) = 17.5 x 5/4 = 21.9 kN.
(Check: RA = 21.9 x 4/5 = 17.5 kN; M = 17.5 x 1.0 = 17.5 kNm ✓.)', null, '[{"point": "Z = bd²/6 = 150 x 250²/6 = 1.5625 x 10⁶ mm³ → Mmax = 11.2 x 1.5625 x 10⁶ = 17.5 kNm", "marks": 1.5}, {"point": "τmax = 1.5 V/(bd) → Vmax = 0.7 x 150 x 250/1.5 = 17.5 kN", "marks": 1.5}, {"point": "With a < L/2: Vmax = RA = W(L - a)/L and Mmax = RA x a → a = Mmax/Vmax = 1.0 m", "marks": 1}, {"point": "W = 17.5 x 5/(5 - 1) = 21.9 kN", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-beam.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A run-of-river hydel power plant with an installed capacity of 15 000 kW operates at 20 % load factor when it serves as a peak load station. What should be the minimum discharge in the stream so that it may serve as a base load station? The plant efficiency is 80 % under a head of 15 m. Also calculate the maximum load factor of the plant when the discharge in the stream is 30 m³/s.', 'Average power when working at 20 % load factor = 0.20 x 15 000 = 3000 kW.
To run as a base load station, the stream must continuously supply the energy needed for this average output: P = η γw Q H (kW, with γw = 9.81 kN/m³).
3000 = 0.80 x 9.81 x Q x 15 → Q = 3000/117.7 = 25.5 m³/s (minimum stream discharge).
With a stream discharge of 30 m³/s, the continuous power that can be generated = 0.80 x 9.81 x 30 x 15 = 3532 kW.
Maximum load factor = average power/installed capacity = 3532/15 000 = 0.235, i.e. about 23.5 %.', null, '[{"point": "Average load as peak station = 0.20 x 15 000 = 3000 kW", "marks": 1}, {"point": "As a base load station it must supply this continuously: P = ηρgQH → Q = 3000/(0.8 x 9.81 x 15) = 25.5 m³/s", "marks": 2}, {"point": "With Q = 30 m³/s: P = 0.8 x 9.81 x 30 x 15 = 3532 kW", "marks": 1}, {"point": "Maximum load factor = 3532/15 000 = 23.5 %", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 100 m long concrete box-girder bridge rests on four supports - two abutments and two bents, as shown in the figure. The cross-sectional area of the deck is 11 m²; the weight of the bridge is idealised as lumped at deck level; the unit weight of concrete is 25 kN/m³; the weight of the bents may be neglected. Each bent has three 10 m tall circular columns with I = 1.122 x 10¹¹ mm⁴; E = 30 GPa. Calculate the natural vibration frequency of the bridge in the longitudinal direction.', 'Mass: weight of the deck = 100 x 11 x 25 = 27 500 kN; m = 27 500/9.81 = 2803 kN s²/m (2803 tonnes).
Stiffness in the longitudinal direction: the deck moves as a rigid body; at the abutments it sits on bearings that allow longitudinal movement, so the lateral stiffness comes from the columns of the two bents. Each column is fixed at the base and rigidly connected to the deck, so k = 12EI/h³.
EI = 30 x 10⁶ kN/m² x 1.122 x 10⁻¹ m⁴ = 3.366 x 10⁶ kNm² (1.122 x 10¹¹ mm⁴ = 0.1122 m⁴).
k per column = 12 x 3.366 x 10⁶/10³ = 40 392 kN/m; 6 columns: k = 242 352 kN/m.
Natural circular frequency ωn = √(k/m) = √(242 352/2803) = 9.30 rad/s.
Natural frequency fn = ωn/2π = 1.48 Hz; natural period Tn = 1/fn ≈ 0.68 s.', null, '[{"point": "Weight = 100 x 11 x 25 = 27 500 kN → mass m = 27 500/9.81 = 2803 t", "marks": 1}, {"point": "Each column clamped at base and to the (rigid) deck: k = 12EI/h³ = 12 x 30 x 10⁶ x 0.1122/10³ = 40 392 kN/m", "marks": 1.5}, {"point": "6 columns (longitudinal movement resisted by both bents, abutment bearings free): k = 242 352 kN/m", "marks": 1}, {"point": "ωn = √(k/m) = √(242 352/2803) = 9.30 rad/s → fn = 1.48 Hz (Tn ≈ 0.68 s)", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-bridge.png')
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Seismic loads on a Thromde office building, and a sign board
You are an engineer with a company that won a design competition for Thimphu Thromde infrastructure. One component is a Thromde office at Changangkha (plan and section in the figure: 4 bays of 5.0 m by 3 bays of 5.0 m, i.e. 20 m x 15 m; ground storey 4.2 m and three upper storeys of 3.2 m to the roof). The soil is medium stiff and the building is on a raft foundation. The RC frames have brick-masonry infill walls. The lumped dead load is 12 kN/m² on floors and 10 kN/m² on the roof; live load is 4 kN/m² on floors and 1.5 kN/m² on the roof.
Extracts given with the paper (IS 1893 (Part 1): 2016): Z = 0.10, 0.16, 0.24, 0.36 for zones II-V; Ta = 0.09h/√d for buildings with infill; Ah = (Z/2)(Sa/g)/(R/I); Sa/g for medium soil = 2.5 for T < 0.55 s, 1.36/T for 0.55-4.0 s; Qi = VB Wi hi²/ΣWj hj²; minimum ρ = 2.4 % (zone V); importance factor table; Dp = R(hx - hy)ΔaA/hsx with ΔaA/hsx = 0.004.

1 (i). Determine the total seismic weight of the structure by the equivalent static method. (5 marks)', 'Plan area = 20 m x 15 m = 300 m².
Seismic weight of each floor = full dead load + a percentage of the imposed load (IS 1893 (Part 1): 2016 cl 7.3.1: 25 % for imposed loads up to 3 kN/m², 50 % above 3 kN/m²); imposed load on the roof is not considered.
Floors (1st, 2nd, 3rd): 12 x 300 + 0.50 x 4 x 300 = 3600 + 600 = 4200 kN each.
Roof: 10 x 300 = 3000 kN.
Total seismic weight W = 3 x 4200 + 3000 = 15 600 kN.
(The ground-floor slab rests on the raft and is not included.)', null, '[{"point": "Plan area = 20 x 15 = 300 m²", "marks": 1}, {"point": "Floors (1st-3rd): DL 12 x 300 = 3600 + 50 % of LL (LL 4 kN/m² > 3) = 0.5 x 4 x 300 = 600 → 4200 kN each", "marks": 2}, {"point": "Roof: 10 x 300 = 3000 kN (roof live load not included)", "marks": 1}, {"point": "Total W = 3 x 4200 + 3000 = 15 600 kN", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-plan.png')
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Seismic loads on a Thromde office building, and a sign board
You are an engineer with a company that won a design competition for Thimphu Thromde infrastructure. One component is a Thromde office at Changangkha (plan and section in the figure: 4 bays of 5.0 m by 3 bays of 5.0 m, i.e. 20 m x 15 m; ground storey 4.2 m and three upper storeys of 3.2 m to the roof). The soil is medium stiff and the building is on a raft foundation. The RC frames have brick-masonry infill walls. The lumped dead load is 12 kN/m² on floors and 10 kN/m² on the roof; live load is 4 kN/m² on floors and 1.5 kN/m² on the roof.
Extracts given with the paper (IS 1893 (Part 1): 2016): Z = 0.10, 0.16, 0.24, 0.36 for zones II-V; Ta = 0.09h/√d for buildings with infill; Ah = (Z/2)(Sa/g)/(R/I); Sa/g for medium soil = 2.5 for T < 0.55 s, 1.36/T for 0.55-4.0 s; Qi = VB Wi hi²/ΣWj hj²; minimum ρ = 2.4 % (zone V); importance factor table; Dp = R(hx - hy)ΔaA/hsx with ΔaA/hsx = 0.004.

1 (ii). Determine the design base shear. (10 marks)', 'Assumptions (the case does not state them): Thimphu taken in seismic zone V, Z = 0.36; importance factor I = 1.5 (a Thromde office is a critical governance building, Table 8); special RC moment resisting frame with infill, R = 5.
Height h = 4.2 + 3 x 3.2 = 13.8 m. With brick infill: Ta = 0.09h/√d.
Longitudinal (d = 20 m): Ta = 0.09 x 13.8/√20 = 0.28 s. Transverse (d = 15 m): Ta = 0.09 x 13.8/√15 = 0.32 s.
Medium stiff soil: Ta < 0.55 s → Sa/g = 2.5 in both directions.
Ah = (Z/2) x (Sa/g)/(R/I) = 0.18 x 2.5/(5/1.5) = 0.135.
Design base shear VB = Ah W = 0.135 x 15 600 = 2106 kN (both directions here).
Minimum (zone V): ρ W = 0.024 x 15 600 = 374 kN < 2106 kN ✓.
(With zone IV, Z = 0.24: Ah = 0.09 and VB = 1404 kN.)', null, '[{"point": "Assumptions (not given): Thimphu zone V, Z = 0.36; I = 1.5 (Thromde office - critical governance building); R = 5 (special RC MRF)", "marks": 3}, {"point": "h = 4.2 + 3 x 3.2 = 13.8 m; Ta = 0.09h/√d: d = 20 m → 0.28 s; d = 15 m → 0.32 s", "marks": 2}, {"point": "Medium soil, T < 0.55 s → Sa/g = 2.5", "marks": 1}, {"point": "Ah = (0.36/2)(1.5/5)(2.5) = 0.135; VB = 0.135 x 15 600 = 2106 kN (> ρW = 0.024 x 15 600 = 374 kN)", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-plan.png')
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Seismic loads on a Thromde office building, and a sign board
You are an engineer with a company that won a design competition for Thimphu Thromde infrastructure. One component is a Thromde office at Changangkha (plan and section in the figure: 4 bays of 5.0 m by 3 bays of 5.0 m, i.e. 20 m x 15 m; ground storey 4.2 m and three upper storeys of 3.2 m to the roof). The soil is medium stiff and the building is on a raft foundation. The RC frames have brick-masonry infill walls. The lumped dead load is 12 kN/m² on floors and 10 kN/m² on the roof; live load is 4 kN/m² on floors and 1.5 kN/m² on the roof.
Extracts given with the paper (IS 1893 (Part 1): 2016): Z = 0.10, 0.16, 0.24, 0.36 for zones II-V; Ta = 0.09h/√d for buildings with infill; Ah = (Z/2)(Sa/g)/(R/I); Sa/g for medium soil = 2.5 for T < 0.55 s, 1.36/T for 0.55-4.0 s; Qi = VB Wi hi²/ΣWj hj²; minimum ρ = 2.4 % (zone V); importance factor table; Dp = R(hx - hy)ΔaA/hsx with ΔaA/hsx = 0.004.

1 (iii). Determine the lateral force on each floor. (15 marks)', 'Vertical distribution (IS 1893 cl 7.6.3): Qi = VB x Wi hi²/Σ Wj hj².
Level | Wi (kN) | hi (m) | Wi hi² | Qi (kN) | storey shear (kN)
1st floor | 4200 | 4.2 | 74 088 | 2106 x 74 088/1 347 312 = 115.8 | 2106.0 (ground storey)
2nd floor | 4200 | 7.4 | 229 992 | 359.5 | 1990.2
3rd floor | 4200 | 10.6 | 471 912 | 737.7 | 1630.7
Roof | 3000 | 13.8 | 571 320 | 893.0 | 893.0 (top storey)
Σ Wi hi² = 1 347 312; Σ Qi = 2106 kN ✓.
The lateral forces increase with height (largest at the roof); the storey shear increases downwards to the base shear. The forces are shared among the frames in proportion to their stiffness (4 frames in one direction, 5 in the other), plus accidental torsion as per the code.', null, '[{"point": "Qi = VB Wi hi²/Σ Wj hj²; heights 4.2, 7.4, 10.6, 13.8 m", "marks": 3}, {"point": "Wi hi²: 74 088; 229 992; 471 912; 571 320; Σ = 1 347 312", "marks": 4}, {"point": "Q1 = 115.8, Q2 = 359.5, Q3 = 737.7, Q(roof) = 893.0 kN (Σ = 2106 kN)", "marks": 5}, {"point": "Storey shears: 893.0, 1630.7, 1990.2, 2106.0 kN (top to bottom); loading and shear diagrams", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-plan.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 1: Seismic loads on a Thromde office building, and a sign board
You are an engineer with a company that won a design competition for Thimphu Thromde infrastructure. One component is a Thromde office at Changangkha (plan and section in the figure: 4 bays of 5.0 m by 3 bays of 5.0 m, i.e. 20 m x 15 m; ground storey 4.2 m and three upper storeys of 3.2 m to the roof). The soil is medium stiff and the building is on a raft foundation. The RC frames have brick-masonry infill walls. The lumped dead load is 12 kN/m² on floors and 10 kN/m² on the roof; live load is 4 kN/m² on floors and 1.5 kN/m² on the roof.
Extracts given with the paper (IS 1893 (Part 1): 2016): Z = 0.10, 0.16, 0.24, 0.36 for zones II-V; Ta = 0.09h/√d for buildings with infill; Ah = (Z/2)(Sa/g)/(R/I); Sa/g for medium soil = 2.5 for T < 0.55 s, 1.36/T for 0.55-4.0 s; Qi = VB Wi hi²/ΣWj hj²; minimum ρ = 2.4 % (zone V); importance factor table; Dp = R(hx - hy)ΔaA/hsx with ΔaA/hsx = 0.004.

2. A neon sign board is attached to a 5-storey building in Thimphu by two anchors at heights of 12.0 m and 8.0 m. From the elastic analysis under the design seismic load, the deflections of the upper and lower attachments are 35.0 mm and 25.0 mm. Find the design relative displacement. (20 marks)', 'For a non-structural element attached at two levels x and y of the same building, the design relative displacement is Dp = R (δxA - δyA), where δxA and δyA are the elastic deflections at the two attachment levels under the design seismic load, and R is the response reduction factor of the building (the elastic analysis uses forces reduced by R).
Taking R = 5 (special RC moment resisting frame, as assumed for this building):
Dp = 5 x (35.0 - 25.0) = 50 mm.
This need not exceed Dp = R (hx - hy) ΔaA/hsx, where ΔaA/hsx = 0.004 is the allowable storey drift ratio:
Dp,max = 5 x (12 000 - 8000) x 0.004 = 80 mm.
Design relative displacement = 50 mm (< 80 mm). The sign board, its frame and the anchor connections must be detailed (e.g. slotted holes or flexible connection at one anchor) to accommodate 50 mm of relative movement without failure.', null, '[{"point": "Non-structural element connected at two levels of the same building: Dp = R (δxA - δyA) (IS 1893 Part 1 cl 7.13 / non-structural provisions)", "marks": 5}, {"point": "R = 5 (assumed, same as the building): Dp = 5 x (35 - 25) = 50 mm", "marks": 6}, {"point": "Upper limit: Dp ≤ R (hx - hy) ΔaA/hsx = 5 x (12 000 - 8000) x 0.004 = 80 mm", "marks": 6}, {"point": "Design relative displacement = 50 mm (less than the 80 mm limit); the anchors/ sign must accommodate this movement", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case1', 4, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2019-plan.png')
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: 24 x 7 water supply - intake, channel and pipeline
The Royal Government of Bhutan has given top priority to 24 x 7 water supply in all 20 Dzongkhags. A water flagship project office has recruited you as a project engineer, and your first assignment has the following tasks.

1. Compute the discharge in L/s from a rectangular intake weir to be constructed across a running stream at the water source: headwater elevation = 501.00 m; crest elevation = 505.50 m (as printed); tailwater elevation = 500.00 m; weir coefficient = 1.84; crest length = 6.00 m; number of end contractions = 0. (15 marks)', 'Head on the weir: H = headwater - crest. As printed, the crest (505.50 m) is 4.5 m above the headwater (501.00 m), which means no flow over the weir - the crest is evidently meant to be 500.50 m. Then H = 501.00 - 500.50 = 0.50 m.
The tailwater (500.00 m) is below the crest, so the weir flows free (not submerged).
With no end contractions the effective crest length is the full 6.00 m. Francis formula (SI units, C = 1.84): Q = C L H^(3/2) = 1.84 x 6.00 x 0.50^1.5 = 1.84 x 6.00 x 0.3536 = 3.90 m³/s.
Discharge ≈ 3903 L/s.
(If there were n end contractions, L would be reduced to L - 0.1nH.)', null, '[{"point": "Note the data error: the printed crest (505.50 m) is above the headwater (501.00 m), so no flow is possible as printed; read the crest as 500.50 m → head H = 501.00 - 500.50 = 0.50 m", "marks": 4}, {"point": "Tailwater (500.00) is below the crest → free (unsubmerged) flow", "marks": 2}, {"point": "Francis formula (SI): Q = C L H^1.5 = 1.84 x 6.0 x 0.5^1.5 (no end contractions, L effective = 6.0 m)", "marks": 5}, {"point": "Q = 3.90 m³/s = 3903 L/s", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: 24 x 7 water supply - intake, channel and pipeline
The Royal Government of Bhutan has given top priority to 24 x 7 water supply in all 20 Dzongkhags. A water flagship project office has recruited you as a project engineer, and your first assignment has the following tasks.

2. If a discharge of 1000 L/s is to be carried in a trapezoidal channel, calculate the normal depth (in mm) using Manning''s formula: n = 0.013; bed slope = 0.001; side slopes 1H:1V on both sides; bottom width = 1.20 m. Also state the type of flow. (15 marks)', 'Q = 1.0 m³/s, n = 0.013, S = 0.001, b = 1.20 m, z = 1.
A = (b + z y) y = (1.2 + y) y; P = b + 2y√(1 + z²) = 1.2 + 2.828 y; R = A/P.
Manning: Q = (1/n) A R^(2/3) S^(1/2). AR^(2/3) = Qn/√S = 1.0 x 0.013/0.03162 = 0.411.
Trial: y = 0.50 m → A = 0.85, P = 2.614, R = 0.325, AR^(2/3) = 0.402; y = 0.51 m → A = 0.872, R = 0.330, AR^(2/3) = 0.416. Interpolating, yn ≈ 0.506 m.
Normal depth ≈ 506 mm (A = 0.864 m², P = 2.632 m, R = 0.328 m, V = Q/A = 1.16 m/s).
Type of flow: top width T = b + 2zy = 2.21 m; hydraulic depth D = A/T = 0.39 m; Froude number F = V/√(gD) = 1.16/√(9.81 x 0.39) = 0.59 < 1 → subcritical (tranquil) flow; it is steady uniform flow at normal depth on a mild slope (critical depth ≈ 0.37 m < 0.506 m).', null, '[{"point": "A = (b + zy)y = (1.2 + y)y; P = b + 2y√(1 + z²) = 1.2 + 2.828y; R = A/P", "marks": 3}, {"point": "Manning: Q = (1/n) A R^(2/3) S^(1/2) → 1.0 = (1/0.013)(1.2 + y)y R^(2/3)(0.0316); solve by trial", "marks": 4}, {"point": "Normal depth yn ≈ 0.506 m = 506 mm (A = 0.864 m², R = 0.328 m, V = 1.16 m/s)", "marks": 4}, {"point": "Froude number = V/√(gA/T) = 0.59 < 1 → subcritical (tranquil) flow; critical depth ≈ 0.37 m < yn; uniform flow", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case 2: 24 x 7 water supply - intake, channel and pipeline
The Royal Government of Bhutan has given top priority to 24 x 7 water supply in all 20 Dzongkhags. A water flagship project office has recruited you as a project engineer, and your first assignment has the following tasks.

3. Calculate the frictional loss, residual pressure and hydraulic gradient at chainages 0, 100, 200, ..., 1000 m if 150 L/s is conveyed through a plastic pipe (inner diameter 315 mm, friction loss 0.002 m/m). The ground elevation at the start (chainage 0) is 500.00 m, descending at a uniform slope of 1 in 100. Neglect other losses. (20 marks)', 'Velocity in the pipe: V = Q/A = 0.150/((π/4) x 0.315²) = 0.150/0.0779 = 1.92 m/s (acceptable, < 2-3 m/s).
Friction loss: hf = 0.002 m per m of pipe, so cumulative loss = 0.002 x chainage. Hydraulic gradient = 0.002 (2 m per km) throughout.
Taking the hydraulic grade line to start at the ground level of 500.00 m at chainage 0 (zero residual pressure at the start), HGL = 500 - 0.002x, ground level = 500 - 0.01x, and residual pressure head = HGL - ground = 0.008x (m of water).
Chainage (m) | friction loss (m) | HGL (m) | ground (m) | residual pressure (m)
0 | 0.0 | 500.0 | 500.0 | 0.0
100 | 0.2 | 499.8 | 499.0 | 0.8
200 | 0.4 | 499.6 | 498.0 | 1.6
300 | 0.6 | 499.4 | 497.0 | 2.4
400 | 0.8 | 499.2 | 496.0 | 3.2
500 | 1.0 | 499.0 | 495.0 | 4.0
600 | 1.2 | 498.8 | 494.0 | 4.8
700 | 1.4 | 498.6 | 493.0 | 5.6
800 | 1.6 | 498.4 | 492.0 | 6.4
900 | 1.8 | 498.2 | 491.0 | 7.2
1000 | 2.0 | 498.0 | 490.0 | 8.0
The ground falls faster (1 in 100) than the hydraulic gradient (0.002), so the residual pressure rises steadily to 8.0 m (about 78 kPa) at 1000 m. (If the source had a higher water level, add that head to every residual pressure.)', null, '[{"point": "Velocity = 0.15/((π/4)0.315²) = 1.92 m/s; friction loss = 0.002 x chainage (0.2 m per 100 m; 2.0 m at 1000 m)", "marks": 4}, {"point": "Hydraulic grade line from 500.00 m at chainage 0 (pressure head 0 at the start): HGL = 500 - 0.002x", "marks": 4}, {"point": "Ground = 500 - 0.01x; residual pressure head = HGL - ground = 0.008x m (0.8 m per 100 m)", "marks": 4}, {"point": "Table: ch 0 - loss 0, HGL 500.0, ground 500.0, pressure 0; ch 100 - 0.2, 499.8, 499.0, 0.8 m; ... ch 1000 - 2.0, 498.0, 490.0, 8.0 m", "marks": 6}, {"point": "Hydraulic gradient = 0.002 (2 m/km) constant; pressure increases downhill", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper III, Civil Engineering", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2019-case2', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the minimum area of tension reinforcement in a beam is given by As/(bd) =', null, 'IS 456 cl 26.5.1.1 (a): As/(bd) = 0.85/fy (e.g. 0.17 % for Fe 500); maximum 4 % of bD.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.04', false, 1), ('B', '0.4/fy', false, 2), ('C', '0.12/fy', false, 3), ('D', '0.85/fy', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 875 (Part 1), the unit weight of reinforced cement concrete may be taken as', null, 'RCC 25 kN/m³; plain concrete 24 kN/m³; steel 78.5 kN/m³.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '78.5 kN/m³', false, 1), ('B', '25 kN/m³', true, 2), ('C', '22 kN/m³', false, 3), ('D', '24 kN/m³', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Paving bitumen grades such as 60/70 and 80/100 are designated on the basis of the', null, 'The numbers are the range of penetration (in 0.1 mm) at 25 °C; IS 73:2013 now grades bitumen by viscosity (VG-10, VG-30 ...).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'penetration test', true, 1), ('B', 'flash and fire point test', false, 2), ('C', 'softening point test', false, 3), ('D', 'ductility test', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The coefficient of consolidation (cv) of a clay is obtained from the', null, 'cv is found from oedometer time-settlement curves by Casagrande''s log-time or Taylor''s root-time fitting method.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'unconsolidated undrained triaxial test', false, 1), ('B', 'standard Proctor test', false, 2), ('C', 'direct shear test', false, 3), ('D', 'time-settlement readings of the oedometer (consolidation) test', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a flow net for seepage through an isotropic soil, flow lines and equipotential lines intersect at', null, 'In isotropic soil the flow lines and equipotential lines are orthogonal, forming curvilinear squares.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '45°', false, 1), ('B', '90°', true, 2), ('C', '60°', false, 3), ('D', 'any angle', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The ratio of the moment of inertia of a rectangular section about its base to that about its centroidal axis parallel to the base is', null, 'Ibase = bd³/3 and Icentroid = bd³/12, so the ratio is 4 (parallel axis theorem: bd³/12 + bd(d/2)²).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3', false, 1), ('B', '2', false, 2), ('C', '6', false, 3), ('D', '4', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Muskingum method is used for', null, 'Muskingum is a hydrologic channel-routing method using prism and wedge storage (S = K[xI + (1 - x)O]).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'estimating evaporation', false, 1), ('B', 'estimating groundwater recharge', false, 2), ('C', 'channel (flood) routing', true, 3), ('D', 'reservoir routing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In levelling, keeping the back-sight and fore-sight distances equal eliminates errors due to', null, 'Equal sight lengths cancel the collimation (line of sight not horizontal) error and the effects of curvature and refraction.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2019, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'parallax', false, 1), ('B', 'collimation and curvature/ refraction', true, 2), ('C', 'tilt of the staff', false, 3), ('D', 'incorrect staff readings', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N8';
commit;
