# Environment variables

Copy `.env.example` to `.env.local` for local development. On Vercel, set the
same variables in Project → Settings → Environment Variables.

| Variable | Where used | Secret? | Required | Purpose |
| --- | --- | --- | --- | --- |
| `NEXT_PUBLIC_SUPABASE_URL` | browser + server | No | Yes (production) | Supabase project URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | browser + server | No (RLS protects data) | Yes (production) | Supabase publishable key (`sb_publishable_…`), or the legacy `anon` key |
| `SUPABASE_SECRET_KEY` | server only (`lib/supabase/admin.ts`, scripts) | **Yes** | For bootstrap script, future jobs | Supabase secret key (`sb_secret_…`) or legacy `service_role` key. Bypasses RLS. Never prefix with `NEXT_PUBLIC_`. |
| `NEXT_PUBLIC_SITE_URL` | server | No | Yes (production) | Canonical URL, used in email links (e.g. `https://somapreparations.bt`) |
| `NEXT_PUBLIC_SUPPORT_EMAIL` | browser + server | No | Optional | Shown on the contact page when set |
| `SOMA_PUBLIC_DATA` | server | No | Never in production | `fixture` serves public reference data from `src/lib/data/fixtures` when Supabase is **not** configured (local UI work and automated tests). Ignored when Supabase is configured. |
| `DB_TEST_URL` | test scripts | Local only | Optional | Base Postgres URL for `npm run test:db` (default `postgresql://postgres:postgres@localhost:5432`) |

Planned for later milestones: `CRON_SECRET` (M3), AI provider keys such as
`ANTHROPIC_API_KEY` (M6), payment gateway credentials (M8). All server-only.

## Supabase Auth settings

- Site URL: your production URL.
- Redirect URLs: `https://<domain>/auth/confirm`, `https://<domain>/auth/callback`
  and `http://localhost:3000/**` for development.
- Email templates (Confirm signup, Reset password): use the token-hash link so
  confirmation works across devices, e.g.
  `{{ .SiteURL }}/auth/confirm?token_hash={{ .TokenHash }}&type=signup&next=/dashboard`
  and `…&type=recovery`.
- Configure a custom SMTP sender before launch (Supabase's default sender is
  rate-limited and meant for testing).
