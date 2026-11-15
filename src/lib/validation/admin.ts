import { z } from "zod";

const emptyToNull = (v: unknown) => (typeof v === "string" && v.trim() === "" ? null : v);
const optInt = (min: number, max: number) => z.preprocess(emptyToNull, z.coerce.number().int().min(min).max(max).nullable());
const optNum = (min: number, max: number) => z.preprocess(emptyToNull, z.coerce.number().min(min).max(max).nullable());
const optDate = z.preprocess(emptyToNull, z.iso.date().nullable());
const optText = (max: number) => z.preprocess(emptyToNull, z.string().trim().max(max).nullable());
const uuid = z.uuid();

export const verificationStatus = z.enum(["official_verified", "unverified", "superseded"]);

export const paperUpdateSchema = z.object({
  id: uuid,
  title: z.string().trim().min(2).max(300),
  description: optText(2000),
  weightage_percent: optNum(0, 100),
  duration_minutes: optInt(1, 600),
  question_count: optInt(1, 1000),
  max_marks: optNum(1, 10000),
  verification_status: verificationStatus,
});

export const cycleUpdateSchema = z
  .object({
    id: uuid,
    name: z.string().trim().min(2).max(80),
    status: z.enum(["planned", "announced", "registration_open", "pe_completed", "me_completed", "closed"]),
    registration_opens: optDate,
    registration_closes: optDate,
    pe_date: optDate,
    me_start_date: optDate,
    me_end_date: optDate,
    pe_cutoff_note: optText(1000),
    notes: optText(2000),
    verification_status: verificationStatus,
  })
  .refine((c) => !c.me_start_date || !c.me_end_date || c.me_end_date >= c.me_start_date, {
    path: ["me_end_date"],
    message: "ME end date must be on or after the start date.",
  });

export const categoryUpdateSchema = z.object({
  id: uuid,
  name: z.string().trim().min(2).max(120),
  description: optText(2000),
  eligibility_summary: optText(2000),
  pe_exempt: z.preprocess((v) => v === "on", z.boolean()),
  is_active: z.preprocess((v) => v === "on", z.boolean()),
});

const slug = z.string().trim().toLowerCase().regex(/^[a-z0-9-]+$/, "Use lowercase letters, numbers and hyphens only.").max(80);

export const topicCreateSchema = z.object({
  subject_id: uuid,
  parent_id: z.preprocess(emptyToNull, uuid.nullable()),
  name: z.string().trim().min(2).max(160),
  slug,
});

export const subjectCreateSchema = z.object({
  stage: z.enum(["PE", "ME"]),
  name: z.string().trim().min(2).max(160),
  slug,
  description: optText(1000),
});

export const toggleSchema = z.object({ id: uuid, is_active: z.enum(["true", "false"]).transform((v) => v === "true") });

export const packageUpdateSchema = z
  .object({
    id: uuid,
    name: z.string().trim().min(2).max(120),
    tagline: optText(200),
    description: optText(2000),
    price: z.coerce.number().min(0).max(1000000),
    promo_price: optNum(0, 1000000),
    promo_starts_at: optDate,
    promo_ends_at: optDate,
    access_days: optInt(1, 3650),
    access_ends_at: optDate,
    status: z.enum(["draft", "coming_soon", "available", "retired"]),
    features: z.string().max(5000).transform((s) => s.split("\n").map((l) => l.trim()).filter(Boolean)),
    terms: optText(4000),
  })
  .refine((p) => p.promo_price === null || p.promo_price < p.price, { path: ["promo_price"], message: "Promotional price must be lower than the regular price." })
  .refine((p) => p.status !== "available" || p.access_days !== null || p.access_ends_at !== null, {
    path: ["access_days"],
    message: "Set an access period (days or end date) before making a package available.",
  });

export const roleChangeSchema = z.object({
  user_id: uuid,
  role: z.enum(["admin", "content_reviewer", "question_developer", "researcher", "subject_specialist", "content_writer", "evaluator"]),
});

export const messageStatusSchema = z.object({ id: uuid, status: z.enum(["new", "in_progress", "resolved", "spam"]) });

const emptyNull = (v: unknown) => (typeof v === "string" && v.trim() === "" ? null : v);

export const examSettingsSchema = z.object({
  id: z.preprocess(emptyNull, z.uuid().nullable()),
  title: z.string().trim().min(3, "Give the examination a title.").max(200),
  slug: z.string().trim().toLowerCase().regex(/^[a-z0-9-]+$/, "Web address: lowercase letters, numbers and hyphens only.").max(80),
  description: z.preprocess(emptyNull, z.string().trim().max(1000).nullable()),
  instructions: z.preprocess(emptyNull, z.string().trim().max(5000).nullable()),
  stage: z.enum(["PE", "ME"]),
  kind: z.enum(["mock", "sample", "historical", "practice", "revision"]),
  cycle_id: z.preprocess(emptyNull, z.uuid().nullable()),
  paper_id: z.preprocess(emptyNull, z.uuid().nullable()),
  category_id: z.preprocess(emptyNull, z.uuid().nullable()),
  duration_minutes: z.coerce.number().int().min(1, "Duration must be at least 1 minute.").max(600),
  negative_mark_per_wrong: z.coerce.number().min(0).max(10),
  omr_mode: z.preprocess((v) => v === "on", z.boolean()),
  is_free: z.preprocess((v) => v === "on", z.boolean()),
  shuffle_questions: z.preprocess((v) => v === "on", z.boolean()),
});

export const examStatusSchema = z.object({ id: z.uuid(), status: z.enum(["draft", "published", "archived"]) });
export const examQuestionAddSchema = z.object({ exam_id: z.uuid(), question_id: z.uuid(), section: z.string().trim().max(120).optional() });
export const examQuestionRefSchema = z.object({ id: z.uuid(), direction: z.enum(["up", "down"]).optional() });
