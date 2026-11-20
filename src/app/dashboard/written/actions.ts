"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { after } from "next/server";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { runEvaluation, runImprovedAnswer, runTranscription } from "@/lib/written/runner";

/**
 * Student actions for written answers. Every action runs a database function
 * AS THE STUDENT first (ownership, deadlines, upload window, allowance); only
 * then does background AI work run with the server key.
 */

const MESSAGES: Record<string, string> = {
  ANSWER_LOCKED: "This answer can no longer be changed (the upload window has closed or evaluation has started).",
  UPLOAD_WINDOW_CLOSED: "The time for uploading answer sheets for this examination has ended.",
  TOO_MANY_PAGES: "You have reached the maximum number of pages for one answer.",
  PAGE_TOO_LARGE: "This photo is too large. Please retake it.",
  ATTEMPT_CLOSED: "The examination has ended, so typed answers can no longer be changed.",
  NO_PAGES: "Upload at least one page first.",
  ALREADY_READING: "Your handwriting is already being read.",
  RATE_LIMIT: "Daily limit reached. Please try again tomorrow.",
  CONFIRM_TRANSCRIPT_FIRST: "Check and confirm the text of your handwritten answer first.",
  SUBMIT_FIRST: "Submit your answer before requesting an evaluation.",
  EMPTY_ANSWER: "The answer is empty.",
  NO_EVALUATIONS_LEFT: "You have used all AI evaluations included in your plan.",
  NOTHING_TO_CONFIRM: "There is no text to confirm yet.",
  INVALID_TEXT: "The answer text is empty or too long.",
  ACCESS_REQUIRED: "This question is part of ME Premium.",
  QUESTION_NOT_FOUND: "This question is not available.",
  NOT_READY: "The evaluation is not ready yet.",
};
const message = (e: { message: string } | null | undefined, fallback: string) =>
  Object.entries(MESSAGES).find(([k]) => e?.message.includes(k))?.[1] ?? fallback;

export type Result<T = undefined> = { ok: true; data: T } | { ok: false; message: string };
const uuid = z.uuid();

async function signedIn() {
  const user = await getCurrentUser();
  if (!user) throw new Error("Not signed in");
  return createClient();
}

// ---- practice -----------------------------------------------------------------

export async function startWrittenPracticeAction(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const parsed = z.object({ questionId: uuid, minutes: z.union([z.literal(""), z.coerce.number().int().min(5).max(240)]) })
    .safeParse({ questionId: formData.get("questionId"), minutes: formData.get("minutes") ?? "" });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.rpc("create_written_practice", { _question_id: parsed.data.questionId, _minutes: parsed.data.minutes === "" ? null : parsed.data.minutes });
  if (error || !data) return { error: message(error, "The practice could not be started.") };
  redirect(`/exam/${data as string}`);
}

// ---- answer method and pages ----------------------------------------------------

export async function setAnswerModeAction(attemptId: string, examQuestionId: string, mode: "typed" | "handwritten"): Promise<Result<{ answerId: string }>> {
  if (!uuid.safeParse(attemptId).success || !uuid.safeParse(examQuestionId).success || !["typed", "handwritten"].includes(mode)) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.rpc("set_answer_mode", { _attempt_id: attemptId, _exam_question_id: examQuestionId, _mode: mode });
  if (error || !data) return { ok: false, message: message(error, "Could not change the answer method.") };
  return { ok: true, data: { answerId: data as string } };
}

export async function ensureWrittenAnswerAction(attemptId: string, examQuestionId: string): Promise<void> {
  const r = await setAnswerModeAction(attemptId, examQuestionId, "handwritten");
  if (r.ok) redirect(`/dashboard/written/${r.data.answerId}`);
  redirect(`/dashboard/results/${attemptId}?notice=upload-closed`);
}

export type PageInfo = { id: string; position: number; url: string | null; quality: { warnings?: string[] } };

export async function listPagesAction(answerId: string): Promise<Result<PageInfo[]>> {
  if (!uuid.safeParse(answerId).success) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.from("answer_pages").select("id, position, storage_path, quality").eq("answer_id", answerId).order("position");
  if (error) return { ok: false, message: "Could not load pages." };
  const paths = (data ?? []).map((p) => p.storage_path);
  const signed = paths.length ? (await db.storage.from("answer-sheets").createSignedUrls(paths, 3600)).data ?? [] : [];
  return { ok: true, data: (data ?? []).map((p, i) => ({ id: p.id, position: p.position, url: signed[i]?.signedUrl ?? null, quality: p.quality ?? {} })) };
}

const pageMeta = z.object({
  answerId: uuid, path: z.string().max(200), width: z.number().int().positive().max(20000), height: z.number().int().positive().max(20000),
  bytes: z.number().int().positive(), warnings: z.array(z.string().max(20)).max(10),
});

