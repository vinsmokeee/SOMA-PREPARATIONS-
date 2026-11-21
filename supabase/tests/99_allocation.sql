begin;
-- Allocation is the backbone of Soma: a student (and staff using the student area) sees only their own entry's
-- questions, everywhere. Example from the founder: Agriculture questions are never shown to Medical or Dzongkha.
select tests.create_user('al-boss@test.bt', 'Boss') as boss \gset
select tests.create_user('al-med@test.bt', 'Med') as med \gset
select tests.create_user('al-agri@test.bt', 'Agri') as agri \gset
select tests.create_user('al-dz@test.bt', 'Dz') as dz \gset
insert into public.user_roles (user_id, role) values (:'boss', 'super_admin');
insert into public.entitlements (user_id, package_id) select u, (select id from public.packages where slug = 'me-premium') from unnest(array[:'boss', :'med', :'agri', :'dz']::uuid[]) u;
select id as tech from public.exam_categories where code = 'technical' \gset
select id as dzc from public.exam_categories where code = 'dzongkha' \gset
select id as s_med from public.specialisations where name = 'MBBS / Medicine' \gset
select id as s_agri from public.specialisations where name = 'Agriculture' \gset
select id as t3 from public.exam_papers where code = 'me-technical-3' \gset
update public.profiles set entry_category_id = :'tech', specialisation_id = :'s_med' where id in (:'boss', :'med');
update public.profiles set entry_category_id = :'tech', specialisation_id = :'s_agri' where id = :'agri';
update public.profiles set entry_category_id = :'dzc' where id = :'dz';

insert into public.questions (stage, question_type, stem, explanation, model_answer, paper_id, specialisation_id, status, verified_by, verified_at, origin, source_year)
values ('ME', 'short_answer', 'AL agriculture written question about crop rotation', 'x', 'x', :'t3', :'s_agri', 'verified', :'boss', now(), 'historical_official', 2024),
       ('ME', 'short_answer', 'AL medicine written question about hypertension', 'x', 'x', :'t3', :'s_med', 'verified', :'boss', now(), 'historical_official', 2024),
       ('ME', 'mcq', 'AL agriculture past-paper MCQ about soil pH', 'x', null, :'t3', :'s_agri', 'verified', :'boss', now(), 'historical_official', 2024),
       ('ME', 'mcq', 'AL medicine past-paper MCQ about insulin', 'x', null, :'t3', :'s_med', 'verified', :'boss', now(), 'historical_official', 2024);
insert into public.question_options (question_id, label, body, is_correct, position)
select q.id, l, b, c, p from public.questions q, (values ('A', 'Right', true, 1), ('B', 'Wrong', false, 2)) o(l, b, c, p) where q.stem like 'AL % MCQ %';
update public.questions set status = 'published' where stem like 'AL %';

set local role authenticated;
-- Staff with a Medical entry see exactly what a Medical student sees
select tests.login(:'boss');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'AL agriculture%'), 'admin with Medical entry: no Agriculture written questions');
select tests.assert(exists (select 1 from public.written_practice_questions() where stem like 'AL medicine%'), 'admin with Medical entry: own Medical questions');
select tests.assert(not (public.my_last_minute_summary('ME')::text like '%AL agriculture%'), 'admin: no Agriculture past-paper questions in the last-minute summary');
select tests.login(:'med');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'AL agriculture%'), 'Medical student: no Agriculture questions');
select tests.assert(public.my_last_minute_summary('ME')::text like '%AL medicine past-paper%' and not (public.my_last_minute_summary('ME')::text like '%AL agriculture%'),
  'Medical student: last-minute summary has Medical past-paper questions only');
select tests.login(:'agri');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'AL medicine%'), 'Agriculture student: no Medical questions');
select tests.assert(exists (select 1 from public.written_practice_questions() where stem like 'AL agriculture%'), 'Agriculture student: own questions');
select tests.login(:'dz');
select tests.assert(not exists (select 1 from public.written_practice_questions() where stem like 'AL %'), 'Dzongkha student: no Technical questions at all');
select tests.assert(not (public.my_last_minute_summary('ME')::text like '%AL %'), 'Dzongkha student: no Technical past-paper questions');
rollback;
