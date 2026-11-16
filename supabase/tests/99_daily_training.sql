begin;
select tests.create_user('dt-stu@test.bt', 'Trainee') as s \gset
select tests.create_user('dt-oth@test.bt', 'Other') as o \gset
select tests.create_user('dt-boss@test.bt') as b \gset
insert into public.user_roles (user_id, role) values (:'b', 'super_admin');

-- 12 free-sample PE questions in two sections
set local role authenticated;
select tests.login(:'b');
do $$
declare i int; qid uuid;
begin
  for i in 1..12 loop
    qid := public.save_question(null,
      jsonb_build_object('stage','PE','question_type','mcq','stem','Training question number ' || i,'explanation','x',
        'subject_id',(select id from public.subjects where slug = case when i <= 6 then 'data-interpretation' else 'english-communication' end),
        'is_free_sample', true),
      '[{"body":"right","is_correct":true},{"body":"wrong","is_correct":false}]'::jsonb);
    perform public.review_question(qid, 'submit');
    perform public.review_question(qid, 'verify');
    perform public.review_question(qid, 'publish');
  end loop;
end $$;

-- Today's plan is created once, with a practice item
select tests.login(:'s');
select public.my_training() as t \gset
select tests.assert((:'t'::jsonb) -> 'plan' ->> 'phase' = 'foundation' and ((:'t'::jsonb) -> 'plan' ->> 'cycle_day')::int = 1, 'day 1 of the cycle, foundation phase');
select tests.assert(((:'t'::jsonb) -> 'items' -> 0 ->> 'kind') = 'practice' and ((:'t'::jsonb) -> 'items' -> 0 ->> 'questions')::int = 12, 'practice item with the available questions');
select tests.assert(public.ensure_today_plan() = ((:'t'::jsonb) -> 'plan' ->> 'id')::uuid, 'same plan all day');
select ((:'t'::jsonb) -> 'items' -> 0 ->> 'id') as item \gset

-- Another student cannot see or start it
select tests.login(:'o');
select tests.assert((select count(*) from public.daily_plan_items) = 0, 'plans are private');
select tests.assert_fails(format($$select public.start_plan_item(%L)$$, :'item'), 'cannot start another student''s item');
select tests.assert_fails($$select public.training_overview()$$, 'students cannot see the admin overview');

-- Take the practice: first answer right, the rest wrong
select tests.login(:'s');
select public.start_plan_item(:'item') as att \gset
select tests.assert((select status from public.daily_plan_items where id = :'item') = 'started', 'item started');
select tests.assert(public.start_plan_item(:'item') = :'att'::uuid, 'starting again resumes the same attempt');
do $$
declare a uuid := (select id from public.exam_attempts where user_id = auth.uid() and status = 'in_progress' limit 1);
        r record; first boolean := true;
begin
  for r in select (q ->> 'exam_question_id')::uuid as eqid, q -> 'options' as opts
           from jsonb_array_elements(public.get_attempt_paper(a) -> 'questions') q loop
    perform public.save_answer(a, r.eqid,
      (select (o ->> 'id')::uuid from jsonb_array_elements(r.opts) o where o ->> 'body' = case when first then 'right' else 'wrong' end), false, null, null, 30);
    first := false;
  end loop;
  perform public.submit_attempt(a);
end $$;
select tests.assert((select status from public.daily_plan_items where id = :'item') = 'done', 'item done when the attempt is submitted');
select tests.assert((select count(*) from public.revision_queue) = 11, 'wrong answers enter the revision queue');
select tests.assert((select bool_and(box = 1 and due_on = public.bhutan_today() + 1) from public.revision_queue), 'due tomorrow in box 1');
select public.my_training() as t2 \gset
select tests.assert(((:'t2'::jsonb) -> 'stats' ->> 'current_streak')::int = 1 and ((:'t2'::jsonb) -> 'stats' ->> 'active_today')::boolean, 'streak started');
select tests.assert((:'t2'::jsonb) -> 'badges' @> '[{"code":"first_day"}]'::jsonb, 'first-day badge');
select tests.assert((:'t2'::jsonb) -> 'badges' @> '[{"code":"plan_complete"}]'::jsonb, 'full plan badge');
select tests.assert(((:'t2'::jsonb) -> 'week' ->> 'answered')::int = 12, 'weekly goal counts answers');

