-- =============================================================================
-- Soma Preparations — Master plan Phase 3: Daily personalised training
--
-- Each student gets a plan for today, built automatically the first time they
-- open their dashboard that day (no manual work for the administrator). The
-- plan follows a repeating training cycle (default 30 days: foundation →
-- development → improvement → revision, or exam readiness close to the exam),
-- the student's pathway and entry, their weak subjects/topics, syllabus
-- coverage and a spaced-repetition revision queue of past mistakes. Weekly
-- tests, fortnightly revision tests and a monthly mock are scheduled inside the
-- cycle. Streaks (with rest days), badges, personal bests and a weekly goal
-- keep students coming back. Everything reuses the existing exam engine:
-- questions only come from practice_pool() (published, access- and
-- entry-checked), and every item is taken as an ordinary attempt.
-- =============================================================================

insert into public.app_settings (key, value, is_public) values
  ('training.config', jsonb_build_object(
     'cycle_days', 30,
     'practice_questions', 15,
     'revision_questions', 5,
     'weak_questions', 5,
     'weekly_test_questions', 25,
     'weekly_test_minutes', 30,
     'fortnight_test_questions', 30,
     'fortnight_test_minutes', 35,
     'mock_questions', 50,
     'mock_minutes', 75,
     'readiness_days', 14,
     'weekly_goal_questions', 100
   ), false)
on conflict (key) do nothing;

create or replace function public.training_config()
returns jsonb language sql stable security definer set search_path = '' as $$
  select jsonb_build_object(
    'cycle_days', 30, 'practice_questions', 15, 'revision_questions', 5, 'weak_questions', 5,
    'weekly_test_questions', 25, 'weekly_test_minutes', 30, 'fortnight_test_questions', 30, 'fortnight_test_minutes', 35,
    'mock_questions', 50, 'mock_minutes', 75, 'readiness_days', 14, 'weekly_goal_questions', 100
  ) || public.setting('training.config');
$$;
revoke all on function public.training_config() from public, anon;
grant execute on function public.training_config() to authenticated;

-- -----------------------------------------------------------------------------
-- Tables
-- -----------------------------------------------------------------------------
create table public.training_enrolments (
  user_id     uuid primary key references auth.users (id) on delete cascade,
  started_on  date not null,
  created_at  timestamptz not null default now()
);

create table public.daily_plans (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users (id) on delete cascade,
  plan_date   date not null,
  cycle_no    int not null,
  cycle_day   int not null,
  cycle_days  int not null,
  phase       text not null check (phase in ('foundation', 'development', 'improvement', 'revision', 'readiness')),
  stage       public.exam_stage not null,
  focus       text,                      -- e.g. the subject in focus today
  created_at  timestamptz not null default now(),
  unique (user_id, plan_date)
);

create table public.daily_plan_items (
  id            uuid primary key default gen_random_uuid(),
  plan_id       uuid not null references public.daily_plans (id) on delete cascade,
  position      int not null,
  kind          text not null check (kind in ('practice', 'revision', 'weak_topic', 'ca', 'written',
                                              'weekly_test', 'fortnight_test', 'monthly_mock')),
  title         text not null,
  detail        text,
  minutes       int,
  question_ids  uuid[] not null default '{}',
  linked_exam_id uuid references public.exams (id) on delete set null,  -- an existing published mock
  exam_id       uuid references public.exams (id) on delete set null,   -- the exam taken for this item
  attempt_id    uuid references public.exam_attempts (id) on delete set null,
  status        text not null default 'pending' check (status in ('pending', 'started', 'done', 'skipped')),
  completed_at  timestamptz,
  unique (plan_id, position)
);
create index daily_plan_items_exam_idx on public.daily_plan_items (exam_id) where exam_id is not null;

-- Spaced repetition (Leitner boxes 1–5). Wrong answers enter box 1.
create table public.revision_queue (
  user_id      uuid not null references auth.users (id) on delete cascade,
  question_id  uuid not null references public.questions (id) on delete cascade,
  box          int not null default 1 check (box between 1 and 5),
  due_on       date not null,
  last_result  boolean,
  updated_at   timestamptz not null default now(),
  primary key (user_id, question_id)
);
create index revision_queue_due_idx on public.revision_queue (user_id, due_on);

create table public.training_stats (
  user_id          uuid primary key references auth.users (id) on delete cascade,
  current_streak   int not null default 0,
  best_streak      int not null default 0,
  last_active_date date,
  rest_tokens      int not null default 0 check (rest_tokens between 0 and 2),
  active_days      int not null default 0,
  mastered         int not null default 0,     -- questions cleared from the revision queue
  updated_at       timestamptz not null default now()
);

