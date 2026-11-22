-- Today's plan: short daily practice that renews every day and follows the student's own subject (founder, 23 Nov 2026).
-- The plan records which exam/subject it was made for; if the subject changes the same day (before anything was
-- started), the plan is made again. ME items are named after the student's subject.
alter table public.daily_plans add column if not exists entry_key text;

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
  _key text;
  _label text;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  -- The plan follows the student's current exam and subject: if either changed since today's plan was made and
  -- nothing in it was started yet, it is made again (founder, 23 Nov 2026: subject-wise questions only).
  select coalesce(pr.pathway, 'PE') || '|' || coalesce(pr.entry_category_id::text, '') || '|' || coalesce(pr.specialisation_id::text, '')
         || '|' || coalesce(coalesce(pr.subject_group_id, sp.subject_group_id)::text, ''),
         coalesce(sp.name, c.name)
    into _key, _label
  from public.profiles pr
  left join public.specialisations sp on sp.id = pr.specialisation_id
  left join public.exam_categories c on c.id = pr.entry_category_id
  where pr.id = _uid;
  select id into _plan from public.daily_plans where user_id = _uid and plan_date = _today;
  if _plan is not null then
    if (select entry_key from public.daily_plans where id = _plan) is not distinct from _key
       or exists (select 1 from public.daily_plan_items where plan_id = _plan and (attempt_id is not null or status <> 'pending')) then
      return _plan;
    end if;
    delete from public.daily_plans where id = _plan;  -- its items go with it; nothing was started
    _plan := null;
  end if;

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
    insert into public.daily_plans (user_id, plan_date, cycle_no, cycle_day, cycle_days, phase, stage, focus, entry_key)
    values (_uid, _today, _cycle, _day, _len, _phase, _stage, _focus_name, _key)
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
            case when _stage = 'ME' and _label is not null then 'Quick practice: ' || _label
                 when _focus_name is not null then 'Daily practice: ' || _focus_name else 'Daily practice: mixed' end,
            case when _stage = 'ME' then 'Short questions from your own papers'
                   || case when _focus_name is not null then ', mostly ' || _focus_name else '' end || '.'
              else case _phase
              when 'foundation' then 'Baseline practice across all sections.'
              when 'development' then 'Building this section, which you have practised least this cycle.'
              when 'improvement' then 'Working on your weakest section.'
              else 'Mixed practice to keep everything fresh.' end end,
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

  -- 4. Current affairs: the Question of the Day (PE only; founder, 20 Nov 2026: ME students are busy with written papers)
  if _stage = 'PE' and exists (select 1 from public.ca_daily cd join public.questions q on q.id = cd.question_id
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
      values (_plan, _pos, 'weekly_test', case when _stage = 'ME' and _label is not null then 'Weekly test: ' || _label else 'Weekly test' end,
              cardinality(_ids) || case when _stage = 'ME' then ' questions from your own papers, timed.' else ' mixed questions across all sections, timed.' end,
              coalesce((_cfg ->> 'weekly_test_minutes')::int, 30), _ids);
    end if;
  end if;

  return _plan;
end;
$$;
revoke all on function public.ensure_today_plan() from public, anon;
grant execute on function public.ensure_today_plan() to authenticated;
