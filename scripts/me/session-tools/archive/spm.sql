create or replace function public.start_paper_mock(_paper uuid)
returns uuid
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid(); _p public.exam_papers%rowtype; _exam uuid; _picked text[] := '{}'; _grps text[];
  _s record; _pos int := 0; _total numeric := 0; _q record; _n int := 0;
  _dur int; _read int; _max numeric;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  select * into _p from public.exam_papers where id = _paper and stage = 'ME';
  if _p.id is null or not public.paper_fits_me(_p.id) then raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002'; end if;
  if not exists (select 1 from public.paper_sections_for_me(_paper)) then
    raise exception 'NO_PATTERN' using errcode = 'P0002';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  select coalesce(g.duration_minutes, _p.duration_minutes), coalesce(g.reading_minutes, _p.reading_minutes), coalesce(g.max_marks, _p.max_marks)
    into _dur, _read, _max
  from (select 1) x left join public.paper_group_settings g on g.paper_id = _paper and g.subject_group_id = public.my_subject_group();
  insert into public.exams (slug, title, description, stage, kind, paper_id, duration_minutes, total_marks, is_free, status, owner_id, untimed)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''), 'Paper ' || coalesce(_p.paper_number::text, '') || ' mock: ' || _p.title,
          'A mock paper built for you in the RCSC pattern.', 'ME', 'mock', _p.id,
          coalesce(_dur + coalesce(_read, 0), 600), _max, false, 'draft', _uid, _dur is null)
  returning id into _exam;
  for _s in select * from public.paper_sections_for_me(_paper) loop
    _grps := array(select public.pick_me_groups(_paper, _s.question_type, _s.question_count, _picked, _s.topic_slug));
    if coalesce(array_length(_grps, 1), 0) < _s.question_count then raise exception 'NOT_ENOUGH_QUESTIONS' using errcode = 'P0002'; end if;
    _n := 0;
    for _q in
      select q.id, q.marks, g.ord, g.grp
      from unnest(_grps) with ordinality as g(grp, ord)
      join public.questions q on public.me_group_key(q) = g.grp
      where q.paper_id = _paper
        and (_s.topic_slug is null or q.topic_id in (select t.id from public.topics t where t.slug = _s.topic_slug)) and q.status = 'published' and q.stage = 'ME'
        and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
      order by g.ord, q.passage_position nulls first, q.created_at
    loop
      _pos := _pos + 1;
      insert into public.exam_questions (exam_id, question_id, position, section, marks, is_optional, choice_group, choose_any, section_order)
      values (_exam, _q.id, _pos,
              _s.title || case when _s.answer_any is not null then ' (answer any ' || _s.answer_any || ' of the ' || _s.question_count || ' questions)' else '' end,
              _q.marks, _s.answer_any is not null, _q.grp, _s.answer_any, _s.sort_order);
    end loop;
    _picked := _picked || _grps;
    _total := _total + coalesce(_s.marks_each, 0) * coalesce(_s.answer_any, _s.question_count);
  end loop;
  update public.exams set total_marks = coalesce(_max, nullif(_total, 0)), status = 'published',
    reading_minutes = case when _dur is not null then _read end where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
