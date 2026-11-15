"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

async function guard(permission: Parameters<typeof assertPermission>[0]): Promise<ActionState | null> {
  try {
    await assertPermission(permission);
    return null;
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
}

const qualitySchema = z.object({ id: z.uuid(), quality: z.enum(["good", "problem"]), note: z.string().trim().max(2000).optional() });

export async function markQualityAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("evaluations.assign");
  if (denied) return denied;
  const parsed = qualitySchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("evaluations").update({ quality_status: parsed.data.quality, quality_note: parsed.data.note || null }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "Could not save the review." };
  revalidatePath(`/admin/evaluations/${parsed.data.id}`);
  revalidatePath("/admin/evaluations");
  return { status: "success", message: "Saved." };
}

export async function withdrawEvaluationAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("evaluations.assign");
  if (denied) return denied;
  const parsed = z.object({ id: z.uuid(), note: z.string().trim().min(5, "Give a reason (shown in the audit trail).").max(2000) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("evaluations").update({ status: "withdrawn", quality_status: "problem", quality_note: parsed.data.note }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "Could not withdraw the evaluation." };
  revalidatePath(`/admin/evaluations/${parsed.data.id}`);
  revalidatePath("/admin/evaluations");
  return { status: "success", message: "Withdrawn. The student can request a new evaluation, and this one no longer counts towards their allowance." };
}

export async function resolveReportAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("evaluations.assign");
  if (denied) return denied;
  const parsed = z.object({ id: z.uuid(), status: z.enum(["resolved", "dismissed"]), resolution: z.string().trim().min(3, "Add a short note.").max(2000) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Invalid request." };
  const db = await createClient();
  const { data: { user } } = await db.auth.getUser();
  const { error } = await db.from("evaluation_reports").update({ status: parsed.data.status, resolution: parsed.data.resolution, resolved_by: user?.id ?? null, resolved_at: new Date().toISOString() }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "Could not update the report." };
  revalidatePath("/admin/evaluations");
  return { status: "success", message: "Report updated." };
}

const settingsSchema = z.object({
  free_total: z.coerce.number().int().min(0).max(1000),
  me_package_total: z.coerce.number().int().min(0).max(10000),
  upload_window_minutes: z.coerce.number().int().min(0).max(240),
  max_pages: z.coerce.number().int().min(1).max(50),
  max_page_kb: z.coerce.number().int().min(256).max(8192),
  dzongkha_handwriting: z.preprocess((v) => v === "on", z.boolean()),
  instructions: z.string().trim().max(4000),
});

export async function saveEvaluationSettingsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("settings.manage");
  if (denied) return denied;
  const parsed = settingsSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the values." };
  const db = await createClient();
  const { error } = await db.from("app_settings").upsert({ key: "evaluation.config", value: parsed.data, is_public: false });
  if (error) return { status: "error", message: "Could not save settings." };
  revalidatePath("/admin/evaluations");
  return { status: "success", message: "Settings saved." };
}

export async function saveSubjectCriteriaAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("syllabus.manage");
  if (denied) return denied;
  const parsed = z.object({ id: z.uuid(), criteria: z.string().trim().max(10000) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("subjects").update({ assessment_criteria: parsed.data.criteria || null }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: "Could not save." };
  revalidatePath("/admin/evaluations");
  return { status: "success", message: "Saved." };
}