export async function registerPageAction(input: z.infer<typeof pageMeta>): Promise<Result<{ id: string }>> {
  const parsed = pageMeta.safeParse(input);
  if (!parsed.success) return { ok: false, message: "Invalid page." };
  const d = parsed.data;
  const db = await signedIn();
  const { data, error } = await db.rpc("add_answer_page", { _answer_id: d.answerId, _storage_path: d.path, _width: d.width, _height: d.height, _bytes: d.bytes, _quality: { warnings: d.warnings } });
  if (error || !data) {
    await db.storage.from("answer-sheets").remove([d.path]);
    return { ok: false, message: message(error, "The page could not be saved.") };
  }
  return { ok: true, data: { id: data as string } };
}

export async function arrangePagesAction(answerId: string, pageIds: string[]): Promise<Result> {
  if (!uuid.safeParse(answerId).success || !z.array(uuid).max(50).safeParse(pageIds).success) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.rpc("arrange_answer_pages", { _answer_id: answerId, _page_ids: pageIds });
  if (error) return { ok: false, message: message(error, "Could not update the pages.") };
  const removed = (data ?? []) as string[];
  if (removed.length) await db.storage.from("answer-sheets").remove(removed);
  return { ok: true, data: undefined };
}

// ---- handwriting, evaluation, feedback --------------------------------------------

export async function readHandwritingAction(answerId: string): Promise<Result> {
  if (!uuid.safeParse(answerId).success) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.rpc("begin_transcription", { _answer_id: answerId });
  if (error || !data) return { ok: false, message: message(error, "Could not start reading your handwriting.") };
  const paths = (data as { paths: string[] }).paths;
  after(() => runTranscription(answerId, paths));
  revalidatePath(`/dashboard/written/${answerId}`);
  return { ok: true, data: undefined };
}

export async function confirmTranscriptAction(answerId: string, text: string): Promise<Result<{ editRatio: number }>> {
  if (!uuid.safeParse(answerId).success || typeof text !== "string" || text.length > 60000) return { ok: false, message: "Invalid request." };
  // [unclear] parts may stay (founder, 20 Nov 2026): Dzongkha handwriting often has many, and retyping them on a phone
  // is hard. The evaluator gives no credit for unreadable words and does not treat them as mistakes.
  const db = await signedIn();
  const { data, error } = await db.rpc("confirm_transcript", { _answer_id: answerId, _text: text });
  if (error) return { ok: false, message: message(error, "Could not save the text.") };
  revalidatePath(`/dashboard/written/${answerId}`);
  return { ok: true, data: { editRatio: Number((data as { edit_ratio: number }).edit_ratio) } };
}

export async function requestEvaluationAction(answerId: string): Promise<Result> {
  if (!uuid.safeParse(answerId).success) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data: evId, error } = await db.rpc("request_answer_evaluation", { _answer_id: answerId });
  if (error || !evId) return { ok: false, message: message(error, "The evaluation could not be requested.") };
  const { data: ev } = await db.from("evaluations").select("status, assigned_at").eq("id", evId as string).single();
  // Start it if new, or restart it if a previous run stopped without finishing (e.g. a timeout).
  const stale = ev && ev.status === "in_progress" && Date.now() - new Date(ev.assigned_at).getTime() > 10 * 60 * 1000;
  if (ev && (ev.status === "queued" || stale)) after(() => runEvaluation(evId as string));
  revalidatePath(`/dashboard/written/${answerId}`);
  return { ok: true, data: undefined };
}

export async function improvedAnswerAction(evaluationId: string, answerId: string): Promise<Result> {
  if (!uuid.safeParse(evaluationId).success || !uuid.safeParse(answerId).success) return { ok: false, message: "Invalid request." };
  const db = await signedIn();
  const { data, error } = await db.rpc("request_improved_answer", { _evaluation_id: evaluationId });
  if (error) return { ok: false, message: message(error, "Could not prepare the improved answer.") };
  if (data === true) after(() => runImprovedAnswer(evaluationId));
  revalidatePath(`/dashboard/written/${answerId}`);
  return { ok: true, data: undefined };
}

const reportSchema = z.object({
  evaluationId: uuid, answerId: uuid,
  reason: z.enum(["marks_unfair", "misread_handwriting", "factually_wrong", "missed_points", "other"]),
  message: z.string().trim().min(5, "Please explain briefly (at least 5 characters).").max(2000),
});

export type ReportState = { status: "idle" | "success" | "error"; message?: string };
export async function reportEvaluationAction(_prev: ReportState, formData: FormData): Promise<ReportState> {
  const parsed = reportSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Invalid report." };
  const user = await getCurrentUser();
  if (!user) return { status: "error", message: "Please sign in again." };
  const db = await createClient();
  const { error } = await db.from("evaluation_reports").insert({ evaluation_id: parsed.data.evaluationId, user_id: user.id, reason: parsed.data.reason, message: parsed.data.message });
  if (error) return { status: "error", message: error.code === "23505" ? "You have already reported this evaluation." : "The report could not be sent." };
  revalidatePath(`/dashboard/written/${parsed.data.answerId}`);
  return { status: "success", message: "Thank you. The Soma team will review this evaluation." };
}
