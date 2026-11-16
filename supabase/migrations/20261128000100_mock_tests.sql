-- =============================================================================
-- Soma Preparations — Mock tests: free daily limit and fresh tests for Premium
--
-- Free accounts can take one PE mock (or sample) test per day; another attempt
-- the same day asks them to join Premium. Premium students can create a fresh
-- full-length PE mock test whenever they like: questions they have not seen
-- come first, split across the PE sections, timed like the real paper.
-- =============================================================================

create or replace function public.start_attempt(_exam_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _exam public.exams%rowtype;
  _staff boolean;
  _open uuid;
  _order uuid[];
  _id uuid;
begin
  if _uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  select * into _exam from public.exams where id = _exam_id;
  _staff := public.has_permission('exams.manage');
  if _exam.id is null or (_exam.status <> 'published' and not _staff)
     or (_exam.owner_id is not null and _exam.owner_id <> _uid) then
    raise exception 'EXAM_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not _exam.is_free and not _staff and not public.has_stage_access(_exam.stage) then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;

  select id into _open from public.exam_attempts
  where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  if _open is not null then
    if not public.close_if_expired(_open) then
      return _open;
    end if;
  end if;

  -- Free accounts: one shared PE mock/sample test per day (Bhutan time).
  if not _staff and _exam.stage = 'PE' and _exam.owner_id is null and _exam.kind in ('mock', 'sample', 'historical')
     and not public.has_stage_access('PE')
     and exists (
       select 1 from public.exam_attempts a join public.exams e on e.id = a.exam_id
       where a.user_id = _uid and e.owner_id is null and e.stage = 'PE' and e.kind in ('mock', 'sample', 'historical')
         and a.status <> 'in_progress' and (a.started_at at time zone 'Asia/Thimphu')::date = public.bhutan_today()) then
    raise exception 'FREE_DAILY_LIMIT' using errcode = 'P0001';
  end if;

  select array_agg(x.id order by x.k1, x.k2) into _order
  from (
    select eq.id,
           case when _exam.shuffle_questions then random() else 0 end as k1,
           eq.position as k2
    from public.exam_questions eq
    join public.questions q on q.id = eq.question_id
    where eq.exam_id = _exam_id and (q.status = 'published' or _staff)
  ) x;
  if _order is null then
    raise exception 'EXAM_EMPTY' using errcode = 'P0001';
  end if;

  begin
    insert into public.exam_attempts (exam_id, user_id, deadline_at, question_order)
    values (_exam_id, _uid, now() + make_interval(mins => _exam.duration_minutes), _order)
    returning id into _id;
  exception when unique_violation then
    select id into _id from public.exam_attempts
    where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  end;
  return _id;
end;
$$;

create or replace function public.create_mock_test(_stage public.exam_stage default 'PE')
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _paper public.exam_papers%rowtype;
  _total int;
  _sections int;
  _per int;
  _ids uuid[] := '{}';
  _more uuid[];
  _s record;
  _exam uuid;
  _n int;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access(_stage) and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and kind = 'mock' and created_at > now() - interval '1 day') >= 10 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  select * into _paper from public.exam_papers where stage = _stage and code = lower(_stage::text);
  _total := coalesce(_paper.question_count, 100);
  select count(*) into _sections from public.paper_sections where paper_id = _paper.id and subject_id is not null;
  _per := case when _sections > 0 then ceil(_total::numeric / _sections) else _total end;

  -- Questions never answered first, then those answered longest ago.
  for _s in select subject_id, coalesce(question_count, _per) as n from public.paper_sections
            where paper_id = _paper.id and subject_id is not null order by sort_order loop
    select coalesce(array_agg(x.id), '{}') into _more from (
      select q.id from public.questions q left join public.my_latest_answers() la on la.question_id = q.id
      where q.id in (select public.practice_pool(_stage)) and q.subject_id = _s.subject_id
      order by la.answered_at nulls first, random() limit _s.n) x;
    _ids := _ids || _more;
  end loop;
  -- Fill up from any section if some sections are short.
  if cardinality(_ids) < _total then
    select coalesce(array_agg(x.id), '{}') into _more from (
      select q.id from public.questions q left join public.my_latest_answers() la on la.question_id = q.id
      where q.id in (select public.practice_pool(_stage)) and not (q.id = any(_ids))
      order by la.answered_at nulls first, random() limit _total - cardinality(_ids)) x;
    _ids := _ids || _more;
  end if;
  _n := cardinality(_ids);
  if _n < 10 then raise exception 'NO_QUESTIONS' using errcode = 'P0001'; end if;

  insert into public.exams (slug, title, description, stage, kind, duration_minutes, total_marks, is_free, omr_mode, shuffle_questions, status, owner_id)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''),
          'Mock test · ' || to_char(public.bhutan_today(), 'DD Mon YYYY'),
          _n || ' questions, timed like the real ' || _stage::text || '.',
          _stage, 'mock',
          greatest(10, ceil(coalesce(_paper.duration_minutes, 150) * _n::numeric / _total)::int),
          null, true, true, false, 'draft', _uid)
  returning id into _exam;
  insert into public.exam_questions (exam_id, question_id, position)
  select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);
  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.create_mock_test(public.exam_stage) from public, anon;
grant execute on function public.create_mock_test(public.exam_stage) to authenticated;
