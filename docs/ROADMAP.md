# Roadmap and feature status

Each milestone ends with a completion report and requires the founder's
approval before the next one starts.

| # | Milestone | Status |
| --- | --- | --- |
| 1 | Foundation and website | Complete (deployed) |
| 2 | Examination engine (PE + ME simulation) | Complete (deployed; live exam-room run still to do) |
| 3 | Question bank, historical papers, RCSC import | Complete (deployed; extraction to be tuned on real papers) |
| 4 | Student learning and analytics | Complete (deployed) |
| 5 | AI-assisted ME written-answer evaluation (handwritten + typed) | Complete (deployed; live AI test pending the API key) |
| 6 | AI question intelligence | Complete (deployed; live AI test pending the API key) |
| 7 | Current-affairs intelligence (Bhutan, regional, world) | Complete (deployed; collecting and writing live) |
| 8 | Payments, subscriptions, account security, commercial readiness | Complete (deployed; bank gateway pending the bank) |

### Master plan (2026-11-16) — phases after M8

| Phase | Scope | Status |
| --- | --- | --- |
| 1 | Examination architecture: pathways, 31 specialisations, Paper II groups, paper settings with their source, PE sections, cut-off history, entry-based question delivery | Complete (deployed) |
| 2 | PDF reading (scanned + Dzongkha) and the historical bank (extends M3) | Planned — needs 4 sample PDFs |
| 3 | Daily personalised training | Complete (deployed) |
| 4 | AI question variations (extends M6) | **Built — awaiting approval** |
| 5 | Batch processing and pattern reports (4A + 8) | Planned |
| 6 | Dzongkha reference, integration, launch checks | Planned |

The audit and roadmap are in the founder's doc "Soma Master Plan — Audit and Roadmap".

## Phase 4 — what was built

| Feature | Status |
| --- | --- |
| Variations of a verified question: new scenario, new numbers, another angle, easier, harder, application, new question on the same objective | Built (live AI run pending) |
| Batch: up to 3 questions per run in a subject, least-varied and past-paper questions first | Built |
| Drafts inherit the source's classification (stage, subject, topic, paper, entry, specialisation, Paper II group) and link to it | Built |
| Automatic pre-review check: rule checks, near-copy guard, duplicate check, and an independent AI (different model) that answers each draft without the key | Built — unit-tested |
| Review queue with flagged/passed filters, source shown alongside, batch approve (verify, optionally publish) and reject | Built |
| Origin labels for students in results: past RCSC paper (year), AI variation, AI original, Soma question | Built — SQL-tested |
| Cost per run shown; every call recorded in AI jobs | Built |

Variations reach students only after a reviewer approves them; then they flow into
practice and daily plans automatically.

## Phase 3 — what was built

| Feature | Status |
| --- | --- |
| A plan for today for every student, created automatically on first visit each day (no admin work) | Built — SQL-tested |
| Repeating cycle (default 30 days): foundation → development → improvement → revision; exam-readiness when the exam date is near | Built — SQL-tested |
| Practice chosen from the student's own pathway/entry: least-covered section first (coverage), weakest section in the improvement phase, unseen questions first, nothing answered in the last 3 days | Built |
| Spaced repetition of mistakes (1, 3, 7, 14, 30 days; mastered after box 5) | Built — SQL-tested |
| Weak-topic sets, Question of the Day, written-answer practice (ME pathways) | Built |
| Weekly tests (days 7/14/21/28), fortnightly revision tests (15/29), monthly mock (last day; a published mock when one fits, otherwise generated) | Built — SQL-tested |
| Streaks with rest days (one missed day forgiven per rest day, earned every 7 days), 13 badges, personal bests, weekly challenge | Built — SQL-tested |
| "Today's training" card on the dashboard and a full training page | Built — browser-tested (preview harness) |
| Evening streak reminders and a Sunday weekly report (in-app; e-mail once a provider is set) | Built |
| Admin: Daily training page with usage figures and editable plan settings | Built |

Not built (by design or later): leaderboards (optional; privacy-sensitive, can be added opt-in);
plans are only as good as the published question bank — with few questions, plans are short.

## Phase 1 — what was built

