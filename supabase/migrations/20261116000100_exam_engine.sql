-- =============================================================================
-- Soma Preparations — Migration 0011: Examination engine (Milestone 2)
--
-- All attempt writes go through these SECURITY DEFINER functions. Clients have
-- no INSERT/UPDATE policies on exam_attempts / attempt_answers.
--
--   start_attempt(exam)           start or resume (one open attempt per exam)
--   get_attempt_paper(attempt)    questions + options WITHOUT answer keys, saved answers
--   save_answer(...)              autosave a single answer (rejected after the deadline)
--   submit_attempt(attempt)       idempotent submission + automatic marking
--   get_attempt_result(attempt)   full review, only after submission
--   finalize_expired_attempts()   housekeeping for scheduled jobs (service role)
--
-- Timing: the deadline is fixed by the server at start. A short grace period
-- (SAVE_GRACE) accepts answers that were in flight when time ran out; nothing
-- is accepted after it. Time spent is measured to the deadline at most.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Content guards for options and rubrics (mirror the questions trigger):
-- only reviewers may change the answer key or rubric of verified/published
-- questions.
-- -----------------------------------------------------------------------------
create or replace function public.guard_question_children()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  _qid uuid := coalesce(new.question_id, old.question_id);
  _status public.content_status;
begin
  select status into _status from public.questions where id = _qid;
  if _status in ('verified', 'published')
     and auth.uid() is not null
     and not public.has_permission('questions.review') then
    raise exception 'Only reviewers may change options or rubrics of verified or published questions';
  end if;
  return coalesce(new, old);
end;
$$;
revoke execute on function public.guard_question_children() from public, anon, authenticated;

create trigger question_options_guard before insert or update or delete on public.question_options
  for each row execute function public.guard_question_children();
create trigger rubric_criteria_guard before insert or update or delete on public.rubric_criteria
  for each row execute function public.guard_question_children();
create trigger audit_question_options after insert or update or delete on public.question_options
  for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Exams may be published only when every question in them is published.
-- -----------------------------------------------------------------------------
create or replace function public.enforce_exam_publish()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.status = 'published' and (tg_op = 'INSERT' or old.status is distinct from 'published') then
    if not exists (select 1 from public.exam_questions where exam_id = new.id) then
      raise exception 'An examination needs at least one question before it can be published';
    end if;
    if exists (
      select 1 from public.exam_questions eq
      join public.questions q on q.id = eq.question_id
      where eq.exam_id = new.id and q.status <> 'published'
    ) then
      raise exception 'All questions must be published before the examination can be published';
    end if;
    new.published_at := coalesce(new.published_at, now());
  end if;
  return new;
end;
$$;
revoke execute on function public.enforce_exam_publish() from public, anon, authenticated;
create trigger exams_publish before insert or update on public.exams
  for each row execute function public.enforce_exam_publish();

-- -----------------------------------------------------------------------------
-- Internal: mark and close an attempt. Not callable by clients.
-- -----------------------------------------------------------------------------
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
            and (aa.selected_option_id is not null or coalesce(btrim(aa.text_answer), '') <> '')))
  where a.id = _attempt_id;
end;
$$;
revoke execute on function public.finalize_attempt(uuid, boolean) from public, anon, authenticated;

-- Grace period for answers that were in flight at the deadline.
create or replace function public.attempt_save_grace()
returns interval language sql immutable set search_path = '' as $$ select interval '10 seconds' $$;

-- Closes the attempt if its time (plus grace) has passed. Returns true when closed.
create or replace function public.close_if_expired(_attempt_id uuid)
returns boolean
language plpgsql
security definer
set search_path = ''
as $$
declare _deadline timestamptz; _status public.attempt_status;
begin
  select deadline_at, status into _deadline, _status from public.exam_attempts where id = _attempt_id;
  if _status = 'in_progress' and now() > _deadline + public.attempt_save_grace() then
    perform public.finalize_attempt(_attempt_id, true);
    return true;
  end if;
  return _status <> 'in_progress';
end;
$$;
revoke execute on function public.close_if_expired(uuid) from public, anon, authenticated;

