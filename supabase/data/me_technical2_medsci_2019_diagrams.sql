-- ME Paper II (Technical, Medical Science): BCSE 2019, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'general-subject-knowledge'), 'medical-science-general-subject-knowledge', 'Medical Science: general subject knowledge' on conflict (subject_id, slug) do nothing;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cell division takes place in four phases. Choose the correct phase of the cell division from the diagram provided.', null, 'The diagram shows the two sets of chromatids being pulled apart towards opposite poles by the spindle fibres - this is anaphase.', '[]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper II, Medical Science", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2019-mitosis.png')
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anaphase', true, 1), ('B', 'Prophase', false, 2), ('C', 'Telophase', false, 3), ('D', 'Metaphase', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Label the following diagram of the human ear numbered 1-9. (3 marks)', '1 - Pinna (auricle); 2 - Malleus (hammer); 3 - Incus (anvil); 4 - Stapes (stirrup); 5 - Semicircular canals; 6 - Cochlea; 7 - Auditory (vestibulocochlear) nerve; 8 - Tympanic membrane (eardrum); 9 - External auditory canal (ear canal). The pinna and canal form the outer ear, the eardrum and three ossicles the middle ear, and the cochlea and semicircular canals the inner ear.', null, '[{"point": "1 Pinna (auricle); 9 External auditory canal; 8 Tympanic membrane (eardrum)", "marks": 1}, {"point": "2 Malleus; 3 Incus; 4 Stapes (the ear ossicles)", "marks": 1}, {"point": "5 Semicircular canals; 6 Cochlea; 7 Auditory (vestibulocochlear) nerve", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'general-subject-knowledge'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'general-subject-knowledge') and t.slug = 'medical-science-general-subject-knowledge'), (select id from public.exam_papers where code = 'me-technical-2'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": ["Labels read from the diagram by Claude - check 2, 3 and 4 (order of the ossicles) against an anatomy text."], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper II (Technical, Medical Science): BCSE 2019, batch 1", "source": {"title": "BCSE 2019 Main Examination, Technical Paper II, Medical Science", "year": 2019, "url": "https://rcsc.gov.bt/technical-paper-ii/"}}'::jsonb, null, null, null, (select id from public.subject_groups where code = 'medical-science'), null, '/papers/me/tech2-medsci-2019-ear.png')
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2019 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Explanation', 'Explains clearly with examples, steps or a diagram description where useful.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, concise and well-organised answer.', 0.5, 3 from me_q where key = 'S1';
commit;
