import type { QuestionPayload } from "@/lib/validation/question";
import { questionPayloadSchema, QUESTION_TYPES } from "@/lib/validation/question";

export const CSV_HEADERS = [
  "stage", "type", "subject", "topic", "difficulty", "marks", "question",
  "option_a", "option_b", "option_c", "option_d", "option_e", "correct",
  "explanation", "model_answer", "word_limit", "reference", "reference_url", "free_sample",
] as const;

export type Lookups = {
  subjects: { id: string; stage: string; slug: string; name: string }[];
  topics: { id: string; subject_id: string; slug: string; name: string }[];
};

export type RowResult = { row: number; payload?: QuestionPayload; errors: string[] };

const TYPE_ALIASES: Record<string, (typeof QUESTION_TYPES)[number]> = {
  mcq: "mcq", "multiple choice": "mcq", objective: "mcq",
  short: "short_answer", short_answer: "short_answer", "short answer": "short_answer",
  long: "long_answer", long_answer: "long_answer", "long answer": "long_answer",
  essay: "essay", analytical: "analytical", descriptive: "descriptive",
};

const norm = (s: string) => s.trim().toLowerCase();

/** Maps one CSV record to a question payload, reporting every problem found. */
export function mapCsvRecord(rec: Record<string, string>, rowNumber: number, lookups: Lookups): RowResult {
  const errors: string[] = [];
  const stage = rec.stage?.toUpperCase();
  if (stage !== "PE" && stage !== "ME") errors.push("stage must be PE or ME");
  const type = TYPE_ALIASES[norm(rec.type ?? "mcq") || "mcq"];
  if (!type) errors.push(`unknown type “${rec.type}”`);

  let subject_id: string | null = null;
  if (rec.subject) {
    const s = lookups.subjects.find((x) => x.stage === stage && (norm(x.slug) === norm(rec.subject) || norm(x.name) === norm(rec.subject)));
    if (!s) errors.push(`subject “${rec.subject}” not found for ${stage ?? "this stage"}`);
    else subject_id = s.id;
  }
  let topic_id: string | null = null;
  if (rec.topic) {
    const t = lookups.topics.find((x) => x.subject_id === subject_id && (norm(x.slug) === norm(rec.topic) || norm(x.name) === norm(rec.topic)));
    if (!t) errors.push(`topic “${rec.topic}” not found in that subject`);
    else topic_id = t.id;
  }

  const letters = ["a", "b", "c", "d", "e", "f", "g", "h"];
  const optionTexts = letters.map((l) => rec[`option_${l}`] ?? "").filter((_, i, arr) => arr.slice(i).some((v) => v));
  const correct = norm(rec.correct ?? "");
  const correctIndex = letters.indexOf(correct);
  if (type === "mcq") {
    if (correctIndex < 0) errors.push("correct must be a letter (A–H)");
    else if (!optionTexts[correctIndex]) errors.push(`correct answer ${correct.toUpperCase()} has no option text`);
  }

  const diff = norm(rec.difficulty || "standard");
  const payload = {
    id: null,
    stage: stage as "PE" | "ME",
    question_type: type ?? "mcq",
    stem: rec.question ?? "",
    explanation: rec.explanation ?? "",
    model_answer: rec.model_answer ?? "",
    word_limit: rec.word_limit ?? "",
    subject_id,
    topic_id,
    paper_id: null,
    category_id: null,
    difficulty: (["foundation", "standard", "advanced"].includes(diff) ? diff : "standard") as "standard",
    marks: rec.marks || "1",
    estimated_seconds: "",
    is_free_sample: ["yes", "y", "true", "1"].includes(norm(rec.free_sample ?? "")),
    options: type === "mcq" ? optionTexts.map((body, i) => ({ id: null, body, is_correct: i === correctIndex })) : [],
    rubric: [],
    references: rec.reference ? [{ citation: rec.reference, url: rec.reference_url ?? "" }] : [],
  } as unknown as QuestionPayload;

  if (errors.length === 0) {
    const v = questionPayloadSchema.safeParse(payload);
    if (!v.success) errors.push(...new Set(v.error.issues.map((i) => i.message)));
  }
  return { row: rowNumber, payload: errors.length ? undefined : payload, errors };
}
