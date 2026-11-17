-- Main Examination structure, checked against the RCSC past-paper pages (founder's screenshots, Nov 2026)
-- and the founder's instruction of 17 Nov 2026:
--  * all six categories are offered, including Education Service (B.Ed.);
--  * B.Ed. General graduates and Dzongkha graduates sit different Paper I (Dzongkha) and Paper II (English)
--    and the same Paper III (Teacher Aptitude Test) — RCSC B.Ed. papers 2024–2025;
--  * Technical Paper I is "Languages and General Knowledge" (RCSC 2025);
--  * Technical Paper II groups for 2025: Statistics, Medical Science, Engineering, Traditional Medicine, ICT,
--    Bio Science, Nursing, Conservator (Law appeared in 2023). Which specialisation sits which group is not
--    published, so students choose their Paper II group themselves;
--  * Technical Paper III specialisations: the BCSE 2025 list is what students choose from; the earlier list
--    (CSCE 2009) is kept, not offered, for classifying old papers. Nothing is deleted or merged.
-- Existing students keep their entry (Civil Engineering and Architecture are on both lists).

-- Categories and papers ------------------------------------------------------
update public.exam_categories set name = 'Education Service (B.Ed.)', is_offered = true where code = 'bed';
update public.exam_papers set title = 'Languages and General Knowledge' where code = 'me-technical-1';
update public.exam_papers set bank_scope = 'specialisation',
  description = 'Separate papers for B.Ed. General graduates and Dzongkha graduates (RCSC B.Ed. papers 2024–2025).'
  where code in ('me-bed-1', 'me-bed-2');

-- Where each specialisation comes from, and the exam years it was offered ------
alter table public.specialisations
  add column if not exists list_source text,
  add column if not exists offered_years int[] not null default '{}';
comment on column public.specialisations.list_source is 'The RCSC list this name comes from (e.g. BCSE 2025 Paper III, CSCE 2009).';
comment on column public.specialisations.offered_years is 'BCSE years in which RCSC set a paper for this specialisation. "is_active" decides whether students can choose it now.';

-- The student's Paper II group (Technical) -------------------------------------
alter table public.profiles add column if not exists subject_group_id uuid references public.subject_groups (id) on delete set null;

-- Earlier list: historical only
update public.specialisations s set list_source = 'CSCE 2009', is_active = false
from public.exam_categories c where c.id = s.category_id and c.code = 'technical';
update public.specialisations set review_note = 'Duplicate of Library Science in the earlier list; kept inactive.' where code = 'library-science-2';

-- BCSE 2025 Paper III list (one row per subject; names on both lists are reused, not duplicated)
with names(name, code, ord) as (values
  ('Agriculture', 'agriculture', 1), ('Agriculture Engineering', 'agriculture-engineering', 2), ('Animal Science', 'animal-science', 3),
  ('Automobile Engineering', 'automobile-engineering', 4), ('Architecture', 'architecture', 5), ('Aeronautical Engineering', 'aeronautical-engineering', 6),
  ('Biomedical Engineering', 'biomedical-engineering', 7), ('Biotechnology (Bio Technologist)', 'biotechnology', 8), ('Chemistry', 'chemistry', 9),
  ('Civil Engineering', 'civil-engineering', 10), ('Conservator', 'conservator', 11), ('Cardiology', 'cardiology', 12),
  ('Clinical Counselling', 'clinical-counselling', 13), ('Dental Surgery', 'dental-surgery', 14), ('Drungtsho (Traditional Medicine)', 'drungtsho', 15),
  ('Electrical Engineering', 'electrical-engineering-2025', 16), ('Electronics and Communication Engineering', 'electronics-communication-engineering', 17),
  ('Emergency Medical Response', 'emergency-medical-response', 18), ('Bio Science', 'bio-science', 19), ('Environmental Science', 'environmental-science', 20),
  ('Food Science', 'food-science', 21), ('Forestry', 'forestry', 22), ('Geology', 'geology', 23), ('ICT', 'ict', 24),
  ('MBBS / Medicine', 'mbbs-medicine', 25), ('Mechanical Engineering', 'mechanical-engineering', 26),
  ('Medical Laboratory Technology', 'medical-laboratory-technology', 27), ('Instrumentation and Control Engineering', 'instrumentation-control-engineering', 28),
  ('Meteorology / Hydrology (Instrumentation)', 'meteorology-hydrology', 29), ('Nursing', 'nursing', 30), ('Nutrition and Dietetics', 'nutrition-dietetics', 31),
  ('Radiology', 'radiology', 32), ('Beautification Officer', 'beautification-officer', 33), ('Physiotherapy', 'physiotherapy', 34),
  ('Public Health', 'public-health', 35), ('Statistics', 'statistics', 36), ('Survey Engineering', 'survey-engineering', 37),
  ('Urban Planning', 'urban-planning', 38), ('Water Engineering', 'water-engineering', 39), ('Veterinary Science', 'veterinary-science', 40),
  ('Occupational Therapy Technology', 'occupational-therapy-technology', 41), ('Optometry', 'optometry', 42), ('Neurology', 'neurology', 43),
  ('Mining', 'mining', 44), ('Microbiology', 'microbiology', 45), ('Mechatronic Engineering', 'mechatronic-engineering', 46),
  ('Horticulture', 'horticulture', 47), ('Geographic Information System (GIS)', 'gis', 48)
), tech as (select id from public.exam_categories where code = 'technical'),
-- the same name on both lists: reuse the existing row
reused as (
  update public.specialisations s set is_active = true, offered_years = '{2025}', sort_order = n.ord,
    list_source = 'BCSE 2025 Paper III; also CSCE 2009'
  from names n, tech where s.category_id = tech.id and lower(s.name) = lower(n.name)
  returning s.id, lower(s.name) as lname
)
insert into public.specialisations (category_id, code, name, list_source, offered_years, is_active, sort_order)
select tech.id, n.code, n.name, 'BCSE 2025 Paper III', '{2025}', true, n.ord
from names n, tech
where lower(n.name) not in (select lname from reused)
on conflict do nothing;

-- B.Ed. graduate types (separate Paper I and II)
insert into public.specialisations (category_id, code, name, list_source, offered_years, is_active, sort_order)
select c.id, v.code, v.name, 'RCSC B.Ed. papers 2024–2025', '{2024,2025}', true, v.ord
from public.exam_categories c,
  (values ('bed-general-graduate', 'General graduate', 1), ('bed-dzongkha-graduate', 'Dzongkha graduate', 2)) as v(code, name, ord)
where c.code = 'bed'
on conflict do nothing;

-- Paper II groups: the eight RCSC 2025 groups can be chosen; Law (2023 only) is kept, not offered
update public.subject_groups set name = 'Traditional Medicine (Drungtsho)' where code = 'traditional-medicine';
insert into public.subject_groups (code, name, description, sort_order, is_active)
values ('conservator', 'Conservator', 'RCSC 2025 Technical Paper II group.', 80, true),
       ('law', 'Law', 'RCSC 2023 Technical Paper II group (not in 2025).', 90, false)
on conflict do nothing;

-- Student entry guard: Paper II group is a Technical choice and must be on offer ----
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

-- Does content with this classification belong to the caller's entry? ----------
-- PE content is common to everyone. ME content must be classified (paper, category, specialisation or
-- group) and match the student's category (via the paper), specialisation and Paper II group. A paper
-- whose bank is per group/specialisation never serves unclassified questions.
create or replace function public.entry_fits(_stage public.exam_stage, _paper uuid, _category uuid, _spec uuid, _group uuid)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $$
declare _c uuid; _s uuid; _g uuid; _scope text;
begin
  if auth.uid() is null or _stage = 'PE' or public.has_permission('exams.manage') then
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
  end if;
  return true;
end;
$$;
revoke all on function public.entry_fits(public.exam_stage, uuid, uuid, uuid, uuid) from public, anon, authenticated;
