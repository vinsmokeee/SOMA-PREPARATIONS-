-- ME Paper III (Technical, ICT): BCSE 2024, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'ict', 'ICT' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'ict') is null then raise exception 'unknown specialisation ict'; end if; end $$;
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In computing, one terabyte(TB) is equal to:', null, 'In binary (computing) units 1 TB = 1024 GB.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M1' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '1024 MB', false, 1), ('B', '1024 GB', true, 2), ('C', '1000 MB', false, 3), ('D', '1000 GB', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following protocols is used for email transmission?', null, 'SMTP (Simple Mail Transfer Protocol) sends email.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M2' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'HTTP', false, 1), ('B', 'SNMP', false, 2), ('C', 'SMTP', true, 3), ('D', 'FTP', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does the hexadecimal color code #FFFFFF represent?', null, '#FFFFFF has red, green and blue all at maximum (FF), giving white.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M3' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Black', false, 1), ('B', 'Black and White', false, 2), ('C', 'White', true, 3), ('D', 'RBG', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following languages is commonly used for front-end web development?', null, 'JavaScript runs in the browser for front-end development (with HTML and CSS).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M4' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'PHP', false, 1), ('B', 'JavaScript', true, 2), ('C', 'Python', false, 3), ('D', 'SQL', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary goal of sentiment analysis?', null, 'Sentiment analysis identifies the opinion or emotion (positive, negative, neutral) in text.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M6' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To clean and prepare data', false, 1), ('B', 'To predict future trends', false, 2), ('C', 'To store data', false, 3), ('D', 'To measure the sentiment or emotion expressed in textual data', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Convert the subnet mask 255.255.255.240 into CIDR notation.', null, '240 = 11110000, so the mask has 24 + 4 = 28 one-bits: /28.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M7' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '/28', true, 1), ('B', '/27', false, 2), ('C', '/29', false, 3), ('D', '/30', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Scrum, what is a "sprint"?', null, 'A sprint is a fixed time-box (usually 1-4 weeks) in which the team completes a set of work.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M8' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A user specification document.', false, 1), ('B', 'A fixed-duration iteration for completing a set of work.', true, 2), ('C', 'A set of user stories.', false, 3), ('D', 'A meeting to review project progress with management.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is Infrastructure as Code (IaC) in DevOps?', null, 'IaC defines and provisions infrastructure through code and automation tools (e.g. Terraform, Ansible).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M9', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M9' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Managing and provisioning infrastructure through code and automation tools', true, 1), ('B', 'The process of integrating code into a central repository.', false, 2), ('C', 'Writing code for software applications.', false, 3), ('D', 'The process of documenting infrastructure manually.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M9';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which algorithm is commonly used for public key cryptography?', null, 'RSA is a public-key (asymmetric) algorithm; AES and DES are symmetric, SHA-256 is a hash.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M10' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RSA', true, 1), ('B', 'SHA-256', false, 2), ('C', 'AES', false, 3), ('D', 'DES', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which version control system is widely used in DevOps practices?', null, 'Git is the most widely used version control system in DevOps.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M11' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Apache', false, 1), ('B', 'Git', true, 2), ('C', 'Oracle', false, 3), ('D', 'Asana', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How is data typically managed in a microservices architecture?', null, 'Each microservice owns its data (database-per-service) so services stay independent.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M12' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'No databases are used.', false, 1), ('B', 'A single database shared by all services.', false, 2), ('C', 'All data is stored in files.', false, 3), ('D', 'Each microservice has its own independent database.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main purpose of a subnet mask in networking?', null, 'A subnet mask separates the network portion of an IP address from the host portion.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M13' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'To assign IP addresses to devices.', false, 1), ('B', 'To identify the MAC address of a device.', false, 2), ('C', 'To encrypt data being transmitted.', false, 3), ('D', 'To divide an IP address into network and host portions.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which type of network architecture typically uses a central server to manage network resources?', null, 'Client-server networks use central servers to manage resources and services.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M14' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Mesh network.', false, 1), ('B', 'Client-server network.', true, 2), ('C', 'Peer-to-peer network.', false, 3), ('D', 'Bus network.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the logical way to handle network congestion in a design?', null, 'QoS prioritises critical traffic (voice, video) when the network is congested.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M15' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Implement Quality of Service (QoS) to prioritize critical traffic.', true, 1), ('B', 'Only use wired connections.', false, 2), ('C', 'Use Cat6 cables.', false, 3), ('D', 'Reduce the number of users on the network.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is an "agile methodology" in the context of digital transformation?', null, 'Agile is a flexible, iterative approach delivering in small increments with feedback.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M16' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A method to include both software and hardware aspects.', false, 1), ('B', 'A method for business process reengineering.', false, 2), ('C', 'A static approach to project management.', false, 3), ('D', 'A flexible and iterative approach to project management.', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which protocol is commonly used for remote management of data center devices?', null, 'SNMP is used to monitor and manage network and data-centre devices remotely.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M17' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'HTTP', false, 1), ('B', 'VPN', false, 2), ('C', 'HTTPS', false, 3), ('D', 'SNMP', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What does the term "edge computing" refer to in the context of IoT?', null, 'Edge computing processes data on or near the devices that produce it, reducing latency and bandwidth.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M18' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Performing computation in mainframe computers.', false, 1), ('B', 'Performing computation at data centers.', false, 2), ('C', 'Performing computation on local devices close to the source of data.', true, 3), ('D', 'Performing computation in the cloud.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which feature of blockchain ensures that once data is recorded, it cannot be altered?', null, 'Immutability: recorded blocks cannot be changed without breaking the hash chain.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M19' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Ledgers', false, 1), ('B', 'Decentralization', false, 2), ('C', 'Immutability', true, 3), ('D', 'Scalability', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a type of Machine Learning where the algorithm is trained on labeled data?', null, 'Supervised learning uses labelled training data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M20' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Supervised Learning', true, 1), ('B', 'Both B and C', false, 2), ('C', 'Unsupervised Learning', false, 3), ('D', 'Reinforcement Learning', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a method of securing data in transit?', null, 'Encryption (e.g. TLS) protects data while it travels over the network.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M21' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Firewall', false, 1), ('B', 'Encryption', true, 2), ('C', 'Decryption', false, 3), ('D', 'Cloud storage', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following formats is most commonly used to structure data in a RESTful API response?', null, 'RESTful APIs most commonly return JSON.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M23' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'JSON', true, 1), ('B', 'XML', false, 2), ('C', 'HTML', false, 3), ('D', 'CSV', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What type of diagram can be used to complement a DFD by showing the structure of data within the system?', null, 'An ER diagram shows the data structure (entities, attributes, relationships) that a DFD''s data stores hold.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M24' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Entity-Relationship Diagram (ERD)', true, 1), ('B', 'Sequence Diagram', false, 2), ('C', 'Flowchart', false, 3), ('D', 'Gantt Chart', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What will be the output of the following code snippet?
fruits = ["apple", "banana", "cherry"]
print(len(fruits))', null, 'The list has three items, so len(fruits) prints 3.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M25' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '5', false, 1), ('B', '3', true, 2), ('C', '4', false, 3), ('D', '2', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which chmod command will give read and write permissions to the owner, and read-only permissions to the group and others?', null, '644 = owner rw- (6), group r-- (4), others r-- (4).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M26' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'chmod 755', false, 1), ('B', 'chmod 777', false, 2), ('C', 'chmod 622', false, 3), ('D', 'chmod 644', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following statements is correct?', null, 'BCNF is stricter than 3NF, so every relation in BCNF is also in 3NF.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M27' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'A relation in 1NF is always in 2NF', false, 1), ('B', 'A relation in 3NF is always in BCNF', false, 2), ('C', 'A relation in BCNF is always in 3NF', true, 3), ('D', 'A relation in 2NF is always in 3NF', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which command is used to check connectivity or if a port is open on a network?', null, 'telnet <host> <port> tests whether a TCP port is open (ping only tests reachability).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M28' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ping', false, 1), ('B', 'traceroute', false, 2), ('C', 'telnet', true, 3), ('D', 'netstat', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The SQL WHERE clause:', null, 'WHERE filters rows; the SELECT list limits columns.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M29' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Neither A nor B are correct.', false, 1), ('B', 'Limits the row data that are returned.', true, 2), ('C', 'Both A and B are correct.', false, 3), ('D', 'Limits the column data that are returned.', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following cloud computing service models provides the most comprehensive solution for end-users, including fully functional applications?', null, 'SaaS delivers complete, ready-to-use applications to end users.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'M30' on conflict do nothing;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'FaaS', false, 1), ('B', 'PaaS', false, 2), ('C', 'IaaS', false, 3), ('D', 'SaaS', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 1. What is the principle of least privilege in network security and why is it needed? (2 marks)', 'The principle of least privilege means that every user, program, process or device is given only the minimum access rights it needs to do its job, and only for as long as needed (e.g. a finance clerk can read and update finance records but cannot change server settings). It is needed because it limits the damage if an account is compromised or misused, stops malware spreading with high privileges, reduces the attack surface and insider threats, and helps auditing and compliance.', null, '[{"point": "Definition: users, programs and devices get only the minimum access rights needed for their task, for the minimum time", "marks": 1}, {"point": "Need: limits damage from compromised accounts, insider misuse and malware spread; reduces attack surface; supports compliance", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
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
  values ('ME', 'short_answer', 'Part II, question 2. What is cloud computing? State briefly any two types of cloud service models. (3 marks)', 'Cloud computing is the on-demand delivery of computing resources - servers, storage, databases, networking and software - over the internet from a provider''s data centres, with rapid scaling and pay-as-you-go pricing instead of owning the hardware. Service models: (1) Infrastructure as a Service (IaaS) - the provider supplies virtual machines, storage and networks and the user manages the operating system and applications (e.g. AWS EC2, Azure VMs); (2) Software as a Service (SaaS) - complete applications used through a browser, managed fully by the provider (e.g. Gmail, Microsoft 365). (Platform as a Service, PaaS, supplies a ready platform for developing and deploying applications, e.g. Google App Engine.)', null, '[{"point": "Cloud computing: on-demand delivery of computing resources (servers, storage, software) over the internet, pay-as-you-go, scalable, managed by provider", "marks": 1}, {"point": "Two models explained, e.g. IaaS (virtual machines, storage, networks - AWS EC2), PaaS (platform to build/deploy apps - Google App Engine), SaaS (ready applications - Gmail, Microsoft 365)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 3. Briefly state what descriptive analytics, predictive analytics and prescriptive analytics are. (3 marks)', 'Descriptive analytics summarises historical data to show what has happened, using reports, dashboards and statistics (e.g. monthly sales or number of patients last year). Predictive analytics uses statistical models and machine learning on past data to forecast what is likely to happen (e.g. predicting demand or which customers may leave). Prescriptive analytics goes further and recommends what should be done, using optimisation and simulation to choose the best action (e.g. the best route or stock level).', null, '[{"point": "Descriptive: what happened - summarises past data (reports, dashboards, averages)", "marks": 1}, {"point": "Predictive: what is likely to happen - statistical/ ML models forecast future", "marks": 1}, {"point": "Prescriptive: what should be done - recommends actions/ optimisation", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 4. For the following Java code, write the output:
public class Main {
  public static void main(String[] args) {
    int[][] matrix = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
    int sum = 0;
    for (int i = 0; i < matrix.length; i++) {
      sum += matrix[i][i];
    }
    System.out.println("Output is : " + sum);
  }
} (3 marks)', 'The loop runs for i = 0, 1, 2 (matrix.length = 3) and adds the main-diagonal elements matrix[i][i]: 1 + 5 + 9 = 15. The program prints: Output is : 15', null, '[{"point": "Loop adds diagonal elements matrix[0][0] + matrix[1][1] + matrix[2][2] = 1 + 5 + 9", "marks": 2}, {"point": "Output: Output is : 15", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 5. How many hosts can be addressed in a Class C network, and what is the subnet mask for a network with 4 subnets each capable of hosting up to 30 devices? (4 marks)', 'A Class C network (/24, default mask 255.255.255.0) has 8 host bits: 2^8 = 256 addresses, of which 254 are usable hosts (network and broadcast addresses excluded). For subnets of up to 30 devices: 30 hosts need 5 host bits (2^5 - 2 = 30), leaving 3 bits for subnets, so the mask is /27 = 255.255.255.224; this gives 8 subnets of 30 usable hosts each - the 4 needed subnets (e.g. .0, .32, .64, .96) plus 4 spare for growth. (If exactly 4 subnets are made by borrowing 2 bits, the mask would be /26 = 255.255.255.192 with 62 hosts each, wasting addresses; /27 matches the 30-host requirement.)', null, '[{"point": "Class C /24: 2^8 - 2 = 254 usable hosts", "marks": 1.5}, {"point": "30 hosts need 5 host bits (2^5 - 2 = 30) → /27 = 255.255.255.224 (gives 8 subnets of 30 hosts; 4 are used, rest for growth); (4 subnets only, using 2 bits → /26 = 255.255.255.192 with 62 hosts each)", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 6. Explain the importance of multi-factor authentication (MFA) in enhancing cybersecurity. How does it improve security compared with password-only authentication? (5 marks)', 'Multi-factor authentication requires a user to prove identity with two or more independent factors: something they know (password or PIN), something they have (a phone receiving an OTP, an authenticator app or hardware token) and something they are (fingerprint or face). It is important because passwords are often weak, reused, guessed, or stolen through phishing, malware and data breaches; MFA protects email, banking, government systems and cloud accounts against these attacks and supports compliance. Compared with password-only login, a stolen password alone is no longer enough: the attacker would also need the user''s device or biometric, so brute-force, credential-stuffing and most phishing attacks fail; users are also alerted by unexpected OTP requests. The password stops being a single point of failure.', null, '[{"point": "MFA: two or more independent factors - something you know (password/ PIN), have (phone, token, OTP), are (biometric)", "marks": 1.5}, {"point": "Importance: protects against stolen/ weak/ reused passwords, phishing, brute force, credential stuffing; protects sensitive systems, compliance", "marks": 1.5}, {"point": "Compared to password-only: attacker needs a second factor too; single point of failure removed; alerts on login attempts; examples (OTP, authenticator app, fingerprint)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-part2', 6, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'S6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

1. Propose a suitable network topology for the new office over three floors, considering departmental segregation, scalability and fault tolerance. Justify your choice and describe physical and logical network diagrams. (8 marks)', 'Topology: a hierarchical (extended) star - a collapsed core of two redundant Layer-3 switches in the ground-floor server room, connected by fibre uplinks to access switches on each of the three floors (each access switch dual-homed to both core switches, with link aggregation and rapid spanning tree), plus wireless access points on each floor, the firewall/router and internet links, and a server/storage segment. Physical diagram: internet (two ISPs) → firewall pair → core switches → floor access switches (stacked) → PCs, phones, printers and APs; servers and NAS connected to the core. Logical diagram: separate VLANs for Marketing, HR, Finance, IT, Sales, servers, management, Wi-Fi staff and guest, with inter-VLAN routing and ACLs on the core switches and firewall. Justification: VLANs segregate departments for security and smaller broadcast domains; the star is easy to expand by adding switches or ports; redundancy (dual core, dual uplinks, dual power and ISPs) removes single points of failure; fault isolation and management are simple.', null, '[{"point": "Hierarchical star (extended star): core/ collapsed core in server room, distribution and access switches per floor, redundant uplinks (fibre)", "marks": 3}, {"point": "Logical: VLANs per department, inter-VLAN routing at core L3 switch, server/ DMZ, management VLAN, Wi-Fi", "marks": 2}, {"point": "Justification: segregation, scalability (add switches/ ports), fault tolerance (redundant core, link aggregation, STP, dual power/ ISP); diagrams labelled", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

2. Design an IP addressing scheme for the office network, allocating subnets for each department and floor with future growth. Specify subnet masks and IP ranges and explain your rationale. (8 marks)', 'Use the private block 10.10.0.0/16 for the head office (and 10.20.0.0/16 for the branch so VPN routes do not overlap). Give each department its own VLAN and /24 subnet (254 hosts each, far above current needs of about 40 per department, leaving room for growth): Marketing VLAN 10 - 10.10.10.0/24 (hosts 10.10.10.1-10.10.10.254, gateway .1); HR VLAN 20 - 10.10.20.0/24; Finance VLAN 30 - 10.10.30.0/24; IT VLAN 40 - 10.10.40.0/24; Sales VLAN 50 - 10.10.50.0/24; Servers VLAN 100 - 10.10.100.0/24 (static addresses); Management VLAN 99 - 10.10.99.0/24 (switches, APs, firewall); Staff Wi-Fi - 10.10.60.0/23; Guest Wi-Fi - 10.10.70.0/24 (internet only); Voice/video - 10.10.80.0/24. If a department sits on several floors, the same VLAN is extended across floors (or third-octet blocks per floor, e.g. 10.10.1x.0 for floor 1). Rationale: easy to identify departments from addresses, ample growth, firewall rules per subnet, route summarisation (one /16 per site), DHCP with reservations for printers and static addresses for servers.', null, '[{"point": "Private range e.g. 10.10.0.0/16 (or 172.16.0.0/16); one VLAN/ subnet per department, sized with growth (e.g. /24 each or /25-/26 by size)", "marks": 3}, {"point": "Table: e.g. Marketing 10.10.10.0/24 (10.10.10.1-254), HR 10.10.20.0/24, Finance 10.10.30.0/24, IT 10.10.40.0/24, Sales 10.10.50.0/24, servers 10.10.100.0/24, management 10.10.99.0/24, Wi-Fi/ guest separate; gateway .1, DHCP ranges, static for servers", "marks": 3}, {"point": "Rationale: growth, summarisation, easy identification, security policies by subnet, branch uses different range (10.20.0.0/16) for VPN", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

3. Identify and describe at least four essential network devices for the new office network and explain the role of each. (8 marks)', '(1) Edge router/next-generation firewall - connects the office to the internet and branch (WAN), performs NAT, routing and security inspection (firewall rules, IPS, web filtering) and terminates site-to-site and remote-access VPNs. (2) Core Layer-3 switches - the high-speed backbone joining all floors and servers, routing between VLANs with access control lists, with redundancy. (3) Access switches (managed, PoE) on each floor - connect PCs, printers and phones to the network, assign VLANs, provide port security and power Wi-Fi access points and IP phones. (4) Wireless access points with a controller - give secure staff and guest Wi-Fi with roaming across floors. Also: servers and NAS/SAN for file sharing and storage, a domain controller for user accounts, and UPS for power protection.', null, '[{"point": "Router/ firewall (NGFW): internet/ WAN, NAT, security policies, VPN", "marks": 2}, {"point": "Core Layer-3 switch: high-speed backbone, inter-VLAN routing", "marks": 2}, {"point": "Access switches (PoE): connect end devices, VLANs, power APs/ IP phones", "marks": 2}, {"point": "Wireless access points + controller; servers/ NAS; others (load balancer, UPS)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

4. Outline any three security technologies for the new office network and explain why. Also describe how you would securely connect the branch office in another location. (8 marks)', '(1) Next-generation firewall with intrusion prevention - controls traffic between internet, departments and servers, blocks malware and attacks and filters websites, because the perimeter and internal segments must be protected. (2) Network access control (802.1X with RADIUS) and VLAN segmentation with ACLs - only authenticated users and devices join, and departments such as Finance and HR are isolated, limiting damage from a compromised device. (3) Endpoint protection (antivirus/EDR) with patch management, plus multi-factor authentication for logins and VPN - because most attacks begin at user devices and stolen passwords. (Encrypted Wi-Fi WPA3-Enterprise and central logging/SIEM also help.) Branch connection: a site-to-site IPsec VPN between the head-office firewall and the branch firewall over the internet, using strong encryption (AES-256), certificate or pre-shared key authentication and the firewall''s access rules; for reliability, SD-WAN over two ISPs (or a leased line with VPN backup), with monitoring.', null, '[{"point": "Three technologies explained: next-generation firewall/ UTM with IPS; VLAN segmentation + ACLs/ NAC (802.1X); endpoint protection/ antivirus/ EDR; MFA; encryption; SIEM/ logging", "marks": 5}, {"point": "Branch connectivity: site-to-site IPsec VPN over internet (or SD-WAN/ leased line), strong encryption, authentication, redundant links", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

5. Identify any three technologies you would implement so the network can handle high-bandwidth applications and maintain optimal performance for all users. (6 marks)', '(1) Quality of Service (QoS) - classify and prioritise real-time traffic such as video conferencing and voice over bulk downloads, so calls stay clear during busy periods. (2) High-capacity infrastructure - 10 Gbps fibre uplinks between floors and core, Gigabit (or multi-gigabit) access ports, link aggregation for extra bandwidth and redundancy, and Wi-Fi 6 access points. (3) Dual internet links with load balancing or SD-WAN, plus monitoring tools (SNMP/NetFlow) to find bottlenecks; VLAN segmentation reduces broadcast traffic, and local caching of updates saves bandwidth.', null, '[{"point": "Quality of Service (QoS) to prioritise voice/ video", "marks": 2}, {"point": "High-capacity links: 10 Gbps fibre uplinks, Gigabit/ multi-gig to desktops, link aggregation; Wi-Fi 6", "marks": 2}, {"point": "Load balancing/ dual ISP/ SD-WAN, VLAN segmentation, caching, bandwidth monitoring (NetFlow/ SNMP)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

6. Explain how you would set up file sharing within the network and manage user permissions effectively. What tools or protocols would you use? (6 marks)', 'Set up a central file server or NAS with a shared folder per department and a common folder, accessed over SMB/CIFS (Windows clients) or NFS (Linux) and mapped automatically as network drives by group policy. Users authenticate against a directory service (Active Directory or LDAP); create security groups for each department and role, and give permissions to groups, not individuals (e.g. Finance group: modify on Finance share; managers: read on all; others: no access), following least privilege with NTFS and share permissions. Add auditing of access, storage quotas, shadow copies/versioning for accidental deletion and encryption of sensitive folders.', null, '[{"point": "Central file server/ NAS with departmental shared folders; SMB/ CIFS (Windows) or NFS; mapped drives", "marks": 2}, {"point": "Permissions via directory service (Active Directory/ LDAP) groups per department, NTFS/ share permissions, least privilege, role-based access", "marks": 3}, {"point": "Auditing, quotas, versioning/ shadow copies, encryption", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 6, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network design for a corporate office
You are a network consultant designing a comprehensive, secure and efficient network for the new office of Kuensel Corporation (called "ABC Corporation" in question 1). The office will have 200 employees in Marketing, HR, Finance, IT and Sales over three floors. Each department needs dedicated resources and services: file sharing, permissions management, high-speed internet and secure internal communication. The network must support high-bandwidth applications such as video conferencing and data transfers while keeping data secure. The office needs centralised storage for file sharing and backup, effective user access controls, scalability for future growth, and secure connectivity to a branch office in another city.

7. Recommend storage solutions for the office network, considering backup, scalability and data redundancy. Justify your recommendations. (6 marks)', 'Primary storage: a NAS with RAID 6 or RAID 10 (or a SAN if servers are virtualised) holding the file shares, giving redundancy against disk failure, snapshots for quick recovery, and the ability to add disks or expansion shelves as data grows. Backup: follow the 3-2-1 rule - daily incremental and weekly full backups to a separate backup appliance, plus a copy offsite (replicated to the branch office or encrypted cloud backup), with regular restore tests. Justification: RAID keeps data available when a disk fails, snapshots and backups protect against deletion and ransomware, offsite copies protect against fire or disaster, and modular storage scales with the company at reasonable cost.', null, '[{"point": "NAS (or SAN for virtualisation) with RAID (RAID 5/6/10) for redundancy, expandable", "marks": 2}, {"point": "Backup: 3-2-1 rule - local backup appliance + offsite/ cloud or branch replication, scheduled, tested", "marks": 2}, {"point": "Scalability: add drives/ shelves, cloud tiering; snapshots; justification (availability, recovery, cost)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case1', 7, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q7', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C1Q7' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C1Q7';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 1: Entity-relationship model.
(i) Identify the entities and their attributes for the DoFPS EMS database. (3 marks)
(ii) What is the difference between a primary key and a foreign key? (2 marks)
(iii) Develop an ER model showing the relationships between these entities. State any assumptions and indicate all relationships and constraints. (7 marks) (12 marks)', '(i) Entities and attributes: Employee (EmployeeID, Name, ContactNumber, Email, EmployeeType, Village, Gewog, Dzongkhag, JobTitle, Role, Status, DepartmentID); Department (DepartmentID, DepartmentName); LeaveType (LeaveTypeID, LeaveTypeName, TotalDaysEligible); EmployeeLeave (EmployeeID, LeaveTypeID, Year, AvailedLeave, LeaveBalance); Training (TrainingID, TrainingType, Name, StartDate, EndDate, Organizer, Place); Patrolling (PatrolID, Date, Location, Purpose, Duration, Remarks).
(ii) A primary key uniquely identifies each record in a table and cannot be null or duplicated (e.g. EmployeeID). A foreign key is a column in one table that refers to the primary key of another table, linking them and enforcing referential integrity (e.g. DepartmentID in Employee referring to Department).
(iii) ER model (assumptions: one employee belongs to one department; a training may have many employees and an employee many trainings; a patrol may involve several employees): Department 1 — N Employee (each employee must have a department). Employee 1 — N EmployeeLeave N — 1 LeaveType (leave records per employee per type and year). Employee M — N Training, resolved by EmployeeTraining (EmployeeID, TrainingID, Status) with composite primary key. Employee M — N Patrolling, resolved by PatrolMember (PatrolID, EmployeeID, Role). Constraints: primary keys underlined, foreign keys referencing parents, Status in (Active, Resigned), EmployeeType in (Regular, Contract), TrainingType in (STT, LTT, Workshop, Conference), EndDate ≥ StartDate, LeaveBalance = TotalDaysEligible - AvailedLeave ≥ 0, email unique.', null, '[{"point": "(i) Entities: Employee, Department, Leave (LeaveType/ LeaveRecord), Training, Patrolling with listed attributes", "marks": 3}, {"point": "(ii) Primary key uniquely identifies each row, not null; foreign key refers to primary key of another table, enforces referential integrity", "marks": 2}, {"point": "(iii) Relationships: Department 1-N Employee; Employee 1-N LeaveRecord (N-1 LeaveType); Employee M-N Training (via EmployeeTraining); Employee 1-N/ M-N Patrolling; cardinalities, participation, assumptions; diagram", "marks": 7}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 12,
    1296, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q1' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 7.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 3.0, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 2: Normalisation.
(i) What is normalisation and why is it carried out? (2 marks)
(ii) Explain the process of normalising the schema you created in Question 1, so that the final design is at least in 3NF. Give examples and explain each step. (6 marks) (8 marks)', '(i) Normalisation is the process of organising data into well-structured tables, based on functional dependencies, to remove redundancy and avoid insertion, update and deletion anomalies, so that data stay consistent and storage is efficient.
(ii) Start from a single unnormalised record: Employee(EmployeeID, Name, ..., Address, Department, LeaveTypes..., Trainings..., Patrols...). 1NF: make every value atomic and remove repeating groups - split Address into Village, Gewog, Dzongkhag; move repeating leave, training and patrol data into separate rows/tables (EmployeeLeave, EmployeeTraining, PatrolMember) with keys. 2NF: remove partial dependencies on part of a composite key - in EmployeeTraining(EmployeeID, TrainingID, TrainingName, StartDate...), training details depend only on TrainingID, so they move to Training(TrainingID, Type, Name, StartDate, EndDate, Organizer, Place), leaving EmployeeTraining(EmployeeID, TrainingID). Similarly patrol details move to Patrolling. 3NF: remove transitive dependencies - DepartmentName depends on DepartmentID, not on EmployeeID, so Department is a separate table; TotalDaysEligible depends on the leave type, so it goes to LeaveType; LeaveBalance can be derived (eligible - availed) rather than stored. The final tables (Employee, Department, LeaveType, EmployeeLeave, Training, EmployeeTraining, Patrolling, PatrolMember) are in 3NF.', null, '[{"point": "(i) Organising tables to reduce redundancy and update/ insert/ delete anomalies, ensure integrity", "marks": 2}, {"point": "(ii) 1NF: atomic values, no repeating groups (address split into village, gewog, dzongkhag; one row per training attended)", "marks": 2}, {"point": "2NF: remove partial dependencies on part of composite key (training details in Training, not EmployeeTraining)", "marks": 2}, {"point": "3NF: remove transitive dependencies (department name in Department table, leave eligibility in LeaveType; balance derived)", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q2' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 3: SQL queries. Write SQL queries to:
- Add a new employee. (2 marks)
- Assign a training to the above employee. (2 marks)
- Update the contact number and email of an employee. (2 marks)
- Retrieve a list of all workshops attended by employees. (2 marks)
- Retrieve records of employees who have left the organisation. (2 marks) (10 marks)', 'INSERT INTO Employee (EmployeeID, Name, ContactNumber, Email, EmployeeType, Village, Gewog, Dzongkhag, JobTitle, Role, Status, DepartmentID)
VALUES (''E1001'', ''Karma Dorji'', ''17123456'', ''karma.dorji@dofps.gov.bt'', ''Regular'', ''Changjiji'', ''Chang'', ''Thimphu'', ''Forest Ranger'', ''Field'', ''Active'', ''D01'');

INSERT INTO EmployeeTraining (EmployeeID, TrainingID) VALUES (''E1001'', ''T205'');

UPDATE Employee SET ContactNumber = ''77123456'', Email = ''k.dorji@dofps.gov.bt'' WHERE EmployeeID = ''E1001'';

SELECT e.EmployeeID, e.Name, t.Name AS Workshop, t.StartDate, t.EndDate, t.Place
FROM Employee e JOIN EmployeeTraining et ON et.EmployeeID = e.EmployeeID
JOIN Training t ON t.TrainingID = et.TrainingID
WHERE t.TrainingType = ''Workshop'';

SELECT * FROM Employee WHERE Status = ''Resigned'';', null, '[{"point": "INSERT INTO Employee (...) VALUES (...)", "marks": 2}, {"point": "INSERT INTO EmployeeTraining (EmployeeID, TrainingID) VALUES (...)", "marks": 2}, {"point": "UPDATE Employee SET ContactNumber = ..., Email = ... WHERE EmployeeID = ...", "marks": 2}, {"point": "SELECT ... FROM Employee JOIN EmployeeTraining JOIN Training WHERE TrainingType = ''Workshop''", "marks": 2}, {"point": "SELECT * FROM Employee WHERE Status = ''Resigned''", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q3' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 4: ACID transactions. What does ACID stand for in database transactions? Explain each briefly. (4 marks)', 'ACID stands for Atomicity, Consistency, Isolation and Durability. Atomicity - a transaction is all or nothing: if any step fails, all its changes are rolled back (e.g. leave availed and balance updated together). Consistency - a transaction takes the database from one valid state to another, respecting all constraints and rules. Isolation - concurrent transactions do not interfere; each behaves as if it ran alone (no dirty reads). Durability - once committed, changes are permanent and survive crashes or power failures (written to logs/disk).', null, '[{"point": "Atomicity: all or nothing", "marks": 1}, {"point": "Consistency: valid state to valid state, constraints", "marks": 1}, {"point": "Isolation: concurrent transactions do not interfere", "marks": 1}, {"point": "Durability: committed changes survive failures", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 4,
    432, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q4' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 2.5, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 5: Software development life cycle.
(i) What is a software development life cycle (SDLC)? Give some examples. (2 marks)
(ii) Explain briefly the major phases of the SDLC. (4 marks)
(iii) Differentiate between functional and non-functional requirements. Specify two functional and two non-functional requirements from the case study. (4 marks) (10 marks)', '(i) The SDLC is a structured process for planning, developing, testing, deploying and maintaining software so that it meets requirements on time and within budget. Examples of SDLC models: Waterfall, V-model, Iterative/Incremental, Spiral, and Agile (Scrum).
(ii) Phases: planning and feasibility (scope, cost, schedule); requirements analysis (gathering and documenting what users need); design (architecture, database and interface design); implementation (coding); testing (unit, integration, system and user acceptance testing); deployment (installation, data migration, training); and maintenance (fixing bugs, updates and enhancements).
(iii) Functional requirements describe what the system must do - its features and behaviour; non-functional requirements describe how well it must do it - quality attributes such as performance, security, usability and reliability. Functional (from the case): the system shall record leave availed and calculate leave balance for each employee; the system shall assign trainings to employees and list all workshops attended. Non-functional: only authorised HR staff can edit records, with role-based access and encrypted passwords (security); the system shall be available from field offices across Bhutan and respond within 3 seconds (availability/performance).', null, '[{"point": "(i) Structured process for planning, building, testing and maintaining software; models: Waterfall, Agile/ Scrum, Spiral, V-model, iterative", "marks": 2}, {"point": "(ii) Phases: planning/ feasibility, requirements analysis, design, implementation/ coding, testing, deployment, maintenance", "marks": 4}, {"point": "(iii) Functional = what the system does; non-functional = how well (performance, security, usability); examples: record leave and compute balance, assign training/ list workshops; secure role-based access, available 24/7, responsive within 3 s, works on mobile", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q5' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Employee Management System for the Department of Forests and Park Services
The Department of Forests and Park Services (DoFPS) manages, conserves and sustainably uses Bhutan''s forest resources and protected areas, with many employees stationed across the country. It wants an Employee Management System (EMS) recording:
- Employee: Employee ID, Name, Contact Number, Email, Employee Type (Regular/Contract), Address (Village, Gewog, Dzongkhag), Job Title, Department and Role, Status (Active/Resigned).
- Leave: Leave Type, Total Number of Days Eligible, Availed Leave and Leave Balance.
- Training: Training Type (STT, LTT, Workshop, Conference), Name, Start date, End date, Organizer, Place.
- Patrolling: Date, Location, Purpose, Duration and Remarks.

Question 6: Authentication and security.
(i) What does SSO stand for? Explain its concept and give an example where you have used it. (3 marks)
(ii) Discuss three measures to ensure the security of the DoFPS EMS database. (3 marks) (6 marks)', '(i) SSO stands for Single Sign-On. The user logs in once with a central identity provider and is then trusted by several related applications without logging in again; the identity provider issues a secure token (using SAML, OAuth 2.0 or OpenID Connect) that the applications accept. Example: logging in once to a Google account gives access to Gmail, Google Drive and YouTube (or one government login for several e-services).
(ii) Security measures for the EMS database: (1) access control - role-based permissions with least privilege (HR officers edit, managers view their staff), strong passwords and MFA; (2) encryption - TLS for data in transit, encryption of the database/backups at rest and hashing of passwords; (3) protection and monitoring - parameterised queries to prevent SQL injection, firewall restricting database access to the application server, regular patches, audit logs of changes and regular tested backups.', null, '[{"point": "(i) Single Sign-On: one authentication (identity provider) gives access to multiple related systems; tokens (SAML/ OAuth/ OpenID Connect); example: Google account for Gmail, Drive, YouTube; government single login", "marks": 3}, {"point": "(ii) Three measures: role-based access control/ least privilege + MFA; encryption at rest and in transit (TLS), hashed passwords; backups, patching, auditing/ logging, input validation against SQL injection, firewall", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "source": {"title": "BCSE 2024 Main Examination, Technical Paper III, ICT", "year": 2024, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2024-case2', 6, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.question_appearances (question_id, year) select id, 2024 from me_q where key = 'C2Q6' on conflict do nothing;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a characteristic of Big Data that refers to the different forms of data (structured, semi-structured and unstructured)?', null, 'Variety refers to the many types and formats of data, such as tables, text, images and sensor streams.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Value', false, 1), ('B', 'Velocity', false, 2), ('C', 'Variety', true, 3), ('D', 'Volume', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which standard must organisations that store, process or transmit card payment data comply with?', null, 'PCI DSS (Payment Card Industry Data Security Standard) sets security rules for handling card data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2024, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'N2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'PCI DSS', true, 1), ('B', 'ITIL', false, 2), ('C', 'ISO 9001', false, 3), ('D', 'IEEE 802.11', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N2';
commit;
