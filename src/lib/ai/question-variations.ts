import { z } from "zod";
import { mcqDraftSchema, writtenDraftSchema } from "./question-drafts";

/**
 * AI variations of an existing question (extends M6 question drafting).
 * Pure functions and schemas only — unit-tested without any provider.
 */

export const VARIATION_TYPES = [
  { key: "new_scenario", label: "New scenario", instruction: "Test the same concept through a different situation, example or context." },
  { key: "new_numbers", label: "New numbers", instruction: "Keep the reasoning but change the numerical values (recalculate the answer carefully). Only for questions that involve numbers." },
  { key: "other_angle", label: "Another angle", instruction: "Ask about the same concept from a different direction (e.g. cause instead of effect, definition instead of example)." },
  { key: "easier", label: "Easier", instruction: "A simpler question on the same concept, suitable for a student building foundations." },
  { key: "harder", label: "Harder", instruction: "A more demanding question on the same concept: more steps, finer distinctions or less familiar context." },
  { key: "application", label: "Application", instruction: "Require the student to apply the concept to a realistic Bhutanese situation, or to analyse and reason with it." },
  { key: "same_objective", label: "New question, same objective", instruction: "A completely new question testing the same learning objective, not visibly based on the source." },
] as const;
export type VariationType = (typeof VARIATION_TYPES)[number]["key"];
export const VARIATION_KEYS = VARIATION_TYPES.map((v) => v.key) as [VariationType, ...VariationType[]];
export const variationLabel = (k: string) => VARIATION_TYPES.find((v) => v.key === k)?.label ?? k;

const extra = {
  variation_type: z.enum(VARIATION_KEYS),
  what_changed: z.string().describe("One sentence: how this question differs from the source"),
};
export const mcqVariationSchema = z.object({
  concept: z.string().describe("The concept or learning objective the source question tests"),
  questions: z.array(mcqDraftSchema.shape.questions.element.extend(extra)),
});
export const writtenVariationSchema = z.object({
  concept: z.string(),
  questions: z.array(writtenDraftSchema.shape.questions.element.extend(extra)),
});
export type McqVariation = z.infer<typeof mcqVariationSchema>["questions"][number];
export type WrittenVariation = z.infer<typeof writtenVariationSchema>["questions"][number];

export type VariationSource = {
  stage: "PE" | "ME";
  kind: "mcq" | "written";
  origin: string;
  sourceYear: number | null;
  subject: string | null;
  topic: string | null;
  stem: string;
  options?: string[];
  answer?: string;
  explanation?: string | null;
  modelAnswer?: string | null;
  marks: number;
  wordLimit?: number | null;
};

export const VARIATION_SYSTEM = `You create practice questions for Soma Preparations, an independent platform that helps Bhutanese graduates prepare for the Bhutan Civil Service Examination (BCSE) of the Royal Civil Service Commission (RCSC).

You are given one SOURCE question. First identify the concept or learning objective it tests. Then write new questions that test the same concept in the ways requested.

Rules:
- Never copy the source or change only a few words. Each new question must read as a different question, while testing the same concept.
- Your questions are practice material written by AI. They are not RCSC questions and must never claim or imply to be from a real examination.
- Factual accuracy is essential. Use only well-established, stable facts; if something must be checked, say exactly what in fact_check_notes and lower your confidence.
- When changing numbers, recalculate every answer and option carefully.
- Multiple choice: exactly four options, exactly one unambiguously correct answer, plausible distractors of similar length, no "all/none of the above". Explanations say why the answer is right and why each distractor is wrong.
- Written questions: a clear task, a model answer of about the suggested length, and a rubric whose marks add up to the question's total.
- Stay within the same subject and examination level. Clear British English; respectful and neutral about people and institutions.`;

export function buildVariationPrompt(s: VariationSource, types: VariationType[]): string {
  const lines: string[] = [];
  lines.push(`Write ${types.length} new ${s.kind === "mcq" ? "multiple-choice" : "written"} question${types.length === 1 ? "" : "s"} for the BCSE ${s.stage === "PE" ? "Preliminary Examination" : "Main Examination"}, one for each of these variation types, in this order:`);
  types.forEach((t, i) => {
    const v = VARIATION_TYPES.find((x) => x.key === t)!;
    lines.push(`${i + 1}. ${v.key} — ${v.instruction}`);
  });
  lines.push("");
  if (s.subject) lines.push(`Subject: ${s.subject}${s.topic ? `; topic: ${s.topic}` : ""}.`);
  if (s.kind === "written") lines.push(`Each question is worth ${s.marks} marks${s.wordLimit ? `; suggested answer length about ${s.wordLimit} words` : ""}. Rubric marks must add up to ${s.marks}.`);
  lines.push(s.origin === "historical_official"
    ? `The source is from a past RCSC paper${s.sourceYear ? ` (${s.sourceYear})` : ""}. Do not reproduce it.`
    : "The source is an existing practice question.");
  lines.push("", "SOURCE QUESTION:", s.stem);
  if (s.options?.length) lines.push(`Options: ${s.options.join(" | ")}`);
  if (s.answer) lines.push(`Correct answer: ${s.answer}`);
  if (s.explanation) lines.push(`Explanation: ${s.explanation}`);
  if (s.modelAnswer) lines.push(`Model answer: ${s.modelAnswer.slice(0, 3000)}`);
  if (types.includes("new_numbers")) lines.push("", "If the source involves no numbers, write the new_numbers item as a new_scenario variation and set variation_type accordingly.");
  return lines.join("\n");
}

