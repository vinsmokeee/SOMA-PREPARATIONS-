# Setup and deployment

## 1. Local development

```bash
npm install
cp .env.example .env.local      # fill in Supabase values, or leave empty and…
SOMA_PUBLIC_DATA=fixture npm run dev   # …browse public pages without Supabase
```

## 2. Create the Supabase project

1. Create a project at supabase.com (choose a region close to Bhutan, e.g.
   Singapore or Mumbai).
2. Apply the migrations: `npx supabase link --project-ref <ref>` then
   `npx supabase db push` (or run each file in `supabase/migrations/` in order in
   the SQL editor).
3. Auth → URL configuration and email templates: see
   [ENVIRONMENT.md](ENVIRONMENT.md#supabase-auth-settings).
4. Copy the project URL, publishable key and secret key into `.env.local`.

### Current project (created 15 November 2026)

- Project: **Soma Preparation**, region Asia-Pacific, ref `ihmyqurrogrodtodxfef`
  (`https://ihmyqurrogrodtodxfef.supabase.co`).
- Migrations `0100`–`1000` applied through the Management API; migration history
  matches the files in `supabase/migrations`.
- **Still to do (needs the production URL):** Auth → Site URL, redirect URLs, the
  email templates in `supabase/templates/` (confirmation, recovery; set the
  subjects to "Confirm your Soma Preparations account" and "Reset your Soma
  Preparations password"), password minimum length 8 with letters + digits, and a
  custom SMTP sender.

## 3. Create the Super Administrator (founder)

1. Register on the website with the founder's email and confirm it.
2. On a trusted computer:
   ```bash
   NEXT_PUBLIC_SUPABASE_URL=… SUPABASE_SECRET_KEY=… npm run admin:bootstrap -- you@example.com
   ```
3. Sign in again — "Administration" appears in the dashboard menu.

(Alternative in the Supabase SQL editor:
`insert into public.user_roles (user_id, role) select id, 'super_admin' from auth.users where email = 'you@example.com';`)

## 4. Branding

Place the official logo file in `public/brand/` and set `logo.src`, `width` and
`height` in `src/config/site.ts`. The file is displayed exactly as supplied.

## 5. Deploy to Vercel

1. Import the GitHub repository in Vercel (framework: Next.js).
2. Set the environment variables from [ENVIRONMENT.md](ENVIRONMENT.md) for
   Production and Preview. Do **not** set `SOMA_PUBLIC_DATA` in production.
3. Deploy. Update Supabase's Site URL and redirect URLs to the production domain.
4. Smoke test: register, confirm email, sign in, open `/admin` as founder,
   edit a paper description, confirm it appears on `/me`.
