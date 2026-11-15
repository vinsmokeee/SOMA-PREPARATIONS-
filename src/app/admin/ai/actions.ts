"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { getAiProvider } from "@/lib/ai";
import {
  analysisSchema, ANALYSIS_SYSTEM, buildAnalysisPrompt, buildGenerationPrompt, checkMcqDraft, checkWrittenDraft, cleanReferences,
  mcqDraftSchema, SYSTEM_PROMPT, writtenDraftSchema, type GenerationRequest,
} from "@/lib/ai/question-drafts";
import { createClient } from "@/lib/supabase/server";

const NOT_CONFIGURED = "AI is not configured. Add ANTHROPIC_API_KEY to the server environment (see docs/ENVIRONMENT.md).";

const generateSchema = z.object({
  subject_id: z.uuid("Choose a subject."),
  topic_id: z.union([z.uuid(), z.literal("")]).optional(),
  kind: z.enum(["mcq", "short_answer", "long_answer", "essay", "analytical", "descriptive"]),
  difficulty: z.enum(["foundation", "standard", "advanced", "mixed"]),
  count: z.coerce.number().int().min(1).max(10),
  marks: z.coerce.number().positive().max(100).optional(),
  word_limit: z.union([z.coerce.number().int().min(30).max(3000), z.literal("")]).optional(),
  guidance: z.string().trim().max(1500).optional(),
});

type Created = { id: string; confidence: string; fact_check_notes: string; topic_suggestion?: string; similar?: { id: string; similarity: number } };

async function guard(): Promise<string | null> {
  try {
    await assertPermission("ai.run");
    await assertPermission("questions.create");
    return null;
  } catch (e) {
    return e instanceof AuthorizationError ? e.message : "Not allowed.";
  }
}

export async function generateQuestionsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return { status: "error", message: denied };
  const parsed = generateSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Invalid request." };
  const input = parsed.data;
  const provider = getAiProvider();
  if (!provider) return { status: "error", message: NOT_CONFIGURED };

  const db = await createClient();
  const { data: subject } = await db.from("subjects").select("id, name, description, stage, is_official, paper_id").eq("id", input.subject_id).maybeSingle();
  if (!subject) return { status: "error", message: "Subject not found." };
  const { data: topics } = await db.from("topics").select("id, name").eq("subject_id", subject.id);
  const topic = input.topic_id ? (topics ?? []).find((t) => t.id === input.topic_id) ?? null : null;
  const isMcq = input.kind === "mcq";
  if (isMcq && subject.stage !== "PE") return { status: "error", message: "Multiple-choice drafting is for PE subjects." };
  const marks = isMcq ? 1 : input.marks ?? 10;

  // Style examples: verified/published questions on this subject (never sent as material to copy).
  let ex = db.from("questions").select("id, stem, question_type, question_options(body, is_correct, position)").eq("subject_id", subject.id).in("status", ["verified", "published"]).limit(6);
  if (topic) ex = ex.eq("topic_id", topic.id);
  const { data: examples } = await ex;
  const { data: existing } = await db.from("questions").select("stem").eq("subject_id", subject.id).neq("status", "archived").order("created_at", { ascending: false }).limit(40);

  const request: GenerationRequest = {
    stage: subject.stage,
    kind: isMcq ? "mcq" : "written",
    writtenType: isMcq ? undefined : (input.kind as GenerationRequest["writtenType"]),
    subject: { name: subject.name, description: subject.description, isOfficial: subject.is_official },
    topic: topic?.name ?? null,
    difficulty: input.difficulty,
    count: input.count,
    marks,
    wordLimit: input.word_limit === "" || input.word_limit === undefined ? null : input.word_limit,
    guidance: input.guidance,
    styleExamples: (examples ?? []).map((e) => {
      const opts = [...(e.question_options ?? [])].sort((a, b) => a.position - b.position);
      return { stem: e.stem.slice(0, 500), options: opts.map((o) => o.body), answer: opts.find((o) => o.is_correct)?.body };
    }),
    existingStems: (existing ?? []).map((e) => e.stem.replace(/\s+/g, " ").slice(0, 160)),
  };
  const prompt = buildGenerationPrompt(request);

  const { data: job, error: jobErr } = await db
    .from("ai_jobs")
    .insert({ kind: "question_generation", provider: provider.name, model: provider.model, status: "running", started_at: new Date().toISOString(), input: { ...input, subject: subject.name, topic: topic?.name ?? null, prompt } })
    .select("id")
    .single();
  if (jobErr || !job) return { status: "error", message: "Could not record the AI job." };

  const result = isMcq
    ? await provider.generateStructured({ system: SYSTEM_PROMPT, prompt, schema: mcqDraftSchema, maxTokens: 16000 })
    : await provider.generateStructured({ system: SYSTEM_PROMPT, prompt, schema: writtenDraftSchema, maxTokens: 24000 });

  if (!result.ok) {
    await db.from("ai_jobs").update({ status: "failed", error_message: `${result.reason}: ${result.message}`.slice(0, 2000), input_tokens: result.inputTokens ?? null, output_tokens: result.outputTokens ?? null, completed_at: new Date().toISOString() }).eq("id", job.id);
    revalidatePath("/admin/ai");
    return { status: "error", message: result.reason === "not_configured" ? NOT_CONFIGURED : result.message };
  }

  const created: Created[] = [];
  const skipped: { stem: string; reason: string }[] = [];
  for (const d of result.data.questions.slice(0, input.count)) {
    const check = isMcq ? checkMcqDraft(d as never) : checkWrittenDraft(d as never, marks);
    if (!check.ok) { skipped.push({ stem: d.stem.slice(0, 200), reason: check.reason }); continue; }
    const { data: similar } = await db.rpc("find_similar_questions", { _stem: d.stem.slice(0, 2000), _exclude: null });
    const top = ((similar ?? []) as { id: string; similarity: number }[])[0];
    if (top && top.similarity >= 0.8) { skipped.push({ stem: d.stem.slice(0, 200), reason: "Too similar to an existing question" }); continue; }

    const m = "options" in d ? d : null;
    const w = "model_answer" in d ? d : null;
    const suggestion = m?.topic_suggestion?.trim();
    const topicId = topic?.id ?? (suggestion ? (topics ?? []).find((t) => t.name.toLowerCase() === suggestion.toLowerCase())?.id : undefined) ?? "";
    const { data: qid, error } = await db.rpc("save_question", {
      _id: null,
      _q: {
        stage: subject.stage, question_type: isMcq ? "mcq" : w!.question_type, stem: d.stem.trim(),
        explanation: m?.explanation ?? "", model_answer: w?.model_answer ?? "", word_limit: w?.word_limit ? String(w.word_limit) : "",
        subject_id: subject.id, topic_id: topicId, paper_id: subject.paper_id ?? "", category_id: "",
        difficulty: m?.difficulty ?? (input.difficulty === "mixed" ? "standard" : input.difficulty),
        marks: String(marks), estimated_seconds: "", is_free_sample: false, origin: "ai_generated",
      },
      _options: m ? m.options.map((body, i) => ({ body: body.trim(), is_correct: i === m.correct_option })) : [],
      _rubric: w ? w.rubric.map((r) => ({ label: r.label, description: r.description, max_marks: r.max_marks })) : [],
      _refs: cleanReferences(d.references),
    });
    if (error || !qid) { skipped.push({ stem: d.stem.slice(0, 200), reason: error?.message.includes("content_hash") ? "Exact duplicate" : "Could not be saved" }); continue; }
    await db.from("questions").update({ status: "ai_generated", ai_job_id: job.id }).eq("id", qid as string);
    created.push({ id: qid as string, confidence: d.confidence, fact_check_notes: d.fact_check_notes, topic_suggestion: suggestion, similar: top ? { id: top.id, similarity: top.similarity } : undefined });
  }

  await db.from("ai_jobs").update({
    status: "succeeded", completed_at: new Date().toISOString(), model: result.model,
    input_tokens: result.inputTokens, output_tokens: result.outputTokens,
    output: { created, skipped, used_fallback: result.usedFallback },
  }).eq("id", job.id);
  revalidatePath("/admin/ai");
  revalidatePath("/admin/questions");
  const msg = `${created.length} draft${created.length === 1 ? "" : "s"} created for review${skipped.length ? `, ${skipped.length} skipped` : ""}.`;
  return { status: created.length ? "success" : "error", message: msg };
}

