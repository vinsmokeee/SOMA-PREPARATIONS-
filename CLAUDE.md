@AGENTS.md

# Soma Preparations — working notes

- Read docs/ARCHITECTURE.md and docs/DATABASE.md before changing structure.
- Official RCSC information is data with a source (`source_documents`). Never hardcode or invent exam rules; leave unknown values NULL.
- Every server action: `assertPermission` → zod validation → write as the user (RLS) → `updateTag`/`revalidatePath`.
- Students must never be able to read `questions`/`question_options` directly.
- AI-generated content is never published without human verification — except current-affairs stories and their questions, which the founder chose (M7) to auto-publish when the verification rules in `src/lib/ca/rules.ts` pass.
- After DB changes: `npm run test:db`, then `npm run db:fixtures` if public reference data changed.
- Before committing: `npm run lint && npm run typecheck && npm test && npm run test:db`; run `npm run test:e2e` after `SOMA_PUBLIC_DATA=fixture npm run build`.
