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
    if old.entry_category_id is not null and public.has_stage_access('ME')
       and (new.entry_category_id is distinct from old.entry_category_id or new.specialisation_id is distinct from old.specialisation_id) then
      raise exception 'ENTRY_LOCKED' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
revoke execute on function public.guard_profile_entry() from public, anon, authenticated;
