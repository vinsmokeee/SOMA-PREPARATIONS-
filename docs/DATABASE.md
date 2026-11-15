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

## Applying migrations to Supabase

```bash
npx supabase login
npx supabase link --project-ref <ref>
npx supabase db push        # applies supabase/migrations in order
```

Or paste each migration, in order, into the Supabase SQL editor.