// ---------------------------------------------------------------------------
// Independent check: a second AI call answers the drafts without the key.
// ---------------------------------------------------------------------------
export const checkSchema = z.object({
  reviews: z.array(z.object({
    number: z.number().int().describe("The question number as given"),
    chosen_option: z.number().int().describe("For multiple choice: index (0-3) of the option you believe is correct; -1 if none or several are defensible; -1 for written questions"),
    clear: z.boolean().describe("The question is clear and unambiguous"),
    single_correct: z.boolean().describe("Multiple choice: exactly one option is defensibly correct. Written: the task is answerable"),
    plausible_distractors: z.boolean().describe("Multiple choice: wrong options are plausible. Written: true"),
    syllabus_fit: z.boolean().describe("Fits the stated subject and examination level"),
    factual_concerns: z.string().describe("Specific facts that look wrong or uncertain; empty if none"),
    model_answer_ok: z.boolean().describe("Written: the model answer is accurate and answers the task. Multiple choice: true"),
    difficulty: z.enum(["foundation", "standard", "advanced"]),
  })),
});
export type DraftCheckResult = z.infer<typeof checkSchema>["reviews"][number];

export const CHECK_SYSTEM = `You are a careful examiner checking draft practice questions for the Bhutan Civil Service Examination before a human reviewer sees them. For each question, answer it yourself first, then judge its quality honestly. Do not assume the drafts are correct.`;

export function buildCheckPrompt(subject: string | null, stage: "PE" | "ME", drafts: { stem: string; options?: string[]; modelAnswer?: string }[]): string {
  const lines = [`Subject: ${subject ?? "unspecified"} (BCSE ${stage === "PE" ? "Preliminary" : "Main"} Examination).`, ""];
  drafts.forEach((d, i) => {
    lines.push(`Question ${i + 1}: ${d.stem}`);
    d.options?.forEach((o, j) => lines.push(`  ${j}. ${o}`));
    if (d.modelAnswer) lines.push(`  Proposed model answer: ${d.modelAnswer.slice(0, 2500)}`);
    lines.push("");
  });
  return lines.join("\n");
}

export type ReviewVerdict = { verdict: "pass" | "flag"; issues: string[] };

/** Combines the independent check with the draft's own key and confidence. */
export function reviewVerdict(kind: "mcq" | "written", correctIndex: number | null, confidence: string, check: DraftCheckResult | undefined, similarityToSource: number): ReviewVerdict {
  const issues: string[] = [];
  if (!check) issues.push("Automatic check did not return a result");
  else {
    if (kind === "mcq" && check.chosen_option !== correctIndex) issues.push(check.chosen_option < 0 ? "Checker found no single correct option" : `Checker chose option ${String.fromCharCode(65 + check.chosen_option)}, not the key`);
    if (!check.clear) issues.push("May be unclear or ambiguous");
    if (!check.single_correct) issues.push(kind === "mcq" ? "More than one option may be correct" : "Task may not be answerable as written");
    if (!check.plausible_distractors) issues.push("Weak distractors");
    if (!check.syllabus_fit) issues.push("May not fit the subject or level");
    if (!check.model_answer_ok) issues.push("Model answer may be inaccurate");
    if (check.factual_concerns.trim()) issues.push(`Facts to check: ${check.factual_concerns.trim().slice(0, 300)}`);
  }
  if (confidence === "low") issues.push("The writer had low confidence");
  if (similarityToSource >= 0.6) issues.push("Close to the source wording");
  return { verdict: issues.length ? "flag" : "pass", issues };
}

/** Word-overlap similarity (0–1), a quick guard against near-copies of the source. */
export function wordSimilarity(a: string, b: string): number {
  const words = (s: string) => new Set(s.toLowerCase().replace(/[^\p{L}\p{N}\s]/gu, " ").split(/\s+/).filter((w) => w.length > 2));
  const A = words(a), B = words(b);
  if (!A.size || !B.size) return 0;
  let both = 0;
  for (const w of A) if (B.has(w)) both++;
  return both / (A.size + B.size - both);
}

export { originLabel } from "@/lib/exam/origin";
