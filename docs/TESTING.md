# Testing

| Command | What it checks |
| --- | --- |
| `npm run lint` | ESLint (Next.js core-web-vitals + TypeScript rules) |
| `npm run typecheck` | Route types + `tsc --noEmit` |
| `npm test` | Vitest unit tests: formatting, redirect safety, all zod schemas, ME grouping on migration data, promotional pricing |
| `npm run test:db` | Applies every migration to a fresh local PostgreSQL 16 database and runs `supabase/tests/*.sql`: role escalation, profile isolation, question-bank and answer-key protection, publication workflow, reference-data integrity, purchases/entitlements, attempt tampering, contact form, admin functions |
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

## What is NOT covered yet (needs a live Supabase project)

The development environment for Milestone 1 had no Supabase project and could
not run the Supabase Auth server locally, so these were built but not executed
end to end:

- Real sign-up → confirmation email → sign-in → dashboard.
- Password reset email round-trip.
- Admin pages rendering with a real Super Administrator session, and saving
  changes through them.
- Profile save, contact-form insert through PostgREST.

The database rules these flows rely on **are** tested by `npm run test:db`.
Once Supabase credentials are available, the first task of Milestone 2 is to run
these flows manually and add authenticated Playwright tests against a dedicated
test project.
