-- Founder, 21 Nov 2026: "People don't like waiting for hours" - mock-test answers are marked straight away
-- again, like practice. This restores request_answer_evaluation without the batch choice from 20261231000500.
-- The evaluations.delivery / batch_id / batch_submitted_at columns stay (unused, always 'instant').
update public.app_settings set value = value - 'batch_mock_marking' where key = 'evaluation.config';
drop index if exists public.evaluations_batch_idx;

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
revoke all on function public.request_answer_evaluation(uuid) from public, anon;
grant execute on function public.request_answer_evaluation(uuid) to authenticated;