create table public.achievements (
  user_id    uuid not null references auth.users (id) on delete cascade,
  code       text not null,
  earned_at  timestamptz not null default now(),
  primary key (user_id, code)
);

-- -----------------------------------------------------------------------------
-- Helpers
-- -----------------------------------------------------------------------------
-- The date a student's target examination starts, if recorded.
create or replace function public.my_exam_date(_uid uuid)
returns date language sql stable security definer set search_path = '' as $$
  select case when p.pathway = 'ME' then coalesce(c.me_start_date, c.pe_date) else coalesce(c.pe_date, c.me_start_date) end
  from public.profiles p join public.exam_cycles c on c.name = p.target_cycle
  where p.id = _uid;
$$;
revoke all on function public.my_exam_date(uuid) from public, anon, authenticated;

-- Picks practice questions for the caller from practice_pool (published,
-- access- and entry-checked): unseen first, then recent mistakes, avoiding
-- questions answered in the last 3 days.
create or replace function public.training_pick(_stage public.exam_stage, _subject uuid, _topic uuid, _n int,
                                                _exclude uuid[] default '{}', _easy boolean default false)
returns uuid[]
language sql
stable
security definer
set search_path = ''
as $$
  with seen as (select * from public.my_latest_answers())
  select coalesce(array_agg(x.id), '{}') from (
    select q.id
    from public.questions q
    left join seen on seen.question_id = q.id
    where q.id in (select public.practice_pool(_stage))
      and (_subject is null or q.subject_id = _subject)
      and (_topic is null or q.topic_id = _topic)
      and not (q.id = any(_exclude))
    order by
      case when seen.answered_at > now() - interval '3 days' then 1 else 0 end,
      case when seen.question_id is null then 0 when seen.is_correct is false then 1 else 2 end,
      case when _easy and q.difficulty = 'advanced' then 1 else 0 end,
      random()
    limit greatest(_n, 0)
  ) x;
$$;
revoke all on function public.training_pick(public.exam_stage, uuid, uuid, int, uuid[], boolean) from public, anon, authenticated;

-- The caller's per-subject accuracy and answers in this cycle (objective questions).
create or replace function public.training_subject_stats(_stage public.exam_stage, _since date)
returns table (subject_id uuid, name text, sort_order int, available int, answered_cycle int, answered int, accuracy numeric)
language sql
stable
security definer
set search_path = ''
as $$
  with pool as (select q.id, q.subject_id from public.questions q where q.id in (select public.practice_pool(_stage))),
  ans as (
    select q.subject_id, aa.is_correct, a.submitted_at
    from public.attempt_answers aa
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id
    where a.user_id = auth.uid() and a.status in ('submitted', 'auto_submitted')
      and q.question_type = 'mcq' and q.stage = _stage and aa.selected_option_id is not null
  )
  select s.id, s.name, s.sort_order,
         (select count(*)::int from pool where pool.subject_id = s.id),
         (select count(*)::int from ans where ans.subject_id = s.id and ans.submitted_at >= _since),
         (select count(*)::int from ans where ans.subject_id = s.id),
         (select round(avg(case when ans.is_correct then 1.0 else 0.0 end), 3) from ans where ans.subject_id = s.id)
  from public.subjects s
  where s.stage = _stage and s.is_active
    and exists (select 1 from pool where pool.subject_id = s.id)
  order by s.sort_order;
$$;
revoke all on function public.training_subject_stats(public.exam_stage, date) from public, anon;
grant execute on function public.training_subject_stats(public.exam_stage, date) to authenticated;