-- -----------------------------------------------------------------------------
-- start_attempt
-- -----------------------------------------------------------------------------
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
  if _exam.id is null or (_exam.status <> 'published' and not _staff) then
    raise exception 'EXAM_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not _exam.is_free and not _staff and not public.has_stage_access(_exam.stage) then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;

  -- Resume an open attempt (interrupted session) instead of starting another.
  select id into _open from public.exam_attempts
  where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  if _open is not null then
    if not public.close_if_expired(_open) then
      return _open;
    end if;
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
    -- A parallel request (double tap, second tab) created it first: resume that one.
    select id into _id from public.exam_attempts
    where exam_id = _exam_id and user_id = _uid and status = 'in_progress';
  end;
  return _id;
end;
$$;

-- -----------------------------------------------------------------------------
-- get_attempt_paper — what the candidate sees during the examination
-- -----------------------------------------------------------------------------
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
        'word_limit', q.word_limit,
        'options', case when q.question_type = 'mcq' then coalesce((
          select jsonb_agg(jsonb_build_object('id', o.id, 'label', o.label, 'body', o.body) order by o.position, o.label)
          from public.question_options o where o.question_id = q.id), '[]'::jsonb) else '[]'::jsonb end
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

-- -----------------------------------------------------------------------------
-- save_answer — autosave one answer
-- -----------------------------------------------------------------------------
create or replace function public.save_answer(
  _attempt_id uuid,
  _exam_question_id uuid,
  _selected_option_id uuid default null,
  _clear_selection boolean default false,
  _text_answer text default null,
  _flagged boolean default null,
  _time_spent_delta integer default 0
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
    (attempt_id, exam_question_id, selected_option_id, text_answer, word_count, flagged, time_spent_seconds, saved_at)
  values (
    _attempt_id, _exam_question_id,
    case when _clear_selection then null else _selected_option_id end,
    _text_answer, _words, coalesce(_flagged, false),
    greatest(0, least(coalesce(_time_spent_delta, 0), 600)), now())
  on conflict (attempt_id, exam_question_id) do update set
    selected_option_id = case
      when _clear_selection then null
      when _selected_option_id is not null then _selected_option_id
      else aa.selected_option_id end,
    text_answer = coalesce(_text_answer, aa.text_answer),
    word_count = case when _text_answer is not null then _words else aa.word_count end,
    flagged = coalesce(_flagged, aa.flagged),
    time_spent_seconds = aa.time_spent_seconds + greatest(0, least(coalesce(_time_spent_delta, 0), 600)),
    saved_at = now();

  update public.exam_attempts set last_seen_at = now() where id = _attempt_id;
  return jsonb_build_object('saved_at', now(), 'deadline_at', _a.deadline_at);
end;
$$;

-- -----------------------------------------------------------------------------
-- submit_attempt — idempotent
-- -----------------------------------------------------------------------------
create or replace function public.submit_attempt(_attempt_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  _a public.exam_attempts%rowtype;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  if _a.status = 'in_progress' then
    perform public.finalize_attempt(_attempt_id, now() >= _a.deadline_at);
  end if;
  select * into _a from public.exam_attempts where id = _attempt_id;
  return jsonb_build_object('id', _a.id, 'status', _a.status, 'submitted_at', _a.submitted_at);
end;
$$;

-- -----------------------------------------------------------------------------
-- get_attempt_result — full review after submission
-- -----------------------------------------------------------------------------
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
      left join public.topics t on t.id = q.topic_id), '[]'::jsonb)
  );
end;
$$;

-- -----------------------------------------------------------------------------
-- finalize_expired_attempts — for a scheduled job (service role only)
-- -----------------------------------------------------------------------------
create or replace function public.finalize_expired_attempts()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare _id uuid; _n int := 0;
begin
  for _id in
    select id from public.exam_attempts
    where status = 'in_progress' and now() > deadline_at + public.attempt_save_grace()
    limit 500
  loop
    perform public.finalize_attempt(_id, true);
    _n := _n + 1;
  end loop;
  return _n;
end;
$$;

