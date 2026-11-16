import "server-only";
import { estimateCost, getAiProvider } from "@/lib/ai";
import { checkMcqDraft, checkWrittenDraft, cleanReferences } from "@/lib/ai/question-drafts";
import {
  buildCheckPrompt, buildVariationPrompt, CHECK_SYSTEM, checkSchema, mcqVariationSchema, reviewVerdict, VARIATION_SYSTEM,
  wordSimilarity, writtenVariationSchema, type DraftCheckResult, type McqVariation, type VariationSource, type VariationType, type WrittenVariation,
} from "@/lib/ai/question-variations";
import type { createClient } from "@/lib/supabase/server";

type Db = Awaited<ReturnType<typeof createClient>>;
export type VariationOutcome = { ok: boolean; message: string; created: number; skipped: number; flagged: number; cost: number };

/** The independent checker runs on a different, cheaper model than the writer. */
const CHECK_MODEL = "claude-sonnet-5-5";

/**
 * Writes AI variations of one source question as drafts (status ai_generated),
 * inheriting its classification, then checks them independently. Runs as the
 * signed-in staff member, so RLS and the review workflow apply.
 */
export async function generateVariations(db: Db, sourceId: string, types: VariationType[]): Promise<VariationOutcome> {
  const writer = getAiProvider();
  const checker = getAiProvider(CHECK_MODEL);
  const fail = (message: string): VariationOutcome => ({ ok: false, message, created: 0, skipped: 0, flagged: 0, cost: 0 });
  if (!writer || !checker) return fail("AI is not configured. Add ANTHROPIC_API_KEY to the server environment.");

  const { data: src } = await db.from("questions")
    .select("id, stage, question_type, stem, explanation, model_answer, marks, word_limit, difficulty, origin, source_year, subject_id, topic_id, paper_id, category_id, specialisation_id, subject_group_id, status, subjects(name), topics(name), question_options(body, is_correct, position), historical_papers(exam_year)")
    .eq("id", sourceId).maybeSingle();
  if (!src) return fail("Source question not found.");
  if (!["verified", "published"].includes(src.status)) return fail("Use a verified or published question as the source.");
  const isMcq = src.question_type === "mcq";
  const opts = [...((src.question_options ?? []) as { body: string; is_correct: boolean; position: number }[])].sort((a, b) => a.position - b.position);
  const subjectName = (src.subjects as unknown as { name: string } | null)?.name ?? null;
  const source: VariationSource = {
    stage: src.stage, kind: isMcq ? "mcq" : "written", origin: src.origin,
    sourceYear: src.source_year ?? (src.historical_papers as unknown as { exam_year: number } | null)?.exam_year ?? null,
    subject: subjectName, topic: (src.topics as unknown as { name: string } | null)?.name ?? null,
    stem: src.stem, options: isMcq ? opts.map((o) => o.body) : undefined, answer: isMcq ? opts.find((o) => o.is_correct)?.body : undefined,
    explanation: src.explanation, modelAnswer: src.model_answer, marks: Number(src.marks), wordLimit: src.word_limit,
  };
  const prompt = buildVariationPrompt(source, types);

  const { data: job, error: jobErr } = await db.from("ai_jobs")
    .insert({ kind: "question_generation", provider: writer.name, model: writer.model, status: "running", started_at: new Date().toISOString(),
      input: { mode: "variation", source_id: src.id, types, prompt } })
    .select("id").single();
  if (jobErr || !job) return fail("Could not record the AI job.");

  const result = isMcq
    ? await writer.generateStructured({ system: VARIATION_SYSTEM, prompt, schema: mcqVariationSchema, maxTokens: 16000 })
    : await writer.generateStructured({ system: VARIATION_SYSTEM, prompt, schema: writtenVariationSchema, maxTokens: 24000 });
  if (!result.ok) {
    await db.from("ai_jobs").update({ status: "failed", error_message: `${result.reason}: ${result.message}`.slice(0, 2000), completed_at: new Date().toISOString(),
      input_tokens: result.inputTokens ?? null, output_tokens: result.outputTokens ?? null }).eq("id", job.id);
    return fail(result.message);
  }
  let cost = estimateCost(result.model, result.inputTokens, result.outputTokens);

  // Rule checks and near-copy guard first.
  const skipped: { stem: string; reason: string }[] = [];
  const drafts: (McqVariation | WrittenVariation)[] = [];
  for (const d of result.data.questions.slice(0, types.length)) {
    const rule = isMcq ? checkMcqDraft(d as McqVariation) : checkWrittenDraft(d as WrittenVariation, Number(src.marks));
    if (!rule.ok) { skipped.push({ stem: d.stem.slice(0, 200), reason: rule.reason }); continue; }
    if (wordSimilarity(d.stem, src.stem) >= 0.8) { skipped.push({ stem: d.stem.slice(0, 200), reason: "Near copy of the source" }); continue; }
    drafts.push(d);
  }

  // Independent check (answers the drafts without the key).
  let checks: DraftCheckResult[] = [];
  if (drafts.length) {
    const check = await checker.generateStructured({
      system: CHECK_SYSTEM,
      prompt: buildCheckPrompt(subjectName, src.stage, drafts.map((d) => ({ stem: d.stem, options: "options" in d ? d.options : undefined, modelAnswer: "model_answer" in d ? d.model_answer : undefined }))),
      schema: checkSchema, maxTokens: 8000, effort: "medium",
    });
    if (check.ok) { checks = check.data.reviews; cost += estimateCost(check.model, check.inputTokens, check.outputTokens); }
  }

  let created = 0, flagged = 0;
  for (const [i, d] of drafts.entries()) {
    const m = "options" in d ? (d as McqVariation) : null;
    const w = "model_answer" in d ? (d as WrittenVariation) : null;
    const { data: similar } = await db.rpc("find_similar_questions", { _stem: d.stem.slice(0, 2000), _exclude: null });
    const top = ((similar ?? []) as { id: string; similarity: number }[])[0];
    if (top && top.similarity >= 0.85) { skipped.push({ stem: d.stem.slice(0, 200), reason: "Too similar to an existing question" }); continue; }
    const verdict = reviewVerdict(isMcq ? "mcq" : "written", m ? m.correct_option : null, d.confidence,
      checks.find((c) => c.number === i + 1), wordSimilarity(d.stem, src.stem));
    const { data: qid, error } = await db.rpc("save_question", {
      _id: null,
      _q: {
        stage: src.stage, question_type: isMcq ? "mcq" : w!.question_type, stem: d.stem.trim(),
        explanation: m?.explanation ?? "", model_answer: w?.model_answer ?? "", word_limit: w?.word_limit ? String(w.word_limit) : "",
        subject_id: src.subject_id ?? "", topic_id: src.topic_id ?? "", paper_id: src.paper_id ?? "", category_id: src.category_id ?? "",
        difficulty: m?.difficulty ?? (d.variation_type === "easier" ? "foundation" : d.variation_type === "harder" ? "advanced" : src.difficulty),
        marks: String(Number(src.marks)), estimated_seconds: "", is_free_sample: false,
        origin: d.variation_type === "same_objective" ? "ai_generated" : "ai_variation",
      },
      _options: m ? m.options.map((body, j) => ({ body: body.trim(), is_correct: j === m.correct_option })) : [],
      _rubric: w ? w.rubric.map((r) => ({ label: r.label, description: r.description, max_marks: r.max_marks })) : [],
      _refs: cleanReferences(d.references),
    });
    if (error || !qid) { skipped.push({ stem: d.stem.slice(0, 200), reason: error?.message.includes("content_hash") ? "Exact duplicate" : "Could not be saved" }); continue; }
    await db.from("questions").update({
      status: "ai_generated", ai_job_id: job.id, parent_question_id: src.id, variation_type: d.variation_type,
      specialisation_id: src.specialisation_id, subject_group_id: src.subject_group_id,
      ai_review: { ...verdict, what_changed: d.what_changed, confidence: d.confidence, fact_check_notes: d.fact_check_notes, concept: result.data.concept,
        checker_model: CHECK_MODEL, checked: checks.length > 0 },
    }).eq("id", qid as string);
    created++;
    if (verdict.verdict === "flag") flagged++;
  }

  await db.from("ai_jobs").update({
    status: "succeeded", completed_at: new Date().toISOString(), model: result.model,
    input_tokens: result.inputTokens, output_tokens: result.outputTokens,
    output: { mode: "variation", source_id: src.id, concept: result.data.concept, created, flagged, skipped, estimated_cost_usd: Number(cost.toFixed(4)) },
  }).eq("id", job.id);
  return {
    ok: created > 0, created, skipped: skipped.length, flagged, cost,
    message: `${created} variation${created === 1 ? "" : "s"} drafted for review${flagged ? ` (${flagged} flagged by the automatic check)` : ""}${skipped.length ? `, ${skipped.length} discarded` : ""}.`,
  };
}
