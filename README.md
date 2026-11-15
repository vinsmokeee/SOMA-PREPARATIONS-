# Soma Preparations

**Prepare. Practice. Progress.**

An examination-preparation platform for the Bhutan Civil Service Examination
(BCSE), conducted by the Royal Civil Service Commission (RCSC): Preliminary
Examination (PE) and Main Examination (ME) preparation, realistic timed
simulations, verified questions with explanations and performance analytics.

Soma is independent of the RCSC.

## Status

Milestone 1 (foundation and website) is complete and awaiting approval. See
[docs/ROADMAP.md](docs/ROADMAP.md) for what works, what is a placeholder and
what comes next.

## Stack

Next.js 16 (App Router) · TypeScript · Tailwind CSS 4 · shadcn-style components ·
Supabase (Postgres, Auth, Storage) · Vercel. Tests: Vitest, Playwright, SQL suite
on PostgreSQL 16.

## Quick start

```bash
npm install
SOMA_PUBLIC_DATA=fixture npm run dev     # public site without Supabase
```

Full setup (Supabase, founder account, deployment): [docs/SETUP.md](docs/SETUP.md).

## Scripts

| Script | Purpose |
| --- | --- |
| `npm run dev` / `build` / `start` | Next.js |
| `npm run lint` · `npm run typecheck` | Static checks |
| `npm test` | Unit tests |
| `npm run test:db` | Migrations + SQL security tests on local PostgreSQL |
| `npm run test:e2e` | Playwright (desktop + mobile) |
| `npm run db:fixtures` | Export public reference data from the test DB |
| `npm run admin:bootstrap -- <email>` | Grant the Super Administrator role |

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Database](docs/DATABASE.md)
- [RCSC link import workflow](docs/RCSC_IMPORT.md)
- [Environment variables](docs/ENVIRONMENT.md)
- [Setup & deployment](docs/SETUP.md)
- [Testing](docs/TESTING.md)
- [Roadmap & feature status](docs/ROADMAP.md)

## Project layout

```
src/app/(site)       public website
src/app/(auth)       sign-in, registration, password reset
src/app/auth         email-link and sign-out route handlers
src/app/dashboard    student area
src/app/admin        administration
src/components       ui/ (design system), site/, app/, brand/
src/lib              auth (DAL, permissions), data (public data), supabase clients, validation
src/proxy.ts         session refresh + optimistic route protection
supabase/migrations  database schema, RLS and reference data
supabase/tests       SQL security & integrity tests
scripts/             db test harness, fixture export, admin bootstrap
tests/               unit and end-to-end tests
```
