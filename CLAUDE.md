@AGENTS.md

# Soma Preparations — working notes

- **New session? Read docs/HANDOVER.md first** (founder preferences, accounts, what is live, open items).
- **ALWAYS SAVE EVERYTHING (founder, 25 Nov 2026: "no matter what").** After every finished piece of work: commit and push to the session branch and open/update the PR; update docs/HANDOVER.md (where we stopped, what is next); copy any helper script that lives only in the scratchpad into `scripts/me/session-tools/`. Never leave work only in the scratchpad or uncommitted. Do git add, commit and push as separate commands.

- Read docs/ARCHITECTURE.md and docs/DATABASE.md before changing structure.
- **Founder's standing rules (short list; details in docs/HANDOVER.md - follow them without being reminded):**
  - Founder is non-technical, on an iPhone: plain words, short replies, one PR link to merge per change.
  - Accuracy first. Loading papers: the founder sends PDFs subject by subject (~5 per round); Claude says which papers it needs. Target: at least 15 mocks per paper (founder, 28 Nov 2026; was 10).
  - Every older paper follows the LATEST year's layout and marks (scale marks, key points, stem marks, rubric); run the audit after every load.
  - Keep diagram questions with the figure cropped from the paper. Repeats are recorded as appearances, never loaded twice. Uncertain questions are replaced by new ones of the same kind (marked new).
  - Check all drafts in the database before saying a paper is missing.
  - Load to the live database without asking (after tests); ask before anything destructive. Never delete students' answers, marks or history.
  - Never commit RCSC PDFs; never work around the RCSC site block; keep the founder's personal details out of outside requests; never expose keys.
  - Do not write answers for Microbiology/ Biotechnology Paper III again (questions-only drafts). Staff accounts are never subject-locked.
- Official RCSC information is data with a source (`source_documents`). Never hardcode or invent exam rules; leave unknown values NULL.
- Every server action: `assertPermission` → zod validation → write as the user (RLS) → `updateTag`/`revalidatePath`.
- Students must never be able to read `questions`/`question_options` directly.
- AI-generated content is never published without human verification — except current-affairs stories and their questions, which the founder chose (M7) to auto-publish when the verification rules in `src/lib/ca/rules.ts` pass.
- After DB changes: `npm run test:db`, then `npm run db:fixtures` if public reference data changed.
- Before committing: `npm run lint && npm run typecheck && npm test && npm run test:db`; run `npm run test:e2e` after `SOMA_PUBLIC_DATA=fixture npm run build`.
