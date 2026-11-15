-- =============================================================================
-- Soma Preparations — Migration 0003: Content
-- Document imports, historical papers, question bank, review workflow,
-- AI jobs, current affairs and study resources.
--
-- Protection model for questions:
--   * Students NEVER select from questions / question_options directly.
--     Question delivery (Milestone 2) happens through SECURITY DEFINER
--     functions that return only what the candidate may see (no is_correct,
--     no explanation until the attempt is submitted).
--   * Staff access is permission-based.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Import jobs (RCSC URL import workflow)
-- -----------------------------------------------------------------------------
create type public.import_job_status as enum (
  'queued',
  'fetching',
  'extracting',
  'classifying',
  'awaiting_review',
  'completed',
  'duplicate_unchanged',
  'failed',
  'cancelled'
);

create table public.import_jobs (
  id                 uuid primary key default gen_random_uuid(),
  url                text not null check (url ~* '^https://'),
  requested_type     public.source_document_type,
  requested_by       uuid references auth.users (id) on delete set null,
  via                text not null default 'admin_dashboard' check (via in ('admin_dashboard', 'claude_code', 'scheduled')),
  status             public.import_job_status not null default 'queued',
  document_id        uuid references public.source_documents (id) on delete set null,
  version_id         uuid references public.source_document_versions (id) on delete set null,
  error_message      text,
  log                jsonb not null default '[]'::jsonb,   -- [{at, step, message}]
  attempts           int not null default 0,
  locked_at          timestamptz,                          -- worker lease
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now(),
  finished_at        timestamptz
);
create index import_jobs_status_idx on public.import_jobs (status, created_at);
create trigger import_jobs_updated_at before update on public.import_jobs
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- Historical paper library
-- -----------------------------------------------------------------------------
create table public.historical_papers (
  id                  uuid primary key default gen_random_uuid(),
  source_document_id  uuid not null references public.source_documents (id) on delete restrict,
  exam_year           int not null check (exam_year between 1990 and 2100),
  stage               public.exam_stage not null,
  category_id         uuid references public.exam_categories (id) on delete set null,
  paper_id            uuid references public.exam_papers (id) on delete set null,
  original_title      text not null,
  exam_date           date,
  question_count      int check (question_count >= 0),
  has_official_key    boolean not null default false,
  processing_status   public.processing_status not null default 'pending',
  status              public.content_status not null default 'draft',
  attempt_eligible    boolean not null default false, -- may be attempted in timed mode (requires authorised usage)
  notes               text,
  created_by          uuid references auth.users (id) on delete set null,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  unique (source_document_id, stage, category_id, paper_id)
);
create index historical_papers_year_idx on public.historical_papers (stage, exam_year desc);
create trigger historical_papers_updated_at before update on public.historical_papers
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- AI jobs (provider-agnostic log of every AI call that produced content)
-- -----------------------------------------------------------------------------
create type public.ai_job_kind as enum (
  'question_generation',
  'paper_analysis',
  'question_extraction',
  'classification',
  'current_affairs_notes',
  'answer_feedback'
);
create type public.job_status as enum ('queued', 'running', 'succeeded', 'failed', 'cancelled');

create table public.ai_jobs (
  id             uuid primary key default gen_random_uuid(),
  kind           public.ai_job_kind not null,
  provider       text not null,            -- e.g. anthropic, openai — never hardcoded in schema
  model          text not null,
  status         public.job_status not null default 'queued',
  input          jsonb not null default '{}'::jsonb,
  output         jsonb,
  error_message  text,
  input_tokens   int,
  output_tokens  int,
  requested_by   uuid references auth.users (id) on delete set null,
  created_at     timestamptz not null default now(),
  started_at     timestamptz,
  completed_at   timestamptz
);
create index ai_jobs_kind_status_idx on public.ai_jobs (kind, status, created_at desc);

