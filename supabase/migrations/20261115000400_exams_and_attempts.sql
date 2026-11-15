-- =============================================================================
-- Soma Preparations — Migration 0004: Examinations, attempts & evaluations
--
-- Milestone 1 creates the structure and access rules. The exam-delivery,
-- autosave and submission functions (start_attempt, save_answer,
-- submit_attempt, get_attempt_paper) are implemented in Milestone 2.
--
-- Key decisions:
--  * The server is authoritative for time: exam_attempts.deadline_at is fixed
--    when an attempt starts; answers saved after it are rejected.
--  * One in-progress attempt per user per exam (partial unique index) — this
--    is how interrupted sessions are resumed instead of duplicated.
--  * Submission is idempotent: status moves once from in_progress to
--    submitted/auto_submitted; a second submit is a no-op.
-- =============================================================================

create type public.exam_kind as enum ('mock', 'sample', 'historical', 'practice', 'revision');
create type public.attempt_status as enum ('in_progress', 'submitted', 'auto_submitted', 'abandoned');
create type public.evaluation_method as enum (
  'automated',      -- deterministic scoring (MCQ answer key)
  'ai_feedback',    -- AI-generated feedback/indicative marks — never official
  'expert'          -- human expert evaluation
);

create table public.exams (
  id                 uuid primary key default gen_random_uuid(),
  slug               text not null unique check (slug ~ '^[a-z0-9-]+$'),
  title              text not null,
  description        text,
  stage              public.exam_stage not null,
  kind               public.exam_kind not null default 'mock',
  cycle_id           uuid references public.exam_cycles (id) on delete set null,
  paper_id           uuid references public.exam_papers (id) on delete set null,
  category_id        uuid references public.exam_categories (id) on delete set null,
  historical_paper_id uuid references public.historical_papers (id) on delete set null,
  instructions       text,                 -- markdown, paper-specific
  duration_minutes   int not null check (duration_minutes between 1 and 600),
  total_marks        numeric(7, 2),
  negative_mark_per_wrong numeric(5, 2) not null default 0 check (negative_mark_per_wrong >= 0),
  shuffle_questions  boolean not null default false,
  shuffle_options    boolean not null default false,
  omr_mode           boolean not null default false,   -- show OMR-style answer sheet
  is_free            boolean not null default false,
  status             public.content_status not null default 'draft',
  -- Soma practice simulations are never official RCSC papers. This flag lets the
  -- UI label official historical reproductions accurately (only when authorised).
  is_official_reproduction boolean not null default false,
  created_by         uuid references auth.users (id) on delete set null,
  published_at       timestamptz,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now()
);
create index exams_listing_idx on public.exams (stage, kind, status);
create trigger exams_updated_at before update on public.exams
  for each row execute function public.set_updated_at();
create trigger audit_exams after insert or update or delete on public.exams
  for each row execute function public.audit_row_change();

create table public.exam_questions (
  id           uuid primary key default gen_random_uuid(),
  exam_id      uuid not null references public.exams (id) on delete cascade,
  question_id  uuid not null references public.questions (id) on delete restrict,
  position     int not null check (position > 0),
  section      text,                         -- e.g. "English communication"
  marks        numeric(6, 2),                -- override; defaults to questions.marks
  is_optional  boolean not null default false, -- ME "answer any N" support
  unique (exam_id, question_id),
  unique (exam_id, position)
);

create table public.exam_attempts (
  id                  uuid primary key default gen_random_uuid(),
  exam_id             uuid not null references public.exams (id) on delete restrict,
  user_id             uuid not null references auth.users (id) on delete cascade,
  status              public.attempt_status not null default 'in_progress',
  started_at          timestamptz not null default now(),
  deadline_at         timestamptz not null,
  submitted_at        timestamptz,
  last_seen_at        timestamptz not null default now(),
  question_order      uuid[],                  -- exam_question ids, for shuffled delivery
  score               numeric(7, 2),
  max_score           numeric(7, 2),
  correct_count       int,
  incorrect_count     int,
  unanswered_count    int,
  time_spent_seconds  int,
  created_at          timestamptz not null default now(),
  check (deadline_at > started_at),
  check ((status = 'in_progress') = (submitted_at is null))
);
create unique index exam_attempts_one_open on public.exam_attempts (exam_id, user_id) where status = 'in_progress';
create index exam_attempts_user_idx on public.exam_attempts (user_id, started_at desc);

