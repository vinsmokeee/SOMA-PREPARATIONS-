import "server-only";
import { getAiProvider } from "@/lib/ai";
import type { z } from "zod";
import type { AiImage, StructuredRequest, StructuredResult } from "@/lib/ai/provider";
import {
  assessTranscription, buildEvaluationPrompt, buildImprovedPrompt, buildTranscriptionPrompt, EVALUATION_SYSTEM,
  evaluationSchema, finalizeEvaluation, IMPROVED_SYSTEM, improvedSchema, markingCriteria, TRANSCRIBE_SYSTEM, transcriptionSchema,
  type EvaluationContext,
} from "@/lib/ai/written-evaluation";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Background work for written answers. Runs on the server with the secret key
 * AFTER the student's request was authorised by a database function acting as
 * the student (begin_transcription / request_answer_evaluation /
 * request_improved_answer). Students can never write these results themselves.
 */

type Db = ReturnType<typeof createAdminClient>;
const now = () => new Date().toISOString();

async function loadAnswerContext(db: Db, answerId: string) {
  const { data: aa } = await db
    .from("attempt_answers")
    .select("id, text_answer, word_count, answer_mode, transcript_edit_ratio, exam_question_id, attempt_id, exam_attempts(user_id, exam_id), exam_questions(marks, question_id)")
    .eq("id", answerId)
    .single();
  if (!aa) throw new Error("answer not found");
  const eq = aa.exam_questions as unknown as { marks: number | null; question_id: string };
  const att = aa.exam_attempts as unknown as { user_id: string; exam_id: string };
  const { data: q } = await db
    .from("questions")
    .select("id, stem, question_type, marks, word_limit, model_answer, key_points, alternative_answers, subject_id, paper_id, subjects(name, assessment_criteria), exam_papers(title), rubric_criteria(label, description, max_marks, position)")
    .eq("id", eq.question_id)
    .single();
  if (!q) throw new Error("question not found");
  return { aa, q, userId: att.user_id, marks: Number(eq.marks ?? q.marks) };
}

async function config(db: Db) {
  const { data } = await db.from("app_settings").select("value").eq("key", "evaluation.config").maybeSingle();
  return (data?.value ?? {}) as { instructions?: string };
}

export async function runTranscription(answerId: string, paths: string[], chargeId: string | null = null): Promise<void> {
  const db = createAdminClient();
  const provider = getAiProvider();
  const fail = async (message: string) => {
    await db.from("attempt_answers").update({ transcript_status: "failed", transcript_notes: { message } }).eq("id", answerId);
    // A re-read that used an AI evaluation is given back when the reading fails.
    if (chargeId) await db.from("ai_allowance_uses").delete().eq("id", chargeId);
  };
  if (!provider) return fail("AI is not configured on this site yet. Please type your answer instead, or try again later.");
  const { aa, q, userId } = await loadAnswerContext(db, answerId);
  void aa;

  const images: AiImage[] = [];
  for (const path of paths) {
    const { data, error } = await db.storage.from("answer-sheets").download(path);
    if (error || !data) return fail("A page could not be loaded. Please remove it and upload it again.");
    const type = data.type === "image/png" || data.type === "image/webp" ? data.type : "image/jpeg";
    images.push({ mediaType: type, base64: Buffer.from(await data.arrayBuffer()).toString("base64") });
  }

  const { data: job } = await db.from("ai_jobs").insert({
    kind: "answer_transcription", provider: provider.name, model: provider.model, status: "running",
    started_at: now(), requested_by: userId, input: { answer_id: answerId, pages: paths.length },
  }).select("id").single();
  const r = await provider.generateStructured({
    system: TRANSCRIBE_SYSTEM, prompt: buildTranscriptionPrompt(paths.length, q.stem), schema: transcriptionSchema,
    images, maxTokens: 8000 + paths.length * 2000, effort: "medium",
  });
  if (!r.ok) {
    if (job) await db.from("ai_jobs").update({ status: "failed", error_message: `${r.reason}: ${r.message}`, completed_at: now(), input_tokens: r.inputTokens ?? null, output_tokens: r.outputTokens ?? null }).eq("id", job.id);
    return fail("Your handwriting could not be read right now. Please try again in a minute.");
  }
  const o = assessTranscription(r.data);
  if (job) await db.from("ai_jobs").update({ status: "succeeded", model: r.model, completed_at: now(), input_tokens: r.inputTokens, output_tokens: r.outputTokens, output: { confidence: o.confidence, unclear: o.unclearCount, retake: o.retake, used_fallback: r.usedFallback } }).eq("id", job.id);
  await db.from("attempt_answers").update({
    transcript_status: "needs_review",
    transcript_text: o.text || "[unclear]",
    transcript_confidence: o.confidence,
    transcript_language: r.data.language,
    transcript_notes: { message: o.message, retake: o.retake, unclear_count: o.unclearCount, page_issues: o.pageIssues },
  }).eq("id", answerId);
}

function buildContext(loaded: Awaited<ReturnType<typeof loadAnswerContext>>, instructions: string | null): EvaluationContext {
  const { aa, q, marks } = loaded;
  const subj = q.subjects as unknown as { name: string; assessment_criteria: string | null } | null;
  const paper = q.exam_papers as unknown as { title: string } | null;
  const rubric = [...((q.rubric_criteria ?? []) as { label: string; description: string | null; max_marks: number; position: number }[])].sort((a, b) => a.position - b.position);
  return {
    question: q.stem, questionType: q.question_type, marks, wordLimit: q.word_limit, subject: subj?.name ?? null, paper: paper?.title ?? null,
    modelAnswer: q.model_answer, rubric: rubric.map((r) => ({ label: r.label, description: r.description, max_marks: Number(r.max_marks) })),
    keyPoints: (q.key_points ?? []) as { point: string; marks: number | null }[], alternatives: q.alternative_answers,
    subjectCriteria: subj?.assessment_criteria ?? null, adminInstructions: instructions,
    answer: aa.text_answer ?? "", wordCount: aa.word_count ?? 0, method: aa.answer_mode as "typed" | "handwritten",
    editRatio: aa.transcript_edit_ratio === null ? null : Number(aa.transcript_edit_ratio),
  };
}