-- -----------------------------------------------------------------------------
-- Today's plan (created on first request each day)
-- -----------------------------------------------------------------------------
create or replace function public.ensure_today_plan()
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _today date := public.bhutan_today();
  _cfg jsonb := public.training_config();
  _len int;
  _start date;
  _elapsed int;
  _day int;
  _cycle int;
  _phase text;
  _pathway text;
  _stage public.exam_stage;
  _plan uuid;
  _exam_date date;
  _pos int := 0;
  _used uuid[] := '{}';
  _ids uuid[];
  _focus uuid;
  _focus_name text;
  _weak_topic uuid;
  _weak_name text;
  _n int;
  _mock uuid;
  _q uuid;
  _frac numeric;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select id into _plan from public.daily_plans where user_id = _uid and plan_date = _today;
  if _plan is not null then return _plan; end if;

  _len := greatest(7, least(coalesce((_cfg ->> 'cycle_days')::int, 30), 120));
  insert into public.training_enrolments (user_id, started_on) values (_uid, _today) on conflict (user_id) do nothing;
  select started_on into _start from public.training_enrolments where user_id = _uid;
  _elapsed := greatest(_today - _start, 0);
  _day := (_elapsed % _len) + 1;
  _cycle := (_elapsed / _len) + 1;
  _frac := _day::numeric / _len;

  select coalesce(pathway, 'PE') into _pathway from public.profiles where id = _uid;
  _pathway := coalesce(_pathway, 'PE');
  _stage := case when _pathway = 'ME' then 'ME' else 'PE' end;

  _exam_date := public.my_exam_date(_uid);
  _phase := case
    when _exam_date is not null and _exam_date >= _today and _exam_date - _today <= coalesce((_cfg ->> 'readiness_days')::int, 14) then 'readiness'
    when _frac <= 7.0 / 30 then 'foundation'
    when _frac <= 14.0 / 30 then 'development'
    when _frac <= 21.0 / 30 then 'improvement'
    else 'revision' end;

  -- Focus subject: least covered this cycle (coverage first), or weakest in the improvement phase.
  select s.subject_id, s.name into _focus, _focus_name
  from public.training_subject_stats(_stage, _today - (_day - 1)) s
  order by
    case when _phase = 'improvement' and s.answered >= 5 then s.accuracy end asc nulls last,
    s.answered_cycle asc, s.sort_order
  limit 1;
  if _phase in ('foundation', 'revision', 'readiness') then _focus := null; _focus_name := null; end if;

  begin
    insert into public.daily_plans (user_id, plan_date, cycle_no, cycle_day, cycle_days, phase, stage, focus)
    values (_uid, _today, _cycle, _day, _len, _phase, _stage, _focus_name)
    returning id into _plan;
  exception when unique_violation then
    select id into _plan from public.daily_plans where user_id = _uid and plan_date = _today;
    return _plan;
  end;

  -- 1. Revision of past mistakes that are due (spaced repetition)
  _n := coalesce((_cfg ->> 'revision_questions')::int, 5) * case when _phase in ('revision', 'readiness') then 2 else 1 end;
  select coalesce(array_agg(r.question_id), '{}') into _ids from (
    select rq.question_id from public.revision_queue rq
    where rq.user_id = _uid and rq.due_on <= _today and rq.question_id in (select public.practice_pool(_stage))
    order by rq.due_on, rq.box limit _n) r;
  if cardinality(_ids) > 0 then
    _pos := _pos + 1; _used := _used || _ids;
    insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
    values (_plan, _pos, 'revision', 'Revise past mistakes', cardinality(_ids) || ' questions you got wrong before, due for revision today.',
            cardinality(_ids), _ids);
  end if;

  -- 2. Daily practice
  _n := coalesce((_cfg ->> 'practice_questions')::int, 15);
  _ids := public.training_pick(_stage, _focus, null, _n, _used, _phase = 'foundation');
  if cardinality(_ids) < least(_n, 5) and _focus is not null then
    _ids := _ids || public.training_pick(_stage, null, null, _n - cardinality(_ids), _used || _ids, false);
  end if;
  if cardinality(_ids) > 0 then
    _pos := _pos + 1; _used := _used || _ids;
    insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
    values (_plan, _pos, 'practice',
            case when _focus_name is not null then 'Daily practice: ' || _focus_name else 'Daily practice: mixed' end,
            case _phase
              when 'foundation' then 'Baseline practice across all sections.'
              when 'development' then 'Building this section, which you have practised least this cycle.'
              when 'improvement' then 'Working on your weakest section.'
              else 'Mixed practice to keep everything fresh.' end,
            cardinality(_ids), _ids);
  end if;

  -- 3. Weak topic (improvement phase, or whenever a topic is clearly weak)
  select q.topic_id, t.name into _weak_topic, _weak_name
  from public.my_latest_answers() la
  join public.questions q on q.id = la.question_id
  join public.topics t on t.id = q.topic_id
  where q.stage = _stage and q.question_type = 'mcq'
  group by q.topic_id, t.name
  having count(*) >= 3 and avg(case when la.is_correct then 1.0 else 0.0 end) < 0.6
  order by avg(case when la.is_correct then 1.0 else 0.0 end), count(*) desc
  limit 1;
  if _weak_topic is not null and (_phase = 'improvement' or _day % 3 = 0) then
    _ids := public.training_pick(_stage, null, _weak_topic, coalesce((_cfg ->> 'weak_questions')::int, 5), _used, false);
    if cardinality(_ids) > 0 then
      _pos := _pos + 1; _used := _used || _ids;
      insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
      values (_plan, _pos, 'weak_topic', 'Strengthen: ' || _weak_name, 'Your accuracy in this topic is below 60%.', cardinality(_ids), _ids);
    end if;
  end if;

  -- 4. Current affairs: the Question of the Day
  if exists (select 1 from public.ca_daily cd join public.questions q on q.id = cd.question_id
             where cd.day = _today and q.status = 'published') then
    _pos := _pos + 1;
    insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes)
    values (_plan, _pos, 'ca', 'Current affairs: Question of the Day', 'One question on today''s news. Read the story after you answer.', 2);
  end if;

  -- 5. Written answer (ME pathways): every day for ME-only, every third day otherwise
  if _pathway in ('ME', 'both') and (_pathway = 'ME' or _day % 3 = 0) then
    select w.id into _q from public.written_practice_questions() w
    where w.has_access order by w.attempts, random() limit 1;
    if _q is not null then
      _pos := _pos + 1;
      insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
      values (_plan, _pos, 'written', 'Written answer practice', 'Answer one Main Examination question, typed or handwritten, and get feedback.', 30, array[_q]);
    end if;
  end if;

  -- 6. Scheduled assessments
  if _day = _len then
    select e.id into _mock from public.exams e
    where e.status = 'published' and e.owner_id is null and e.kind = 'mock' and e.stage = _stage
      and (e.is_free or public.has_stage_access(e.stage))
      and public.entry_fits(e.stage, e.paper_id, e.category_id, e.specialisation_id, e.subject_group_id)
    order by random() limit 1;
    if _mock is not null then
      _pos := _pos + 1;
      insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, linked_exam_id)
      select _plan, _pos, 'monthly_mock', 'Monthly mock: ' || e.title, 'A full timed examination to end the cycle.', e.duration_minutes, e.id
      from public.exams e where e.id = _mock;
    else
      _ids := public.training_pick(_stage, null, null, coalesce((_cfg ->> 'mock_questions')::int, 50), '{}', false);
      if cardinality(_ids) >= 10 then
        _pos := _pos + 1;
        insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
        values (_plan, _pos, 'monthly_mock', 'Monthly mock test', cardinality(_ids) || ' mixed questions under timed conditions.',
                coalesce((_cfg ->> 'mock_minutes')::int, 75), _ids);
      end if;
    end if;
  elsif _day > 1 and _day % 14 = 1 then
    -- Fortnightly revision test: questions answered before, mistakes first
    select coalesce(array_agg(x.question_id), '{}') into _ids from (
      select la.question_id from public.my_latest_answers() la
      where la.question_id in (select public.practice_pool(_stage))
      order by la.is_correct nulls first, random()
      limit coalesce((_cfg ->> 'fortnight_test_questions')::int, 30)) x;
    if cardinality(_ids) >= 10 then
      _pos := _pos + 1;
      insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
      values (_plan, _pos, 'fortnight_test', 'Fortnightly revision test', 'Questions from the last two weeks, mistakes first.',
              coalesce((_cfg ->> 'fortnight_test_minutes')::int, 35), _ids);
    end if;
  elsif _day % 7 = 0 then
    _ids := public.training_pick(_stage, null, null, coalesce((_cfg ->> 'weekly_test_questions')::int, 25), '{}', false);
    if cardinality(_ids) >= 5 then
      _pos := _pos + 1;
      insert into public.daily_plan_items (plan_id, position, kind, title, detail, minutes, question_ids)
      values (_plan, _pos, 'weekly_test', 'Weekly test', cardinality(_ids) || ' mixed questions across all sections, timed.',
              coalesce((_cfg ->> 'weekly_test_minutes')::int, 30), _ids);
    end if;
  end if;

  return _plan;
