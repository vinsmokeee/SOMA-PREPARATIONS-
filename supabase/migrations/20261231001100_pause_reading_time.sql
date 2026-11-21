-- Pause exam, part 2 (founder, 22 Nov 2026: "applied to all subjects and papers"): Continue now also moves the
-- attempt's start forward by the paused time. Reading time on "answer any N" papers is counted from the start, so a
-- pause during reading time keeps the reading time left; time spent is then right without a separate correction.

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
      -- The start moves forward by the paused time too, so reading time and time spent leave out the pause.
      started_at = started_at + (now() - _a.paused_at),
      paused_total_seconds = paused_total_seconds + greatest(0, floor(extract(epoch from (now() - _a.paused_at))))::int,
      paused_at = null, paused_seconds = null
  where id = _attempt_id;
  return _a.id;
end;
$$;
revoke all on function public.resume_attempt(uuid) from public, anon;
grant execute on function public.resume_attempt(uuid) to authenticated;

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
