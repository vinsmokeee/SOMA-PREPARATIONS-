-- OMR shading (founder, 19 Nov 2026). In the real PE the answer is a pencil-shaded circle read by a scanner: shading
-- that is too light or goes outside the circle is not read. Mock tests (exams.omr_mode) now ask students to shade the
-- circle with a finger; the app judges the shading and saves it here. Badly shaded answers score zero and count as
-- not answered, and the results explain why.

alter table public.attempt_answers add column if not exists mark_quality text
  check (mark_quality is null or mark_quality in ('good', 'too_light', 'outside'));
comment on column public.attempt_answers.mark_quality is 'OMR mode: how the answer circle was shaded (null = tapped, not shaded).';

drop function if exists public.save_answer(uuid, uuid, uuid, boolean, text, boolean, integer);

create or replace function public.finalize_attempt(_attempt_id uuid, _auto boolean)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  _a public.exam_attempts%rowtype;
  _neg numeric;
begin
  select * into _a from public.exam_attempts where id = _attempt_id for update;
  if not found or _a.status <> 'in_progress' then
    return; -- already closed: idempotent
  end if;
  select negative_mark_per_wrong into _neg from public.exams where id = _a.exam_id;

  -- Automatic marking of objective questions against the answer key.
  update public.attempt_answers aa
  set is_correct = o.is_correct,
      marks_awarded = case
        when o.id is null then 0
        when o.is_correct then coalesce(eq.marks, q.marks)
        else -coalesce(_neg, 0)
      end
  from public.exam_questions eq
  join public.questions q on q.id = eq.question_id
  left join public.question_options o on o.question_id = q.id
  where aa.attempt_id = _attempt_id
    and eq.id = aa.exam_question_id
    and q.question_type = 'mcq'
    and (o.id = aa.selected_option_id or (aa.selected_option_id is null and o.id is null));

  -- Shaded badly on the OMR sheet (too little, or outside the circle): the scanner would not read it, so it scores
  -- zero and counts as not answered, even if the chosen option was right.
  update public.attempt_answers aa
  set is_correct = null, marks_awarded = 0
  where aa.attempt_id = _attempt_id and aa.mark_quality in ('too_light', 'outside');

  -- Unanswered objective questions (no selection) score zero.
  update public.attempt_answers aa
  set is_correct = null, marks_awarded = 0
  from public.exam_questions eq
  join public.questions q on q.id = eq.question_id
  where aa.attempt_id = _attempt_id and eq.id = aa.exam_question_id
    and q.question_type = 'mcq' and aa.selected_option_id is null;

  update public.exam_attempts a
  set status = case when _auto then 'auto_submitted'::public.attempt_status else 'submitted'::public.attempt_status end,
      submitted_at = now(),
      time_spent_seconds = greatest(0, floor(extract(epoch from (least(now(), a.deadline_at) - a.started_at))))::int,
      score = coalesce((
        select sum(aa.marks_awarded) from public.attempt_answers aa
        join public.exam_questions eq on eq.id = aa.exam_question_id
        join public.questions q on q.id = eq.question_id
        where aa.attempt_id = a.id and q.question_type = 'mcq'), 0),
      max_score = (
        select coalesce(sum(coalesce(eq.marks, q.marks)), 0) from public.exam_questions eq
        join public.questions q on q.id = eq.question_id
        where eq.id = any(a.question_order)),
      correct_count = (
        select count(*) from public.attempt_answers aa
        where aa.attempt_id = a.id and aa.is_correct is true),
      incorrect_count = (
        select count(*) from public.attempt_answers aa
        where aa.attempt_id = a.id and aa.is_correct is false),
      unanswered_count = (
        select count(*) from unnest(a.question_order) as qo(eq_id)
        where not exists (
          select 1 from public.attempt_answers aa
          where aa.attempt_id = a.id and aa.exam_question_id = qo.eq_id
            and ((aa.selected_option_id is not null and coalesce(aa.mark_quality, 'good') = 'good')
                 or coalesce(btrim(aa.text_answer), '') <> '')))
  where a.id = _attempt_id;
