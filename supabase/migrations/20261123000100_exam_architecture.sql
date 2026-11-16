-- =============================================================================
-- Soma Preparations — Master plan Phase 1: Examination architecture
--
-- Adds technical specialisations and Paper II subject groups, per-paper
-- settings (marks, duration, question count, qualifying mark) with the source of
-- each value, paper sections (PE: English, Dzongkha, Aptitude, Data
-- Interpretation), PE cut-off history as reference information, configurable PE
-- eligibility, finer question classification, and the student's entry
-- (category + specialisation). Students only receive ME questions and exams
-- that fit their entry.
--
-- Nothing existing is removed. Values not confirmed by an RCSC document are
-- marked params_source = 'founder_brief' (or left NULL) and verification
-- 'unverified'.
-- =============================================================================

alter type public.question_type add value if not exists 'translation';
alter type public.question_type add value if not exists 'passage';
alter type public.question_type add value if not exists 'case_study';
alter type public.question_origin add value if not exists 'ai_variation';

-- -----------------------------------------------------------------------------
-- Categories: customer-facing group, whether Soma offers it, PE rule note
-- -----------------------------------------------------------------------------
alter table public.exam_categories
  add column public_group text check (public_group in ('general', 'technical', 'dzongkha', 'bed')),
  add column is_offered boolean not null default true,
  add column pe_rule_note text;

update public.exam_categories set public_group = 'general' where code in ('administrative', 'finance', 'pgde');
update public.exam_categories set public_group = 'technical' where code = 'technical';
update public.exam_categories set public_group = 'dzongkha' where code = 'dzongkha';
update public.exam_categories set public_group = 'bed', is_offered = false where code = 'bed';
update public.exam_categories set pe_rule_note =
  'BCSE 2026 announcement (A.4): medical (clinical and curative subject) and engineering professionals are exempted from the PE; other technical graduates sit the PE. Soma does not assume which specialisations this covers: set "PE required" on each specialisation after checking the current year''s announcement.'
  where code = 'technical';
update public.exam_categories set pe_rule_note =
  'BCSE 2026 announcement (A.4): B.Ed graduates are exempted from the PE but must register for the BCSE. Check each year''s announcement.'
  where code = 'bed';

