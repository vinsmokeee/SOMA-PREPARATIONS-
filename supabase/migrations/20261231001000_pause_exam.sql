-- Pause an exam (founder, 22 Nov 2026): during any timed exam the student can pause. The timer stops where it was
-- and the exam waits in "Paused exam" on the home page; Continue resumes it with the same time left. While an exam
-- is paused, no answers can be saved or submitted, it is never auto-submitted, and another mock test cannot be
-- started ("Finish your paused exam first").

alter table public.exam_attempts
  add column paused_at timestamptz,
  add column paused_seconds int check (paused_seconds is null or paused_seconds >= 0),   -- time left when paused
  add column paused_total_seconds int not null default 0 check (paused_total_seconds >= 0);
create index exam_attempts_paused_idx on public.exam_attempts (user_id) where paused_at is not null;

-- A paused attempt is never closed for time.
create or replace function public.close_if_expired(_attempt_id uuid)
returns boolean
language plpgsql
security definer
set search_path = ''
as $$
declare _deadline timestamptz; _status public.attempt_status; _paused timestamptz;
begin
  select deadline_at, status, paused_at into _deadline, _status, _paused from public.exam_attempts where id = _attempt_id;
  if _status = 'in_progress' and _paused is not null then return false; end if;
  if _status = 'in_progress' and now() > _deadline + public.attempt_save_grace() then
    perform public.finalize_attempt(_attempt_id, true);
    return true;
  end if;
  return _status <> 'in_progress';
end;
$$;
revoke execute on function public.close_if_expired(uuid) from public, anon, authenticated;

create or replace function public.pause_attempt(_attempt_id uuid)
returns int   -- seconds left
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype; _untimed boolean; _left int;
begin
  select * into _a from public.exam_attempts where id = _attempt_id for update;
  if _a.id is null or _a.user_id is distinct from auth.uid() then raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002'; end if;
  if _a.status <> 'in_progress' then raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001'; end if;
  if _a.paused_at is not null then return _a.paused_seconds; end if;
  select e.untimed into _untimed from public.exams e where e.id = _a.exam_id;
  if _untimed then raise exception 'CANNOT_PAUSE' using errcode = 'P0001'; end if;
  if now() > _a.deadline_at then
    perform public.close_if_expired(_attempt_id);
    raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001';
  end if;
  _left := greatest(0, ceil(extract(epoch from (_a.deadline_at - now()))))::int;
  update public.exam_attempts set paused_at = now(), paused_seconds = _left where id = _attempt_id;
  return _left;
end;
$$;
revoke all on function public.pause_attempt(uuid) from public, anon;
grant execute on function public.pause_attempt(uuid) to authenticated;

create or replace function public.resume_attempt(_attempt_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _a public.exam_attempts%rowtype;
begin
  select * into _a from public.exam_attempts where id = _attempt_id for update;
  if _a.id is null or _a.user_id is distinct from auth.uid() then raise exception 'ATTEMPT_NOT_FOUND' using errcode = 'P0002'; end if;
  if _a.status <> 'in_progress' then raise exception 'ATTEMPT_CLOSED' using errcode = 'P0001'; end if;
  if _a.paused_at is null then return _a.id; end if;
  update public.exam_attempts
  set deadline_at = now() + make_interval(secs => coalesce(_a.paused_seconds, 0)),
      paused_total_seconds = paused_total_seconds + greatest(0, floor(extract(epoch from (now() - _a.paused_at))))::int,
      paused_at = null, paused_seconds = null
  where id = _attempt_id;
  return _a.id;
end;
$$;
revoke all on function public.resume_attempt(uuid) from public, anon;
grant execute on function public.resume_attempt(uuid) to authenticated;

-- The "Paused exam" section: paused exams, plus any exam still running (with its time left).
create or replace function public.my_paused_exams()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(jsonb_build_object(
      'attempt_id', a.id, 'title', e.title, 'stage', e.stage, 'kind', e.kind,
      'paused', a.paused_at is not null, 'paused_at', a.paused_at, 'started_at', a.started_at,
      'seconds_left', case when a.paused_at is not null then a.paused_seconds
                           else greatest(0, ceil(extract(epoch from (a.deadline_at - now()))))::int end,
      'answered', (select count(*) from public.attempt_answers aa where aa.attempt_id = a.id
                   and (aa.selected_option_id is not null or coalesce(btrim(aa.text_answer), '') <> ''))
    ) order by a.paused_at desc nulls last, a.started_at desc), '[]'::jsonb)
  from public.exam_attempts a
  join public.exams e on e.id = a.exam_id
  where a.user_id = auth.uid() and a.status = 'in_progress' and not e.untimed
    and (a.paused_at is not null or a.deadline_at + public.attempt_save_grace() > now());
$$;
revoke all on function public.my_paused_exams() from public, anon;
grant execute on function public.my_paused_exams() to authenticated;

-- While paused: no answers, pages, submission; no other mock test.
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
       and exists (select 1 from public.exam_attempts a where a.user_id = new.user_id and a.status = 'in_progress' and a.paused_at is not null) then
      raise exception 'PAUSED_EXAM_EXISTS' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
revoke all on function public.block_while_paused() from public, anon, authenticated;
create trigger attempt_answers_paused before insert or update on public.attempt_answers for each row execute function public.block_while_paused();
create trigger answer_pages_paused before insert on public.answer_pages for each row execute function public.block_while_paused();
create trigger exam_attempts_paused before insert or update on public.exam_attempts for each row execute function public.block_while_paused();
