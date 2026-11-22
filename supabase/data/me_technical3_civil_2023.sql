-- ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Formation of small patches of plaster, swelling out beyond the plastered surface is known as', null, 'Blistering is the formation of small patches of plaster swelling out beyond the plastered surface (from lime particles slaking after application).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Crazing', false, 1), ('B', 'Flaking', false, 2), ('C', 'Blistering', true, 3), ('D', 'Cracking', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'IS 456-2000 recommends to provide certain minimum steel in RCC beam to', null, 'IS 456 cl 26.5.1.1 sets minimum tension steel so that the beam does not fail suddenly: without it the steel could rupture as soon as the concrete cracks in flexure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'hold the stirrup steel in position.', false, 1), ('B', 'ensure compression failure.', false, 2), ('C', 'provide enough ductility to the beam.', false, 3), ('D', 'avoid rupture of steel in case a flexural failure occurs.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The shape of clay particle is usually', null, 'Clay minerals (kaolinite, illite, montmorillonite) are plate-like: clay particles are flaky.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Angular', false, 1), ('B', 'Tubular', false, 2), ('C', 'Rounded', false, 3), ('D', 'Flaky', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Sand and drain are used to', null, 'Sand drains shorten the drainage path in soft clay, so they accelerate consolidation (they do not reduce the final settlement).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'accelerate the consolidation.', true, 1), ('B', 'increase the permeability.', false, 2), ('C', 'transfer the load.', false, 3), ('D', 'reduce the settlement.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Bitumen felt', null, 'Bitumen felt is a hessian/ fibre base saturated with bitumen, used for water-proofing roofs and as a damp-proof course.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'is used as damp proofing material.', false, 1), ('B', 'is made of bitumen and hessian fibres.', false, 2), ('C', 'is used as water proofing material.', false, 3), ('D', 'All of the above', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The principle of surveying is to work', null, 'The fundamental principle of surveying is to work from the whole to the part, so that errors are controlled and do not accumulate.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'from lower level to the higher level.', false, 1), ('B', 'from higher level to the lower level.', false, 2), ('C', 'from whole to the part.', true, 3), ('D', 'from part to the whole.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a mortar, the binding material is', null, 'In cement mortar the binding material is cement; sand is the fine aggregate (surkhi and cinder are adulterants/ fillers).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cinder', false, 1), ('B', 'Sand', false, 2), ('C', 'Surkhi', false, 3), ('D', 'Cement', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '________________is the method of surveying in which the field observations and plotting proceed simultaneously.', null, 'In plane table surveying the field observations and plotting are done simultaneously in the field.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Chain surveying', false, 1), ('B', 'Plan table surveying', true, 2), ('C', 'Tacheometric surveying', false, 3), ('D', 'Compass surveying', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'To improve the earthquake resistance of a building, provide_________________.', null, 'IS 4326 earthquake-resistant masonry: plinth, lintel and roof bands all improve earthquake resistance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'roof band', false, 1), ('B', 'plinth band', false, 2), ('C', 'lintel band', false, 3), ('D', 'All of the above', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'For quality control of Portland Cement, the essential test done is', null, 'Quality control of cement includes setting time, soundness and standard consistency tests (and fineness, strength).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'All of the above', true, 1), ('B', 'setting time', false, 2), ('C', 'consistency', false, 3), ('D', 'soundness', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'M20 grade of concrete approximates', null, 'Nominal mix M20 ≈ 1:1.5:3 (M15 1:2:4, M25 1:1:2).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', '1: 1.5 : 3 mix', true, 2), ('C', '1: 3: 6 mix', false, 3), ('D', '1 : 1: 2 mix', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Workability of concrete is measured by', null, 'Workability of concrete is measured by the slump test (also compacting factor, Vee-Bee, flow).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vicat apparatus test', false, 1), ('B', 'Minimum void method', false, 2), ('C', 'Talbot richard test', false, 3), ('D', 'Slump test', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '______________is the process of proper and accurate measurement of concrete ingredients for uniformity of proportion.', null, 'Batching is the accurate measurement (by weight or volume) of the concrete ingredients for each mix.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Batching', true, 1), ('B', 'Grading', false, 2), ('C', 'None of the above', false, 3), ('D', 'Curing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The lateral earth pressure on a retaining wall is', null, 'Lateral earth pressure p = K γ z increases linearly with depth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'None of the above', false, 1), ('B', 'proportional to the internal friction of the soil.', false, 2), ('C', 'equal to mass of the soil retained.', false, 3), ('D', 'proportional to the depth of the soil.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A combine footing is adopted when', null, 'A combined footing is used for two columns close together (or near a property line) whose isolated footings would overlap.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'number of columns is two and they are spaced close to each other.', true, 1), ('B', 'number of columns is more than two and they are spaced far apart.', false, 2), ('C', 'there is only one column.', false, 3), ('D', 'number of columns is two and they are spaced far apart.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a cantilever of length L carrying a load whose intensity varies uniformly from zero at the free end to w per unit run at the fixed end, the maximum bending moment (BM) is', null, 'Total load wL/2 acts at L/3 from the fixed end: Mmax = (wL/2)(L/3) = wL²/6.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'wl2/4', false, 1), ('B', 'wl2/6', true, 2), ('C', 'wl2/12', false, 3), ('D', 'wl2/8', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The maximum net pressure intensity causing shear failure of soil, is known as', null, 'The net ultimate bearing capacity is the maximum net pressure intensity at which the soil fails in shear.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Net ultimate bearing capacity', true, 1), ('B', 'Net safe bearing capacity', false, 2), ('C', 'Safe bearing capacity', false, 3), ('D', 'Ultimate bearing capacity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '_________________is the ratio of shearing stress to the shearing strain within elastic limit.', null, 'Shear modulus (modulus of rigidity) G = shear stress / shear strain within the elastic limit.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bulk modulus of elasticity', false, 1), ('B', 'Modulus of elasticity', false, 2), ('C', 'Shear modulus of elasticity', true, 3), ('D', 'Tangant modulus of elasticity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In rolled steel beams, shear force is mostly resisted by', null, 'In rolled I-beams the shear force is resisted mainly by the web; the flanges resist bending.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Web only', true, 1), ('B', 'None of the above', false, 2), ('C', 'Flanges only', false, 3), ('D', 'Web and flanges together', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Unit of kinematic viscosity is', null, 'Kinematic viscosity ν = μ/ρ has units m²/s (stokes in CGS).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'm2/sec', true, 1), ('B', 'kg sec/m2', false, 2), ('C', 'newton sec/m3', false, 3), ('D', 'newton sec/m2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The item of steel work which is measured in square metre (sq.m) is', null, 'Collapsible gates, rolling shutters and steel doors are all measured in square metres (IS 1200).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Collapsible door', false, 1), ('B', 'Rolling shutters', false, 2), ('C', 'All of the above', true, 3), ('D', 'Steel doors', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a compaction test, as the compaction effort is increased, the optimum moisture content', null, 'Higher compaction energy gives a higher maximum dry density at a lower optimum moisture content.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Remains same', false, 1), ('B', 'Decrease', true, 2), ('C', 'Increases', false, 3), ('D', 'Increases first and thereafter decreases', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The point of contraflexure is the point where', null, 'At a point of contraflexure the bending moment changes sign (passes through zero).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'bending moment is minimum.', false, 1), ('B', 'bending moment changes sign.', true, 2), ('C', 'shear force is zero.', false, 3), ('D', 'bending moment is maximum.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The foundation are placed below ground level, to increase', null, 'Foundations are taken below ground level to reach firm soil and give stability against overturning, sliding and scour.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Strength', false, 1), ('B', 'Workability', false, 2), ('C', 'Stability of the structures', true, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The foundation in which a cantilever beam is provided to join two footings, is called as', null, 'A strap footing joins two footings with a strap (cantilever) beam, usually where one column is at the property line.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Raft footing', false, 1), ('B', 'Combined footing', false, 2), ('C', 'Strap footing', true, 3), ('D', 'Strip footing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The brick laid with its breath parallel to the face of a wall, is known as', null, 'A header is laid with its breadth (end) parallel to the face of the wall; a stretcher shows its length.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Closer', false, 1), ('B', 'Header', true, 2), ('C', 'None of the above', false, 3), ('D', 'Stretcher', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are the differences between red bricks and Autoclaved Aerated Cement (AAC) blocks?', '(Note: AAC is ''Autoclaved Aerated Concrete''.)
1. Raw material and manufacture: red bricks are made of clay moulded and burnt in a kiln at about 900-1100 °C; AAC blocks are made of cement, lime, fly ash or fine sand, gypsum and a little aluminium powder - the aluminium reacts to release hydrogen which aerates the mix - and are cured under high-pressure steam in an autoclave.
2. Size: bricks are small (modular 190 x 90 x 90 mm), so more joints and mortar; AAC blocks are large (typically 600 x 200 mm with thickness 100-300 mm), so one block replaces several bricks and work is faster.
3. Weight: red brick density about 1800-2000 kg/m³; AAC about 550-700 kg/m³ - roughly a third, which reduces dead load on frames and foundations and helps in earthquake design.
4. Strength: a good burnt brick is 3.5-10 N/mm² or more; AAC is about 3-4.5 N/mm², adequate for infill walls but used mainly for non-load-bearing walls.
5. Insulation and fire: AAC''s closed air cells give much better thermal and sound insulation and good fire resistance.
6. Workability and finish: AAC is accurate and uniform, can be cut and grooved easily, laid with thin-bed adhesive mortar and needs thinner plaster; bricks vary in size and shape.
7. Water absorption: bricks absorb 15-20 %; AAC absorbs water slowly but must be protected from prolonged wetting.
8. Environment and cost: brick making uses fertile topsoil and burning (smoke, CO2); AAC uses fly ash (an industrial waste) and less energy. AAC costs more per block but saves mortar, plaster, labour and structural cost.', null, '[{"point": "Material and making: red brick - burnt clay, kiln fired; AAC - cement/ lime, fly ash/ sand, gypsum and aluminium powder, aerated and steam cured in an autoclave", "marks": 1}, {"point": "Size and weight: brick 190 x 90 x 90 mm, density ~1800-2000 kg/m³; AAC large blocks (e.g. 600 x 200 x 100-300 mm), 550-700 kg/m³ - lighter, less dead load", "marks": 1.5}, {"point": "Properties: AAC better thermal/ sound insulation and fire resistance, more uniform, faster laying with thin-bed mortar, less mortar and plaster; brick higher compressive strength per unit, more water absorption variation", "marks": 1.5}, {"point": "Use/ cost/ environment: bricks use topsoil and burning (emissions); AAC uses fly ash, eco-friendly; AAC needs care against moisture and fixing; cost comparison", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is concrete curing and describe briefly the various methods of concrete curing? Why the concrete curing is important?', 'Curing is the process of maintaining satisfactory moisture and temperature in freshly placed concrete for a definite period immediately after placing and finishing, so that the hydration of cement continues and the concrete develops its intended properties. IS 456 requires the exposed surfaces to be kept continuously moist for at least 7 days with ordinary Portland cement and at least 10 days with mineral admixtures/ blended cements or in hot, dry weather.
Methods:
1. Ponding - small bunds of mortar/ clay on slabs and floors, filled with water.
2. Spraying or fogging - sprinkling water at intervals so the surface never dries.
3. Wet coverings - hessian, gunny bags, straw or sand kept continuously wet, used for columns, beams and walls.
4. Membrane curing - covering with polythene sheets or spraying a liquid curing compound that forms a film and seals in the mixing water; useful where water is scarce or on vertical and large surfaces (roads).
5. Steam or accelerated curing - for precast elements, to gain early strength.
6. Leaving the formwork in place longer also reduces moisture loss.
Importance: without curing the surface dries, hydration stops and the concrete may reach only 50-60 % of its potential strength. Curing (a) develops the design compressive strength, (b) improves durability and impermeability so reinforcement is protected from corrosion, (c) reduces plastic shrinkage and drying shrinkage cracks, (d) improves surface hardness and abrasion resistance, and (e) improves freeze-thaw and chemical resistance.', null, '[{"point": "Definition: keeping freshly placed concrete moist and at a suitable temperature for a period (min. 7 days OPC, 10 days with blended cement/ hot weather, IS 456) so that hydration continues", "marks": 1.5}, {"point": "Methods: water curing - ponding, spraying/ fogging, wet coverings (hessian, gunny bags, sand); membrane curing - polythene sheets, curing compounds; steam/ accelerated curing for precast; formwork left in place", "marks": 2}, {"point": "Importance: gains design strength, durability and impermeability, reduces plastic and drying shrinkage cracks, better abrasion resistance, protects reinforcement", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What are the steps involved in the concreting process and explain each steps?', '1. Batching: measuring cement, fine aggregate, coarse aggregate, water and admixtures in the correct proportions - preferably by weight (weigh batching) for accuracy, or by volume for small works - allowing for moisture in the aggregates.
2. Mixing: combining the ingredients until the concrete is uniform in colour and consistency - by machine mixer (usually 1.5-2 minutes after all materials are in) or by hand on a clean platform for small jobs (with 10 % extra cement).
3. Transporting: moving the concrete from the mixer to the place of deposit quickly, without segregation, loss of water or slump - by pans, wheelbarrows, buckets and cranes, chutes, belt conveyors, transit mixers or pumps.
4. Placing: depositing concrete in clean, wetted or oiled formwork around fixed and checked reinforcement, within the initial setting time, in layers of about 150-300 mm, with free fall limited (about 1.5 m) to avoid segregation; construction joints planned in advance.
5. Compaction: removing entrapped air to achieve maximum density, using needle (immersion) vibrators, surface or form vibrators, or rodding/ tamping for small works - avoiding over-vibration.
6. Finishing: levelling and smoothing the surface by screeding, floating and trowelling, or giving a textured/ broom finish as needed.
7. Curing: keeping the concrete moist and at suitable temperature for at least 7-10 days (ponding, wet hessian, membranes), then removing formwork after the periods in IS 456 (e.g. slab soffits 3-7 days with props, beams 7-14 days).', null, '[{"point": "Batching - measuring ingredients by weight/ volume as per mix design", "marks": 0.75}, {"point": "Mixing - machine/ hand mixing to a uniform colour and consistency (time, sequence)", "marks": 0.75}, {"point": "Transporting - pans, wheelbarrows, buckets, chutes, transit mixers, pumps, without segregation or loss of slump", "marks": 0.75}, {"point": "Placing - in clean, oiled formwork, within initial setting time, layers, limited free fall (<1.5 m)", "marks": 0.75}, {"point": "Compacting - needle/ surface/ form vibrators or rodding to remove entrapped air", "marks": 0.75}, {"point": "Finishing - screeding, floating, trowelling", "marks": 0.5}, {"point": "Curing - keep moist for the specified period; formwork removal as per IS 456", "marks": 0.75}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Determine the values of reactions at support A and D, maximum bending moment and draw the bending moment diagram (BMD) & shear force diagram (SFD) of the beam shown in the figure. (AD = 8 m simply supported; 4 kN point loads at B and C, 2 m from each support; UDL 2 kN/m on BC = 4 m.)', 'Loads: point loads 4 kN at B (2 m) and C (6 m); UDL 2 kN/m over BC (4 m) = 8 kN acting at mid-span (4 m). Total = 16 kN.
Reactions: taking moments about A: RD x 8 = 4 x 2 + 8 x 4 + 4 x 6 = 8 + 32 + 24 = 64, so RD = 8 kN; RA = 16 - 8 = 8 kN (as expected from symmetry).
Shear force: from A to B, V = +8 kN; at B it drops by 4 to +4 kN; from B to C it decreases at 2 kN/m: V = 4 - 2(x - 2), which is zero at x = 4 m (mid-span) and -4 kN just left of C; at C it drops by 4 to -8 kN; from C to D, V = -8 kN, closed by RD = 8 kN.
Bending moment: MA = 0; MB = 8 x 2 = 16 kNm; maximum where SF = 0, at x = 4 m: M = 8 x 4 - 4 x 2 - 2 x 2 x 1 = 32 - 8 - 4 = 20 kNm; MC = 16 kNm; MD = 0.
SFD: horizontal line +8 from A to B, step to +4, straight sloping line to -4 at C (crossing zero at mid-span), step to -8, horizontal to D.
BMD: straight line 0 to 16 kNm on AB, parabola from 16 up to 20 kNm at mid-span and back to 16 kNm at C, straight line to 0 at D (all sagging). Maximum bending moment = 20 kNm at mid-span.', null, '[{"point": "Total load = 4 + 4 + 2 x 4 = 16 kN; symmetric, so RA = RD = 8 kN (check by moments: RD x 8 = 4 x 2 + 8 x 4 + 4 x 6 = 64)", "marks": 1.5}, {"point": "SF: A-B +8 kN; just right of B +4 kN, falls linearly to 0 at mid-span (4 m) and -4 kN just left of C; C-D -8 kN", "marks": 1}, {"point": "BM: MA = 0, MB = 8 x 2 = 16 kNm, Mmax at mid-span (SF = 0) = 8 x 4 - 4 x 2 - 2 x 2 x 1 = 20 kNm, MC = 16 kNm, MD = 0", "marks": 1.5}, {"point": "Diagrams: SFD rectangles A-B and C-D with sloping line B-C; BMD straight lines A-B, C-D and parabola B-C peaking at 20 kNm", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-beam.png')
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings).

1. Convert the given weights (1st floor 632.43 kN, 2nd floor 632.43 kN, 3rd floor 632.43 kN and roof 363.82 kN) of each floor into masses and calculate the seismic weight of the building. (5 marks)', 'Masses (m = W/g, g = 9.81 m/s²):
1st, 2nd and 3rd floors: m = 632.43/9.81 = 64.47 t (64 468 kg) each.
Roof: m = 363.82/9.81 = 37.09 t (37 087 kg).
Seismic weight of the building W = sum of floor seismic weights = 632.43 x 3 + 363.82 = 2261.11 kN (total seismic mass ≈ 230.5 t).
(Each floor seismic weight is the full dead load plus the appropriate part of the imposed load - 25 % for imposed loads up to 3 kN/m² and 50 % above 3 kN/m² as per IS 1893 cl 7.3.1; imposed load on the roof is not considered.)', null, '[{"point": "Mass = W/g: M1 = M2 = M3 = 632.43/9.81 = 64.47 t (64 468 kg); M4 (roof) = 363.82/9.81 = 37.09 t", "marks": 3}, {"point": "Seismic weight W = 3 x 632.43 + 363.82 = 2261.11 kN (total mass ≈ 230.5 t); floor weights include full DL + 25 % of imposed load ≤ 3 kN/m² (IS 1893 cl 7.3.1), roof imposed load not included", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-frame.png')
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings).

2. Determine the fundamental natural period. (7 marks)', 'Height of the building above the base h = 4 x 3.5 = 14 m.
The building is an RC moment resisting frame with 250 mm brick infill walls, so IS 1893 (Part 1): 2016 cl 7.6.2 (c) applies: Ta = 0.09 h/√d, where d is the base dimension in the direction of the earthquake.
Longitudinal direction (the plane frame shown, d = 2 x 5 = 10 m): Ta = 0.09 x 14/√10 = 1.26/3.162 = 0.398 s.
Transverse direction (d = 2 x 2.5 = 5 m): Ta = 0.09 x 14/√5 = 0.563 s.
(If the infill is ignored and the frame treated as a bare RC MRF, cl 7.6.2 (a): Ta = 0.075 h^0.75 = 0.075 x 14^0.75 = 0.543 s.)
The design below uses Ta = 0.398 s for the longitudinal plane frame.', null, '[{"point": "Height h = 4 x 3.5 = 14 m", "marks": 1}, {"point": "RC MRF with masonry infill (IS 1893:2016 cl 7.6.2 c): Ta = 0.09 h / √d", "marks": 2}, {"point": "Longitudinal (frame shown, d = 10 m): Ta = 0.09 x 14/√10 = 0.398 s; transverse (d = 5 m): 0.563 s", "marks": 3}, {"point": "Note: as a bare RC MRF, Ta = 0.075 h^0.75 = 0.543 s (accept with reason)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 7,
    756, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-frame.png')
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 4.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings).

3. What is base shear of the structure and what does the base shear acting on a building depend on? (8 marks)', 'Base shear (design seismic base shear VB) is the total design lateral force that an earthquake is assumed to apply at the base of a structure. It is the sum of the lateral inertia forces at all floor levels and is used to design the lateral load resisting system: VB = Ah x W (IS 1893 cl 7.5.3), where Ah = (Z/2)(I/R)(Sa/g).
It depends on:
1. Seismic weight (mass) of the building W - heavier buildings attract larger inertia forces; and how the mass is distributed over the height.
2. Seismic zone factor Z - the expected peak ground acceleration of the zone (0.24 for zone IV).
3. Importance factor I - use and consequences of failure (1.0 to 1.5).
4. Response reduction factor R - ductility, redundancy and overstrength of the lateral system (5 for SMRF, 3 for OMRF).
5. Fundamental natural period T (stiffness and height of the building) and soil type, which together give the spectral acceleration coefficient Sa/g from the design spectrum (5 % damping).
6. It may not be less than the minimum ρ W of cl 7.2.2 (1.6 % in zone IV).', null, '[{"point": "Base shear: total design lateral (horizontal) seismic force at the base of the structure, VB = Ah W, distributed to floor levels", "marks": 3}, {"point": "Depends on: seismic weight/ mass (W) and its distribution", "marks": 1}, {"point": "Zone factor Z (seismicity of site)", "marks": 1}, {"point": "Importance factor I (use/ consequences of failure)", "marks": 1}, {"point": "Response reduction factor R (ductility, redundancy of the system)", "marks": 1}, {"point": "Natural period T and soil type → Sa/g (spectrum, 5 % damping)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-frame.png')
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings).

4. Determine the value of the design seismic base shear. (10 marks)', 'Z = 0.24 (zone IV); I = 1.0 (not in the ''important'' list); R = 5.0 (special RC moment resisting frame); soil: rock (Type I/ A).
For rock, Sa/g = 2.5 for 0.10 s ≤ T ≤ 0.40 s. With Ta = 0.398 s, Sa/g = 2.5.
Design horizontal seismic coefficient Ah = (Z/2) x (I/R) x (Sa/g) = (0.24/2) x (1.0/5.0) x 2.5 = 0.12 x 0.2 x 2.5 = 0.06.
Design seismic base shear VB = Ah x W = 0.06 x 2261.11 = 135.67 kN ≈ 135.7 kN.
Minimum (cl 7.2.2, zone IV): ρ W = 0.016 x 2261.11 = 36.2 kN < 135.7 kN, so VB = 135.7 kN governs.
(With the bare-frame period 0.543 s, Sa/g = 1/T = 1.842, Ah = 0.0442 and VB ≈ 100 kN.)', null, '[{"point": "Z = 0.24 (zone IV), I = 1.0 (ordinary building), R = 5 (SMRF)", "marks": 2}, {"point": "Rock (Type I/ A soil), T = 0.398 s in 0.10-0.40 s → Sa/g = 2.5", "marks": 2}, {"point": "Ah = (Z/2)(I/R)(Sa/g) = 0.12 x 0.2 x 2.5 = 0.06", "marks": 3}, {"point": "VB = Ah W = 0.06 x 2261.11 = 135.7 kN; check ≥ ρW = 0.016 x 2261 = 36.2 kN - OK", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case1', 4, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-frame.png')
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic analysis of a four-storey RC frame (equivalent static method)
You are assigned to analyse a four-storey special RC building located in seismic zone IV with the equivalent static lateral force method. Assumed preliminary data for the analysis of the frame (see the figure: plan 2 bays of 5.0 m in the longitudinal direction and 2 x 2.5 m in the transverse direction; plane frame and its lumped-mass model):
1. Type of structure: special RC moment resisting frame
2. Seismic zone: IV
3. Number of storeys: 4 (G+3)
4. Floor to floor height: 3.5 m
5. Materials: concrete M20 and reinforcement Fe 500
6. Column size: 250 x 450 mm
7. Beam sizes: 250 x 400 mm longitudinal, 250 x 350 mm transverse
8. Slab depth: 100 mm
9. Specific weight of RCC: 25 kN/m³
10. Specific weight of infill: 20 kN/m³
11. Type of soil: rock
12. Infill wall thickness: 250 mm
13. Imposed load on 1st, 2nd and 3rd floor: 3.5 kN/m²
14. Imposed load on roof: 0
15. Response spectra: as per IS 1893 (Part 1): 2016
Extracts given with the paper (IS 1893 (Part 1): 2016): zone factor Z = 0.10 (II), 0.16 (III), 0.24 (IV), 0.36 (V); minimum design base shear ρ = 0.7 % (II), 1.1 % (III), 1.6 % (IV), 2.4 % (V) of the seismic weight; importance factor I = 1.5 (important buildings), 1.2 (residential/ commercial with more than 200 persons), 1.0 (all other buildings).

5. Determine the design lateral forces at various floor levels and draw the loading diagram and shear diagram. (20 marks)', 'Vertical distribution (IS 1893 cl 7.6.3): Qi = VB x Wi hi² / Σ Wj hj², with VB = 135.67 kN.
Level | Wi (kN) | hi (m) | Wi hi² | Qi (kN) | storey shear Vi (kN)
Roof | 363.82 | 14.0 | 71 308.7 | 135.67 x 71 308.7/179 770.5 = 53.81 | 53.81 (4th storey)
3rd floor | 632.43 | 10.5 | 69 725.4 | 52.62 | 106.43 (3rd storey)
2nd floor | 632.43 | 7.0 | 30 989.1 | 23.39 | 129.82 (2nd storey)
1st floor | 632.43 | 3.5 | 7 747.3 | 5.85 | 135.67 (ground storey)
Σ Wi hi² = 179 770.5; ΣQi = 135.67 kN = VB (check).
Loading diagram: horizontal arrows at each floor level of the frame/ lumped-mass model - 5.85 kN at 1st floor, 23.39 kN at 2nd, 52.62 kN at 3rd and 53.81 kN at roof (forces increase with height, roughly parabolically).
Shear diagram: storey shear is constant within each storey and steps up going down - 53.81 kN in the top storey, 106.43 kN, 129.82 kN, and 135.67 kN in the ground storey (= base shear). For one plane frame, these forces are shared among the parallel frames in proportion to their stiffness.', null, '[{"point": "Qi = VB Wi hi² / Σ Wj hj² (IS 1893 cl 7.6.3)", "marks": 4}, {"point": "Wi hi²: 632.43 x 3.5² = 7747; 632.43 x 7² = 30 989; 632.43 x 10.5² = 69 725; 363.82 x 14² = 71 309; Σ = 179 770", "marks": 5}, {"point": "Q1 = 5.85 kN, Q2 = 23.39 kN, Q3 = 52.62 kN, Q4 (roof) = 53.81 kN; ΣQ = 135.67 kN", "marks": 5}, {"point": "Storey shears: 4th 53.81, 3rd 106.43, 2nd 129.82, 1st (ground) storey 135.67 kN", "marks": 3}, {"point": "Loading diagram (arrows at each floor, increasing upwards) and stepped shear diagram increasing downwards to VB", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case1', 5, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2023-frame.png')
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Foundation and retaining wall design
Answer both questions. Data given with the paper: shear strength of concrete in punching τc = 0.25 √fck; design shear strength of concrete τc (N/mm²) for M20 against 100As/bd: ≤0.15 - 0.28, 0.25 - 0.36, 0.50 - 0.48, 0.75 - 0.56, 1.00 - 0.62, 1.25 - 0.67, 1.50 - 0.72, 1.75 - 0.75, 2.00 - 0.79, 2.25 - 0.81, ≥2.50 - 0.82; and the SP 16 table of reinforcement percentage for singly reinforced sections (fck = 20 N/mm²).

1. A design for a five-storeyed RCC building was completed, but the client proposes one additional floor (six storeys), so the foundation must be redesigned before construction. Re-determine the size and depth of the isolated square footing with the data below, and check for one-way and two-way shear.
Serviceable axial load 2500 kN; moment about z-axis Mz = 100 kNm; moment about x-axis Mx = 120 kNm; load factor 1.5; column 600 mm x 600 mm; unit weight of soil 18 kN/m³; fck = 20 MPa (M20); fy = 500 MPa (Fe 500); safe bearing capacity 150 kN/m². (25 marks)', '1. Depth of foundation: φ of the soil is not given; assuming φ = 30°, Rankine''s formula gives Df = (q/γ) x ((1 - sin φ)/(1 + sin φ))² = (150/18) x (0.5/1.5)² = 8.33 x 0.111 = 0.93 m. Adopt a founding depth of about 1.5 m below ground (≥ 0.93 m, below topsoil and frost/ scour).
2. Plan size: service load P = 2500 kN; add about 10 % for self-weight of footing and backfill: 2750 kN. For a square footing with biaxial moments, qmax = P/B² + 6Mx/B³ + 6Mz/B³.
Try B = 4.5 m: 2750/20.25 + 6 x 120/91.13 + 6 x 100/91.13 = 135.8 + 7.9 + 6.6 = 150.3 kN/m² > 150 (marginally).
Adopt B = 4.6 m: 2750/21.16 + 720/97.34 + 600/97.34 = 130.0 + 7.4 + 6.2 = 143.5 kN/m² < 150 OK; qmin = 130.0 - 13.6 = 116.4 kN/m² > 0 (no tension).
3. Factored net upward pressure (self-weight excluded): Pu = 1.5 x 2500 = 3750 kN, Mux = 180 kNm, Muz = 150 kNm.
qu,max = 3750/21.16 + 6 x 180/97.34 + 6 x 150/97.34 = 177.2 + 11.1 + 9.2 = 197.6 kN/m². For simplicity it is taken as uniform (conservative).
4. Depth for bending: projection from column face = (4.6 - 0.6)/2 = 2.0 m. Mu = 197.6 x 2.0²/2 = 395.2 kNm per metre width. For Fe 500, Mu,lim = 0.133 fck b d², so d = √(395.2 x 10⁶/(0.133 x 20 x 1000)) = 385 mm. Shear will govern.
5. Two-way (punching) shear at d/2 from the column face: allowable τc = ks x 0.25√fck = 1.0 x 0.25 x √20 = 1.118 N/mm².
Try d = 650 mm: critical square side = 600 + 650 = 1250 mm; Vu = 197.6 x (4.6² - 1.25²) = 3872 kN; capacity = 1.118 x 4 x 1250 x 650 = 3634 kN < 3872 - not OK.
Try d = 700 mm: side 1300 mm; Vu = 197.6 x (21.16 - 1.69) = 3847 kN; capacity = 1.118 x 4 x 1300 x 700 = 4070 kN > 3847 - OK.
6. One-way shear at d from the column face: Vu = 197.6 x (2.0 - 0.70) x 1 = 256.9 kN/m; τv = 256.9 x 10³/(1000 x 700) = 0.367 N/mm². From the table, τc = 0.36 at pt = 0.25 % and 0.48 at 0.50 %, so pt ≥ about 0.27 % is required.
7. Reinforcement: Mu/bd² = 395.2 x 10⁶/(1000 x 700²) = 0.81 → pt = 0.195 % from the SP 16 table (Fe 500, M20); shear needs 0.27 %, so provide pt = 0.27 %: Ast = 0.0027 x 1000 x 700 = 1890 mm²/m → 20 mm bars @ 160 mm c/c (1963 mm²/m) in both directions.
Result: square footing 4.6 m x 4.6 m, overall depth about 760 mm (d = 700 mm, 50 mm clear cover), 20 mm @ 160 c/c both ways, founded at about 1.5 m depth. (Development length and bearing at the column-footing junction should also be checked.)', null, '[{"point": "Depth of foundation (Rankine, assume φ ≈ 30° as φ is not given): Df = (q/γ)((1 - sinφ)/(1 + sinφ))² = (150/18)(1/9) = 0.93 m → about 1.0-1.5 m", "marks": 3}, {"point": "Size: load + 10 % self-weight = 2750 kN; with biaxial moments q = P/A + 6Mx/B³ + 6Mz/B³ ≤ 150: B = 4.5 m gives 150.3 (just over); adopt B = 4.6 m → qmax 143.5, qmin 116.4 kN/m² (no tension)", "marks": 6}, {"point": "Factored net upward pressure: qu = 1.5 x 2500/4.6² + 6 x 1.5(120 + 100)/4.6³ = 177.2 + 20.3 = 197.6 kN/m² (max, used conservatively)", "marks": 3}, {"point": "Bending at column face: cantilever 2.0 m, Mu = 197.6 x 2²/2 = 395 kNm/m; d (flexure) = √(Mu/0.133 fck b) = 385 mm", "marks": 3}, {"point": "Two-way (punching) at d/2: τc = 0.25√20 = 1.118 MPa; d = 700: Vu = 197.6(4.6² - 1.3²) = 3847 kN ≤ 1.118 x 4 x 1300 x 700 = 4070 kN - OK (d = 650 fails)", "marks": 4}, {"point": "One-way at d from face: Vu = 197.6(2.0 - 0.7) = 256.9 kN/m, τv = 0.367 MPa → need pt ≈ 0.27 % (τc 0.36 at 0.25 %)", "marks": 3}, {"point": "Adopt d = 700, D ≈ 760 mm; Ast = 0.27 % = 1890 mm²/m (> flexure 0.195 %) → 20 mm @ 160 c/c both ways; footing 4.6 x 4.6 m at ≈ 1.5 m depth", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Foundation and retaining wall design
Answer both questions. Data given with the paper: shear strength of concrete in punching τc = 0.25 √fck; design shear strength of concrete τc (N/mm²) for M20 against 100As/bd: ≤0.15 - 0.28, 0.25 - 0.36, 0.50 - 0.48, 0.75 - 0.56, 1.00 - 0.62, 1.25 - 0.67, 1.50 - 0.72, 1.75 - 0.75, 2.00 - 0.79, 2.25 - 0.81, ≥2.50 - 0.82; and the SP 16 table of reinforcement percentage for singly reinforced sections (fck = 20 N/mm²).

2. A cantilever retaining wall is required to retain earth 3.8 m high above the ground level. Determine the depth of the foundation, width of the footing and thickness of the base slab and stem. Also check the stability: factor of safety (FOS) against sliding and against overturning. Sketch the retaining wall with dimensions.
Assume unit weight of soil γs = 18 kN/m³, angle of repose φ = 30°, backfill surface inclined at θ = 15°, coefficient of friction μ = 0.5, safe bearing capacity q0 = 150 kN/m², fck = 20 MPa and fy = 500 MPa. (25 marks)', '1. Earth pressure coefficient for sloping backfill (Rankine): Ka = cos θ x (cos θ - √(cos²θ - cos²φ))/(cos θ + √(cos²θ - cos²φ)), with θ = 15°, φ = 30°: cos 15° = 0.966, √(0.933 - 0.75) = 0.428, Ka = 0.966 x 0.538/1.394 = 0.373.
2. Depth of foundation: Df = (q0/γ) x ((1 - sin φ)/(1 + sin φ))² = (150/18) x (1/3)² = 0.93 m → adopt 1.0 m. Total height of the wall H = 3.8 + 1.0 = 4.8 m.
3. Preliminary proportions: base width B ≈ 0.5-0.7 H → adopt 3.0 m; toe projection ≈ B/3 → 1.0 m; base slab thickness ≈ H/12 → 400 mm; stem 400 mm thick at the base tapering to 200 mm at the top; heel = 3.0 - 1.0 - 0.4 = 1.6 m.
4. Stem thickness check: height of stem h = 4.8 - 0.4 = 4.4 m. P = Ka γ h²/2 = 0.373 x 18 x 4.4²/2 = 65.0 kN (parallel to the slope); horizontal component = 65.0 cos 15° = 62.8 kN at h/3; M = 62.8 x 4.4/3 = 92.1 kNm; Mu = 1.5 x 92.1 = 138.1 kNm. Required d = √(138.1 x 10⁶/(0.133 x 20 x 1000)) = 228 mm; provided d ≈ 400 - 50 = 350 mm - OK.
5. Stability (per metre run, concrete 25 kN/m³; soil over the toe neglected):
Earth pressure acts on the vertical plane through the heel end: H'' = 4.8 + 1.6 tan 15° = 4.8 + 0.43 = 5.23 m; P = 0.373 x 18 x 5.23²/2 = 91.8 kN; Ph = 88.6 kN at H''/3 = 1.74 m above the base; Pv = 91.8 sin 15° = 23.8 kN.
Loads and lever arms from the toe:
stem rectangular part 0.2 x 4.4 x 25 = 22.0 kN at 1.30 m → 28.6 kNm
stem triangular part 0.5 x 0.2 x 4.4 x 25 = 11.0 kN at 1.13 m → 12.5 kNm
base slab 3.0 x 0.4 x 25 = 30.0 kN at 1.50 m → 45.0 kNm
soil on heel 1.6 x 4.4 x 18 = 126.7 kN at 2.20 m → 278.8 kNm
sloping soil wedge 0.5 x 1.6 x 0.43 x 18 = 6.2 kN at 2.47 m → 15.2 kNm
vertical component Pv = 23.8 kN at 3.0 m → 71.3 kNm
ΣW = 219.6 kN; resisting moment MR = 451.3 kNm. Overturning moment MO = 88.6 x 1.74 = 154.5 kNm.
FOS against overturning = 451.3/154.5 = 2.92 > 2.0 (and > 1.4 with 0.9 DL per IS 456) - safe.
FOS against sliding = μ ΣW/Ph = 0.5 x 219.6/88.6 = 1.24 < 1.5 (1.4) - not safe: provide a shear key below the stem (e.g. 300 mm wide x 450 mm deep) so that passive resistance in front of the key raises the FOS above 1.5, or widen the base.
Base pressure: x = (MR - MO)/ΣW = (451.3 - 154.5)/219.6 = 1.35 m; e = 1.5 - 1.35 = 0.15 m < B/6 = 0.5 m; qmax = (219.6/3)(1 + 6 x 0.15/3) = 95.0 kN/m², qmin = 51.5 kN/m² - both less than 150 kN/m² and no tension.
Sketch: section showing a 4.8 m high wall - stem 200 mm at top, 400 mm at base; base slab 3.0 m wide x 400 mm thick founded 1.0 m below ground; toe 1.0 m, heel 1.6 m; backfill sloping at 15°; shear key below the stem; weep holes and drainage behind the stem.', null, '[{"point": "Ka for sloping backfill = cosθ (cosθ - √(cos²θ - cos²φ))/(cosθ + √(cos²θ - cos²φ)) = 0.373", "marks": 3}, {"point": "Depth of foundation Df = (q0/γ)((1 - sinφ)/(1 + sinφ))² = 0.93 → 1.0 m; total height H = 4.8 m", "marks": 3}, {"point": "Proportions: base width ≈ 0.6H → 3.0 m; toe ≈ B/3 = 1.0 m; base slab ≈ H/12 → 400 mm; stem 400 mm at base, 200 mm at top; heel 1.6 m", "marks": 4}, {"point": "Stem check: h = 4.4 m, P = Ka γ h²/2 = 65.0 kN, horizontal 62.8 kN, M = 92.1 kNm, Mu = 138 kNm → d = √(Mu/0.133 fck b) = 228 mm < 350 provided - OK", "marks": 3}, {"point": "Earth pressure on the whole wall (vertical plane through heel, H'' = 4.8 + 1.6 tan15° = 5.23 m): P = 91.8 kN, Ph = 88.6 kN at H''/3 = 1.74 m, Pv = 23.8 kN", "marks": 3}, {"point": "Weights and moments about toe: stem 22.0 + 11.0, base 30.0, soil on heel 126.7 + 6.2, Pv 23.8 → ΣW = 219.6 kN, MR = 451.3 kNm; MO = 88.6 x 1.74 = 154.5 kNm", "marks": 4}, {"point": "FOS overturning = 451.3/154.5 = 2.9 > 1.55-2 OK; FOS sliding = 0.5 x 219.6/88.6 = 1.24 < 1.5 → provide a shear key (or wider base); pressure: e = 0.15 m < B/6, qmax = 95, qmin = 51.5 kN/m² < 150 OK; sketch", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Calculations and model answers written by Claude: please check before publishing."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "source": {"title": "BCSE 2023 Main Examination, Technical Paper III, Civil Engineering", "year": 2023, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2023-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2023 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the minimum grade of concrete for reinforced concrete exposed to ''moderate'' conditions is', null, 'IS 456 Table 5: minimum grade for RCC is M20 for mild, M25 for moderate, M30 for severe, M35 very severe and M40 extreme exposure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'M30', false, 1), ('B', 'M20', false, 2), ('C', 'M25', true, 3), ('D', 'M15', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the minimum nominal cover to the longitudinal bars of a column is', null, 'IS 456 cl 26.4.2.1: longitudinal bars in a column - not less than 40 mm nor less than the bar diameter.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '40 mm', true, 1), ('B', '75 mm', false, 2), ('C', '25 mm', false, 3), ('D', '50 mm', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The bulking of sand is maximum at a moisture content of about', null, 'Moist films on the grains push them apart; bulking peaks (20-40 % for fine sand) at about 4-6 % moisture and disappears when the sand is saturated.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '15 - 20 percent', false, 1), ('B', '4 - 6 percent', true, 2), ('C', '10 - 12 percent', false, 3), ('D', '0 - 1 percent', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'As per IS 456:2000, the short-term static modulus of elasticity of concrete (in N/mm²) is taken as', null, 'IS 456 cl 6.2.3.1: Ec = 5000 √fck N/mm²; 0.7 √fck is the flexural strength.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2023, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.7 √fck', false, 1), ('B', '5000 √fck', true, 2), ('C', '1000 fck', false, 3), ('D', '5700 √fck', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
