begin;
select tests.create_user('gp-eng@test.bt', 'Eng') as e \gset
select tests.create_user('gp-nur@test.bt', 'Nur') as n \gset
select tests.create_user('gp-ver@test.bt', 'Ver') as v \gset
select id as eng from public.subject_groups where code = 'engineering' \gset
select id as nur from public.subject_groups where code = 'nursing' \gset
select id as p from public.exam_papers where code = 'me-technical-2' \gset
select id as subj from public.subjects where slug = 'general-subject-knowledge' \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'technical'), subject_group_id = :'eng' where id = :'e';
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'technical'), subject_group_id = :'nur' where id = :'n';
insert into public.entitlements (user_id, package_id) select u, (select id from public.packages where slug = 'me-premium') from unnest(array[:'e', :'n']::uuid[]) u;
insert into public.topics (subject_id, slug, name) values (:'subj', 'gp-health', 'GP health'), (:'subj', 'gp-data', 'GP data');
-- Engineering: 3 MCQs in 60 minutes; Nursing: 1 health MCQ + 1 data MCQ in 150 minutes
insert into public.paper_blueprint_sections (paper_id, subject_group_id, sort_order, title, question_type, question_count, marks_each)
values (:'p', :'eng', 1, 'Part I', 'mcq', 3, 1),
       (:'p', :'nur', 1, 'Section A', 'mcq', 1, 1), (:'p', :'nur', 2, 'Section C', 'mcq', 1, 1);
update public.paper_blueprint_sections set topic_slug = 'gp-health' where paper_id = :'p' and subject_group_id = :'nur' and sort_order = 1;
update public.paper_blueprint_sections set topic_slug = 'gp-data' where paper_id = :'p' and subject_group_id = :'nur' and sort_order = 2;
insert into public.paper_group_settings (paper_id, subject_group_id, duration_minutes, reading_minutes, max_marks)
values (:'p', :'eng', 60, 15, 3), (:'p', :'nur', 150, 15, 2);
create temp table qs as select gen_random_uuid() as id, g as k from generate_series(1, 7) g;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, subject_group_id, topic_id, status, origin, verified_by, verified_at)
select id, 'ME', 'mcq', 'Group pattern test question ' || k, 1, :'p',
       case when k <= 3 then :'eng'::uuid else :'nur'::uuid end,
       case when k in (4, 5) then (select id from public.topics where slug = 'gp-health') when k in (6, 7) then (select id from public.topics where slug = 'gp-data') end,
       'verified', 'original', :'v', now() from qs;
insert into public.question_options (question_id, label, body, is_correct, position)
select id, l, 'Option ' || l, l = 'A', ascii(l) - 64 from qs, unnest(array['A','B','C','D']) l;
update public.questions set status = 'published' where id in (select id from qs);
set local role authenticated;
select tests.login(:'e');
select tests.assert(public.paper_mock_ready(:'p'), 'engineering student has a mock');
select public.start_paper_mock(:'p') as me \gset
select tests.login(:'n');
select tests.assert(public.paper_mock_ready(:'p'), 'nursing student has a mock');
select public.start_paper_mock(:'p') as mn \gset
select tests.assert((select count(*) = 2 from jsonb_array_elements(public.my_me_progress()) x, jsonb_array_elements(x -> 'pattern') s where x ->> 'id' = :'p'), 'progress shows the nursing pattern');
reset role;
select tests.login(null);
select tests.assert((select count(*) = 3 and bool_and(q.subject_group_id = :'eng') from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id join public.questions q on q.id = eq.question_id where a.id = :'me'), 'engineering mock: 3 engineering questions');
select tests.assert((select e.duration_minutes = 75 and e.total_marks = 3 from public.exam_attempts a join public.exams e on e.id = a.exam_id where a.id = :'me'), 'engineering timing and marks');
select tests.assert((select count(*) = 2 and count(distinct q.topic_id) = 2 from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id join public.questions q on q.id = eq.question_id where a.id = :'mn'), 'nursing mock: one question from each topic section');
select tests.assert((select e.duration_minutes = 165 from public.exam_attempts a join public.exams e on e.id = a.exam_id where a.id = :'mn'), 'nursing timing (150 + 15)');
rollback;
