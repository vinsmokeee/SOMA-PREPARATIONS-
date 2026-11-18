# Handover — read this first in a new conversation

Last updated: 2026-11-16. This note lets a new Claude session continue the work
without the previous chat. Keep it up to date at the end of every working session.

## Where we stopped (18 Nov 2026)

1. **Founder sent two Dzongkha reference books** (18 Nov) for writing Dzongkha questions:
   - *Dzongkha–English Dictionary*, 2nd ed., © Dzongkha Development Commission 2013 (1180 pages).
   - *The Grammar of Dzongkha* (Karma Tshering & George van Driem, Himalayan Linguistics, 2019; 720 pages),
     licence **CC BY-NC-ND 4.0 — no commercial use, no derivatives**.
   - **They are NOT in the repo** (the GitHub repo is public and both are copyrighted). In the same chat
     session they are at `/root/.claude/uploads/1e5440e4-299a-59c5-8896-aa7b23e5c884/795d0da8-PP-XII-Dzongkha-English-Dictionary.pdf`
     and `.../4dc21deb-eScholarship_UC_item_1h4211k0.pdf`; if missing, ask the founder to send them again.
   - Use them only as **reference**: write our own questions (word meanings, particles, spelling, sentence
     order, grammar rules). Do not copy example sentences or pages from the grammar book into the app.
     The founder said words may be copied from the dictionary (single words/meanings are fine).
   - Text layer: grammar book reads fine; the dictionary text layer **drops stacked letters** (e.g.
     བསླབ་བ comes out as བསབ་བ) — always check Dzongkha spelling against the page image (`pdftoppm -png -r 150 -f N -l N`).
2. **Dzongkha batch 1 WRITTEN (18 Nov):** 54 questions in `scripts/past-papers/new_dz_batch1.py` → `supabase/data/new_dz_batch1.sql`
   (17 honorific ཞེ་ས, 17 opposites འགལ་མིང, 8 word meanings, 12 genitive/ergative particles; each cites the dictionary
   printed page = PDF page − 13). Test-loaded on local DB OK. **NOT loaded live yet** — waiting for founder's
   "Yes, load the new questions"; then load via Management API (as batch 1 PE), founder publishes in /admin/ai/review
   after a Dzongkha speaker checks. Dictionary parsing tip: in `pdftotext` (non-layout) output, \uf041 = OPP, \uf062 = HON,
   \uf044 = synonym, \uf069 = other spelling.
   Original plan for this step: Dzongkha questions batch 1 (~40, BCSE PE Dzongkha style as in the 2010/2011 papers), as a
   new module like `scripts/past-papers/new_pe_batch1.py` with `sec: 'dzongkha'` → `build_new_questions.py`
   → test load locally → ask founder "Yes, load the new questions" → founder publishes. Mark them clearly:
   **a fluent Dzongkha speaker must check before publishing.**
3. Then PE batch 2 (~60 English/Aptitude/DI); ME past papers when sent; on-hold three-paper layout (below).

## Earlier stop (17 Nov 2026, evening)

1. **Next task:** PE question batch 2 (another ~60 English/Aptitude/DI), same method as batch 1
   (`scripts/past-papers/new_pe_batch1.py` → `build_new_questions.py` → load as drafts → founder publishes in
   /admin/ai/review: "Select all that passed" → "Approve and publish", 50 per page).
2. **Founder will send:** Dzongkha–English dictionary PDFs (for Dzongkha questions) and ME past papers
   (RCSC pages: General, Dzongkha, Technical I/II/III, B.Ed., CSCE 2009).
3. **On hold:** three paper sections + automatic Paper II groups (see "ON HOLD" below) until the founder confirms
   the specialisation → Paper II grouping with RCSC.
4. **Drafts waiting:** 48 Dzongkha past-paper questions (need a Dzongkha speaker), 26 less-certain past-paper
   questions (status revision_requested) to recheck.
5. Live DB changes always need the founder's explicit "yes, apply"; publishing must be done by the founder.

## The founder and how to work with them

- Non-technical; works on an iPhone. Wants **step-by-step**, **one step at a time**,
  plain words, short messages. Sends screenshots. Does not want jargon or long options lists.
- **Do not change the live site or live database without explicit approval.** Build and
  test first; show screenshots; then one pull request to merge. Avoid many small PRs.
