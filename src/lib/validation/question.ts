import { z } from "zod";

export const QUESTION_TYPES = ["mcq", "short_answer", "long_answer", "essay", "analytical", "descriptive"] as const;
export const DIFFICULTIES = ["foundation", "standard", "advanced"] as const;

const optUuid = z.preprocess((v) => (v === "" || v === undefined ? null : v), z.uuid().nullable());
const optInt = (min: number, max: number) =>
  z.preprocess((v) => (v === "" || v === null || v === undefined ? null : Number(v)), z.number().int().min(min).max(max).nullable());

export const questionPayloadSchema = z
  .object({
    id: optUuid,
    stage: z.enum(["PE", "ME"]),
    question_type: z.enum(QUESTION_TYPES),
    stem: z.string().trim().min(5, "Write the question (at least 5 characters).").max(20000),
    explanation: z.string().trim().max(10000).default(""),
    model_answer: z.string().trim().max(20000).default(""),
    word_limit: optInt(10, 5000),
    subject_id: optUuid,
    topic_id: optUuid,
    paper_id: optUuid,
    category_id: optUuid,
    difficulty: z.enum(DIFFICULTIES),
    marks: z.coerce.number().positive("Marks must be more than zero.").max(1000),
    estimated_seconds: optInt(5, 36000),
    is_free_sample: z.boolean(),
    options: z
      .array(z.object({ id: optUuid, body: z.string().trim().min(1, "Options cannot be empty.").max(2000), is_correct: z.boolean() }))
      .max(8, "At most 8 options."),
    rubric: z
      .array(
        z.object({
          id: optUuid,
          label: z.string().trim().min(1, "Each rubric criterion needs a name.").max(120),
          description: z.string().trim().min(1, "Describe each rubric criterion.").max(2000),
          max_marks: z.coerce.number().positive("Rubric marks must be more than zero.").max(1000),
        }),
      )
      .max(20),
    references: z.array(z.object({ citation: z.string().trim().max(500), url: z.string().trim().max(1000) })).max(10),
  })
  .superRefine((q, ctx) => {
    if (q.question_type === "mcq") {
      if (q.options.length < 2) ctx.addIssue({ code: "custom", path: ["options"], message: "Add at least two options." });
      if (q.options.filter((o) => o.is_correct).length !== 1)
        ctx.addIssue({ code: "custom", path: ["options"], message: "Mark exactly one option as correct." });
    }
    for (const r of q.references) {
      if (r.url && !/^https?:\/\//i.test(r.url)) ctx.addIssue({ code: "custom", path: ["references"], message: "Reference links must start with http:// or https://." });
    }
    if (q.question_type !== "mcq" && q.rubric.length) {
      const total = q.rubric.reduce((s, r) => s + r.max_marks, 0);
      if (Math.abs(total - q.marks) > 0.001)
        ctx.addIssue({ code: "custom", path: ["rubric"], message: `Rubric marks add up to ${total}, but the question is worth ${q.marks}.` });
    }
  });

export type QuestionPayload = z.input<typeof questionPayloadSchema>;

export const REVIEW_ACTIONS = ["submit", "verify", "request_revision", "reject", "publish", "unpublish", "archive"] as const;
export type ReviewAction = (typeof REVIEW_ACTIONS)[number];
