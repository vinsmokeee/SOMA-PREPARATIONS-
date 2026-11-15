"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError, type CurrentUser } from "@/lib/auth/dal";
import { fetchDocument, isPdf, MAX_DOCUMENT_BYTES } from "@/lib/imports/fetch";
import { BUCKET, ingestDocument, JobLog, type DocumentMeta } from "@/lib/imports/process";
import { extractPdf } from "@/lib/imports/pdf";
import { splitQuestions } from "@/lib/imports/parse";
import { checkImportUrl, DEFAULT_ALLOWED_HOSTS } from "@/lib/imports/url";
import { createClient } from "@/lib/supabase/server";
import { toFieldErrors } from "@/lib/validation/auth";

const emptyNull = (v: unknown) => (typeof v === "string" && v.trim() === "" ? null : v);

const metaSchema = z.object({
  title: z.string().trim().min(3, "Give the document a title (e.g. “BCSE 2015 Preliminary Examination”).").max(300),
  document_type: z.enum(["past_paper", "answer_key", "syllabus", "announcement", "rules", "result", "other"]),
  exam_year: z.preprocess(emptyNull, z.coerce.number().int().min(1990).max(2100).nullable()),
  stage: z.preprocess(emptyNull, z.enum(["PE", "ME"]).nullable()),
});

