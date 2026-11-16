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
| 7 | Current-affairs intelligence (Bhutan, regional, world) | **Built — awaiting approval** |
| 8 | Payments and commercial launch | Not started |

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