- Do not ask the founder to publish/unpublish content during development.
- Always give direct links (GitHub PR, site pages, Supabase/Vercel settings pages).
- Never invent RCSC exam rules; mark unconfirmed values ("from the founder's brief").
- No guaranteed-success claims. AI content needs human review (except current affairs, see CLAUDE.md).

## Accounts and services

| Service | Detail |
| --- | --- |
| Site | https://soma-preparations.vercel.app (private: access code in Vercel env `SITE_ACCESS_CODE`, Production only) |
| Code | GitHub `vinsmokeee/SOMA-PREPARATIONS-`; work branch `claude/soma-bcse-platform-sr39ur`; founder merges PRs on `main` |
| Hosting | Vercel team `soma-9932`, project `soma-preparations` (Hobby plan) |
| Database | Supabase project `ihmyqurrogrodtodxfef` (free plan). Migrations applied through the Management API; then set the version in `supabase_migrations.schema_migrations` |
| AI | Anthropic API key in Vercel (`ANTHROPIC_API_KEY`); prepaid credit, auto-reload off; current-affairs budget $0.50/day |
| Email | **No email service yet** (Supabase built-in: 2/hour, owner only). "Confirm email" is **OFF** (founder's choice): sign-up needs no email; emails only for new-device checks and password reset |
| Payments | Manual + T Bank QR (admin approval); sandbox gateway for tests; no bank gateway yet |

The founder's master plan audit is a Claude Doc: "Soma Master Plan — Audit and Roadmap".

## What is built (all live)

M1–M8 (site, exam engine, imports, practice/analytics, AI written-answer marking,
AI question drafts, current affairs with 3-hourly scheduler, payments/subscriptions/security),
private preview mode, and master-plan phases:

- **Phase 1 Exam architecture:** General/Technical/Dzongkha pathways (B.Ed hidden), 31
  specialisations (duplicates flagged), Paper II groups (unlinked until verified), per-paper
  settings with source, PE four sections, cut-off history (reference only), entry-based
  delivery, PE Nu 699 / ME Nu 799 (ME "coming soon"), ME final-result note.
- **Phase 3 Daily training:** daily plan, 30-day cycle, spaced revision, weekly/fortnightly
  tests, monthly mock, streaks with rest days, badges, reminders, admin page.
- **Phase 4 AI variations:** variations of verified questions, independent AI check,
  review queue with batch approve/reject, origin labels for students. Runs in the background.
- **New student look (PR #29, merged):** home → choose PE or ME → (ME: choose entry) → Free or
  Premium → the exam's own home. Returning students go straight back to their exam. Top bar:
  profile left, logo centre, bell right. Bottom tabs follow the exam. PE is saffron, ME maroon
  (`data-exam="ME"` in `globals.css`). Preview with sample data: `/dev/home-preview?screen=…`
  (fixture build only).
- **Results:** coloured score card, last year's cut-off as a reference, section bars and a rule-based
  "Your coach" card (`src/lib/exam/coach.ts`): marks lost per section, tips, pace (too fast /
  out of time), skip advice.
- **Mock tests:** Free gets one PE test per Bhutan day (`start_attempt`). Premium makes a new
  test each time (`create_mock_test`), with about 1 in 10 questions the student got wrong
  before. ME Free gets 3 AI marks. Free PE: one practice OR mock test a day in total
  (daily plan and Question of the Day not counted). Migrations `20261127000100`,
  `20261128000100` and `20261129000100` are applied live.
- **Student pages (PR #30, #31):** Back button on every student page, coloured PE / ME switch button,
  coloured public packages page, maroon ME entry boxes, About Soma + benefits below the PE/ME
  choice, "Why go Premium?" below Free/Premium. Payment wording is left out until the founder confirms it.
- **PR #32 (merged):** bottom bar is Home + News only; no PE/ME button (Back on an exam home goes to
  the PE/ME choice; "Change exam" is in the profile menu); ME "Change entry" link; "Free · see
  Premium" badge; News page has a "Practise with the news" box on top (now purple), news below.
- **PR #33/#34 (merged):** founder's logo (public/brand/soma-logo.png, never crop or alter; resized
  copies for header and icons). Each news area shows today's or latest stories, empty areas hidden.
  `ca.config.allow_single_source` = true (founder chose Yes). Device rule (migration `20261130000100`,
  live): new-device risk counts kinds of device ("Safari on iPhone"), not browser cookies, because
  in-app browsers (Gmail, Messenger) on one phone each get a cookie. The device e-mail link only
  works in the browser that requested it (PKCE): tell the founder to press-hold, copy, paste.
- **Past papers (PR #35, merged; loaded live):** BCSE 2010 + 2011 PE, 198 questions as `awaiting_review`
  drafts (origin `historical_official`, linked to `historical_papers`). Pictures under `public/papers/` via
  `questions.image_url` (migration `20261201000100`). Dzongkha shown as pictures of the original print;
  only 9 Dzongkha answers chosen (2010), 41 need a Dzongkha speaker. 4 low-confidence items flagged in the
  review comments. Source data and scripts: `scripts/past-papers/`. Next: founder reviews and publishes,
  then generate twisted/similar/new questions (goal ~500) and ME changes the founder will list.
- **ME structure (PR #36/#37, merged; migration `20261202000100` live):** six categories all offered;
  Education Service (B.Ed.) with General / Dzongkha graduate types (separate Paper I and II, shared III);
  Technical Paper I = "Languages and General Knowledge"; BCSE 2025 Paper III list (48) selectable, CSCE 2009
  list (31) kept inactive for old papers (`list_source`, `offered_years`); students choose their Paper II group
  (`profiles.subject_group_id`, 8 RCSC 2025 groups; spec→group mapping not published). Unclassified ME content
  is never served. 124 past-paper PE questions published; 48 Dzongkha + 26 less-certain remain drafts.
  Next: founder sends ME past papers (RCSC pages: General, Dzongkha, Technical I/II/III, B.Ed., CSCE 2009).
- **Speed (PR #38):** `vercel.json` runs functions in hnd1 (Tokyo) next to the Supabase DB (ap-northeast-1);
  pages were slow when functions ran in iad1. Founder confirmed it is fast now.
- **ON HOLD (founder confirming with RCSC):** "three paper sections per entry + Paper II group set automatically
  from the specialisation" (commit 8df8bd3, PR #39 closed unmerged; reverted on the branch). Restore by reverting
  the "Put on hold" commit once the founder confirms the specialisation → Paper II grouping. The live site keeps
  the previous flow (student chooses the Paper II group).
- **Free PE (PR #41, live; migration `20261205000100`):** free accounts get ONE 25-question test a day (about 6 per
  section) from the whole published PE bank, then "Join Premium"; the daily allowance is shared with practice sets
  (`free_pe_used_today`). Premium: full 100-question mock tests, unlimited.
- **Question of the Day (PR #40, live; migration `20261204000100`):** one question per Bhutan day; the News page shows
  "already answered" with a link to the result; blank time-outs start again; 10 minutes allowed.
- **New PE questions:** batch 1 (60, Claude-written; 13 twists linked to past papers) published by the founder via
  /admin/ai/review. Data: `scripts/past-papers/new_pe_batch1.py` → `build_new_questions.py` → `supabase/data/`.
  PE published MCQs now: Aptitude 66, English 61, DI 55, Dzongkha 2. Next: more batches (goal ~500); Dzongkha
  questions once the founder sends the Dzongkha–English dictionary PDFs (need a Dzongkha speaker to check).

See `docs/ROADMAP.md` for detail.

## Open items (in order)

1. **Founder is testing the new student look on the live site** and will send changes. Show
   **screenshots first** (a `/dev/home-preview` screen plus Playwright on an iPhone profile), then
   one PR. Vercel preview links need a Vercel login, so screenshots are the reliable way.
   Inner pages (practice, exams list, written) still use the older layout with the new colours.
2. **Founder's change list** — they will send more changes after testing with friends.
3. **Phase 2 (old papers):** waiting for PDFs (PE, Technical, General, Dzongkha ME samples).
   Then Dzongkha–English dictionary/reference books.
4. **Content:** only a handful of published questions; plans are short until papers/variations are added.
5. **Before launch:** real email service (Brevo or Resend), email check before payment,
   one real QR test payment, Vercel Pro + Supabase Pro (~$45/month), domain, policy blanks
   and legal check, confirm RCSC facts (paper marks/durations, PE exemptions, Paper II groups),
   final launch checks (Phase 6), logo.
6. Phase 5 (batch PDF processing, pattern reports) after Phase 2.
7. Two old current-affairs questions say "According to the note…" / "According to The Hindu
   report…" — to archive later (ids 3d4b2b6e-…, 672bb8d3-…).

## Working rules for the code

See `CLAUDE.md`. Checks before any PR: lint, typecheck, unit, SQL (`npm run test:db`, needs a
local PostgreSQL), build with `SOMA_PUBLIC_DATA=fixture`, Playwright.
