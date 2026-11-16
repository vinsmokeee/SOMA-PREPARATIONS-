-- =============================================================================
-- Soma Preparations — Master plan Phase 4: AI question variations (extends M6)
--
-- AI can now write variations of an existing question (new scenario, new
-- numbers, another angle, easier, harder, application) or a new question on
-- the same learning objective. Each draft keeps a link to its source question
-- (parent_question_id), inherits the source's classification, and is checked
-- automatically (an independent AI solve of the question plus rule checks)
-- before it reaches the human review queue. Nothing is published without a
-- reviewer: the existing workflow trigger still applies.
--
-- Students see where each question comes from in their results: a past RCSC
-- paper, an AI-generated practice question (variation or original), or a
-- Soma question.
-- =============================================================================

alter table public.questions
  add column variation_type text check (variation_type in
    ('new_scenario', 'new_numbers', 'other_angle', 'easier', 'harder', 'application', 'same_objective')),
  add column ai_review jsonb;   -- automatic pre-review checks: verdict, solver answer, issues
create index questions_parent_idx on public.questions (parent_question_id) where parent_question_id is not null;

-- Overview for the AI page: questions by origin and status, and sources most used.
create or replace function public.ai_question_overview()
returns jsonb language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.has_permission('ai.run') and not public.has_permission('questions.review') then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'by_origin', coalesce((select jsonb_agg(jsonb_build_object('origin', origin, 'status', status, 'n', n))
                           from (select origin::text, status::text, count(*) as n from public.questions
                                 where status <> 'archived' group by 1, 2) x), '[]'::jsonb),
    'awaiting_review', (select count(*) from public.questions
                        where origin::text in ('ai_generated', 'ai_variation') and status in ('ai_generated', 'awaiting_review')),
    'flagged', (select count(*) from public.questions
                where origin::text in ('ai_generated', 'ai_variation') and status in ('ai_generated', 'awaiting_review')
                  and ai_review ->> 'verdict' = 'flag'),
    'variations', (select count(*) from public.questions where parent_question_id is not null and status <> 'archived')
  );
end;
$$;
revoke all on function public.ai_question_overview() from public, anon;
grant execute on function public.ai_question_overview() to authenticated;

-- Results show where each question comes from.
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
        'word_limit', q.word_limit,
        'explanation', q.explanation,
        'model_answer', q.model_answer,
        'subject', s.name,
        'topic', t.name,
        'difficulty', q.difficulty,
        'origin', q.origin,
        'source_year', coalesce(q.source_year, hp.exam_year),
        'options', coalesce((
          select jsonb_agg(jsonb_build_object('id', o.id, 'label', o.label, 'body', o.body, 'is_correct', o.is_correct)
                           order by o.position, o.label)
          from public.question_options o where o.question_id = q.id), '[]'::jsonb),
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
