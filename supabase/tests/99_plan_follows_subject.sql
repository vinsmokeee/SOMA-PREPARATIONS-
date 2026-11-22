begin;
-- Founder, 23 Nov 2026: Today's plan is short daily practice from the student's own subject only, renewed each day.
select tests.create_user('pl-stu@test.bt', 'Planner') as s \gset
select tests.create_user('pl-boss@test.bt', 'Boss') as b \gset
select id as tech from public.exam_categories where code = 'technical' \gset
select id as p3 from public.exam_papers where code = 'me-technical-3' \gset
select id as civil from public.specialisations where code = 'civil-engineering' \gset
select id as dental from public.specialisations where code = 'dental-surgery' \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');
insert into public.entitlements (user_id, package_id) values (:'s', (select id from public.packages where slug = 'me-premium'));
create temp table qs as select gen_random_uuid() as id, sp, n from unnest(array[:'civil', :'dental']::uuid[]) sp, generate_series(1, 6) n;
grant select on qs to authenticated;
insert into public.questions (id, stage, question_type, stem, marks, paper_id, specialisation_id, status, origin, verified_by, verified_at)
select id, 'ME', 'mcq', 'Plan test question ' || sp || ' ' || n, 1, :'p3', sp, 'verified', 'original', :'b', now() from qs;
insert into public.question_options (question_id, label, body, is_correct, position)
select id, l, 'Option ' || l, l = 'A', p from qs, (values ('A', 1), ('B', 2)) v(l, p);
update public.questions set status = 'published' where id in (select id from qs);
update public.profiles set pathway = 'ME', entry_category_id = :'tech', specialisation_id = :'civil', entry_confirmed_at = now() where id = :'s';

set local role authenticated;
select tests.login(:'s');
select public.ensure_today_plan() as plan1 \gset
reset role;
select tests.assert((select bool_and(q.specialisation_id = :'civil'::uuid) from public.daily_plan_items i, unnest(i.question_ids) x(id)
  join public.questions q on q.id = x.id where i.plan_id = :'plan1'), 'a Civil student''s plan has only Civil questions');
select tests.assert((select title = 'Quick practice: Civil Engineering' from public.daily_plan_items where plan_id = :'plan1' and kind = 'practice'), 'the practice is named after the subject');
set local role authenticated;
select tests.login(:'s');
select tests.assert(public.ensure_today_plan() = :'plan1'::uuid, 'the same plan all day while nothing changes');
-- Staff correct the subject the same day: the untouched plan is made again for the new subject.
select tests.login(:'b');
update public.profiles set specialisation_id = :'dental' where id = :'s';
select tests.login(:'s');
select public.ensure_today_plan() as plan2 \gset
reset role;
select tests.assert(:'plan2'::uuid <> :'plan1'::uuid, 'a new plan after the subject changed');
select tests.assert((select bool_and(q.specialisation_id = :'dental'::uuid) from public.daily_plan_items i, unnest(i.question_ids) x(id)
  join public.questions q on q.id = x.id where i.plan_id = :'plan2'), 'the new plan has only Dental questions');
-- A plan the student already started is kept.
update public.daily_plan_items set status = 'started' where plan_id = :'plan2' and kind = 'practice';
set local role authenticated;
select tests.login(:'b');
update public.profiles set specialisation_id = :'civil' where id = :'s';
select tests.login(:'s');
select tests.assert(public.ensure_today_plan() = :'plan2'::uuid, 'a started plan is not thrown away');
rollback;