async function guard(): Promise<{ user: CurrentUser } | { error: ActionState }> {
  try {
    return { user: await assertPermission("imports.run") };
  } catch (e) {
    return { error: { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." } };
  }
}

async function allowedHosts(db: Awaited<ReturnType<typeof createClient>>): Promise<string[]> {
  const { data } = await db.from("app_settings").select("value").eq("key", "imports.allowed_hosts").maybeSingle();
  const v = data?.value;
  return Array.isArray(v) && v.every((h) => typeof h === "string") ? (v as string[]) : DEFAULT_ALLOWED_HOSTS;
}

function outcomeState(o: Awaited<ReturnType<typeof ingestDocument>>): ActionState {
  switch (o.kind) {
    case "created":
    case "new_version":
      return {
        status: "success",
        message: `${o.kind === "new_version" ? "New version recorded" : "Document recorded"}${o.candidates ? ` — ${o.candidates} questions extracted for review` : ""}.${o.warnings.length ? ` ${o.warnings.join(" ")}` : ""}`,
      };
    case "unchanged":
    case "duplicate":
      return { status: "success", message: o.message };
    default:
      return { status: "error", message: o.message };
  }
}

/** Import a document from an approved URL (e.g. an RCSC PDF link). */
export async function importFromUrl(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const g = await guard();
  if ("error" in g) return g.error;
  const parsed = metaSchema.extend({ url: z.string().trim().min(10, "Paste the link to the PDF.") }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const { url, ...meta } = parsed.data;
  const db = await createClient();
  const hosts = await allowedHosts(db);
  const check = checkImportUrl(url, hosts);
  if (!check.ok) return { status: "error", message: check.reason };

  const job = await JobLog.start(db, g.user.id, { url: check.url.toString(), type: meta.document_type });
  await job.step("validated", `Link accepted: ${check.normalized}`);
  const fetched = await fetchDocument(check.url.toString(), hosts);
  if (!fetched.ok) {
    await job.fail(fetched.reason);
    return { status: "error", message: fetched.reason };
  }
  await job.step("fetched", `Downloaded ${Math.round(fetched.bytes.byteLength / 1024)} KB.`);
  const outcome = await ingestDocument({
    db,
    userId: g.user.id,
    job,
    bytes: fetched.bytes,
    meta: meta as DocumentMeta,
    source: { origin: "url", url: check.url.toString(), normalized: check.normalized, host: check.url.hostname.toLowerCase() },
  });
  revalidatePath("/admin/imports");
  if ((outcome.kind === "created" || outcome.kind === "new_version") && outcome.documentId) redirect(`/admin/imports/${outcome.documentId}?imported=1`);
  return outcomeState(outcome);
}

/** Register a PDF that the browser has already uploaded to private storage. */
export async function registerUpload(input: { storagePath: string; filename: string } & Record<string, unknown>): Promise<ActionState & { documentId?: string }> {
  const g = await guard();
  if ("error" in g) return g.error;
  const parsed = metaSchema
    .extend({ storagePath: z.string().regex(/^uploads\/[0-9a-f-]{36}\/[^/]{1,200}$/), filename: z.string().min(1).max(255) })
    .safeParse(input);
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const { storagePath, filename, ...meta } = parsed.data;
  const db = await createClient();
  const job = await JobLog.start(db, g.user.id, { filename, type: meta.document_type });
  const { data: blob, error } = await db.storage.from(BUCKET).download(storagePath);
  if (error || !blob) {
    await job.fail(`The uploaded file could not be read from storage: ${error?.message ?? "missing"}`);
    return { status: "error", message: "The uploaded file could not be read. Please upload it again." };
  }
  if (blob.size > MAX_DOCUMENT_BYTES) {
    await job.fail("File larger than 25 MB.");
    return { status: "error", message: "The file is larger than 25 MB." };
  }
  const bytes = new Uint8Array(await blob.arrayBuffer());
  if (!isPdf(bytes)) {
    await job.fail("The uploaded file is not a PDF.");
    return { status: "error", message: "The uploaded file is not a valid PDF." };
  }
  await job.step("uploaded", `Received ${filename} (${Math.round(bytes.byteLength / 1024)} KB).`);
  const outcome = await ingestDocument({ db, userId: g.user.id, job, bytes, meta: meta as DocumentMeta, source: { origin: "upload", filename, storagePath } });
  revalidatePath("/admin/imports");
  return { ...outcomeState(outcome), documentId: "documentId" in outcome ? outcome.documentId : undefined };
}

/** Re-run question extraction on the latest version (e.g. after the splitter is improved). */
export async function reextractDocument(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const g = await guard();
  if ("error" in g) return g.error;
  const id = z.uuid().safeParse(formData.get("id"));
  if (!id.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { data: doc } = await db.from("source_documents").select("id, storage_path, document_type").eq("id", id.data).maybeSingle();
  if (!doc?.storage_path) return { status: "error", message: "The original file is not available." };
  const { data: version } = await db.from("source_document_versions").select("id").eq("document_id", doc.id).order("version_number", { ascending: false }).limit(1).maybeSingle();
  const { data: blob, error } = await db.storage.from(BUCKET).download(doc.storage_path);
  if (error || !blob) return { status: "error", message: "The original file could not be read." };
  const ex = await extractPdf(new Uint8Array(await blob.arrayBuffer()));
  if (ex.likelyScanned) return { status: "error", message: "This PDF looks scanned; there is no text to extract." };
  const split = splitQuestions(ex.pages);
  // Replace only candidates still pending; accepted/rejected decisions are kept.
  await db.from("import_candidates").delete().eq("document_id", doc.id).eq("status", "pending");
  const { data: decided } = await db.from("import_candidates").select("number").eq("document_id", doc.id).neq("status", "pending");
  const done = new Set((decided ?? []).map((d) => d.number));
  const rows = split.candidates
    .filter((c) => c.number === null || !done.has(c.number))
    .map((c) => ({ document_id: doc.id, version_id: version?.id ?? null, number: c.number, section: c.section, stem: c.stem || "(empty)", options: c.options, answer_label: c.answer_label, answer_source: c.answer_source, page: c.page, confidence: c.confidence, issues: c.issues }));
  if (rows.length) {
    const { error: insErr } = await db.from("import_candidates").insert(rows);
    if (insErr) return { status: "error", message: "The extracted questions could not be saved." };
  }
  revalidatePath(`/admin/imports/${doc.id}`);
  return { status: "success", message: `${rows.length} questions extracted for review.${split.warnings.length ? ` ${split.warnings.join(" ")}` : ""}` };
}

const docUpdateSchema = metaSchema.extend({
  id: z.uuid(),
  usage_status: z.enum(["unknown", "research_only", "permission_requested", "authorised", "not_permitted"]),
  permission_id: z.preprocess(emptyNull, z.uuid().nullable()),
  usage_notes: z.preprocess(emptyNull, z.string().trim().max(2000).nullable()),
  published_on: z.preprocess(emptyNull, z.iso.date().nullable()),
  reference_number: z.preprocess(emptyNull, z.string().trim().max(120).nullable()),
});

export async function updateDocument(_prev: ActionState, formData: FormData): Promise<ActionState> {
  try {
    await assertPermission("papers.manage");
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
  const parsed = docUpdateSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const { id, ...rest } = parsed.data;
  if (rest.usage_status === "authorised" && !rest.permission_id) {
    return { status: "error", message: "Link the written permission before marking a document as authorised." };
  }
  const db = await createClient();
  const { data, error } = await db.from("source_documents").update(rest).eq("id", id).select("id");
  if (error || !data?.length) return { status: "error", message: "The document could not be saved." };
  revalidatePath(`/admin/imports/${id}`);
  return { status: "success", message: "Saved." };
}

// ---------------------------------------------------------------------------
// Candidates
// ---------------------------------------------------------------------------

const candidateSchema = z.object({
  id: z.uuid(),
  stem: z.string().trim().min(1).max(20000),
  options: z.array(z.object({ label: z.string().regex(/^[A-H]$/), body: z.string().trim().max(2000) })).max(8),
  answer_label: z.string().regex(/^[A-H]$/).nullable(),
  answer_source: z.enum(["official_key", "soma", "none"]),
  section: z.string().trim().max(200).nullable(),
});

export async function saveCandidate(input: z.input<typeof candidateSchema>): Promise<{ ok: boolean; message: string }> {
  const g = await guard();
  if ("error" in g) return { ok: false, message: g.error.message ?? "Not allowed." };
  const parsed = candidateSchema.safeParse(input);
  if (!parsed.success) return { ok: false, message: "Check the question text, options and answer." };
  const { id, ...rest } = parsed.data;
  const db = await createClient();
  const { data, error } = await db.from("import_candidates").update({ ...rest, issues: [] }).eq("id", id).eq("status", "pending").select("document_id");
  if (error || !data?.length) return { ok: false, message: "The candidate could not be saved (it may already be accepted)." };
  revalidatePath(`/admin/imports/${data[0].document_id}`);
  return { ok: true, message: "Saved." };
}

const acceptSchema = z.object({
  ids: z.array(z.uuid()).min(1).max(300),
  subject_id: z.preprocess(emptyNull, z.uuid().nullable()),
  historical_paper_id: z.preprocess(emptyNull, z.uuid().nullable()),
  marks: z.coerce.number().positive().max(100),
});

/**
 * Turns reviewed candidates into question-bank drafts (status: draft). Questions
 * from past papers keep their source reference and are linked to the paper.
 */
export async function acceptCandidates(input: z.input<typeof acceptSchema>): Promise<{ ok: boolean; message: string; created: number; failed: { id: string; reason: string }[] }> {
  const g = await guard();
  if ("error" in g) return { ok: false, message: g.error.message ?? "Not allowed.", created: 0, failed: [] };
  const parsed = acceptSchema.safeParse(input);
  if (!parsed.success) return { ok: false, message: "Invalid request.", created: 0, failed: [] };
  const db = await createClient();
  const { data: cands } = await db
    .from("import_candidates")
    .select("id, number, stem, options, answer_label, answer_source, status, document_id, source_documents(title, url, stage, exam_year, document_type)")
    .in("id", parsed.data.ids)
    .eq("status", "pending");
  const failed: { id: string; reason: string }[] = [];
  let created = 0;
  for (const c of (cands ?? []) as unknown as {
    id: string; number: number | null; stem: string; options: { label: string; body: string }[]; answer_label: string | null; answer_source: string; document_id: string;
    source_documents: { title: string; url: string | null; stage: "PE" | "ME" | null; exam_year: number | null; document_type: string };
  }[]) {
    const doc = c.source_documents;
    const isMcq = c.options.length >= 2;
    if (isMcq && !c.answer_label) {
      failed.push({ id: c.id, reason: `Question ${c.number ?? "?"}: choose the correct answer first.` });
      continue;
    }
    if (isMcq && !c.options.some((o) => o.label === c.answer_label)) {
      failed.push({ id: c.id, reason: `Question ${c.number ?? "?"}: the answer is not one of the options.` });
      continue;
    }
    const note = c.answer_source === "official_key" ? "Answer from the official answer key." : isMcq ? "Answer provided by Soma — no official answer key was available. Please verify." : "";
    const { data: qid, error } = await db.rpc("save_question", {
      _id: null,
      _q: {
        stage: doc.stage ?? "PE",
        question_type: isMcq ? "mcq" : "descriptive",
        stem: c.stem,
        explanation: "",
        model_answer: "",
        subject_id: parsed.data.subject_id ?? "",
        difficulty: "standard",
        marks: parsed.data.marks,
        origin: doc.document_type === "past_paper" ? "historical_official" : "original",
      },
      _options: isMcq ? c.options.map((o) => ({ body: o.body, is_correct: o.label === c.answer_label })) : [],
      _rubric: [],
      _refs: [{ citation: `${doc.title}${c.number ? `, question ${c.number}` : ""}${note ? ` — ${note}` : ""}`, url: doc.url ?? "" }],
    });
    if (error || !qid) {
      failed.push({ id: c.id, reason: `Question ${c.number ?? "?"}: ${error?.message.includes("content_hash") ? "already in the question bank" : "could not be created"}.` });
      continue;
    }
    if (parsed.data.historical_paper_id) {
      await db.from("questions").update({ historical_paper_id: parsed.data.historical_paper_id }).eq("id", qid as string);
    }
    await db.from("import_candidates").update({ status: "accepted", question_id: qid as string, reviewed_by: g.user.id, reviewed_at: new Date().toISOString(), historical_paper_id: parsed.data.historical_paper_id }).eq("id", c.id);
    created++;
  }
  revalidatePath("/admin/imports", "layout");
  revalidatePath("/admin/questions");
  return { ok: failed.length === 0, message: `${created} question${created === 1 ? "" : "s"} added to the question bank as drafts.${failed.length ? ` ${failed.length} not added.` : ""}`, created, failed };
}

export async function rejectCandidates(input: { ids: string[] }): Promise<{ ok: boolean; message: string }> {
  const g = await guard();
  if ("error" in g) return { ok: false, message: g.error.message ?? "Not allowed." };
  const ids = z.array(z.uuid()).min(1).max(300).safeParse(input.ids);
  if (!ids.success) return { ok: false, message: "Invalid request." };
  const db = await createClient();
  await db.from("import_candidates").update({ status: "rejected", reviewed_by: g.user.id, reviewed_at: new Date().toISOString() }).in("id", ids.data).eq("status", "pending");
  revalidatePath("/admin/imports", "layout");
  return { ok: true, message: `${ids.data.length} rejected.` };
}

/** Short-lived link to download the original file (staff only, via RLS). */
export async function documentDownloadUrl(id: string): Promise<string | null> {
  const g = await guard();
  if ("error" in g) return null;
  if (!z.uuid().safeParse(id).success) return null;
  const db = await createClient();
  const { data: doc } = await db.from("source_documents").select("storage_path").eq("id", id).maybeSingle();
  if (!doc?.storage_path) return null;
  const { data } = await db.storage.from(BUCKET).createSignedUrl(doc.storage_path, 300);
  return data?.signedUrl ?? null;
}
