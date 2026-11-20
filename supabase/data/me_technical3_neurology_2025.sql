-- ME Paper III (Technical, Neurology): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'neurology', 'Neurology' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'neurology') is null then raise exception 'unknown specialisation neurology'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'neurology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'neurology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Neurology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'neurology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Neurology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'neurology'), null, 3, 'Section B: Two compulsory questions', 'passage', 2, 25, null, 'BCSE 2025 Main Examination, Technical Paper III, Neurology');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 22-year-old boxer is hit with a powerful hook to the head. He remains standing but appears momentarily dazed and confused, though he does not lose consciousness. Minutes later, he develops a severe headache, nausea, and then a rapidly declining level of consciousness. What is the most likely neuropathology?', null, 'Brief confusion, lucid interval, then rapid decline = epidural haematoma (middle meningeal artery).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Diffuse axonal injury', false, 1), ('B', 'Epidural hematoma', true, 2), ('C', 'Acute subdural hematoma', false, 3), ('D', 'Cerebral contusion', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 64-year-old male with HIV (CD4 80), on no ART, presents with subacute headache, cranial nerve VI palsy, and low-grade fever for 2 weeks. CSF shows: • WBC 150 (lymphocytic predominance) • Protein 120 mg/dL • Glucose 30 mg/dL (serum glucose 90) • India ink stain positive. MRI reveals basilar meningeal enhancement and multiple small infarcts. What is the most likely causative organism?', null, 'India ink positive in advanced HIV = Cryptococcus neoformans.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mycobacterium tuberculosis', false, 1), ('B', 'Treponema pallidum', false, 2), ('C', 'Listeria monocytogenes', false, 3), ('D', 'Cryptococcus neoformans', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 35-year-old woman presents with recurrent episodes of encephalopathy, psychosis, and seizures. MRI shows T2 hyperintensities in the medial temporal lobes. Serum anti-NMDA receptor antibodies are positive. What is the most likely underlying tumor?', null, 'Anti-NMDA receptor encephalitis in young women is associated with ovarian teratoma.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ovarian teratoma', true, 1), ('B', 'Thymoma', false, 2), ('C', 'Hodgkin’s lymphoma', false, 3), ('D', 'Small cell lung cancer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 25-year-old man presents with acute psychosis, catatonia, and orofacial dyskinesias. MRI shows bilateral basal ganglia necrosis. Serum ceruloplasmin is low. What is the most likely copper metabolism defect?', null, 'Wilson disease (ATP7B): copper is not incorporated into apoceruloplasmin or excreted in bile.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Impaired copper incorporation into apoceruloplasmin', true, 1), ('B', 'Mutation in COMMD1 (Bedlington terrier mutation)', false, 2), ('C', 'Zinc-induced metallothionein sequestration', false, 3), ('D', 'Defective ATP7A-mediated copper transport', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', '25-year-old woman presents with acute-onset quadriplegia, areflexia, and respiratory failure. CSF shows albumin-cytologic dissociation. Nerve conduction studies reveal absent sensory responses and prolonged distal motor latencies. What is the most likely diagnosis?', null, 'Prolonged distal motor latencies (demyelination) with absent sensory responses = AIDP.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Acute Motor-Sensory Axonal Neuropathy (AMSAN)', false, 1), ('B', 'Bickerstaff brainstem encephalitis', false, 2), ('C', 'Classic Guillain-Barré syndrome (AIDP)', true, 3), ('D', 'Acute motor axonal neuropathy (AMAN)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 55-year-old man presents with progressive bulbar palsy, fasciculations, and respiratory failure. EMG shows chronic neurogenic changes. Genetic testing reveals a hexanucleotide repeat expansion in C9ORF72. Which histopathological finding is most expected on autopsy?', null, 'C9ORF72 ALS/FTD shows TDP-43 inclusions.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Amyloid plaques', false, 1), ('B', 'Tau-positive neurofibrillary tangles', false, 2), ('C', 'Lewy bodies', false, 3), ('D', 'TDP-43 inclusions', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 30-year-old woman presents with bilateral ptosis, ophthalmoplegia, and fatigable weakness. Repetitive nerve stimulation shows decrement. However, anti-AChR/MuSK antibodies are negative. What is the next best diagnostic test?', null, 'In seronegative myasthenia, test anti-LRP4 antibodies next.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anti-VGCC antibodies', false, 1), ('B', 'Anti-GQ1b antibodies', false, 2), ('C', 'Anti-LRP4 antibodies', true, 3), ('D', 'Anti-GAD65 antibodies', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 6-year-old with VP shunt for congenital hydrocephalus develops fever, shunt malfunction, and abdominal pain. CSF from shunt tap grows coagulase negative Staphylococcus (methicillin- resistant, biofilm producer).What is the most definitive management?', null, 'Infected shunts with biofilm need removal, external drainage and IV vancomycin.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vancomycin + rifampin for 14 days', false, 1), ('B', 'Shunt externalization + intraventricular daptomycin', false, 2), ('C', 'Intra-shunt vancomycin flushes + oral linezolid', false, 3), ('D', 'Shunt removal + EVD placement + IV vancomycin', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 50-year-old man with smoldering multiple myeloma develops progressive polyneuropathy, organomegaly, and endocrinopathy. Serum VEGF is elevated. Nerve biopsy shows microvascular endothelial hyperplasia. What is the most likely diagnosis?', null, 'Polyneuropathy, organomegaly, endocrinopathy, M-protein, high VEGF = POEMS syndrome.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'POEMS syndrome', true, 1), ('B', 'AL amyloidosis', false, 2), ('C', 'CIDP associated with paraproteinemia', false, 3), ('D', 'Light chain deposition disease', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 35-year-old woman with SLE develops refractory status epilepticus. MRI shows bilateral mesial temporal lobe T2 hyperintensities. CSF reveals lymphocytic pleocytosis and anti-NMDA receptor antibodies. What is the most appropriate treatment?', null, 'First-line for anti-NMDA receptor encephalitis: high-dose steroids with IVIg (or plasma exchange).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Plasmapheresis + anakinra', false, 1), ('B', 'High-dose steroids + IVIg', true, 2), ('C', 'Tocilizumab + bortezomib', false, 3), ('D', 'Rituximab + cyclophosphamide', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 50-year-old man presents with subacute dementia, myoclonus, and cortical blindness. EEG shows periodic sharp waves. CSF neurofilament light chain (NfL) is markedly elevated. What is the most likely diagnosis?', null, 'Rapid dementia, myoclonus, cortical blindness (Heidenhain), periodic sharp waves = sporadic CJD.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Primary CNS lymphoma', false, 1), ('B', 'Paraneoplastic encephalomyelitis', false, 2), ('C', 'Sporadic CJD', true, 3), ('D', 'Limbic encephalitis', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 45-year-old man with chronic alcoholism develops ophthalmoplegia, ataxia, and confusion. MRI shows bilateral medial thalamic and periaqueductal gray matter hyperintensities. Thiamine supplementation leads to partial improvement. What is the most likely underlying biochemical defect?', null, 'A transketolase variant with reduced thiamine affinity predisposes to Wernicke-Korsakoff.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Defective transketolase enzyme binding affinity', true, 1), ('B', 'Mitochondrial pyruvate carrier (MPC) dysfunction', false, 2), ('C', 'Impaired thiamine pyrophosphokinase (TPK) activity', false, 3), ('D', 'Glucose transporter 1 (GLUT1) deficiency', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 54 years old chronic alcoholic man from Samtse presented with acute onset mental state change and double vision. Physical examination revealed disorientation to time place and person, decreased attention span and memory loss. Neurological examination revealed horizontal nystagmus and ataxia. Which of the following neurological findings is most likely to persist despite Thiamine replacement?', null, 'Memory loss (Korsakoff amnesia) often persists despite thiamine; eye signs recover first.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ophthalmopathy', false, 1), ('B', 'Memory loss', true, 2), ('C', 'Disorientation', false, 3), ('D', 'Ataxia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 55-year-old renal transplant recipient on long-term tacrolimus and prednisone presents with subacute cognitive decline, multifocal neurological deficits, and ring-enhancing periventricular lesions on MRI showing partial regression after high-dose dexamethasone. Immunohistochemistry reveals a CD20+ neoplasm with prominent angiocentric growth patterns.Given the tumor''s predilection for immunocompromised hosts, periventricular tropism, and steroid-responsive biology, which of the following is the most likely diagnosis?', null, 'Periventricular, steroid-responsive CD20+ tumour in an immunosuppressed host = primary CNS lymphoma.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Medulloblastoma (WHO Grade IV)', false, 1), ('B', 'Ependymoma (WHO Grade II/III)', false, 2), ('C', 'Glioblastoma (IDH-wildtype)', false, 3), ('D', 'Primary CNS Lymphoma (Diffuse Large B-Cell Type)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'All of the following regarding CJD are true except?', null, 'False: myoclonus is very common in CJD.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Brain biopsy is specific for diagnosis.', false, 1), ('B', 'It is caused by infectious prions', false, 2), ('C', 'Myoclonus is rarely seen', true, 3), ('D', 'It is a neuro degenerative disease', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Distant systemic cancer most likely would produce which of the following neurologic syndrome?', null, 'Peripheral neuropathy is the commonest remote (paraneoplastic) neurological effect of systemic cancer.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cranial nerve palsies', false, 1), ('B', 'Generalised neuropathy', true, 2), ('C', 'Myasthenia gravis', false, 3), ('D', 'Non-inflammatory myopathy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Cataracts, frontal baldness, testicular atrophy and muscle weakness and wasting occur in association with which condition?', null, 'Cataracts, frontal baldness, testicular atrophy and distal wasting = myotonic dystrophy.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Myotonic dystrophy', true, 1), ('B', 'Pseudohypertrophic dystrophy', false, 2), ('C', 'Fascioscapulohumeral dystrophy', false, 3), ('D', 'Myotonia congenital', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A man has dyslexia without dysgraphia. Auditory comprehension is only slightly impaired. This man’s symptoms most likely are due to a lesion or lesions in', null, 'Alexia without agraphia: left occipital (parieto-occipital) lesion with splenium involvement.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'The left parietooccipital region', true, 1), ('B', 'The left temporal lobe, near Wernicke’s area', false, 2), ('C', 'Both temporal lobes', false, 3), ('D', 'The left frontal lobe, posterior to Broca’s area', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 60-year-old mildly obese lady complains of a very bothersome burning pain on the anterolateral aspect of the right thigh from the groin almost as far distally as the knee. Examination shows reduction of sensation to touch and pin prick in the affected area. There is no loss of muscle strength and reflexes are normal. What is the most likely doiagnosis?', null, 'Meralgia paraesthetica: compression of the lateral femoral cutaneous nerve.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prolapsed intervertebral disc', false, 1), ('B', 'Compression of the lateral femoral cutaneous nerve', true, 2), ('C', 'Disruption of lumbosacral plexus', false, 3), ('D', 'Nutritional neuropathy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 30-year-old man with a history of Hodgkin''s lymphoma presents with acute confusion and focal seizures. MRI shows numerous punctate foci of diffusion restriction throughout the cerebral hemispheres. MRA of the intracranial vessels is normal. CSF is significant for 45 white blood cells/µL (predominantly lymphocytes) and elevated IgG index. What is the most likely underlying pathophysiology?', null, 'Hodgkin''s lymphoma with multifocal small infarcts and inflammatory CSF suggests paraneoplastic CNS angiitis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paraneoplastic angiitis of the CNS', true, 1), ('B', 'Direct neoplastic infiltration of the meninges', false, 2), ('C', 'Chemotherapy-induced neurotoxicity', false, 3), ('D', 'Progressive multifocal leukoencephalopathy (PML)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 45-year-old man with chronic alcohol use disorder is brought in with generalized tonic-clonic seizures. His initial labs show a serum magnesium level of 0.9 mg/dL (severely low) and a calcium level of 6.8 mg/dL (low). Despite receiving IV calcium gluconate, his seizures persist. Which electrolyte replacement is most critical to stop his seizures?', null, 'Hypocalcaemia will not correct until severe hypomagnesaemia is treated with IV magnesium.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Vitamin D supplementation', false, 1), ('B', 'Intravenous hypertonic sodium chloride', false, 2), ('C', 'Intravenous magnesium sulphate', true, 3), ('D', 'Intravenous potassium chloride', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 12-year-old boy is brought for evaluation of worsening handwriting and a tendency to drop things with his right hand. On examination, he has a slow, twisting posture of his right arm that increases when he walks and disappears completely when he is asleep. His neurological exam is otherwise normal, including sensation. What is the most likely diagnosis?', null, 'Action-induced twisting posture that disappears in sleep = focal (writer''s) dystonia.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Focal dystonia', true, 1), ('B', 'Tardive dyskinesia', false, 2), ('C', 'Juvenile Parkinson''s disease', false, 3), ('D', 'Conversion disorder', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 28-year-old woman presents with a 6-month history of a continuous, unilateral, boring headache located behind her right eye. The pain is associated with ipsilateral conjunctival injection, lacrimation, and nasal congestion. Each attack lasts 45 minutes and occurs like clockwork at 2:00 AM, waking her from sleep. What is the most appropriate acute treatment?', null, 'High-flow oxygen is first-line acute treatment for cluster headache.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Paracetamol, caffeine and Ergotamine containing analgeic', false, 1), ('B', 'Oral naproxen sodium', false, 2), ('C', 'High-flow inhaled oxygen', true, 3), ('D', 'Oral sumatriptan', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A 45-year-old teacher describes brief episodes of vertigo (< 1 minute) that occur exclusively when she rolls over in bed to her left side or looks up to write on a whiteboard. The Dix-Hallpike test performed with her head turned to the left reproduces her symptoms with upbeat-torsional nystagmus. What is the first-line management?', null, 'Left posterior canal BPPV is treated with the Epley manoeuvre.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A course of high-dose oral corticosteroids', false, 1), ('B', 'MRI brain with contrast to rule out a cerebellopontine angle tumor', false, 2), ('C', 'The Epley maneuver', true, 3), ('D', 'Prescription of Betahistine/ Cinnarizine for symptomatic relief', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) Name the two core neurological components required for normal consciousness. (1 mark)', 'a) Arousal (wakefulness) and awareness (the content of consciousness).', null, '[{"point": "Arousal (wakefulness) and awareness (content)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s1', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S1a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Which ascending subcortical network is primarily responsible for arousal? (1 mark)', 'b) The ascending reticular activating system (brainstem reticular formation projecting via thalamus and hypothalamus to the cortex).', null, '[{"point": "Ascending reticular activating system", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s1', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S1b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'c) Which widespread cortical network is primarily responsible for awareness? (1 mark)', 'c) The bilateral cerebral cortex, especially the frontoparietal association network (with thalamocortical connections).', null, '[{"point": "Bilateral cerebral cortex - frontoparietal (association) network", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s1', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S1c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'd) A lesion in which specific brainstem region is most classically associated with coma? (1 mark)', 'd) The paramedian tegmentum of the upper pons and midbrain (rostral brainstem reticular formation).', null, '[{"point": "Rostral brainstem (paramedian upper pons/midbrain tegmentum) reticular formation", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s1', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S1d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'e) What key clinical feature distinguishes a persistent vegetative state from a minimally conscious state? (1 mark)', 'e) In a minimally conscious state there are definite, reproducible (though inconsistent) signs of awareness - e.g. following simple commands, visual pursuit or purposeful responses; in a persistent vegetative state there is wakefulness without any sign of awareness.', null, '[{"point": "MCS shows reproducible though inconsistent signs of awareness (command following, visual pursuit); PVS none", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s1', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S1e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S1e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'a) What is the term for diabetic autonomic neuropathy of the gastrointestinal tract causing delayed gastric emptying? (1 mark)', 'a) Diabetic gastroparesis.', null, '[{"point": "Diabetic gastroparesis", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s2', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S2a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'b) Name one specific test of cardiovascular autonomic reflex function. (1 mark)', 'b) Heart rate variation with deep breathing (or Valsalva ratio, heart rate response to standing (30:15 ratio), or postural blood pressure fall).', null, '[{"point": "Heart rate variability to deep breathing / Valsalva ratio / postural BP (orthostatic) / 30:15 ratio", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s2', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S2b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'c) What sweating abnormality is a common feature of diabetic autonomic neuropathy? (1 mark)', 'c) Distal anhidrosis (loss of sweating in the feet and legs) with compensatory hyperhidrosis of the trunk, or gustatory sweating.', null, '[{"point": "Distal anhidrosis with compensatory truncal hyperhidrosis or gustatory sweating", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s2', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S2c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'd) What urological complication commonly arises from autonomic neuropathy? (1 mark)', 'd) Neurogenic (atonic) bladder - incomplete emptying, urinary retention, overflow incontinence and recurrent UTIs.', null, '[{"point": "Neurogenic (atonic) bladder - retention, overflow incontinence, UTIs (also erectile dysfunction)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s2', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S2d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'e) Why is hypoglycaemia unawareness a dangerous consequence of autonomic neuropathy? (1 mark)', 'e) Because the sympathetic warning symptoms (sweating, tremor, palpitations, hunger) are lost, glucose can fall to dangerous levels without the patient noticing, leading to confusion, seizures, coma or death.', null, '[{"point": "Loss of adrenergic warning symptoms (sweating, tremor, palpitations) so severe hypoglycaemia, seizures, coma, death can occur without warning", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s2', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S2e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S2e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In Duchenne muscular dystrophy (DMD):

a) What is the pattern of inheritance? (1 mark)', 'a) X-linked recessive (affects boys; one-third new mutations).', null, '[{"point": "X-linked recessive", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s3', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S3a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In Duchenne muscular dystrophy (DMD):

b) Which specific protein is absent from the sarcolemma? (1 mark)', 'b) Dystrophin.', null, '[{"point": "Dystrophin", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s3', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S3b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In Duchenne muscular dystrophy (DMD):

c) What is a classic early clinical sign on examination? (1 mark)', 'c) Gowers'' sign (using the hands to climb up the legs when rising from the floor); also calf pseudohypertrophy and a waddling gait.', null, '[{"point": "Gowers'' sign (or calf pseudohypertrophy, waddling gait)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s3', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S3c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In Duchenne muscular dystrophy (DMD):

d) What is the pathological significance of a markedly raised serum creatine kinase (CK)? (1 mark)', 'd) It shows ongoing damage and necrosis of muscle fibres - without dystrophin the sarcolemma is fragile and leaks CK into the blood; CK is very high (10-100 times normal) from birth, before weakness appears.', null, '[{"point": "Ongoing muscle fibre membrane damage and necrosis leaking CK; raised from birth before symptoms", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s3', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S3d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'In Duchenne muscular dystrophy (DMD):

e) Name one common and serious cardiac manifestation of DMD. (1 mark)', 'e) Dilated cardiomyopathy (with heart failure and arrhythmias).', null, '[{"point": "Dilated cardiomyopathy (and arrhythmias/ heart failure)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s3', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S3e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.

a) His examination shows a striking intention tremor in his left arm on finger-nose testing. Which deep cerebellar nucleus, typically infarcted in SCA strokes, is mainly responsible for this tremor? (1 mark)', 'a) The dentate nucleus.', null, '[{"point": "Dentate nucleus", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s4', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S4a', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4a';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.

b) He also shows profound dysdiadochokinesia. Describe the neuroanatomical pathway (including the specific cerebellar peduncle) that is disrupted. (1 mark)', 'b) The dentato-rubro-thalamo-cortical pathway: fibres from the dentate nucleus leave through the superior cerebellar peduncle, cross in the midbrain to the contralateral red nucleus and ventrolateral thalamus, then project to the motor cortex, which controls the limb on the side of the cerebellar lesion (via the crossing corticospinal tract). Its disruption prevents smooth alternating movements.', null, '[{"point": "Dentato-rubro-thalamo-cortical pathway via superior cerebellar peduncle, decussating to contralateral red nucleus/ VL thalamus/ motor cortex", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s4', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S4b', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4b';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.

c) The ocular examination shows ipsilesional gaze-evoked nystagmus. Explain the failure of the neural integrator (a cerebellar function) that causes it. (1 mark)', 'c) The cerebellum (flocculus/paraflocculus) normally tunes the brainstem neural integrator that converts velocity commands into a sustained position signal to hold the eyes in eccentric gaze. When it fails (''leaky integrator''), the eyes drift back towards the centre and a corrective saccade brings them back, producing nystagmus beating towards the direction of gaze.', null, '[{"point": "Flocculus/ paraflocculus (with brainstem integrators) fails to hold eccentric gaze; eyes drift back to centre with corrective saccades towards target", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s4', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S4c', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4c';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.

d) Despite the vertigo, his gait is only mildly wide-based. Contrast this with the expected gait disturbance if the stroke were in the anterior inferior cerebellar artery (AICA) territory, and give the reason. (1 mark)', 'd) An AICA stroke involves the middle cerebellar peduncle, the flocculus and vestibular nuclei (and inner ear), causing severe vertigo, truncal and gait ataxia, nystagmus and often hearing loss and facial weakness. The SCA supplies the superior cerebellar hemisphere and dentate (limb coordination) and largely spares the vestibulocerebellum and midline vermis, so limb ataxia predominates over gait ataxia.', null, '[{"point": "AICA affects flocculonodular/ vestibular nuclei and middle cerebellar peduncle, labyrinth: severe truncal/ gait ataxia, vertigo, hearing loss; SCA mainly affects superior hemisphere/ dentate - limb ataxia more than gait", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s4', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S4d', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4d';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'A 72-year-old man presents to the Emergency Department with acute vertigo and gait instability. MRI confirms an acute ischaemic stroke in the superior cerebellar artery (SCA) territory.

e) Motor deficits are expected on the ipsilateral side. What pathological development, often with large cerebellar strokes, could later cause contralateral motor deficits, and why? (1 mark)', 'e) Cerebellar oedema with mass effect (malignant cerebellar swelling, usually days 2-4): it compresses the brainstem, including the corticospinal tracts before they cross, causing contralateral weakness, and can block the fourth ventricle causing obstructive hydrocephalus and decline in consciousness; it may need ventricular drainage or suboccipital decompression.', null, '[{"point": "Cerebellar oedema causing mass effect: brainstem compression of corticospinal tracts (above decussation) and/or obstructive hydrocephalus - contralateral deficits; needs decompression", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-s4', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'S4e', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4e';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

a. How do you define chronic meningitis? What are the other symptoms and signs of chronic meningitis? (3 marks)', 'Chronic meningitis is inflammation of the meninges with clinical features and CSF abnormalities (pleocytosis) that persist or progress for at least 4 weeks. Other features: chronic headache, low-grade fever, neck stiffness, nausea and vomiting, confusion, memory and personality change, cranial nerve palsies (especially VI, VII, VIII), seizures, hydrocephalus (gait disturbance, papilloedema), radiculopathy or cauda equina symptoms, focal deficits from vasculitic infarcts, and systemic features such as weight loss and night sweats.', null, '[{"point": "Definition: meningeal inflammation with symptoms and CSF abnormality (pleocytosis) persisting ≥4 weeks", "marks": 1}, {"point": "Symptoms/signs: headache, fever, neck stiffness, confusion/ cognitive change, cranial nerve palsies, seizures, hydrocephalus, radiculopathy, weight loss, focal deficits, papilloedema", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

b. Which two classic signs of meningeal irritation would you ask the medical officer to elicit? Describe how to elicit each. (4 marks)', '1. Kernig''s sign: patient supine, flex the hip and knee to 90°, then try to straighten the knee; it is positive if extension is limited by resistance or pain in the back/hamstrings. 2. Brudzinski''s neck sign: patient supine, passively flex the neck towards the chest; it is positive if this causes involuntary flexion of the hips and knees. (Neck stiffness - resistance to passive neck flexion - and the jolt accentuation test are also useful.)', null, '[{"point": "Kernig''s sign: hip and knee flexed to 90°, knee extended - pain/resistance in hamstrings/ back", "marks": 2}, {"point": "Brudzinski''s (neck) sign: passive neck flexion causes involuntary flexion of hips and knees (also neck stiffness test)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

c. Name at least five categories of disease that account for most cases of chronic meningitis. (3 marks)', '1. Chronic infections - tuberculosis (most common in Bhutan), fungal (Cryptococcus, especially with HIV), syphilis, brucellosis, Lyme disease, partially treated bacterial meningitis. 2. Neoplastic - carcinomatous or lymphomatous (leptomeningeal) meningitis. 3. Autoimmune/inflammatory - neurosarcoidosis, Behçet''s disease, SLE and vasculitis, IgG4-related disease, Vogt-Koyanagi-Harada. 4. Chemical/drug-induced - NSAIDs, IVIG, intrathecal drugs, ruptured epidermoid cyst. 5. Parameningeal infections (epidural or brain abscess). 6. Idiopathic (no cause found).', null, '[{"point": "Five categories: infections (TB, fungal - cryptococcal, syphilis, brucella, Lyme), neoplastic (carcinomatous/ lymphomatous meningitis), autoimmune/ inflammatory (sarcoidosis, Behçet''s, SLE, vasculitis, IgG4), chemical/ drug-induced (NSAIDs, IVIG, intrathecal agents), parameningeal infections (abscess), idiopathic", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

d. How would you approach this case once he is referred to you at JDWNRH? (5 marks)', 'Take a full history (TB exposure, HIV and sexual risk, travel, cancer, autoimmune disease, drugs, immunosuppression) and examine thoroughly (cranial nerves, cognition, fundi, skin, lymph nodes, lungs). Imaging: contrast MRI of the brain and spine (basal meningeal enhancement, hydrocephalus, infarcts, masses) before lumbar puncture. LP: opening pressure, cell count and differential, protein, glucose (with serum glucose), Gram and Ziehl-Neelsen stains, bacterial, TB and fungal cultures, GeneXpert MTB/RIF, India ink and cryptococcal antigen, CSF VDRL, cytology and flow cytometry (repeat large-volume taps if negative). Blood tests: HIV, syphilis serology (RPR/VDRL and TPHA), CBC, ESR/CRP, ACE, ANA, blood cultures; chest X-ray or CT for TB/sarcoid/malignancy. If still undiagnosed, consider meningeal biopsy. Manage hydrocephalus and symptoms, and start empirical treatment (e.g. anti-TB therapy) if TB is likely while awaiting results.', null, '[{"point": "History (TB contacts, HIV/ STI risk, travel, cancer, autoimmune, drugs) and full neuro/ systemic exam", "marks": 1}, {"point": "Neuroimaging: contrast MRI brain and spine before LP (meningeal enhancement, hydrocephalus, infarcts)", "marks": 1}, {"point": "LP: opening pressure, cells, protein, glucose ratio, Gram/ AFB, cultures, GeneXpert, India ink/ CrAg, VDRL, cytology/ flow, repeat large-volume taps", "marks": 1.5}, {"point": "Blood: HIV, syphilis serology, CBC, ESR/CRP, ACE, ANA, cultures, CXR/ CT chest; meningeal biopsy if undiagnosed", "marks": 1}, {"point": "Empirical treatment considerations (anti-TB if suspected), manage hydrocephalus/ symptoms", "marks": 0.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

e. What are the different types of serological tests for syphilis? Describe them.

On further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis. (2 marks)', '1. Non-treponemal tests - VDRL and RPR: detect antibodies to cardiolipin-lecithin antigen; cheap, quantitative titres used for screening and to monitor treatment response; can give false positives (pregnancy, SLE, other infections) and may become negative over time. 2. Treponemal tests - TPHA/TPPA, FTA-ABS and EIA/CLIA: detect antibodies specific to Treponema pallidum; used to confirm infection; usually remain positive for life, so they cannot show treatment response.', null, '[{"point": "Non-treponemal (VDRL, RPR): detect anti-cardiolipin antibodies, quantitative, used for screening/ monitoring, false positives", "marks": 1}, {"point": "Treponemal (TPHA, TPPA, FTA-ABS, EIA/CLIA): specific antibodies to T. pallidum, confirm, stay positive for life", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

f. What co-infections would you rule out in this case?

On further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis. (2 marks)', 'HIV (the most important - shares the same route and changes the course and treatment of neurosyphilis), hepatitis B and C, other sexually transmitted infections (gonorrhoea, chlamydia, herpes), and tuberculosis, especially if HIV positive.', null, '[{"point": "HIV (most important), hepatitis B and C, other STIs (gonorrhoea, chlamydia), TB (especially with HIV)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 6, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

g. What CSF studies would you request and what findings do you expect?

On further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis. (2 marks)', 'Request CSF cell count and differential, protein, glucose, CSF-VDRL, and CSF treponemal test (FTA-ABS/TPHA). Expected: lymphocytic pleocytosis (>5 cells/µL), raised protein, normal or mildly low glucose; a reactive CSF-VDRL is highly specific (diagnostic) but insensitive; a non-reactive CSF FTA-ABS makes neurosyphilis unlikely.', null, '[{"point": "Studies: cell count, protein, glucose, CSF-VDRL, CSF FTA-ABS/TPHA", "marks": 1}, {"point": "Expected: lymphocytic pleocytosis (>5 cells), raised protein, normal/ slightly low glucose, CSF-VDRL positive (specific but insensitive); CSF FTA-ABS negative helps exclude", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 7, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

h. How will you treat this case?

On further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis. (1 marks)', 'Intravenous aqueous crystalline penicillin G 18-24 million units per day (3-4 million units every 4 hours or continuous infusion) for 10-14 days; alternatives are procaine penicillin IM with probenecid or ceftriaxone if penicillin allergic (desensitise if possible). Follow up CSF at 6 months, and treat any HIV infection.', null, '[{"point": "IV aqueous crystalline penicillin G 18-24 million units/day (3-4 MU 4-hourly) for 10-14 days (alternative procaine penicillin + probenecid, or ceftriaxone)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 8, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C1Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 1: Chronic meningitis and neurosyphilis
As a neurologist at Jigme Dorji Wangchuck National Referral Hospital, you are consulted by a medical officer from a Primary Health Centre about a 60-year-old man with headache for more than two months. He also has a change in personality, neck and back pain, double vision and clumsiness while walking. He is suspected to have chronic meningitis.

i. Describe the clinical manifestations of general paresis and tabes dorsalis.

On further enquiry, you learn the patient had significant unprotected sexual exposure and treatment for genital sores many years ago. You suspect neurosyphilis. (3 marks)', 'General paresis (parenchymal brain involvement, years after infection): progressive dementia with memory loss, poor judgement and personality change, psychiatric features (grandiose delusions, mania, depression, psychosis), dysarthria, tremor of face and tongue, seizures, hyperreflexia and Argyll Robertson pupils. Tabes dorsalis (dorsal columns and dorsal roots): lightning (lancinating) pains, sensory ataxia with a wide-based stamping gait and positive Romberg sign, loss of vibration and position sense, areflexia, Argyll Robertson pupils, optic atrophy, bladder dysfunction, impotence and Charcot (neuropathic) joints.', null, '[{"point": "General paresis: progressive dementia, personality change, psychosis/ grandiose delusions, mood change, dysarthria, tremor, seizures, Argyll Robertson pupils", "marks": 1.5}, {"point": "Tabes dorsalis: lightning pains, sensory ataxia, positive Romberg, loss of proprioception/ vibration, areflexia, Argyll Robertson pupils, Charcot joints, bladder dysfunction, optic atrophy", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case1', 9, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C1Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C1Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

a. List three distinct neuro-immunological mechanisms that could explain this presentation, citing a specific condition for each. (3 marks)', '1. Antibody-mediated, complement-dependent astrocytopathy - aquaporin-4 IgG neuromyelitis optica spectrum disorder (NMOSD), which is associated with SLE. 2. Immune-complex vasculopathy or antiphospholipid antibody-related thrombotic/inflammatory myelopathy - lupus myelitis in SLE. 3. Antibody-mediated oligodendrocytopathy - MOG antibody-associated disease (MOGAD; MOG negative here but can be repeated). (Alternatively: T-cell mediated inflammatory demyelination - multiple sclerosis, or post-infectious ADEM.)', null, '[{"point": "Three mechanisms with conditions (1 each): antibody (AQP4-IgG) complement-mediated astrocytopathy - NMOSD; SLE-related vasculopathy/ antiphospholipid thrombotic myelopathy or lupus myelitis; MOG antibody oligodendrocytopathy - MOGAD; T-cell mediated demyelination - MS; paraneoplastic/ post-infectious ADEM", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 1, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

b. Given the MRI finding of longitudinally extensive transverse myelitis (LETM), which single test result would you consider most critical to await before starting long-term immunotherapy? Justify. (2 marks)', 'The serum AQP4-IgG result (by cell-based assay). It confirms NMOSD and determines long-term treatment: AQP4-positive NMOSD needs indefinite relapse-preventing immunosuppression (e.g. rituximab, eculizumab, satralizumab), while some MS disease-modifying drugs (interferon-beta, natalizumab, fingolimod) can worsen NMOSD. A positive result also predicts a high relapse risk.', null, '[{"point": "AQP4-IgG (cell-based assay)", "marks": 1}, {"point": "Justification: confirms NMOSD, guides choice - MS drugs (interferon, natalizumab, fingolimod) can worsen NMOSD; positive = lifelong relapse prevention", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 2, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

c. What fundamental immunopathological process do oligoclonal bands represent in MS? (1 marks)', 'Oligoclonal bands show intrathecal (CNS) synthesis of immunoglobulin G by a limited number of clonally expanded B cells/plasma cells within the CNS - compartmentalised humoral immune activity - detected as bands in CSF but not in matched serum.', null, '[{"point": "Intrathecal synthesis of IgG by clonally expanded B cells/ plasma cells within the CNS (compartmentalised humoral immunity)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 3, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

d. Discuss the prognostic significance of a negative OCB result in this specific clinical context. (2 marks)', 'OCBs are present in over 90-95% of people with MS but only in about 15-30% of NMOSD, so a negative result makes MS unlikely and supports NMOSD, MOGAD or lupus-related myelitis. Prognostically this suggests an antibody-mediated, relapsing disease in which attacks are severe with incomplete recovery (as already seen in her optic neuritis), so long-term immunosuppression is needed to prevent disability; it also warns against MS drugs that can worsen NMOSD.', null, '[{"point": "Negative OCB makes MS unlikely (OCB positive in >90-95% MS) and supports NMOSD/ MOGAD/ lupus myelitis", "marks": 1}, {"point": "Prognosis: points to relapsing antibody-mediated disease with severe attacks and poor recovery unless prevented; avoid MS drugs; in MS negative OCB may predict milder course", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 4, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

e. While awaiting the AQP4-IgG result you must decide on acute management. Argue for and against using plasma exchange (PLEX) now. (3 marks)', 'For: this is a severe, disabling attack (flaccid quadriparesis, C5 level extending to the medulla, urinary retention, risk of respiratory failure); evidence shows early PLEX (within days) improves outcome in severe NMOSD and other antibody-mediated CNS demyelination, especially if steroids are not enough, and the clinical picture strongly suggests an antibody-mediated disease - delay waiting for an overseas result risks permanent disability. Against: PLEX is invasive and needs central access, with risks of infection, bleeding, hypotension and electrolyte problems; it is resource-intensive and may not be available locally; the diagnosis is not yet confirmed; and standard practice is high-dose IV methylprednisolone first, adding PLEX if there is no improvement after 3-5 days. Reasonable approach: start IV methylprednisolone immediately and arrange early PLEX given the severity.', null, '[{"point": "For: severe disabling attack (quadriparesis, C5 level, bladder, risk of respiratory failure), early PLEX improves outcome in NMOSD/ steroid-refractory attacks, benefit greater if early; can be given with IV methylprednisolone; diagnosis likely antibody-mediated", "marks": 1.5}, {"point": "Against: invasive (central line, infection, bleeding, haemodynamic instability, hypocalcaemia), availability/cost in Bhutan, diagnosis unconfirmed, usual practice IV steroids first then PLEX if no response in 3-5 days", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 5, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

f. Would your argument change if the patient were AQP4-IgG positive? Explain the pathophysiological basis for the efficacy of PLEX in that scenario. (2 marks)', 'Yes - the case for early PLEX becomes stronger, and it is often used early (alongside or soon after steroids) in AQP4-positive NMOSD attacks. PLEX removes circulating pathogenic AQP4-IgG, complement components and inflammatory cytokines from the blood, reducing ongoing antibody binding to astrocyte AQP4 and complement-mediated astrocyte damage, so lesions can recover.', null, '[{"point": "Yes - stronger case for early PLEX (even first-line with steroids)", "marks": 1}, {"point": "Basis: removes circulating AQP4-IgG, complement components and other mediators that cause complement-dependent astrocyte injury", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 6, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

g. Contrast the typical histopathological findings of an MS plaque and an NMOSD lesion, focusing on complement, astrocytes and eosinophils. (3 marks)', 'MS plaque: primary inflammatory demyelination with T cells and macrophages around veins, relative preservation of axons, astrocytes preserved and forming reactive gliosis (AQP4 and GFAP preserved or increased), and usually little complement deposition or granulocyte infiltration (except some pattern II lesions). NMOSD lesion: primary astrocytopathy - early loss of AQP4 and GFAP from astrocytes; IgG and activated complement (membrane attack complex) deposited in a perivascular rim and rosette pattern; prominent eosinophils and neutrophils; necrosis and cavitation with secondary demyelination and axonal loss; thickened hyalinised vessel walls.', null, '[{"point": "MS: primary demyelination with T-cell/ macrophage infiltrate, relative axonal preservation, astrocytes preserved/ reactive gliosis, AQP4 preserved, little complement/ eosinophils, perivenular", "marks": 1.5}, {"point": "NMOSD: primary astrocytopathy - loss of AQP4 and GFAP, perivascular IgG and complement (MAC) deposition in rim/ rosette pattern, eosinophils and neutrophils, necrosis, secondary demyelination and axonal loss, vascular hyalinisation", "marks": 1.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 7, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q7', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

h. How does eculizumab''s mechanism of action directly counter the pathophysiology you described for NMOSD? (2 marks)', 'Eculizumab is a humanised monoclonal antibody that binds complement protein C5 and prevents its cleavage into C5a and C5b. In NMOSD, AQP4-IgG binds astrocytes and activates complement; blocking C5 stops formation of the membrane attack complex (C5b-9) that lyses astrocytes and stops C5a-driven recruitment of neutrophils and eosinophils, so the inflammatory cascade cannot destroy tissue; this greatly reduces relapses in AQP4-positive NMOSD.', null, '[{"point": "Eculizumab is a monoclonal antibody against complement C5, blocking its cleavage into C5a and C5b", "marks": 1}, {"point": "Prevents membrane attack complex formation and C5a-driven granulocyte recruitment, stopping AQP4-IgG-triggered complement-mediated astrocyte lysis - reduces relapses", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 8, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q8', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q8';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

i. This patient''s first event was optic neuritis. Describe the key differentiating features on optical coherence tomography (OCT) between post-acute optic neuritis in MS and NMOSD. (2 marks)', 'After NMOSD optic neuritis, OCT typically shows severe thinning of the peripapillary retinal nerve fibre layer (often losing >40 µm, average RNFL <60 µm) and ganglion cell-inner plexiform layer, affecting all quadrants including superior and inferior, often with microcystic macular oedema and poor visual recovery. After MS optic neuritis thinning is milder (about 15-20 µm loss), mostly in the temporal sector (papillomacular bundle), with better recovery; subclinical thinning may also occur in the fellow eye in MS.', null, '[{"point": "NMOSD: severe RNFL and GCIPL thinning (often >40 µm loss, RNFL < 60 µm), diffuse incl. superior/ inferior quadrants, microcystic macular oedema more common, poorer VA", "marks": 1}, {"point": "MS: milder thinning (about 15-20 µm), predominantly temporal (papillomacular bundle), better recovery", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 9, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q9', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q9';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

j. A different patient presents with bilateral optic neuritis and negative AQP4-IgG. What clinical and MRI feature of the optic nerves would strongly suggest MOGAD rather than NMOSD? (1 marks)', 'Prominent optic disc swelling (papillitis) on fundoscopy, with MRI showing longitudinally extensive involvement of the anterior (intraorbital) optic nerves with perineural (optic nerve sheath) enhancement, typically sparing the chiasm (NMOSD more often affects the posterior nerve and chiasm).', null, '[{"point": "Marked optic disc swelling (papillitis) clinically with long anterior optic nerve involvement and perineural (optic sheath) enhancement on MRI, sparing chiasm", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    108, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 10, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q10', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

k. Name two evidence-based first-line long-term immunosuppressive agents for NMOSD and their main mechanism of action. (2 marks)', 'Rituximab - a monoclonal antibody against CD20 that depletes B cells, reducing production of AQP4-antibody-secreting cells and B-cell antigen presentation. Satralizumab (or tocilizumab) - blocks the interleukin-6 receptor, reducing plasmablast survival and AQP4-IgG production and inflammation. (Also: inebilizumab - anti-CD19 depletion of B cells and plasmablasts; eculizumab/ravulizumab - C5 complement inhibition; azathioprine or mycophenolate - inhibit purine synthesis and lymphocyte proliferation, used where newer agents are unavailable.)', null, '[{"point": "Two agents with mechanisms (1 each): rituximab (anti-CD20 B-cell depletion), inebilizumab (anti-CD19 B-cell/ plasmablast depletion), satralizumab or tocilizumab (IL-6 receptor blockade), eculizumab/ ravulizumab (C5 inhibition), azathioprine/ mycophenolate (purine synthesis inhibitors reducing lymphocyte proliferation)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 11, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q11', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q11';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Question 2: Longitudinally extensive myelitis in a woman with SLE
A 32-year-old woman from Tsirang presents with a 5-day history of rapidly ascending sensory and motor deficit, now involving all four limbs, with urinary retention. 18 months ago she had a similar but less severe episode of unilateral visual loss that partially resolved with oral steroids. She has well-controlled systemic lupus erythematosus (SLE) treated with hydroxychloroquine.
Examination: alert and oriented. Cranial nerves: relative afferent pupillary defect on the right; fundoscopy shows pale optic discs bilaterally. Motor: flaccid quadriparesis (power 2/5 legs, 3/5 arms). Sensory: sensory level to pinprick at C5; profound loss of proprioception and vibration in all limbs. Reflexes absent throughout; plantar responses mute.
Investigations: ESR/CRP raised. MRI cervico-thoracic spine: T2-hyperintense, gadolinium-enhancing lesion from the medulla to T3. CSF: WCC 45/µL (80% lymphocytes), protein 1.2 g/L, glucose normal, oligoclonal bands negative. Serum AQP4-IgG pending (sample sent to India). MOG-IgG negative.

l. Her SLE is managed with hydroxychloroquine. Explain the potential challenges and considerations in adding a powerful immunosuppressant on top of her existing autoimmune disease and its treatment. (2 marks)', 'Adding strong immunosuppression increases infection risk (TB is common in Bhutan, hepatitis B reactivation with rituximab, meningococcal infection with eculizumab), so screen for TB, hepatitis B/C and HIV, vaccinate and give prophylaxis where needed. Choose agents that may treat both diseases (e.g. rituximab or mycophenolate) and coordinate with rheumatology; monitor blood counts, liver and kidney function and drug interactions; watch for steroid side effects (osteoporosis, diabetes). Hydroxychloroquine can be continued but its retinal toxicity must be monitored and distinguished from optic nerve damage. Consider pregnancy plans (some drugs are teratogenic), cost and availability of drugs in Bhutan, and her adherence.', null, '[{"point": "Infection risk from combined immunosuppression (screen TB, hepatitis B, HIV; vaccinations; meningococcal vaccine for eculizumab)", "marks": 1}, {"point": "Other: drug interactions/ toxicity, monitoring SLE activity, choose agent treating both (rituximab, mycophenolate), steroid side effects, hydroxychloroquine retinal toxicity confounding vision, pregnancy planning, cost/ access in Bhutan, coordination with rheumatology", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Neurology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-neuro2025-case2', 12, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'C2Q12', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'C2Q12';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In a patient with clinical signs of transtentorial herniation from cerebral oedema, which immediate medical measure lowers intracranial pressure fastest while definitive treatment is arranged?', null, 'Osmotherapy (mannitol/hypertonic saline) rapidly reduces ICP; steroids do not help ischaemic oedema and LP can worsen herniation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Lumbar puncture', false, 1), ('B', 'IV mannitol or hypertonic saline', true, 2), ('C', 'IV dexamethasone', false, 3), ('D', 'Oral acetazolamide', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Osmotic demyelination syndrome most classically follows', null, 'Rapid correction of chronic hyponatraemia causes central pontine and extrapontine myelinolysis.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hypercalcaemia', false, 1), ('B', 'Too rapid correction of chronic hyponatraemia', true, 2), ('C', 'Slow correction of hypernatraemia', false, 3), ('D', 'Hypokalaemia', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which finding is most typical of amyotrophic lateral sclerosis?', null, 'ALS combines UMN and LMN signs with preserved sensation.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Areflexia with albuminocytological dissociation', false, 1), ('B', 'Ptosis and fatigable diplopia', false, 2), ('C', 'Sensory level on the trunk', false, 3), ('D', 'A mix of upper and lower motor neuron signs with no sensory loss', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Lambert-Eaton myasthenic syndrome, repetitive nerve stimulation characteristically shows', null, 'LEMS: low CMAP amplitudes with >100% increment after exercise or high-frequency stimulation (presynaptic VGCC antibodies).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Normal responses', false, 1), ('B', 'Myotonic discharges', false, 2), ('C', 'Decrement at low rates that worsens at high rates', false, 3), ('D', 'Marked increment after exercise or high-frequency stimulation', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which antibody is the key diagnostic marker of neuromyelitis optica spectrum disorder?', null, 'AQP4-IgG targets astrocyte water channels and defines NMOSD.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Anti-acetylcholine receptor', false, 1), ('B', 'Anti-aquaporin-4 IgG', true, 2), ('C', 'Anti-GM1', false, 3), ('D', 'Anti-Hu', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'REM sleep behaviour disorder is most strongly associated with which group of diseases?', null, 'RBD often precedes or accompanies alpha-synucleinopathies; it is treated with melatonin or clonazepam.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'neurology'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, Neurology): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'neurology'), null)
  returning id
)
insert into me_q select 'N6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Prion diseases', false, 1), ('B', 'Tauopathies such as progressive supranuclear palsy only', false, 2), ('C', 'Muscular dystrophies', false, 3), ('D', 'Synucleinopathies (Parkinson''s disease, dementia with Lewy bodies, MSA)', true, 4)) as v(label, body, ok, pos) where me_q.key = 'N6';
commit;
