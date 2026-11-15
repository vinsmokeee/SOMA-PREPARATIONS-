# Roadmap and feature status

Each milestone ends with a completion report and requires the founder's
approval before the next one starts.

| # | Milestone | Status |
| --- | --- | --- |
| 1 | Foundation and website | Complete (deployed) |
| 2 | Examination engine (PE + ME simulation) | **Built — awaiting live testing and approval** |
| 3 | Question bank, historical papers, RCSC import | Not started |
| 4 | Student learning and analytics | Not started |
| 5 | ME evaluation and expert system | Not started |
| 6 | AI question intelligence | Not started |
| 7 | Current-affairs automation | Not started |
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