| Feature | Status |
| --- | --- |
| ME pathways shown as General / Technical / Dzongkha Graduates; Administrative, Finance and PGDE kept as separate internal entries | Built — SQL-tested |
| B.Ed kept but not offered (cannot be chosen or bought) | Built — SQL-tested |
| 31 technical specialisations as given; 4 possible duplicates flagged, not merged; admin can add, rename, deactivate | Built |
| Paper II groups (unverified, not linked); Paper III per specialisation; unclassified Paper II/III questions never served | Built — SQL-tested |
| Per-paper marks, duration, question count, qualifying mark, and where each value came from (official / brief / admin) | Built |
| PE sections: English, Dzongkha, Aptitude, Data Interpretation (no fifth section) | Built |
| PE eligibility: "PE required" per specialisation left unset until checked; rule notes per category | Built |
| PE cut-off history shown as reference only | Built |
| Students choose pathway, category and specialisation; entry locked while ME access is active (admin can change it) | Built — SQL-tested |
| Practice, written practice and the exam list only show the student's entry | Built — SQL-tested |
| New formats: translation, passage-based, case study; question source year/page; AI-variation origin | Built |
| Separate PE (Nu 699, 45 days) and ME (Nu 799, 45 days, coming soon) packages; combined package hidden | Built |
| "Soma trains the written ME; academic marks and viva also count" note on ME, packages and written pages | Built |


## Milestone 1 — what works

| Feature | Status | Notes |
| --- | --- | --- |
| Public website (16 pages) | Working | Home, About, PE, ME, Packages, Free practice, Samples, Current affairs, Resources, Contact, FAQ, Terms, Privacy, Disclaimer, 404, error |
| Responsive design | Working | Tested at desktop and phone sizes; no horizontal scrolling on any public page |
| Official BCSE structure | Working | From the BCSE 2026 announcement, stored as data with citations; editable in admin |
| Packages page | Working | Prices from the database (Nu. 499 / Nu. 799); both "coming soon" |
| Contact form | Working — verified live | Validated server action, honeypot, RLS insert-only |
| Registration / sign-in / email confirmation / sign-out | Working — verified on the live site (15 Nov 2026) | Password reset built; not yet exercised live |
| Route protection | Working | proxy redirects + server-side checks + RLS |
| Student dashboard | Foundation | Overview (real attempt/entitlement queries, empty states), profile editing |
| Admin dashboard | Foundation — verified live with the founder account | Overview, exam structure, syllabus, packages, users & roles, messages, audit log |
| Database (40+ tables, RLS, triggers) | Working | 6 SQL test suites pass on PostgreSQL 16 |
| Super admin bootstrap | Done for the founder (via Supabase table editor) | `npm run admin:bootstrap -- <email>` remains available |

## Known placeholders (clearly labelled in the UI)

- Free practice, sample examinations: pages explain they open after review/M2.
- Dashboard items "PE practice", "ME practice", "Examination history",
  "Historical papers", "Performance", "Packages & access": shown as later
  milestones, not clickable.
- Admin modules for M2–M8: shown with milestone labels, not clickable.
- "Purchasing opens soon" buttons are disabled with an explanation.
- Logo: a typographic wordmark is used until the official file is supplied.
- Legal pages carry a "Draft for legal review" notice.

## Milestone 8 — what was built

| Feature | Status |
| --- | --- |
| Provider-independent payment interface, webhook endpoint, server-side verification, duplicate protection, reconciliation, refunds | Built — unit- and SQL-tested |
| Sandbox test gateway (admins only) for the full automated flow | Built — tested |
| Manual payments: instructions and accounts set in admin, reference + screenshot, admin approve/reject with audit trail, reused-reference and amount warnings, can be switched off | Built — SQL-tested |
| Configurable packages: price, promo price, duration or fixed end, pathway, entry group, programme, feature list, AI evaluations, renewable, coupons allowed; create packages | Built |
| Subscriptions: new, renewal (extends expiry), expiry, pending, failed, refund, complimentary, promotional, manual extension, suspension and restoration — all recorded | Working — SQL-tested |
| Coupons: percent / fixed, limits, per-student limit, dates, package- and student-specific, server-side validation | Working — SQL-tested |
| Account security: device cookie, session tracking, 2-device limit with real revocation, risk signals with e-mail-link verification, flags for admin review, restrict/restore, student Security page | Working — SQL-tested; e-mail links use Supabase's default sender (rate-limited) |
| Student: checkout, payment page, My subscription, notifications, short onboarding | Built |
| Admin: Orders & payments (overview, approvals, orders, subscriptions, coupons, reconciliation, settings, CSV exports), Account security | Built |
| Reports: collected (net of refunds) by day / period / package, pending, failed, renewals, active / expiring / expired | Built — SQL-tested |
| Notifications: in-app for all events; e-mail adapter (Resend) ready | In-app working; e-mail needs a domain |
| Policies: subscription terms, refund policy (placeholders in [brackets]), account-sharing policy, privacy updates | Drafts for legal review |

Pending external dependencies: bank merchant gateway (documents, credentials,
approval); own domain + e-mail provider for e-mail notifications and branded auth
e-mails; Vercel Pro before commercial sales; Supabase Pro recommended for backups;
legal review of the policy pages.

## Milestone 7 — what was built

