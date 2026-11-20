-- ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers: question text only, as DRAFTS; a subject expert adds answers in the admin editor.
begin;
do $$ begin if (select id from public.specialisations where code = 'biotechnology') is null then raise exception 'unknown specialisation biotechnology'; end if; end $$;
delete from public.questions where specialisation_id = (select id from public.specialisations where code = 'biotechnology') and paper_id = (select id from public.exam_papers where code = 'me-technical-3') and status = 'draft' and ai_review ->> 'batch' = 'ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers';
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is null and specialisation_id = (select id from public.specialisations where code = 'biotechnology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'biotechnology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Biotechnology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'biotechnology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Biotechnology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'biotechnology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Biotechnology');
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Edouard Chatton made a fundamental classification of living organisms. What was the basis of this classification?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Mode of reproduction', false, 1), ('B', 'Presence or absence of a nucleus', false, 2), ('C', 'Type of metabolism', false, 3), ('D', 'Ability to move', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following statements best explains how a proto-oncogene becomes an oncogene.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A proto-oncogene undergoes a loss-of-function mutation, leading to defective apoptosis', false, 1), ('B', 'Loss-of-function mutation in proto-oncogene resulting in reduced protein degradation', false, 2), ('C', 'Chromosomal translocation placing the proto-oncogene under control of a highly active promoter', false, 3), ('D', 'Alternative splicing of proto-oncogene transcripts leading to apoptosis activation', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following best serves as a selectable marker by conferring survival advantage to host cells during antibiotic selection in cloning experiments?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'lacZ gene enabling blue-white screening', false, 1), ('B', 'Ampicillin Resistant Gene providing β-lactam antibiotic resistance', false, 2), ('C', 'MCS enabling insertion of foreign DNA sequences', false, 3), ('D', 'ori sequence facilitating plasmid replication', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which statement about yeast fermentation is MOST accurate?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Yeast ferments glucose to ethanol and CO₂ anaerobically but can respire aerobically if oxygen is present', false, 1), ('B', 'Yeast always produces ethanol and CO₂ no matter the sugar or conditions', false, 2), ('C', 'Yeast converts pyruvate to lactic acid or ethanol depending on oxygen', false, 3), ('D', 'Yeast fermentation works better with oxygen because more ATP is made', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following statements about bacterial transformation is TRUE?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Transformation requires direct cell-to-cell contact between bacteria', false, 1), ('B', 'Transformation involves the uptake of naked DNA from the environment by a bacterial cell', false, 2), ('C', 'Only plasmid DNA can be taken up during transformation', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following element is most abundant in organic molecules essential for life?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Na', false, 1), ('B', 'Zn', false, 2), ('C', 'Na and Cl', false, 3), ('D', 'C', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'What does the BLAST tool do in bioinformatics?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Predicts protein 3D structure', false, 1), ('B', 'Predicts protein 2D structure', false, 2), ('C', 'Visualizes metabolic pathways', false, 3), ('D', 'Compares nucleotide or protein sequences to find similarities', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Fill in the blank with the appropriate answer from the choices given. ___________ is a technique used to separate proteins based on their size and charge', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Yeast two-hybrid assay', false, 1), ('B', 'Northern blotting', false, 2), ('C', 'Gel electrophoresis', false, 3), ('D', 'Southern blotting', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Post-translational modifications such as phosphorylation are important in proteomics because:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'They change the amino acid sequence, leading to altered protein synthesis', false, 1), ('B', 'They regulate protein function and activity by reversible chemical changes affecting signaling pathways', false, 2), ('C', 'They occur only during protein degradation to mark proteins for destruction', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'In a solution with a pH of 3, the concentration of hydrogen ions [H⁺] is:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '10⁻³ mol/L', false, 1), ('B', '10³ mol/L', false, 2), ('C', '3 mol/L', false, 3), ('D', '10⁻⁷ mol/L', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following is NOT an application of plant tissue culture in genetic engineering?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Clonal propagation of elite genotypes', false, 1), ('B', 'Somaclonal variation for generating genetic diversity', false, 2), ('C', 'Direct insertion of DNA into the plant nucleus', false, 3), ('D', 'Production of transgenic plants through regeneration from transformed cells', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which molecule serves as the final electron acceptor in aerobic cellular respiration?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Oxygen', false, 1), ('B', 'NAD⁺', false, 2), ('C', 'Carbon dioxide', false, 3), ('D', 'Water', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Fill in the blank with the appropriate answer from the choices given. ___________ is an example of a database used for storing nucleotide sequences.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bio-nucleotide Data Bank', false, 1), ('B', 'KEGG', false, 2), ('C', 'Swiss-prot', false, 3), ('D', 'GenBank', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'What type of bond is responsible for stabilizing the α-helix and β-pleated sheet structures in proteins?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Hydrogen bonds', false, 1), ('B', 'Ionic bonds', false, 2), ('C', 'Covalent bonds', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'In glycolysis, what is the net gain of ATP molecules per glucose molecule?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', '1 ATP', false, 1), ('B', '2 ATP', false, 2), ('C', '4 ATP', false, 3), ('D', '6 ATP', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The purpose of a genomic library in rDNA technology is to:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Store all DNA sequences of an organism', false, 1), ('B', 'Store mRNA molecules for reuse', false, 2), ('C', 'Store Protein', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'What is the role of vir genes located outside the T-DNA region on the Ti plasmid?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'They integrate into the plant genome to express antibiotic resistance', false, 1), ('B', 'They code for plant growth regulators in the transformed plant', false, 2), ('C', 'They synthesize secondary metabolites in plant cells', false, 3), ('D', 'They encode the proteins that mediate the transfer of T-DNA into plant cells', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Agrobacterium is more effective in dicots than monocots because:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Monocots lack the receptors required for Agrobacterium attachment', false, 1), ('B', 'Dicots express higher levels of plant defense genes', false, 2), ('C', 'T-DNA cannot integrate into monocot genomes', false, 3), ('D', 'Monocots do not undergo tissue culture step', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', '[Question 19 is missing from the RCSC paper. Expert: write a new multiple choice question here.]', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Option A', false, 1), ('B', 'Option B', false, 2), ('C', 'Option C', false, 3), ('D', 'Option D', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The role of myeloma cells in hybridoma production is to:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'produce antibodies on their own', false, 1), ('B', 'serve as feeder cells for B lymphocytes', false, 2), ('C', 'enable unlimited cell division in fused hybrid cells', false, 3), ('D', 'suppress immune responses during fusion', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The function of single-strand binding proteins during replication is to:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'synthesize RNA primers', false, 1), ('B', 'remove supercoiling', false, 2), ('C', 'stabilize unwound DNA and prevent reannealing', false, 3), ('D', 'repair mismatches during proofreading', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following statements about peptidoglycan and bacterial cell walls is TRUE.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Beta-lactam antibiotics target the bacterial peptidoglycan synthesis', false, 1), ('B', 'Gram-positive bacteria are more sensitive to lysozyme than Gram-negative bacteria', false, 2), ('C', 'The composition of peptidoglycan consists of repeating units of N-acetylglucosamine and N- acetylmuramic acid linked by peptide cross-bridges', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following best characterizes a fed-batch bioreactor and its advantage in industrial biotechnology?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'It involves the intermittent or continuous addition of nutrients without removing culture fluid, enabling extended production phases and controlled metabolite accumulation', false, 1), ('B', 'It operates under anaerobic conditions only and is used exclusively for antibiotic production', false, 2), ('C', 'It allows all nutrients to be added at the beginning, preventing nutrient limitation throughout the process', false, 3), ('D', 'It continuously removes and replaces the culture medium to maintain constant volume and cell density', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'What structural form of DNA is most common under physiological conditions?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'A-DNA', false, 1), ('B', 'R-DNA', false, 2), ('C', 'Z-DNA', false, 3), ('D', 'B-DNA', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The enzyme Exonuclease III is used in molecular biology for:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Removing terminal nucleotides from RNA', false, 1), ('B', 'Cleaving DNA at restriction sites', false, 2), ('C', 'Generating nested deletions in double-stranded DNA', false, 3), ('D', 'Methylating cytosine residues', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'In the absence of lactose, the lac operon is:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Actively transcribed', false, 1), ('B', 'Repressed by the lac repressor binding to the operator', false, 2), ('C', 'Induced by allolactose', false, 3), ('D', 'Activated by cAMP-CAP complex', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The insecticidal activity of Bacillus thuringiensis toxins depends on the alkaline pH of the insect midgut because:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'It activates protoxins to toxic forms', false, 1), ('B', 'Alkaline toxin degrades the toxin', false, 2), ('C', 'It inhibits toxin binding to receptors', false, 3), ('D', 'It causes toxin precipitation', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The key advantage of using a bacteriophage λ vector over a plasmid vector is:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Faster replication rate', false, 1), ('B', 'Higher transformation efficiency in mammalian cells', false, 2), ('C', 'Ability to carry larger DNA inserts', false, 3), ('D', 'Ability to replicate without host cells', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The lytic cycle of a bacteriophage results in:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Integration of phage DNA into the host genome', false, 1), ('B', 'Dormant prophage state', false, 2), ('C', 'Production of new phage particles and host cell lysis', false, 3), ('D', 'Formation of a lysogen without killing the host', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'A mutation that changes a codon to a stop codon, resulting in premature termination of translation, is called:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nonsense mutation', false, 1), ('B', 'Missense mutation', false, 2), ('C', 'Silent mutation', false, 3), ('D', 'Frameshift mutation', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Draw a well-labeled diagram of the Ti plasmid used in plant genetic engineering. In your diagram,
clearly indicate three important regions of the plasmid and briefly describe the function of each. (5
marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Explain the mode of action of the Cry protein produced by Bacillus thuringiensis in insect pest
control. (5 marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'What are restriction enzymes and how are they different from the general endonucleases. (5 Marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Explain the main steps involved in the Southern Blotting. (5 marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'passage', 'Case I
"Bhutan has less than 3% arable land but needs to feed its growing population. Limited farmland and
challenging conditions require innovative ways to boost crop yields sustainably” In this context, answer
the following questions.
1. How can genetic modification improve crop tolerance to environmental stresses? Discuss the
potential risks and benefits of introducing GM crops in Bhutan’s traditional farming systems. (10
marks)
2. Discuss the role of microbial biofertilizers and biopesticides in promoting sustainable agriculture
in Bhutan. How can bioreactors be utilized to mass-produce these microbial inputs, and what key
operational parameters must be controlled to ensure product efficacy and quality? (10 marks)
3. How can protoplast fusion be applied to combine desirable traits from different plant species or
varieties to develop hybrids suited for Bhutan? Explain the steps involved in protoplast fusion.
(10 marks)
4. What are inducible promoters, and how can they be used to control gene expression in genetically
modified plants to improve environmental stress responses? (10 marks)
5. Describe the key steps involved in designing and performing a qRT-PCR experiment to analyze
gene expression in genetically modified crops. (10 marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50, 5400,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-biotech2025-case1', 1, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'passage', 'Case II
“Modern biotechnology helps improve crop productivity and sustainability through advanced genetic
techniques and microbial solutions. It also enhances healthcare by enabling the development of vaccines
and precise diagnostic tools”. In this context, answer the following questions.
1. What is gene therapy? Describe the difference between somatic and germline gene therapy. (10
marks)
2. Explain the molecular mechanisms behind allergenicity in genetically engineered foods and
strategies to minimize it. (10 marks)
3. Discuss the role of mixed-culture fermentation in developing novel food flavors and textures.
Further, explain the advantages of using mixed-culture fermentation over single-culture
fermentation in food processing. (10 marks)
4. Explain the principle and application of recombinant DNA technology in producing therapeutic
proteins. Name two commonly used vectors in producing therapeutic proteins. (10 marks)
5. Explain the concept of feedback inhibition and discuss its significance in the regulation of
metabolic pathways. Illustrate your answer with an example, highlighting how this mechanism
contributes to cellular efficiency and metabolic balance. (10 marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50, 5400,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Biotechnology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Biotechnology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-biotech2025-case2', 1, (select id from public.specialisations where code = 'biotechnology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3)) as v(l, t, m, p);
commit;