/** The marking request for one answer (shared by instant and batch marking). */
export async function prepareEvaluation(db: Db, answerId: string) {
  const ctx = buildContext(await loadAnswerContext(db, answerId), (await config(db)).instructions ?? null);
  const { criteria } = markingCriteria(ctx);
  const req: StructuredRequest<typeof evaluationSchema> = {
    system: EVALUATION_SYSTEM, prompt: buildEvaluationPrompt(ctx, criteria), schema: evaluationSchema, maxTokens: 12000, effort: "high",
  };
  return { ctx, req };
}

/** Saves a successful marking result on the evaluation. */
export async function completeEvaluation(db: Db, evaluationId: string, ctx: EvaluationContext,
  r: Extract<StructuredResult<z.infer<typeof evaluationSchema>>, { ok: true }>, jobId: string | null, extra: Record<string, unknown> = {}) {
  const f = finalizeEvaluation(r.data, ctx);
  await db.from("evaluations").update({
    status: "completed", completed_at: now(), ai_job_id: jobId, score: f.score, max_score: f.maxScore, scored: f.scored,
    rubric_scores: f.rubricScores, feedback: f.details.summary, details: { ...f.details, used_fallback: r.usedFallback, model: r.model, ...extra },
    confidence: f.confidence, weakness_tags: f.tags, error_message: null,
  }).eq("id", evaluationId);
}

export async function runEvaluation(evaluationId: string): Promise<void> {
  const db = createAdminClient();
  const { data: ev } = await db.from("evaluations").select("id, answer_id, status, requested_by").eq("id", evaluationId).single();
  if (!ev || !["queued", "in_progress"].includes(ev.status)) return;
  const fail = (message: string) => db.from("evaluations").update({ status: "failed", error_message: message, completed_at: now() }).eq("id", evaluationId);
  const provider = getAiProvider();
  if (!provider) { await fail("AI evaluation is not configured on this site yet."); return; }
  await db.from("evaluations").update({ status: "in_progress" }).eq("id", evaluationId);

  try {
    const { ctx, req } = await prepareEvaluation(db, ev.answer_id);
    const { data: job } = await db.from("ai_jobs").insert({
      kind: "answer_feedback", provider: provider.name, model: provider.model, status: "running", started_at: now(),
      requested_by: ev.requested_by, input: { evaluation_id: evaluationId, answer_id: ev.answer_id, words: ctx.wordCount },
    }).select("id").single();
    const r = await provider.generateStructured(req);
    if (!r.ok) {
      if (job) await db.from("ai_jobs").update({ status: "failed", error_message: `${r.reason}: ${r.message}`, completed_at: now() }).eq("id", job.id);
      await fail(r.reason === "refused" ? "This answer could not be evaluated automatically." : "The evaluation could not be completed. You can try again.");
      return;
    }
    if (job) await db.from("ai_jobs").update({ status: "succeeded", model: r.model, completed_at: now(), input_tokens: r.inputTokens, output_tokens: r.outputTokens, output: { used_fallback: r.usedFallback } }).eq("id", job.id);
    await completeEvaluation(db, evaluationId, ctx, r, job?.id ?? null);
  } catch (e) {
    console.error("evaluation failed", evaluationId, e instanceof Error ? e.message : e);
    await fail("The evaluation could not be completed. You can try again.");
  }
}

export async function runImprovedAnswer(evaluationId: string): Promise<void> {
  const db = createAdminClient();
  const provider = getAiProvider();
  // If it cannot be written, the AI evaluation it used is given back and the student can try again.
  const refund = async () => {
    await db.from("ai_allowance_uses").delete().eq("evaluation_id", evaluationId).eq("kind", "improved_answer");
    await db.from("evaluations").update({ improved_requested_at: null }).eq("id", evaluationId);
  };
  if (!provider) return refund();
  const { data: ev } = await db.from("evaluations").select("id, answer_id, details, requested_by").eq("id", evaluationId).single();
  if (!ev) return;
  const details = (ev.details ?? {}) as { summary?: string; key_points_missing?: string[]; suggestions?: string[]; improved_answer?: unknown };
  if (details.improved_answer) return;
  const ctx = buildContext(await loadAnswerContext(db, ev.answer_id), null);
  const r = await provider.generateStructured({
    system: IMPROVED_SYSTEM, schema: improvedSchema, maxTokens: 8000, effort: "medium",
    prompt: buildImprovedPrompt(ctx, { summary: details.summary ?? "", missing: details.key_points_missing ?? [], suggestions: details.suggestions ?? [] }),
  });
  await db.from("ai_jobs").insert({
    kind: "answer_feedback", provider: provider.name, model: r.model ?? provider.model, status: r.ok ? "succeeded" : "failed",
    requested_by: ev.requested_by, input: { evaluation_id: evaluationId, improved_answer: true }, started_at: now(), completed_at: now(),
    input_tokens: r.inputTokens ?? null, output_tokens: r.outputTokens ?? null, error_message: r.ok ? null : r.message,
  });
  if (r.ok) {
    await db.from("evaluations").update({ details: { ...details, improved_answer: r.data.improved_answer, improved_changes: r.data.what_changed } }).eq("id", evaluationId);
  } else {
    await refund();
  }
}