| Feature | Status |
| --- | --- |
| Source registry (14 starting feeds: Bhutanese outlets, UN, WHO, IMF, Indian, Nepali, Bangladeshi and international outlets), health tracking, back-off, add/switch off in admin | Built — first live run verifies each feed |
| Collection every 3 hours (Supabase Cron → secured endpoint), SSRF-safe feed fetching, RSS/Atom parsing, 7-day freshness window, duplicate URLs ignored | Built — parser and rules unit-tested |
| AI triage (relevance, Bhutan/regional/world, category, fact vs opinion, developing, sensitive) with a cheap model | Built — needs the API key |
| Story grouping across outlets; verification status (official / confirmed by 2+ / single source / developing / conflicting / opinion) | Working — unit-tested |
| Learning notes grounded in numbered sources (key facts cite sources; background, why it matters, relevance to Bhutan, dates, names) | Built — needs the API key |
| Questions: MCQ, true/false, fill-in-the-blank (PE) and short-answer / analytical (ME), linked to the story, labelled Soma AI-generated | Built — needs the API key |
| Automatic publishing when rules pass (founder decision); sensitive, single-source, developing, conflicting, opinion and low-confidence stories held | Working — rules unit-tested |
| Daily: Bhutan / Regional / World today, Question of the Day; weekly challenge and monthly assessment built automatically; personalised practice; archive with search | Built — access rules SQL-tested |
| Free: last 7 days and Question of the Day; packages: archive, assessments, personalised practice | Working — SQL-tested |
| Admin: overview, run log with errors, held-story review, edit / publish / unpublish / reject, collected articles, sources, categories, settings (quotas, budget, model, sensitive terms) | Built |
| Daily AI budget cap, one run at a time, time limits | Built |

Dependencies: AI steps need `ANTHROPIC_API_KEY`; the scheduler and pipeline need
`SUPABASE_SECRET_KEY` in Vercel. Without the AI key, articles are collected and wait
("awaiting AI"). The future Soma AI Knowledge Assistant can reuse the structured,
source-linked stories (full-text search index included).

Known limitations: feeds that block automated access fail and must be replaced;
news-site content is limited to what their RSS feeds provide (rights); quality of
notes and questions has not yet been checked on live output.

## Milestone 5 — what was built

| Feature | Status |
| --- | --- |
| Two answer methods per written question, chosen per question: type, or upload photos of handwritten pages | Built — browser-tested (desktop + mobile) |
| Photo handling on the phone: camera or gallery, multiple pages, preview, rotate, crop, quality checks (blur, dark, glare, blank, small, cut-off), compression, reorder, remove | Built — checks unit-tested, flow browser-tested |
| Private storage of answer sheets (owner + authorised staff only) | Working — SQL-tested |
| Handwriting reading by AI with [unclear] marking, confidence and retake prompts; student must check and confirm the text; edits measured and flagged | Built — rules unit-tested, confirmation SQL-tested; live reading needs the API key |
| One evaluation engine for both methods: rubric / reference answer / key points / alternatives / subject criteria; server-side mark limits; no score without an approved guide; prompt-injection fencing | Built — rules unit-tested; live evaluation needs the API key |
| Feedback: indicative marks by criterion, strengths, missing points, inaccuracies, structure, suggestions, confidence, weakness tags; improved answer on request | Built — browser-tested with fixture data |
| Written practice (one question, optional timer) and ME examination simulation with an upload window after time ends | Built — SQL-tested |
| Allowances: free 3 in total, PE + ME package 100 (configurable); failed or withdrawn evaluations not counted | Working — SQL-tested |
| Submission history, written-answer analytics and advice in Performance | Built |
| Admin: answer guides on questions, subject criteria, quality review with photos, withdraw, student reports, settings, usage and cost | Built |

Known limitations: AI handwriting reading and evaluation have not yet been run
live (needs `ANTHROPIC_API_KEY` and `SUPABASE_SECRET_KEY` in Vercel); Dzongkha
handwriting is Beta and may be unreliable; background AI work runs inside the
request's time budget (up to 5 minutes) rather than a separate job queue; photo
crop is edge trimming, not free-form; evaluation quality must be monitored in
admin, especially early on.

## Milestone 6 — what was built