end;
$$;

create or replace function public.save_answer(
  _attempt_id uuid,
  _exam_question_id uuid,
  _selected_option_id uuid default null,
  _clear_selection boolean default false,
  _text_answer text default null,
  _flagged boolean default null,
  _time_spent_delta integer default 0,
  _mark_quality text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _a public.exam_attempts%rowtype;
  _qid uuid;
  _type public.question_type;
  _words int;
begin
  select * into _a from public.exam_attempts where id = _attempt_id for share;
  if not found or _a.user_id is distinct from auth.uid() then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  if _a.status <> 'in_progress' then
    raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001';
  end if;
  if now() > _a.deadline_at + public.attempt_save_grace() then
    raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001';
  end if;
  if not (_exam_question_id = any(_a.question_order)) then
    raise exception 'QUESTION_NOT_IN_ATTEMPT' using errcode = 'P0001';
  end if;

  select eq.question_id, q.question_type into _qid, _type
  from public.exam_questions eq join public.questions q on q.id = eq.question_id
  where eq.id = _exam_question_id;

  if _selected_option_id is not null then
    if _type <> 'mcq' or not exists (
      select 1 from public.question_options where id = _selected_option_id and question_id = _qid) then
      raise exception 'INVALID_OPTION' using errcode = 'P0001';
    end if;
  end if;
  if _mark_quality is not null and _mark_quality not in ('good', 'too_light', 'outside') then
    raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001';
  end if;
  if _text_answer is not null then
    if _type = 'mcq' then
      raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001';
    end if;
    if char_length(_text_answer) > 60000 then
      raise exception 'ANSWER_TOO_LONG' using errcode = 'P0001';
    end if;
    _words := coalesce(array_length(regexp_split_to_array(btrim(_text_answer), '\s+'), 1), 0);
    if btrim(_text_answer) = '' then _words := 0; end if;
  end if;

  insert into public.attempt_answers as aa
    (attempt_id, exam_question_id, selected_option_id, mark_quality, text_answer, word_count, flagged, time_spent_seconds, saved_at)
  values (
    _attempt_id, _exam_question_id,
    case when _clear_selection then null else _selected_option_id end,
    case when _clear_selection or _selected_option_id is null then null else _mark_quality end,
    _text_answer, _words, coalesce(_flagged, false),
    greatest(0, least(coalesce(_time_spent_delta, 0), 600)), now())
  on conflict (attempt_id, exam_question_id) do update set
    selected_option_id = case
      when _clear_selection then null
      when _selected_option_id is not null then _selected_option_id
      else aa.selected_option_id end,
    mark_quality = case
      when _clear_selection then null
      when _selected_option_id is not null then _mark_quality
      else aa.mark_quality end,
    text_answer = coalesce(_text_answer, aa.text_answer),
    word_count = case when _text_answer is not null then _words else aa.word_count end,
    flagged = coalesce(_flagged, aa.flagged),
    time_spent_seconds = aa.time_spent_seconds + greatest(0, least(coalesce(_time_spent_delta, 0), 600)),
    saved_at = now();

  update public.exam_attempts set last_seen_at = now() where id = _attempt_id;
  return jsonb_build_object('saved_at', now(), 'deadline_at', _a.deadline_at);
end;
$$;

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
      'deadline_at', _a.deadline_at, 'server_now', now()),
    'exam', jsonb_build_object(
      'id', _e.id, 'title', _e.title, 'stage', _e.stage, 'kind', _e.kind,
      'instructions', _e.instructions, 'duration_minutes', _e.duration_minutes,
      'omr_mode', _e.omr_mode, 'negative_mark_per_wrong', _e.negative_mark_per_wrong),
    'questions', coalesce((
      select jsonb_agg(jsonb_build_object(
        'exam_question_id', eq.id,
        'number', qo.n,
        'section', eq.section,
        'marks', coalesce(eq.marks, q.marks),
        'type', q.question_type,
        'stem', q.stem,
        'image_url', q.image_url,
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

create or replace function public.get_attempt_result(_attempt_id uuid)
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
  if not found or (_a.user_id is distinct from auth.uid()
                   and not public.has_permission('reports.view')
                   and not public.has_permission('evaluations.assign')) then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  perform public.close_if_expired(_attempt_id);
  select * into _a from public.exam_attempts where id = _attempt_id;
  if _a.status = 'in_progress' then
    raise exception 'ATTEMPT_IN_PROGRESS' using errcode = 'P0001';
  end if;
  select * into _e from public.exams where id = _a.exam_id;

  return jsonb_build_object(
    'attempt', jsonb_build_object(
      'id', _a.id, 'status', _a.status, 'started_at', _a.started_at, 'submitted_at', _a.submitted_at,
      'deadline_at', _a.deadline_at, 'time_spent_seconds', _a.time_spent_seconds,
      'score', _a.score, 'max_score', _a.max_score, 'correct_count', _a.correct_count,
      'incorrect_count', _a.incorrect_count, 'unanswered_count', _a.unanswered_count),
    'exam', jsonb_build_object(
      'id', _e.id, 'slug', _e.slug, 'title', _e.title, 'stage', _e.stage, 'kind', _e.kind,
      'duration_minutes', _e.duration_minutes, 'negative_mark_per_wrong', _e.negative_mark_per_wrong),
    'questions', coalesce((
      select jsonb_agg(jsonb_build_object(
        'exam_question_id', eq.id,
        'number', qo.n,
        'section', eq.section,
        'marks', coalesce(eq.marks, q.marks),
        'type', q.question_type,
        'stem', q.stem,
        'image_url', q.image_url,
        'word_limit', q.word_limit,
        'explanation', q.explanation,
        'model_answer', q.model_answer,
        'subject', s.name,
        'topic', t.name,
        'difficulty', q.difficulty,
        'origin', q.origin,
        'source_year', coalesce(q.source_year, hp.exam_year),
        'options', public.attempt_options(_a.id, q.id, true),
        'rubric', coalesce((
          select jsonb_agg(jsonb_build_object('label', r.label, 'description', r.description, 'max_marks', r.max_marks)
                           order by r.position)
          from public.rubric_criteria r where r.question_id = q.id), '[]'::jsonb),
        'references', coalesce((
          select jsonb_agg(jsonb_build_object('citation', qr.citation, 'url', qr.url))
          from public.question_references qr where qr.question_id = q.id), '[]'::jsonb),
        'answer', (
          select jsonb_build_object(
            'id', aa.id,
            'selected_option_id', aa.selected_option_id, 'mark_quality', aa.mark_quality, 'text_answer', aa.text_answer,
            'word_count', aa.word_count, 'flagged', aa.flagged, 'is_correct', aa.is_correct,
            'marks_awarded', aa.marks_awarded, 'time_spent_seconds', aa.time_spent_seconds,
            'evaluations', coalesce((
              select jsonb_agg(jsonb_build_object(
                'method', ev.method, 'score', ev.score, 'max_score', ev.max_score,
                'feedback', ev.feedback, 'rubric_scores', ev.rubric_scores, 'completed_at', ev.completed_at))
              from public.evaluations ev where ev.answer_id = aa.id and ev.status = 'completed'), '[]'::jsonb))
          from public.attempt_answers aa
          where aa.attempt_id = _a.id and aa.exam_question_id = eq.id)
      ) order by qo.n)
      from unnest(_a.question_order) with ordinality as qo(eq_id, n)
      join public.exam_questions eq on eq.id = qo.eq_id
      join public.questions q on q.id = eq.question_id
      left join public.subjects s on s.id = q.subject_id
      left join public.topics t on t.id = q.topic_id
      left join public.historical_papers hp on hp.id = q.historical_paper_id), '[]'::jsonb)
  );
end;
$$;

revoke execute on function public.save_answer(uuid, uuid, uuid, boolean, text, boolean, integer, text) from public, anon;
grant execute on function public.save_answer(uuid, uuid, uuid, boolean, text, boolean, integer, text) to authenticated;
revoke execute on function public.finalize_attempt(uuid, boolean) from public, anon, authenticated;
