# Testing

| Command | What it checks |
| --- | --- |
| `npm run lint` | ESLint (Next.js core-web-vitals + TypeScript rules) |
| `npm run typecheck` | Route types + `tsc --noEmit` |
| `npm test` | Vitest unit tests: formatting, redirect safety, all zod schemas, ME grouping on migration data, promotional pricing |
| `npm run test:db` | Applies every migration to a fresh local PostgreSQL 16 database and runs `supabase/tests/*.sql`: role escalation, profile isolation, question-bank and answer-key protection, publication workflow, reference-data integrity, purchases/entitlements, attempt tampering, contact form, admin functions |
| `npm run test:e2e` (exam room) | `tests/e2e/exam-room.spec.ts` drives the real exam room through `/dev/exam-preview` (fixture mode only): answering, flags, palette, OMR sheet, review, confirmation, failed-save retry, reload recovery, automatic submission, ME word counts and autosave |
| `npm run test:e2e` | Playwright on a production build, desktop + mobile: every public page (status, no JS errors, no horizontal scroll), official PE/ME content, prices, disabled purchase, FAQ, 404, protected-route redirects, form validation, invalid email links, mobile menu |

## Running everything locally

```bash
# PostgreSQL 16 must be running locally with user postgres/postgres
npm run test:db
npm run db:fixtures          # refresh JSON fixtures from the migrated test DB
npm test
SOMA_PUBLIC_DATA=fixture npm run build
npm run test:e2e
```

## Manual checks on the live site (15 November 2026)

Production: https://soma-preparations.vercel.app (Vercel, `main` branch) with the
Supabase project `ihmyqurrogrodtodxfef`.

| Check | Result |
| --- | --- |
| Public ME/PE structure read from Supabase | Pass |
| Registration → confirmation email → dashboard | Pass |
| Founder granted `super_admin`; `/admin` overview with live counts | Pass |
| Contact form insert (anon) → admin inbox → status update | Pass |
| Audit log records role changes | Pass |
| Admin forms show saved values after save | Fixed (forms were reset to stale values by React's automatic form reset) |

## What is NOT covered yet

- Password reset email round-trip on the live site.
- Profile save, and saving exam-structure/package edits through the live admin.
- Automated (Playwright) tests with a signed-in session against a dedicated
  Supabase test project.

The database rules these flows rely on **are** tested by `npm run test:db`.
Once Supabase credentials are available, the first task of Milestone 2 is to run
these flows manually and add authenticated Playwright tests against a dedicated
test project.
