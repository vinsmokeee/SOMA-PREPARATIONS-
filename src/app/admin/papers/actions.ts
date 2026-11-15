"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { toFieldErrors } from "@/lib/validation/auth";

const emptyNull = (v: unknown) => (typeof v === "string" && v.trim() === "" ? null : v);

async function guard(): Promise<ActionState | null> {
  try {
    await assertPermission("papers.manage");
    return null;
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
}

const permissionSchema = z.object({
  title: z.string().trim().min(3).max(200),
  granted_by: z.string().trim().min(2).max(200),
  reference_number: z.preprocess(emptyNull, z.string().trim().max(120).nullable()),
  granted_on: z.preprocess(emptyNull, z.iso.date().nullable()),
  years_from: z.preprocess(emptyNull, z.coerce.number().int().min(1990).max(2100).nullable()),
  years_to: z.preprocess(emptyNull, z.coerce.number().int().min(1990).max(2100).nullable()),
  allows_reproduction: z.preprocess((v) => v === "on", z.boolean()),
  scope: z.string().trim().min(10, "Describe what the permission covers.").max(4000),
  conditions: z.preprocess(emptyNull, z.string().trim().max(4000).nullable()),
  attribution_text: z.preprocess(emptyNull, z.string().trim().max(300).nullable()),
  letter_storage_path: z.preprocess(emptyNull, z.string().regex(/^permissions\/[0-9a-f-]{36}\/[^/]{1,200}$/).nullable()),
});

export async function createPermission(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = permissionSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const db = await createClient();
  const { data: claims } = await db.auth.getClaims();
  const { error } = await db.from("usage_permissions").insert({ ...parsed.data, recorded_by: claims?.claims?.sub });
  if (error) return { status: "error", message: "The permission could not be saved." };
  revalidatePath("/admin/permissions");
  return { status: "success", message: "Permission recorded." };
}

/** Applies a permission to every past-paper document in its year range. */
export async function applyPermission(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const id = z.uuid().safeParse(formData.get("id"));
  if (!id.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { data: p } = await db.from("usage_permissions").select("*").eq("id", id.data).maybeSingle();
  if (!p) return { status: "error", message: "Permission not found." };
  let q = db.from("source_documents").update({ permission_id: p.id, usage_status: p.allows_reproduction ? "authorised" : "research_only", usage_notes: p.scope }).eq("document_type", "past_paper");
  if (p.years_from) q = q.gte("exam_year", p.years_from);
  if (p.years_to) q = q.lte("exam_year", p.years_to);
  const { data, error } = await q.select("id");
  if (error) return { status: "error", message: "The permission could not be applied." };
  await db.from("historical_papers").update({ attribution_text: p.attribution_text }).in("source_document_id", (data ?? []).map((d) => d.id));
  revalidatePath("/admin/imports", "layout");
  return { status: "success", message: `Applied to ${data?.length ?? 0} past-paper document${data?.length === 1 ? "" : "s"}.` };
}

const paperSchema = z.object({
  source_document_id: z.uuid(),
  exam_year: z.coerce.number().int().min(1990).max(2100),
  stage: z.enum(["PE", "ME"]),
  category_id: z.preprocess(emptyNull, z.uuid().nullable()),
  paper_id: z.preprocess(emptyNull, z.uuid().nullable()),
  original_title: z.string().trim().min(3).max(300),
  exam_date: z.preprocess(emptyNull, z.iso.date().nullable()),
  has_official_key: z.preprocess((v) => v === "on", z.boolean()),
});

export async function createHistoricalPaper(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = paperSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const db = await createClient();
  const { data: doc } = await db.from("source_documents").select("usage_status, usage_permissions(attribution_text)").eq("id", parsed.data.source_document_id).maybeSingle();
  const attribution = (doc?.usage_permissions as unknown as { attribution_text: string | null } | null)?.attribution_text ?? null;
  const { data: claims } = await db.auth.getClaims();
  const { data, error } = await db
    .from("historical_papers")
    .insert({ ...parsed.data, attribution_text: attribution, processing_status: "awaiting_review", created_by: claims?.claims?.sub })
    .select("id")
    .single();
  if (error) return { status: "error", message: error.message.includes("historical_papers_source_document_id") ? "This document already has a paper with that stage, category and paper." : "The paper could not be created." };
  // Link already-accepted candidates of this document to the new paper.
  const { data: accepted } = await db.from("import_candidates").select("question_id").eq("document_id", parsed.data.source_document_id).eq("status", "accepted");
  const ids = (accepted ?? []).map((a) => a.question_id).filter(Boolean) as string[];
  if (ids.length) await db.from("questions").update({ historical_paper_id: data.id }).in("id", ids);
  await db.from("import_candidates").update({ historical_paper_id: data.id }).eq("document_id", parsed.data.source_document_id);
  revalidatePath("/admin/papers");
  redirect(`/admin/papers/${data.id}`);
}

const buildSchema = z.object({
  paper_id: z.uuid(),
  title: z.string().trim().min(3).max(200),
  slug: z.string().trim().toLowerCase().regex(/^[a-z0-9-]+$/, "Web address: lowercase letters, numbers and hyphens only."),
  duration_minutes: z.coerce.number().int().min(1).max(600),
  is_free: z.preprocess((v) => v === "on", z.boolean()),
});

/** Creates a draft historical examination containing the paper's questions in their original order. */
export async function buildExamFromPaper(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  try {
    await assertPermission("exams.manage");
  } catch {
    return { status: "error", message: "You need permission to manage examinations." };
  }
  const parsed = buildSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const db = await createClient();
  const { data: paper } = await db.from("historical_papers").select("id, stage, category_id, paper_id, source_document_id, attribution_text").eq("id", parsed.data.paper_id).maybeSingle();
  if (!paper) return { status: "error", message: "Paper not found." };
  const { data: cands } = await db.from("import_candidates").select("question_id, number").eq("historical_paper_id", paper.id).eq("status", "accepted").order("number");
  const qids = (cands ?? []).map((c) => c.question_id).filter(Boolean) as string[];
  if (qids.length === 0) return { status: "error", message: "Accept the paper's questions into the question bank first." };
  const { data: doc } = await db.from("source_documents").select("usage_status").eq("id", paper.source_document_id).maybeSingle();
  const { data: exam, error } = await db
    .from("exams")
    .insert({
      slug: parsed.data.slug,
      title: parsed.data.title,
      description: paper.attribution_text ?? "A past BCSE paper, reproduced with permission.",
      stage: paper.stage,
      kind: "historical",
      historical_paper_id: paper.id,
      category_id: paper.category_id,
      paper_id: paper.paper_id,
      duration_minutes: parsed.data.duration_minutes,
      is_free: parsed.data.is_free,
      omr_mode: paper.stage === "PE",
      is_official_reproduction: doc?.usage_status === "authorised",
      status: "draft",
    })
    .select("id")
    .single();
  if (error) return { status: "error", message: error.message.includes("exams_slug_key") ? "Another examination already uses that web address." : "The examination could not be created." };
  for (const qid of qids) {
    const { error: addErr } = await db.rpc("add_exam_question", { _exam_id: exam.id, _question_id: qid, _section: null });
    if (addErr && !addErr.message.includes("exam_questions_exam_id_question_id_key")) {
      return { status: "error", message: `The examination was created but a question could not be added: ${addErr.message}` };
    }
  }
  await db.from("historical_papers").update({ attempt_eligible: true }).eq("id", paper.id);
  revalidatePath("/admin/exams");
  redirect(`/admin/exams/${exam.id}`);
}

export async function setPaperStatus(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = z.object({ id: z.uuid(), status: z.enum(["draft", "published", "archived"]) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("historical_papers").update({ status: parsed.data.status }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "The status could not be changed." };
  revalidatePath(`/admin/papers/${parsed.data.id}`);
  return { status: "success", message: "Updated." };
}
