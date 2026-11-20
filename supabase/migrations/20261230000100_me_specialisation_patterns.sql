-- Technical Paper III (Subject Specialisation Paper) is one paper with a different RCSC pattern for each
-- specialisation (BCSE 2025: most are 30 MCQ + 4 short answers + 1 of 2 case studies; Cardiology, Clinical
-- Counselling and Animal Science differ). A pattern section can now belong to a specialisation. Students get, in order:
-- their specialisation's sections, else their subject group's, else the shared ones. All 2025 Paper III papers:
-- 150 min writing (already set) + 15 min reading.

alter table public.paper_blueprint_sections
  add column specialisation_id uuid references public.specialisations (id) on delete cascade;
create index on public.paper_blueprint_sections (paper_id, specialisation_id, sort_order);

create or replace function public.my_specialisation()
returns uuid
language sql
stable
security definer
set search_path = ''
as $$
  select p.specialisation_id from public.profiles p where p.id = auth.uid();
$$;
revoke all on function public.my_specialisation() from public, anon;

create or replace function public.paper_sections_for_me(_paper uuid)
returns setof public.paper_blueprint_sections
language sql
stable
security definer
set search_path = ''
as $$
  with mine as (
    select case
      when exists (select 1 from public.paper_blueprint_sections x where x.paper_id = _paper and x.specialisation_id = public.my_specialisation())
        then 'spec'
      when exists (select 1 from public.paper_blueprint_sections x where x.paper_id = _paper and x.specialisation_id is null
                   and x.subject_group_id = public.my_subject_group())
        then 'group'
      else 'shared' end as level
  )
  select b.* from public.paper_blueprint_sections b, mine
  where b.paper_id = _paper
    and case mine.level
          when 'spec' then b.specialisation_id = public.my_specialisation()
          when 'group' then b.specialisation_id is null and b.subject_group_id = public.my_subject_group()
          else b.specialisation_id is null and b.subject_group_id is null end
  order by b.sort_order, b.created_at;
$$;

update public.exam_papers set reading_minutes = 15 where code = 'me-technical-3' and reading_minutes is null;