end;
$$;
revoke all on function public.ensure_today_plan() from public, anon;
grant execute on function public.ensure_today_plan() to authenticated;

-- -----------------------------------------------------------------------------
-- Starting, skipping and completing items
-- -----------------------------------------------------------------------------
create or replace function public.start_plan_item(_item uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _i public.daily_plan_items%rowtype;
  _p public.daily_plans%rowtype;
  _exam uuid;
  _attempt uuid;
  _ids uuid[];
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select * into _i from public.daily_plan_items where id = _item;
  select * into _p from public.daily_plans where id = _i.plan_id;
  if _i.id is null or _p.user_id <> _uid then raise exception 'ITEM_NOT_FOUND' using errcode = 'P0002'; end if;

  if _i.kind = 'ca' then
    _attempt := public.start_question_of_day();
  elsif _i.kind = 'written' then
    if _i.exam_id is not null then
      _attempt := public.start_attempt(_i.exam_id);
    else
      _attempt := public.create_written_practice(_i.question_ids[1], null);
    end if;
  elsif _i.linked_exam_id is not null then
    _attempt := public.start_attempt(_i.linked_exam_id);
  elsif _i.exam_id is not null then
    _attempt := public.start_attempt(_i.exam_id);
  else
    -- Only questions that are still available to the student.
    select array_agg(x.id order by x.n) into _ids
    from unnest(_i.question_ids) with ordinality as x(id, n)
    where x.id in (select public.practice_pool(_p.stage));
    if _ids is null then raise exception 'NO_QUESTIONS' using errcode = 'P0001'; end if;
    insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, omr_mode, status, owner_id)
    values ('training-' || replace(gen_random_uuid()::text, '-', ''), _i.title,
            coalesce(_i.detail, '') , _p.stage,
            case when _i.kind = 'revision' then 'revision'::public.exam_kind else 'practice'::public.exam_kind end,
            least(greatest(coalesce(_i.minutes, cardinality(_ids)), 5), 240), true, false, 'draft', _uid)
    returning id into _exam;
    insert into public.exam_questions (exam_id, question_id, position)
    select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);
    update public.exams set status = 'published' where id = _exam;
    _attempt := public.start_attempt(_exam);
  end if;

  select exam_id into _exam from public.exam_attempts where id = _attempt;
  update public.daily_plan_items
  set exam_id = coalesce(exam_id, _exam), attempt_id = _attempt,
      status = case when status = 'done' then 'done' else 'started' end
  where id = _item;
  -- The Question of the Day may already have been answered.
  if exists (select 1 from public.exam_attempts where id = _attempt and status <> 'in_progress') then
    update public.daily_plan_items set status = 'done', completed_at = coalesce(completed_at, now()) where id = _item;
  end if;
  return _attempt;
