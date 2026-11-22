-- ME Paper III (Technical, Architecture): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'architecture', 'Architecture' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'architecture') is null then raise exception 'unknown specialisation architecture'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which architectural style is characterized by pointed arches, ribbed vaults, and flying buttresses?', null, 'Pointed arches, ribbed vaults and flying buttresses define Gothic architecture.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Baroque', false, 1), ('B', 'Gothic', true, 2), ('C', 'Renaissance', false, 3), ('D', 'Romanesque', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the function of a lintel in a building structure?', null, 'A lintel spans an opening and carries the load of the wall above it.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To serve as a decorative element', false, 1), ('B', 'To provide additional floor space', false, 2), ('C', 'To support the load above openings like doors and windows', true, 3), ('D', 'To enhance ventilation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which timber joint is known for its strength and is typically used in traditional woodworking to join a horizontal member to a vertical member?', null, 'The mortise and tenon joint is the classic strong joint between horizontal and vertical members.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dovetail joint', false, 1), ('B', 'Scarf joint', false, 2), ('C', 'Mortise and tenon joint', true, 3), ('D', 'Finger joint', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary relationship described by Hooke''s Law?', null, 'Within the elastic limit, stress is directly proportional to strain.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Strain is independent of stress', false, 1), ('B', 'Stress is directly proportional to strain within the elastic limit', true, 2), ('C', 'Stress is equal to strain', false, 3), ('D', 'Stress is inversely proportional to strain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In sustainable architecture, how does thermal mass contribute to indoor comfort in a climate with high diurnal temperature variation?', null, 'Heavy materials absorb heat by day and release it at night, evening out temperature swings.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By preventing any temperature fluctuations', false, 1), ('B', 'By storing heat during the day and releasing it at night', true, 2), ('C', 'By reflecting sunlight away from the building', false, 3), ('D', 'By allowing rapid cooling during the night', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which construction method involves the use of components assembled on-site?', null, 'Prefabricated components are made off-site and assembled on site.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cast-in-place concrete', false, 1), ('B', 'Timber framing', false, 2), ('C', 'Masonry construction', false, 3), ('D', 'Prefabrication', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which orientation is generally best for a building in a temperate climate to optimize passive solar heating?', null, 'A building elongated on an east-west axis exposes its long (south in the northern hemisphere) facade to the winter sun.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'East-West', true, 1), ('B', 'Facing directly into prevailing winds', false, 2), ('C', 'Diagonal to prevailing winds', false, 3), ('D', 'North-South', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the context of structural materials, what does the term "ductility" refer to?', null, 'Ductility is the ability to deform plastically under tensile stress without breaking.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The ability to return to original shape after deformation', false, 1), ('B', 'The ability to withstand compression', false, 2), ('C', 'The ability to deform under tensile stress', true, 3), ('D', 'The ability to resist shear forces', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following materials is most effective at absorbing sound and reducing noise within a space?', null, 'Soft, porous carpet absorbs sound; glass, concrete and metal reflect it.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Glass', false, 1), ('B', 'Carpet', true, 2), ('C', 'Concrete', false, 3), ('D', 'Metal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which typology is predominant vernacular houses in western part of Bhutan?', null, 'Western Bhutan''s vernacular houses typically have rammed-earth walls with internal timber frames and openings.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Stone masonry walls with internal timber frames and openings', false, 1), ('B', 'None of the above', false, 2), ('C', 'Timber frame structure', false, 3), ('D', 'Rammed earth walls with internal timber frames and openings', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The Parthenon, a famous temple in Athens, Greece, is an example of which architectural order?', null, 'The Parthenon is the classic example of the Doric order.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Doric', true, 1), ('B', 'Corinthian', false, 2), ('C', 'Tuscan', false, 3), ('D', 'Ionic', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a passive design strategy for managing solar heat gain?', null, 'Photovoltaic panels generate electricity (active system); they are not a passive shading strategy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Using deciduous trees for seasonal shading', false, 1), ('B', 'Installing photovoltaic panels on the roof', true, 2), ('C', 'Incorporating deep roof overhangs', false, 3), ('D', 'Orienting windows to avoid direct sunlight', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which component of an HVAC system is responsible for removing heat from indoor air?', null, 'The evaporator coil absorbs heat from indoor air.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Furnace', false, 1), ('B', 'Condenser', false, 2), ('C', 'Evaporator coil', true, 3), ('D', 'Air handler', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What style of architecture is the building shown in the photo?', null, 'The building shown (St Peter''s Basilica, Vatican) is a landmark of Renaissance architecture.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), '/papers/me/tech3-arch-2024-mcq16.jpg')
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Postmodern', false, 1), ('B', 'Neoclassical', false, 2), ('C', 'Gothic', false, 3), ('D', 'Renaissance', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '1 inch = ___________ cm', null, '1 inch = 2.54 cm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '3.45', false, 1), ('B', '2.54', true, 2), ('C', '3.54', false, 3), ('D', '2.45', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In structural engineering, what does the term "factor of safety" refer to?', null, 'Factor of safety = failure (ultimate) load / allowable (working) load.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The ratio of the material strength to the design strength', false, 1), ('B', 'The ratio of the ultimate load to the yield load', false, 2), ('C', 'The ratio of the dead load to the live load', false, 3), ('D', 'The ratio of the maximum load to the allowable load', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In painting a surface, the first coat applied is:', null, 'The primer is the first coat, sealing the surface and improving adhesion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Primer', true, 1), ('B', 'Topcoat', false, 2), ('C', 'Undercoat', false, 3), ('D', 'Base', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How does the concept of "defensible space" in architecture aim to influence social behaviour within a community?', null, 'Defensible space (Oscar Newman) uses territoriality and natural surveillance to discourage crime.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'By designing spaces that promote territoriality and natural surveillance', true, 1), ('B', 'By focusing solely on aesthetic appeal without considering social dynamics', false, 2), ('C', 'By creating private areas that prevent social interactions', false, 3), ('D', 'By minimizing the use of public spaces to reduce interaction', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a sustainable building material known for its ability to regulate indoor humidity and reduce energy consumption?', null, 'Bamboo is renewable, low-energy and hygroscopic, helping moderate indoor humidity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aluminium', false, 1), ('B', 'PVC', false, 2), ('C', 'Bamboo', true, 3), ('D', 'Gypsum board', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The significance of heritage sites is determined by the assessment of ______________', null, 'Significance is established by assessing a site''s cultural heritage value (with authenticity and integrity as conditions).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cultural Heritage Value', true, 1), ('B', 'Authenticity', false, 2), ('C', 'Buffer zone', false, 3), ('D', 'Integrity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which property of bricks makes them particularly suitable for use in load-bearing walls?', null, 'Bricks'' high compressive strength and durability suit load-bearing walls.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'High thermal insulation', false, 1), ('B', 'Low compressive strength', false, 2), ('C', 'High compressive strength and durability', true, 3), ('D', 'Flexibility and light weight', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What type of stress is produced when a material is subjected to axial loading?', null, 'Axial loading produces normal (tensile or compressive) stress.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Bending stress', false, 1), ('B', 'Torsional stress', false, 2), ('C', 'Shear stress', false, 3), ('D', 'Normal stress', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain your understanding of sustainable architecture. Identify two sustainable design strategies you would incorporate into a residential project and support your explanation with sketches. (printed as 2+5 marks; marked out of 5)', 'Sustainable architecture is designing and constructing buildings that meet people''s needs while minimising environmental impact over the whole life cycle - using less energy and water, choosing low-impact, local and durable materials, protecting the site and ecology, creating healthy indoor environments and respecting local culture and climate. Strategies for a house: (1) Passive solar design - orient the long side to the south, with larger double-glazed windows on the south and small ones on the north, thermal mass (stone or rammed earth walls/floor) to store daytime heat, roof overhangs sized to shade the summer sun but admit winter sun, and good insulation and airtightness [sketch: section showing sun angles in summer and winter with the overhang]. (2) Rainwater harvesting - collect roof water through gutters and downpipes into a storage tank with first-flush filter for gardening, toilets and washing, with low-flow fixtures and permeable paving to recharge ground water [sketch: roof, gutters, filter, tank and overflow to a soak pit].', null, '[{"point": "Sustainable architecture: designing to minimise environmental impact across the life cycle - energy, water, materials, site, health - while meeting needs and context", "marks": 2}, {"point": "Two strategies explained with sketches, e.g. passive solar design (south glazing, thermal mass, overhangs, insulation) and rainwater harvesting/ greywater reuse; or cross ventilation, local materials, green roof", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
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
  values ('ME', 'short_answer', 'Discuss the significance of site analysis in architectural design. What key factors do you consider during a site analysis, and how do they affect design decisions? Include a graphic representation.', 'Site analysis is the study of the site''s physical, environmental, legal and cultural conditions before design. It is significant because it reveals the constraints and opportunities that shape the building - its siting, orientation, form, access and services - leading to a design that fits its context, is comfortable and energy-efficient, safe and economical, and complies with regulations. Key factors and their impact: topography and contours (stepping the building, cut and fill, drainage); sun path and orientation (placing living rooms and windows for daylight and solar gain); prevailing wind (ventilation, sheltering entrances); climate and rainfall (roof form, overhangs); soil and geology (foundations, slope stability); hydrology and drainage; access, roads and parking (entrance location); views and vistas; existing vegetation; neighbouring buildings, noise and privacy; utilities (water, power, sewer); and zoning rules (setbacks, coverage, height). [Graphic: site plan with north arrow, sun path arc, wind arrows, contours, access road, views and noise sources.]', null, '[{"point": "Significance: understands constraints and opportunities, fits building to context, saves cost, sustainability, regulations", "marks": 2}, {"point": "Factors and impact: topography/ slope and contours, orientation/ sun path, wind, climate, soil/ geology, drainage, access/ roads, views, vegetation, neighbours/ context, utilities, zoning/ setbacks - with diagram", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Describe and sketch the characteristics of a traditional vernacular house in Bhutan.', 'A traditional Bhutanese farmhouse is usually two or three storeys, built on sloping ground facing south or east. Walls: thick rammed-earth walls in western Bhutan or random-rubble stone masonry elsewhere, tapering upwards, sometimes with timber-framed (ekra wattle and daub) upper walls. The ground floor houses animals and storage, with few small openings; the upper floors contain the living rooms, kitchen with hearth, bedrooms and the choesham (altar room), which is the most decorated room. Elaborate timber rabsel (bay windows) with multi-foil arches project on the upper floor, and the timber frame, floors and staircases are joined with traditional joinery without nails. Above the top floor an open attic (jathang) under a gently pitched roof on timber trusses - traditionally shingles held by stones, now often CGI sheets - is used for drying and storing grain and fodder and for ventilation. The facades are painted with traditional motifs and colours. [Labelled sketch: elevation and section showing walls, rabsel, floors, attic space and roof.]', null, '[{"point": "Characteristics: two/ three storeys; rammed earth (west) or stone masonry walls, timber frame; ground floor for animals/ storage; upper floors living, kitchen, choesham (shrine room); rabsel windows; open attic (jathang) under pitched shingle/ CGI roof on trusses for drying; small openings below, larger above; painted motifs; built without nails; orientation and slope", "marks": 3}, {"point": "Labelled sketch (elevation/ section)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Design and sketch a floor plan for a toilet in a low-income housing unit with a maximum area of 2.8 m². Clearly label all fixtures and give accurate wall-to-wall measurements and the positions of fixtures from the internal walls.', 'Example plan: internal size 1.60 m x 1.75 m = 2.80 m². Door: 0.75 m wide on the 1.60 m wall, opening inwards along the wall (or outwards to save space). Shower: 0.90 m x 0.90 m in the far corner opposite the door, with a floor trap and 1:60 slope, and a curtain or low kerb. WC (European or Indian pan): on the long wall next to the shower, centreline 0.45 m from the side wall, with at least 0.60 m clear space in front. Washbasin (about 0.50 x 0.40 m): on the wall beside the door, its centre 0.35 m from the corner, height 0.80 m. A high window or exhaust vent (0.45 x 0.30 m) above the shower for ventilation and light. [The sketch shows the plan with all wall-to-wall dimensions and the distances of each fixture from the internal walls.]', null, '[{"point": "Overall internal size within 2.8 m², e.g. 1.6 m x 1.75 m (or 1.4 x 2.0); door 0.7-0.75 m width, swing not blocking WC", "marks": 1.5}, {"point": "Fixtures: WC (centre ~0.4-0.45 m from side wall, 0.6 m clear in front), washbasin (~0.5 x 0.4 m), shower area (~0.9 x 0.9 m) with floor trap and slope; ventilation/ window", "marks": 2.5}, {"point": "Neat labelled plan with dimensions", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
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
  values ('ME', 'passage', 'Case I: Bhutanese architecture and heritage conservation
Dzongs, as the pinnacle of Bhutanese architecture, embody the spirit and values of different historical phases. Traditional farmhouses and heritage sites carry the knowledge and identity of Bhutanese building culture, and conservation begins with careful documentation and research.

Question 1. Sketch the section of a traditional gable roof of a farmhouse in Bhutan and label all the elements. (15 marks)', 'The section shows: the thick top wall (rammed earth or stone) with a timber wall plate; the top-floor ceiling/floor joists spanning the walls with planks or mud-and-bamboo topping; above them the open attic (jathang) that is not enclosed by walls, allowing air to flow for drying grain; short timber posts and struts standing on the joists supporting the purlins and the ridge beam; rafters and battens on the purlins forming a low-pitched gable roof, raised clear above the walls; the roof covering of wooden shingles weighed down by stones (traditionally) or corrugated iron sheets; and wide eaves overhangs protecting the walls from rain. All elements are labelled (wall, wall plate, joist, ceiling, post/strut, purlin, ridge, rafter, batten, shingle/CGI, stones, eave, attic space). [Expert: Dzongkha terms for each element may be added.]', null, '[{"point": "Correct section: top masonry/ rammed earth wall, wall plate, floor/ ceiling joists, open attic space (jathang)", "marks": 4}, {"point": "Roof frame: posts/ struts on joists, purlins, ridge, rafters, battens; free-standing roof raised above the walls", "marks": 6}, {"point": "Roof covering: wooden shingles (dranshing) held by stones or CGI sheets, eaves overhang; labels neat", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-arch2024-case1', 1, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Bhutanese architecture and heritage conservation
Dzongs, as the pinnacle of Bhutanese architecture, embody the spirit and values of different historical phases. Traditional farmhouses and heritage sites carry the knowledge and identity of Bhutanese building culture, and conservation begins with careful documentation and research.

Question 2. Describe the process of documentation and research in heritage conservation, emphasising the methods and tools used to document a site before conservation work. Give examples of how documentation helps deduce the cultural heritage value of sites, with case examples and illustrations. (10 marks)', 'Before conservation, a site is researched and documented so that its significance is understood and the work respects it. Research includes archival sources (historical texts, namthars, old photographs, previous drawings), oral history from the community, lams and elders about its origin, rituals and changes, and comparison with similar sites. Documentation methods: measured drawings (plans, sections, elevations, details) by hand and with total stations; systematic photography; photogrammetry and 3D laser scanning (and drones for roofs and settings) to produce accurate models; condition surveys mapping cracks, decay and alterations; material and paint analysis; and recording everything in inventory forms and a database/GIS. Documentation helps deduce cultural heritage value by revealing construction phases, original materials and craftsmanship, layout and use of spaces, alterations over time, and the site''s associations with people and rituals - establishing its authenticity and integrity and identifying the most significant elements to protect. Example: the detailed documentation of Wangduephodrang Dzong before and after the 2012 fire enabled its faithful reconstruction; documentation of old rammed-earth houses and lhakhangs by the Department of Culture records their historic value before repair. [Illustrations: measured plan and photographic record.]', null, '[{"point": "Research: archives, history, oral history from community/ elders, previous records, religious and social significance", "marks": 3}, {"point": "Documentation methods/ tools: measured drawings (plans, sections, elevations), photography, photogrammetry, laser scanning, total station/ drone, condition survey and material analysis, inventory forms/ GIS database", "marks": 4}, {"point": "How it deduces value: reveals historic phases, craftsmanship, authenticity, integrity; guides intervention; case examples (e.g. a lhakhang or dzong restoration, Wangduephodrang Dzong after the 2012 fire)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-arch2024-case1', 2, null, null, (select id from public.specialisations where code = 'architecture'), null)
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
  values ('ME', 'passage', 'Case I: Bhutanese architecture and heritage conservation
Dzongs, as the pinnacle of Bhutanese architecture, embody the spirit and values of different historical phases. Traditional farmhouses and heritage sites carry the knowledge and identity of Bhutanese building culture, and conservation begins with careful documentation and research.

Question 3. Ludwig Mies van der Rohe said, ''Architecture is the will of an epoch translated into space.'' Discuss the role of dzong architecture in unifying Bhutan, focusing on its design, form and architectural expression. Give a chronological overview of how dzong architecture evolved with changes in the country''s socio-political system. Highlight three distinct typologies with examples of specific dzongs and sketches of their layouts, identifying key spaces. (25 marks)', 'Role in unification: in the 17th century Zhabdrung Ngawang Namgyal unified Bhutan and established the dual system of governance (chhoesi), with religious and secular authority side by side. Dzongs were his instruments: each was a fortress for defence against Tibetan invasions and local rivals, a monastery for the state clergy and an administrative seat for the penlop or dzongpon. Built at strategic points controlling valleys and routes, with a recognisable architecture, they projected central authority and a shared Drukpa identity across the country, and they still house the dzongkhag administration and monastic body today.
Design, form and expression: massive inward-sloping (battered) white-washed walls of stone or rammed earth with few openings at lower levels; a broad red band (khemar) near the top marking sacred status; a single fortified entrance; courtyards (dochey) dividing the administrative and monastic sections; a central tower (utse) housing the main lhakhangs; tiers of timber rabsels, galleries and painted woodwork on the inner facades; and pitched roofs raised over the walls with gilded finials - all built traditionally without nails or drawings, guided by master builders (zochen).
Chronology: (1) pre-Zhabdrung fortified monasteries and temples (13th-16th centuries) built by religious lineages; (2) the Zhabdrung era (1616-1651): Simtokha (1629, the first dzong combining monastic and administrative functions), Punakha (1637, the winter seat), Wangduephodrang (1638), Paro Rinpung (1646), Trongsa (expanded 1640s); (3) the period of penlops and desis (17th-19th centuries) - dzongs enlarged as regional power centres, rebuilt after fires and earthquakes; (4) the monarchy from 1907 - dzongs became seats of the government and dzongkhag administration; Tashichho Dzong was greatly enlarged in the 1960s-70s as the seat of government; (5) modern times - conservation and reconstruction (Wangduephodrang after the 2012 fire), new dzongs for new dzongkhags, and offices sometimes moved to separate buildings while dzongs keep their religious and symbolic role.
Typologies (with layout sketches labelling entrance, courtyards, utse, lhakhangs, administrative wing, monks'' quarters): (a) compact single-courtyard dzong around a central utse - Simtokha Dzong; (b) linear ridge or spur dzong following a ridge with several courtyards in a row - Trongsa Dzong, Wangduephodrang Dzong on its ridge; (c) valley-floor/ river-confluence dzong with two or more courtyards separating administrative (dzong) and monastic (utse) sections - Punakha Dzong at the confluence of the Pho and Mo Chhu, and Paro Rinpung Dzong. Each typology reflects the site and the political needs of its time, translating the will of the epoch - unification, defence and the dual system - into space.', null, '[{"point": "Role in unification: Zhabdrung Ngawang Namgyal''s 17th-century dzongs as fortress + monastery + administration (dual system, Chhoesi), symbols of authority and identity; strategic locations; unified style", "marks": 7}, {"point": "Design/ form/ expression: massive battered white walls, red band (khemar), central utse tower, courtyards (dochey), rabsels, single entrance, strategic sites (ridges, river confluences), no nails", "marks": 5}, {"point": "Chronology: early fortified temples/ pre-Zhabdrung; 17th century Zhabdrung era (Simtokha 1629, Punakha 1637, Trongsa); later penlops/ desi era expansions; monarchy (1907) - dzongs as seats of dzongkhag administration; modern era renovations, separate administrative buildings, new dzongs (e.g. Tashichho Dzong rebuilt 1960s-70s)", "marks": 7}, {"point": "Three typologies with examples and layout sketches labelling utse, courtyards, lhakhangs, administrative wings, monastic quarters: e.g. ridge-type (Trongsa/ Dagana), confluence/ valley-floor type (Punakha, Wangduephodrang), single-courtyard compact (Simtokha) vs double-courtyard (Punakha/ Paro)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 25,
    2700, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-arch2024-case1', 3, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 15.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 6.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Design competition - a green duplex residence in Bebena, Thimphu
You are invited to a design competition. Project: Design of a Green Duplex Residence in Bebena, Thimphu (UV-2 zoning area). Plot: 600 m² (20 m x 30 m; see the site plan - road along the south side, contours falling from 129.5 to 128 m towards the north, prevailing wind shown).
Programme: 2 master bedrooms with en-suite bathrooms, 2 bedrooms, 1 guest room; a spacious sitting room, a dining area, an open-plan kitchen, two common toilets; and a choeshum for spiritual practice.
Design considerations: green design (passive solar design, natural ventilation, high-performance insulation; rainwater harvesting, low-flow fixtures, sustainable landscaping; local, low-impact materials); biophilic design (maximum natural light, indoor plants, green walls, views, seamless indoor-outdoor flow especially from the sitting room to an open terrace); site-specific design (suitable for UV-2 zoning, sensitive to local culture and aesthetics with modern elements).
Deliverables: concept description (100-200 words), concept sketches, basic drawings (site plan with site and building dimensions, floor plans, at least 2 sections and 4 elevations) and descriptions of other features.

Prepare your competition submission: (a) a brief concept description (100-200 words); (b) sketches supporting the concept; (c) basic drawings - site plan with site and building dimensions, floor plans, at least two sections and four elevations; (d) descriptions of any other features. (50 marks)', 'Concept (example): "Dragon''s Breath House" sits gently on the gentle north-falling slope of the Bebena plot, opening its long south face to the winter sun and its terraces to the views. The duplex steps with the contours, reducing excavation, and is built of local stone, rammed earth and timber with high-performance insulation and double glazing. Living spaces flow onto a sun terrace and garden through large south windows, while a central skylit stair with a green wall brings daylight and greenery into the heart of the home. The upper floor holds the private bedrooms and a quiet choeshum facing east. Rainwater from the roof fills an underground tank, and solar panels and a solar water heater sit discreetly on the traditional raised roof. Rabsel windows, painted cornices and a modern glazed terrace combine Bhutanese identity with contemporary living (about 150 words).
Site and planning: the building footprint (about 12 m x 15 m) is placed within the UV-2 setbacks (e.g. about 3-5 m front setback and required side setbacks - to be checked with Thimphu Thromde rules), with the entrance and parking from the road on the south, the long axis east-west so the main rooms face south, and the garden and terrace on the sunnier side; cross-ventilation openings align with the prevailing wind. Ground floor: entrance foyer, spacious sitting room opening to the terrace, dining area and open-plan kitchen, guest room with access to a common toilet, store and stair. First floor: two master bedrooms with en-suite bathrooms on the south side, two bedrooms, a second common toilet, family lounge and the choeshum in a quiet, elevated east-facing position. Green features: passive solar gain with thermal-mass floors and walls, roof overhangs sized for summer shading, insulation and airtightness, natural cross and stack ventilation through the skylit stair, rainwater harvesting tank, low-flow fixtures, greywater reuse for the garden, solar water heating and PV, LED lighting, and local stone, timber and compressed earth blocks. Biophilic features: maximum daylight, skylights, indoor planting and a green wall, views to the landscape, natural materials and a seamless sitting room-terrace-garden connection. Drawings: site plan with plot (20 x 30 m) and building dimensions, contours, setbacks, access and landscaping; ground- and first-floor plans with labelled, dimensioned rooms; two sections (through the stair/skylight and through the living area showing sun angles and the raised traditional roof); and four elevations showing the stone base, white walls, rabsel windows, cornice band and roof. Other features: drainage swales following the slope, permeable paving, and a small vegetable garden.', null, '[{"point": "Concept (100-200 words) clear, linked to green, biophilic and Bhutanese cultural principles", "marks": 8}, {"point": "Site response: setbacks per UV-2 rules, building on 20 x 30 m plot with access from south road, use of slope (contours 129.5→128 m), orientation for sun (main living to south/ sun) and prevailing wind for cross ventilation, parking, landscaping", "marks": 8}, {"point": "Programme and planning: all required spaces (2 master + en-suite, 2 bedrooms, guest room, sitting, dining, open kitchen, 2 common toilets, choeshum) logically zoned in duplex floors; circulation; choeshum on upper floor in a quiet, respected position", "marks": 10}, {"point": "Green features: passive solar, thermal mass, insulation, double glazing, natural ventilation, rainwater harvesting tank, low-flow fixtures, solar water heating/ PV, local materials (stone, timber, rammed earth/ CSEB)", "marks": 8}, {"point": "Biophilic features: daylight, skylights, indoor plants/ green wall, views, terrace and indoor-outdoor flow, natural materials", "marks": 6}, {"point": "Drawings quality: site plan, plans, 2 sections, 4 elevations with traditional elements (rabsel, roof, cornice) and modern expression; labelled and dimensioned", "marks": 10}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50,
    5400, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Architecture", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-arch2024-case2', 1, null, null, (select id from public.specialisations where code = 'architecture'), '/papers/me/tech3-arch-2024-siteplan.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In traditional Bhutanese buildings, the projecting timber bay window on the upper floor is called a', null, 'The rabsel (rabsey) is the cantilevered timber window bay typical of upper floors of Bhutanese houses.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Chhoesham', false, 1), ('B', 'Dangchu', false, 2), ('C', 'Rabsel', true, 3), ('D', 'Kachen', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main structural function of a column capital (bracket) above a pillar is to', null, 'Brackets/capitals widen the bearing area, transfer beam loads into the column and shorten the effective span of the beam.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Spread the beam load onto the pillar and reduce the beam span', true, 1), ('B', 'Anchor the foundation', false, 2), ('C', 'Decorate the floor', false, 3), ('D', 'Provide ventilation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which international charter is the key reference for the conservation and restoration of monuments and sites?', null, 'The Venice Charter (1964) sets the principles for conserving and restoring monuments and sites; ICOMOS was founded on it.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paris Agreement (2015)', false, 1), ('B', 'Venice Charter (1964)', true, 2), ('C', 'Kyoto Protocol (1997)', false, 3), ('D', 'Athens Charter for urban planning (1933)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In heritage conservation, ''authenticity'' mainly refers to', null, 'Authenticity is the credibility of the information sources about a site - its form, materials, techniques, use and setting.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The size of the buffer zone', false, 1), ('B', 'The number of visitors', false, 2), ('C', 'The age of the building only', false, 3), ('D', 'The genuineness of a site''s form, materials, workmanship and setting', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A ''buffer zone'' around a heritage site is meant to', null, 'Buffer zones control development in the surroundings to protect the site''s setting and values.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Protect the site''s setting by controlling development around it', true, 1), ('B', 'Store construction materials', false, 2), ('C', 'Provide parking only', false, 3), ('D', 'Increase the plot area for new buildings', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which joint is used to join two timber members end to end to make a longer member?', null, 'A scarf joint lengthens timber by joining members end to end with overlapping sloped cuts.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Dovetail joint', false, 1), ('B', 'Scarf joint', true, 2), ('C', 'Mortise and tenon joint', false, 3), ('D', 'Halving corner joint', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of chisel has a curved (U-shaped) cutting edge used for carving hollows?', null, 'A gouge has a curved blade for carving hollows and rounded shapes; the others have flat edges.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gouge', true, 1), ('B', 'Paring chisel', false, 2), ('C', 'Mortise chisel', false, 3), ('D', 'Firmer chisel', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'On a drawing at a scale of 1:100, a wall measuring 4.5 cm represents a real length of', null, 'At 1:100, 1 cm on the drawing = 100 cm = 1 m, so 4.5 cm = 4.5 m.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'architecture'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Architecture): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'architecture'), null)
  returning id
)
insert into me_q select 'N8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.45 m', false, 1), ('B', '45 m', false, 2), ('C', '450 m', false, 3), ('D', '4.5 m', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N8';
commit;
