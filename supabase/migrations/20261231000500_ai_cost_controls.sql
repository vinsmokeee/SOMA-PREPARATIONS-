-- AI cost controls (founder, 21 Nov 2026: "If it helps then okay. But shouldn't have any problem to the students").
--  1. The first handwriting reading of an answer and 2 re-reads are free; each further re-read uses one AI
--     evaluation from the allowance. An improved sample answer uses one (once per evaluation). Failed AI work
--     is refunded by the server.
--  2. Mock-test answers are marked through the Batch API (half price): evaluations.delivery = 'batch'.
--     A scheduled job (/api/cron/evaluations) submits and collects them; anything not back within a few
--     hours is marked straight away instead.

create table public.ai_allowance_uses (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users (id) on delete cascade,
  kind          text not null check (kind in ('reread', 'improved_answer')),
  answer_id     uuid references public.attempt_answers (id) on delete cascade,
  evaluation_id uuid references public.evaluations (id) on delete cascade,
  created_at    timestamptz not null default now()
);
create index ai_allowance_uses_user_idx on public.ai_allowance_uses (user_id, created_at);
create unique index ai_allowance_uses_improved_uniq on public.ai_allowance_uses (evaluation_id) where kind = 'improved_answer';
alter table public.ai_allowance_uses enable row level security;
create policy ai_allowance_uses_own on public.ai_allowance_uses for select to authenticated
  using (user_id = auth.uid() or public.has_permission('evaluations.assign'));
-- Writes only through the functions below and the server.

alter table public.evaluations
  add column delivery text not null default 'instant' check (delivery in ('instant', 'batch')),
  add column batch_id text,
  add column batch_submitted_at timestamptz;
create index evaluations_batch_idx on public.evaluations (status, delivery) where delivery = 'batch' and status = 'queued';

-- Successful handwriting readings of one answer.
create or replace function public.answer_reads(_answer_id uuid)
returns int language sql stable security definer set search_path = '' as $$
  select count(*)::int from public.ai_jobs j
  where j.kind = 'answer_transcription' and j.status = 'succeeded' and j.input ->> 'answer_id' = _answer_id::text;
$$;
revoke all on function public.answer_reads(uuid) from public, anon, authenticated;

-- For the answer page: how many free re-reads are left.
create or replace function public.answer_read_info(_answer_id uuid)
returns jsonb language plpgsql stable security definer set search_path = '' as $$
declare _free int := coalesce((public.evaluation_config() ->> 'free_rereads')::int, 2); _done int;
begin
  if not public.owns_answer(_answer_id) then raise exception 'ANSWER_NOT_FOUND' using errcode = 'P0002'; end if;
  _done := public.answer_reads(_answer_id);
  return jsonb_build_object('reads', _done, 'free_rereads', _free, 'free_rereads_left', greatest(_free + 1 - greatest(_done, 1), 0));
end;
$$;
revoke all on function public.answer_read_info(uuid) from public, anon;
grant execute on function public.answer_read_info(uuid) to authenticated;

-- Allowance: evaluations plus extra re-reads and improved answers.
create or replace function public.my_evaluation_allowance()
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  _uid uuid := auth.uid();
  _cfg jsonb := public.evaluation_config();
  _since timestamptz;
  _limit int;
  _pkg_limit int;
  _used int;
  _extra int;
  _paid boolean;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select min(e.starts_at), max(p.ai_evaluations) into _since, _pkg_limit
  from public.entitlements e join public.packages p on p.id = e.package_id
  where e.user_id = _uid and e.revoked_at is null and e.status = 'active' and p.includes_me and e.starts_at <= now()
    and (e.ends_at is null or e.ends_at > now());
  _paid := _since is not null;
  _limit := case when _paid then coalesce(_pkg_limit, (_cfg ->> 'me_package_total')::int, 100)
                 else coalesce((_cfg ->> 'free_total')::int, 3) end;
  select count(*) into _used from public.evaluations ev
  where ev.requested_by = _uid and ev.method = 'ai_feedback' and ev.status not in ('failed', 'withdrawn')
    and (not _paid or ev.assigned_at >= _since);
  select count(*) into _extra from public.ai_allowance_uses u
  where u.user_id = _uid and (not _paid or u.created_at >= _since);
  _used := _used + _extra;
  return jsonb_build_object('limit', _limit, 'used', _used, 'remaining', greatest(_limit - _used, 0), 'plan', case when _paid then 'me' else 'free' end);
