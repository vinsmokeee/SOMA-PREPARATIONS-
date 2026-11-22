-- Allocation fix (founder, 23 Nov 2026: "you've mixed up many papers ... dental surgery should get its own paper").
-- Cause: "Start mock" reopened a mock that was still running for the same paper even when the student had since
-- changed subject, so a student who switched (e.g. Architecture -> Dental Surgery) kept getting the old subject's
-- Paper II/III. The question tags and the question picker were correct.
--  1. exam_fits_me(exam): true when every question in the exam fits the signed-in student's current entry.
--  2. start_paper_mock reopens a running mock only if it fits; otherwise it builds a new one from the current subject.
--     Old attempts are left as they are (answers are never deleted).
--  3. Paused exam page lists only papers that fit the current subject, and a paused mock from another subject no
--     longer blocks starting a new mock.

create or replace function public.exam_fits_me(_exam uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select not exists (
    select 1 from public.exam_questions eq join public.questions q on q.id = eq.question_id
    where eq.exam_id = _exam
      and not public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id));
$$;
revoke all on function public.exam_fits_me(uuid) from public, anon;
grant execute on function public.exam_fits_me(uuid) to authenticated;

create or replace function public.my_paused_exams()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(jsonb_build_object(
      'attempt_id', a.id, 'title', e.title, 'stage', e.stage, 'kind', e.kind,
      'paused', true, 'paused_at', a.paused_at, 'started_at', a.started_at,
      'seconds_left', a.paused_seconds,
      'answered', (select count(*) from public.attempt_answers aa where aa.attempt_id = a.id
                   and (aa.selected_option_id is not null or coalesce(btrim(aa.text_answer), '') <> ''))
    ) order by a.paused_at desc), '[]'::jsonb)
  from public.exam_attempts a
  join public.exams e on e.id = a.exam_id
  where a.user_id = auth.uid() and a.status = 'in_progress' and not e.untimed and a.paused_at is not null
    and public.exam_fits_me(e.id);
$$;
revoke all on function public.my_paused_exams() from public, anon;
grant execute on function public.my_paused_exams() to authenticated;

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
  _dur int; _read int; _max numeric; _open uuid;
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
  -- One running mock per paper (founder, 23 Nov 2026): pressing "Start mock" again reopens the running one instead
  -- of building another - but only if it was built for the student's CURRENT subject. Expired ones are closed.
  for _open in
    select a.id from public.exam_attempts a join public.exams e on e.id = a.exam_id
    where a.user_id = _uid and a.status = 'in_progress' and e.owner_id = _uid and e.kind = 'mock' and e.paper_id = _paper
      and public.exam_fits_me(e.id)  -- never reopen a mock built for another subject (the student changed subject)
    order by a.started_at desc
  loop
    if not public.close_if_expired(_open) then return _open; end if;
  end loop;
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

revoke all on function public.start_paper_mock(uuid) from public, anon;
grant execute on function public.start_paper_mock(uuid) to authenticated;

create or replace function public.block_while_paused()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if tg_table_name = 'attempt_answers' then
    if exists (select 1 from public.exam_attempts a where a.id = new.attempt_id and a.paused_at is not null) then
      raise exception 'ATTEMPT_PAUSED' using errcode = 'P0001';
    end if;
  elsif tg_table_name = 'answer_pages' then
    if exists (select 1 from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
               where aa.id = new.answer_id and a.paused_at is not null) then
      raise exception 'ATTEMPT_PAUSED' using errcode = 'P0001';
    end if;
  elsif tg_table_name = 'exam_attempts' and tg_op = 'UPDATE' then
    if old.paused_at is not null and new.paused_at is not null and new.status <> 'in_progress' then
      raise exception 'ATTEMPT_PAUSED' using errcode = 'P0001';
    end if;
    -- Time spent does not include paused time.
    if old.status = 'in_progress' and new.status <> 'in_progress' and new.paused_total_seconds > 0 and new.time_spent_seconds is not null then
      new.time_spent_seconds := greatest(0, new.time_spent_seconds - new.paused_total_seconds);
    end if;
  elsif tg_table_name = 'exam_attempts' and tg_op = 'INSERT' then
    if exists (select 1 from public.exams e where e.id = new.exam_id and e.kind = 'mock')
       and exists (select 1 from public.exam_attempts a where a.user_id = new.user_id and a.status = 'in_progress' and a.paused_at is not null
                   and public.exam_fits_me(a.exam_id)) then
      raise exception 'PAUSED_EXAM_EXISTS' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
revoke all on function public.block_while_paused() from public, anon, authenticated;

-- 4. The BCSE 2025 "OT Technologist" Paper III is for Operation Theatre technologists (anaesthesia machines, sterile
--    technique, theatre equipment), not Occupational Therapy. Its questions were linked to the closest entry in the
--    list; the entry's name now says what the paper is.
update public.specialisations set name = 'OT Technology (Operation Theatre)'
where code = 'occupational-therapy-technology' and name = 'Occupational Therapy Technology';
