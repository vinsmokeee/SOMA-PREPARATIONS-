import "server-only";
import type { SupabaseClient } from "@supabase/supabase-js";
import { splitQuestions } from "./parse";
import { extractPdf, sha256 } from "./pdf";

export const BUCKET = "source-documents";

export type DocumentMeta = {
  title: string;
  document_type: "past_paper" | "answer_key" | "syllabus" | "announcement" | "rules" | "result" | "other";
  exam_year: number | null;
  stage: "PE" | "ME" | null;
};

export type ProcessOutcome =
  | { kind: "created" | "new_version"; documentId: string; candidates: number; warnings: string[] }
  | { kind: "unchanged" | "duplicate"; documentId: string; message: string }
  | { kind: "error"; message: string; documentId?: string };

type LogEntry = { at: string; step: string; message: string };

/** Records progress on an import job so failures are visible in the admin. */
export class JobLog {
  private entries: LogEntry[] = [];
  constructor(private db: SupabaseClient, private jobId: string) {}
  static async start(db: SupabaseClient, userId: string, source: { url?: string; filename?: string; type: string }) {
    const { data, error } = await db
      .from("import_jobs")
      .insert({ url: source.url ?? null, filename: source.filename ?? null, requested_type: source.type, requested_by: userId, status: "fetching", attempts: 1 })
      .select("id")
      .single();
    if (error) throw new Error(`Could not create import job: ${error.message}`);
    return new JobLog(db, data.id);
  }
  get id() {
    return this.jobId;
  }
  async step(step: string, message: string, status?: string, extra: Record<string, unknown> = {}) {
    this.entries.push({ at: new Date().toISOString(), step, message });
    await this.db.from("import_jobs").update({ log: this.entries, ...(status ? { status } : {}), ...extra }).eq("id", this.jobId);
  }
  async fail(message: string, documentId?: string) {
    await this.step("error", message, "failed", { error_message: message, finished_at: new Date().toISOString(), ...(documentId ? { document_id: documentId } : {}) });
  }
}

/**
 * Registers the bytes of a document (from a URL or an upload), with duplicate
 * and version detection, then extracts text and stages candidate questions.
 * Runs as the signed-in user: Row Level Security applies to every write.
 */
