create or replace function public.entry_fits(_stage public.exam_stage, _paper uuid, _category uuid, _spec uuid, _group uuid)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _c uuid; _s uuid; _g uuid; _scope text;
begin
  -- Server jobs (no signed-in user) and PE (one paper for everyone) see everything. Staff are NOT exempt here:
  -- the student area always follows the account's own entry, so staff see exactly what such a student sees.
  if auth.uid() is null or _stage = 'PE' then
    return true;
  end if;
  if _paper is null and _category is null and _spec is null and _group is null then
    return false;  -- unclassified ME content is never shown to students
  end if;
  select p.entry_category_id, p.specialisation_id, coalesce(p.subject_group_id, sp.subject_group_id) into _c, _s, _g
  from public.profiles p left join public.specialisations sp on sp.id = p.specialisation_id
  where p.id = auth.uid();
  if _category is not null and _category is distinct from _c then return false; end if;
  if _spec is not null and _spec is distinct from _s then return false; end if;
  if _group is not null and _group is distinct from _g then return false; end if;
  if _paper is not null then
    select bank_scope into _scope from public.exam_papers where id = _paper;
    if _c is null or not exists (select 1 from public.exam_paper_categories where paper_id = _paper and category_id = _c) then
      return false;
    end if;
    if _scope = 'specialisation' and _spec is null then return false; end if;
    if _scope = 'subject_group' and _spec is null and _group is null then return false; end if;
    -- A subject paper's question must name its subject: an untagged one is never shown to anyone.
  end if;
  return true;
end;
$$;