const analyseSchema = z.object({ subject_id: z.uuid("Choose a subject.") });

/** Summarises patterns in past-paper (historical) questions of one subject. */
export async function analysePastPapersAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return { status: "error", message: denied };
  const parsed = analyseSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Invalid request." };
  const provider = getAiProvider();
  if (!provider) return { status: "error", message: NOT_CONFIGURED };
  const db = await createClient();
  const { data: subject } = await db.from("subjects").select("id, name").eq("id", parsed.data.subject_id).maybeSingle();
  if (!subject) return { status: "error", message: "Subject not found." };
  const { data: qs } = await db
    .from("questions")
    .select("stem, historical_papers(exam_year)")
    .eq("subject_id", subject.id)
    .eq("origin", "historical_official")
    .neq("status", "archived")
    .limit(300);
  const items = ((qs ?? []) as unknown as { stem: string; historical_papers: { exam_year: number } | null }[]).map((q) => ({ year: q.historical_papers?.exam_year ?? null, stem: q.stem }));
  if (items.length < 5) return { status: "error", message: `Only ${items.length} past-paper questions on this subject — import more papers first (at least 5 needed).` };

  const prompt = buildAnalysisPrompt(subject.name, items);
  const { data: job } = await db.from("ai_jobs").insert({ kind: "paper_analysis", provider: provider.name, model: provider.model, status: "running", started_at: new Date().toISOString(), input: { subject_id: subject.id, subject: subject.name, questions: items.length } }).select("id").single();
  const result = await provider.generateStructured({ system: ANALYSIS_SYSTEM, prompt, schema: analysisSchema, maxTokens: 8000, effort: "medium" });
  if (job) {
    await db.from("ai_jobs").update(result.ok
      ? { status: "succeeded", output: { analysis: result.data, used_fallback: result.usedFallback }, model: result.model, input_tokens: result.inputTokens, output_tokens: result.outputTokens, completed_at: new Date().toISOString() }
      : { status: "failed", error_message: `${result.reason}: ${result.message}`.slice(0, 2000), completed_at: new Date().toISOString() }).eq("id", job.id);
  }
  revalidatePath("/admin/ai");
  return result.ok ? { status: "success", message: "Analysis ready below." } : { status: "error", message: result.message };
}
