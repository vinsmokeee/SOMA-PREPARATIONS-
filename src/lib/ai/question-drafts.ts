import { z } from "zod";

/**
 * Prompts, output schemas and validation for AI-drafted questions.
 * Pure functions (no I/O) so they are unit-tested independently of any provider.
 */

const reference = z.object({
  citation: z.string().describe("Where a reviewer can verify the fact, e.g. an Act, an official publication or an RCSC announcement"),
  url: z.string().describe("An https URL only if you are certain it is correct; otherwise an empty string"),
});

export const mcqDraftSchema = z.object({
  questions: z.array(
    z.object({
      stem: z.string().describe("The question text"),
      options: z.array(z.string()).describe("Exactly four answer options, without letters"),
      correct_option: z.number().int().describe("Index (0-3) of the correct option"),
      explanation: z.string().describe("Why the correct answer is right and why each other option is wrong"),
      difficulty: z.enum(["foundation", "standard", "advanced"]),
      topic_suggestion: z.string().describe("A short topic name for organising the question"),
      references: z.array(reference),
      fact_check_notes: z.string().describe("Anything a reviewer must verify before publishing; empty if purely logical/linguistic"),
      confidence: z.enum(["high", "medium", "low"]).describe("Your confidence that the question and answer are factually correct and unambiguous"),
    }),
  ),
});

export const writtenDraftSchema = z.object({
  questions: z.array(
    z.object({
      stem: z.string(),
      question_type: z.enum(["short_answer", "long_answer", "essay", "analytical", "descriptive"]),
      word_limit: z.number().int(),
      model_answer: z.string().describe("A high-quality model answer of about the suggested length"),
      rubric: z.array(z.object({ label: z.string(), description: z.string(), max_marks: z.number() })),
      references: z.array(reference),
      fact_check_notes: z.string(),
      confidence: z.enum(["high", "medium", "low"]),
    }),
  ),
});

export type McqDraft = z.infer<typeof mcqDraftSchema>["questions"][number];
export type WrittenDraft = z.infer<typeof writtenDraftSchema>["questions"][number];

export type GenerationRequest = {
  stage: "PE" | "ME";
  kind: "mcq" | "written";
  writtenType?: WrittenDraft["question_type"];
  subject: { name: string; description: string | null; isOfficial: boolean };
  topic?: string | null;
  difficulty: "foundation" | "standard" | "advanced" | "mixed";
  count: number;
  marks: number;
  wordLimit?: number | null;
  guidance?: string | null;
  styleExamples: { stem: string; options?: string[]; answer?: string }[];
  existingStems: string[];
};

export const SYSTEM_PROMPT = `You write original practice questions for Soma Preparations, an independent platform that helps Bhutanese graduates prepare for the Bhutan Civil Service Examination (BCSE), conducted by the Royal Civil Service Commission (RCSC). The Preliminary Examination (PE) is objective (multiple choice); the Main Examination (ME) has written papers.

Your drafts are reviewed by a person before any student sees them, so accuracy and honesty matter more than quantity.

Rules:
- Write genuinely original questions. Example questions are given only to show style and level: never copy them or reword them closely, and never reproduce questions from real past papers.
- Factual accuracy is essential. Use only well-established, stable facts. Avoid facts that change often (office holders, recent figures, current events) unless they are given to you in the request. If a question depends on a fact you are not certain of, either choose a different question or state exactly what must be checked in fact_check_notes and lower your confidence.
- Multiple choice: exactly four options, exactly one unambiguously correct answer, plausible distractors of similar length and form, no "all of the above" or "none of the above".
- Explanations teach: say why the answer is right and why each distractor is wrong.
- Written questions: a clear task, a model answer of about the suggested length, and a rubric whose marks add up to the question's total.
- Use clear British English. Be respectful and neutral about people, institutions and politics; avoid controversy and anything defamatory.
- Never imply that a question predicts the actual RCSC examination.`;

