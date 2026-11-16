"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError, can, getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { questionPayloadSchema, REVIEW_ACTIONS, type QuestionPayload } from "@/lib/validation/question";

export type SaveQuestionResult = { ok: true; id: string } | { ok: false; message: string; issues?: string[] };

const DB_MESSAGES: [string, string][] = [
  ["questions_content_hash_uniq", "A question with exactly the same wording already exists."],
  ["Only reviewers may", "Only reviewers can change the content of a verified or published question."],
  ["QUESTION_NOT_FOUND", "This question no longer exists."],
];

export async function saveQuestionAction(payload: QuestionPayload): Promise<SaveQuestionResult> {
  try {
    await assertPermission("questions.create");
  } catch (e) {
    // Reviewers without questions.create may still edit content.
    const user = await getCurrentUser();
    if (!can(user, "questions.review")) return { ok: false, message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
  const parsed = questionPayloadSchema.safeParse(payload);
  if (!parsed.success) return { ok: false, message: "Please correct the following:", issues: [...new Set(parsed.error.issues.map((i) => i.message))] };
  const { id, options, rubric, references, key_points, alternative_answers, specialisation_id, subject_group_id, source_year, source_page, ...q } = parsed.data;
  const supabase = await createClient();
  if (q.paper_id) {
    const { data: paper } = await supabase.from("exam_papers").select("bank_scope").eq("id", q.paper_id).maybeSingle();
    if (paper?.bank_scope === "specialisation" && !specialisation_id) return { ok: false, message: "Questions for this paper belong to one specialisation. Choose the specialisation." };
    if (paper?.bank_scope === "subject_group" && !specialisation_id && !subject_group_id) return { ok: false, message: "Questions for this paper need a Paper II group or a specialisation." };
  }
  const { data, error } = await supabase.rpc("save_question", {
    _id: id,
    _q: { ...q, word_limit: q.word_limit ?? "", estimated_seconds: q.estimated_seconds ?? "" },
    _options: q.question_type === "mcq" ? options : [],
    _rubric: q.question_type === "mcq" ? [] : rubric,
    _refs: references.filter((r) => r.citation),
  });
  if (error) {
    console.error("save_question failed", error.code, error.message);
    const known = DB_MESSAGES.find(([k]) => error.message.includes(k));
    return { ok: false, message: known?.[1] ?? "The question could not be saved." };
  }
  const { error: cErr } = await supabase.from("questions")
    .update({ specialisation_id, subject_group_id, source_year, source_page }).eq("id", data as string);
  if (cErr) {
    console.error("question classification failed", cErr.code, cErr.message);
    return { ok: false, message: "The question was saved, but its classification could not be saved." };
  }
  if (q.question_type !== "mcq") {
    const { error: gErr } = await supabase.rpc("save_question_guide", { _id: data as string, _key_points: key_points.filter((k) => k.point), _alternatives: alternative_answers });
    if (gErr) {
      console.error("save_question_guide failed", gErr.code, gErr.message);
      const known = DB_MESSAGES.find(([k]) => gErr.message.includes(k));
      return { ok: false, message: known?.[1] ?? "The question was saved, but its answer guide could not be saved." };
    }
  }
  revalidatePath("/admin/questions");
  return { ok: true, id: data as string };
}

const REVIEW_MESSAGES: Record<string, string> = {
  INVALID_TRANSITION: "That action is not possible from the question's current status.",
  COMMENT_REQUIRED: "Please add a comment explaining what needs to change.",
  MCQ_NEEDS_TWO_OPTIONS_ONE_CORRECT: "A multiple-choice question needs at least two options and exactly one correct answer.",
  EXPLANATION_REQUIRED: "Add an explanation before verifying.",
  MODEL_ANSWER_REQUIRED: "Add a model answer before verifying.",
  SUBJECT_REQUIRED: "Choose a subject before verifying.",
  QUESTION_IN_PUBLISHED_EXAM: "This question is in a published examination. Unpublish the examination first.",
  "Missing permission": "You do not have permission for this action.",
};

export async function reviewQuestionAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const parsed = z
    .object({ id: z.uuid(), action: z.enum(REVIEW_ACTIONS), comment: z.string().trim().max(2000).optional() })
    .safeParse({ id: formData.get("id"), action: formData.get("action"), comment: formData.get("comment") ?? undefined });
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const user = await getCurrentUser();
  if (!user || !(can(user, "questions.create") || can(user, "questions.review") || can(user, "questions.publish"))) {
    return { status: "error", message: "You do not have permission for this action." };
  }
  const supabase = await createClient();
  const { error } = await supabase.rpc("review_question", { _id: parsed.data.id, _action: parsed.data.action, _comment: parsed.data.comment ?? null });
  if (error) {
    const key = Object.keys(REVIEW_MESSAGES).find((k) => error.message.includes(k));
    return { status: "error", message: key ? REVIEW_MESSAGES[key] : "The status could not be changed." };
  }
  revalidatePath("/admin/questions");
  revalidatePath(`/admin/questions/${parsed.data.id}`);
  return { status: "success", message: "Status updated." };
}

export type SimilarQuestion = { id: string; stem: string; status: string; similarity: number };

export async function findSimilarAction(stem: string, excludeId: string | null): Promise<SimilarQuestion[]> {
  if (typeof stem !== "string" || stem.trim().length < 15) return [];
  const supabase = await createClient();
  const { data } = await supabase.rpc("find_similar_questions", { _stem: stem.slice(0, 2000), _exclude: excludeId });
  return (data ?? []) as SimilarQuestion[];
}

export type ImportRowResult = { row: number; ok: boolean; message: string; id?: string };

/** Imports already-validated CSV rows as drafts (max 50 per call). */
export async function importQuestionsAction(rows: { row: number; payload: QuestionPayload }[]): Promise<ImportRowResult[]> {
  const user = await getCurrentUser();
  if (!can(user, "questions.create")) return rows.map((r) => ({ row: r.row, ok: false, message: "Not allowed." }));
  const out: ImportRowResult[] = [];
  for (const { row, payload } of rows.slice(0, 50)) {
    const res = await saveQuestionAction(payload);
    out.push(res.ok ? { row, ok: true, message: "Imported as draft", id: res.id } : { row, ok: false, message: res.issues?.join("; ") || res.message });
  }
  return out;
}

const bulkSchema = z.object({ ids: z.array(z.uuid()).min(1).max(200), action: z.enum(REVIEW_ACTIONS) });

/** Applies a review action to many questions; each is checked individually. */
export async function bulkReviewAction(input: z.input<typeof bulkSchema>): Promise<{ done: number; failed: { id: string; message: string }[] }> {
  const parsed = bulkSchema.safeParse(input);
  if (!parsed.success) return { done: 0, failed: [] };
  if (["request_revision", "reject"].includes(parsed.data.action)) return { done: 0, failed: parsed.data.ids.map((id) => ({ id, message: "This action needs a comment; use it on individual questions." })) };
  const supabase = await createClient();
  let done = 0;
  const failed: { id: string; message: string }[] = [];
  for (const id of parsed.data.ids) {
    const { error } = await supabase.rpc("review_question", { _id: id, _action: parsed.data.action, _comment: null });
    if (error) {
      const key = Object.keys(REVIEW_MESSAGES).find((k) => error.message.includes(k));
      failed.push({ id, message: key ? REVIEW_MESSAGES[key] : "Could not be changed." });
    } else done++;
  }
  revalidatePath("/admin/questions");
  return { done, failed };
}
