-- ME Paper III (Technical, ICT): BCSE 2025, batch 1: ME questions loaded as drafts (awaiting review) for /admin/ai/review.
begin;
create temp table me_q (key text primary key, id uuid not null) on commit drop;
insert into public.topics (subject_id, slug, name) select (select id from public.subjects where slug = 'subject-specialisation'), 'ict', 'ICT' on conflict (subject_id, slug) do nothing;
do $$ begin if (select id from public.specialisations where code = 'ict') is null then raise exception 'unknown specialisation ict'; end if; end $$;
delete from public.paper_blueprint_sections where paper_id = (select id from public.exam_papers where code = 'me-technical-3') and subject_group_id is not distinct from null and specialisation_id is not distinct from (select id from public.specialisations where code = 'ict');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'ict'), null, 1, 'Section A Part I: Multiple choice questions', 'mcq', 30, 1, null, 'BCSE 2025 Main Examination, Technical Paper III, ICT');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'ict'), null, 2, 'Section A Part II: Short answer questions (6 questions)', 'short_answer', 1, 20, null, 'BCSE 2025 Main Examination, Technical Paper III, ICT');
insert into public.paper_blueprint_sections (paper_id, subject_group_id, specialisation_id, topic_slug, sort_order, title, question_type, question_count, marks_each, answer_any, source) values ((select id from public.exam_papers where code = 'me-technical-3'), null, (select id from public.specialisations where code = 'ict'), null, 3, 'Section B: Case study (answer either Case I or Case II)', 'passage', 2, 50, 1, 'BCSE 2025 Main Examination, Technical Paper III, ICT');
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is the fastest type of memory?', null, 'Cache memory is the fastest (after CPU registers).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'RAM', false, 1), ('B', 'Cache', true, 2), ('C', 'SSD', false, 3), ('D', 'Hard Disk', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are designing a search feature for a large e-commerce platform. The search must handle millions of queries per day with low latency. Which data structure or approach is MOST efficient for prefix searches (e.g., autocomplete)?', null, 'A trie gives fast prefix lookups for autocomplete.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M2', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Hash Table', false, 1), ('B', 'Linked List', false, 2), ('C', 'Stack', false, 3), ('D', 'Trie', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You need to find the shortest path between nodes in a graph representing a city map with weighted edges. Which algorithm is MOST appropriate if weights are all non-negative?', null, 'Dijkstra''s algorithm finds shortest paths with non-negative weights.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M3', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Depth-First Search (DFS)', false, 1), ('B', 'Dijkstra’s Algorithm', true, 2), ('C', 'Prim’s Algorithm', false, 3), ('D', 'BFS', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of these is an example of open-source software?', null, 'Apache HTTP Server is open source.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M4', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Apache HTTP Server', true, 1), ('B', 'Google Chrome', false, 2), ('C', 'Adobe Photoshop', false, 3), ('D', 'Microsoft Word', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is it called when IP address conversion is done when going to the internet over the local network?', null, 'NAT translates private addresses to public ones.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M5', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'NAT', true, 1), ('B', 'PAT', false, 2), ('C', 'DHCP', false, 3), ('D', 'Exchange', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the tool used to distribute the traffic to the servers evenly?', null, 'A load balancer spreads traffic across servers.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M6', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Email Security Gateway', false, 1), ('B', 'IDS', false, 2), ('C', 'Load Balancer', true, 3), ('D', 'EDR', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the network technology that provides a safe connection to a distant network?', null, 'A VPN gives an encrypted connection to a remote network.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M7', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Virtual Private Network (VPN)', true, 1), ('B', 'Wireless LAN (WLAN)', false, 2), ('C', 'Application Layer', false, 3), ('D', 'Dynamic Host Configuration Protocol (DHCP)', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M7';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'According to the OSI Reference model, in which layer are the “ATM, Token Ring, Frame Relay, and Ethernet” protocols located?', null, 'Ethernet, Token Ring, Frame Relay and ATM work at the data link layer.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M8', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Datalink Layer', true, 1), ('B', 'Session Layer', false, 2), ('C', 'Application Layer', false, 3), ('D', 'Transport Layer', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M8';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'In Python, what does the following code do? def func(lst): return sum(lst) / len(lst) print(func([1, 2, 3, 4, 5]))', null, 'sum/len returns the average (3.0).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M10', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Returns the sum of the list', false, 1), ('B', 'Returns the average of the list', true, 2), ('C', 'Returns the median of the list', false, 3), ('D', 'Returns the product of the list', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M10';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Suppose each hydropower project generates revenue (in Nu. million) and the following program has been written to aid analysis. What does the program print? #include <iostream> using namespace std; int main() { int revenue[5] = {500, 700, 800}; // Tala, Chukha, Mangdechhu int total = 0; for (int i = 0; i < 5; i++) total += revenue[i]; cout << total; return 0; }', null, 'Unlisted array elements are zero-initialised, so the total is 500 + 700 + 800 = 2000.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M11', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '0', false, 1), ('B', 'Compilation Error', false, 2), ('C', 'Garbage value', false, 3), ('D', '2000', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M11';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How can you include an external CSS file in an HTML document?', null, '<link rel="stylesheet" href="..."> includes an external CSS file.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M12', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '<script src="styles.css">', false, 1), ('B', '<css src="styles.css">', false, 2), ('C', '<style src="styles.css">', false, 3), ('D', '<link rel="stylesheet" href="styles.css">', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M12';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What file contains user account information in most Linux systems?', null, '/etc/passwd holds user account information (passwords hashes are in /etc/shadow).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M13', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', '/etc/passwd', true, 1), ('B', '/etc/users', false, 2), ('C', '/home/users', false, 3), ('D', '/etc/shadow', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M13';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You want to monitor a growing log file in real-time, showing only the last 50 lines and updating continuously. Which command is BEST?', null, 'tail -n 50 -f shows the last 50 lines and follows new lines.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M14', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'cat /var/log/syslog', false, 1), ('B', 'tail -n 50 -f /var/log/syslog', true, 2), ('C', 'head -n 50 /var/log/syslog', false, 3), ('D', 'grep ERROR /var/log/syslog', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M14';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A system admin notices that a particular process is consuming 95% of CPU constantly. Which command combination is BEST to identify and handle the problem?', null, 'top/htop identifies the process; then kill or renice it.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M15', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ls -l /var/log only', false, 1), ('B', 'chmod 777 on the binary', false, 2), ('C', 'top or htop then kill or renice', true, 3), ('D', 'ps aux | grep <process> and kill -9 <pid>', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M15';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'How do you search for a pattern in a file using the terminal?', null, 'grep searches for a pattern in a file.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M16', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Search', false, 1), ('B', 'locate', false, 2), ('C', 'grep', true, 3), ('D', 'find', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M16';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the main advantage of PaaS over IaaS?', null, 'PaaS abstracts infrastructure management.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M17', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Full control of OS', false, 1), ('B', 'Abstracts infrastructure management', true, 2), ('C', 'More storage', false, 3), ('D', 'Cheaper data centers', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M17';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Your company runs a web app with unpredictable traffic spikes. Which cloud feature is MOST useful to handle sudden demand automatically?', null, 'Elasticity scales resources automatically with demand.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M18', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Virtualization', false, 1), ('B', 'High Availability', false, 2), ('C', 'Elasticity', true, 3), ('D', 'Multi-tenancy', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M18';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A cloud customer configures security groups incorrectly, causing a breach. Whose responsibility is this under the Shared Responsibility Model?', null, 'Security group configuration is the customer''s responsibility.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M19', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Both provider and customer', false, 1), ('B', 'Customer', true, 2), ('C', 'Cloud provider', false, 3), ('D', 'Third-party vendor', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M19';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the key difference between a container and a VM?', null, 'Containers share the host kernel; VMs run a full guest OS.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M20', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Containers are slower', false, 1), ('B', 'Containers include full OS', false, 2), ('C', 'Containers share the host kernel', true, 3), ('D', 'VMs are lighter', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M20';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which SQL command is used to remove a table completely?', null, 'DROP TABLE removes the table completely.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M21', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'REMOVE', false, 1), ('B', 'DELETE', false, 2), ('C', 'ERASE', false, 3), ('D', 'DROP', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M21';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'You are tasked with running analytics on structured + semi-structured + unstructured data. Which is MOST suitable?', null, 'A data lake stores structured, semi-structured and unstructured data.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M22', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Cache DB', false, 1), ('B', 'RDBMS', false, 2), ('C', 'Data Warehouse', false, 3), ('D', 'Data Lake', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M22';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is a characteristic of Big Data’s 5Vs?', null, 'Velocity is one of the 5 Vs (volume, velocity, variety, veracity, value).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M23', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Versioning', false, 1), ('B', 'Visualization', false, 2), ('C', 'Velocity', true, 3), ('D', 'Virtualization', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M23';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which is NOT an example of AI chatbots?', null, '''Cloud'' is not a chatbot.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M24', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'ChatGPT', false, 1), ('B', 'Cloud', true, 2), ('C', 'Claude', false, 3), ('D', 'Google Bard', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M24';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'The role of a Certificate Authority (CA) is to', null, 'A CA issues and verifies digital certificates.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M25', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Encrypt all internet traffic', false, 1), ('B', 'Issue and verify digital certificates', true, 2), ('C', 'Generate public/private key pairs', false, 3), ('D', 'Block insecure websites', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M25';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which key does Bob use to decrypt Alice’s message encrypted with his public key?', null, 'Bob decrypts with his private key.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M26', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Alice’s public key', false, 1), ('B', 'Alice’s private key', false, 2), ('C', 'Bob’s public key', false, 3), ('D', 'Bob’s private key', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M26';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'After the secure session is established in HTTPS, data is transmitted using', null, 'After the handshake HTTPS uses symmetric encryption.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M27', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Symmetric key encryption', true, 1), ('B', 'Digital signatures only', false, 2), ('C', 'Hashing only', false, 3), ('D', 'Public key encryption', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M27';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the name given to the output produced by the functions used for integrity check?', null, 'Integrity functions produce a hash (digest).', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M28', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Public Key', false, 1), ('B', 'Collision', false, 2), ('C', 'Hash', true, 3), ('D', 'Verification Number', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M28';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'A public API endpoint allows search queries. You discover that an attacker can inject SQL commands through query parameters. What is the MOST appropriate fix?', null, 'Validate input and use parameterised queries to stop SQL injection.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M29', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Increase server CPU', false, 1), ('B', 'Enable Cross-Origin Resource Sharing', false, 2), ('C', 'Add API keys', false, 3), ('D', 'Validate and sanitize input; use parameterized queries', true, 4)) as v(label, body, ok, pos) where me_q.key = 'M29';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'Which of the following is safer than the others?', null, 'TLS 1.3 is the most secure.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'M30', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'TLS 1.3', true, 1), ('B', 'TLS 1.0', false, 2), ('C', 'SSL 2.0', false, 3), ('D', 'SSL 3.0', false, 4)) as v(label, body, ok, pos) where me_q.key = 'M30';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 1. You are given a list of integers representing scores in a game, e.g. nums = [3, 1, 1, 4, -20, 0]. Write a program in the language of your choice to find the maximum score without using built-in max() or sorting. Explain how your code would behave if the list is empty, contains duplicates or contains all negative numbers. (5 marks)', 'def find_max(nums):
    if not nums:
        return None          # or raise ValueError("empty list")
    best = nums[0]
    for x in nums[1:]:
        if x > best:
            best = x
    return best

print(find_max([3, 1, 1, 4, -20, 0]))   # 4
Behaviour: empty list - returns None (or raises an error) instead of crashing on nums[0]; duplicates - no problem, the maximum value is returned once (e.g. [4, 4] gives 4); all negative - works correctly (e.g. [-5, -2, -9] gives -2) because best starts from the first element, not from 0. Time O(n), space O(1).', null, '[{"point": "Correct loop initialising with first element and comparing", "marks": 3}, {"point": "Edge cases: empty handled (None/error), duplicates fine, all negative works because not initialised to 0", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 2. Your organisation''s computers are frequently targeted by malware. Suggest three key measures to prevent malware infections. Explain briefly why each measure is important. (3 marks)', '1. Keep operating systems and software patched and updated - closes known vulnerabilities that malware exploits. 2. Install and update antivirus/endpoint detection and response (EDR) with email and web filtering - detects and blocks malicious files and links. 3. Train users on phishing and safe practices, and give least-privilege (non-admin) accounts - most malware arrives through users clicking links or attachments, and limited rights reduce the damage. (Also: firewall, application whitelisting, disabling macros/USB autorun, regular offline backups.)', null, '[{"point": "Three measures with reasons (1 each): patching/updates, antivirus/EDR, user awareness/phishing training, email/web filtering, least privilege, backups", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 3. Your company has an Employee table as shown below. Write an SQL query to count the number of employees in each department.
emp_id | name | dept | salary
101 | Alice | HR | 5000
102 | Bob | IT | 6000
103 | Charlie | HR | 5500
104 | David | IT | 6200
105 | Eva | Sales | 4500 (2 marks)', 'SELECT dept, COUNT(*) AS num_employees
FROM Employee
GROUP BY dept;
Result: HR 2, IT 2, Sales 1.', null, '[{"point": "SELECT dept, COUNT(*) ... GROUP BY dept", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 4. Explain machine learning and differentiate supervised and unsupervised learning. (2 marks)', 'Machine learning is a branch of AI in which computers learn patterns from data and improve at a task (predictions, decisions) without being explicitly programmed with rules. Supervised learning trains on labelled data (input with known output) to predict labels, e.g. spam vs not-spam classification, house price regression. Unsupervised learning uses unlabelled data to find hidden structure, e.g. clustering customers into groups, anomaly detection.', null, '[{"point": "ML definition: systems learn patterns from data to make predictions without explicit programming", "marks": 1}, {"point": "Supervised uses labelled data (classification/regression); unsupervised unlabelled (clustering)", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 2,
    216, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.0, 1 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 0.5, 2 from me_q where key = 'S4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 5. You have joined a government office that has 200 devices including PCs, mobiles, printers and laptops, and the number is expected to grow. The subnet is 192.168.1.0/24.
(i) Can all devices be assigned IPs in this subnet?
(ii) Should you keep it this way?
(iii) If not, propose a better solution with justification. (5 marks)', '(i) Yes. A /24 has 2^8 - 2 = 254 usable host addresses (192.168.1.1-192.168.1.254), which is more than 200.
(ii) It is not advisable to keep it this way: only 54 spare addresses remain for growth, all devices share one large broadcast domain (more broadcast traffic), and PCs, guest mobiles and printers are mixed with no separation, which is a security risk.
(iii) Use a larger private range and segment it with VLANs and subnets, e.g. 10.10.0.0/16 or 192.168.0.0/22, divided into: staff PCs/laptops 192.168.0.0/24, Wi-Fi mobiles 192.168.1.0/24, printers and IoT 192.168.2.0/26, servers/management 192.168.2.64/27, with inter-VLAN routing and firewall rules, and DHCP with reservations for printers. Justification: room for growth, smaller broadcast domains for better performance, and access control between groups for security and easier management.', null, '[{"point": "(i) Yes: /24 has 254 usable addresses ≥ 200", "marks": 1}, {"point": "(ii) No: little room for growth (54), one large broadcast domain, mixed device types, security", "marks": 1.5}, {"point": "(iii) Better: segment into VLANs/subnets per device type or department (e.g. /25 or /26 each) or larger range e.g. /23 or 10.x; DHCP; justify growth, performance, security", "marks": 2.5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'S5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'short_answer', 'Part II, question 6. A company installs smart sensors to monitor energy usage and adjust lighting automatically. What technology is being used here? Explain the technology. (3 marks)', 'This is the Internet of Things (IoT), used for smart building/energy management. IoT connects physical devices - sensors (occupancy, light level, energy meters) and actuators (smart switches, dimmers) - to a network (Wi-Fi, Zigbee, LoRaWAN) and a gateway or cloud platform. Data are collected and analysed in real time, rules or AI decide actions (e.g. dim lights when daylight is enough or switch off when a room is empty), and actuators carry them out automatically, with dashboards for monitoring. Benefits: energy savings, lower costs and remote control; risks include security and privacy.', null, '[{"point": "Internet of Things (IoT) (smart building automation)", "marks": 1}, {"point": "Explanation: sensors, connectivity, gateway/cloud processing, actuators, automation/analytics; benefits", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 3,
    324, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-part2', 6, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'S6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 1.5, 1 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'S6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 0.5, 3 from me_q where key = 'S6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure.

1. Network design: draw a simple network diagram for the DPR branch office. Label the main components and briefly explain each component''s role. Keep in mind:
(i) There are two types of users (staff and citizens).
(ii) There are two departments (IT and Service Centre).
(iii) There are on-premises servers. (15 marks)', 'Diagram (top to bottom): ISP links (preferably two for redundancy) → edge router → next-generation firewall (with VPN) → core Layer-3 switch → access switches and wireless access points. Server zone (on-premises servers: records database, web/application, AD/DNS/DHCP) connected to the firewall/core in its own VLAN (public-facing services in a DMZ). VLANs: IT department, Service Centre staff, citizen access (guest Wi-Fi/kiosks, isolated and internet-only or limited to public services), servers, management. Roles: router - connects to ISP and routes traffic, NAT; firewall - filters traffic between zones and internet, IPS, VPN; core switch - inter-VLAN routing, high-speed backbone; access switches - connect end devices with PoE, port security; access points/WLAN controller - staff and guest SSIDs; servers - host services, with backups; network management/monitoring server and UPS for power.', null, '[{"point": "Diagram with ISP/internet, edge router, firewall, core/L3 switch, access switches, wireless APs, server zone/DMZ", "marks": 5}, {"point": "Segmentation: separate VLANs for IT, Service Centre, citizen Wi-Fi/guest, servers; citizens isolated from internal", "marks": 5}, {"point": "Roles explained for each component; redundancy (dual ISP/links), WLAN controller, NAC", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 15,
    1620, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case1', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 9.0, 1 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 4.0, 2 from me_q where key = 'C1Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 2.0, 3 from me_q where key = 'C1Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure.

2. IPv4 subnetting design for the branch office, which has:
(i) the IT department with 10 devices
(ii) the Service Centre with 100 devices
(iii) up to 240 citizens accessing the services at the same time
(iv) 3 on-premises servers.
Present your answer in a table: subnet, subnet mask, network address, broadcast address, usable IP range and number of usable IPs per subnet. Consider scalability for future growth. (10 marks)', 'Using private block 10.10.0.0/22 with VLSM, largest first and room for growth:
Citizens | /23, 255.255.254.0 | network 10.10.0.0 | broadcast 10.10.1.255 | usable 10.10.0.1 - 10.10.1.254 | 510
Service Centre | /24, 255.255.255.0 | 10.10.2.0 | 10.10.2.255 | 10.10.2.1 - 10.10.2.254 | 254
IT department | /27, 255.255.255.224 | 10.10.3.0 | 10.10.3.31 | 10.10.3.1 - 10.10.3.30 | 30
Servers | /28, 255.255.255.240 | 10.10.3.32 | 10.10.3.47 | 10.10.3.33 - 10.10.3.46 | 14
Remaining 10.10.3.48 - 10.10.3.255 is kept for management, future departments and growth. Each subnet is larger than today''s need (240 → 510, 100 → 254, 10 → 30, 3 → 14), so devices can be added without renumbering. (A minimum-size answer - /24, /25, /28, /29 - is acceptable if growth is discussed.)', null, '[{"point": "Correct VLSM sizing with growth (e.g. citizens /23 or /24, service /24 or /25, IT /27 or /28, servers /28 or /29)", "marks": 4}, {"point": "Correct mask, network, broadcast, ranges and counts in table", "marks": 5}, {"point": "Non-overlapping, scalability justified", "marks": 1}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case1', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure.

3. Network performance issue: after a few days of operation, staff in the Service Centre report slow internet speeds.
(i) What tools and methods would you use to identify the root cause of this performance issue? (5 marks)
(ii) How would you optimise the network to improve speed and reliability? (5 marks) (10 marks)', '(i) Work through the layers: check whether the problem is in one department, all users or the ISP link. Use ping and traceroute to find latency/loss; speed tests at different points; SNMP monitoring of link utilisation, CPU and interface errors on router, firewall and switches; NetFlow/sFlow to find top talkers and applications (e.g. citizen Wi-Fi or video streaming consuming bandwidth); Wireshark packet capture for retransmissions, broadcast storms or DNS delays; Wi-Fi analyser for interference; check duplex mismatches, faulty cables and firewall logs. (ii) Apply QoS to prioritise service applications; rate-limit the citizen VLAN; block non-business traffic; upgrade bandwidth or add a second ISP with load balancing/failover; fix faulty cabling and duplex; optimise Wi-Fi (channels, power, more APs); use local DNS caching/proxy; keep firmware updated and monitor continuously.', null, '[{"point": "(i) Tools: ping/traceroute, speed tests, SNMP monitoring (PRTG/Zabbix), NetFlow/top talkers, Wireshark, interface errors, Wi-Fi analyser; layered approach", "marks": 5}, {"point": "(ii) Optimisation: QoS, bandwidth upgrade/load balancing, block/limit non-business use, separate citizen traffic, fix duplex/cabling, caching, Wi-Fi channel planning", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case1', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure.

4. Remote server management: a system administrator needs to remotely manage both Windows and Unix servers from home. The servers must remain secure while allowing full access for administrative tasks. Propose a solution, with an explanation, for each condition:
(i) The administrator must securely connect to the office network from home, with all traffic encrypted.
(ii) For Windows servers, the administrator needs remote access to the graphical interface.
(iii) For Unix servers, the administrator needs to manage the system via the command line.
(iv) Ensure the person connecting really is the authorised administrator, even if the password is stolen.
(v) Restrict which network traffic can reach the servers, minimising exposure to attacks. (10 marks)', '(i) Site-to-client VPN (SSL VPN, IPsec or WireGuard) terminating on the office firewall, so all traffic between home and office is encrypted. (ii) Remote Desktop Protocol (RDP) over the VPN (or through an RD Gateway/jump server) with Network Level Authentication - gives the Windows graphical desktop. (iii) SSH (Secure Shell) over the VPN with key-based authentication, root login and password login disabled - encrypted command-line access. (iv) Multi-factor authentication (password plus OTP app or hardware token/certificate) on the VPN and jump host, so a stolen password alone is not enough. (v) Firewall rules/ACLs that allow RDP (3389) and SSH (22) only from the VPN admin address pool or a bastion host, block them from the internet, keep servers in a separate VLAN, and log/monitor all sessions.', null, '[{"point": "(i) VPN (IPsec/SSL, WireGuard) to firewall", "marks": 2}, {"point": "(ii) RDP over VPN with NLA (or bastion/RD Gateway)", "marks": 2}, {"point": "(iii) SSH with key-based authentication, root login disabled", "marks": 2}, {"point": "(iv) Multi-factor authentication", "marks": 2}, {"point": "(v) Firewall rules/ACLs allowing only VPN admin subnet to RDP/SSH ports, jump host, no direct internet exposure", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case1', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C1Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C1Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case I: Network for a new government branch office
You are hired as a network engineer for the Department of Public Records (DPR), a fictional government agency, which is setting up a new branch office in Gelephu Mindfulness City. The office provides services such as document verification, digital ID issuance and public record access. You are required to build and operate a secure, scalable and resilient network infrastructure.

5. Centralised network management with SDN: after a year, DPR plans to centralise the management of all branch office networks. You propose SDN. Explain to management what Software-Defined Networking (SDN) is and its benefits in streamlining network management across multiple branch offices. (5 marks)', 'Software-Defined Networking separates the control plane (decisions about where traffic goes) from the data plane (the switches and routers forwarding packets). A central software controller holds the network-wide view and programs all devices through open interfaces (e.g. OpenFlow, APIs); for branch offices this is often SD-WAN. Benefits: one central place to configure and monitor all branches; policies (security, QoS) applied consistently everywhere; automation and zero-touch provisioning of new branches, reducing errors and travel; faster changes and troubleshooting with full visibility; intelligent use of multiple links (internet, MPLS) and lower costs.', null, '[{"point": "SDN: separates control plane from data plane; centralised software controller programs devices via APIs (OpenFlow); SD-WAN for branches", "marks": 2}, {"point": "Benefits: central policy/config, automation, faster deployment, visibility, consistent security, cost/agility, traffic optimisation", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 5,
    540, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case1', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C1Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.0, 1 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.0, 2 from me_q where key = 'C1Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C1Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

1. Entity-relationship model
(i) Identify the entities, their attributes and relationships for the HMS database. (3 marks)
(ii) Explain the difference between a composite key and a candidate key. (2 marks)
(iii) Develop an ER model illustrating the relationships, cardinalities and constraints. (5 marks) (10 marks)', '(i) Entities: Patient (PatientID PK, Name, Age/DOB, Gender, Contact, EmergencyContact, Village, Gewog, Dzongkhag, BloodGroup, MedicalHistory, RegistrationDate, Status); Appointment (AppointmentID PK, Date, Time, Type, Status, Remarks, PatientID FK, StaffID FK); Procedure (ProcedureID PK, Type, Name, Date, Duration, Cost, Outcome, Complications, PatientID FK); Staff (StaffID PK, Name, Specialisation, DepartmentID FK, Shift, Contact, Qualification, Experience, EmploymentStatus); Department (DepartmentID PK, Name); Equipment (EquipmentID, Name) and a link table Procedure_Staff and Procedure_Equipment. Relationships: a patient has many appointments and procedures; a staff member attends many appointments; a department has many staff; procedures involve many staff and equipment.
(ii) A candidate key is any minimal set of attributes that uniquely identifies a row (e.g. StaffID, or CID number); one candidate key is chosen as the primary key. A composite key is a key made of two or more attributes together, e.g. (ProcedureID, StaffID) in Procedure_Staff. A composite key can be a candidate key if it is minimal.
(iii) ER model: Patient 1 - N Appointment; Staff 1 - N Appointment; Patient 1 - N Procedure; Procedure M - N Staff (via Procedure_Staff with Role); Procedure M - N Equipment; Department 1 - N Staff. Constraints: PKs unique and not null; FKs enforce referential integrity; CHECK on Status, Type, Gender, Cost ≥ 0; total participation of Appointment in Patient (each appointment must have a patient).', null, '[{"point": "(i) Entities Patient, Appointment, Procedure, Staff, Department (+ others) with attributes and relationships", "marks": 3}, {"point": "(ii) Composite key: key made of two or more attributes; candidate key: minimal attribute set uniquely identifying a row, one chosen as primary", "marks": 2}, {"point": "(iii) ER diagram: Patient 1-M Appointment, Staff 1-M Appointment, Patient 1-M Procedure, Staff M-N Procedure, Department 1-M Staff; PK/FK, NOT NULL, CHECK constraints", "marks": 5}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 1, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q1', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q1';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q1';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

2. Normalisation
(i) Differentiate between 1NF, 2NF and 3NF with examples. (3 marks)
(ii) Normalise the following table into 3NF. List the steps and the final tables. (5 marks)
AppointmentID | PatientName | PatientContact | StaffName | StaffDepartment | Date | Time | Type (8 marks)', '(i) 1NF: every column holds atomic values and there are no repeating groups (e.g. not ''Phone: 17xx, 77xx'' in one cell). 2NF: in 1NF and every non-key attribute depends on the whole primary key, not part of a composite key (e.g. in (PatientID, ProcedureID) → PatientName, PatientName depends only on PatientID, so move it out). 3NF: in 2NF and no transitive dependency - non-key attributes depend only on the key (e.g. StaffID → DepartmentID → DepartmentName; move department details to their own table).
(ii) Step 1 (1NF): the table already has atomic values with key AppointmentID. Step 2 (2NF): single-column key, so no partial dependencies, but patient and staff details repeat. Step 3 (3NF): remove transitive dependencies AppointmentID → Patient → PatientContact and AppointmentID → Staff → StaffDepartment by giving patients and staff their own IDs. Final tables: Patient(PatientID PK, PatientName, PatientContact); Department(DepartmentID PK, DepartmentName); Staff(StaffID PK, StaffName, DepartmentID FK); Appointment(AppointmentID PK, PatientID FK, StaffID FK, Date, Time, Type).', null, '[{"point": "(i) 1NF atomic values no repeating groups; 2NF no partial dependency on composite key; 3NF no transitive dependency - with examples", "marks": 3}, {"point": "(ii) Identify transitive dependencies AppointmentID → PatientID → contact, StaffID → department; introduce IDs", "marks": 2}, {"point": "Final tables: Patient(PatientID, Name, Contact), Department, Staff(StaffID, Name, DeptID), Appointment(AppointmentID, PatientID, StaffID, Date, Time, Type)", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 8,
    864, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 2, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q2', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 5.0, 1 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.0, 2 from me_q where key = 'C2Q2';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q2';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

3. Write SQL for the following (2 marks each):
(i) Register a new patient.
(ii) Schedule an appointment.
(iii) Update the contact number of an existing patient.
(iv) Fetch all surgical procedures performed in the last 30 days.
(v) List all staff members on leave in the Surgery department. (10 marks)', '(i) INSERT INTO Patient (PatientID, Name, Age, Gender, Contact, EmergencyContact, Village, Gewog, Dzongkhag, BloodGroup, RegistrationDate, Status)
VALUES (1001, ''Karma Wangmo'', 34, ''F'', ''17123456'', ''17654321'', ''Babesa'', ''Chang'', ''Thimphu'', ''O+'', CURRENT_DATE, ''Active'');
(ii) INSERT INTO Appointment (AppointmentID, PatientID, StaffID, Date, Time, Type, Status)
VALUES (5001, 1001, 201, ''2025-11-25'', ''10:30'', ''Consultation'', ''Scheduled'');
(iii) UPDATE Patient SET Contact = ''77112233'' WHERE PatientID = 1001;
(iv) SELECT * FROM MedicalProcedure
WHERE ProcedureType = ''Surgery'' AND ProcedureDate >= CURRENT_DATE - INTERVAL ''30 days'';
(v) SELECT s.StaffID, s.Name FROM Staff s JOIN Department d ON d.DepartmentID = s.DepartmentID
WHERE d.Name = ''Surgery'' AND s.EmploymentStatus = ''On Leave'';
(If Department is a text column in Staff: WHERE Department = ''Surgery'' AND EmploymentStatus = ''On Leave''.)', null, '[{"point": "(i) INSERT INTO Patient ...", "marks": 2}, {"point": "(ii) INSERT INTO Appointment ...", "marks": 2}, {"point": "(iii) UPDATE Patient SET ... WHERE PatientID", "marks": 2}, {"point": "(iv) SELECT ... WHERE Type=''Surgery'' AND date >= current date - 30", "marks": 2}, {"point": "(v) SELECT staff JOIN department WHERE status ''On Leave'' AND department ''Surgery''", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 3, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q3', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q3';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q3';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

4. Database transactions and concurrency
(i) Define a transaction and explain ACID with an HMS example. (4 marks)
(ii) Two doctors update the same record at the same time: explain concurrency control. (2 marks) (6 marks)', '(i) A transaction is a group of database operations treated as one logical unit that either completes fully or not at all. Example: recording a surgery inserts the procedure, updates the patient''s status and adds a bill. Atomicity - all three steps succeed or all are rolled back. Consistency - rules (foreign keys, cost ≥ 0) hold before and after. Isolation - concurrent transactions do not see each other''s partial work (another user doesn''t see the procedure without its bill). Durability - once committed, the data survive power failure (write-ahead log). (ii) If two doctors edit the same patient record, one update could overwrite the other (lost update). Concurrency control prevents this: pessimistic locking (row lock with SELECT ... FOR UPDATE - the second doctor waits) or optimistic control (version number/timestamp checked at save; if changed, the second doctor is told to reload), with suitable isolation levels.', null, '[{"point": "(i) Transaction definition and A, C, I, D each explained with HMS example (e.g. procedure + billing)", "marks": 4}, {"point": "(ii) Locking (pessimistic) or optimistic version checks, isolation levels, to prevent lost updates", "marks": 2}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 4, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q4', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q4';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q4';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

5. Software development life cycle
(i) What is the SDLC? Name three methodologies. (2 marks)
(ii) Differentiate functional and non-functional requirements. Identify two of each for the HMS. (4 marks)
(iii) Explain unit, integration, system and user acceptance testing. (4 marks) (10 marks)', '(i) The SDLC is a structured process for building software: planning, requirements analysis, design, implementation (coding), testing, deployment and maintenance. Methodologies: Waterfall, Agile (Scrum/Kanban), Spiral (also V-model, iterative/incremental, DevOps). (ii) Functional requirements describe what the system must do - e.g. register patients and generate unique IDs; schedule, reschedule and cancel appointments; record procedures and generate bills. Non-functional requirements describe how well it must do it - e.g. availability 99.9% 24/7; response time under 2 seconds; data encrypted and access logged (security, privacy); usability; scalability. (iii) Unit testing - individual functions/modules tested in isolation by developers. Integration testing - checks that modules work together (e.g. appointment module with patient and staff modules, database, interfaces). System testing - the complete system is tested against all requirements, including performance and security. User acceptance testing (UAT) - real users (doctors, nurses, clerks) test the system in realistic scenarios to confirm it meets their needs before go-live.', null, '[{"point": "(i) SDLC definition/phases; three methodologies (Waterfall, Agile/Scrum, Spiral, V-model, iterative)", "marks": 2}, {"point": "(ii) Functional = what system does; non-functional = how well; two HMS examples each", "marks": 4}, {"point": "(iii) Four testing levels explained", "marks": 4}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 10,
    1080, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 5, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q5', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 6.0, 1 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 2.5, 2 from me_q where key = 'C2Q5';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.5, 3 from me_q where key = 'C2Q5';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'passage', 'Case II: Hospital Management System for the National Referral Hospital
The National Referral Hospital (NRH) is the largest healthcare institution in the country, providing comprehensive medical services including emergency care, specialised treatments, surgical procedures and outpatient services. It serves patients from across the nation and operates 24/7 with departments including Emergency, Surgery, Paediatrics, Cardiology, Oncology, Radiology and Laboratory Services.
To improve operational efficiency and patient care, NRH wants to implement a Hospital Management System (HMS). The HMS should capture:
- Patient information: Patient ID, Name, Age, Gender, Contact Number, Emergency Contact, Address (Village, Gewog, Dzongkhag), Blood Group, Medical History, Registration Date, Status (Active/Discharged/Deceased)
- Appointment information: Appointment ID, Date, Time, Type (Consultation/Follow-up/Emergency), Status (Scheduled/Completed/Cancelled), Remarks
- Medical procedure information: Procedure ID, Procedure Type (Surgery/Diagnostic/Therapeutic), Name, Date, Duration, Cost, Equipment Used, Outcome, Complications (if any)
- Staff information: Staff ID, Name, Specialisation, Department, Shift Timings, Contact Details, Qualification, Experience, Employment Status (Active/On Leave/Terminated)
Note: this data is a baseline. You may add attributes or tables if required to model the HMS database accurately.

6. System security and data protection
(i) Explain what RBAC is and how it simplifies access management in the HMS. Give an example showing how different staff roles would have different permissions. (3 marks)
(ii) List and briefly describe three critical security measures that should be implemented in the HMS to safeguard sensitive patient data and ensure secure operation. (3 marks) (6 marks)', '(i) Role-Based Access Control assigns permissions to roles rather than to individual users; each user gets one or more roles. When staff join, move or leave, only their role assignment changes, so management is simpler, consistent and auditable, and least privilege is enforced. Example: Doctor - view and update medical history, order procedures; Nurse - view patient records, record vitals, cannot change diagnoses; Receptionist - register patients and book appointments, no access to medical history; Billing - view procedures and costs only; System administrator - manage accounts but not read clinical data. (ii) 1. Encryption - TLS for data in transit and encryption of the database/backups at rest, so stolen data cannot be read. 2. Strong authentication - unique accounts, multi-factor authentication and automatic session time-outs. 3. Audit logging and monitoring - record who accessed or changed which record, with alerts for unusual access. (Also: regular backups and disaster recovery, patching, firewalls and network segmentation, data privacy policy and staff training.)', null, '[{"point": "(i) RBAC: permissions assigned to roles, users assigned roles; simplifies management; example roles doctor/nurse/receptionist/admin", "marks": 3}, {"point": "(ii) Three measures: encryption at rest/in transit, MFA/strong authentication, audit logs, backups/DR, patching, least privilege, network security", "marks": 3}]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 6,
    648, 'historical_official', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "source": {"title": "BCSE 2025 Main Examination, Technical Paper III, ICT", "year": 2025, "url": "https://rcsc.gov.bt/technical-paper-iii/"}}'::jsonb, 'me-technical-3-ict2025-case2', 6, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'C2Q6', id from nq;
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Content', 'Correct facts, terms, working and reasoning; answers exactly what is asked.', 3.5, 1 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Application', 'Applies the idea to the situation (Bhutan, the case, the data) with examples or steps.', 1.5, 2 from me_q where key = 'C2Q6';
insert into public.rubric_criteria (question_id, label, description, max_marks, position) select id, 'Expression', 'Clear, organised answer; units and labels where needed.', 1.0, 3 from me_q where key = 'C2Q6';
with nq as (
  insert into public.questions (stage, question_type, stem, model_answer, explanation, key_points, subject_id, topic_id, paper_id, difficulty, marks,
                                estimated_seconds, origin, status, parent_question_id, variation_type, ai_review, passage_group, passage_position, verified_by, subject_group_id, specialisation_id, image_url)
  values ('ME', 'mcq', 'What is the primary function of DNS (Domain Name System)?', null, 'DNS resolves names such as www.gov.bt to IP addresses; DHCP assigns addresses and routers route packets.', '[]'::jsonb, (select id from public.subjects where slug = 'subject-specialisation'),
    (select t.id from public.topics t where t.subject_id = (select id from public.subjects where slug = 'subject-specialisation') and t.slug = 'ict'), (select id from public.exam_papers where code = 'me-technical-3'), 'standard', 1,
    60, 'ai_variation', 'awaiting_review',
    null, null,
    '{"verdict": "pass", "issues": [], "checker_notes": "Model answer, marking guide and rubric written by Claude from the RCSC paper; facts were checked against what is widely published, but please read before publishing. Real past-paper questions keep RCSC wording.", "batch": "ME Paper III (Technical, ICT): BCSE 2025, batch 1", "what_changed": "Same kind of question as the RCSC paper (same part, marks and skills), on a new topic."}'::jsonb, null, null, null, null, (select id from public.specialisations where code = 'ict'), null)
  returning id
)
insert into me_q select 'N1', id from nq;
insert into public.question_options (question_id, label, body, is_correct, position) select me_q.id, v.label, v.body, v.ok, v.pos from me_q, (values ('A', 'Translate domain names into IP addresses', true, 1), ('B', 'Route packets between networks', false, 2), ('C', 'Assign IP addresses dynamically', false, 3), ('D', 'Encrypt data sent over the network', false, 4)) as v(label, body, ok, pos) where me_q.key = 'N1';
commit;
