-- ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'urban-planning', 'Urban Planning' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'urban-planning') is null then raise exception 'unknown specialisation urban-planning'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The FAR and coverage for the building in the figure below (four equal floors; the building footprint covers one quarter of the plot) will be:', null, 'Gross floor area = 4 x (plot/4) = plot area, so FAR = 1; footprint = a quarter of the plot, so coverage = 25%.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), '/papers/me/tech3-urban-2024-far.png')
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 and 200%', false, 1), ('B', '1 and 25%', true, 2), ('C', '1 and 50', false, 3), ('D', '0.5 and 100%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the figure below, the road network in blue is classified as:', null, 'The legend shows blue lines as tertiary roads.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), '/papers/me/tech3-urban-2024-roads.png')
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Primary road', false, 1), ('B', 'Access road', false, 2), ('C', 'Tertiary road', true, 3), ('D', 'Secondary road', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '“Human Scale” is a principle of which of the following urban planning theory:', null, 'Human scale is one of the principles of Intelligent Urbanism (Christopher Benninger), used in Thimphu''s planning.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'New Urbanism', false, 1), ('B', 'Eco City Model', false, 2), ('C', 'Intelligent Urbanism', true, 3), ('D', 'Smart Growth', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who is the author of the award-winning book “A Well Tempered City”?', null, '''The Well-Tempered City'' (2016) was written by Jonathan F. P. Rose.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Le Corbusier', false, 1), ('B', 'Ebenezer Howard', false, 2), ('C', 'Ann Rand', false, 3), ('D', 'Jonathan F.P.Rose', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What would be the FAR for a plot measuring 30 m x 20 m that has one floor measuring 15 m x 10 m and no restriction on coverage?', null, 'FAR = gross floor area / plot area = (15 x 10)/(30 x 20) = 150/600 = 0.25.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0.25', true, 1), ('B', '1.5', false, 2), ('C', '4', false, 3), ('D', '1', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The total land area of Bhutan is:', null, 'Bhutan''s area is usually given as 38,394 sq. km.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '37,252 sq.km', false, 1), ('B', '38,394 sq.km', true, 2), ('C', '37,500 sq.km', false, 3), ('D', '38,494 sq.km', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The founder of the Garden City Movement is:', null, 'Ebenezer Howard founded the Garden City movement (''To-morrow: A Peaceful Path to Real Reform'', 1898).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Henry George', false, 1), ('B', 'Raymond Unwin', false, 2), ('C', 'Edward Bellamy', false, 3), ('D', 'Ebenezer Howard', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The percentage of urban population of Bhutan in 2017 was:', null, 'PHCB 2017: about 37.8% of Bhutan''s population lived in urban areas.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '41%', false, 1), ('B', '37.8%', true, 2), ('C', '35.7%', false, 3), ('D', '39.3%', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Application of proceeds in Land Pooling means:', null, 'Proceeds are the money from the sale of reserve plots or residual land, applied to the project''s costs.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Application to the local government for construction', false, 1), ('B', 'The proceeds of the sale of a reserve plot or residual land', true, 2), ('C', 'Building Tax', false, 3), ('D', 'Building and Planning Permit', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'One or more areas where common land uses and activities are anticipated are called:', null, 'Zones are areas where common land uses and activities are anticipated.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Zones', true, 1), ('B', 'Community', false, 2), ('C', 'Land Use Plans', false, 3), ('D', 'Overlays', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Distance to be kept from landfills is an example of:', null, 'Buffer distances such as from landfills are overlays applied on top of zones.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Overlays', true, 1), ('B', 'Zones', false, 2), ('C', 'Precinct', false, 3), ('D', 'Protected areas', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Explain the concept of Transit-Oriented Development (TOD) and list four of its principles. (5 marks)', 'Transit-Oriented Development is the planning of compact, mixed-use, higher-density neighbourhoods within walking distance (about 400-800 m) of public transport stations or stops, so that people can live, work and shop near transit and rely less on private cars. Principles (ITDP TOD Standard): 1. Walk - safe, active, comfortable streets for pedestrians; 2. Cycle - priority networks for non-motorised transport; 3. Connect - dense, short-block street networks; 4. Transit - development located near high-quality public transport; 5. Mix - mixed land uses and incomes; 6. Densify - density matched to transit capacity; 7. Compact - short distances, infill rather than sprawl; 8. Shift - reduce road and parking space to encourage sustainable modes.', null, '[{"point": "Concept: compact, mixed-use, higher-density development within walking distance (400-800 m) of public transport stations, reducing car dependence", "marks": 2}, {"point": "Principles (any four): walkability, cycling, connectivity/ short blocks, mixed use, density near transit, quality public transport, limited parking, shift to sustainable modes, public spaces", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'short_answer', 'What are the different land mobilisation techniques adopted in Bhutan for urban development? Describe briefly. (5 marks)', '1. Land pooling (land readjustment) - the main technique in Bhutan''s urban local area plans: landowners pool their land, a percentage is contributed for roads, drains, open spaces, public facilities and reserve plots (sold to recover costs), and owners receive back regular, serviced plots of higher value. It avoids large compensation costs and keeps owners on their land. 2. Land acquisition - the government acquires private land for public purposes under the Land Act, paying compensation in cash or giving substitute land (land substitution) elsewhere. 3. Guided land development - the authority plans and provides basic infrastructure (road and service corridors) on private land, guiding owners to develop according to the plan. 4. Use of government land - allotment or lease of state land for housing, institutions and infrastructure, and land exchange where needed.', null, '[{"point": "Land pooling/ readjustment: owners contribute a share of land for roads, services and reserve plots and receive smaller serviced plots back (e.g. Thimphu LAPs)", "marks": 2}, {"point": "Land acquisition with compensation/ land substitution; guided land development; land exchange/ lease of government land; brief description", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'short_answer', 'List down five components/principles of a resilient city. (5 marks)', 'A resilient city can withstand, adapt to and recover quickly from shocks (floods, earthquakes, pandemics) and stresses. Principles (Rockefeller Foundation''s resilience qualities): 1. Reflective - learns from past experience; 2. Robust - well-designed infrastructure that does not fail catastrophically; 3. Redundant - spare capacity and alternative systems (e.g. multiple road and water connections); 4. Flexible - can change and adapt strategies; 5. Resourceful - finds alternative ways to meet needs during a crisis; 6. Inclusive - involves all communities, especially the vulnerable; 7. Integrated - systems and agencies work together. Components include hazard and risk mapping, risk-informed land use, resilient infrastructure, protecting natural buffers (rivers, forests), early warning and emergency preparedness, and good governance.', null, '[{"point": "Any five principles with brief meaning: reflective, robust, redundant, flexible, resourceful, inclusive, integrated (Rockefeller 100RC); or risk assessment, resilient infrastructure, ecosystem protection, preparedness/ early warning, governance, social cohesion", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'short_answer', 'List down any five principles of Smart Growth. (5 marks)', 'Smart Growth principles (US Smart Growth Network): 1. Mix land uses; 2. Take advantage of compact building design; 3. Create a range of housing opportunities and choices; 4. Create walkable neighbourhoods; 5. Foster distinctive, attractive communities with a strong sense of place; 6. Preserve open space, farmland, natural beauty and critical environmental areas; 7. Strengthen and direct development towards existing communities (infill); 8. Provide a variety of transport choices; 9. Make development decisions predictable, fair and cost-effective; 10. Encourage community and stakeholder collaboration in development decisions.', null, '[{"point": "Any five of the ten principles: mixed land uses; compact building design; range of housing choices; walkable neighbourhoods; distinctive communities with sense of place; preserve open space, farmland, natural beauty; strengthen existing communities (infill); variety of transport choices; predictable, fair, cost-effective decisions; community and stakeholder collaboration", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'passage', 'Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas.

a) Analyses. (10 marks)', 'Analyses would include: (1) regional context and connectivity - Gelephu''s location on the southern border with access to India''s markets, road, rail and air links; (2) physical analysis - topography, rivers and floodplains, forests, wildlife corridors and agricultural land, soils and geology; (3) hazards and climate - flooding from rivers and streams, heat and humidity, earthquakes, climate change projections; (4) existing settlements - the current town, villages and land ownership, land use and infrastructure (water, sewerage, power, roads); (5) socio-economic study - population and migration projections, employment, skills and potential economic sectors (green industries, services, education, health, tourism, agriculture); (6) cultural and heritage assets; (7) institutional and legal framework; and (8) a SWOT analysis summarising strengths (location, land, national vision), weaknesses (infrastructure, floods, skills), opportunities (investment, connectivity, green economy) and threats (environmental damage, speculation, social displacement). Analyses use GIS mapping, field surveys and stakeholder consultations.', null, '[{"point": "Site and context analysis: location (southern border, plains, connectivity to India/ Assam, airport, rail), topography, rivers/ floodplains, forests, wildlife corridors, climate and hazards (floods, heat)", "marks": 5}, {"point": "Socio-economic and institutional: existing town and villages, land ownership, population projections, economy, infrastructure gaps; SWOT analysis", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case1', 1, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'passage', 'Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas.

b) Visioning exercise and planning principles to be adopted. (10 marks)', 'Visioning: a participatory process involving residents and landowners, local government, national agencies, experts, youth and investors through workshops and surveys, leading to a shared vision such as ''a mindful, green and prosperous city where people, culture and nature thrive together''. Planning principles: (1) Gross National Happiness and mindfulness as the guiding values - wellbeing, community and contemplative spaces; (2) nature first - protect rivers, floodplains, forests and wildlife corridors as a blue-green network and build in harmony with nature; (3) carbon-neutral, climate-resilient development - renewable energy, green buildings, flood-sensitive design; (4) compact, walkable, mixed-use neighbourhoods with public and non-motorised transport; (5) cultural promotion - Bhutanese architecture and identity, spaces for festivals, arts and spiritual practice; (6) inclusive and affordable - housing and services for all incomes; (7) a vibrant, sustainable economy - clean industries, knowledge, services and agriculture; (8) good governance and smart, efficient services.', null, '[{"point": "Visioning: participatory process (citizens, local government, experts, investors), shared vision statement reflecting GNH, mindfulness, culture, economy, sustainability", "marks": 4}, {"point": "Principles: GNH and mindfulness, nature first (protect rivers, forests, corridors - development in harmony), compact walkable mixed use, carbon neutral/ green infrastructure, culture and heritage, inclusive and affordable, resilience, smart/ economic opportunity", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case1', 2, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'passage', 'Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas.

c) Concepts/ proposals for the city. (15 marks)', 'Spatial concept: a network of compact, walkable neighbourhoods and mixed-use nodes connected by a public transit spine (electric buses or light rail), set within a continuous blue-green network of rivers, wetlands, forests and farmland that also acts as flood protection and wildlife corridors. Proposals: (1) a cultural and mindfulness core with a dzong-inspired civic centre, meditation and retreat centres, monasteries, cultural institutes and public squares for festivals; (2) riverfront parks and floodplain parks that absorb floods, with buildings set back and raised; (3) economic districts - clean industry and logistics near the border and rail, a knowledge and education hub, health and wellness tourism, IT and green finance; (4) agricultural belts and urban farming for food security; (5) mixed-income housing neighbourhoods with schools, clinics and markets within a 10-minute walk; (6) green buildings using Bhutanese architecture, local materials and passive design for the hot, humid climate; (7) renewable energy (hydro, solar), rainwater harvesting, decentralised wastewater treatment, zero-waste management; (8) walkable shaded streets, cycle lanes and limited car use in the centre; (9) smart city systems for services and governance. These proposals realise the vision of a city combining mindfulness, culture, nature and prosperity.', null, '[{"point": "Spatial concept: compact nodes/ neighbourhoods linked by transit along a spine, separated by green and blue corridors; zoning of economic, residential, cultural/ spiritual, education/ health districts", "marks": 6}, {"point": "Specific proposals: mindfulness and cultural centres, meditation parks, riverfront parks, flood-resilient design, green buildings, renewable energy, walkable streets/ cycling/ e-transit, affordable housing, eco-industrial and knowledge zones, agriculture belts, smart infrastructure", "marks": 6}, {"point": "Coherence with vision and principles; justification and feasibility", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case1', 3, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas.

d) Implementation framework. (10 marks)', 'Implementation framework: (1) institutions - a dedicated city development authority with clear powers, coordinating national ministries, the Dzongkhag and Thromde, utility agencies and private developers; (2) legal and regulatory - the master plan, zoning and development control regulations, design codes and environmental safeguards, with streamlined permitting; (3) land mobilisation - land pooling for urban areas, land acquisition with fair compensation or land substitution, and protecting landowners'' interests; (4) phasing - Phase 1 (0-5 years): trunk infrastructure, flood protection, the first neighbourhood and core facilities; Phase 2 (5-15 years): expansion of economic districts and housing; Phase 3 (15+ years): full build-out, reviewed periodically; (5) financing - public investment, public-private partnerships, foreign direct investment, green bonds and climate finance, land value capture from serviced land; (6) monitoring and evaluation - indicators for wellbeing (GNH), environment, economy and housing affordability, with regular plan reviews; (7) participation and capacity building - community engagement and training of local planners and workers.', null, '[{"point": "Institutions and governance: special authority/ development agency, roles of national and local agencies, legal framework (special laws, development control regulations)", "marks": 4}, {"point": "Phasing (short, medium, long term), land mobilisation (land pooling, acquisition with fair compensation), financing (PPP, investors, green bonds, land value capture), monitoring and evaluation, stakeholder participation, capacity building", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case1', 4, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
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
  values ('ME', 'passage', 'Case I: Planning a mindfulness city in Gelephu
The first ever mindfulness city in the world is being planned in Gelephu. The city is expected to integrate cultural promotion, mindfulness and economic development, among others. You have been recruited as the Lead Planner to plan the city. Explain some of the concepts/proposals and the implementation framework that you will adopt for the city. The proposals must include, but are not limited to, the parts below. Use simple sketches to illustrate your ideas.

e) Sketches: use simple sketches to illustrate your ideas. (5 marks)', 'Expected sketches (drawn and labelled): (1) a concept plan showing the river and green corridors, compact neighbourhood nodes, the transit spine, the cultural and mindfulness core and economic districts; (2) a typical neighbourhood showing a 10-minute walking radius with a school, market, park and homes; (3) a street or riverfront cross-section showing pedestrian paths, cycle lanes, trees, transit lane, raised buildings and floodable parkland. Marks are given for clarity, labelling and relevance to the proposals.', null, '[{"point": "Clear, labelled simple sketches (concept plan of nodes, transit spine, blue-green network; section of a street or riverfront) consistent with proposals", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case1', 5, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Making Thimphu liveable and affordable
Thimphu is the most populated city in Bhutan. Despite continuous interventions, the city still lacks the desired liveable quality of a capital city. You have been tasked to review the issues and come up with strategies to improve the image of the city and ensure that it becomes affordable for all sections of society. Describe some of the strategies/interventions you would propose. The proposals must include, but are not limited to, the parts below.

a) Analyses. (10 marks)', 'Analyses: review of the existing Thimphu Structure Plan, local area plans and regulations, field surveys, data on population, housing, transport and services, and consultations. Key issues: (1) Thimphu lies in a narrow valley with steep slopes and limited developable land; (2) rapid rural-urban migration and population growth; (3) high land prices and rents, a shortage of affordable housing, and a large share of income spent on rent; (4) traffic congestion, parking shortage, weak public transport and poor pedestrian facilities; (5) loss of green and open spaces, encroachment on river buffers, and out-of-character, bulky buildings that weaken the city''s image; (6) infrastructure gaps - water supply, sewerage, drainage, solid waste; (7) hazards - flash floods, landslides, earthquakes; (8) slow implementation of LAPs. SWOT: strengths - beautiful natural setting, heritage, capital city functions; weaknesses - land constraints, congestion, affordability; opportunities - new technologies, structure plan revision, Gelephu reducing migration pressure, public transport and housing programmes; threats - unregulated growth, climate hazards, speculation.', null, '[{"point": "Issues: narrow linear valley, steep slopes, limited land; rapid migration and population growth; high land and rent prices, housing shortage; traffic congestion, parking, weak public transport; loss of open spaces, haphazard/ out-of-character buildings, informal settlements; flooding/ landslides; waste, water supply, air quality", "marks": 6}, {"point": "Methods and SWOT: review of Thimphu Structure Plan/ LAPs, surveys, data; strengths (setting, heritage, capital), weaknesses, opportunities, threats", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case2', 1, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Making Thimphu liveable and affordable
Thimphu is the most populated city in Bhutan. Despite continuous interventions, the city still lacks the desired liveable quality of a capital city. You have been tasked to review the issues and come up with strategies to improve the image of the city and ensure that it becomes affordable for all sections of society. Describe some of the strategies/interventions you would propose. The proposals must include, but are not limited to, the parts below.

b) Visioning exercise and planning principles to be adopted. (10 marks)', 'Visioning: a participatory process with residents, tenants and landowners, the Thromde, national agencies, businesses, youth and experts (workshops, surveys, public displays) to agree a vision such as ''Thimphu - a liveable, affordable and green capital that reflects Bhutanese identity and wellbeing''. Planning principles: (1) affordability and inclusion - housing and services for all income groups; (2) polycentric, compact, mixed-use development around urban nodes to reduce travel; (3) people first - walkable streets and efficient public transport over private cars; (4) protect the natural environment - Wang Chhu and stream corridors, forested slopes and open spaces as a green network; (5) Bhutanese identity - human-scale buildings and Bhutanese architecture, protecting heritage and views; (6) resilience to floods, landslides and earthquakes; (7) efficient infrastructure; (8) participatory and accountable governance - principles of Intelligent Urbanism that guided Thimphu''s earlier plan.', null, '[{"point": "Visioning: participatory (residents, Thromde, agencies, businesses, youth), shared vision e.g. ''a liveable, affordable, green capital reflecting Bhutanese identity''", "marks": 4}, {"point": "Principles: affordability and inclusion, compact mixed-use nodes (polycentric), walkability and public transport, protect natural environment/ river and green network, Bhutanese identity and heritage, resilience, good governance (Intelligent Urbanism)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case2', 2, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Making Thimphu liveable and affordable
Thimphu is the most populated city in Bhutan. Despite continuous interventions, the city still lacks the desired liveable quality of a capital city. You have been tasked to review the issues and come up with strategies to improve the image of the city and ensure that it becomes affordable for all sections of society. Describe some of the strategies/interventions you would propose. The proposals must include, but are not limited to, the parts below.

c) Proposals to address the problems: set out at least three strategies, with simple sketches to illustrate your ideas. (30 marks)', 'Strategy 1 - Affordable housing for all: expand public and affordable rental housing by the National Housing Development Corporation and the Thromde; use land pooling reserve plots and government land for mixed-income housing; require a share of affordable units in large developments (inclusionary zoning) with FAR incentives; densify sensibly near urban nodes and transit; support housing cooperatives and affordable housing finance; strengthen tenancy rules to protect tenants. Sketch: a mixed-income housing block around a shared courtyard near a bus stop. Strategy 2 - Mobility and public realm: a frequent, reliable city bus network (possibly bus rapid transit along Norzin Lam-Babesa corridor), park-and-ride at entry points, continuous wide footpaths, pedestrian streets in the core, cycle lanes, parking management and pricing, and attractive streetscapes with trees, seating and lighting. Sketch: a street section with footpaths, trees, cycle lane, bus lane and traffic lanes. Strategy 3 - Image, identity and environment: urban design codes controlling building height, bulk, setbacks, colours and Bhutanese architectural features; protect and enhance the Wang Chhu riverfront and stream corridors as linear parks; create plazas and neighbourhood parks; plant trees on slopes; improve water supply, sewerage, drainage and zero-waste management; and develop self-contained urban nodes (e.g. in north and south Thimphu) with markets, schools, clinics and offices to reduce congestion in the core. Sketch: a node plan showing mixed-use centre, park and riverfront. Implementation: integrate the strategies into the structure plan and LAPs, phase investments, use public-private partnerships, and monitor liveability and affordability indicators.', null, '[{"point": "Strategy on affordable housing: public/ rental housing (NHDCL), mixed-income and inclusionary zoning, incentives/ rent regulation, land pooling reserve plots, densification near nodes, housing finance", "marks": 8}, {"point": "Strategy on mobility and public realm: reliable bus system/ BRT, pedestrianisation, footpaths, cycle lanes, parking management, streetscapes and public spaces, green and river corridors", "marks": 8}, {"point": "Strategy on image, identity and environment/ infrastructure: urban design codes, building heights/ form, facade and heritage control, greening, waste and water management, decentralised nodes and services, resilience", "marks": 8}, {"point": "Sketches and justification: clear sketches (street section, node plan, housing block) and link to issues; feasibility and implementation", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Urban Planning", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-urban2024-case2', 3, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 18.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 7.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Clarence Perry is best known for the concept of the', null, 'Clarence Perry proposed the Neighbourhood Unit (1929), centred on an elementary school within walking distance.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Linear City', false, 1), ('B', 'Radiant City', false, 2), ('C', 'Neighbourhood Unit', true, 3), ('D', 'Garden City', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Transit-Oriented Development (TOD) mainly promotes', null, 'TOD concentrates mixed uses and density within walking distance of transit stops.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'compact, mixed-use, walkable development around public transport stations', true, 1), ('B', 'industrial zones along highways', false, 2), ('C', 'low-density housing far from transit', false, 3), ('D', 'large car parks at city centres', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Ground coverage of a building is', null, 'Coverage = footprint area / plot area x 100; FAR uses total floor area.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'number of floors times plot area', false, 1), ('B', 'total height divided by road width', false, 2), ('C', 'gross floor area divided by plot area', false, 3), ('D', 'building footprint (plinth) area as a percentage of plot area', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 400 m² plot has a building with three floors of 200 m² each. Its FAR is', null, 'FAR = 3 x 200 / 400 = 1.5 (coverage 50%).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1.0', false, 1), ('B', '3.0', false, 2), ('C', '1.5', true, 3), ('D', '0.5', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '''Broadacre City'', a decentralised low-density vision, was proposed by', null, 'Frank Lloyd Wright proposed Broadacre City in the 1930s.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Le Corbusier', false, 1), ('B', 'Patrick Geddes', false, 2), ('C', 'Daniel Burnham', false, 3), ('D', 'Frank Lloyd Wright', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Who wrote ''The Death and Life of Great American Cities'' (1961)?', null, 'Jane Jacobs'' book criticised modernist planning and championed mixed-use, lively streets.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Kevin Lynch', false, 1), ('B', 'Jane Jacobs', true, 2), ('C', 'Lewis Mumford', false, 3), ('D', 'Jan Gehl', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A regulation that controls the physical form of buildings and public spaces, rather than mainly separating land uses, is a', null, 'Form-based codes regulate building form, frontage and public realm.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'form-based code', true, 1), ('B', 'land pooling scheme', false, 2), ('C', 'tax code', false, 3), ('D', 'Euclidean zoning code', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The planning method ''survey before plan'' (survey - analysis - plan) is associated with', null, 'Patrick Geddes, father of regional planning, advocated civic survey before planning.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Robert Moses', false, 1), ('B', 'Ebenezer Howard', false, 2), ('C', 'Clarence Stein', false, 3), ('D', 'Patrick Geddes', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '''Ville Radieuse'' (Radiant City), with tall towers set in open green space, was proposed by', null, 'Le Corbusier proposed the Radiant City in 1930.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'urban-planning'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Urban Planning): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'urban-planning'), null)
  returning id
)
insert into me_q select 'N9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Jane Jacobs', false, 1), ('B', 'Arturo Soria y Mata', false, 2), ('C', 'Le Corbusier', true, 3), ('D', 'Ebenezer Howard', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N9';
commit;
