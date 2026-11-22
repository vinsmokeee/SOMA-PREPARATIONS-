-- ME written answers: English answers are typed only; Dzongkha answers may be typed or uploaded (founder, 22 Nov 2026).
-- Exceptions that keep the upload option: questions that ask to draw, sketch or show working (calculations, derivations).
-- Translation into Dzongkha counts as Dzongkha; translation into English is typed only. Other stages are unchanged.
create or replace function public.upload_allowed(_stage public.exam_stage, _type public.question_type, _stem text)
returns boolean
language sql
immutable
set search_path = ''
as $$
  select case
    when _stage is distinct from 'ME' then true
    when _type = 'mcq' then false
    -- Dzongkha script in the question: a Dzongkha answer (except translation into English).
    when coalesce(_stem, '') ~ '[ༀ-࿿]' and coalesce(_stem, '') !~* 'into\s+english' then true
    -- Drawing or working out on paper.
    when coalesce(_stem, '') ~* '\m(draw|drawing|sketch|sketches|diagram|diagrams|calculate|calculation|calculations|compute|determine|derive|prove|solve|evaluate|design|find|show\s+that|graph|plot)\M' then true
    else false
  end;
$$;
grant execute on function public.upload_allowed(public.exam_stage, public.question_type, text) to authenticated;

create or replace function public.answer_upload_allowed(_answer_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce((select public.upload_allowed(q.stage, q.question_type, q.stem)
    from public.attempt_answers aa
    join public.exam_questions eq on eq.id = aa.exam_question_id
    join public.questions q on q.id = eq.question_id
    where aa.id = _answer_id), false);
$$;
revoke all on function public.answer_upload_allowed(uuid) from public, anon;
grant execute on function public.answer_upload_allowed(uuid) to authenticated;

-- No new handwritten page for a typed-only question, whichever way it is added.
create or replace function public.guard_answer_page_upload()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if not public.answer_upload_allowed(new.answer_id) then
    raise exception 'UPLOAD_NOT_ALLOWED' using errcode = 'P0001';
  end if;
  return new;
end;
$$;
drop trigger if exists answer_pages_upload_allowed on public.answer_pages;
create trigger answer_pages_upload_allowed before insert on public.answer_pages
  for each row execute function public.guard_answer_page_upload();

create or replace function public.set_answer_mode(_attempt_id uuid, _exam_question_id uuid, _mode text)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _id uuid; _status public.attempt_status;
begin
  if _mode not in ('typed', 'handwritten') then raise exception 'INVALID_MODE' using errcode = 'P0001'; end if;
  _id := public.ensure_written_answer(_attempt_id, _exam_question_id);
  if _mode = 'handwritten' and not public.answer_upload_allowed(_id) then
    raise exception 'UPLOAD_NOT_ALLOWED' using errcode = 'P0001';
  end if;
  select status into _status from public.exam_attempts where id = _attempt_id;
  if _mode = 'typed' and _status <> 'in_progress' then
    raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001';
  end if;
  if not public.answer_accepts_pages(_id) then raise exception 'ANSWER_LOCKED' using errcode = 'P0001'; end if;
  update public.attempt_answers set answer_mode = _mode,
    transcript_status = case when _mode = 'handwritten' then coalesce(transcript_status, 'pending') else null end
  where id = _id;
  return _id;
end;
$$;
revoke all on function public.set_answer_mode(uuid, uuid, text) from public, anon;
grant execute on function public.set_answer_mode(uuid, uuid, text) to authenticated;

-- The exam room learns per question whether the upload option is shown.
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
        'upload_allowed', public.upload_allowed(q.stage, q.question_type, q.stem),
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
revoke all on function public.get_attempt_paper(uuid) from public, anon;
grant execute on function public.get_attempt_paper(uuid) to authenticated;
