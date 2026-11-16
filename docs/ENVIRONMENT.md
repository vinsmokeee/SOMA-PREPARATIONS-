# Environment variables

Copy `.env.example` to `.env.local` for local development. On Vercel, set the
same variables in Project → Settings → Environment Variables.

| Variable | Where used | Secret? | Required | Purpose |
| --- | --- | --- | --- | --- |
| `NEXT_PUBLIC_SUPABASE_URL` | browser + server | No | Yes (production) | Supabase project URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | browser + server | No (RLS protects data) | Yes (production) | Supabase publishable key (`sb_publishable_…`), or the legacy `anon` key |
| `SUPABASE_SECRET_KEY` | server only (`lib/supabase/admin.ts`, scripts) | **Yes** | **Yes for AI evaluation (M5)**, bootstrap script | Supabase secret key (`sb_secret_…`) or legacy `service_role` key. Bypasses RLS. Never prefix with `NEXT_PUBLIC_`. |
| `NEXT_PUBLIC_SITE_URL` | server | No | Yes (production) | Canonical URL, used in email links (e.g. `https://somapreparations.bt`) |
| `NEXT_PUBLIC_SUPPORT_EMAIL` | browser + server | No | Optional | Shown on the contact page when set |
| `SOMA_PUBLIC_DATA` | server | No | Never in production | `fixture` serves public reference data from `src/lib/data/fixtures` when Supabase is **not** configured (local UI work and automated tests). Ignored when Supabase is configured. |
| `DB_TEST_URL` | test scripts | Local only | Optional | Base Postgres URL for `npm run test:db` (default `postgresql://postgres:postgres@localhost:5432`) |

| `ANTHROPIC_API_KEY` | server only (`lib/ai/anthropic.ts`) | **Yes** | For AI drafting (M6) | Claude API key from console.anthropic.com. Without it the AI page shows "AI is not configured" and nothing else is affected. |
| `AI_PROVIDER` | server | No | Optional | `anthropic` (default). The AI layer is provider-agnostic (`lib/ai/provider.ts`); other adapters can be added. |
| `AI_MODEL` | server | No | Optional | Overrides the default model `claude-opus-5-5`. |

| `SITE_ACCESS_CODE` | server | **Yes** | Optional | **Private preview mode.** When set, every page first asks for this code (stored as a hash in a 30-day cookie) and search engines are told not to index the site. Remove it (and redeploy) to open the site to the public. Use a long code (e.g. 4 random words). |
| `PAYMENT_SANDBOX_SECRET` | server | **Yes** | Optional | Signs test-gateway notifications; defaults to a value derived from `SUPABASE_SECRET_KEY` |
| `RESEND_API_KEY`, `EMAIL_FROM` | server | **Yes** / No | Optional | E-mail notifications (needs your own domain, e.g. `Soma <no-reply@yourdomain>`). Without them notifications are in-app only |
| Bank gateway variables | server | **Yes** | When a bank is integrated | Defined by the bank adapter — see `docs/PAYMENT_INTEGRATION_GUIDE.md` |

### AI usage and cost

Each "Draft questions" run is one Claude API call (logged in `ai_jobs` with
token counts, visible on /admin/ai). With Claude Opus 5.5 ($4 per million input
tokens, $20 per million output tokens) a batch of 10 multiple-choice drafts uses
roughly 3–5k input and 5–8k output tokens — about US$0.12–0.20. Set a monthly
spend limit in the Anthropic console.

Written-answer evaluation (M5), estimated: typed answer US$0.05–0.08; handwritten
answer with 3 pages US$0.08–0.12; improved answer on request about US$0.03–0.05.
Admin → Written-answer evaluation shows usage and an estimated cost. Requests use server-side fallback: if the
model declines a request on safety grounds, Anthropic retries it on another
Claude model, and the job is labelled "fallback model used".

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