-- -----------------------------------------------------------------------------
-- Current affairs
-- -----------------------------------------------------------------------------
create table public.ca_sources (
  id                    uuid primary key default gen_random_uuid(),
  name                  text not null,
  base_url              text not null unique check (base_url ~* '^https://'),
  kind                  text not null check (kind in ('official', 'news', 'statistics', 'legislature', 'international')),
  priority              int not null default 50 check (priority between 1 and 100),
  check_interval_hours  int not null default 24 check (check_interval_hours between 1 and 720),
  is_active             boolean not null default false,
  last_checked_at       timestamptz,
  notes                 text,
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now()
);
create trigger ca_sources_updated_at before update on public.ca_sources
  for each row execute function public.set_updated_at();

create table public.ca_items (
  id                  uuid primary key default gen_random_uuid(),
  source_id           uuid references public.ca_sources (id) on delete set null,
  title               text not null,
  url                 text not null unique check (url ~* '^https://'),
  primary_source_url  text check (primary_source_url is null or primary_source_url ~* '^https://'),
  published_on        date,
  retrieved_at        timestamptz,
  category            text,           -- governance, economy, legislation, international, ...
  pe_relevant         boolean not null default false,
  me_relevant         boolean not null default false,
  summary             text,
  study_notes         text,           -- markdown
  verification_notes  text,
  status              public.content_status not null default 'draft',
  ai_job_id           uuid references public.ai_jobs (id) on delete set null,
  reviewed_by         uuid references auth.users (id) on delete set null,
  reviewed_at         timestamptz,
  published_at        timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  check (status <> 'published' or reviewed_by is not null)
);
create index ca_items_published_idx on public.ca_items (status, published_on desc);
create trigger ca_items_updated_at before update on public.ca_items
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- Question bank
-- -----------------------------------------------------------------------------
create type public.question_type as enum ('mcq', 'short_answer', 'long_answer', 'essay', 'analytical', 'descriptive');
create type public.difficulty_level as enum ('foundation', 'standard', 'advanced');
create type public.question_origin as enum (
  'original',             -- written by Soma
  'ai_generated',         -- generated by AI; must be human-verified
  'historical_official',  -- reproduced from an official paper (requires authorised usage)
  'current_affairs'       -- original question derived from a CA item
);

create table public.questions (
  id                    uuid primary key default gen_random_uuid(),
  stage                 public.exam_stage not null,
  question_type         public.question_type not null,
  stem                  text not null check (char_length(stem) between 5 and 20000),
  explanation           text,             -- shown after submission
  model_answer          text,             -- written questions
  word_limit            int check (word_limit > 0),
  subject_id            uuid references public.subjects (id) on delete set null,
  topic_id              uuid references public.topics (id) on delete set null,
  paper_id              uuid references public.exam_papers (id) on delete set null,
  category_id           uuid references public.exam_categories (id) on delete set null,
  difficulty            public.difficulty_level not null default 'standard',
  marks                 numeric(6, 2) not null default 1 check (marks > 0),
  estimated_seconds     int check (estimated_seconds > 0),
  origin                public.question_origin not null default 'original',
  historical_paper_id   uuid references public.historical_papers (id) on delete set null,
  ca_item_id            uuid references public.ca_items (id) on delete set null,
  ai_job_id             uuid references public.ai_jobs (id) on delete set null,
  status                public.content_status not null default 'draft',
  is_free_sample        boolean not null default false,
  content_hash          text,             -- normalised-stem hash for exact duplicate detection
  version               int not null default 1,
  created_by            uuid references auth.users (id) on delete set null,
  verified_by           uuid references auth.users (id) on delete set null,
  verified_at           timestamptz,
  published_at          timestamptz,
  created_at            timestamptz not null default now(),
  updated_at            timestamptz not null default now(),
  search                tsvector generated always as (
                          to_tsvector('english', coalesce(stem, '') || ' ' || coalesce(explanation, ''))
                        ) stored,
  -- A verified or published question always records who verified it.
  check (status not in ('verified', 'published') or verified_by is not null)
);
create index questions_bank_idx on public.questions (stage, status, subject_id, topic_id);
create index questions_search_idx on public.questions using gin (search);
create index questions_stem_trgm_idx on public.questions using gin (stem extensions.gin_trgm_ops);
create unique index questions_content_hash_uniq on public.questions (content_hash) where content_hash is not null and status <> 'archived';
create trigger questions_updated_at before update on public.questions
  for each row execute function public.set_updated_at();
