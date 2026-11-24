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
  -- Free accounts: a 25-question test (about 6 per section, founder 17 Nov 2026); Premium: the full paper.
  _total := case when _free then 25 else coalesce(_paper.question_count, 100) end;
  select count(*) into _sections from public.paper_sections where paper_id = _paper.id and subject_id is not null;
  _per := case when _sections > 0 then ceil(_total::numeric / _sections) else _total end;

  -- In each section: about 1 in 10 are questions the student got wrong
  -- before (a second chance), the rest are questions never answered first,
  -- then those answered longest ago. The pool already holds past-paper
  -- questions and verified variations made from them.
  for _s in select subject_id, case when _free then _per else coalesce(question_count, _per) end as n from public.paper_sections
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
  _ids := _ids[1:_total];
  _n := cardinality(_ids);
  if _n < 10 then raise exception 'NO_QUESTIONS' using errcode = 'P0001'; end if;

  insert into public.exams (slug, title, description, stage, kind, duration_minutes, total_marks, is_free, omr_mode, shuffle_questions, status, owner_id)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''),
          case when _free then 'Free mock test · ' else 'Mock test · ' end || to_char(public.bhutan_today(), 'DD Mon YYYY'),
          _n || ' questions, timed like the real ' || _stage::text || '.',
          _stage, 'mock',
          greatest(10, ceil(coalesce(_paper.duration_minutes, 150) * _n::numeric / coalesce(_paper.question_count, 100))::int),
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