end;
$$;
revoke all on function public.start_plan_item(uuid) from public, anon;
grant execute on function public.start_plan_item(uuid) to authenticated;

create or replace function public.skip_plan_item(_item uuid)
returns void language plpgsql security definer set search_path = '' as $$
begin
  update public.daily_plan_items i set status = 'skipped'
  from public.daily_plans p
  where i.id = _item and p.id = i.plan_id and p.user_id = auth.uid() and i.status in ('pending', 'started');
  if not found then raise exception 'ITEM_NOT_FOUND' using errcode = 'P0002'; end if;
end;
$$;
revoke all on function public.skip_plan_item(uuid) from public, anon;
grant execute on function public.skip_plan_item(uuid) to authenticated;

-- -----------------------------------------------------------------------------
-- Activity, streaks and badges
-- -----------------------------------------------------------------------------
create or replace function public.award(_uid uuid, _code text, _title text)
returns void language plpgsql security definer set search_path = '' as $$
begin
  insert into public.achievements (user_id, code) values (_uid, _code) on conflict do nothing;
  if found then
    perform public.notify(_uid, 'achievement', 'Badge earned: ' || _title, 'Keep going — see all your badges on your training page.',
                          '/dashboard/training', 'badge-' || _code, false);
  end if;
end;
$$;
revoke all on function public.award(uuid, text, text) from public, anon, authenticated;

-- A day with at least one finished attempt counts. One missed day is forgiven
-- per "rest day" (earned every 7 days of streak, up to 2 saved).
create or replace function public.register_activity(_uid uuid, _day date)
returns void language plpgsql security definer set search_path = '' as $$
declare _s public.training_stats%rowtype;
begin
  insert into public.training_stats (user_id) values (_uid) on conflict do nothing;
  select * into _s from public.training_stats where user_id = _uid for update;
  if _s.last_active_date = _day then return; end if;
  if _s.last_active_date = _day - 1 then
    _s.current_streak := _s.current_streak + 1;
  elsif _s.last_active_date = _day - 2 and _s.rest_tokens > 0 then
    _s.current_streak := _s.current_streak + 1;
    _s.rest_tokens := _s.rest_tokens - 1;
  else
    _s.current_streak := 1;
  end if;
  if _s.current_streak % 7 = 0 then _s.rest_tokens := least(_s.rest_tokens + 1, 2); end if;
  update public.training_stats set
    current_streak = _s.current_streak, best_streak = greatest(best_streak, _s.current_streak),
    last_active_date = _day, rest_tokens = _s.rest_tokens, active_days = active_days + 1, updated_at = now()
  where user_id = _uid;

  perform public.award(_uid, 'first_day', 'First day of training');
  if _s.current_streak >= 3 then perform public.award(_uid, 'streak_3', '3-day streak'); end if;
  if _s.current_streak >= 7 then perform public.award(_uid, 'streak_7', '7-day streak'); end if;
  if _s.current_streak >= 14 then perform public.award(_uid, 'streak_14', '14-day streak'); end if;
  if _s.current_streak >= 30 then perform public.award(_uid, 'streak_30', '30-day streak'); end if;