create trigger audit_questions after insert or update or delete on public.questions
  for each row execute function public.audit_row_change();

-- Guard: AI-generated questions can never jump straight to published, and only
-- holders of questions.publish may publish anything.
create or replace function public.enforce_question_workflow()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.status = 'published' and (tg_op = 'INSERT' or old.status is distinct from 'published') then
    if tg_op = 'INSERT' or old.status <> 'verified' then
      raise exception 'A question must be verified before it is published (current: %)',
        coalesce(old.status::text, 'new');
    end if;
    if auth.uid() is not null and not public.has_permission('questions.publish') then
      raise exception 'Missing permission questions.publish';
    end if;
    new.published_at := coalesce(new.published_at, now());
  end if;

  if new.status = 'verified' and (tg_op = 'INSERT' or old.status is distinct from 'verified') then
    if auth.uid() is not null and not public.has_permission('questions.review') then
      raise exception 'Missing permission questions.review';
    end if;
    new.verified_by := coalesce(new.verified_by, auth.uid());
    new.verified_at := coalesce(new.verified_at, now());
  end if;

  if tg_op = 'UPDATE' and (new.stem is distinct from old.stem or new.explanation is distinct from old.explanation
                            or new.model_answer is distinct from old.model_answer) then
    -- Editing the content of live/verified questions is a reviewer-level action.
    if old.status in ('verified', 'published') and auth.uid() is not null
       and not public.has_permission('questions.review') then
      raise exception 'Only reviewers may edit the content of verified or published questions';
    end if;
    new.version := old.version + 1;
  end if;
  return new;
end;
$$;
create trigger questions_workflow before insert or update on public.questions
  for each row execute function public.enforce_question_workflow();

create table public.question_options (
  id           uuid primary key default gen_random_uuid(),
  question_id  uuid not null references public.questions (id) on delete cascade,
  label        text not null check (label ~ '^[A-H]$'),
  body         text not null check (char_length(body) between 1 and 2000),
  is_correct   boolean not null default false,
  position     int not null default 0,
  unique (question_id, label)
);
create index question_options_question_idx on public.question_options (question_id, position);

create table public.question_references (
  id                  uuid primary key default gen_random_uuid(),
  question_id         uuid not null references public.questions (id) on delete cascade,
  source_document_id  uuid references public.source_documents (id) on delete set null,
  citation            text not null,
  url                 text check (url is null or url ~* '^https?://'),
  note                text
);
create index question_references_question_idx on public.question_references (question_id);

-- Marking rubric criteria for written questions.
create table public.rubric_criteria (
  id           uuid primary key default gen_random_uuid(),
  question_id  uuid not null references public.questions (id) on delete cascade,
  label        text not null,
  description  text not null,
  max_marks    numeric(6, 2) not null check (max_marks > 0),
  position     int not null default 0
);
create index rubric_criteria_question_idx on public.rubric_criteria (question_id, position);

-- Review history for any reviewable content (questions, CA items, resources, papers).
create table public.content_reviews (
  id            uuid primary key default gen_random_uuid(),
  entity_type   text not null check (entity_type in ('question', 'ca_item', 'study_resource', 'historical_paper')),
  entity_id     uuid not null,
  reviewer_id   uuid references auth.users (id) on delete set null,
  action        text not null check (action in ('submit', 'approve', 'reject', 'request_revision', 'publish', 'unpublish', 'comment')),
  from_status   public.content_status,
  to_status     public.content_status,
  comment       text,
  created_at    timestamptz not null default now()
);
create index content_reviews_entity_idx on public.content_reviews (entity_type, entity_id, created_at desc);