-- Tomorrow: due mistakes come back as a revision item
reset role;
update public.revision_queue set due_on = public.bhutan_today() where user_id = :'s';
delete from public.daily_plans where user_id = :'s';
set local role authenticated;
select tests.login(:'s');
select public.my_training() as t3 \gset
select tests.assert(((:'t3'::jsonb) -> 'items' -> 0 ->> 'kind') = 'revision' and ((:'t3'::jsonb) -> 'items' -> 0 ->> 'questions')::int = 5, 'revision item first, capped at the configured size');

-- A right answer moves a question up a box; a right answer in box 5 masters it
reset role;
select question_id as rq from public.revision_queue where user_id = :'s' limit 1 \gset
update public.revision_queue set box = 5 where user_id = :'s' and question_id = :'rq';

-- Day 7 of the cycle brings the weekly test
update public.training_enrolments set started_on = public.bhutan_today() - 6 where user_id = :'s';
delete from public.daily_plans where user_id = :'s';
set local role authenticated;
select tests.login(:'s');
select public.my_training() as t4 \gset
select tests.assert(((:'t4'::jsonb) -> 'plan' ->> 'cycle_day')::int = 7, 'cycle day follows the enrolment date');
select tests.assert(exists (select 1 from jsonb_array_elements((:'t4'::jsonb) -> 'items') i where i ->> 'kind' = 'weekly_test'), 'weekly test on day 7');
select tests.assert(not exists (select 1 from jsonb_array_elements((:'t4'::jsonb) -> 'items') i where i ->> 'kind' = 'monthly_mock'), 'no mock before the last day');
select (i ->> 'id') as wk from jsonb_array_elements((:'t4'::jsonb) -> 'items') i where i ->> 'kind' = 'weekly_test' \gset
select public.skip_plan_item(:'wk');
select tests.assert((select status from public.daily_plan_items where id = :'wk') = 'skipped', 'items can be skipped');

-- Last day of the cycle: monthly mock; day 15: fortnightly revision test
reset role;
update public.training_enrolments set started_on = public.bhutan_today() - 29 where user_id = :'s';
delete from public.daily_plans where user_id = :'s';
set local role authenticated;
select tests.login(:'s');
select tests.assert(exists (select 1 from jsonb_array_elements(public.my_training() -> 'items') i where i ->> 'kind' = 'monthly_mock'), 'monthly mock on the last day');
reset role;
update public.training_enrolments set started_on = public.bhutan_today() - 14 where user_id = :'s';
delete from public.daily_plans where user_id = :'s';
set local role authenticated;
select tests.login(:'s');
select tests.assert(exists (select 1 from jsonb_array_elements(public.my_training() -> 'items') i where i ->> 'kind' = 'fortnight_test'), 'fortnightly revision test on day 15');

-- Streaks: consecutive days count, one missed day uses a rest day, longer gaps reset
reset role;
delete from public.training_stats where user_id = :'o';
do $$
declare u uuid := (select id from auth.users where email = 'dt-oth@test.bt'); d date := date '2027-01-01'; i int;
begin
  for i in 0..6 loop perform public.register_activity(u, d + i); end loop;
  perform public.register_activity(u, d + 6);   -- same day twice counts once
  if (select current_streak from public.training_stats where user_id = u) <> 7 then raise exception 'ASSERTION FAILED: 7-day streak'; end if;
  if (select rest_tokens from public.training_stats where user_id = u) <> 1 then raise exception 'ASSERTION FAILED: rest day earned'; end if;
  perform public.register_activity(u, d + 8);   -- missed one day
  if (select current_streak from public.training_stats where user_id = u) <> 8 then raise exception 'ASSERTION FAILED: rest day used'; end if;
  perform public.register_activity(u, d + 11);  -- missed two days
  if (select current_streak from public.training_stats where user_id = u) <> 1 then raise exception 'ASSERTION FAILED: streak reset'; end if;
  if (select best_streak from public.training_stats where user_id = u) <> 8 then raise exception 'ASSERTION FAILED: best streak kept'; end if;
  if not exists (select 1 from public.achievements where user_id = u and code = 'streak_7') then raise exception 'ASSERTION FAILED: 7-day badge'; end if;
end $$;
select tests.assert((public.run_training_maintenance()) ? 'reminders', 'maintenance runs');

set local role authenticated;
select tests.login(:'b');
select tests.assert((public.training_overview() ->> 'enrolled')::int >= 1, 'admin overview');
rollback;