end;
$$;
revoke all on function public.register_activity(uuid, date) from public, anon, authenticated;

-- Runs when an attempt is submitted: revision queue, plan items, activity, badges.
create or replace function public.on_attempt_finished()
returns trigger language plpgsql security definer set search_path = '' as $$
declare
  _r record;
  _total int;
  _kind text;
  _today date := public.bhutan_today();
begin
  -- Spaced repetition: wrong → box 1 tomorrow; right → next box (1, 3, 7, 14, 30 days); right in box 5 → mastered.
  for _r in
    select eq.question_id, aa.is_correct
    from public.attempt_answers aa
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id
    where aa.attempt_id = new.id and q.question_type = 'mcq' and aa.selected_option_id is not null
  loop
    if _r.is_correct is false then
      insert into public.revision_queue (user_id, question_id, box, due_on, last_result)
      values (new.user_id, _r.question_id, 1, _today + 1, false)
      on conflict (user_id, question_id) do update set box = 1, due_on = _today + 1, last_result = false, updated_at = now();
    elsif _r.is_correct then
      if exists (select 1 from public.revision_queue where user_id = new.user_id and question_id = _r.question_id and box = 5) then
        delete from public.revision_queue where user_id = new.user_id and question_id = _r.question_id;
        insert into public.training_stats (user_id, mastered) values (new.user_id, 1)
        on conflict (user_id) do update set mastered = public.training_stats.mastered + 1;
      else
        update public.revision_queue
        set box = box + 1,
            due_on = _today + (array[3, 7, 14, 30])[box],
            last_result = true, updated_at = now()
        where user_id = new.user_id and question_id = _r.question_id;
      end if;
    end if;
  end loop;

  -- Plan items taken through this exam are done.
  for _kind in
    update public.daily_plan_items i
    set status = 'done', completed_at = now(), attempt_id = new.id
    from public.daily_plans p
    where p.id = i.plan_id and p.user_id = new.user_id and i.status <> 'done'
      and (i.exam_id = new.exam_id or (i.linked_exam_id = new.exam_id and p.plan_date = _today))
    returning i.kind
  loop
    if _kind = 'weekly_test' then perform public.award(new.user_id, 'weekly_test', 'First weekly test'); end if;
    if _kind = 'monthly_mock' then perform public.award(new.user_id, 'monthly_mock', 'First monthly mock'); end if;
    if _kind = 'revision' then perform public.award(new.user_id, 'revision', 'Revised past mistakes'); end if;
  end loop;
  -- The Question of the Day counts for today's current-affairs item.
  if exists (select 1 from public.exams where id = new.exam_id and slug like 'qotd-%') then
    update public.daily_plan_items i set status = 'done', completed_at = now(), attempt_id = new.id, exam_id = new.exam_id
    from public.daily_plans p
    where p.id = i.plan_id and p.user_id = new.user_id and p.plan_date = _today and i.kind = 'ca' and i.status <> 'done';
  end if;

  perform public.register_activity(new.user_id, _today);

  -- A whole plan completed (skipped items count as handled).
  if exists (select 1 from public.daily_plans p where p.user_id = new.user_id and p.plan_date = _today
               and exists (select 1 from public.daily_plan_items i where i.plan_id = p.id)
               and not exists (select 1 from public.daily_plan_items i where i.plan_id = p.id and i.status in ('pending', 'started'))) then
    perform public.award(new.user_id, 'plan_complete', 'Completed a full day''s plan');
  end if;

  select count(*) into _total from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
  where a.user_id = new.user_id and a.status in ('submitted', 'auto_submitted') and aa.selected_option_id is not null;
  if _total >= 100 then perform public.award(new.user_id, 'questions_100', '100 questions answered'); end if;
  if _total >= 500 then perform public.award(new.user_id, 'questions_500', '500 questions answered'); end if;
  if _total >= 1000 then perform public.award(new.user_id, 'questions_1000', '1,000 questions answered'); end if;
  if (select mastered from public.training_stats where user_id = new.user_id) >= 25 then
    perform public.award(new.user_id, 'mastered_25', '25 mistakes mastered');
  end if;
  return new;
end;
$$;
revoke all on function public.on_attempt_finished() from public, anon, authenticated;
create trigger exam_attempts_finished after update of status on public.exam_attempts
  for each row when (old.status = 'in_progress' and new.status in ('submitted', 'auto_submitted'))
  execute function public.on_attempt_finished();

