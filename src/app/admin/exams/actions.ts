"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { examQuestionAddSchema, examQuestionRefSchema, examSettingsSchema, examStatusSchema } from "@/lib/validation/admin";
import { toFieldErrors } from "@/lib/validation/auth";

const MESSAGES: [string, string][] = [
  ["exams_slug_key", "Another examination already uses that web address."],
  ["All questions must be published", "Publish every question in this examination first."],
  ["needs at least one question", "Add at least one question before publishing."],
  ["STAGE_MISMATCH", "That question belongs to the other stage (PE/ME)."],
  ["QUESTION_NOT_USABLE", "Rejected or archived questions cannot be added."],
  ["exam_questions_exam_id_question_id_key", "That question is already in this examination."],
  ["EXAM_PUBLISHED", "Unpublish the examination before removing questions."],
  ["EXAM_HAS_ATTEMPTS", "Students have already taken this examination, so its questions cannot be removed. Create a new examination instead."],
];

function message(error: { message: string }, fallback: string) {
  return MESSAGES.find(([k]) => error.message.includes(k))?.[1] ?? fallback;
}

async function guard(): Promise<ActionState | null> {
  try {
    await assertPermission("exams.manage");
    return null;
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
}

export async function saveExam(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = examSettingsSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Please correct the errors below.", fieldErrors: toFieldErrors(parsed.error) };
  const { id, ...data } = parsed.data;
  const db = await createClient();
  if (!id) {
    const { data: row, error } = await db.from("exams").insert({ ...data, status: "draft" }).select("id").single();
    if (error) return { status: "error", message: message(error, "The examination could not be created.") };
    revalidatePath("/admin/exams");
    redirect(`/admin/exams/${row.id}`);
  }
  const { data: rows, error } = await db.from("exams").update(data).eq("id", id).select("id");
  if (error) return { status: "error", message: message(error, "The examination could not be saved.") };
  if (!rows?.length) return { status: "error", message: "Nothing was changed." };
  revalidatePath(`/admin/exams/${id}`);
  return { status: "success", message: "Saved." };
}

export async function setExamStatus(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = examStatusSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.from("exams").update({ status: parsed.data.status }).eq("id", parsed.data.id);
  if (error) return { status: "error", message: message(error, "The status could not be changed.") };
  revalidatePath(`/admin/exams/${parsed.data.id}`);
  revalidatePath("/admin/exams");
  return { status: "success", message: parsed.data.status === "published" ? "Published — students can now see it." : "Status updated." };
}

export async function addExamQuestion(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = examQuestionAddSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Choose a question to add." };
  const db = await createClient();
  const { error } = await db.rpc("add_exam_question", { _exam_id: parsed.data.exam_id, _question_id: parsed.data.question_id, _section: parsed.data.section ?? null });
  if (error) return { status: "error", message: message(error, "The question could not be added.") };
  revalidatePath(`/admin/exams/${parsed.data.exam_id}`);
  return { status: "success", message: "Added." };
}

export async function removeExamQuestion(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = examQuestionRefSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("remove_exam_question", { _exam_question_id: parsed.data.id });
  if (error) return { status: "error", message: message(error, "The question could not be removed.") };
  revalidatePath("/admin/exams", "layout");
  return { status: "success", message: "Removed." };
}

export async function moveExamQuestion(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const denied = await guard();
  if (denied) return denied;
  const parsed = examQuestionRefSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success || !parsed.data.direction) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("move_exam_question", { _exam_question_id: parsed.data.id, _direction: parsed.data.direction === "up" ? -1 : 1 });
  if (error) return { status: "error", message: message(error, "The question could not be moved.") };
  revalidatePath("/admin/exams", "layout");
  return { status: "success", message: "" };
}
