begin;
select tests.create_user('sp-civ@test.bt', 'Civ') as c \gset
select tests.create_user('sp-car@test.bt', 'Car') as k \gset
select tests.create_user('sp-ver@test.bt', 'Ver') as v \gset
select id as civ from public.specialisations where code = 'civil-engineering' \gset
select id as car from public.specialisations where code = 'cardiology' \gset
select id as p from public.exam_papers where code = 'me-technical-3' \gset
select id as subj from public.subjects limit 1 \gset
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'technical'), specialisation_id = :'civ' where id = :'c';
update public.profiles set entry_category_id = (select id from public.exam_categories where code = 'technical'), specialisation_id = :'car' where id = :'k';
insert into public.entitlements (user_id, package_id) select u, (select id from public.packages where slug = 'me-premium') from unnest(array[:'c', :'k']::uuid[]) u;
-- Civil Engineering: 2 MCQs; Cardiology: 3 MCQs (different patterns of the same paper)
insert into public.paper_blueprint_sections (paper_id, specialisation_id, sort_order, title, question_type, question_count, marks_each)
values (:'p', :'civ', 1, 'Part I', 'mcq', 2, 1), (:'p', :'car', 1, 'Part I', 'mcq', 3, 1);
create temp table qs as select gen_random_uuid() as id, g as k from generate_series(1, 6) g;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, specialisation_id, subject_id, status, origin, verified_by, verified_at)
select id, 'ME', 'mcq', 'Specialisation pattern test question ' || k, 1, :'p',
       case when k <= 3 then :'civ'::uuid else :'car'::uuid end, :'subj', 'verified', 'original', :'v', now() from qs;
insert into public.question_options (question_id, label, body, is_correct, position)
select id, l, 'Option ' || l, l = 'A', ascii(l) - 64 from qs, unnest(array['A','B','C','D']) l;
update public.questions set status = 'published' where id in (select id from qs);
set local role authenticated;
select tests.login(:'c');
select tests.assert((select count(*) = 1 from public.paper_sections_for_me(:'p')), 'civil student gets the civil pattern only');
select public.start_paper_mock(:'p') as mc \gset
select tests.login(:'k');
select tests.assert(public.paper_mock_ready(:'p'), 'cardiology student has a mock');
select public.start_paper_mock(:'p') as mk \gset
reset role;
select tests.login(null);
select tests.assert((select count(*) = 2 and bool_and(q.specialisation_id = :'civ') from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id join public.questions q on q.id = eq.question_id where a.id = :'mc'), 'civil mock: 2 civil questions');
select tests.assert((select count(*) = 3 and bool_and(q.specialisation_id = :'car') from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id join public.questions q on q.id = eq.question_id where a.id = :'mk'), 'cardiology mock: 3 cardiology questions');
select tests.assert((select e.duration_minutes = 165 from public.exam_attempts a join public.exams e on e.id = a.exam_id where a.id = :'mk'), 'Paper III timing 150 + 15');
rollback;
