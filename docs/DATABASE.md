# Database

All schema lives in `supabase/migrations/` (applied in filename order). The
migrations are tested on plain PostgreSQL 16 with a minimal Supabase stub
(`scripts/db/supabase-stub.sql`) by `npm run test:db`.

| Migration | Contents |
| --- | --- |
| `…0100_foundation` | Enums, `profiles`, `permissions`, `role_permissions`, `user_roles`, authorisation helpers, `audit_logs`, `app_settings`, new-user trigger |
| `…0200_sources_and_exam_structure` | `source_documents` (+versions), `exam_frameworks`, `exam_cycles`, `exam_categories`, `exam_papers`, `exam_paper_categories`, `me_components`, `subjects`, `topics` |
| `…0300_content` | `import_jobs`, `historical_papers`, `ai_jobs`, `ca_sources`, `ca_items`, `questions`, `question_options`, `question_references`, `rubric_criteria`, `content_reviews`, `study_resources` |
| `…0400_exams_and_attempts` | `exams`, `exam_questions`, `exam_attempts`, `attempt_answers`, `evaluations` |
| `…0500_commerce_and_support` | `packages`, `package_items`, `orders`, `payments`, `entitlements`, `contact_messages`, `has_stage_access()` |
| `…0600_reference_data` | Verified BCSE structure from official RCSC documents, initial packages |
| `…0700_public_read_functions` | `get_official_citations()` |
| `…0800_admin_functions` | `admin_list_users()`, `admin_overview_counts()` |
| `…0900_function_privileges` | Revokes EXECUTE on trigger functions from all client roles and on signed-in-only helpers from `anon` (Supabase's default privileges grant it directly) |
| `…1000_platform_function_privileges` | Revokes client EXECUTE on Supabase's `rls_auto_enable()` helper when present |
| `20261116000100_exam_engine` | Examination engine: `start_attempt`, `get_attempt_paper`, `save_answer`, `submit_attempt`, `get_attempt_result`, `finalize_expired_attempts`, `exam_catalogue`; answer-key guards on options/rubrics; exam publish rule; duplicate detection (`content_hash`, `find_similar_questions`) |
| `20261116000200_question_authoring` | `save_question` (atomic question + options + rubric + references), `review_question` (workflow transitions with completeness checks and review history), exam builder helpers `add/remove/move_exam_question` |
| `20261117000100_imports_and_papers` | `usage_permissions`; uploads in `source_documents` (origin, filename, permission link, content-hash uniqueness); `import_candidates` staging; import jobs from uploads; publish rule for reproduced papers; `exam_catalogue` with paper year/credit; private Storage bucket `source-documents` with staff-only policies |
| `20261118000100_learning_analytics` | Personal practice sets (`exams.owner_id`, private to their owner, excluded from the catalogue); `create_practice_set` (filters, unseen-first selection, mistakes mode, free-sample limit for free accounts, daily cap); `practice_options`; `my_performance` (totals, subject/topic accuracy, trend, coverage, pending mistakes) — all scoped to the caller |
| `20261120000100_written_evaluation` | Written-answer evaluation: answer method and handwriting transcript on `attempt_answers`; `answer_pages`; private bucket `answer-sheets`; answer guides (`questions.key_points`, `alternative_answers`) and `subjects.assessment_criteria`; structured AI fields and queue states on `evaluations`; `evaluation_reports`; `evaluation.config` setting; functions for pages, transcription, confirmation, evaluation requests and allowances, improved answers, written practice, history, analytics and usage |
| `20261119000100_ai_intelligence` | `question_bank_analysis()` (coverage by subject/topic/status/origin/difficulty, past-paper questions per year; staff only); index on `questions.ai_job_id` |

Sample content (not a migration — applied once, then managed in admin):
`supabase/content/m2_sample_content.sql` — 16 original PE questions and 2 ME
questions, all **awaiting review**, plus two draft sample examinations.

## Entity overview

```
auth.users 1─1 profiles
auth.users 1─* user_roles *─* role_permissions ─* permissions

exam_frameworks 1─* exam_papers *─* exam_categories   (exam_paper_categories)
exam_frameworks 1─* me_components (per category)
exam_frameworks 1─* exam_cycles
exam_papers 1─* subjects 1─* topics (self-referencing for subtopics)

source_documents 1─* source_document_versions
source_documents 1─* historical_papers
import_jobs  → source_documents / versions

questions 1─* question_options | question_references | rubric_criteria
questions  → subject, topic, paper, category, historical_paper, ca_item, ai_job
content_reviews → (question | ca_item | study_resource | historical_paper)

exams 1─* exam_questions → questions
exams 1─* exam_attempts 1─* attempt_answers 1─* evaluations

packages 1─* package_items
orders → package, user;  payments → order;  entitlements → user, package, order
```

## Key decisions

**Official information is data with provenance.** Frameworks, cycles and papers
carry `verification_status` and `source_document_id`. Unknown official values
(e.g. PE duration, which the recorded announcement does not state) are `NULL`
and the site says "Not stated in the recorded RCSC source" — never a guess.
Categories and papers are many-to-many so a paper shared by Administrative,
Finance and PGDE is stored once; category-specific weightage overrides live on
the link table.

**Frameworks vs cycles.** A framework (e.g. BCSR 2023) defines papers and
weightages; a cycle (e.g. BCSE 2027) is one year's examination and points at a
framework. When RCSC changes rules, add a new framework and mark it current —
historical cycles keep their original structure.

**Rights are tracked per source document.** `source_documents.usage_status`
(`unknown`, `research_only`, `permission_requested`, `authorised`,
`not_permitted`) gates whether historical content may be shown to students.
Public availability is not treated as permission.

**Duplicate detection & versioning.** `source_documents.url_normalized` is
unique, so re-importing a URL finds the existing record. Each retrieval with
different bytes adds a `source_document_versions` row (unique on
`(document_id, sha256)`), preserving history. Questions carry a `content_hash`
(exact duplicates, unique among non-archived rows) and a trigram index on the
stem (near-duplicates, via `pg_trgm` similarity).

**One status vocabulary for reviewable content.** `content_status`:
`draft → ai_generated → awaiting_review → (revision_requested) → verified →
published` (+ `rejected`, `archived`). A trigger on `questions` enforces:
published requires verified first; verification requires `questions.review`;
publication requires `questions.publish`; reviewers alone may edit content of
verified/published questions; `version` increments on content edits.
`content_reviews` keeps the full review history.

**Answer keys never reach students directly.** No student/anon policy exists on
`questions`, `question_options`, `exam_questions` or `rubric_criteria`.

**Attempts are server-authoritative.** `deadline_at` is fixed at start; a
partial unique index allows one `in_progress` attempt per user per exam (this is
how interrupted sessions resume instead of duplicating); students have no
insert/update policy, so all writes will go through SECURITY DEFINER functions
(M2) that check the deadline and make submission idempotent.

**Evaluation methods are explicit.** `evaluations.method` is `automated`,
`ai_feedback` or `expert`; constraints require an evaluator for expert marks and
an AI job for AI feedback, so the UI can always label feedback truthfully.

**Prices are data; access is an entitlement.** Orders snapshot the amount.
Access is granted only by an `entitlements` row, which only `payments.verify`
holders (or a verified gateway callback using the secret key) can create.
`has_stage_access(stage)` is the single access check.

**Audit log.** `audit_row_change()` triggers on roles, settings, structure,
questions, exams, packages, orders, payments and entitlements write
before/after JSON with `auth.uid()` as actor. Clients cannot insert, update or
delete audit rows.

**Authorisation helpers.** `has_permission`, `has_role`, `is_staff`,
`is_super_admin`, `my_permissions`, `owns_answer`, `is_evaluator_for` are
`SECURITY DEFINER` with `search_path = ''` to prevent search-path attacks and
policy recursion.

## Examination engine (Milestone 2)

- **Server-authoritative time.** `start_attempt` fixes `deadline_at`. `save_answer`
  rejects writes after the deadline plus a 10-second grace for answers already in
  flight (`attempt_save_grace()`); `time_spent_seconds` is measured to the deadline at most.
- **Resume, never duplicate.** A partial unique index allows one open attempt per
  user and exam; `start_attempt` returns the open attempt (and handles the race of
  two simultaneous starts).
- **Lazy closing.** Any call that touches an expired attempt closes it as
  `auto_submitted` (`close_if_expired`). `finalize_expired_attempts()` exists for
  an optional scheduled job (service role only).
- **Idempotent submission.** `finalize_attempt` locks the row and does nothing if
  the attempt is already closed.
- **Marking.** Objective answers are marked against the key, with optional
  negative marking per exam. Written answers are never auto-marked; `evaluations`
  records automated / AI-assisted / expert feedback separately.
- **No leakage.** `get_attempt_paper` returns no `is_correct`, explanations or
  model answers; `get_attempt_result` refuses until the attempt is submitted.
- **Content safety.** Only reviewers can change options or rubrics of verified or
  published questions; an exam can be published only when all its questions are
  published; questions cannot be removed from exams that students have taken.

## Imports and historical papers (Milestone 3)

- **Two entry points.** Admins upload PDFs (browser → private Storage → server
  processing) or paste a link to an approved host (server fetch with SSRF
  protection: HTTPS only, host allow-list in `app_settings.imports.allowed_hosts`
  defaulting to rcsc.gov.bt, public-IP DNS check, every redirect re-validated,
  25 MB / 30 s limits, PDF signature check).
- **Duplicates and versions.** A re-imported URL with identical bytes is reported
  as unchanged; changed bytes create a new `source_document_versions` row. The
  same file uploaded twice is detected by its SHA-256.
- **Staging, not publishing.** Extracted questions land in `import_candidates`.
  Reviewers edit them, choose answers (recorded as official key or set by Soma),
  then accept them as **draft** questions with a source reference.
- **Rights.** `usage_permissions` records written permission (scope, years,
  conditions, credit line, copy of the letter). A historical examination can be
  published only when its paper's source document is `authorised`.

## Supabase security advisor

After applying all migrations, the advisor reports `*_security_definer_function_executable`
warnings for helpers that clients may call by design: `has_permission`, `is_staff`
and `get_official_citations` (anon + authenticated), and `has_role`,
`is_super_admin`, `my_permissions`, `owns_answer`, `is_evaluator_for`,
`has_stage_access`, `admin_list_users`, `admin_overview_counts` (authenticated).
Each either reveals only facts about the caller or raises unless the caller holds
the required permission (covered by `supabase/tests`). A later clean-up may move
the RLS helpers into a non-exposed `private` schema to silence these warnings.

## Applying migrations to Supabase

```bash
npx supabase login
npx supabase link --project-ref <ref>
npx supabase db push        # applies supabase/migrations in order
```

Or paste each migration, in order, into the Supabase SQL editor.

## Written-answer evaluation (Milestone 5)

- **Students never write marks.** Every request runs a SECURITY DEFINER function as
  the student (ownership, attempt closed, upload window, transcript confirmed,
  allowance). The AI result is written afterwards by the server with the secret key.
- **Photos.** Uploaded straight from the browser into `answer-sheets/<user>/<answer>/…`;
  Storage policies allow the owner (and `evaluations.assign` staff) only, and only
  while the answer still accepts pages.
- **Handwriting must be confirmed.** `confirm_transcript` stores the student's
  corrected text and the edit ratio (1 − trigram similarity to the AI reading).
- **Allowance.** `my_evaluation_allowance()` counts AI evaluations that are not
  failed or withdrawn — lifetime for free accounts, since the entitlement start for
  ME packages.