create table public.attempt_answers (
  id                  uuid primary key default gen_random_uuid(),
  attempt_id          uuid not null references public.exam_attempts (id) on delete cascade,
  exam_question_id    uuid not null references public.exam_questions (id) on delete restrict,
  selected_option_id  uuid references public.question_options (id) on delete set null,
  text_answer         text check (text_answer is null or char_length(text_answer) <= 60000),
  word_count          int,
  flagged             boolean not null default false,  -- mark for review
  time_spent_seconds  int not null default 0,
  is_correct          boolean,                         -- set at submission (MCQ)
  marks_awarded       numeric(6, 2),                   -- set at submission / evaluation
  saved_at            timestamptz not null default now(),
  unique (attempt_id, exam_question_id)
);

-- Written-answer evaluation records. Several may exist per answer, one per
-- method/evaluator; the UI must label each by method.
create table public.evaluations (
  id                uuid primary key default gen_random_uuid(),
  answer_id         uuid not null references public.attempt_answers (id) on delete cascade,
  method            public.evaluation_method not null,
  evaluator_id      uuid references auth.users (id) on delete set null,   -- expert
  ai_job_id         uuid references public.ai_jobs (id) on delete set null, -- ai_feedback
  status            text not null default 'assigned' check (status in ('assigned', 'in_progress', 'completed', 'withdrawn')),
  score             numeric(6, 2),
  max_score         numeric(6, 2),
  rubric_scores     jsonb,              -- [{criterion_id, marks, comment}]
  feedback          text,
  assigned_by       uuid references auth.users (id) on delete set null,
  assigned_at       timestamptz not null default now(),
  completed_at      timestamptz,
  check (method <> 'expert' or evaluator_id is not null),
  check (method <> 'ai_feedback' or ai_job_id is not null)
);
create index evaluations_answer_idx on public.evaluations (answer_id);
create index evaluations_evaluator_idx on public.evaluations (evaluator_id, status);

-- -----------------------------------------------------------------------------
-- Row Level Security
-- -----------------------------------------------------------------------------
alter table public.exams enable row level security;
alter table public.exam_questions enable row level security;
alter table public.exam_attempts enable row level security;
alter table public.attempt_answers enable row level security;
alter table public.evaluations enable row level security;

-- Exam listings (title, duration, instructions) for published exams are public.
-- Access to *start* a premium exam is enforced in start_attempt (Milestone 2/8).
create policy exams_public on public.exams for select to anon, authenticated
  using (status = 'published' or public.has_permission('exams.manage'));
create policy exams_write on public.exams for all to authenticated
  using (public.has_permission('exams.manage')) with check (public.has_permission('exams.manage'));

-- exam_questions reveal question ids; staff only. Delivery uses functions.
create policy exam_questions_staff on public.exam_questions for all to authenticated
  using (public.has_permission('exams.manage')) with check (public.has_permission('exams.manage'));

-- Attempts: owners read their own. All writes go through SECURITY DEFINER
-- functions (no direct insert/update policies for students), so a student can
-- never alter a deadline, score or submission status.
create policy exam_attempts_own on public.exam_attempts for select to authenticated
  using (user_id = auth.uid() or public.has_permission('reports.view') or public.has_permission('evaluations.assign'));

-- Helpers are SECURITY DEFINER to avoid policy recursion between
-- attempt_answers and evaluations.
create or replace function public.owns_answer(_answer_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.attempt_answers aa
    join public.exam_attempts a on a.id = aa.attempt_id
    where aa.id = _answer_id and a.user_id = auth.uid()
  );
$$;

create or replace function public.is_evaluator_for(_answer_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.evaluations e
    where e.answer_id = _answer_id and e.evaluator_id = auth.uid()
  );
$$;
revoke all on function public.owns_answer(uuid) from public;
revoke all on function public.is_evaluator_for(uuid) from public;
grant execute on function public.owns_answer(uuid) to authenticated, service_role;
grant execute on function public.is_evaluator_for(uuid) to authenticated, service_role;

create policy attempt_answers_own on public.attempt_answers for select to authenticated
  using (
    exists (select 1 from public.exam_attempts a where a.id = attempt_id and a.user_id = auth.uid())
    or public.has_permission('evaluations.assign')
    or public.is_evaluator_for(id)
  );

-- Evaluations: the student sees completed evaluations of their own answers;
-- evaluators see their assignments; assigners see all.
create policy evaluations_read on public.evaluations for select to authenticated
  using (
    evaluator_id = auth.uid()
    or public.has_permission('evaluations.assign')
    or (status = 'completed' and public.owns_answer(answer_id))
  );
create policy evaluations_assign on public.evaluations for insert to authenticated
  with check (public.has_permission('evaluations.assign'));
create policy evaluations_update on public.evaluations for update to authenticated
  using ((evaluator_id = auth.uid() and public.has_permission('evaluations.perform')) or public.has_permission('evaluations.assign'))
  with check ((evaluator_id = auth.uid() and public.has_permission('evaluations.perform')) or public.has_permission('evaluations.assign'));
