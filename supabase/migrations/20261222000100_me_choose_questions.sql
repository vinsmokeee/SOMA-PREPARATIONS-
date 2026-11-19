-- Real RCSC feeling for "answer any N" papers (founder, 20 Nov 2026): a mock opens with reading time and the whole
-- question paper; the student ticks the questions to answer (e.g. 2 of 4 in Part A, 3 of 5 in Part B), then writes
-- only those, one part per screen.

alter table public.exam_papers add column if not exists reading_minutes int check (reading_minutes between 1 and 60);
comment on column public.exam_papers.reading_minutes is 'Reading time before writing, from the RCSC paper; NULL = not stated';
-- RCSC BCSE 2025 General Papers II and III: "Reading Time: 15 minutes (prior to writing time)".
update public.exam_papers set reading_minutes = 15 where code in ('me-general-2', 'me-general-3');

alter table public.exams add column if not exists reading_minutes int check (reading_minutes between 1 and 60);
alter table public.exam_questions
  add column if not exists choice_group text,
  add column if not exists choose_any int check (choose_any > 0),
  add column if not exists section_order int;
comment on column public.exam_questions.choice_group is 'The RCSC question this part belongs to; chosen as a whole';
comment on column public.exam_questions.choose_any is 'This section: answer any N questions';
alter table public.exam_attempts add column if not exists chosen_groups text[];

-- The student's choice of questions in a mock with "answer any N" sections.
create or replace function public.choose_mock_questions(_attempt_id uuid, _groups text[])
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _bad int;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002'; end if;
  if _a.status <> 'in_progress' then raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001'; end if;
  if exists (select 1 from unnest(coalesce(_groups, '{}')) g
             where not exists (select 1 from public.exam_questions eq where eq.exam_id = _a.exam_id and eq.choice_group = g and eq.choose_any is not null)) then
    raise exception 'INVALID_CHOICE' using errcode = 'P0001';
  end if;
  select count(*) into _bad from (
    select eq.section_order, max(eq.choose_any) as need,
           count(distinct eq.choice_group) filter (where eq.choice_group = any (coalesce(_groups, '{}'))) as got
    from public.exam_questions eq where eq.exam_id = _a.exam_id and eq.choose_any is not null
    group by eq.section_order) s
  where s.got <> s.need;
  if _bad > 0 then raise exception 'WRONG_NUMBER_CHOSEN' using errcode = 'P0001'; end if;
  update public.exam_attempts set chosen_groups = (select array_agg(distinct g) from unnest(_groups) g) where id = _attempt_id;
end;
$$;
revoke all on function public.choose_mock_questions(uuid, text[]) from public, anon;
grant execute on function public.choose_mock_questions(uuid, text[]) to authenticated;

create or replace function public.get_attempt_paper(_attempt_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _a public.exam_attempts%rowtype;
  _e public.exams%rowtype;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  perform public.close_if_expired(_attempt_id);
  select * into _a from public.exam_attempts where id = _attempt_id;
  select * into _e from public.exams where id = _a.exam_id;

  if _a.status <> 'in_progress' then
    return jsonb_build_object('attempt', jsonb_build_object('id', _a.id, 'status', _a.status));
  end if;

  return jsonb_build_object(
    'attempt', jsonb_build_object(
      'id', _a.id, 'status', _a.status, 'started_at', _a.started_at,
      'deadline_at', _a.deadline_at, 'server_now', now(), 'chosen_groups', to_jsonb(_a.chosen_groups)),
    'exam', jsonb_build_object(
      'id', _e.id, 'title', _e.title, 'stage', _e.stage, 'kind', _e.kind,
      'instructions', _e.instructions, 'duration_minutes', _e.duration_minutes,
      'omr_mode', _e.omr_mode, 'negative_mark_per_wrong', _e.negative_mark_per_wrong, 'reading_minutes', _e.reading_minutes),
    'questions', coalesce((
      select jsonb_agg(jsonb_build_object(
        'exam_question_id', eq.id,
        'number', qo.n,
        'section', eq.section,
        'marks', coalesce(eq.marks, q.marks),
        'type', q.question_type,
        'stem', q.stem,
        'image_url', q.image_url,
        'passage_group', q.passage_group,
        'choice_group', eq.choice_group,
        'choose_any', eq.choose_any,
        'section_order', eq.section_order,
        'word_limit', q.word_limit,
        'options', case when q.question_type = 'mcq' then public.attempt_options(_a.id, q.id, false) else '[]'::jsonb end
      ) order by qo.n)
      from unnest(_a.question_order) with ordinality as qo(eq_id, n)
      join public.exam_questions eq on eq.id = qo.eq_id
      join public.questions q on q.id = eq.question_id), '[]'::jsonb),
    'answers', coalesce((
      select jsonb_agg(jsonb_build_object(
        'exam_question_id', aa.exam_question_id,
        'selected_option_id', aa.selected_option_id,
        'mark_quality', aa.mark_quality,
        'text_answer', aa.text_answer,
        'flagged', aa.flagged,
        'time_spent_seconds', aa.time_spent_seconds))
      from public.attempt_answers aa where aa.attempt_id = _a.id), '[]'::jsonb)
  );
end;
$$;
-- Mocks record each part's question group, the section's "answer any N" and the reading time.
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
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  select * into _p from public.exam_papers where id = _paper and stage = 'ME';
  if _p.id is null or not public.entry_fits('ME', _p.id, null, null, null) then raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002'; end if;
  if not exists (select 1 from public.paper_blueprint_sections where paper_id = _paper) then
    raise exception 'NO_PATTERN' using errcode = 'P0002';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  insert into public.exams (slug, title, description, stage, kind, paper_id, duration_minutes, total_marks, is_free, status, owner_id, untimed)
  values ('mock-' || replace(gen_random_uuid()::text, '-', ''), 'Paper ' || coalesce(_p.paper_number::text, '') || ' mock: ' || _p.title,
          'A mock paper built for you in the RCSC pattern.', 'ME', 'mock', _p.id,
          coalesce(_p.duration_minutes + coalesce(_p.reading_minutes, 0), 600), _p.max_marks, false, 'draft', _uid, _p.duration_minutes is null)
  returning id into _exam;
  for _s in select * from public.paper_blueprint_sections where paper_id = _paper order by sort_order, created_at loop
    _grps := array(select public.pick_me_groups(_paper, _s.question_type, _s.question_count, _picked));
    if coalesce(array_length(_grps, 1), 0) < _s.question_count then raise exception 'NOT_ENOUGH_QUESTIONS' using errcode = 'P0002'; end if;
    _n := 0;
    for _q in
      select q.id, q.marks, g.ord, g.grp
      from unnest(_grps) with ordinality as g(grp, ord)
      join public.questions q on public.me_group_key(q) = g.grp
      where q.paper_id = _paper and q.status = 'published' and q.stage = 'ME'
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
  update public.exams set total_marks = coalesce(_p.max_marks, nullif(_total, 0)), status = 'published',
    reading_minutes = case when _p.duration_minutes is not null then _p.reading_minutes end where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