-- -----------------------------------------------------------------------------
-- Study resources
-- -----------------------------------------------------------------------------
create table public.study_resources (
  id            uuid primary key default gen_random_uuid(),
  slug          text not null unique check (slug ~ '^[a-z0-9-]+$'),
  title         text not null,
  summary       text,
  kind          text not null check (kind in ('note', 'guide', 'official_link', 'document')),
  stage         public.exam_stage,
  subject_id    uuid references public.subjects (id) on delete set null,
  body          text,          -- markdown
  external_url  text check (external_url is null or external_url ~* '^https://'),
  storage_path  text,
  is_free       boolean not null default false,
  status        public.content_status not null default 'draft',
  created_by    uuid references auth.users (id) on delete set null,
  published_at  timestamptz,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
create trigger study_resources_updated_at before update on public.study_resources
  for each row execute function public.set_updated_at();

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------
alter table public.import_jobs enable row level security;
alter table public.historical_papers enable row level security;
alter table public.ai_jobs enable row level security;
alter table public.ca_sources enable row level security;
alter table public.ca_items enable row level security;
alter table public.questions enable row level security;
alter table public.question_options enable row level security;
alter table public.question_references enable row level security;
alter table public.rubric_criteria enable row level security;
alter table public.content_reviews enable row level security;
alter table public.study_resources enable row level security;

-- Imports
create policy import_jobs_rw on public.import_jobs for all to authenticated
  using (public.has_permission('imports.run')) with check (public.has_permission('imports.run'));

-- Historical papers: published metadata is public; management by papers.manage.
create policy historical_papers_public on public.historical_papers for select to anon, authenticated
  using (status = 'published' or public.has_permission('papers.manage'));
create policy historical_papers_write on public.historical_papers for all to authenticated
  using (public.has_permission('papers.manage')) with check (public.has_permission('papers.manage'));

-- AI jobs: staff with ai.run.
create policy ai_jobs_rw on public.ai_jobs for all to authenticated
  using (public.has_permission('ai.run')) with check (public.has_permission('ai.run'));

-- Current affairs
create policy ca_sources_read on public.ca_sources for select to authenticated using (public.has_permission('ca.manage'));
create policy ca_sources_write on public.ca_sources for all to authenticated
  using (public.has_permission('ca.manage')) with check (public.has_permission('ca.manage'));
create policy ca_items_public on public.ca_items for select to anon, authenticated
  using (status = 'published' or public.has_permission('ca.manage'));
create policy ca_items_write on public.ca_items for all to authenticated
  using (public.has_permission('ca.manage')) with check (public.has_permission('ca.manage'));

-- Questions: staff only (students receive questions through exam functions).
create policy questions_staff_read on public.questions for select to authenticated
  using (public.has_permission('questions.create') or public.has_permission('questions.review') or public.has_permission('exams.manage'));
create policy questions_insert on public.questions for insert to authenticated
  with check (public.has_permission('questions.create'));
create policy questions_update on public.questions for update to authenticated
  using (public.has_permission('questions.create') or public.has_permission('questions.review'))
  with check (public.has_permission('questions.create') or public.has_permission('questions.review'));
create policy questions_delete on public.questions for delete to authenticated
  using (public.has_permission('questions.review') and status in ('draft', 'ai_generated', 'rejected'));

create policy question_options_staff on public.question_options for all to authenticated
  using (public.has_permission('questions.create') or public.has_permission('questions.review') or public.has_permission('exams.manage'))
  with check (public.has_permission('questions.create') or public.has_permission('questions.review'));
create policy question_references_staff on public.question_references for all to authenticated
  using (public.has_permission('questions.create') or public.has_permission('questions.review'))
  with check (public.has_permission('questions.create') or public.has_permission('questions.review'));
create policy rubric_criteria_staff on public.rubric_criteria for all to authenticated
  using (public.has_permission('questions.create') or public.has_permission('questions.review') or public.has_permission('evaluations.perform'))
  with check (public.has_permission('questions.create') or public.has_permission('questions.review'));

create policy content_reviews_read on public.content_reviews for select to authenticated using (public.is_staff());
create policy content_reviews_insert on public.content_reviews for insert to authenticated
  with check (public.is_staff() and reviewer_id = auth.uid());

-- Study resources: published free resources public; paid ones gated in Milestone 8 via entitlements.
create policy study_resources_public on public.study_resources for select to anon, authenticated
  using ((status = 'published' and is_free) or public.has_permission('resources.manage'));
create policy study_resources_write on public.study_resources for all to authenticated
  using (public.has_permission('resources.manage')) with check (public.has_permission('resources.manage'));
