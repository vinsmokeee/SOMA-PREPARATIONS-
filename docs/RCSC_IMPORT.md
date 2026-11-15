# RCSC link import workflow

Goal: the founder pastes an official RCSC link and Soma retrieves, records,
analyses and queues the material for review — first through Claude Code, later
from the admin dashboard without Claude Code.

## Important finding (15 November 2026)

While building Milestone 1, direct retrieval of three RCSC PDFs from
`rcsc.gov.bt/wp-content/uploads/…` succeeded. Requests for RCSC **HTML pages**
(e.g. `/preliminary-examination/`) returned **HTTP 403** with the message:

> "Access Denied — Automated requests are not allowed. This server does not
> allow automated tools to access this website."

Consequences for the design:

- Soma will **not crawl or scrape** rcsc.gov.bt. The importer fetches only the
  **single document URL** an authorised administrator pastes, once, and records
  it. It does not follow links or monitor RCSC pages automatically.
- Scheduled "monitoring" of RCSC for new announcements is **not planned**
  unless RCSC grants permission or offers a feed. Current-affairs monitoring
  (M7) will prioritise sources that permit automated access.
- **Recommendation:** ask the RCSC in writing whether Soma may retrieve and
  analyse published documents, and on what terms past papers may be reproduced.
  Record the answer in each document's `usage_status` / `usage_notes`.

## Phase A — via Claude Code (available now)

When you give me an RCSC document URL in a session I will:

1. Retrieve it (this environment allows `rcsc.gov.bt` and `www.rcsc.gov.bt`).
   If retrieval fails I will say so and ask you for the file — I will never
   pretend to have read it.
2. Compute its SHA-256 and check `source_documents.url_normalized`: an existing
   URL is compared by hash — unchanged → no new record; changed → a new version.
3. Identify year, stage, ME category/paper, title, reference number and date.
4. Extract text (`pdftotext`), split questions/options where the layout allows,
   classify subject/topic/type/difficulty, and note missing or unclear parts.
5. Record answer keys only when officially published.
6. Produce a migration or seed script that inserts the `source_documents` row,
   version, `historical_papers` row and extracted questions with status
   `awaiting_review` and origin `historical_official` — never `published`.
7. Report the pattern analysis and suggest areas for original Soma questions.

## Phase B — in the admin dashboard (Milestone 3)

```
Admin pastes URL ──▶ validate ──▶ import_jobs(queued)
                                     │  cron worker claims job (lease)
                                     ▼
                        fetching ─▶ extracting ─▶ classifying ─▶ awaiting_review
                           │            │              │               │
                     source_documents  versions    AI job (ai_jobs)   admin reviews,
                     (dedupe by URL,   (dedupe by  + draft questions  edits, approves,
                      hash compare)     sha256)     (status draft)    publishes
```

**URL validation (SSRF protection).** Only `https:` URLs whose host is on an
allow-list (`rcsc.gov.bt`, `www.rcsc.gov.bt`, extendable by the Super
Administrator); no credentials, no non-default ports, no IP literals; DNS
results must not resolve to private, loopback or link-local ranges; redirects
are re-validated hop by hop (max 3); response size capped (e.g. 25 MB) and
content type limited to PDF/DOCX/HTML.

**Storage.** Original bytes go to a private Supabase Storage bucket
(`source-documents/<document_id>/<sha256>.pdf`); only staff can read them.

**Extraction.** Text-based PDFs: a server-side PDF text extractor. Scanned PDFs:
flagged `needs_ocr` and left for manual handling or a later OCR step — never
guessed.

**Classification & drafting.** Via the provider-agnostic AI layer; every output
lands as `draft`/`ai_generated` and needs human verification.

**Errors.** Every step appends to `import_jobs.log`; failures set `failed` with
a human-readable `error_message` and can be retried.
