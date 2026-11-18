"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { isAllowedExamDate } from "@/lib/student/countdown";
import { createClient } from "@/lib/supabase/server";

export type ExamDateState = { ok?: boolean; error?: string; stage?: "PE" | "ME"; date?: string };

const input = z.object({ stage: z.enum(["PE", "ME"]), date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/) });

/** The student entered the date of their PE or ME for the countdown (their own profile only, under RLS). */
export async function saveExamDateAction(_prev: ExamDateState, formData: FormData): Promise<ExamDateState> {
  const user = await getCurrentUser();
  if (!user) return { error: "Please sign in again." };
  const parsed = input.safeParse({ stage: formData.get("stage"), date: formData.get("date") });
  if (!parsed.success) return { error: "Choose PE or ME and pick your exam date." };
  const { stage, date } = parsed.data;
  if (!isAllowedExamDate(date)) return { error: "Pick a date from today up to three years ahead." };
  const db = await createClient();
  const { error } = await db.from("profiles").update(stage === "PE" ? { pe_exam_date: date } : { me_exam_date: date }).eq("id", user.id);
  if (error) return { error: "Your date could not be saved. Please try again." };
  revalidatePath("/dashboard", "layout");
  return { ok: true, stage, date };
}
