-- =============================================================================
-- Soma Preparations — Migration 0002: Source documents & examination structure
--
-- Official RCSC information is never hardcoded in application code. It is stored
-- here as *configurable* data, each row pointing at the source document it was
-- verified against, with an explicit verification status.
--
--   exam_frameworks   A rule-set (e.g. "BCSR 2023") defining papers & weightages.
--   exam_cycles       A yearly examination (e.g. "BCSE 2026") using a framework.
--   exam_categories   ME candidate categories (Administrative, Finance, ...).
--   exam_papers       Papers in a framework (PE paper; ME Paper I/II/III ...).
--   exam_paper_categories  Which categories sit which paper (many-to-many).
--   me_components     ME parts (AA / WE / VV) and weightage per category.
--   subjects / topics Syllabus tree. Topics self-reference for subtopics.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Source documents (RCSC announcements, past papers, syllabi, rules ...)
-- -----------------------------------------------------------------------------
create type public.source_document_type as enum (
  'announcement',
  'past_paper',
  'answer_key',
  'syllabus',
  'rules',
  'result',
  'news',
  'other'
);

-- What Soma is allowed to do with a document's contents.
create type public.usage_status as enum (
  'unknown',               -- not yet assessed (default)
  'research_only',         -- may be analysed internally; not reproduced to students
  'permission_requested',  -- written permission requested from the rights holder
  'authorised',            -- reproduction authorised (record the evidence in usage_notes)
  'not_permitted'          -- must not be reproduced
);

create type public.processing_status as enum (
  'pending',
  'retrieved',
  'extracted',
  'classified',
  'awaiting_review',
  'processed',
  'failed'
);

create table public.source_documents (
  id                 uuid primary key default gen_random_uuid(),
  url                text not null check (url ~* '^https://'),
  url_normalized     text not null unique,          -- lower-cased host, no fragment/tracking params
  host               text not null,
  title              text not null default '',
  publisher          text not null default 'Royal Civil Service Commission',
  reference_number   text,                          -- e.g. RCSC/CSES-1/2025-26/117
  document_type      public.source_document_type not null default 'other',
  exam_year          int check (exam_year between 1990 and 2100),
  stage              public.exam_stage,
  published_on       date,
  first_retrieved_at timestamptz,
  last_retrieved_at  timestamptz,
  current_sha256     text check (current_sha256 is null or current_sha256 ~ '^[0-9a-f]{64}$'),
  mime_type          text,
  storage_path       text,                          -- Supabase Storage key of the latest version
  processing_status  public.processing_status not null default 'pending',
  usage_status       public.usage_status not null default 'unknown',
  usage_notes        text,
  notes              text,
  created_by         uuid references auth.users (id) on delete set null,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now()
);
comment on table public.source_documents is 'Every external document Soma relies on. Public availability does NOT imply reproduction rights: see usage_status.';
create index source_documents_type_year_idx on public.source_documents (document_type, exam_year);
create trigger source_documents_updated_at before update on public.source_documents
  for each row execute function public.set_updated_at();
create trigger audit_source_documents after insert or update or delete on public.source_documents
  for each row execute function public.audit_row_change();

-- Each retrieval that produced different bytes creates a version (change history).
create table public.source_document_versions (
  id              uuid primary key default gen_random_uuid(),
  document_id     uuid not null references public.source_documents (id) on delete cascade,
  version_number  int not null check (version_number > 0),
  sha256          text not null check (sha256 ~ '^[0-9a-f]{64}$'),
  byte_size       bigint check (byte_size >= 0),
  storage_path    text,
  extracted_text  text,
  page_count      int,
  retrieved_at    timestamptz not null default now(),
  retrieved_by    uuid references auth.users (id) on delete set null,
  change_summary  text,
  unique (document_id, version_number),
  unique (document_id, sha256)
);

