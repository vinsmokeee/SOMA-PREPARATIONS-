-- ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'civil-engineering', 'Civil Engineering' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'civil-engineering') is null then raise exception 'unknown specialisation civil-engineering'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the meaning of soundness of cement?', null, 'Soundness is the ability of cement to keep its volume after setting (no undue expansion from free lime or magnesia), tested by Le Chatelier.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ability to make ringing noise when struck', false, 1), ('B', 'Ability to retain volume after setting', true, 2), ('C', 'Ability to form strong and sound structure', false, 3), ('D', 'Ability to flow when mixed', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In frame structure, what transfers the load to columns?', null, 'In a framed structure slabs carry load to beams, and beams transfer it to the columns.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Slabs', false, 1), ('B', 'Foundation', false, 2), ('C', 'Roofs', false, 3), ('D', 'Beams', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a truss structure, _________ bear tension.', null, 'In a simply supported truss under gravity loads the bottom chord is in tension and the top chord in compression.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Joints', false, 1), ('B', 'Bottom chords', true, 2), ('C', 'Base', false, 3), ('D', 'Top chords', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Hydrographic survey deal with the mapping of', null, 'Hydrographic survey maps water bodies - rivers, lakes, reservoirs and seas (depths, banks, currents).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'canal system', false, 1), ('B', 'movement of clouds', false, 2), ('C', 'large water bodies', true, 3), ('D', 'mountainous region', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the below is constructed above doors, windows?', null, 'A lintel spans openings such as doors and windows to carry the wall above.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Purlin', false, 1), ('B', 'Arch', false, 2), ('C', 'Lintel', true, 3), ('D', 'Joist', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '___________wall is used to resist lateral forces like severe wind.', null, 'Shear walls resist lateral forces from wind and earthquakes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Shear', true, 1), ('B', 'Knee', false, 2), ('C', 'Infill', false, 3), ('D', 'Cavity', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Contours can be found in a __________ map.', null, 'Contours are shown on topographical maps.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Topographical', true, 1), ('B', 'Thematic', false, 2), ('C', 'Physical', false, 3), ('D', 'Political', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The horizontal angle between the true meridian and magnetic meridian at a place is called', null, 'Magnetic declination is the horizontal angle between the true and magnetic meridians.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'magnetic bearing', false, 1), ('B', 'azimuth', false, 2), ('C', 'local attraction', false, 3), ('D', 'declination', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A critical path has', null, 'Activities on the critical path have zero slack (float).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'minimum slack', false, 1), ('B', 'infinite slack', false, 2), ('C', 'zero slack', true, 3), ('D', 'maximum slack', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The term ___________ in construction is applied to the finishing of mortar joints in masonry (stone or brick). In exposed masonry, these are considered to be the weakest part.', null, 'Pointing is finishing the mortar joints of exposed masonry.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'painting', false, 1), ('B', 'pointing', true, 2), ('C', 'deteriorating', false, 3), ('D', 'finishing', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'M25 grade of concrete approximates', null, 'Nominal mix for M25 is about 1:1:2 (M20 1:1.5:3, M15 1:2:4).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1 : 1: 2 mix', true, 1), ('B', '1: 1.5 : 3 mix', false, 2), ('C', 'none of the above', false, 3), ('D', '1: 3: 6 mix', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Poisson''s ratio is the ratio of:', null, 'Poisson''s ratio = lateral strain / axial (longitudinal) strain.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lateral strain to axial strain', true, 1), ('B', 'Compressive stress to tensile stress', false, 2), ('C', 'Shear stress to shear strain', false, 3), ('D', 'Axial stress to axial strain', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the unit of discharge in hydrology?', null, 'The SI unit of discharge is cubic metres per second (cumec).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Gallons per hour (gal/hr)', false, 1), ('B', 'Cubic feet per minute (ft3/min)', false, 2), ('C', 'Liters per minute (L/min)', false, 3), ('D', 'Cubic meters per second (m3/s)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following load is to be considered on liquid retaining structure?', null, 'Liquid retaining structures are designed for hydrostatic pressure of the liquid.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'dynamic load', false, 1), ('B', 'earth pressure', false, 2), ('C', 'wave and current load', false, 3), ('D', 'hydrostatic load', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The last reading taken from the instrument is called:', null, 'The last staff reading before shifting the level is the fore sight.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Fore sight', true, 1), ('B', 'Free sight', false, 2), ('C', 'Back sight', false, 3), ('D', 'End sight', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In PERT analysis, event means', null, 'In PERT an event is a point in time - the start or completion of an activity.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'start or finish of a task', true, 1), ('B', 'work involved in the project', false, 2), ('C', 'end of an activity', false, 3), ('D', 'time taken for a task', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The point in the cross section of beam through which if load acts there will not be any twisting of the beam but there will be only bending is known as', null, 'A load through the shear centre causes bending without twisting.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'centroid', false, 1), ('B', 'centre of gravity', false, 2), ('C', 'shear centre', true, 3), ('D', 'all the above', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The main object of a preliminary survey', null, 'A preliminary survey collects topography, drainage and soil data, compares the costs of alternative alignments and helps finalise the best one.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'to estimate cost of alternative alignment.', false, 1), ('B', 'all the above.', true, 2), ('C', 'to finalise the best alignment.', false, 3), ('D', 'to collect the necessary physical information and details of topography, drainage and soil properties.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Benchmark is established by', null, 'Benchmarks are established by precise spirit levelling.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'barometric leveling', false, 1), ('B', 'hypsometry', false, 2), ('C', 'spirit leveling', true, 3), ('D', 'trigonometric leveling', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the initial setting time of cement?', null, 'Initial setting time of ordinary Portland cement is at least 30 minutes.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '30 hours', false, 1), ('B', '30 minutes', true, 2), ('C', '15 minutes', false, 3), ('D', '1 hour', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A channel section has', null, 'A channel section has one web and two flanges.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'one web one flange', false, 1), ('B', 'one web two flanges', true, 2), ('C', 'two webs one flange', false, 3), ('D', 'two webs and two flanges', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The centre of gravity of the volume of liquid displaced is called', null, 'The centre of gravity of the displaced liquid is the centre of buoyancy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'centre of buoyancy', true, 1), ('B', 'None of these', false, 2), ('C', 'centre of pressure', false, 3), ('D', 'metacentre', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The property of a material to resist scratching and abrasion is known as:', null, 'Hardness is resistance to scratching, abrasion and indentation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plasticity', false, 1), ('B', 'Elasticity', false, 2), ('C', 'Toughness', false, 3), ('D', 'Hardness', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Loss of prestress due to friction occurs', null, 'Friction loss occurs between tendons and ducts, which exist only in post-tensioned members.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'only in post-tensioned beams', true, 1), ('B', 'only in pre-tensioned beams', false, 2), ('C', 'none of the above', false, 3), ('D', 'in both pre-tensioned and post-tensioned beams', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Efflorescence in cement is caused due to an excess of', null, 'Efflorescence is caused by excess soluble alkalis (salts) leaching to the surface.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Alumina', false, 1), ('B', 'Iron oxide', false, 2), ('C', 'Silica', false, 3), ('D', 'Alkalies', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'If the modulus of elasticity is zero, the material is said to be', null, 'With zero modulus of elasticity the material offers no elastic resistance and deforms permanently: it behaves as perfectly plastic.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'elastic', false, 1), ('B', 'flexible', false, 2), ('C', 'plastic', true, 3), ('D', 'rigid', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary purpose of reinforcement in RCC?', null, 'Concrete is weak in tension, so steel reinforcement resists the tensile forces.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To increase concrete strength', false, 1), ('B', 'To resist tensile forces', true, 2), ('C', 'To enhance thermal properties', false, 3), ('D', 'To reduce construction cost', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the purpose of ''weep holes'' in retaining walls?', null, 'Weep holes drain water from behind the wall and relieve hydrostatic pressure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ventilation', false, 1), ('B', 'Structural reinforcement', false, 2), ('C', 'Drainage of accumulated water', true, 3), ('D', 'Aesthetic appeal', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'It is more often preferable that a beam section be designed as :', null, 'An under-reinforced section fails gradually by steel yielding, giving warning before collapse.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'balanced section', false, 1), ('B', 'underreinforced section', true, 2), ('C', 'overreinforced section', false, 3), ('D', 'reinforced concrete section', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'What is the density of steel and why is density important for steel? Compute the weight of an MS plate of 250 mm x 250 mm x 10 mm.', 'The density of mild steel is about 7850 kg/m³ (unit weight 78.5 kN/m³). Density is important because it is used to calculate the self-weight (dead load) of steel members in structural design, to estimate quantities and costs (steel is bought and paid for by weight), to plan transport, lifting and handling, and to find the weight of bars per metre (d²/162 kg/m with d in mm, derived from 7850 kg/m³). Weight of the plate: volume = 0.250 m x 0.250 m x 0.010 m = 0.000625 m³; weight = 0.000625 x 7850 = 4.91 kg (about 0.048 kN).', null, '[{"point": "Density of steel ≈ 7850 kg/m³ (78.5 kN/m³)", "marks": 1}, {"point": "Importance: self-weight/ dead load in design, estimating quantity and cost (by weight), transport and handling, unit weight of bars (d²/162)", "marks": 2}, {"point": "Volume = 0.25 x 0.25 x 0.01 = 0.000625 m³; weight = 0.000625 x 7850 = 4.91 kg (≈ 0.048 kN)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
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
  values ('ME', 'short_answer', 'What is an RCC beam? Determine the self-weight of an RCC beam with a span of 8 m and a cross section of 400 mm x 800 mm.', 'A reinforced cement concrete (RCC) beam is a horizontal structural member made of concrete with embedded steel reinforcement - main bars on the tension face (and sometimes compression face) and stirrups for shear - which carries loads from slabs, walls or other beams to columns or supports by bending and shear; concrete takes compression and steel takes tension. Self-weight: unit weight of RCC = 25 kN/m³ (IS 875 Part 1). Weight per metre = 0.40 x 0.80 x 25 = 8.0 kN/m. Total self-weight over 8 m = 8.0 x 8 = 64 kN (volume 0.4 x 0.8 x 8 = 2.56 m³).', null, '[{"point": "RCC beam: horizontal flexural member of concrete with steel reinforcement (tension bars, stirrups) carrying loads from slabs/ walls to columns by bending and shear", "marks": 2}, {"point": "Unit weight of RCC 25 kN/m³; self-weight per metre = 0.4 x 0.8 x 25 = 8 kN/m; total = 8 x 8 = 64 kN (volume 2.56 m³)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
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
  values ('ME', 'short_answer', 'A simply supported beam of span 6 m carries a uniformly distributed load of 1.5 kN/m over the entire span and a point load of 2 kN at 2 m from the right support. Determine the reactions at the left and right supports and the bending moment at 2 m from the right support.', 'Total UDL = 1.5 x 6 = 9 kN acting at 3 m from the left support A; the 2 kN point load is 2 m from the right support B, i.e. 4 m from A. Taking moments about A: RB x 6 = 9 x 3 + 2 x 4 = 27 + 8 = 35, so RB = 5.83 kN. Vertical equilibrium: RA + RB = 9 + 2 = 11, so RA = 11 - 5.83 = 5.17 kN. Bending moment at the point 2 m from B (under the point load), taking the right-hand part: M = RB x 2 - (1.5 x 2) x 1 = 11.67 - 3.00 = 8.67 kNm (sagging). Check from the left: M = 5.17 x 4 - 1.5 x 4 x 2 = 20.67 - 12 = 8.67 kNm.', null, '[{"point": "Total UDL = 9 kN at 3 m; point load 4 m from left; ΣM about A: RB x 6 = 9 x 3 + 2 x 4 → RB = 5.83 kN", "marks": 2}, {"point": "RA = 11 - 5.83 = 5.17 kN", "marks": 1}, {"point": "M at 2 m from right = RB x 2 - 1.5 x 2 x 1 = 11.67 - 3 = 8.67 kNm (sagging)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
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
  values ('ME', 'short_answer', 'What is the basic difference between the slump test and the compression test? Briefly explain the procedure of the slump test for concrete.', 'Difference: the slump test measures the workability (consistency) of fresh, plastic concrete at site immediately after mixing; the compression test measures the compressive strength of hardened concrete by crushing cured cube (150 mm) or cylinder specimens in a compression testing machine, usually at 7 and 28 days. Slump test procedure (IS 1199): (1) clean the slump cone (frustum 300 mm high, 200 mm bottom and 100 mm top diameter) and place it on a smooth, level, non-absorbent base, held firmly; (2) fill it in four equal layers, tamping each layer 25 times with a 16 mm diameter, 600 mm long rounded tamping rod; (3) strike off the top level; (4) lift the cone vertically and slowly (within about 5 seconds); (5) measure the drop in height of the concrete from the top of the cone - this is the slump in mm; (6) note the shape: true slump, shear slump (repeat test) or collapse. Typical slump for RCC beams and slabs is about 25-100 mm.', null, '[{"point": "Slump test: workability/ consistency of fresh concrete on site; compression test: compressive strength of hardened concrete cubes/ cylinders (7/28 days) in a testing machine", "marks": 2}, {"point": "Procedure: clean moist mould (300 mm high, 200/100 mm dia) on flat base; fill in 4 layers each tamped 25 times with 16 mm rod; strike off; lift mould vertically; measure drop of top = slump (mm); note type (true, shear, collapse)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
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
  values ('ME', 'passage', 'Case I: Seismic evaluation of an existing building
You are a civil engineer assigned to evaluate an existing building that does not fulfil the current seismic requirements and may suffer extensive damage or even collapse if shaken by severe ground motion.

1. Elaborate and explain the methodology you will use to assess and evaluate the existing building. (30 marks)', '1. Preliminary data: collect architectural and structural drawings, design calculations, codes used, construction year, alterations, occupancy and importance (e.g. school or hospital), and site conditions: Bhutan lies in a high seismic zone (zone V/IV of IS 1893, as used with the Bhutan Building Rules), and soil type and slope affect the demand.
2. Rapid visual screening and condition survey: inspect the structural system and identify vulnerability features - soft or weak storey (open ground floor), short columns, torsional and plan irregularities, re-entrant corners, heavy water tanks, pounding with adjacent buildings, poor foundations on slopes - and deterioration such as cracks, spalling, rebar corrosion, dampness, plus non-structural hazards (parapets, infill walls). Score the building (e.g. FEMA 154/ NDMA RVS) to decide whether a detailed evaluation is needed.
3. Material and as-built investigation: measure member sizes; locate reinforcement with a rebar scanner/ cover meter and occasional chipping; test concrete strength by rebound hammer and ultrasonic pulse velocity calibrated with cores; check carbonation depth and corrosion (half-cell potential); test reinforcement samples; check the foundation and soil (bore holes, SPT) if needed.
4. Detailed seismic evaluation: build a 3D analytical model (ETABS/SAP2000/STAAD) with the actual properties; compute seismic loads per IS 1893 (Part 1): 2016 by equivalent static and response spectrum methods with the correct zone, importance and response reduction factors; check member capacities against demands (demand-capacity ratios), storey drift, strong-column weak-beam, joint shear and ductile detailing to IS 13920; for important buildings use non-linear static (pushover) analysis to find the performance level (immediate occupancy, life safety, collapse prevention) per IS 15988/ ASCE 41.
5. Results and decision: list deficiencies; propose retrofit options - column and beam jacketing (RC, steel, FRP), adding shear walls or steel bracing, strengthening foundations, removing irregularities, base isolation - with costs; compare retrofit with demolition and reconstruction; and prepare a report with recommendations, priorities and any interim restrictions on use.', null, '[{"point": "Preliminary: collect drawings, design basis, codes used, age, occupancy/ importance, site seismic zone (Bhutan zone V/ IV per NBC/ IS 1893), soil", "marks": 4}, {"point": "Visual/ rapid visual screening (RVS) and condition survey: structural system, irregularities (soft storey, short column, torsion, re-entrant corners), cracks, corrosion, deterioration, non-structural hazards", "marks": 6}, {"point": "Material and structural testing: NDT (rebound hammer, UPV), cores, rebar scanning/ cover, carbonation, half-cell; as-built dimensions and reinforcement detailing; soil/ foundation", "marks": 6}, {"point": "Detailed analysis: computer model (e.g. ETABS/ SAP), seismic loads per IS 1893:2016 (equivalent static/ response spectrum), load combinations, check capacity vs demand (DCR), drift, ductile detailing per IS 13920; or pushover/ performance-based (IS 15988, ASCE 41)", "marks": 8}, {"point": "Results and decision: performance level, deficiencies list, retrofit options (jacketing, shear walls, bracing, base isolation, FRP), cost-benefit, report and recommendations (retrofit/ restrict use/ demolish)", "marks": 6}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 30,
    3240, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case1', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 18.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 7.5, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 4.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic evaluation of an existing building
You are a civil engineer assigned to evaluate an existing building that does not fulfil the current seismic requirements and may suffer extensive damage or even collapse if shaken by severe ground motion.

2. What is non-destructive testing (NDT)? Explain the types of NDT for buildings and building materials. (15 marks)', 'Non-destructive testing (NDT) means examining a structure or material in place without damaging it or impairing its future use, to estimate strength, uniformity and quality and to detect cracks, voids, corrosion and other defects. Main types: (1) Rebound (Schmidt) hammer - the rebound of a spring-loaded mass gives surface hardness, correlated with compressive strength (IS 516 Part 5/ IS 13311 Part 2); quick but affected by surface condition. (2) Ultrasonic pulse velocity - the speed of an ultrasonic pulse through concrete indicates its quality, density, cracks and voids (IS 13311 Part 1). (3) Combined (SONREB) method of rebound and UPV for better strength estimates. (4) Cover meter/ rebar locator and ground-penetrating radar - locate reinforcement and measure cover and bar size. (5) Half-cell potential and resistivity tests - assess the probability of reinforcement corrosion; carbonation depth by phenolphthalein. (6) Infrared thermography - detects moisture, delamination and heat loss. (7) Radiography (X-ray/ gamma) - shows internal voids and reinforcement. (8) Penetration resistance (Windsor probe) and pull-out tests - near-surface strength. Partially destructive tests such as cores and load tests are used to calibrate NDT. For steel and welds: visual, dye penetrant, magnetic particle, ultrasonic and radiographic testing.', null, '[{"point": "NDT: testing a structure/ material without damaging it, to assess strength, uniformity, defects and durability in place", "marks": 3}, {"point": "Rebound (Schmidt) hammer: surface hardness → estimated strength (IS 516 Part 5)", "marks": 2}, {"point": "Ultrasonic pulse velocity: quality, cracks, voids, homogeneity", "marks": 2}, {"point": "Cover meter/ rebar locator and GPR: reinforcement position, cover, size", "marks": 2}, {"point": "Half-cell potential, resistivity, carbonation test: corrosion risk", "marks": 2}, {"point": "Others: core (semi-destructive), radiography, infrared thermography, load test, penetration resistance, pull-out; steel: dye penetrant, magnetic particle, ultrasonic for welds", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case1', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Seismic evaluation of an existing building
You are a civil engineer assigned to evaluate an existing building that does not fulfil the current seismic requirements and may suffer extensive damage or even collapse if shaken by severe ground motion.

3. What do you mean by a flood and its effects? Briefly explain how to reduce the impact of floods. (5 marks)', 'A flood is the overflow of water onto land that is normally dry, caused by heavy or prolonged rain, river overflow, flash floods, glacial lake outburst floods (GLOFs) in Bhutan, or dam failure. Effects: loss of life and livestock; damage to houses, roads, bridges, hydropower and water supply; erosion and landslides; loss of crops and farmland; water-borne diseases; and economic losses and displacement. Reducing impact: flood hazard mapping and land-use zoning so buildings avoid flood plains and river banks; early warning systems (e.g. GLOF warning on the Punatsangchhu and Chamkharchhu) and evacuation plans; structural measures such as embankments, gabion walls, check dams, river training and proper drainage and culverts; catchment protection by afforestation; flood-resistant building design (raised plinths); and community preparedness, insurance and emergency response.', null, '[{"point": "Flood: overflow of water onto normally dry land (heavy rain, river overflow, GLOF, flash floods, dam failure)", "marks": 1}, {"point": "Effects: loss of life, damage to buildings, roads, bridges, farmland, erosion, landslides, disease, economic loss", "marks": 2}, {"point": "Reduction: hazard mapping and zoning (no building in flood plains), early warning (GLOF systems), embankments/ river training, drainage, afforestation, flood-resistant design, preparedness and insurance", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case1', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Analysis and design of a portal frame
Analyse the frame shown in the figure with its loading and support conditions. The left column AB is 6 m high (pin support at A; a 10 kN horizontal load acts at G, 4 m above A). The beam BCDE is 5 m long: a 20 kN point load acts at C (1 m from B) and a UDL of 2 kN/m acts over DE (3 m, from 2 m to 5 m from B). The right column EF is 6 m high with a roller support at F.

1. Compute the support reactions at A and F. Draw the free body diagram, axial force diagram, shear force diagram and bending moment diagram for the frame. (20 marks)', 'Reactions (A pin: Ax, Ay; F roller: Fy only). ΣFx = 0: Ax + 10 = 0, so Ax = 10 kN acting to the left. ΣMA = 0 (anticlockwise positive): Fy x 5 - 20 x 1 - (2 x 3) x 3.5 - 10 x 4 = 0, so 5Fy = 20 + 21 + 40 = 81 and Fy = 16.2 kN upward. ΣFy = 0: Ay = 20 + 6 - 16.2 = 9.8 kN upward.
Free body diagram: the frame with Ax = 10 kN (left) and Ay = 9.8 kN (up) at A, Fy = 16.2 kN (up) at F, and the applied loads (10 kN at G, 20 kN at C, 2 kN/m on DE).
Axial forces: column AB - 9.8 kN compression; column EF - 16.2 kN compression; beam BE - the horizontal forces on AB balance (10 kN at A and 10 kN at G), so the axial force in the beam is zero.
Shear forces: column AB - 10 kN from A to G, zero from G to B; beam - +9.8 kN from B to C, -10.2 kN from C to D, varying linearly from -10.2 kN at D to -16.2 kN at E (so shear does not change sign within DE); column EF - zero (no horizontal force at the roller).
Bending moments: column AB - zero at A, increasing linearly to 10 x 4 = 40 kNm at G, constant 40 kNm from G to B; beam - 40 kNm at B, 40 + 9.8 x 1 = 49.8 kNm at C (maximum), 49.8 - 10.2 x 1 = 39.6 kNm at D, parabolic to zero at E (check from the right: at C, 16.2 x 4 - 6 x 2.5 = 49.8 kNm); the beam moments are sagging (tension on the inside/bottom) and the corner B carries 40 kNm; column EF - zero throughout. The diagrams are drawn on the frame outline with these values.', null, '[{"point": "Reactions: ΣFx → Ax = 10 kN (acting left); ΣMA: 5Fy = 20 x 1 + 6 x 3.5 + 10 x 4 = 81 → Fy = 16.2 kN; Ay = 26 - 16.2 = 9.8 kN", "marks": 6}, {"point": "Axial: AB compression 9.8 kN; EF compression 16.2 kN; beam BE axial ≈ 0 (horizontal forces balance in AB)", "marks": 3}, {"point": "Shear: AB 10 kN from A to G, 0 from G to B; beam B-C +9.8, C-D -10.2, D-E -10.2 to -16.2; EF 0", "marks": 4}, {"point": "BM: AB 0 at A, 40 kNm at G, constant 40 to B; beam 40 at B, 49.8 at C (max), 39.6 at D, 0 at E (sagging, tension inside); EF 0 (roller, no horizontal force)", "marks": 5}, {"point": "Correct FBD and neat diagrams with values and signs", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case2', 1, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2024-frame.png')
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Analysis and design of a portal frame
Analyse the frame shown in the figure with its loading and support conditions. The left column AB is 6 m high (pin support at A; a 10 kN horizontal load acts at G, 4 m above A). The beam BCDE is 5 m long: a 20 kN point load acts at C (1 m from B) and a UDL of 2 kN/m acts over DE (3 m, from 2 m to 5 m from B). The right column EF is 6 m high with a roller support at F.

2. Calculate the quantity of cement, sand and aggregate in members EF and BE. Take concrete grade M20, column EF 500 mm x 500 mm and beam BE 300 mm x 500 mm. (10 marks)', 'Assumptions: nominal mix for M20 = 1 : 1.5 : 3 (sum of ratio = 5.5); dry volume = 1.54 x wet volume; density of cement 1440 kg/m³ (one bag = 50 kg); member lengths from the figure (EF 6 m, BE 5 m), the joint at E counted once in the column.
Column EF: wet volume = 0.5 x 0.5 x 6 = 1.50 m³; dry volume = 1.50 x 1.54 = 2.31 m³. Cement = 2.31 x 1/5.5 = 0.42 m³ = 0.42 x 1440 = 605 kg ≈ 12.1 bags; sand = 2.31 x 1.5/5.5 = 0.63 m³; coarse aggregate = 2.31 x 3/5.5 = 1.26 m³.
Beam BE: wet volume = 0.3 x 0.5 x 5 = 0.75 m³; dry volume = 0.75 x 1.54 = 1.155 m³. Cement = 1.155/5.5 = 0.21 m³ = 302 kg ≈ 6.1 bags; sand = 0.315 m³; coarse aggregate = 0.63 m³.
Total for both members: cement ≈ 907 kg (about 18.2 bags), sand ≈ 0.945 m³, aggregate ≈ 1.89 m³ (plus wastage of about 2-5%).', null, '[{"point": "Wet volumes: EF = 0.5 x 0.5 x 6 = 1.5 m³; BE = 0.3 x 0.5 x 5 = 0.75 m³ (total 2.25 m³); M20 nominal 1:1.5:3 (sum 5.5); dry volume factor 1.54", "marks": 3}, {"point": "EF: dry 2.31 m³ → cement 0.42 m³ = 605 kg ≈ 12 bags; sand 0.63 m³; aggregate 1.26 m³", "marks": 3.5}, {"point": "BE: dry 1.155 m³ → cement 0.21 m³ = 302 kg ≈ 6 bags; sand 0.315 m³; aggregate 0.63 m³ (state assumptions, e.g. joint counted once)", "marks": 3.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case2', 2, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2024-frame.png')
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
  values ('ME', 'passage', 'Case II: Analysis and design of a portal frame
Analyse the frame shown in the figure with its loading and support conditions. The left column AB is 6 m high (pin support at A; a 10 kN horizontal load acts at G, 4 m above A). The beam BCDE is 5 m long: a 20 kN point load acts at C (1 m from B) and a UDL of 2 kN/m acts over DE (3 m, from 2 m to 5 m from B). The right column EF is 6 m high with a roller support at F.

3. Design a rectangular reinforced concrete beam supported on 300 mm walls with a clear span of 6000 mm. Live load 12 kN/m, M20 concrete, Fe415 steel, clear cover 30 mm, beam width 300 mm. (20 marks)', '1. Dimensions: b = 300 mm. Trial overall depth D = 500 mm (about span/12); with 30 mm clear cover to the main bars and 20 mm bars, effective depth d = 500 - 30 - 10 = 460 mm. Effective span (IS 456 cl. 22.2): least of (clear span + d) = 6.0 + 0.46 = 6.46 m and centre-to-centre of supports = 6.0 + 0.3 = 6.3 m, so Leff = 6.3 m.
2. Loads: self-weight = 0.30 x 0.50 x 25 = 3.75 kN/m; live load = 12 kN/m; total w = 15.75 kN/m; factored load wu = 1.5 x 15.75 = 23.63 kN/m.
3. Design forces: Mu = wu L²/8 = 23.63 x 6.3²/8 = 117.2 kNm; Vu = wu L/2 = 74.4 kN.
4. Depth check: for Fe415, Mu,lim = 0.138 fck b d² = 0.138 x 20 x 300 x 460² = 175.2 kNm > 117.2 kNm, so a singly reinforced (under-reinforced) section is adequate; required d = √(117.2 x 10⁶ / (0.138 x 20 x 300)) = 376 mm < 460 mm.
5. Tension steel: Mu = 0.87 fy Ast d (1 - fy Ast/(b d fck)): 117.2 x 10⁶ = 0.87 x 415 x Ast x 460 (1 - 415 Ast/(300 x 460 x 20)), giving Ast = 803 mm². Provide 3 bars of 20 mm (Ast = 942 mm², pt = 0.68%). Minimum Ast = 0.85 b d/fy = 283 mm² and maximum 0.04 b D = 6000 mm² - OK. Provide 2 bars of 12 mm as hanger bars at the top.
6. Shear: τv = Vu/(b d) = 74.4 x 10³/(300 x 460) = 0.54 N/mm² (less at d from the support face); τc for M20 with pt = 0.68% ≈ 0.54 N/mm² (IS 456 Table 19); τc,max = 2.8 N/mm². Since τv ≈ τc, provide at least minimum shear reinforcement: 2-legged 8 mm stirrups (Asv = 100.5 mm²), sv = 0.87 fy Asv/(0.4 b) = 302 mm, limited to 0.75d = 345 mm and 300 mm, so 8 mm 2-legged stirrups at 300 mm c/c (closer, e.g. 200 mm, near the supports).
7. Deflection: basic span/d = 20 for simply supported beams; with fs = 0.58 x 415 x 803/942 ≈ 205 N/mm² and pt = 0.68%, the modification factor ≈ 1.2, so allowable L/d ≈ 24; actual 6300/460 = 13.7 - OK.
8. Detailing: 3-20 mm bottom bars full length with anchorage into the supports, 2-12 mm top hanger bars, 8 mm stirrups as above, 30 mm clear cover.', null, '[{"point": "Trial depth: D = 500 mm, d ≈ 460 mm; effective span = least of clear span + d (6.46 m) and c/c of supports (6.3 m) → 6.3 m", "marks": 3}, {"point": "Loads: self-weight 0.3 x 0.5 x 25 = 3.75 kN/m + LL 12 = 15.75; wu = 1.5 x 15.75 = 23.63 kN/m; Mu = wu L²/8 = 117.2 kNm; Vu = 74.4 kN", "marks": 4}, {"point": "Depth check: Mu,lim = 0.138 fck b d² = 175.2 kNm > Mu → singly reinforced (d required ≈ 376 mm)", "marks": 3}, {"point": "Steel: Mu = 0.87 fy Ast d (1 - fy Ast/(fck b d)) → Ast ≈ 803 mm²; provide 3 nos 20 mm (942 mm²); check min/max steel; 2 nos 12 mm hanger bars", "marks": 4}, {"point": "Shear: τv = 0.54 N/mm²; τc (pt 0.68%) ≈ 0.54 → minimum stirrups: 2-legged 8 mm @ 300 mm c/c (closer near supports)", "marks": 3}, {"point": "Deflection: allowable L/d = 20 x MF (~1.2) ≈ 24 > 6300/460 = 13.7 OK; detailing sketch", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 20,
    2160, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Civil Engineering", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-civil2024-case2', 3, null, null, (select id from public.specialisations where code = 'civil-engineering'), '/papers/me/tech3-civil-2024-frame.png')
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 12.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 5.0, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 3.0, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In the design of a retaining wall, sliding is checked by comparing', null, 'Factor of safety against sliding = resisting force (μ x total vertical load, plus passive pressure) / horizontal thrust; it is usually required to be at least about 1.4-1.5.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'civil-engineering'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Civil Engineering): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'civil-engineering'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The bearing capacity with the settlement', false, 1), ('B', 'The weight of the wall with the weight of the soil', false, 2), ('C', 'The bending moment with the shear force', false, 3), ('D', 'The resisting friction force with the horizontal earth pressure', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
