-- Free PE accounts: one full mock test a day (founder, 16–17 Nov 2026), drawn from the whole published PE bank
-- (not only free samples), then a note to join Premium. The daily allowance is shared with practice sets and
-- sample tests. Premium: unlimited new mock tests.

-- Has a free PE account already used today's practice or mock test? (Bhutan date)
create or replace function public.free_pe_used_today(_uid uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.exam_attempts a join public.exams e on e.id = a.exam_id
    where a.user_id = _uid and e.stage = 'PE' and a.status <> 'in_progress'
      and (a.started_at at time zone 'Asia/Thimphu')::date = public.bhutan_today()
      and ((e.owner_id is null and e.kind in ('mock', 'sample', 'historical'))
           or (e.owner_id = _uid and (e.slug like 'practice-%' or e.slug like 'mock-%'))));
$$;
revoke all on function public.free_pe_used_today(uuid) from public, anon, authenticated;

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
  _w int;
  _free boolean;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  _free := _stage = 'PE' and not public.has_stage_access(_stage) and not public.has_permission('exams.manage');
  if _stage <> 'PE' and not public.has_stage_access(_stage) and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  -- Free accounts: one practice or mock test a day (shared with practice sets and sample tests).
  if _free and public.free_pe_used_today(_uid) then
    raise exception 'FREE_DAILY_LIMIT' using errcode = 'P0001';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and kind = 'mock' and created_at > now() - interval '1 day') >= 10 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  select * into _paper from public.exam_papers where stage = _stage and code = lower(_stage::text);
  _total := coalesce(_paper.question_count, 100);
  select count(*) into _sections from public.paper_sections where paper_id = _paper.id and subject_id is not null;
  _per := case when _sections > 0 then ceil(_total::numeric / _sections) else _total end;

  -- In each section: about 1 in 10 are questions the student got wrong
  -- before (a second chance), the rest are questions never answered first,
  -- then those answered longest ago. The pool already holds past-paper
  -- questions and verified variations made from them.
  for _s in select subject_id, coalesce(question_count, _per) as n from public.paper_sections
            where paper_id = _paper.id and subject_id is not null order by sort_order loop
    select coalesce(array_agg(x.id), '{}') into _more from (
      select q.id from public.questions q join public.my_latest_answers() la on la.question_id = q.id
      where q.id in (select pq.id from public.questions pq where pq.status = 'published' and pq.question_type = 'mcq' and pq.stage = _stage and public.entry_fits(pq.stage, pq.paper_id, pq.category_id, pq.specialisation_id, pq.subject_group_id)) and q.subject_id = _s.subject_id and la.is_correct = false
      order by random() limit ceil(_s.n * 0.1)::int) x;
    _ids := _ids || _more;
    _w := cardinality(_more);
    select coalesce(array_agg(x.id), '{}') into _more from (
      select q.id from public.questions q left join public.my_latest_answers() la on la.question_id = q.id
      where q.id in (select pq.id from public.questions pq where pq.status = 'published' and pq.question_type = 'mcq' and pq.stage = _stage and public.entry_fits(pq.stage, pq.paper_id, pq.category_id, pq.specialisation_id, pq.subject_group_id)) and q.subject_id = _s.subject_id and not (q.id = any(_ids))
      order by la.answered_at nulls first, random() limit _s.n - _w) x;
    _ids := _ids || _more;
  end loop;
  -- Fill up from any section if some sections are short.
  if cardinality(_ids) < _total then
    select coalesce(array_agg(x.id), '{}') into _more from (
      select q.id from public.questions q left join public.my_latest_answers() la on la.question_id = q.id
      where q.id in (select pq.id from public.questions pq where pq.status = 'published' and pq.question_type = 'mcq' and pq.stage = _stage and public.entry_fits(pq.stage, pq.paper_id, pq.category_id, pq.specialisation_id, pq.subject_group_id)) and not (q.id = any(_ids))
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

  -- Free accounts: one PE mock/sample test or practice session per day (Bhutan time).
  if not _staff and _exam.stage = 'PE' and _exam.owner_id is null and _exam.kind in ('mock', 'sample', 'historical')
     and not public.has_stage_access('PE')
     and public.free_pe_used_today(_uid) then
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

create or replace function public.create_practice_set(
  _stage public.exam_stage,
  _subject_id uuid default null,
  _topic_id uuid default null,
  _difficulty public.difficulty_level default null,
  _count int default 10,
  _minutes int default null,
  _mode text default 'mixed'
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _n int := least(greatest(coalesce(_count, 10), 5), 50);
  _ids uuid[];
  _exam uuid;
  _title text;
  _label text;
begin
  if _uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  if _mode not in ('mixed', 'new', 'mistakes') then
    raise exception 'INVALID_MODE' using errcode = 'P0001';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;

  -- Free PE accounts: one practice session or mock test a day (Bhutan time),
  -- shared with the free mock test. Premium is unlimited.
  if _stage = 'PE' and not public.has_stage_access('PE') and not public.has_permission('exams.manage')
     and public.free_pe_used_today(_uid) then
    raise exception 'FREE_DAILY_LIMIT' using errcode = 'P0001';
  end if;

  with seen as (select * from public.my_latest_answers())
  select array_agg(c.id) into _ids from (
    select q.id
    from public.questions q
    left join seen on seen.question_id = q.id
    where q.id in (select public.practice_pool(_stage))
      and (_subject_id is null or q.subject_id = _subject_id)
      and (_topic_id is null or q.topic_id = _topic_id)
      and (_difficulty is null or q.difficulty = _difficulty)
      and (_mode <> 'mistakes' or seen.is_correct is false)
      and (_mode <> 'new' or seen.question_id is null)
    order by
      case when seen.question_id is null then 0 when seen.is_correct is false then 1 else 2 end,
      random()
    limit _n
  ) c;

  if _ids is null then
    raise exception 'NO_QUESTIONS' using errcode = 'P0001';
  end if;

  select coalesce((select name from public.topics where id = _topic_id),
                  (select name from public.subjects where id = _subject_id),
                  'Mixed ' || _stage::text || ' practice') into _label;
  _title := case _mode when 'mistakes' then 'Review my mistakes: ' || _label else 'Practice: ' || _label end;

  insert into public.exams (slug, title, description, stage, kind, duration_minutes, is_free, omr_mode, status, owner_id)
  values ('practice-' || replace(gen_random_uuid()::text, '-', ''), _title,
          array_length(_ids, 1) || ' questions chosen for you.', _stage, 'practice',
          least(greatest(coalesce(_minutes, array_length(_ids, 1)), 5), 180),
          true, false, 'draft', _uid)
  returning id into _exam;

  insert into public.exam_questions (exam_id, question_id, position)
  select _exam, x.id, x.n from unnest(_ids) with ordinality as x(id, n);

  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