-- -----------------------------------------------------------------------------
-- Everything the training page needs, in one call
-- -----------------------------------------------------------------------------
create or replace function public.my_training()
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _plan uuid;
  _p public.daily_plans%rowtype;
  _today date := public.bhutan_today();
  _cfg jsonb := public.training_config();
  _week_start date := _today - ((extract(isodow from _today)::int) - 1);
  _exam_date date;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  _plan := public.ensure_today_plan();
  select * into _p from public.daily_plans where id = _plan;
  _exam_date := public.my_exam_date(_uid);
  return jsonb_build_object(
    'today', _today,
    'plan', jsonb_build_object('id', _p.id, 'cycle_no', _p.cycle_no, 'cycle_day', _p.cycle_day, 'cycle_days', _p.cycle_days,
                               'phase', _p.phase, 'stage', _p.stage, 'focus', _p.focus),
    'items', coalesce((select jsonb_agg(jsonb_build_object(
        'id', i.id, 'kind', i.kind, 'title', i.title, 'detail', i.detail, 'minutes', i.minutes,
        'questions', cardinality(i.question_ids), 'status', i.status, 'attempt_id', i.attempt_id,
        'score', a.score, 'max_score', a.max_score, 'attempt_open', a.status = 'in_progress') order by i.position)
      from public.daily_plan_items i left join public.exam_attempts a on a.id = i.attempt_id
      where i.plan_id = _p.id), '[]'::jsonb),
    'stats', coalesce((select jsonb_build_object('current_streak',
        case when s.last_active_date >= _today - 1 or (s.last_active_date = _today - 2 and s.rest_tokens > 0) then s.current_streak else 0 end,
        'best_streak', s.best_streak, 'rest_tokens', s.rest_tokens, 'active_days', s.active_days, 'mastered', s.mastered,
        'active_today', s.last_active_date = _today)
      from public.training_stats s where s.user_id = _uid),
      jsonb_build_object('current_streak', 0, 'best_streak', 0, 'rest_tokens', 0, 'active_days', 0, 'mastered', 0, 'active_today', false)),
    'badges', coalesce((select jsonb_agg(jsonb_build_object('code', code, 'earned_at', earned_at) order by earned_at)
                        from public.achievements where user_id = _uid), '[]'::jsonb),
    'revision_due', (select count(*) from public.revision_queue where user_id = _uid and due_on <= _today),
    'revision_total', (select count(*) from public.revision_queue where user_id = _uid),
    'week', jsonb_build_object(
      'goal', coalesce((_cfg ->> 'weekly_goal_questions')::int, 100),
      'answered', (select count(*) from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
                   where a.user_id = _uid and a.status in ('submitted', 'auto_submitted') and aa.selected_option_id is not null
                     and (a.submitted_at at time zone 'Asia/Thimphu')::date >= _week_start),
      'days_active', (select count(distinct p.plan_date) from public.daily_plans p
                      join public.daily_plan_items i on i.plan_id = p.id
                      where p.user_id = _uid and p.plan_date >= _week_start and i.status = 'done')),
    'bests', jsonb_build_object(
      'weekly_test', (select max(round(a.score / nullif(a.max_score, 0) * 100)) from public.daily_plan_items i
                      join public.daily_plans p on p.id = i.plan_id join public.exam_attempts a on a.id = i.attempt_id
                      where p.user_id = _uid and i.kind = 'weekly_test' and i.status = 'done'),
      'monthly_mock', (select max(round(a.score / nullif(a.max_score, 0) * 100)) from public.daily_plan_items i
                       join public.daily_plans p on p.id = i.plan_id join public.exam_attempts a on a.id = i.attempt_id
                       where p.user_id = _uid and i.kind = 'monthly_mock' and i.status = 'done'),
      'most_in_a_day', (select max(n) from (
                         select count(*) as n from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
                         where a.user_id = _uid and a.status in ('submitted', 'auto_submitted') and aa.selected_option_id is not null
                         group by (a.submitted_at at time zone 'Asia/Thimphu')::date) d)),
    'subjects', coalesce((select jsonb_agg(jsonb_build_object('name', s.name, 'answered_cycle', s.answered_cycle,
                                                              'answered', s.answered, 'accuracy', s.accuracy, 'available', s.available))
                          from public.training_subject_stats(_p.stage, _today - (_p.cycle_day - 1)) s), '[]'::jsonb),
    'exam_date', _exam_date
  );
end;
$$;
revoke all on function public.my_training() from public, anon;
grant execute on function public.my_training() to authenticated;

