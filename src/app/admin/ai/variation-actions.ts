"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError, can, getCurrentUser } from "@/lib/auth/dal";
import type { Permission } from "@/lib/auth/permissions";
import { VARIATION_KEYS } from "@/lib/ai/question-variations";
import { generateVariations } from "@/lib/ai/variation-runner";
import { createClient } from "@/lib/supabase/server";

async function guard(...perms: Permission[]): Promise<string | null> {
  try {
    for (const p of perms) await assertPermission(p);
    return null;
  } catch (e) {
    return e instanceof AuthorizationError ? e.message : "Not allowed.";
  }
}

const typesField = (fd: FormData) => z.array(z.enum(VARIATION_KEYS)).min(1, "Choose at least one variation type.").max(7).safeParse(fd.getAll("types"));

export async function generateVariationsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("ai.run", "questions.create");
  if (denied) return { status: "error", message: denied };
  const source = z.uuid().safeParse(formData.get("source_id"));
  const types = typesField(formData);
  if (!source.success) return { status: "error", message: "Choose a source question." };
  if (!types.success) return { status: "error", message: types.error.issues[0]?.message ?? "Choose variation types." };
  const db = await createClient();
  const r = await generateVariations(db, source.data, types.data);
  revalidatePath("/admin/ai/review");
  revalidatePath("/admin/ai");
  return { status: r.ok ? "success" : "error", message: r.ok ? `${r.message} Estimated cost: $${r.cost.toFixed(3)}.` : r.message };
}

/** Variations for several sources in one subject: least-varied sources first, past-paper questions first. */
export async function batchVariationsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("ai.run", "questions.create");
  if (denied) return { status: "error", message: denied };
  const subject = z.uuid().safeParse(formData.get("subject_id"));
  const count = z.coerce.number().int().min(1).max(3).safeParse(formData.get("sources"));
  const types = typesField(formData);
  if (!subject.success || !count.success) return { status: "error", message: "Choose a subject and how many questions to vary." };
  if (!types.success) return { status: "error", message: types.error.issues[0]?.message ?? "Choose variation types." };
  const db = await createClient();
  const { data: candidates } = await db.from("questions").select("id, origin, created_at")
    .eq("subject_id", subject.data).in("status", ["verified", "published"]).is("parent_question_id", null).limit(200);
  if (!candidates?.length) return { status: "error", message: "No verified or published questions in this subject to vary." };
  const { data: kids } = await db.from("questions").select("parent_question_id").in("parent_question_id", candidates.map((c) => c.id)).neq("status", "archived");
  const used = new Map<string, number>();
  for (const k of kids ?? []) used.set(k.parent_question_id as string, (used.get(k.parent_question_id as string) ?? 0) + 1);
  const picked = [...candidates]
    .sort((a, b) => (used.get(a.id) ?? 0) - (used.get(b.id) ?? 0)
      || Number(b.origin === "historical_official") - Number(a.origin === "historical_official")
      || a.created_at.localeCompare(b.created_at))
    .slice(0, count.data);
  let created = 0, flagged = 0, cost = 0;
  const errors: string[] = [];
  for (const p of picked) {
    const r = await generateVariations(db, p.id, types.data);
    created += r.created; flagged += r.flagged; cost += r.cost;
    if (!r.ok) errors.push(r.message);
  }
  revalidatePath("/admin/ai/review");
  revalidatePath("/admin/ai");
  const msg = `${created} variation${created === 1 ? "" : "s"} from ${picked.length} question${picked.length === 1 ? "" : "s"}${flagged ? ` (${flagged} flagged)` : ""}. Estimated cost: $${cost.toFixed(3)}.${errors.length ? ` Problems: ${[...new Set(errors)].join(" ")}` : ""}`;
  return { status: created ? "success" : "error", message: msg };
}

const REVIEW_ERRORS: Record<string, string> = {
  EXPLANATION_REQUIRED: "needs an explanation",
  MODEL_ANSWER_REQUIRED: "needs a model answer",
  SUBJECT_REQUIRED: "needs a subject",
  MCQ_NEEDS_TWO_OPTIONS_ONE_CORRECT: "needs exactly one correct option",
  INVALID_TRANSITION: "is not in a state that can be approved",
};

/** Human approval of AI drafts (one or many). Publishing also needs questions.publish. */
export async function approveDraftsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("questions.review");
  if (denied) return { status: "error", message: denied };
  const ids = z.array(z.uuid()).min(1, "Select at least one draft.").max(50).safeParse(formData.getAll("ids"));
  if (!ids.success) return { status: "error", message: ids.error.issues[0]?.message ?? "Select drafts." };
  const user = await getCurrentUser();
  const publish = formData.get("publish") === "1" && can(user, "questions.publish");
  const db = await createClient();
  const { data: rows } = await db.from("questions").select("id, status").in("id", ids.data);
  let approved = 0;
  const problems: string[] = [];
  for (const q of rows ?? []) {
    const steps = [
      ...(["ai_generated", "draft", "revision_requested"].includes(q.status) ? ["submit"] : []),
      ...(q.status !== "verified" ? ["verify"] : []),
      ...(publish ? ["publish"] : []),
    ];
    let failed = false;
    for (const action of steps) {
      const { error } = await db.rpc("review_question", { _id: q.id, _action: action, _comment: action === "verify" ? "Approved in the AI review queue" : null });
      if (error) {
        const key = Object.keys(REVIEW_ERRORS).find((k) => error.message.includes(k));
        problems.push(key ? REVIEW_ERRORS[key] : "could not be approved");
        failed = true;
        break;
      }
    }
    if (!failed) approved++;
  }
  revalidatePath("/admin/ai/review");
  revalidatePath("/admin/questions");
  const verb = publish ? "approved and published" : "approved (verified)";
  return {
    status: approved ? "success" : "error",
    message: `${approved} ${verb}.${problems.length ? ` ${problems.length} not approved: ${[...new Set(problems)].join("; ")}. Open them to fix.` : ""}`,
  };
}

export async function rejectDraftsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard("questions.review");
  if (denied) return { status: "error", message: denied };
  const ids = z.array(z.uuid()).min(1, "Select at least one draft.").max(50).safeParse(formData.getAll("ids"));
  if (!ids.success) return { status: "error", message: ids.error.issues[0]?.message ?? "Select drafts." };
  const reason = String(formData.get("reason") ?? "").trim().slice(0, 500) || "Rejected in the AI review queue";
  const db = await createClient();
  let rejected = 0;
  for (const id of ids.data) {
    const { error } = await db.rpc("review_question", { _id: id, _action: "reject", _comment: reason });
    if (!error) rejected++;
  }
  revalidatePath("/admin/ai/review");
  return { status: rejected ? "success" : "error", message: `${rejected} rejected.` };
}