export async function ingestDocument(opts: {
  db: SupabaseClient;
  userId: string;
  job: JobLog;
  bytes: Uint8Array;
  meta: DocumentMeta;
  source: { origin: "url"; url: string; normalized: string; host: string } | { origin: "upload"; filename: string; storagePath: string };
}): Promise<ProcessOutcome> {
  const { db, userId, job, bytes, meta, source } = opts;
  const hash = sha256(bytes);
  await job.step("fingerprint", `SHA-256 ${hash.slice(0, 12)}… (${Math.round(bytes.byteLength / 1024)} KB)`);

  // Same URL seen before?
  let existing: { id: string; current_sha256: string | null; title: string } | null = null;
  if (source.origin === "url") {
    const { data } = await db.from("source_documents").select("id, current_sha256, title").eq("url_normalized", source.normalized).maybeSingle();
    existing = data;
    if (existing && existing.current_sha256 === hash) {
      await db.from("source_documents").update({ last_retrieved_at: new Date().toISOString() }).eq("id", existing.id);
      await job.step("duplicate", "This link was imported before and the document has not changed.", "duplicate_unchanged", { document_id: existing.id, finished_at: new Date().toISOString() });
      return { kind: "unchanged", documentId: existing.id, message: `Already imported as “${existing.title}”. The document has not changed.` };
    }
  }

  // Same file content recorded under another document?
  {
    const { data: same } = await db.from("source_documents").select("id, title").eq("current_sha256", hash).maybeSingle();
    if (same && same.id !== existing?.id) {
      await job.step("duplicate", `Identical file already recorded as “${same.title}”.`, "duplicate_unchanged", { document_id: same.id, finished_at: new Date().toISOString() });
      return { kind: "duplicate", documentId: same.id, message: `This exact file is already recorded as “${same.title}”.` };
    }
  }

  // Store the original privately.
  let storagePath: string;
  if (source.origin === "upload") {
    storagePath = source.storagePath;
  } else {
    storagePath = `documents/${hash}.pdf`;
    const { error } = await db.storage.from(BUCKET).upload(storagePath, bytes, { contentType: "application/pdf", upsert: true });
    if (error) {
      await job.fail(`Could not store the file: ${error.message}`);
      return { kind: "error", message: "The file could not be stored. Please try again." };
    }
  }
  await job.step("stored", `Stored privately at ${storagePath}.`, "extracting");

  // Extract text.
  let pages: string[] = [];
  let pageCount = 0;
  let likelyScanned = false;
  try {
    const ex = await extractPdf(bytes);
    pages = ex.pages;
    pageCount = ex.pageCount;
    likelyScanned = ex.likelyScanned;
  } catch (e) {
    await job.fail(`Text extraction failed: ${e instanceof Error ? e.message : String(e)}`);
    return { kind: "error", message: "The PDF could not be read. It may be damaged or password-protected." };
  }
  const text = pages.map((p, i) => `[[page ${i + 1}]]\n${p}`).join("\n\n");
  await job.step("extracted", `${pageCount} pages, ${text.length.toLocaleString("en")} characters${likelyScanned ? " — looks scanned (little text)" : ""}.`, "classifying");

  // Create or update the document and its version.
  const now = new Date().toISOString();
  let documentId: string;
  let versionNumber = 1;
  if (existing) {
    documentId = existing.id;
    const { data: last } = await db.from("source_document_versions").select("version_number").eq("document_id", documentId).order("version_number", { ascending: false }).limit(1).maybeSingle();
    versionNumber = (last?.version_number ?? 0) + 1;
    const { error } = await db.from("source_documents").update({ current_sha256: hash, storage_path: storagePath, last_retrieved_at: now, page_count: pageCount, processing_status: "extracted" }).eq("id", documentId);
    if (error) {
      await job.fail(`Could not update the document: ${error.message}`, documentId);
      return { kind: "error", message: "The document could not be updated.", documentId };
    }
  } else {
    const { data, error } = await db
      .from("source_documents")
      .insert({
        origin: source.origin,
        url: source.origin === "url" ? source.url : null,
        url_normalized: source.origin === "url" ? source.normalized : null,
        host: source.origin === "url" ? source.host : null,
        original_filename: source.origin === "upload" ? source.filename : null,
        title: meta.title,
        publisher: "Royal Civil Service Commission",
        document_type: meta.document_type,
        exam_year: meta.exam_year,
        stage: meta.stage,
        first_retrieved_at: now,
        last_retrieved_at: now,
        current_sha256: hash,
        mime_type: "application/pdf",
        storage_path: storagePath,
        page_count: pageCount,
        processing_status: "extracted",
        created_by: userId,
      })
      .select("id")
      .single();
    if (error) {
      await job.fail(`Could not record the document: ${error.message}`);
      return { kind: "error", message: "The document could not be recorded." };
    }
    documentId = data.id;
  }

  const { data: version, error: vErr } = await db
    .from("source_document_versions")
    .insert({ document_id: documentId, version_number: versionNumber, sha256: hash, byte_size: bytes.byteLength, storage_path: storagePath, extracted_text: text, page_count: pageCount, retrieved_by: userId, change_summary: versionNumber > 1 ? "The source document changed since the previous retrieval." : "First retrieval." })
    .select("id")
    .single();
  if (vErr) {
    await job.fail(`Could not record the version: ${vErr.message}`, documentId);
    return { kind: "error", message: "The document version could not be recorded.", documentId };
  }

  // Stage candidate questions (only for papers and answer keys).
  const warnings: string[] = [];
  let staged = 0;
  if (likelyScanned) warnings.push("This PDF looks scanned (it contains little or no text). Questions could not be extracted automatically; they need to be typed in or processed with OCR.");
  if (meta.document_type === "past_paper" && !likelyScanned) {
    const split = splitQuestions(pages);
    warnings.push(...split.warnings);
    if (split.candidates.length) {
      const rows = split.candidates.map((c) => ({
        document_id: documentId,
        version_id: version.id,
        number: c.number,
        section: c.section,
        stem: c.stem || "(empty)",
        options: c.options,
        answer_label: c.answer_label,
        answer_source: c.answer_source,
        page: c.page,
        confidence: c.confidence,
        issues: c.issues,
      }));
      const { error } = await db.from("import_candidates").insert(rows);
      if (error) {
        await job.fail(`Could not stage the extracted questions: ${error.message}`, documentId);
        return { kind: "error", message: "Questions were extracted but could not be saved for review.", documentId };
      }
      staged = rows.length;
    }
  }

  await db.from("source_documents").update({ processing_status: staged ? "awaiting_review" : "extracted" }).eq("id", documentId);
  await job.step("done", staged ? `${staged} candidate questions staged for review.` : "No questions staged.", staged ? "awaiting_review" : "completed", {
    document_id: documentId,
    version_id: version.id,
    finished_at: new Date().toISOString(),
  });
  return { kind: existing ? "new_version" : "created", documentId, candidates: staged, warnings };
}
