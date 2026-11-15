# Architecture

Soma Preparations is one Next.js application backed by Supabase. Additional
services (background workers, AI providers, payment gateways) plug into it
later through clear boundaries; nothing in Milestone 1 locks those choices in.

```
                ┌───────────────────────── Vercel ─────────────────────────┐
 Browser ──────▶│ proxy.ts  (session refresh, optimistic redirects)        │
 (phone/PC)     │    │                                                     │
                │    ▼                                                     │
                │ Next.js App Router                                       │
                │  ├─ (site)     public pages — static shell, cached data  │
                │  ├─ (auth)     sign-in / registration / password reset   │
                │  ├─ dashboard  student area — per request                │
                │  ├─ admin      administration — per request              │
                │  ├─ exam       examination engine (M2)                   │
                │  └─ api/jobs   cron-triggered background work (M3, M7)   │
                │                                                          │
                │ lib/auth/dal.ts   ← single place that resolves the user  │
                │ lib/data/*        ← cached public data access            │
                │ lib/supabase/*    ← clients: server / browser / public / │
                │                     admin (secret key, server-only)      │
                │ lib/ai/*          ← provider-agnostic AI layer (M6)      │
                └───────────────┬──────────────────────────────────────────┘
                                │ HTTPS (PostgREST, Auth, Storage)
                ┌───────────────▼──────────── Supabase ────────────────────┐
                │ Postgres  — schema, RLS policies, SECURITY DEFINER        │
                │             functions, audit triggers                     │
                │ Auth      — email + password, email confirmation          │
                │ Storage   — RCSC documents, payment proofs (private)      │
                └──────────────────────────────────────────────────────────┘
```

## Stack

| Concern | Choice | Notes |
| --- | --- | --- |
| Framework | Next.js 16 (App Router, Turbopack, Cache Components) | The preferred stack. Next 16 renames `middleware` to `proxy` and enables Cache Components; see "Rendering" below. |
| Language | TypeScript (strict) | |
| Styling | Tailwind CSS v4 + shadcn-style components | Components are written in-repo in the shadcn pattern (Radix primitives + `cva`). The shadcn CLI was not used because its registry host is not reachable from the build environment; the result is the same: owned, editable source files. |
| Database | Supabase Postgres | All business rules that protect data live in the database (RLS, triggers, check constraints). |
| Auth | Supabase Auth via `@supabase/ssr` | Cookie sessions. The server verifies the JWT with `getClaims()` on every request. |
| Validation | zod 4 | Every server action validates its input. |
| Tests | Vitest (unit), Playwright (end-to-end), SQL test suite on PostgreSQL 16 | |
| Hosting | Vercel + Supabase | |

No stack change from the brief was needed.

## Rendering and caching (Next 16 Cache Components)

- **Public pages** (`src/app/(site)`) are prerendered into a static shell.
  Database-driven parts (exam structure, packages, current affairs) are read
  through `"use cache"` functions in `lib/data/public.ts` with cache tags.
  Admin edits call `updateTag()` so the public site updates immediately.
- **Account state in the public header** is resolved in the browser
  (`AccountLink`), so public pages stay static and fast on slow mobile networks.
- **Dashboard and admin** read the session per request. Their layouts set
  `export const instant = false` and `getCurrentUser()` calls `connection()`,
  guaranteeing they are never prerendered.

## Security model (defence in depth)

1. **proxy.ts** refreshes the session cookie and redirects signed-out visitors
   away from `/dashboard`, `/admin` and `/exam`. This is a convenience, not a
   security boundary.
2. **Data Access Layer** (`lib/auth/dal.ts`): `requireUser`,
   `requirePermission` (pages) and `assertPermission` (server actions) re-check
   identity and permissions on the server for every request.
3. **Row Level Security** on every table. Queries run as the signed-in user, so
   even a bug in application code cannot read or write data the user's role
   does not permit.
4. **Database guards**: triggers enforce the content workflow (nothing is
   published without verification; only reviewers verify; only publishers
   publish), check constraints enforce business rules (e.g. a package cannot be
   sold without an access period), and an append-only audit log records changes
   to sensitive tables with the acting user.
5. **Secrets**: only the publishable key reaches the browser. The secret key is
   read only in `lib/supabase/admin.ts`, which imports `server-only` so any
   client import fails the build.

Students never read the question bank directly: `questions` and
`question_options` (which contain answer keys) have no student policies.
Examination delivery in Milestone 2 uses SECURITY DEFINER functions that return
only what a candidate may see at that moment.

## Roles and permissions

Roles are assigned in `user_roles`; each role maps to permission keys in
`role_permissions`. `super_admin` implicitly holds every permission. Adding a
contributor role later is a data change, not a code change.

| Role | Purpose (initial mapping) |
| --- | --- |
| `student` | Default for every account |
| `super_admin` | The founder. Everything. Granted only by the bootstrap script. |
| `admin` | Everything except role management and settings |
| `content_reviewer` | Review/verify questions, manage syllabus |
| `question_developer` | Draft questions |
| `researcher` | Historical papers and RCSC imports |
| `subject_specialist` | Draft and review questions |
| `content_writer` | Study resources and current affairs |
| `evaluator` | Evaluate written answers |

## Founder-operated administration

Initially one Super Administrator runs everything from `/admin`:

- **Overview** — key counts and a launch checklist.
- **Examination structure** — edit cycles, categories and papers, including
  verification status and the official source behind each value.
- **Subjects & topics** — organise the syllabus tree used by questions and
  analytics.
- **Packages & pricing** — prices, promotions, features, access terms, status.
- **Users & roles** — find accounts, grant/revoke contributor roles.
- **Support messages** — contact-form inbox.
- **Audit log** — who changed what.

Modules for later milestones are visible in the navigation, labelled with the
milestone in which they arrive, and are not clickable.

## Background work (planned)

Claude Code is a development tool, not a runtime dependency. Recurring and
long-running work will run as:

- **Vercel Cron → `/api/jobs/*` route handlers** protected by a `CRON_SECRET`
  header, which claim queued rows (`import_jobs`, `ai_jobs`, current-affairs
  checks) using a lease (`locked_at`) so a job is processed once even if
  invoked twice.
- Jobs that may exceed function time limits are processed in steps (fetch →
  extract → classify), each step persisting its result and status, so a job
  resumes rather than restarts.

See [RCSC_IMPORT.md](RCSC_IMPORT.md) for the import pipeline.

## AI integration (planned, Milestone 6)

`lib/ai/` will expose provider-agnostic functions (`generateQuestions`,
`summariseDocument`, `classify`, `feedbackOnAnswer`) behind an interface with
one adapter per provider. Provider, model and token usage are recorded in
`ai_jobs` for every call. API keys stay server-side. AI output always enters the
database as `ai_generated` and must be reviewed before publication.