-- -----------------------------------------------------------------------------
-- Examination frameworks & cycles
-- -----------------------------------------------------------------------------
create table public.exam_frameworks (
  id                  uuid primary key default gen_random_uuid(),
  code                text not null unique check (code ~ '^[a-z0-9-]+$'),
  name                text not null,
  description         text,
  verification_status public.verification_status not null default 'unverified',
  source_document_id  uuid references public.source_documents (id) on delete set null,
  verified_at         timestamptz,
  verified_by         uuid references auth.users (id) on delete set null,
  is_current          boolean not null default false,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
-- At most one framework is "current".
create unique index exam_frameworks_one_current on public.exam_frameworks (is_current) where is_current;
create trigger exam_frameworks_updated_at before update on public.exam_frameworks
  for each row execute function public.set_updated_at();

create type public.cycle_status as enum ('planned', 'announced', 'registration_open', 'pe_completed', 'me_completed', 'closed');

create table public.exam_cycles (
  id                  uuid primary key default gen_random_uuid(),
  code                text not null unique check (code ~ '^[a-z0-9-]+$'),   -- e.g. bcse-2026
  name                text not null,                                       -- e.g. BCSE 2026
  year                int not null check (year between 2000 and 2100),
  framework_id        uuid not null references public.exam_frameworks (id),
  status              public.cycle_status not null default 'planned',
  registration_opens  date,
  registration_closes date,
  pe_date             date,
  me_start_date       date,
  me_end_date         date,
  pe_cutoff_note      text,      -- free text: cut-off is decided by the Commission each year
  verification_status public.verification_status not null default 'unverified',
  source_document_id  uuid references public.source_documents (id) on delete set null,
  notes               text,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  check (me_end_date is null or me_start_date is null or me_end_date >= me_start_date)
);
create trigger exam_cycles_updated_at before update on public.exam_cycles
  for each row execute function public.set_updated_at();

create table public.exam_categories (
  id                  uuid primary key default gen_random_uuid(),
  code                text not null unique check (code ~ '^[a-z0-9_]+$'),
  name                text not null,
  description         text,
  eligibility_summary text,
  pe_exempt           boolean not null default false,
  sort_order          int not null default 0,
  is_active           boolean not null default true,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now()
);
create trigger exam_categories_updated_at before update on public.exam_categories
  for each row execute function public.set_updated_at();

create table public.exam_papers (
  id                  uuid primary key default gen_random_uuid(),
  framework_id        uuid not null references public.exam_frameworks (id) on delete cascade,
  stage               public.exam_stage not null,
  code                text not null check (code ~ '^[a-z0-9_-]+$'),
  paper_number        int check (paper_number between 1 and 10),     -- I, II, III ...
  title               text not null,
  description         text,
  answer_format       text not null default 'mixed'
                       check (answer_format in ('objective_omr', 'written', 'mixed')),
  -- Official parameters. NULL means "not stated in the recorded official source".
  weightage_percent   numeric(5, 2) check (weightage_percent between 0 and 100),
  max_marks           numeric(6, 2) check (max_marks > 0),
  duration_minutes    int check (duration_minutes > 0),
  question_count      int check (question_count > 0),
  verification_status public.verification_status not null default 'unverified',
  source_document_id  uuid references public.source_documents (id) on delete set null,
  sort_order          int not null default 0,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  unique (framework_id, code)
);
create trigger exam_papers_updated_at before update on public.exam_papers
  for each row execute function public.set_updated_at();

create table public.exam_paper_categories (
  paper_id     uuid not null references public.exam_papers (id) on delete cascade,
  category_id  uuid not null references public.exam_categories (id) on delete cascade,
  -- Category-specific weightage when it differs (e.g. Paper III: 30% B.Ed vs 40% others).
  weightage_percent numeric(5, 2) check (weightage_percent between 0 and 100),
  primary key (paper_id, category_id)
);

-- ME components: Academic Achievement / Written Examination / Viva Voce.
create table public.me_components (
  id                 uuid primary key default gen_random_uuid(),
  framework_id       uuid not null references public.exam_frameworks (id) on delete cascade,
  category_id        uuid not null references public.exam_categories (id) on delete cascade,
  component          text not null check (component in ('academic_achievement', 'written_examination', 'viva_voce')),
  weightage_percent  numeric(5, 2) not null check (weightage_percent between 0 and 100),
  unique (framework_id, category_id, component)
);

-- -----------------------------------------------------------------------------
-- Syllabus: subjects & topics
-- -----------------------------------------------------------------------------
create table public.subjects (
  id            uuid primary key default gen_random_uuid(),
  stage         public.exam_stage not null,
  slug          text not null check (slug ~ '^[a-z0-9-]+$'),
  name          text not null,
  description   text,
  paper_id      uuid references public.exam_papers (id) on delete set null,
  is_official   boolean not null default false,  -- named in an official RCSC document
  source_document_id uuid references public.source_documents (id) on delete set null,
  sort_order    int not null default 0,
  is_active     boolean not null default true,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (stage, slug)
);
create trigger subjects_updated_at before update on public.subjects
  for each row execute function public.set_updated_at();

create table public.topics (
  id          uuid primary key default gen_random_uuid(),
  subject_id  uuid not null references public.subjects (id) on delete cascade,
  parent_id   uuid references public.topics (id) on delete cascade,  -- non-null => subtopic
  slug        text not null check (slug ~ '^[a-z0-9-]+$'),
  name        text not null,
  description text,
  sort_order  int not null default 0,
  is_active   boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  unique (subject_id, slug),
  check (parent_id is null or parent_id <> id)
);
create index topics_parent_idx on public.topics (parent_id);
create trigger topics_updated_at before update on public.topics
  for each row execute function public.set_updated_at();

-- Audit structural changes.
create trigger audit_exam_frameworks after insert or update or delete on public.exam_frameworks
  for each row execute function public.audit_row_change();
create trigger audit_exam_cycles after insert or update or delete on public.exam_cycles
  for each row execute function public.audit_row_change();
create trigger audit_exam_categories after insert or update or delete on public.exam_categories
  for each row execute function public.audit_row_change();
create trigger audit_exam_papers after insert or update or delete on public.exam_papers
  for each row execute function public.audit_row_change();

-- -----------------------------------------------------------------------------
-- Row Level Security
-- Examination structure is public reference information: readable by everyone.
-- Writes require exam_config.manage / syllabus.manage.
-- Source documents are internal (rights status, notes) — staff only.
-- -----------------------------------------------------------------------------
alter table public.source_documents enable row level security;
alter table public.source_document_versions enable row level security;
alter table public.exam_frameworks enable row level security;
alter table public.exam_cycles enable row level security;
alter table public.exam_categories enable row level security;
alter table public.exam_papers enable row level security;
alter table public.exam_paper_categories enable row level security;
alter table public.me_components enable row level security;
alter table public.subjects enable row level security;
alter table public.topics enable row level security;

create policy source_documents_staff_read on public.source_documents for select to authenticated
  using (public.has_permission('papers.manage') or public.has_permission('imports.run') or public.has_permission('exam_config.manage'));
create policy source_documents_write on public.source_documents for all to authenticated
  using (public.has_permission('imports.run') or public.has_permission('papers.manage'))
  with check (public.has_permission('imports.run') or public.has_permission('papers.manage'));

create policy source_document_versions_staff_read on public.source_document_versions for select to authenticated
  using (public.has_permission('papers.manage') or public.has_permission('imports.run'));
create policy source_document_versions_write on public.source_document_versions for insert to authenticated
  with check (public.has_permission('imports.run'));

-- Public reference data
create policy exam_frameworks_read on public.exam_frameworks for select to anon, authenticated using (true);
create policy exam_cycles_read on public.exam_cycles for select to anon, authenticated using (true);
create policy exam_categories_read on public.exam_categories for select to anon, authenticated using (is_active or public.is_staff());
create policy exam_papers_read on public.exam_papers for select to anon, authenticated using (true);
create policy exam_paper_categories_read on public.exam_paper_categories for select to anon, authenticated using (true);
create policy me_components_read on public.me_components for select to anon, authenticated using (true);
create policy subjects_read on public.subjects for select to anon, authenticated using (is_active or public.is_staff());
create policy topics_read on public.topics for select to anon, authenticated using (is_active or public.is_staff());

create policy exam_frameworks_write on public.exam_frameworks for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy exam_cycles_write on public.exam_cycles for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy exam_categories_write on public.exam_categories for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy exam_papers_write on public.exam_papers for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy exam_paper_categories_write on public.exam_paper_categories for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy me_components_write on public.me_components for all to authenticated
  using (public.has_permission('exam_config.manage')) with check (public.has_permission('exam_config.manage'));
create policy subjects_write on public.subjects for all to authenticated
  using (public.has_permission('syllabus.manage') or public.has_permission('exam_config.manage'))
  with check (public.has_permission('syllabus.manage') or public.has_permission('exam_config.manage'));
create policy topics_write on public.topics for all to authenticated
  using (public.has_permission('syllabus.manage') or public.has_permission('exam_config.manage'))
  with check (public.has_permission('syllabus.manage') or public.has_permission('exam_config.manage'));
