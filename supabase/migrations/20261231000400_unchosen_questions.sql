-- Founder (22 Nov 2026): in "answer any N" mocks the student chooses questions before writing. Questions they did not
-- choose are shown on the result as "Question not chosen during exam" and can never be uploaded, read (handwriting) or
-- evaluated, so no AI cost is spent on them. Attempts with no saved choice (older mocks) are unaffected.

create or replace function public.question_not_chosen(_attempt_id uuid, _exam_question_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id
    where a.id = _attempt_id and eq.id = _exam_question_id
      and a.chosen_groups is not null and eq.choose_any is not null
      and not (coalesce(eq.choice_group, '') = any (a.chosen_groups)));
$$;
revoke all on function public.question_not_chosen(uuid, uuid) from public, anon;
grant execute on function public.question_not_chosen(uuid, uuid) to authenticated;

-- The result page lists these as "not chosen" (only the student's own attempt).
create or replace function public.attempt_unchosen_questions(_attempt_id uuid)
returns setof uuid
language sql
stable
security definer
set search_path = ''
as $$
  select eq.id
  from public.exam_attempts a join public.exam_questions eq on eq.exam_id = a.exam_id
  where a.id = _attempt_id and a.user_id = auth.uid()
    and a.chosen_groups is not null and eq.choose_any is not null
    and not (coalesce(eq.choice_group, '') = any (a.chosen_groups));
$$;
revoke all on function public.attempt_unchosen_questions(uuid) from public, anon;
grant execute on function public.attempt_unchosen_questions(uuid) to authenticated;

create or replace function public.ensure_written_answer(_attempt_id uuid, _exam_question_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _type public.question_type; _id uuid;
begin
  select * into _a from public.exam_attempts where id = _attempt_id;
  if not found or _a.user_id is distinct from auth.uid() then
    raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not (_exam_question_id = any(_a.question_order)) then
    raise exception 'QUESTION_NOT_IN_ATTEMPT' using errcode = 'P0001';
  end if;
  if public.question_not_chosen(_attempt_id, _exam_question_id) then
    raise exception 'QUESTION_NOT_CHOSEN' using errcode = 'P0001';
  end if;
  select q.question_type into _type from public.exam_questions eq join public.questions q on q.id = eq.question_id
  where eq.id = _exam_question_id;
  if _type = 'mcq' then raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001'; end if;
  select id into _id from public.attempt_answers where attempt_id = _attempt_id and exam_question_id = _exam_question_id;
  if _id is null then
    if _a.status <> 'in_progress' and not exists (select 1 from public.exams where id = _a.exam_id and owner_id is not null) then
      -- After a timed exam closes, an answer row is created only inside the upload window.
      if now() > least(coalesce(_a.submitted_at, _a.deadline_at), _a.deadline_at)
                 + make_interval(mins => coalesce((public.evaluation_config() ->> 'upload_window_minutes')::int, 15)) then
        raise exception 'UPLOAD_WINDOW_CLOSED' using errcode = 'P0001';
      end if;
    end if;
    insert into public.attempt_answers (attempt_id, exam_question_id, answer_mode)
    values (_attempt_id, _exam_question_id, 'handwritten')
    on conflict (attempt_id, exam_question_id) do nothing
    returning id into _id;
    if _id is null then
      select id into _id from public.attempt_answers where attempt_id = _attempt_id and exam_question_id = _exam_question_id;
    end if;
  end if;
  return _id;
end;
$$;


create or replace function public.begin_transcription(_answer_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _aa public.attempt_answers%rowtype; _owner uuid; _paths text[]; _reads int;
begin
  select aa.* into _aa from public.attempt_answers aa where aa.id = _answer_id;
  select a.user_id into _owner from public.exam_attempts a where a.id = _aa.attempt_id;
  if _aa.id is null or _owner is distinct from auth.uid() then
    raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002';
  end if;
  if public.question_not_chosen(_aa.attempt_id, _aa.exam_question_id) then
    raise exception 'QUESTION_NOT_CHOSEN' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.evaluations ev where ev.answer_id = _answer_id and ev.status in ('queued', 'in_progress', 'completed')) then
    raise exception 'ANSWER_LOCKED' using errcode = 'P0001';
  end if;
  if _aa.transcript_status = 'reading' then raise exception 'ALREADY_READING' using errcode = 'P0001'; end if;
  select array_agg(storage_path order by position) into _paths from public.answer_pages where answer_id = _answer_id;
  if _paths is null then raise exception 'NO_PAGES' using errcode = 'P0001'; end if;
  -- Cost guard: at most 30 handwriting reads per student per day.
  select count(*) into _reads from public.ai_jobs where requested_by = auth.uid() and kind = 'answer_transcription'
    and created_at > now() - interval '1 day';
  if _reads >= 30 then raise exception 'RATE_LIMIT' using errcode = 'P0001'; end if;
  update public.attempt_answers set transcript_status = 'reading' where id = _answer_id;
  return jsonb_build_object('answer_id', _answer_id, 'paths', to_jsonb(_paths));
end;
$$;


create or replace function public.request_answer_evaluation(_answer_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  _aa public.attempt_answers%rowtype;
  _a public.exam_attempts%rowtype;
  _q public.questions%rowtype;
  _allow jsonb;
  _id uuid;
begin
  select * into _aa from public.attempt_answers where id = _answer_id;
  select * into _a from public.exam_attempts where id = _aa.attempt_id;
  if _aa.id is null or _a.user_id is distinct from auth.uid() then
    raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002';
  end if;
  if public.question_not_chosen(_aa.attempt_id, _aa.exam_question_id) then
    raise exception 'QUESTION_NOT_CHOSEN' using errcode = 'P0001';
  end if;
  perform public.close_if_expired(_a.id);
  select * into _a from public.exam_attempts where id = _aa.attempt_id;
  if _a.status = 'in_progress' then raise exception 'SUBMIT_FIRST' using errcode = 'P0001'; end if;
  select q.* into _q from public.exam_questions eq join public.questions q on q.id = eq.question_id where eq.id = _aa.exam_question_id;
  if _q.question_type = 'mcq' then raise exception 'INVALID_ANSWER_TYPE' using errcode = 'P0001'; end if;
  if _aa.answer_mode = 'handwritten' and _aa.transcript_status <> 'confirmed' then
    raise exception 'CONFIRM_TRANSCRIPT_FIRST' using errcode = 'P0001';
  end if;
  if coalesce(btrim(_aa.text_answer), '') = '' then raise exception 'EMPTY_ANSWER' using errcode = 'P0001'; end if;
  select id into _id from public.evaluations where answer_id = _answer_id and method = 'ai_feedback'
    and status in ('queued', 'in_progress', 'completed');
  if _id is not null then return _id; end if;   -- idempotent
  _allow := public.my_evaluation_allowance();
  if (_allow ->> 'remaining')::int <= 0 then raise exception 'NO_EVALUATIONS_LEFT' using errcode = 'P0001'; end if;
  insert into public.evaluations (answer_id, method, status, max_score, requested_by)
  values (_answer_id, 'ai_feedback', 'queued', coalesce((select marks from public.exam_questions where id = _aa.exam_question_id), _q.marks), auth.uid())
  returning id into _id;
  return _id;
end;
$$;