end;
$$;

create or replace function public.begin_transcription(_answer_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare _aa public.attempt_answers%rowtype; _owner uuid; _paths text[]; _reads int; _done int; _free int; _charge uuid;
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
  -- The first reading and a few re-reads of an answer are free; further re-reads use one AI evaluation.
  _free := coalesce((public.evaluation_config() ->> 'free_rereads')::int, 2);
  _done := public.answer_reads(_answer_id);
  if _done > _free then
    if (public.my_evaluation_allowance() ->> 'remaining')::int <= 0 then
      raise exception 'NO_REREADS_LEFT' using errcode = 'P0001';
    end if;
    insert into public.ai_allowance_uses (user_id, kind, answer_id) values (auth.uid(), 'reread', _answer_id) returning id into _charge;
  end if;
  update public.attempt_answers set transcript_status = 'reading' where id = _answer_id;
  return jsonb_build_object('answer_id', _answer_id, 'paths', to_jsonb(_paths), 'charge_id', _charge);
end;
$$;
revoke all on function public.begin_transcription(uuid) from public, anon;
grant execute on function public.begin_transcription(uuid) to authenticated;

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
  _kind public.exam_kind;
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
  -- Mock tests are marked together at half price (results within a few hours); practice is marked straight away.
  select e.kind into _kind from public.exams e where e.id = _a.exam_id;
  insert into public.evaluations (answer_id, method, status, max_score, requested_by, delivery)
  values (_answer_id, 'ai_feedback', 'queued', coalesce((select marks from public.exam_questions where id = _aa.exam_question_id), _q.marks), auth.uid(),
    case when _kind = 'mock' and coalesce((public.evaluation_config() ->> 'batch_mock_marking')::boolean, true) then 'batch' else 'instant' end)
  returning id into _id;
  return _id;
end;
$$;
revoke all on function public.request_answer_evaluation(uuid) from public, anon;
grant execute on function public.request_answer_evaluation(uuid) to authenticated;

-- Improved sample answer: uses one AI evaluation (once per evaluation; refunded if it fails).
create or replace function public.request_improved_answer(_evaluation_id uuid)
returns boolean   -- true when generation should start, false when it already exists / is running
language plpgsql
security definer
set search_path = ''
as $$
declare _ev public.evaluations%rowtype;
begin
  select * into _ev from public.evaluations where id = _evaluation_id for update;
  if _ev.id is null or not public.owns_answer(_ev.answer_id) then
    raise exception 'EVALUATION_NOT_FOUND' using errcode = 'P0002';
  end if;
  if _ev.status <> 'completed' or _ev.method <> 'ai_feedback' then raise exception 'NOT_READY' using errcode = 'P0001'; end if;
  if _ev.details ? 'improved_answer' then return false; end if;
  if _ev.improved_requested_at is not null and _ev.improved_requested_at > now() - interval '5 minutes' then return false; end if;
  if not exists (select 1 from public.ai_allowance_uses where evaluation_id = _evaluation_id and kind = 'improved_answer') then
    if (public.my_evaluation_allowance() ->> 'remaining')::int <= 0 then
      raise exception 'NO_EVALUATIONS_LEFT' using errcode = 'P0001';
    end if;
    insert into public.ai_allowance_uses (user_id, kind, answer_id, evaluation_id)
    values (auth.uid(), 'improved_answer', _ev.answer_id, _evaluation_id);
  end if;
  update public.evaluations set improved_requested_at = now() where id = _evaluation_id;
  return true;
end;
$$;
revoke all on function public.request_improved_answer(uuid) from public, anon;
grant execute on function public.request_improved_answer(uuid) to authenticated;
