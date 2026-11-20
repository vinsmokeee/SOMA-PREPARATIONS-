-- ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers: question text only, as DRAFTS; a subject expert adds answers in the admin editor.
begin;
do $$ begin if (select id from public.specialisations where code = 'microbiology') is null then raise exception 'unknown specialisation microbiology'; end if; end $$;
delete from public.questions where specialisation_id = (select id from public.specialisations where code = 'microbiology') and paper_id = (select id from public.exam_papers where code = 'me-technical-3') and status = 'draft' and ai_review ->> 'batch' = 'ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers';
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is null and specialisation_id = (select id from public.specialisations where code = 'microbiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'microbiology'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, Microbiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'microbiology'), null, 2, 'Section A Part II: Short answer questions', 'short_answer', 4, 5, null, 'BCSE 2025 Main Examination, Technical Paper III, Microbiology');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'microbiology'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, Microbiology');
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Who postulates the “Germ theory of diseases”?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Robert Koch', false, 1), ('B', 'Louis Pasteur', false, 2), ('C', 'John Snow', false, 3), ('D', 'Girolamo Fracastoro', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which group of organisms appears pink/red after gram staining?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Gram positive bacteria', false, 1), ('B', 'Gram Negative bacteria', false, 2), ('C', 'Acid fast bacteria', false, 3), ('D', 'Spirochaete', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Viruses which infect bacteria is called-', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Prion', false, 1), ('B', 'Bacteriophages', false, 2), ('C', 'Plasmids', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following leukocytes is regarded as the first line of defense against invading pathogens and is often called the “martyr of the immune system”?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Eosinophils', false, 1), ('B', 'Monocytes', false, 2), ('C', 'Lymphocytes', false, 3), ('D', 'Neutrophils', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following is an enriched medium that supports the growth of most pathogenic bacteria and is commonly used for routine primary isolation?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Nutrient agar', false, 1), ('B', 'Brilliant green agar', false, 2), ('C', 'MacConkey agar', false, 3), ('D', 'Blood agar', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'β-lactam antibiotics such as penicillins and cephalosporins exert their antibacterial action mainly by:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Inhibition of cell wall synthesis', false, 1), ('B', 'Inhibition of cell membrane function', false, 2), ('C', 'Inhibition of protein synthesis', false, 3), ('D', 'Disruption of DNA structure and inhibition of DNA repair', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following is NOT a biochemical test used for bacterial identification??', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Indole test', false, 1), ('B', 'Methyl red test', false, 2), ('C', 'Catalase test', false, 3), ('D', 'Bacterial culture', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which type of sample is recommended for the laboratory detection/diagnosis of rabies in animals?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Whole blood', false, 1), ('B', 'Brain', false, 2), ('C', 'Serum', false, 3), ('D', 'Liver or lung tissues', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'For serological tests, blood samples are collected in which color-coded vacutainer tube?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Red', false, 1), ('B', 'Purple', false, 2), ('C', 'Green', false, 3), ('D', 'Blue', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'All of the following are core biochemical components required for PCR, EXCEPT -', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Template', false, 1), ('B', 'Primer', false, 2), ('C', 'DNA polymerase', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Penicillin, the first widely used antibiotic, was discovered by-', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Alexander Fleming', false, 1), ('B', 'Antony Van Leeuwenhoek', false, 2), ('C', 'Louis Pasteur', false, 3), ('D', 'Robert Koch', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following organisms produces a characteristic metallic green sheen on Eosin Methylene Blue (EMB) agar?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Escherichia coli', false, 1), ('B', 'Salmonella', false, 2), ('C', 'Brucella', false, 3), ('D', 'Camphylobacter', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Sabouraud’s dextrose agar (SDA) is a selective culture medium primarily used for the growth of-', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bacteria', false, 1), ('B', 'Fungi', false, 2), ('C', 'Virues', false, 3), ('D', 'Parasites', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Leptospira, the causative agent of leptospirosis, is classified as-', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bacteria', false, 1), ('B', 'Spirocheate', false, 2), ('C', 'Virus', false, 3), ('D', 'Fungus', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The ability of a microbial species to cause disease in a host is termed -', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Pathogenicity', false, 1), ('B', 'Virulence', false, 2), ('C', 'Infectivity', false, 3), ('D', 'Parasitism', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Cefotaxime belongs to which generation of cephalosporin antibiotics?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'First-generation cephalosporin', false, 1), ('B', 'Second-generation cephalosporin', false, 2), ('C', 'Third-generation cephalosporin', false, 3), ('D', 'Fourth-generation cephalosporin', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following statements about bacterial cell walls is correct?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'The cell wall of Gram positive bacteria has a higher amount of peptidoglycan than gram negative bacteria.', false, 1), ('B', 'The cell wall of Gram negative bacteria has a higher amount of peptidoglycan than gram positive bacteria.', false, 2), ('C', 'Gram positive bacteria have more lipid content in their cell wall than gram negative bacteria.', false, 3), ('D', 'All of the above.', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'During routine Hematoxylin & Eosin (H&E) slide preparation, which step preserves the tissue’s structure and prevents degradation?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Fixation', false, 1), ('B', 'Embedding in paraffin', false, 2), ('C', 'Staining', false, 3), ('D', 'Slicing', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Bacteria primarily multiply by which of the following processes?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Sexual reproduction', false, 1), ('B', 'Budding', false, 2), ('C', 'Binary fission', false, 3), ('D', 'Replication', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which method is commonly used to sterilize culture media in microbiology?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Autoclave', false, 1), ('B', 'Hot air oven', false, 2), ('C', 'Pasteurization', false, 3), ('D', 'None of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Organisms that obtain energy from chemical compounds is called-', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Phototrophs.', false, 1), ('B', 'Autotrophs', false, 2), ('C', 'Heterotrophs', false, 3), ('D', 'Chemotrophs.', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Multidrug-resistant (MDR) organisms usually refer to bacteria that are:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Resistant to at least one agent in two or more antimicrobial categories', false, 1), ('B', 'Resistant to at least one agent in three or more antimicrobial categories', false, 2), ('C', 'Resistant to at least one agent in four or more antimicrobial categories', false, 3), ('D', 'Resistant to at least one agent in five or more antimicrobial categories', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The ability of a diagnostic test to correctly identify samples that are truly positive is called:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Specificity', false, 1), ('B', 'Sensitivity', false, 2), ('C', 'Precision', false, 3), ('D', 'Accuracy', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'What happens during the denaturation in the PCR steps?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'DNA breaks down into two single strands', false, 1), ('B', 'Primers bind to the complementary sequences on the single-stranded DNA', false, 2), ('C', 'DNA polymerase attaches to the primer and synthesizes a new DNA strand by adding dNTPs', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'The best phase for collection of samples for microbiology or pathogen detection is -', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Incubation period', false, 1), ('B', 'Prodromal phase', false, 2), ('C', 'Early illness (acute) phase)', false, 3), ('D', 'Convalescence (recovery) phase', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Genetic recombination in bacteria can occur through which of the following mechanisms?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Transformation', false, 1), ('B', 'Transduction', false, 2), ('C', 'Conjugation', false, 3), ('D', 'All of the above', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'ELISA is primarily used to detect:', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Whole organisms', false, 1), ('B', 'Antibodies', false, 2), ('C', 'DNA', false, 3), ('D', 'RNA', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which of the following bacteria is acid-fast?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Bacillus anthracis', false, 1), ('B', 'Mycobacterium tuberculosis', false, 2), ('C', 'Staphylococcus aureus', false, 3), ('D', 'Salmonella Typhi', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which bacterial structure helps in attachment to host cells?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'Capsule', false, 1), ('B', 'Flagella', false, 2), ('C', 'Pili/Fimbriae', false, 3), ('D', 'Endospore', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'mcq', 'Which immunoglobulin is first produced in a primary immune response?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1, 60,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.question_options (question_id, label, body, is_correct, position) select nq.id, v.label, v.body, v.ok, v.pos from nq, (values ('A', 'IgG', false, 1), ('B', 'IgM', false, 2), ('C', 'IgA', false, 3), ('D', 'IgE', false, 4)) as v(label, body, ok, pos);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Staining techniques in microbiology are broadly classified into Simple, Differential, and
Special stains. For each category, list at least two examples in each category and explain their
principles and specific uses in microbial identification.
a. Simple stains
b. Differential stain
c. Special stains', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Define the following terms and give at least one example of each:
a) Sterilization
b) Disinfection
c) Antiseptics
d) Degerming
e) Sanitation', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Using a standard 2×2 diagnostic test evaluation table, define and explain the following terms:
a) Sensitivity
b) Specificity', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'short_answer', 'Classifying viruses according to Baltimore classification and give one example each.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5, 540,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'passage', 'Case I
In mid-August 2025, a dairy cluster (5 animals in the household) in Samtse Dzongkhag reported a
Lumpy skin disease (LSD) outbreak, detected through a rapid diagnostic kit.
LSD is caused by various strains of Capri poxvirus genus within the family Poxviridae, disease of
cattle characterized by fever, nodules on the skin, mucous membranes and internal organs, emaciation,
enlarged lymph nodes, and oedema of the skin. The disease is of economic importance as it can cause
a temporary reduction in milk production, temporary or permanent sterility in bulls, damage to hides
and, occasionally, death.
Transmission of LSD virus is thought to be predominantly by arthropods, natural contact transmission
in the absence of vectors is minimal. Vector pressure (biting flies) is high after monsoon rains.
National referral lab, NCAH was requested for sampling and confirmatory testing.
Note: LSDV is not transmissible to humans.
Answer the following questions-
1. The following questions are related to sampling during LSD outbreaks. Answer it accordingly.
(9 marks)
a) State the main objectives of the field sampling during LSD outbreaks.
b) List the types of samples suitable for laboratory diagnosis of LSD, ranking them by
expected diagnostic yield.
c) Explain how animals should be selected and prioritized for sampling during LSD
outbreaks, and give reasons for this approach.
d) Describe the essential biosafety and biosecurity measures to be followed in the field while
collecting LSD samples.
e) Outline the correct packaging and transport procedure for LSD samples from the field to
the laboratory.
2. Explain the principle, components and procedures of Polymerase Chain Reaction (PCR).
(5 marks)
3. Outline a CONCEPTUAL detection workflow for LSDV through real time PCR including
sample processing and nucleic acid extraction, PCR workflow , machine run, data analysis
(real time-read out and cycle threshold), and result interpretation.
You need not mention the name of commercial kits during the workflow.
The primer and probe available for LSDV at NCAH are as follows:
Probe – 5’ TGGCTCATAGATTTCCT3''
Primer forward - 5'' AAA ACGGTATATGCAATAGAATGGAA 3’
Prime Reverse - 5'' AAATGAAACCAATGGATCGGATA 3''
(8 marks)
4. Why is RT-PCR preferred over conventional PCR, list the differences, and
advantages/disadvantages? (3 marks)
5. Define Quality control (QC) and Quality assurance (QA) and list at least one QC tool of
quality control followings and its significance in any laboratory setting? (5 marks)
6. The following questions related to other tests options and differential diagnosis of LSD.
Answer it accordingly. (12 marks)
a) Beyond PCR, list other test/ methods that can be adopted for LSDV detection.
b) In terms of causative agent, list differential diagnoses to consider/rule out.
c) Outline the laboratory biosafety and biosecurity while dealing with LSDV.
d) Would you consider collecting the arthropods surrounding the outbreak area, and if so why
and what are the test(s) that can be conducted and explain?
7. These are 5 sample results of RT PCR from different outbreak regions using skin biopsy
samples, interpreting the results as asked below (8 marks)
Samples Results
A Ct=22
B Ct=36
C Ct=39 (repeated once, similar result)
D No amplification, but internal control amplified normally
E No amplification, internal control failed
a) Which samples are positive for LSDV?
b) Which sample is indeterminate and what would you do next?
c) What does sample E indicate and what corrective step is required?
d) Which Samples are negative for LSDV?', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50, 5400,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-micro2025-case1', 1, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3)) as v(l, t, m, p);
with nq as (
  insert into public.questions (stage, question_type, stem, key_points, subject_id, paper_id, difficulty, marks, estimated_seconds, origin, status, ai_review, passage_group, passage_position, specialisation_id)
  values ('ME', 'passage', 'Case II
National Centre for Animal Health (NCAH), Serbithang had received a report of a suspected rabid dog
biting the humans and animals in Samtenthang village, Samtenling geog under Sarpang geog. As per
the report from the dzongkhag veterinary hospitals, the suspected dog had bitten 10 cattles, 4 dogs, 1
goat, 2 cats and 1 child before it disappeared into the forest. The dzongkhag veterinary hospitals along
with other relevant stakeholders are implementing the preventive and control measures to prevent the
further spread of the infection.
Taking the above scenario into consideration, answer the following questions:
a) Describe the structure and genome organization of the virus suspected in this outbreak?
(10 marks)
b) Outline the steps of rabies virus replication cycle in host cells? (10 marks)
c) Explain the mechanism of viral entry into the nervous system and spread to the CNS.
(10 marks)
d) List direct and indirect laboratory diagnostic methods for rabies available to microbiologists.
(10 marks)
e) What preventive measures and post-exposure prophylaxis (PEP) should be recommended for
this scenario? (10 marks)', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 50, 5400,
    'historical_official', 'draft', '{"verdict": "needs_expert", "issues": ["Answers not written by Soma: a subject expert must add the correct option / model answer and key points before publishing."], "batch": "ME Paper III (Technical, Microbiology): BCSE 2025 - questions only, expert to add answers", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, Microbiology", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-micro2025-case2', 1, (select id from public.specialisations where code = 'microbiology'))
  returning id
)
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select nq.id, v.l, v.t, v.m, v.p from nq, (values ('Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 30.0, 1), ('Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 12.5, 2), ('Expression', 'Clear, organised answer; units and labels where needed.', 7.5, 3)) as v(l, t, m, p);
commit;