export function buildGenerationPrompt(r: GenerationRequest): string {
  const lines: string[] = [];
  lines.push(`Write ${r.count} ${r.kind === "mcq" ? "multiple-choice" : (r.writtenType ?? "written").replace("_", " ")} question${r.count === 1 ? "" : "s"} for the BCSE ${r.stage === "PE" ? "Preliminary Examination" : "Main Examination"}.`);
  lines.push(`Subject: ${r.subject.name}${r.subject.isOfficial ? " (a subject area named by the RCSC)" : ""}.`);
  if (r.subject.description) lines.push(`About this subject: ${r.subject.description}`);
  if (r.topic) lines.push(`Topic: ${r.topic}.`);
  lines.push(r.difficulty === "mixed" ? "Difficulty: a mix of foundation, standard and advanced." : `Difficulty: ${r.difficulty}.`);
  if (r.kind === "written") lines.push(`Each question is worth ${r.marks} marks${r.wordLimit ? `; suggested answer length about ${r.wordLimit} words` : ""}. Rubric marks must add up to ${r.marks}.`);
  if (r.guidance?.trim()) lines.push(`Additional guidance from the Soma reviewer: ${r.guidance.trim()}`);
  if (r.styleExamples.length) {
    lines.push("", "Examples of existing questions, for style and level only — do not copy or closely reword:");
    r.styleExamples.forEach((e, i) => {
      lines.push(`${i + 1}. ${e.stem}`);
      if (e.options?.length) lines.push(`   Options: ${e.options.join(" | ")}${e.answer ? ` (answer: ${e.answer})` : ""}`);
    });
  }
  if (r.existingStems.length) {
    lines.push("", "Questions already in the bank on this subject — write different ones:");
    for (const s of r.existingStems) lines.push(`- ${s}`);
  }
  return lines.join("\n");
}

export type DraftCheck = { ok: true } | { ok: false; reason: string };

export function checkMcqDraft(d: McqDraft): DraftCheck {
  if (d.stem.trim().length < 10) return { ok: false, reason: "Question text too short" };
  if (d.options.length !== 4) return { ok: false, reason: `Expected 4 options, got ${d.options.length}` };
  if (d.options.some((o) => !o.trim())) return { ok: false, reason: "An option is empty" };
  if (new Set(d.options.map((o) => o.trim().toLowerCase())).size !== 4) return { ok: false, reason: "Options are not distinct" };
  if (!(d.correct_option >= 0 && d.correct_option < 4)) return { ok: false, reason: "Correct option index out of range" };
  if (d.explanation.trim().length < 20) return { ok: false, reason: "Explanation missing or too short" };
  if (/all of the above|none of the above/i.test(d.options.join(" "))) return { ok: false, reason: "Uses all/none of the above" };
  return { ok: true };
}

export function checkWrittenDraft(d: WrittenDraft, marks: number): DraftCheck {
  if (d.stem.trim().length < 15) return { ok: false, reason: "Question text too short" };
  if (d.model_answer.trim().length < 40) return { ok: false, reason: "Model answer missing or too short" };
  if (d.rubric.length === 0) return { ok: false, reason: "No rubric" };
  const total = d.rubric.reduce((s, r) => s + r.max_marks, 0);
  if (Math.abs(total - marks) > 0.001) return { ok: false, reason: `Rubric adds up to ${total}, not ${marks}` };
  if (d.rubric.some((r) => !(r.max_marks > 0) || !r.label.trim())) return { ok: false, reason: "Invalid rubric criterion" };
  return { ok: true };
}

/** Keeps only https references with a citation; drops anything else. */
export function cleanReferences(refs: { citation: string; url: string }[]) {
  return refs
    .filter((r) => r.citation.trim())
    .slice(0, 5)
    .map((r) => ({ citation: r.citation.trim().slice(0, 300), url: /^https:\/\/[^\s]+$/i.test(r.url.trim()) ? r.url.trim().slice(0, 500) : "" }));
}

// ---------------------------------------------------------------------------
// Past-paper pattern analysis
// ---------------------------------------------------------------------------

export const analysisSchema = z.object({
  summary: z.string().describe("Two to four sentences on what this subject's questions test"),
  frequent_topics: z.array(z.object({ topic: z.string(), share: z.enum(["very common", "common", "occasional"]), note: z.string() })),
  question_styles: z.array(z.string()).describe("Recurring formats and wording styles"),
  difficulty_observations: z.string(),
  trends: z.string().describe("Changes over the years, if the data shows any; say if it does not"),
  gaps_and_suggestions: z.array(z.string()).describe("Areas worth more original practice questions"),
});
export type PaperAnalysis = z.infer<typeof analysisSchema>;

export const ANALYSIS_SYSTEM = `You analyse past BCSE questions for Soma Preparations to guide the writing of original practice questions. Describe patterns honestly and only from the data given. Do not predict which questions will appear in a future examination, and say so if the sample is too small to show a trend.`;

export function buildAnalysisPrompt(subject: string, items: { year: number | null; stem: string }[]): string {
  return [
    `Subject: ${subject}. ${items.length} past questions follow, with their examination year where known.`,
    "",
    ...items.map((q, i) => `${i + 1}. [${q.year ?? "year unknown"}] ${q.stem.replace(/\s+/g, " ").slice(0, 400)}`),
  ].join("\n");
}