-- Privileges: signed-in users only for the candidate API; service role for housekeeping.
revoke execute on function public.start_attempt(uuid) from public, anon;
revoke execute on function public.get_attempt_paper(uuid) from public, anon;
revoke execute on function public.save_answer(uuid, uuid, uuid, boolean, text, boolean, integer) from public, anon;
revoke execute on function public.submit_attempt(uuid) from public, anon;
revoke execute on function public.get_attempt_result(uuid) from public, anon;
revoke execute on function public.finalize_expired_attempts() from public, anon, authenticated;
revoke execute on function public.attempt_save_grace() from anon;
grant execute on function public.start_attempt(uuid) to authenticated;
grant execute on function public.get_attempt_paper(uuid) to authenticated;
grant execute on function public.save_answer(uuid, uuid, uuid, boolean, text, boolean, integer) to authenticated;
grant execute on function public.submit_attempt(uuid) to authenticated;
grant execute on function public.get_attempt_result(uuid) to authenticated;
grant execute on function public.finalize_expired_attempts() to service_role;

-- -----------------------------------------------------------------------------
-- Exam catalogue for students: published exams with counts, access and the
-- caller's open attempt. Does not reveal question content.
-- -----------------------------------------------------------------------------
create or replace function public.exam_catalogue(_stage public.exam_stage default null)
returns table (
  id uuid,
  slug text,
  title text,
  description text,
  instructions text,
  stage public.exam_stage,
  kind public.exam_kind,
  duration_minutes int,
  is_free boolean,
  omr_mode boolean,
  negative_mark_per_wrong numeric,
  question_count int,
  total_marks numeric,
  has_access boolean,
  cycle_name text,
  paper_title text,
  category_name text,
  open_attempt_id uuid,
  open_deadline_at timestamptz,
  completed_attempts int
)
language sql
stable
security definer
set search_path = ''
as $$
  select e.id, e.slug, e.title, e.description, e.instructions, e.stage, e.kind,
         e.duration_minutes, e.is_free, e.omr_mode, e.negative_mark_per_wrong,
         (select count(*)::int from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published'),
         coalesce(e.total_marks, (select sum(coalesce(eq.marks, q.marks)) from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published')),
         (e.is_free or (auth.uid() is not null and public.has_stage_access(e.stage))),
         c.name, p.title, cat.name,
         oa.id, oa.deadline_at,
         (select count(*)::int from public.exam_attempts a
            where a.exam_id = e.id and a.user_id = auth.uid() and a.status <> 'in_progress')
  from public.exams e
  left join public.exam_cycles c on c.id = e.cycle_id
  left join public.exam_papers p on p.id = e.paper_id
  left join public.exam_categories cat on cat.id = e.category_id
  left join lateral (
    select a.id, a.deadline_at from public.exam_attempts a
    where a.exam_id = e.id and a.user_id = auth.uid() and a.status = 'in_progress'
    limit 1
  ) oa on true
  where e.status = 'published' and (_stage is null or e.stage = _stage)
  order by e.stage, case e.kind when 'sample' then 0 when 'mock' then 1 else 2 end, e.title;
$$;
revoke execute on function public.exam_catalogue(public.exam_stage) from public;
grant execute on function public.exam_catalogue(public.exam_stage) to anon, authenticated;

-- -----------------------------------------------------------------------------
-- Duplicate detection for the question bank.
--  * Exact: content_hash of the normalised stem (unique among non-archived).
--  * Near:  trigram similarity, for warnings in the editor (staff only).
-- -----------------------------------------------------------------------------
create or replace function public.set_question_content_hash()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.content_hash := md5(lower(regexp_replace(btrim(new.stem), '\s+', ' ', 'g')));
  return new;
end;
$$;
revoke execute on function public.set_question_content_hash() from public, anon, authenticated;
create trigger questions_content_hash before insert or update of stem on public.questions
  for each row execute function public.set_question_content_hash();
update public.questions set stem = stem where content_hash is null;

create or replace function public.find_similar_questions(_stem text, _exclude uuid default null)
returns table (id uuid, stem text, status public.content_status, similarity real)
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not (public.has_permission('questions.create') or public.has_permission('questions.review')) then
    raise exception 'Missing permission' using errcode = '42501';
  end if;
  return query
    select q.id, q.stem, q.status, extensions.similarity(q.stem, _stem)
    from public.questions q
    where (_exclude is null or q.id <> _exclude)
      and q.status <> 'archived'
      and extensions.similarity(q.stem, _stem) > 0.45
    order by 4 desc
    limit 5;
end;
$$;
revoke execute on function public.find_similar_questions(text, uuid) from public, anon;
grant execute on function public.find_similar_questions(text, uuid) to authenticated;