-- -----------------------------------------------------------------------------
-- Technical Paper II subject groups and specialisations
-- -----------------------------------------------------------------------------
create table public.subject_groups (
  id                  uuid primary key default gen_random_uuid(),
  code                text not null unique check (code ~ '^[a-z0-9-]+$'),
  name                text not null,
  description         text,
  verification_status public.verification_status not null default 'unverified',
  source_document_id  uuid references public.source_documents (id) on delete set null,
  notes               text,
  is_active           boolean not null default true,
  sort_order          int not null default 0,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create trigger subject_groups_updated_at before update on public.subject_groups
  for each row execute function public.set_updated_at();
create trigger audit_subject_groups after insert or update or delete on public.subject_groups
  for each row execute function public.audit_row_change();

create table public.specialisations (
  id                  uuid primary key default gen_random_uuid(),
  category_id         uuid not null references public.exam_categories (id) on delete restrict,
  code                text not null unique check (code ~ '^[a-z0-9-]+$'),
  name                text not null,
  subject_group_id    uuid references public.subject_groups (id) on delete set null,  -- Paper II bank (NULL = own bank)
  pe_required         boolean,          -- NULL = not set yet (shown as "check the announcement")
  pe_rule_note        text,
  verification_status public.verification_status not null default 'unverified',
  review_note         text,             -- e.g. possible duplicate
  is_active           boolean not null default true,
  sort_order          int not null default 0,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create index specialisations_category_idx on public.specialisations (category_id, sort_order);
create trigger specialisations_updated_at before update on public.specialisations
  for each row execute function public.set_updated_at();
create trigger audit_specialisations after insert or update or delete on public.specialisations
  for each row execute function public.audit_row_change();

-- Paper II groups seen on RCSC's "Technical paper II" page (BCSE 2025 papers)
-- and the separate Nursing Paper II in the BCSE 2025 written-examination
-- announcement. Unverified until the page is checked. Specialisations are NOT
-- linked to a group until verified, so no banks are merged.
insert into public.subject_groups (code, name, notes, source_document_id, sort_order) values
  ('engineering', 'Engineering', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 10),
  ('ict', 'ICT', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 20),
  ('bio-science', 'Bio Science', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 30),
  ('medical-science', 'Medical Science', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 40),
  ('statistics', 'Statistics', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 50),
  ('traditional-medicine', 'Traditional Medicine', 'Paper II title seen on RCSC''s Technical Paper II page (BCSE 2025). Verify which specialisations sit it.', null, 60),
  ('nursing', 'Nursing', 'BCSE 2025 written-examination announcement: B.Sc Nursing graduates sat a separate Nursing Subject paper as Paper II.', '00000000-0000-4000-8000-000000000102', 70);

-- The founder's list, loaded exactly as given (order preserved). Possible
-- duplicates are flagged for review, not merged.
insert into public.specialisations (category_id, code, name, review_note, sort_order)
select c.id, v.code, v.name, v.note, v.n * 10
from public.exam_categories c
cross join (values
  (1, 'architecture', 'Architecture', null),
  (2, 'bsc-agriculture', 'BSc. Agriculture', null),
  (3, 'computer-science-engineering', 'Computer Science and Engineering', null),
  (4, 'electrical-engineering', 'Electrical Engineering / Electrical and Electronics Engineering Group', null),
  (5, 'forestry', 'Forestry', null),
  (6, 'ict-3-years', 'ICT (3 years)', null),
  (7, 'laboratory-technician', 'Laboratory Technician', null),
  (8, 'library-science', 'Library Science', 'Listed twice in the founder''s list (items 8 and 20). Merge, rename or deactivate after checking RCSC''s list.'),
  (9, 'medical', 'Medical', 'May be the same as "Medicine" (item 21). Check RCSC''s list before merging.'),
  (10, 'mining', 'Mining', null),
  (11, 'nursing', 'Nursing', null),
  (12, 'visual-communication', 'Visual Communication', null),
  (13, 'bio-science', 'Bio Science', null),
  (14, 'bvsc-ah', 'BVSC & AH', null),
  (15, 'dentistry', 'Dentistry', null),
  (16, 'electronic-communications-engineering', 'Electronic and Communications Engineering', null),
  (17, 'geology', 'Geology', null),
  (18, 'ict-4-years', 'ICT (4 years)', null),
  (19, 'law', 'Law', null),
  (20, 'library-science-2', 'Library Science', 'Listed twice in the founder''s list (items 8 and 20). Merge, rename or deactivate after checking RCSC''s list.'),
  (21, 'medicine', 'Medicine', 'May be the same as "Medical" (item 9). Check RCSC''s list before merging.'),
  (22, 'nangpai-dungtsho', 'Nangpai Dungtsho', null),
  (23, 'physiotherapy', 'Physiotherapy', null),
  (24, 'survey-engineering', 'Survey Engineering', null),
  (25, 'biomedical-engineering', 'Biomedical Engineering', null),
  (26, 'civil-engineering', 'Civil Engineering', null),
  (27, 'food-and-nutrition', 'Food and Nutrition', null),
  (28, 'horticulture', 'Horticulture', null),
  (29, 'mechanical-engineering', 'Mechanical Engineering', null),
  (30, 'microbiology', 'Microbiology', null),
  (31, 'statistics', 'Statistics', null)
) as v(n, code, name, note)
where c.code = 'technical';

-- -----------------------------------------------------------------------------
-- Papers: question bank scope, source of numeric settings, qualifying mark
-- -----------------------------------------------------------------------------
alter table public.exam_papers
  add column bank_scope text not null default 'common' check (bank_scope in ('common', 'subject_group', 'specialisation')),
  add column params_source text check (params_source in ('official', 'founder_brief', 'admin')),
  add column params_note text,
  add column qualifying_marks numeric(6, 2) check (qualifying_marks is null or qualifying_marks >= 0);

update public.exam_papers set bank_scope = 'subject_group' where code = 'me-technical-2';
update public.exam_papers set bank_scope = 'specialisation' where code = 'me-technical-3';

-- Founder's brief values; only filled where nothing has been entered yet.
update public.exam_papers p set
  max_marks = v.marks, duration_minutes = v.minutes, question_count = coalesce(p.question_count, v.questions),
  params_source = 'founder_brief',
  params_note = 'From the founder''s brief (2026-11-16). Not yet confirmed by an RCSC document.'
from (values
  ('pe', 100::numeric, 150, 100),
  ('me-technical-1', 100, 180, null::int), ('me-technical-2', 100, 90, null), ('me-technical-3', 100, 150, null),
  ('me-general-1', 100, 180, null), ('me-general-2', 100, 180, null), ('me-general-3', 100, 180, null),
  ('me-dzongkha-1', 100, 180, null), ('me-dzongkha-2', 100, 180, null), ('me-dzongkha-3', 100, 180, null)
) as v(code, marks, minutes, questions)
where p.code = v.code and p.max_marks is null and p.duration_minutes is null;
update public.exam_papers set params_note = params_note || ' 100 MCQs in 150 minutes also appears on the BCSE 2011 PE paper.'
  where code = 'pe' and params_source = 'founder_brief';

-- -----------------------------------------------------------------------------
-- Paper sections (configurable; PE = four areas)
-- -----------------------------------------------------------------------------
create table public.paper_sections (
  id             uuid primary key default gen_random_uuid(),
  paper_id       uuid not null references public.exam_papers (id) on delete cascade,
  title          text not null,
  subject_id     uuid references public.subjects (id) on delete set null,
  question_count int check (question_count is null or question_count > 0),
  marks          numeric(6, 2) check (marks is null or marks > 0),
  formats        text,             -- e.g. "MCQs and short answers"
  params_source  text check (params_source in ('official', 'founder_brief', 'admin')),
  sort_order     int not null default 0,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  unique (paper_id, title)
);
create trigger paper_sections_updated_at before update on public.paper_sections
  for each row execute function public.set_updated_at();
create trigger audit_paper_sections after insert or update or delete on public.paper_sections
  for each row execute function public.audit_row_change();

-- PE: the four areas (founder decision 2026-11-16). Counts per section are left
-- empty until confirmed from papers or RCSC.
insert into public.paper_sections (paper_id, title, subject_id, formats, params_source, sort_order)
select p.id, v.title, s.id, 'MCQs', 'founder_brief', v.n
from public.exam_papers p
cross join (values (10, 'English', 'english-communication'), (20, 'Dzongkha', 'dzongkha-communication'),
                   (30, 'Aptitude', 'logic-analytical-problem-solving'), (40, 'Data Interpretation', 'data-interpretation')) as v(n, title, slug)
left join public.subjects s on s.stage = 'PE' and s.slug = v.slug
where p.code = 'pe';

-- Section names students see; the official wording stays in the description.
update public.subjects set name = 'English', description = coalesce(description, 'Official wording: English communication skills.') where stage = 'PE' and slug = 'english-communication';
update public.subjects set name = 'Dzongkha', description = coalesce(description, 'Official wording: Dzongkha communication skills.') where stage = 'PE' and slug = 'dzongkha-communication';
update public.subjects set name = 'Aptitude', description = coalesce(description, 'Official wording: logic, analytical ability and problem-solving.') where stage = 'PE' and slug = 'logic-analytical-problem-solving';
update public.subjects set name = 'Data Interpretation', description = coalesce(description, 'Official wording: data interpretation ability.') where stage = 'PE' and slug = 'data-interpretation';
update public.subjects set name = 'Current affairs (practice)', description =
  'Not a separate PE section. The BCSE 2026 announcement says the PE tests "general awareness/current affairs"; the founder''s structure has four sections (English, Dzongkha, Aptitude, Data Interpretation). Used for current-affairs practice only. Add a PE section in Examination structure if RCSC confirms one.'
  where stage = 'PE' and slug = 'general-awareness-current-affairs';

-- Technical Paper I split from the founder's brief.
insert into public.paper_sections (paper_id, title, marks, formats, params_source, sort_order)
select p.id, v.title, v.marks, 'MCQs and short answers', 'founder_brief', v.n
from public.exam_papers p
cross join (values (10, 'Dzongkha', 30::numeric), (20, 'English and General Knowledge', 70::numeric)) as v(n, title, marks)
where p.code = 'me-technical-1';

-- -----------------------------------------------------------------------------
-- PE cut-off history (reference only, never a rule)
-- -----------------------------------------------------------------------------
insert into public.source_documents (url, url_normalized, host, title, document_type, exam_year, stage, processing_status, usage_status, notes)
values
  ('https://rcsc.gov.bt/wp-content/uploads/2025/02/BCSE-2011-PE.pdf', 'https://rcsc.gov.bt/wp-content/uploads/2025/02/bcse-2011-pe.pdf', 'rcsc.gov.bt',
   'BCSE 2011 Preliminary Examination paper', 'past_paper', 2011, 'PE', 'pending', 'unknown', '100 MCQs, 100 marks, 150 minutes (as listed in search results; open to confirm).'),
  ('https://rcsc.gov.bt/2024/08/declaration-of-preliminary-examination-pe-result-for-bcse-2024/', 'https://rcsc.gov.bt/2024/08/declaration-of-preliminary-examination-pe-result-for-bcse-2024/', 'rcsc.gov.bt',
   'Declaration of Preliminary Examination (PE) Result for BCSE 2024', 'result', 2024, 'PE', 'pending', 'unknown', null),
  ('https://rcsc.gov.bt/?p=36995', 'https://rcsc.gov.bt/?p=36995', 'rcsc.gov.bt',
   'Declaration of Preliminary Examination (PE) Result for BCSE 2025', 'result', 2025, 'PE', 'pending', 'unknown', null),
  ('https://rcsc.gov.bt/wp-content/uploads/2026/08/1-PE-Result-Announcement.docx-1.pdf', 'https://rcsc.gov.bt/wp-content/uploads/2026/08/1-pe-result-announcement.docx-1.pdf', 'rcsc.gov.bt',
   'PE Result Announcement (BCSE 2026)', 'result', 2026, 'PE', 'pending', 'unknown', null)
on conflict (url_normalized) do nothing;

create table public.pe_cutoff_history (
  id                  uuid primary key default gen_random_uuid(),
  year                int not null unique check (year between 2000 and 2100),
  value               numeric(6, 2) not null check (value >= 0),
  unit                text not null default 'percent' check (unit in ('percent', 'marks')),
  note                text,
  verification_status public.verification_status not null default 'unverified',
  source_document_id  uuid references public.source_documents (id) on delete set null,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create trigger pe_cutoff_history_updated_at before update on public.pe_cutoff_history
  for each row execute function public.set_updated_at();
create trigger audit_pe_cutoff_history after insert or update or delete on public.pe_cutoff_history
  for each row execute function public.audit_row_change();

insert into public.pe_cutoff_history (year, value, unit, note, source_document_id)
select v.year, v.value, v.unit, 'Taken from the RCSC result announcement as listed in search results; open the source to confirm.', s.id
from (values (2024, 50::numeric, 'percent', 'https://rcsc.gov.bt/2024/08/declaration-of-preliminary-examination-pe-result-for-bcse-2024/'),
             (2025, 55, 'marks', 'https://rcsc.gov.bt/?p=36995'),
             (2026, 55, 'percent', 'https://rcsc.gov.bt/wp-content/uploads/2026/08/1-pe-result-announcement.docx-1.pdf')) as v(year, value, unit, url)
left join public.source_documents s on s.url_normalized = v.url;

-- -----------------------------------------------------------------------------
-- Question and exam classification; student entry
-- -----------------------------------------------------------------------------
alter table public.questions
  add column specialisation_id  uuid references public.specialisations (id) on delete set null,
  add column subject_group_id   uuid references public.subject_groups (id) on delete set null,
  add column source_year        int check (source_year is null or source_year between 1990 and 2100),
  add column source_page        int check (source_page is null or source_page > 0),
  add column parent_question_id uuid references public.questions (id) on delete set null;
create index questions_entry_idx on public.questions (paper_id, specialisation_id, subject_group_id);

alter table public.exams
  add column specialisation_id uuid references public.specialisations (id) on delete set null,
  add column subject_group_id  uuid references public.subject_groups (id) on delete set null;

alter table public.profiles
  add column specialisation_id uuid references public.specialisations (id) on delete set null;

-- Entry rules for profiles: the specialisation must belong to the category;
-- students choose only offered entries; once a student has ME access their
-- entry can only be changed by an administrator.
create or replace function public.guard_profile_entry()
returns trigger language plpgsql set search_path = '' as $$
begin
  if new.specialisation_id is not null and not exists (
       select 1 from public.specialisations s where s.id = new.specialisation_id and s.category_id = new.entry_category_id) then
    raise exception 'SPECIALISATION_MISMATCH' using errcode = 'P0001';
  end if;
  if tg_op = 'UPDATE'
     and (new.entry_category_id is distinct from old.entry_category_id or new.specialisation_id is distinct from old.specialisation_id)
     and auth.uid() is not null and auth.uid() = new.id and not public.has_permission('users.manage') then
    if new.entry_category_id is not null and not exists (
         select 1 from public.exam_categories c where c.id = new.entry_category_id and c.is_active and c.is_offered) then
      raise exception 'ENTRY_NOT_OFFERED' using errcode = 'P0001';
    end if;
    if new.specialisation_id is not null and not exists (
         select 1 from public.specialisations s where s.id = new.specialisation_id and s.is_active) then
      raise exception 'ENTRY_NOT_OFFERED' using errcode = 'P0001';
    end if;
    if old.entry_category_id is not null and public.has_stage_access('ME') then
      raise exception 'ENTRY_LOCKED' using errcode = 'P0001';
    end if;
  end if;
  return new;
end;
$$;
create trigger profiles_entry_guard before insert or update on public.profiles for each row execute function public.guard_profile_entry();
revoke execute on function public.guard_profile_entry() from public, anon, authenticated;

-- Does content with this classification belong to the caller's entry?
-- PE content is common to everyone. ME content must match the student's
-- category (via the paper), specialisation and Paper II group. A paper whose
-- bank is per group/specialisation never serves unclassified questions.
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
  select p.entry_category_id, p.specialisation_id, sp.subject_group_id into _c, _s, _g
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

-- Practice pool: unchanged rules plus the entry filter.
create or replace function public.practice_pool(_stage public.exam_stage)
returns setof uuid
language sql
stable
security definer
set search_path = ''
as $$
  select q.id from public.questions q
  where q.status = 'published' and q.question_type = 'mcq' and q.stage = _stage
    and (q.is_free_sample or public.has_stage_access(_stage) or public.has_permission('exams.manage'))
    and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id);
$$;
revoke execute on function public.practice_pool(public.exam_stage) from public, anon, authenticated;

-- Exam catalogue: unchanged plus the entry filter.
create or replace function public.exam_catalogue(_stage public.exam_stage default null)
returns table (
  id uuid, slug text, title text, description text, instructions text,
  stage public.exam_stage, kind public.exam_kind, duration_minutes int, is_free boolean,
  omr_mode boolean, negative_mark_per_wrong numeric, question_count int, total_marks numeric,
  has_access boolean, cycle_name text, paper_title text, category_name text,
  open_attempt_id uuid, open_deadline_at timestamptz, completed_attempts int,
  exam_year int, attribution text
)
language sql
stable
security definer
set search_path = ''
as $$
  select e.id, e.slug, e.title, e.description, e.instructions, e.stage, e.kind,
         e.duration_minutes, e.is_free, e.omr_mode, e.negative_mark_per_wrong,
         (select count(*)::int from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published'),
         coalesce(e.total_marks, (select sum(coalesce(eq.marks, q.marks)) from public.exam_questions eq
            join public.questions q on q.id = eq.question_id
            where eq.exam_id = e.id and q.status = 'published')),
         (e.is_free or (auth.uid() is not null and public.has_stage_access(e.stage))),
         c.name, p.title, cat.name,
         oa.id, oa.deadline_at,
         (select count(*)::int from public.exam_attempts a
            where a.exam_id = e.id and a.user_id = auth.uid() and a.status <> 'in_progress'),
         hp.exam_year,
         hp.attribution_text
  from public.exams e
  left join public.exam_cycles c on c.id = e.cycle_id
  left join public.exam_papers p on p.id = e.paper_id
  left join public.exam_categories cat on cat.id = e.category_id
  left join public.historical_papers hp on hp.id = e.historical_paper_id
  left join lateral (
    select a.id, a.deadline_at from public.exam_attempts a
    where a.exam_id = e.id and a.user_id = auth.uid() and a.status = 'in_progress'
    limit 1
  ) oa on true
  where e.status = 'published' and e.owner_id is null and (_stage is null or e.stage = _stage)
    and public.entry_fits(e.stage, e.paper_id, e.category_id, e.specialisation_id, e.subject_group_id)
  order by e.stage, case e.kind when 'sample' then 0 when 'mock' then 1 when 'historical' then 2 else 3 end,
           hp.exam_year desc nulls last, e.title;
$$;

-- Written practice: only questions for the caller's entry.
create or replace function public.written_practice_questions()
returns table (id uuid, stem text, question_type public.question_type, marks numeric, word_limit int,
               subject_id uuid, subject text, topic text, paper_id uuid, paper text, category text,
               exam_year int, is_free_sample boolean, has_access boolean, attempts int, last_score numeric, last_max numeric)
language sql
stable
security definer
set search_path = ''
as $$
  select q.id, q.stem, q.question_type, q.marks, q.word_limit, q.subject_id, s.name, t.name, q.paper_id, p.title, cat.name,
         hp.exam_year, q.is_free_sample,
         (q.is_free_sample or public.has_stage_access('ME')),
         (select count(*)::int from public.attempt_answers aa join public.exam_attempts a on a.id = aa.attempt_id
            join public.exam_questions eq on eq.id = aa.exam_question_id
            where a.user_id = auth.uid() and eq.question_id = q.id and coalesce(btrim(aa.text_answer), '') <> ''),
         ev.score, ev.max_score
  from public.questions q
  left join public.subjects s on s.id = q.subject_id
  left join public.topics t on t.id = q.topic_id
  left join public.exam_papers p on p.id = q.paper_id
  left join public.exam_categories cat on cat.id = q.category_id
  left join public.historical_papers hp on hp.id = q.historical_paper_id
  left join lateral (
    select ev.score, ev.max_score from public.evaluations ev
    join public.attempt_answers aa on aa.id = ev.answer_id
    join public.exam_attempts a on a.id = aa.attempt_id
    join public.exam_questions eq on eq.id = aa.exam_question_id
    where a.user_id = auth.uid() and eq.question_id = q.id and ev.status = 'completed'
    order by ev.completed_at desc limit 1) ev on true
  where auth.uid() is not null and q.status = 'published' and q.stage = 'ME' and q.question_type <> 'mcq'
    and public.entry_fits(q.stage, q.paper_id, q.category_id, q.specialisation_id, q.subject_group_id)
  order by p.sort_order nulls last, s.sort_order nulls last, q.created_at;
$$;
revoke all on function public.written_practice_questions() from public, anon;
grant execute on function public.written_practice_questions() to authenticated;

create or replace function public.create_written_practice(_question_id uuid, _minutes int default null)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare _uid uuid := auth.uid(); _q public.questions%rowtype; _exam uuid;
begin
  if _uid is null then raise exception 'NOT_SIGNED_IN' using errcode = '42501'; end if;
  select * into _q from public.questions where id = _question_id;
  if _q.id is null or _q.status <> 'published' or _q.stage <> 'ME' or _q.question_type = 'mcq' then
    raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not public.entry_fits(_q.stage, _q.paper_id, _q.category_id, _q.specialisation_id, _q.subject_group_id) then
    raise exception 'QUESTION_NOT_FOUND' using errcode = 'P0002';
  end if;
  if not _q.is_free_sample and not public.has_stage_access('ME') and not public.has_permission('exams.manage') then
    raise exception 'ACCESS_REQUIRED' using errcode = '42501';
  end if;
  if (select count(*) from public.exams where owner_id = _uid and created_at > now() - interval '1 day') >= 40 then
    raise exception 'RATE_LIMIT' using errcode = 'P0001';
  end if;
  insert into public.exams (slug, title, description, stage, kind, paper_id, category_id, specialisation_id, subject_group_id,
                            duration_minutes, total_marks, is_free, status, owner_id, untimed)
  values ('written-' || replace(gen_random_uuid()::text, '-', ''), 'Written practice: ' || left(regexp_replace(_q.stem, '\s+', ' ', 'g'), 80),
          case when _minutes is null then 'Untimed written practice.' else _minutes || '-minute timed written practice.' end,
          'ME', 'practice', _q.paper_id, _q.category_id, _q.specialisation_id, _q.subject_group_id,
          coalesce(least(greatest(_minutes, 5), 240), 600), _q.marks, true, 'draft', _uid, _minutes is null)
  returning id into _exam;
  insert into public.exam_questions (exam_id, question_id, position) values (_exam, _q.id, 1);
  update public.exams set status = 'published' where id = _exam;
  return public.start_attempt(_exam);
end;
$$;
revoke all on function public.create_written_practice(uuid, int) from public, anon;
grant execute on function public.create_written_practice(uuid, int) to authenticated;

-- -----------------------------------------------------------------------------
-- Packages: separate PE and ME packages (prices are data, editable in admin)
-- -----------------------------------------------------------------------------
update public.packages set price = 699, access_days = case when access_days = 30 then 45 else access_days end
  where slug = 'pe-premium' and price = 499;

insert into public.packages (slug, name, tagline, description, price, features, includes_pe, includes_me, cycle_id,
                             status, access_days, terms, sort_order)
values ('me-premium', 'ME Premium', 'Main Examination written-paper preparation for your entry',
        'Practice for the written papers of your ME pathway (General, Technical or Dzongkha Graduates): written questions, model answers, marking rubrics and AI feedback on your answers. Does not include the PE.',
        799,
        '["Written-paper practice for your ME pathway and specialisation", "Model answers and marking rubrics", "AI feedback on typed and handwritten answers", "Current-affairs practice", "Performance tracking"]'::jsonb,
        false, true, (select id from public.exam_cycles where code = 'bcse-2027'), 'coming_soon', 45,
        'About 45 days of access from activation. Soma trains the written examination of the ME; academic marks and the viva/interview also count toward the final selection result.',
        15)
on conflict (slug) do nothing;

-- The combined package stays hidden until the administrator switches it on.
update public.packages set status = 'draft' where slug = 'pe-me-premium' and status = 'coming_soon';

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------
alter table public.subject_groups enable row level security;
alter table public.specialisations enable row level security;
alter table public.paper_sections enable row level security;
alter table public.pe_cutoff_history enable row level security;

create policy subject_groups_read on public.subject_groups for select to anon, authenticated using (is_active or public.is_staff());
create policy specialisations_read on public.specialisations for select to anon, authenticated using (is_active or public.is_staff());
create policy paper_sections_read on public.paper_sections for select to anon, authenticated using (true);
create policy pe_cutoff_history_read on public.pe_cutoff_history for select to anon, authenticated using (true);

create policy subject_groups_write on public.subject_groups for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy specialisations_write on public.specialisations for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy paper_sections_write on public.paper_sections for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy pe_cutoff_history_write on public.pe_cutoff_history for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