| Feature | Status |
| --- | --- |
| Provider-agnostic AI layer (`lib/ai`), Claude adapter with structured outputs and server-side refusal fallback | Built — unit-tested with a mocked SDK; live call needs `ANTHROPIC_API_KEY` |
| Question-bank coverage analysis: per subject/topic by status, origin, difficulty; topics without ready questions; past-paper questions per year | Working — SQL-tested |
| AI drafting of original MCQs (PE) and written questions with model answers and rubrics (ME), with style examples and "avoid these" stems from the bank | Built |
| Automatic checks on every draft: 4 distinct options, one answer, explanation, no all/none of the above, rubric totals, safe reference links, near-duplicate (≥ 80 % similar) and exact-duplicate rejection | Working — unit-tested |
| Drafts saved as **AI generated**, linked to their AI job; reviewer sees the model's confidence and what to fact-check | Built |
| Past-paper pattern analysis (frequent topics, styles, difficulty, trends) — descriptive, never a prediction | Built — usable once real papers are imported |
| AI job log with model, tokens, fallback flag and errors | Built |
| Guarantee: AI drafts cannot be verified or published without a person (database trigger) | Working — SQL-tested |

Known limitations: generation runs inside the request (up to 5 minutes, 10
questions per run); no Dzongkha generation; AI-cited references must be checked
by the reviewer; fact accuracy depends on human review.

## Milestone 4 — what was built

| Feature | Status |
| --- | --- |
| Practice builder: stage, subject, topic, difficulty, number of questions, time limit, mode (unseen first / only unseen / only mistakes) | Built — SQL-tested |
| Free accounts practise free-sample questions; premium unlocks the full bank | Working — SQL-tested |
| Review my mistakes (questions last answered incorrectly) | Working — SQL-tested |
| Performance page: totals, accuracy trend chart, accuracy by subject, weakest topics, time per question | Built — charts browser-tested (desktop + mobile, keyboard tooltips, table view) |
| Readiness indicator per stage (Building foundations / Developing / Strong) with reasons, labelled as a Soma estimate | Built — unit-tested; never shown as a pass probability |
| Recommendations with one-tap targeted practice; dashboard progress cards, coverage, pending revision | Built |

Notes: analytics count objective questions only; written ME answers are counted
separately and reviewed against model answers.

## Milestone 3 — what was built

| Feature | Status |
| --- | --- |
| Upload many PDFs at once (year/stage guessed from file names) | Built |
| Import from an RCSC link with SSRF protection, duplicate and version detection | Built — unit-tested; live RCSC fetch may be refused by the site (then upload) |
| Text extraction and question splitter (sections, inline/line options, inline answers, answer-key sections, issue flags) | Working — unit-tested and checked end-to-end on a generated PDF; to be tuned on real RCSC papers |
| Candidate review: edit, choose answer and its source, accept as drafts, reject, re-run extraction | Built |
| Historical paper library (admin), build a timed practice examination from a paper | Built |
| Permissions: record written permission with letter, apply to past papers by year | Built |
| Publish rule: reproduced papers need authorised rights | Working — SQL-tested |
| Student past-paper library by year and stage | Built |
| Question bank: CSV import with row-by-row validation and template, filters (subject, type, difficulty, origin), pagination, bulk review | Built |

Known limitations: scanned PDFs need OCR (flagged, not processed); images and tables
inside questions are not extracted; the splitter is tuned to common layouts and will
be adjusted to the real papers.

## Milestone 2 — what was built

| Feature | Status |
| --- | --- |
| Examination engine (database functions, server time, autosave, idempotent submit, auto-submit, marking) | Working — SQL-tested |
| Student: examination list, instructions + confirmation, resume notice | Built |
| Exam room: countdown, one question at a time, palette, mark for review, previous/next, autosave with retry and device backup, OMR answer sheet, final review, submit confirmation, automatic submission | Working — browser-tested (desktop + mobile) via the preview harness |
| ME written mode: word counts, debounced autosave, recovery | Working — browser-tested |
| Results: score, accuracy, correct/incorrect/unanswered, subject breakdown, revision suggestions, time analysis, explanations, model answers, rubrics, evaluation labels | Built |
| Examination history | Built |
| Admin question bank: create/edit MCQ and written questions, options, rubrics, references, similar-question check, review workflow with history | Built |
| Admin exam builder: settings, add/reorder/remove questions, publish rules | Built |
| Sample content: 16 PE + 2 ME original questions (awaiting founder review), 2 draft sample exams | Ready to apply |

Known limitations: option order is not shuffled per attempt (question order can be);
exam stems are plain text (no images or tables yet); no Dzongkha sample questions
(need a Dzongkha specialist); expert evaluation of written answers is Milestone 5.

## Milestone 2 — original plan

Exam delivery functions (`start_attempt`, `get_attempt_paper`, `save_answer`,
`submit_attempt`, auto-submit), the PE examination interface (instructions,
timer, palette, mark-for-review, autosave, OMR-style sheet, final review,
results with explanations and subject breakdown), the ME written interface
(word counts, autosave, recovery, review, submission, model answers and
rubrics), exam builder in admin, a small set of verified sample questions,
and mobile/desktop testing of the whole flow.