-- -----------------------------------------------------------------------------
-- Scheduler: evening streak reminders and the weekly progress report
-- -----------------------------------------------------------------------------
create or replace function public.run_training_maintenance()
returns jsonb language plpgsql security definer set search_path = '' as $$
declare
  _today date := public.bhutan_today();
  _hour int := extract(hour from (now() at time zone 'Asia/Thimphu'))::int;
  _reminders int := 0;
  _reports int := 0;
  _r record;
begin
  -- 17:00–22:59 Bhutan time: remind students with a streak of 2+ who have not practised today.
  if _hour between 17 and 22 then
    for _r in select user_id, current_streak from public.training_stats
              where last_active_date = _today - 1 and current_streak >= 2 loop
      perform public.notify(_r.user_id, 'training_reminder', 'Keep your ' || _r.current_streak || '-day streak',
        'Your plan for today is ready. A few questions are enough to keep it going.', '/dashboard/training',
        'streak-' || _today, false);
      _reminders := _reminders + 1;
    end loop;
  end if;
  -- Sundays from 18:00: a weekly report for everyone active this week.
  if extract(isodow from _today) = 7 and _hour >= 18 then
    for _r in
      select a.user_id, count(*) as answered,
             round(avg(case when aa.is_correct then 1.0 else 0.0 end) * 100) as accuracy
      from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
      where a.status in ('submitted', 'auto_submitted') and aa.selected_option_id is not null
        and (a.submitted_at at time zone 'Asia/Thimphu')::date > _today - 7
      group by a.user_id
    loop
      perform public.notify(_r.user_id, 'weekly_report', 'Your week: ' || _r.answered || ' questions, ' || _r.accuracy || '% correct',
        'See your progress, streak and next week''s plan.', '/dashboard/training',
        'weekly-' || to_char(_today, 'IYYY-IW'), true);
      _reports := _reports + 1;
    end loop;
  end if;
  return jsonb_build_object('reminders', _reminders, 'weekly_reports', _reports);
end;
$$;
revoke all on function public.run_training_maintenance() from public, anon, authenticated;
grant execute on function public.run_training_maintenance() to service_role;

-- Administrator overview
create or replace function public.training_overview()
returns jsonb language plpgsql stable security definer set search_path = '' as $$
declare _today date := public.bhutan_today();
begin
  if not public.has_permission('reports.view') and not public.has_permission('exam_config.manage') then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'enrolled', (select count(*) from public.training_enrolments),
    'plans_today', (select count(*) from public.daily_plans where plan_date = _today),
    'active_today', (select count(*) from public.training_stats where last_active_date = _today),
    'active_7d', (select count(*) from public.training_stats where last_active_date > _today - 7),
    'items_7d', (select count(*) from public.daily_plan_items i join public.daily_plans p on p.id = i.plan_id where p.plan_date > _today - 7),
    'done_7d', (select count(*) from public.daily_plan_items i join public.daily_plans p on p.id = i.plan_id where p.plan_date > _today - 7 and i.status = 'done'),
    'streak_7plus', (select count(*) from public.training_stats where current_streak >= 7 and last_active_date >= _today - 1),
    'revision_items', (select count(*) from public.revision_queue),
    'empty_plans_7d', (select count(*) from public.daily_plans p where p.plan_date > _today - 7
                         and not exists (select 1 from public.daily_plan_items i where i.plan_id = p.id))
  );
end;
$$;
revoke all on function public.training_overview() from public, anon;
grant execute on function public.training_overview() to authenticated;

-- -----------------------------------------------------------------------------
-- Row Level Security: students read their own rows; all writes go through
-- the functions above.
-- -----------------------------------------------------------------------------
alter table public.training_enrolments enable row level security;
alter table public.daily_plans enable row level security;
alter table public.daily_plan_items enable row level security;
alter table public.revision_queue enable row level security;
alter table public.training_stats enable row level security;
alter table public.achievements enable row level security;

create policy training_enrolments_own on public.training_enrolments for select to authenticated using (user_id = auth.uid() or public.is_staff());
create policy daily_plans_own on public.daily_plans for select to authenticated using (user_id = auth.uid() or public.is_staff());
create policy daily_plan_items_own on public.daily_plan_items for select to authenticated
  using (exists (select 1 from public.daily_plans p where p.id = plan_id and (p.user_id = auth.uid() or public.is_staff())));
create policy revision_queue_own on public.revision_queue for select to authenticated using (user_id = auth.uid() or public.is_staff());
create policy training_stats_own on public.training_stats for select to authenticated using (user_id = auth.uid() or public.is_staff());
create policy achievements_own on public.achievements for select to authenticated using (user_id = auth.uid() or public.is_staff());
