-- Shuffle answer options (founder request, 18 Nov 2026). The correct answer was often in the same place (in the first
-- batch of new PE questions it was B 28 times out of 60), so a student could score by always choosing one letter.
-- Each attempt now shows the options in its own order; letters A–D follow the order shown. The order comes from
-- the attempt id, so it is the same every time the paper or the result is opened.
-- Not shuffled: options whose meaning depends on their place — a bare letter (A–D, or ཀ ཁ ག ང on Dzongkha
-- questions printed as pictures), "all/none of the above", "both … / neither … / only …".

create or replace function public.attempt_options(_attempt_id uuid, _question_id uuid, _with_key boolean)
returns jsonb
language sql
stable
set search_path = ''
as $$
  with fixed as (
    select exists (
      select 1 from public.question_options f
      where f.question_id = _question_id
        and (f.body ~* '^\s*\(?[a-d]\)?\s*$'
             or f.body ~ '^\s*[ཀཁགང]\s*$'
             or f.body ~* '(all|none|both|neither)\s+of\s+(the\s+)?(above|these)'
             or f.body ~* '^\s*(both|neither|only)\M')) as keep
  ), o as (
    select o.id, o.label, o.body, o.is_correct, o.position,
           row_number() over (order by case when (select keep from fixed) then o.position else 0 end,
                                       md5(_attempt_id::text || o.id::text), o.position) as rn
    from public.question_options o where o.question_id = _question_id
  )
  select coalesce(jsonb_agg(
           jsonb_build_object('id', o.id,
                              'label', case when (select keep from fixed) then o.label else chr(64 + o.rn::int) end,
                              'body', o.body)
           || case when _with_key then jsonb_build_object('is_correct', o.is_correct) else '{}'::jsonb end
         order by o.rn), '[]'::jsonb)
  from o;
$$;
-- Only the paper and result functions use it (they check who may see the attempt).
revoke all on function public.attempt_options(uuid, uuid, boolean) from public, anon, authenticated;

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
            'selected_option_id', aa.selected_option_id, 'text_answer', aa.text_answer,
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
