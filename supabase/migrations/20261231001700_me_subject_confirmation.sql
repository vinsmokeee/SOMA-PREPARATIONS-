-- ME subject confirmation (founder, 22 Nov 2026). A student with ME Premium confirms their subject once, in a
-- pop-up; after that their category, subject (specialisation) and Paper II group are locked and only staff can
-- change them. Before confirming they may still choose again, but cannot start an ME paper.
alter table public.profiles add column if not exists entry_confirmed_at timestamptz;
comment on column public.profiles.entry_confirmed_at is 'When the student confirmed their ME subject (locks their ME entry).';

create or replace function public.guard_profile_entry()
returns trigger language plpgsql set search_path = '' as $$
begin
  if new.specialisation_id is not null and not exists (
       select 1 from public.specialisations s where s.id = new.specialisation_id and s.category_id = new.entry_category_id) then
    raise exception 'SPECIALISATION_MISMATCH' using errcode = 'P0001';
  end if;
  if new.subject_group_id is not null and not exists (
       select 1 from public.exam_categories c where c.id = new.entry_category_id and c.code = 'technical') then
    raise exception 'SPECIALISATION_MISMATCH' using errcode = 'P0001';
  end if;
  -- Only confirm_me_entry (or staff) sets the confirmation.
  if tg_op = 'UPDATE' and new.entry_confirmed_at is distinct from old.entry_confirmed_at
     and auth.uid() is not null and auth.uid() = new.id and not public.has_permission('users.manage')
     and coalesce(current_setting('soma.confirm_entry', true), '') <> 'on' then
    raise exception 'ENTRY_LOCKED' using errcode = 'P0001';
  end if;
  if tg_op = 'UPDATE'
     and (new.entry_category_id is distinct from old.entry_category_id or new.specialisation_id is distinct from old.specialisation_id
          or new.subject_group_id is distinct from old.subject_group_id)
     and auth.uid() is not null and auth.uid() = new.id and not public.has_permission('users.manage') then
    if new.entry_category_id is not null and not exists (
         select 1 from public.exam_categories c where c.id = new.entry_category_id and c.is_active and c.is_offered) then
      raise exception 'ENTRY_NOT_OFFERED' using errcode = 'P0001';
    end if;
    if new.specialisation_id is not null and new.specialisation_id is distinct from old.specialisation_id and not exists (
         select 1 from public.specialisations s where s.id = new.specialisation_id and s.is_active) then
      raise exception 'ENTRY_NOT_OFFERED' using errcode = 'P0001';
    end if;
    if new.subject_group_id is not null and new.subject_group_id is distinct from old.subject_group_id and not exists (
         select 1 from public.subject_groups g where g.id = new.subject_group_id and g.is_active) then
      raise exception 'ENTRY_NOT_OFFERED' using errcode = 'P0001';
    end if;
    -- A confirmed subject is locked: category, subject and Paper II group.
    if old.entry_confirmed_at is not null then
      raise exception 'ENTRY_LOCKED' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
revoke execute on function public.guard_profile_entry() from public, anon, authenticated;

-- The student confirms the subject shown in the pop-up (the ids guard against a stale screen).
create or replace function public.confirm_me_entry(_category uuid, _specialisation uuid default null)
returns timestamptz
language plpgsql
security definer
set search_path = ''
as $$
declare _p public.profiles%rowtype; _code text; _at timestamptz := now();
begin
  if auth.uid() is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  if not public.has_stage_access('ME') then raise exception 'ACCESS_REQUIRED' using errcode = '42501'; end if;
  select * into _p from public.profiles where id = auth.uid();
  if _p.entry_confirmed_at is not null then return _p.entry_confirmed_at; end if;
  select code into _code from public.exam_categories where id = _p.entry_category_id;
  if _p.entry_category_id is null or (_code in ('bed', 'technical') and _p.specialisation_id is null) then
    raise exception 'ENTRY_INCOMPLETE' using errcode = 'P0001';
  end if;
  if _p.entry_category_id is distinct from _category or _p.specialisation_id is distinct from _specialisation then
    raise exception 'ENTRY_CHANGED' using errcode = 'P0001';
  end if;
  perform set_config('soma.confirm_entry', 'on', true);
  update public.profiles set entry_confirmed_at = _at where id = auth.uid();
  perform set_config('soma.confirm_entry', 'off', true);
  return _at;
end;
$$;
revoke all on function public.confirm_me_entry(uuid, uuid) from public, anon;
grant execute on function public.confirm_me_entry(uuid, uuid) to authenticated;

-- A Premium student must confirm their subject before starting any ME paper.
create or replace function public.require_confirmed_me_entry()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if auth.uid() is not null and auth.uid() = new.user_id and not public.has_permission('exams.manage')
     and exists (select 1 from public.exams e where e.id = new.exam_id and e.stage = 'ME')
     and public.has_stage_access('ME')
     and not exists (select 1 from public.profiles p where p.id = new.user_id and p.entry_confirmed_at is not null) then
    raise exception 'ENTRY_NOT_CONFIRMED' using errcode = 'P0001';
  end if;
  return new;
end;
$$;
revoke execute on function public.require_confirmed_me_entry() from public, anon, authenticated;
drop trigger if exists exam_attempts_entry_confirmed on public.exam_attempts;
create trigger exam_attempts_entry_confirmed before insert on public.exam_attempts
  for each row execute function public.require_confirmed_me_entry();
