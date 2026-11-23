-- ME Paper II (Technical, Medical Science): BCSE 2022, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'medical-science-general-subject-knowledge', 'Medical Science: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The following logic symbol is equivalent to:', null, 'A NAND gate followed by a NOT gate (a NAND with its inputs joined) inverts the NAND output again, giving Y = A·B: an AND gate.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2022-gates.png')
  returning id
)
insert into me_q select 'M65', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'M65' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'AND gate', true, 1), ('B', 'NOT gate', false, 2), ('C', 'OR gate', false, 3), ('D', 'NAND gate', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M65';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Name the structural parts of the human ear numbered 1-9 in the following diagram. You need not draw the diagram; list the name of each part with its number. (3 marks)', '1 - Malleus (hammer); 2 - Incus (anvil); 3 - Stapes (stirrup); 4 - Semicircular canals; 5 - Cochlea; 6 - Auditory (vestibulocochlear) nerve; 7 - Round window; 8 - Tympanic membrane (eardrum); 9 - Pinna (auricle).', null, '[{"point": "1 Malleus; 2 Incus; 3 Stapes", "marks": 1}, {"point": "4 Semicircular canals; 5 Cochlea; 6 Auditory (vestibulocochlear) nerve", "marks": 1}, {"point": "7 Round window; 8 Tympanic membrane (eardrum); 9 Pinna (auricle)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Labels read from the diagram by Claude - check 7 (round window or oval window) and 8 against an anatomy text."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2022-ear.png')
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'From the diagram given below, write down the names of the parts of the human eye in the correct sequence of the numbers 1-9 (the diagram need not be drawn). (3 marks)', '1 - Aqueous humour in the anterior chamber (the opening behind it is the pupil); 2 - Cornea; 3 - Lens; 4 - Iris; 5 - Vitreous humour; 6 - Fovea centralis (yellow spot); 7 - Optic nerve; 8 - Retina; 9 - Choroid (the outermost white coat is the sclera).', null, '[{"point": "1 Aqueous humour (anterior chamber)/ pupil; 2 Cornea; 3 Lens", "marks": 1}, {"point": "4 Iris; 5 Vitreous humour; 6 Fovea (yellow spot)", "marks": 1}, {"point": "7 Optic nerve; 8 Retina; 9 Choroid (sclera outermost)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Labels read from the diagram by Claude - check 1 (aqueous humour or pupil), 6 (fovea or blind spot) and 9 (choroid or sclera)."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2022-eye.png')
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'From the diagram given below, write down the names of the parts of the human heart in the correct sequence of the numbers 1-13 (the diagram need not be drawn). (3 marks)', '1 - Right ventricle; 2 - Tricuspid valve; 3 - Inferior vena cava; 4 - Right atrium; 5 - Superior vena cava; 6 - Pulmonary (semilunar) valve; 7 - Arch of the aorta; 8 - Pulmonary artery (trunk); 9 - Pulmonary veins; 10 - Left atrium; 11 - Aortic (semilunar) valve; 12 - Mitral (bicuspid) valve; 13 - Left ventricle.', null, '[{"point": "1 Right ventricle; 2 Tricuspid valve; 3 Inferior vena cava; 4 Right atrium; 5 Superior vena cava", "marks": 1}, {"point": "6 Pulmonary (semilunar) valve; 7 Aortic arch; 8 Pulmonary artery; 9 Pulmonary veins", "marks": 1}, {"point": "10 Left atrium; 11 Aortic (semilunar) valve; 12 Mitral (bicuspid) valve; 13 Left ventricle", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Labels read from the diagram by Claude - check 1, 6, 8 and 11 against an anatomy text."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2022, batch 1", "source": {"title": "BCSE 2022 Main Examination, Technical Paper II, Medical Science", "year": 2022, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2022-heart.png')
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2022 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S3';
commit;
