-- ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'clinical-counselling', 'Clinical Counselling' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'clinical-counselling') is null then raise exception 'unknown specialisation clinical-counselling'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'During a mental status examination, a patient states, “When I hear the news, the newscaster is talking about me.” This statement best represents which of the following?', null, 'Believing that unrelated external events (the news) refer to oneself is an idea of reference.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Overvalued idea', false, 1), ('B', 'Ideas of reference', true, 2), ('C', 'Paranoia', false, 3), ('D', 'Thought insertion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a technique for automatic thought modification?', null, 'Examining the evidence for and against a thought is a core technique to modify automatic thoughts (guided discovery and checklists help identify them).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Guided discovery', false, 1), ('B', 'Recognizing mood shifts', false, 2), ('C', 'Checklists for automatic thoughts', false, 3), ('D', 'Examining the evidence', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements is true with regard to factitious Disorder?', null, 'In factitious disorder the goal is to assume the sick role, not external gain (that is malingering).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The patient’s goal is to avoid unpleasant consequences or work', false, 1), ('B', 'The patient’s goal is to assume and maintain the sick role', true, 2), ('C', 'Patients visit to OPDs often but rarely are hospitalized', false, 3), ('D', 'It is synonymous with malingering', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following treatments is contraindicated in the initial treatment of a patient experiencing domestic violence?', null, 'Conjoint (couples) therapy is contraindicated early in domestic violence: it can endanger the victim and implies shared blame.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M5' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Conjoint marital therapy', true, 1), ('B', 'Individual psychotherapy', false, 2), ('C', 'Psychopharmacology', false, 3), ('D', 'Group psychotherapy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements about the development and course of autism spectrum disorder (ASD) is false?', null, 'ASD symptoms are usually recognised in the second year of life, not first at 5-6 years - so b is false.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Symptoms of ASD are typically recognized during the second year of life (12–24 months of age).', false, 1), ('B', 'ASD is not a degenerative disorder, and it is typical for learning and compensation to continue throughout life.', false, 2), ('C', 'First symptoms frequently involve delayed language development, often accompanied by lack of social interest or unusual social interactions.', false, 3), ('D', 'Symptoms of ASD are usually not noticeable until 5–6 years of age or later.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Social anxiety disorder (social phobia) differs from normative shyness in that the disorder leads to which of the following?', null, 'Social anxiety disorder causes clinically significant distress or social/occupational dysfunction; shyness does not.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Pervasive social deficits with poor insight.', false, 1), ('B', 'Social or occupational dysfunction.', true, 2), ('C', 'Avoidance of social situations.', false, 3), ('D', 'Marked social reticence.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A doctor who smokes, accepts that smoking is beneficial because it inhibits the development of obesity is which of the following “defence” mechanisms?', null, 'Giving a plausible but false justification for unacceptable behaviour is rationalisation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Reaction formation', false, 1), ('B', 'Rationalization', true, 2), ('C', 'Dissociation', false, 3), ('D', 'Intellectualization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements concerning suicide are correct?', null, 'Asking directly about suicidal ideas does not increase risk and can be protective; men die by suicide more often and risk rises with age.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A conversation with the patient about his / her ideals of suicide may protect the patient from being a potential victim', true, 1), ('B', 'The ratio of suicides with a fatal outcome decreases with age', false, 2), ('C', 'A suicide can reliably be predicted by certain clinical features', false, 3), ('D', 'Women die from suicide more often than men', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is NOT a facilitative message?', null, 'A ''run-on'' (multiple, stacked) question confuses the patient and is not facilitative.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Self-disclosure', false, 1), ('B', '‘Run on’ question', true, 2), ('C', 'Silence', false, 3), ('D', 'Interpretation', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a supportive intervention during a clinical interview process?', null, 'Acknowledging the patient''s emotions is a supportive intervention.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Open-ended questions', false, 1), ('B', 'Summarization', false, 2), ('C', 'Taking a medical history', false, 3), ('D', 'Acknowledgement of affect', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A therapist is assigned a new patient in his clinic. While looking at the materials the patient filled out in the waiting area, the therapist finds out that the patient has a substance abuse history. He immediately says, “Stupid drug addicts, they’re so annoying. They’re such a waste of time. They never want to get better.” This is an example of:', null, 'The therapist''s own negative emotional reaction to the patient is countertransference.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Confrontation', false, 1), ('B', 'Transference', false, 2), ('C', 'Countertransference', true, 3), ('D', 'Projection', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'One of your patients of the opposite sex begins to act seductively and proceeds to ask you out for dinner. Which one of the following would be an appropriate response?', null, 'Maintain boundaries: examine your countertransference and explore the meaning of the behaviour with the patient.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Compliment the patient on the way she or he is dressed', false, 1), ('B', 'Have sex with the patient and then make the patient find a new doctor', false, 2), ('C', 'Examine your own countertransference and explore the meaning of the patient’s behaviour', true, 3), ('D', 'Ignore the patient’s advances', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is not a major problem area addressed by interpersonal psychotherapy?', null, 'IPT focuses on grief, role disputes, role transitions and interpersonal deficits - not cognitive distortions (CBT).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cognitive distortions', true, 1), ('B', 'Grief and loss', false, 2), ('C', 'Role transitions', false, 3), ('D', 'Relational role disputes', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following domains of cognition is tested by administering Serial Sevens Test?', null, 'Serial sevens tests attention and concentration.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Attention', true, 1), ('B', 'Registration', false, 2), ('C', 'Recall', false, 3), ('D', 'Short-term memory', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient with a fear of spiders is put in a room with many spiders, and immediately a live tarantula is placed on his hand for as long as necessary until the dissipation of his anxiety. This behavioural technique is called:', null, 'Immediate, prolonged exposure to the most feared stimulus is flooding.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Aversion therapy', false, 1), ('B', 'Flooding', true, 2), ('C', 'Graded exposure', false, 3), ('D', 'Modeling', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is considered to be the most important therapeutic factor in group psychotherapy?', null, 'Group cohesion is considered the most important therapeutic factor (Yalom).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cohesion', true, 1), ('B', 'Pairing', false, 2), ('C', 'Discussion', false, 3), ('D', 'Ventilation of affect', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Habit reversal is a type of therapy indicated for:', null, 'Habit reversal training is a first-line therapy for trichotillomania (and tics).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Intermittent explosive disorder', false, 1), ('B', 'OCD', false, 2), ('C', 'Trichotillomania', true, 3), ('D', 'Developmental coordination disorder', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the following is not a feature of malingering?', null, 'In malingering, family members usually cannot confirm consistent symptoms - so c is not a feature.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Medical records may have been tampered with or altered', false, 1), ('B', 'Findings are compatible with self-inflicted injuries', false, 2), ('C', 'Family members are able to verify the consistency of symptoms', true, 3), ('D', 'Symptoms are vague or ill defined', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Therapy that is focused on the measurement of autonomic processes and teaching patients to gain voluntary control over these physiological parameters through operant conditioning is called:', null, 'Biofeedback measures autonomic signals and teaches voluntary control using operant conditioning.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M22' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Biofeedback', true, 1), ('B', 'Desensitization', false, 2), ('C', 'Stimulus–response therapy', false, 3), ('D', 'Relaxation training', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which one of the Kübler-Ross stages of reaction to impending death corresponds to a period in which a patient goes through self-blame for his or her illness and asks “Why me?”', null, 'In the anger stage the patient asks ''Why me?'', directing anger at self or others.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Depression', false, 1), ('B', 'Bargaining', false, 2), ('C', 'Shock and denial', false, 3), ('D', 'Anger', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are evaluating a 7-year-old patient who is brought in by his parents because of complaints they have been receiving from school. The child has been sexually provocative with other children, sexualizes play activities, and openly displays sexual behaviour. The most likely cause of this behaviour is:', null, 'Age-inappropriate sexualised behaviour in a young child strongly suggests sexual abuse.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Normal development', false, 1), ('B', 'Early-onset puberty', false, 2), ('C', 'Sexual abuse', true, 3), ('D', 'Traumatic brain injury', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A patient presents to the emergency room because of alcohol withdrawal. He and his family describe a history of alcohol-induced blackouts. Which one of the following memory problems is most consistent with alcohol-induced blackouts?', null, 'Alcohol blackouts are anterograde amnesia - inability to form new memories during intoxication.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Making up details of how he got to work 3 days ago', false, 1), ('B', 'Retrograde amnesia', false, 2), ('C', 'Anterograde amnesia', true, 3), ('D', 'Loss of memories from his daughter’s birthday 5 years ago', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the best way to handle suicidal patients with borderline personality disorder?', null, 'Suicidal threats in borderline personality disorder must always be taken seriously with steps to ensure safety; no-harm contracts are not reliable.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Isolate these patients from friends and family', false, 1), ('B', 'Make these patients promise not to hurt themselves (contract for safety)', false, 2), ('C', 'Do not discuss suicide with them', false, 3), ('D', 'Take the threats seriously and take whatever steps are necessary to protect these patients', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are attending a ward round in the psychiatry ward. A patient with depression is planned for electroconvulsive therapy (ECT). Before initiating treatment, the psychiatrist obtains informed consent from the patient and her attendant. This is an example of which of the following ethical principles?', null, 'Informed consent respects the patient''s autonomy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Competence', false, 1), ('B', 'Justice', false, 2), ('C', 'Autonomy', true, 3), ('D', 'Nonmaleficence', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Habitual consumption of paracetamol to relieve headache is related to which one of the following phenomena?', null, 'Taking paracetamol removes the unpleasant headache, so the behaviour is strengthened by negative reinforcement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Classical conditioning', false, 1), ('B', 'Negative reinforcement', true, 2), ('C', 'Positive reinforcement', false, 3), ('D', 'Aversion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'After breaking up with her boyfriend, Yangchen says, “I don’t think I have control over what is happening in my life”. Which of the following statements would describe Yangchen?', null, 'Believing life is controlled by outside forces is an external locus of control.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'She is a person with an internal locus of control', false, 1), ('B', 'She is a person who has achieved self-actualization', false, 2), ('C', 'She is a person with a great sense of direction', false, 3), ('D', 'She is a person with an external locus of control', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 1. List four common myths and facts about suicide. (0.5 × 4) (2 marks)', 'Myth: talking about suicide puts the idea in someone''s head - Fact: asking directly reduces risk and opens help. Myth: people who talk about suicide won''t do it - Fact: most people who die by suicide gave warning signs. Myth: suicide happens without warning - Fact: there are usually signs (talk of death, giving away belongings, withdrawal). Myth: once suicidal, always suicidal / nothing can be done - Fact: suicidal crises are often temporary and suicide is preventable with help. (Also: myth that only people with mental illness die by suicide; myth that improvement means the danger has passed.)', null, '[{"point": "Myth: talking about suicide puts the idea in someone''s head - Fact: asking directly reduces risk and opens help. Myth: people who talk about suicide won''t do it - Fact: most people who die by suicide gave warning signs. Myth: suicide happens without warning - Fact: there are usually signs (talk of death, giving away belongings, withdrawal). Myth: once suicidal, always suicidal / nothing can be done - Fact: suicidal crises are often temporary and suicide is preventable with help. (Also: myth that only people with mental illness die by suicide; myth that improvement means the danger has passed.)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 2. List four common clinical features of antisocial personality disorder. (0.5 × 4) (2 marks)', 'Any four: repeated violation of the rights of others and of laws (repeated arrests); deceitfulness and lying, conning others; impulsivity and failure to plan; irritability and aggressiveness, fights and assaults; reckless disregard for the safety of self or others; consistent irresponsibility (work, finances); lack of remorse; onset with conduct disorder before age 15, diagnosed at age 18 or above.', null, '[{"point": "Any four: repeated violation of the rights of others and of laws (repeated arrests); deceitfulness and lying, conning others; impulsivity and failure to plan; irritability and aggressiveness, fights and assaults; reckless disregard for the safety of self or others; consistent irresponsibility (work, finances); lack of remorse; onset with conduct disorder before age 15, diagnosed at age 18 or above.", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 3. Define transference. (1 marks)', 'Transference is the unconscious redirection by a client onto the therapist of feelings, attitudes and expectations originally felt towards important people in the client''s past (e.g. a parent).', null, '[{"point": "Transference is the unconscious redirection by a client onto the therapist of feelings, attitudes and expectations originally felt towards important people in the client''s past (e.g. a parent).", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 4. Discuss some of the salient points you need to consider in a psychiatric interview. (5 marks)', 'Setting: private, quiet, safe room with seating arrangement allowing safety; introduce yourself, explain purpose, confidentiality and its limits, and obtain consent. Build rapport with empathy, respect and a non-judgemental attitude; use open-ended questions first, then closed questions to clarify; active listening, facilitation, summarising; avoid leading and multiple questions. Cover: presenting complaints, history of present illness, past psychiatric and medical history, substance use, family history, personal and social history, premorbid personality, forensic history; mental status examination; risk assessment (suicide, harm to others, self-neglect, vulnerability); collateral history from family. Be culturally sensitive (beliefs, language), attend to non-verbal cues, manage time, handle sensitive topics tactfully, and document carefully. End by summarising, giving feedback, planning management and follow-up.', null, '[{"point": "Setting: private, quiet, safe room with seating arrangement allowing safety; introduce yourself, explain purpose, confidentiality and its limits, and obtain consent. Build rapport with empathy, respect and a non-judgemental attitude; use open-ended questions first, then closed questions to clarify; active listening, facilitation, summarising; avoid leading and multiple questions. Cover: presenting complaints, history of present illness, past psychiatric and medical history, substance use, family history, personal and social history, premorbid personality, forensic history; mental status examination; risk assessment (suicide, harm to others, self-neglect, vulnerability); collateral history from family. Be culturally sensitive (beliefs, language), attend to non-verbal cues, manage time, handle sensitive topics tactfully, and document carefully. End by summarising, giving feedback, planning management and follow-up.", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
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
  values ('ME', 'short_answer', 'Part II 5. Define culture-bound syndrome. Give TWO examples of culture-bound syndromes. (1 + 1) (2 marks)', 'A culture-bound syndrome is a pattern of unusual behaviour and experience recognised as an illness within a particular culture or locality, with local explanations, that does not fit neatly into standard psychiatric categories (now ''cultural concepts of distress'' in DSM-5). Examples: koro (fear that the genitals are retracting into the body - South and East Asia); dhat syndrome (anxiety about loss of semen - South Asia); amok (sudden violent outburst - Malaysia); latah; ataque de nervios; spirit possession states.', null, '[{"point": "A culture-bound syndrome is a pattern of unusual behaviour and experience recognised as an illness within a particular culture or locality, with local explanations, that does not fit neatly into standard psychiatric categories (now ''cultural concepts of distress'' in DSM-5). Examples: koro (fear that the genitals are retracting into the body - South and East Asia); dhat syndrome (anxiety about loss of semen - South Asia); amok (sudden violent outburst - Malaysia); latah; ataque de nervios; spirit possession states.", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 5, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 6. Enlist the steps of progression of substance use. Using an example of ''alcohol use'', describe the steps of progression briefly. (3 marks)', 'Steps: experimentation/ initiation → social or recreational (regular) use → risky/ problematic use (abuse/ harmful use) → dependence (addiction). Alcohol example: a young person first tastes ara or beer at a festival out of curiosity (experimentation); then drinks with friends at weekends and celebrations (social use); drinking becomes frequent and heavy, with binges, hangovers, missed work and family quarrels (harmful use); finally he craves alcohol, needs more for the same effect (tolerance), has withdrawal tremors in the morning, drinks to relieve them and cannot cut down despite liver problems (dependence).', null, '[{"point": "Steps: experimentation/ initiation → social or recreational (regular) use → risky/ problematic use (abuse/ harmful use) → dependence (addiction). Alcohol example: a young person first tastes ara or beer at a festival out of curiosity (experimentation); then drinks with friends at weekends and celebrations (social use); drinking becomes frequent and heavy, with binges, hangovers, missed work and family quarrels (harmful use); finally he craves alcohol, needs more for the same effect (tolerance), has withdrawal tremors in the morning, drinks to relieve them and cannot cut down despite liver problems (dependence).", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 6, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 7. Discuss some of the mental health promotion activities you can carry out in districts as clinical counsellors. (3 marks)', 'Awareness and anti-stigma campaigns (World Mental Health Day, Suicide Prevention Day) through community meetings, radio and social media; school and college programmes on life skills, stress management, bullying, substance use and suicide prevention; workplace wellbeing sessions; training gatekeepers (teachers, religious figures, local leaders, health workers) in psychological first aid and identifying people at risk; screening camps (PHQ-9, GAD-7, AUDIT) with referral; parenting and family programmes; support groups for people with alcohol use problems and caregivers; promoting help-seeking and information on available services and helplines; collaboration with Dzongkhag administration, schools, police and NGOs.', null, '[{"point": "Awareness and anti-stigma campaigns (World Mental Health Day, Suicide Prevention Day) through community meetings, radio and social media; school and college programmes on life skills, stress management, bullying, substance use and suicide prevention; workplace wellbeing sessions; training gatekeepers (teachers, religious figures, local leaders, health workers) in psychological first aid and identifying people at risk; screening camps (PHQ-9, GAD-7, AUDIT) with referral; parenting and family programmes; support groups for people with alcohol use problems and caregivers; promoting help-seeking and information on available services and helplines; collaboration with Dzongkhag administration, schools, police and NGOs.", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 7, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II 8. List four common causes of school refusal in children and adolescents. (0.5 × 4) (2 marks)', 'Any four: separation anxiety (younger children); social anxiety or specific fears at school; bullying or peer conflict; depression; academic difficulties or learning disorders; family problems (parental conflict, illness, domestic violence); problems with a teacher; trauma; positive reinforcement of staying home (screen time, attention).', null, '[{"point": "Any four: separation anxiety (younger children); social anxiety or specific fears at school; bullying or peer conflict; depression; academic difficulties or learning disorders; family problems (parental conflict, illness, domestic violence); problems with a teacher; trauma; positive reinforcement of staying home (screen time, attention).", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-part2', 8, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'S8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S8' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 1. A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, ''I don''t know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.'' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.

a) What is the most probable diagnosis with the available information, and what other relevant information is missing from the above history to come to a diagnosis? (2 marks)', 'a) Obsessive-compulsive disorder (OCD), predominantly contamination obsessions with washing compulsions. Missing information: whether the thoughts are intrusive, unwanted and recognised as his own (ego-dystonic), his degree of insight and attempts to resist; other obsessions or compulsions (checking, counting); time taken (more than 1 hour a day) and impairment; comorbid depression or anxiety; absence of psychotic features; substance use or medical causes; family history; past episodes and treatment.', null, '[{"point": "Obsessive-compulsive disorder (contamination obsessions with washing compulsions)", "marks": 1}, {"point": "Missing: whether thoughts are intrusive/ unwanted and recognised as own (insight), resistance, other obsessions/ compulsions, time >1 h/day, depression/ other comorbidity, substance/ medical causes, family history, psychotic features", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b1', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B1a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B1a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B1a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 1. A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, ''I don''t know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.'' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.

b) Describe the learning theorist''s perspective on the causation of the above disorder. (2 marks)', 'b) Learning theory (Mowrer''s two-factor theory): through classical conditioning, a neutral stimulus (dirt, cow faeces) becomes associated with anxiety; through operant conditioning, washing reduces the anxiety, so the compulsion is negatively reinforced and repeated. Avoidance and washing prevent him from learning that the feared outcome does not occur, so the anxiety never extinguishes and the cycle strengthens.', null, '[{"point": "Two-factor (Mowrer): classical conditioning pairs neutral stimulus (dirt) with anxiety; washing reduces anxiety → negative reinforcement (operant) maintains compulsions; avoidance prevents extinction", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b1', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B1b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B1b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B1b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 1. A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, ''I don''t know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.'' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.

c) List two defence mechanisms significantly associated with the above disorder. (1 mark)', 'c) Isolation (of affect) and undoing (also reaction formation).', null, '[{"point": "Isolation of affect, undoing (also reaction formation)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b1', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B1c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B1c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 1. A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, ''I don''t know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.'' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.

d) What is the psychotherapy of choice for the above disorder? Discuss how you would apply it in this case. (4 marks)', 'd) Cognitive behavioural therapy with exposure and response prevention (ERP) is the psychotherapy of choice. Application: build rapport and give psychoeducation about OCD and the obsession-compulsion cycle; assess and rate severity (Y-BOCS); create a hierarchy of contamination triggers from least to most anxiety-provoking (touching a door handle, the floor, the cowshed gate, cow dung); expose him gradually to each item while he refrains from washing (or delays and shortens washing), staying with the anxiety until it falls; set daily homework and self-monitoring; address cognitive distortions (overestimation of threat, intolerance of uncertainty); involve his family to stop reassurance and accommodation; and plan relapse prevention. Combine with an SSRI if severe.', null, '[{"point": "CBT with exposure and response prevention (ERP): psychoeducation, hierarchy of contamination triggers (cow dung, dirt), graded exposure while preventing washing, homework, family involvement, relapse prevention", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b1', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B1d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B1d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'B1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B1d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 1. A 34-year-old father of two children was brought to the psychiatry outpatient department (OPD) for assessment by his daughter. He expressed, ''I don''t know what has happened to me; I have to wash my hands repeatedly upon the slightest contact with contaminants.'' The patient had been apparently well until two years ago. Since then, he began noticing increasing anxiety and distress related to contamination. He became bothered by the faeces of his cows and dirt in his house. Gradually, he realised that washing his hands with soap after any contact with dirt lowered his anxiety. He spent about 10-15 minutes washing his hands each time and washed them approximately ten times a day. The frequency of hand washing has been increasing and has started affecting his daily routines.

e) Describe the prognosis of this disorder. (1 mark)', 'e) OCD is usually chronic with a waxing and waning course; about 20-30% improve markedly, 40-50% moderately, and 20-40% remain ill or worsen. Better prognosis: good insight, early treatment, a precipitating event, episodic symptoms and good social functioning.', null, '[{"point": "Chronic, waxing and waning course; about 20-30% marked improvement, 40-50% moderate, 20-40% remain ill or worsen; better with good insight, early treatment, precipitating event, episodic course", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b1', 5, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B1e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B1e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 2. You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.

a) As a clinical counsellor, what should you do regarding the information you obtained about the rape? (1 mark)', 'a) Because she is a child and is being sexually abused, her safety comes before confidentiality: explain this to her and her mother sensitively, ensure she is not left in danger, report the case to the police and child protection authorities as required by law, arrange a medical examination and document carefully. The mother''s financial worry cannot justify leaving the child exposed to ongoing abuse.', null, '[{"point": "Child sexual abuse overrides confidentiality: ensure her immediate safety and report to the police/ child protection authority as required by law; document; inform the treating team", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b2', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B2a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B2a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 2. You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.

b) Name 2 agencies where you can possibly seek clarification or report such cases. (2 marks)', 'b) Royal Bhutan Police (Women and Child Protection Desk/ Unit); the national child protection agency (formerly the National Commission for Women and Children) and Dzongkhag protection officers; RENEW (Respect, Educate, Nurture and Empower Women); the hospital''s one-stop crisis centre or social worker.', null, '[{"point": "Any two: Royal Bhutan Police (Women and Child Protection Desk/ Unit), the national child protection agency (formerly NCWC) and Dzongkhag protection officers, RENEW, hospital one-stop crisis centre, legal aid", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b2', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B2b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B2b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B2b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 2. You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.

c) Discuss how victims (children and adolescents) of rape would present to hospitals. (2 marks)', 'c) Physical: genital or anal injury, bleeding, pain, urinary infections, sexually transmitted infections, pregnancy, recurrent abdominal pain, headaches and other somatic complaints. Psychological and behavioural: fear, withdrawal, nightmares, flashbacks, sleep problems, sudden drop in school performance, school refusal, running away, sexualised behaviour, self-harm or suicide attempts, substance use, depression and anxiety. Many present late or only with non-specific complaints.', null, '[{"point": "Presentations: genital injury/ bleeding/ pain, STIs, pregnancy, abdominal pain, somatic complaints; behavioural: fear, withdrawal, nightmares, sexualised behaviour, school decline, running away, self-harm, substance use, depression/ PTSD", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b2', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B2c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B2c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B2c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 2. You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.

d) List 2 risk factors for PTSD. (1 mark)', 'd) Interpersonal and sexual trauma, especially repeated abuse by a trusted person; female sex; young age; previous trauma or mental illness; lack of social support; continued exposure to the perpetrator.', null, '[{"point": "Any two: severity/ interpersonal (sexual) nature of trauma, repeated trauma, female sex, young age, prior trauma or mental illness, poor social support, ongoing exposure to perpetrator", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b2', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B2d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B2d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B2d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 2. You are assessing a 14-year-old girl. You realise that she has post-traumatic stress disorder (PTSD), likely resulting from rape by her stepfather. When you discuss this with her mother, she explains that the stepfather is the sole breadwinner of the family, and they cannot afford to lose his financial support to run the household.

e) Discuss the psychosocial aspect of the management of this case. (4 marks)', 'e) Ensure safety - removal from the perpetrator through child protection services, temporary shelter if needed. Provide trauma-focused CBT (psychoeducation, relaxation, emotional regulation, trauma narrative, cognitive processing, safety planning) and supportive counselling; work with the mother - support her emotionally, link the family with social welfare and financial support, livelihood help and legal aid so she can protect the child; family therapy when appropriate; liaise with the school for academic support and reduced stigma; coordinate with police and court processes (child-friendly procedures); screen for depression and suicide risk, with referral to a psychiatrist if needed; and regular follow-up.', null, '[{"point": "Safety (separate from perpetrator, shelter), trauma-focused CBT, supportive counselling, support mother (financial/ social welfare support, legal aid), family therapy, school liaison, coordination with police/ courts, follow-up", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b2', 5, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B2e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B2e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'B2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B2e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B2e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 3. Sonam is a 40-year-old man who is undergoing alcohol detox in the hospital. During a session, he made the following statement: ''I know drinking alcohol is a problem and that it is causing disharmony in my family. But I tell you that I can control it. After detox treatment, I am confident now to stop it completely.''

a) According to Prochaska and DiClemente''s Transtheoretical Model of Change, what stage of change is Sonam in? (1 mark)', 'a) Preparation (determination) stage: he recognises that drinking is a problem and plans to stop completely after detox. (His statement ''I can control it'' shows some remaining ambivalence from contemplation.)', null, '[{"point": "Preparation (determination) stage - recognises problem and intends to stop soon (some ambivalence: ''I can control it'')", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b3', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B3a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B3a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 3. Sonam is a 40-year-old man who is undergoing alcohol detox in the hospital. During a session, he made the following statement: ''I know drinking alcohol is a problem and that it is causing disharmony in my family. But I tell you that I can control it. After detox treatment, I am confident now to stop it completely.''

b) List 2 characteristics of the stage of change Sonam is in. (2 marks)', 'b) He acknowledges the problem and its consequences; he intends to change in the near future (within the next month); he has started planning or taking small steps (detox); he expresses confidence, though ambivalence and over-confidence may remain.', null, '[{"point": "Intends to act in near future, recognises problem, some planning/ small steps, confidence, residual ambivalence", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b3', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B3b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B3b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B3b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 3. Sonam is a 40-year-old man who is undergoing alcohol detox in the hospital. During a session, he made the following statement: ''I know drinking alcohol is a problem and that it is causing disharmony in my family. But I tell you that I can control it. After detox treatment, I am confident now to stop it completely.''

c) Discuss how you would motivate him using the principles and techniques of motivational interviewing. (5 marks)', 'c) Use motivational interviewing''s spirit (collaboration, evocation, autonomy, compassion) and principles: express empathy through reflective listening (''Your family''s harmony matters a lot to you''); develop discrepancy between his values (family, health) and his drinking; roll with resistance - don''t argue about ''I can control it'', explore it; support self-efficacy by affirming his decision and past strengths. Techniques - OARS: open questions (''What would be different if you stopped?''), affirmations, reflections and summaries; elicit and reinforce change talk; explore the decisional balance (pros and cons of drinking and stopping); use importance and confidence rulers; then build a concrete change plan together - goal of abstinence, coping with triggers and cravings, avoiding drinking situations, support from family and groups (AA), medication if prescribed and follow-up - and plan for possible lapses without shame.', null, '[{"point": "MI principles (express empathy, develop discrepancy, roll with resistance, support self-efficacy) and OARS/ change talk, decisional balance, eliciting goals, collaborative change plan", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b3', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B3c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B3c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'B3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B3c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'B3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 3. Sonam is a 40-year-old man who is undergoing alcohol detox in the hospital. During a session, he made the following statement: ''I know drinking alcohol is a problem and that it is causing disharmony in my family. But I tell you that I can control it. After detox treatment, I am confident now to stop it completely.''

d) List 4 common mental health consequences of alcohol use disorder. (2 marks)', 'd) Depression, anxiety disorders, suicide and self-harm, alcohol-induced psychotic disorder (alcoholic hallucinosis), delirium tremens, Wernicke-Korsakoff syndrome and alcohol-related dementia, sleep disorders, and other substance use.', null, '[{"point": "Any four: depression, anxiety, suicide/ self-harm, alcohol-induced psychosis/ hallucinosis, delirium tremens, Wernicke-Korsakoff syndrome/ dementia, sleep problems, other substance use", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b3', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B3d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B3d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B3d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B3d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B3d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 4. Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.

a) What is the most likely phenomenon that Zangmo is suffering from? (1 mark)', 'a) Burnout - an occupational phenomenon resulting from chronic workplace stress that has not been managed (WHO ICD-11), with exhaustion, mental distance/ cynicism and reduced professional efficacy.', null, '[{"point": "Burnout (occupational burnout from chronic workplace stress)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b4', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B4a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B4a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 4. Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.

b) Describe the pathophysiology of her symptoms. (2 marks)', 'b) Prolonged stress keeps the stress response switched on: the hypothalamic-pituitary-adrenal axis and sympathetic nervous system are chronically activated, cortisol rhythms become dysregulated and inflammatory cytokines rise. This leads to fatigue, tension headaches, poor sleep, irritability and reduced concentration. Psychologically, resources are depleted, causing emotional exhaustion, then depersonalisation (detachment from students) as a coping response, and reduced sense of accomplishment and performance.', null, '[{"point": "Chronic stress → sustained HPA axis and sympathetic activation, cortisol dysregulation, inflammation → fatigue, headaches, insomnia, irritability; psychological: emotional exhaustion, depersonalisation, reduced accomplishment", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b4', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B4b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B4b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B4b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 4. Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.

c) List 4 probable causes of this phenomenon. (2 marks)', 'c) Excessive workload and extra responsibilities; staff shortage after colleagues resigned; lack of control over work demands; insufficient recognition or reward; lack of support from administration; role conflict and ambiguity; poor work-life balance; perfectionism and high dedication.', null, '[{"point": "Any four: excessive workload/ extra responsibilities, staff shortage, lack of control, insufficient reward/ recognition, lack of support, role conflict/ ambiguity, poor work-life balance, value mismatch", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b4', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B4c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B4c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B4c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 4. Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.

d) If Zangmo does not receive timely help, list 2 common psychiatric disorders that she is at risk for. (1 mark)', 'd) Depression and anxiety disorders (also insomnia and harmful use of alcohol or other substances).', null, '[{"point": "Depression and anxiety disorders (also insomnia, substance use)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b4', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B4d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B4d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B4d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 4. Zangmo is a dedicated high school teacher who loves her job. However, over the past few weeks, she has felt increasingly overwhelmed. She spends long hours preparing lesson plans, grading papers and dealing with administrative tasks because she has been handed extra responsibilities after her friends resigned to go to Australia, and the school is facing human resource constraints. Zangmo experiences fatigue, headaches and difficulty sleeping due to stress. She feels irritable, detached from her students and lacks enthusiasm for teaching. She has become less patient with her students, and her performance evaluations have declined. Despite these challenges, she does not yet qualify for any major psychiatric diagnosis.

e) As a clinical counsellor, how would you address her issue? (4 marks)', 'e) Build rapport and assess thoroughly (stress, sleep, mood, suicide risk, substance use) to rule out depression; give psychoeducation about burnout and validate her experience; teach stress management - relaxation and breathing exercises, mindfulness, regular exercise, sleep hygiene, healthy diet; use CBT and problem-solving to address perfectionist thoughts and prioritise tasks, time management and setting boundaries (saying no, delegating); encourage social support and enjoyable activities; with her consent, liaise with the principal or Dzongkhag education office to reduce workload, share responsibilities or arrange relief staff and leave; schedule follow-up sessions and refer to a psychiatrist if symptoms worsen.', null, '[{"point": "Assessment (rule out depression), psychoeducation, stress management (relaxation, mindfulness, sleep hygiene, exercise), CBT/ problem solving, time management, boundaries, social support, liaise with school for workload/ HR support (with consent), leave, follow-up, referral if needed", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b4', 5, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B4e', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B4e' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'B4e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B4e';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B4e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 5. Gem is a 26-year-old woman who has a history of multiple non-suicidal self-injuries (cutting her arms and legs) since her teenage years. She experiences chronic suicidal ideation, finding relief in thoughts of suicide as a ''way out''. She struggles with her identity and is impulsive. She frequently changes her job due to repeated interpersonal conflicts. Her relationship with her partner is volatile, swinging between intense affection and moments of disdain.

a) What is the most probable diagnosis with the available information? Why? (2 marks)', 'a) Borderline personality disorder: a long-standing pattern since adolescence of recurrent self-harm and chronic suicidal ideation, identity disturbance, impulsivity, and unstable, intense relationships alternating between idealisation and devaluation, with repeated interpersonal conflicts.', null, '[{"point": "Borderline personality disorder: recurrent self-harm, chronic suicidal ideation, identity disturbance, impulsivity, unstable intense relationships (idealisation-devaluation), long-standing since adolescence", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b5', 1, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B5a', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B5a' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B5a';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B5a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 5. Gem is a 26-year-old woman who has a history of multiple non-suicidal self-injuries (cutting her arms and legs) since her teenage years. She experiences chronic suicidal ideation, finding relief in thoughts of suicide as a ''way out''. She struggles with her identity and is impulsive. She frequently changes her job due to repeated interpersonal conflicts. Her relationship with her partner is volatile, swinging between intense affection and moments of disdain.

b) What is the psychotherapy of choice for Gem? List its components. (3 marks)', 'b) Dialectical behaviour therapy (DBT, Marsha Linehan). Components: individual therapy; group skills training (four modules - mindfulness, distress tolerance, emotion regulation, interpersonal effectiveness); telephone coaching between sessions; and a therapist consultation team.', null, '[{"point": "Dialectical behaviour therapy (DBT); components: individual therapy, group skills training (mindfulness, distress tolerance, emotion regulation, interpersonal effectiveness), telephone coaching, therapist consultation team", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b5', 2, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B5b', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B5b' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'B5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B5b';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B5b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 5. Gem is a 26-year-old woman who has a history of multiple non-suicidal self-injuries (cutting her arms and legs) since her teenage years. She experiences chronic suicidal ideation, finding relief in thoughts of suicide as a ''way out''. She struggles with her identity and is impulsive. She frequently changes her job due to repeated interpersonal conflicts. Her relationship with her partner is volatile, swinging between intense affection and moments of disdain.

c) Describe any 2 of the components you mentioned in b). (3 marks)', 'c) Skills training: in weekly groups patients learn mindfulness (observing and describing without judgement), distress tolerance (surviving crises without self-harm - TIPP, distraction, self-soothing, radical acceptance), emotion regulation (identifying and changing emotions, reducing vulnerability) and interpersonal effectiveness (asking for needs and saying no while keeping relationships and self-respect, e.g. DEAR MAN). Individual therapy: weekly sessions use diary cards and chain analysis of self-harm and other target behaviours, prioritising life-threatening behaviour, then therapy-interfering and quality-of-life behaviours, balancing acceptance and change. (Telephone coaching helps generalise skills to real-life crises.)', null, '[{"point": "Two components described accurately (e.g. skills training modules, individual therapy with diary cards and chain analysis, phone coaching)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b5', 3, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B5c', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B5c' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'B5c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'B5c';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B5c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'long_answer', 'Section B, question 5. Gem is a 26-year-old woman who has a history of multiple non-suicidal self-injuries (cutting her arms and legs) since her teenage years. She experiences chronic suicidal ideation, finding relief in thoughts of suicide as a ''way out''. She struggles with her identity and is impulsive. She frequently changes her job due to repeated interpersonal conflicts. Her relationship with her partner is volatile, swinging between intense affection and moments of disdain.

d) How would you manage it if Gem presented to you with active suicidal ideation? (2 marks)', 'd) Take it seriously: assess risk immediately - current plan, means, intent, recent self-harm, substance use, protective factors; ensure safety - do not leave her alone, remove means; stay calm and validating; make a collaborative safety plan (warning signs, coping skills, people and helplines to contact); involve family or partner with her consent; refer urgently to a psychiatrist and arrange hospital admission if risk is high or imminent; follow up closely and document.', null, '[{"point": "Risk assessment (plan, means, intent), ensure safety (not alone, remove means), collaborative safety plan, involve family and psychiatrist, hospitalise if high risk, follow-up", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, Clinical Counselling", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-counsel2024-b5', 4, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'B5d', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'B5d' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'B5d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'B5d';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'B5d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Logotherapy, which helps clients find meaning in life, was developed by', null, 'Viktor Frankl founded logotherapy (''Man''s Search for Meaning'').', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Viktor Frankl', true, 1), ('B', 'Eric Berne', false, 2), ('C', 'Fritz Perls', false, 3), ('D', 'Albert Ellis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Selective serotonin reuptake inhibitors (SSRIs) mainly increase the availability of', null, 'SSRIs block serotonin reuptake, increasing serotonin in the synapse.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'acetylcholine', false, 1), ('B', 'serotonin', true, 2), ('C', 'dopamine', false, 3), ('D', 'GABA', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Systematic desensitisation, pairing relaxation with a graded hierarchy of feared situations, was developed by', null, 'Joseph Wolpe developed systematic desensitisation based on reciprocal inhibition.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Carl Rogers', false, 1), ('B', 'Aaron Beck', false, 2), ('C', 'Ivan Pavlov', false, 3), ('D', 'Joseph Wolpe', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Rational Emotive Behaviour Therapy (REBT), using the ABC model, was developed by', null, 'Albert Ellis: Activating event - Beliefs - Consequences.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'clinical-counselling'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Clinical Counselling): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'clinical-counselling'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Albert Ellis', true, 1), ('B', 'Abraham Maslow', false, 2), ('C', 'Donald Meichenbaum', false, 3), ('D', 'Sigmund Freud', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
commit;
