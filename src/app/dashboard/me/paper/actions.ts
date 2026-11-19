"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

/**
 * ME paper page: practise one question of a type, or start a personal mock paper. Each student gets questions
 * they have not seen, preferring ones fewer other students have had (database functions, run as the student).
 */
const MESSAGES: Record<string, string> = {
  NO_MISTAKES: "There is nothing to retry: no skipped, wrong or low-scoring answers.",
  ATTEMPT_NOT_FOUND: "This mock could not be found.",
  NO_QUESTIONS: "No questions of this type are ready yet. Please try another type or come back soon.",
  NO_PATTERN: "Mock papers for this paper open once its RCSC pattern is loaded.",
  NOT_ENOUGH_QUESTIONS: "There are not yet enough questions for a full mock paper. Please practise by question type for now.",
  ACCESS_REQUIRED: "This is part of ME Premium.",
  RATE_LIMIT: "Daily limit reached. Please try again tomorrow.",
  QUESTION_NOT_FOUND: "This paper is not available for your entry.",
};
const message = (e: { message: string } | null | undefined, fallback: string) =>
  Object.entries(MESSAGES).find(([k]) => e?.message.includes(k))?.[1] ?? fallback;

const TYPES = ["short_answer", "long_answer", "essay", "analytical", "descriptive", "translation", "passage", "case_study"] as const;
export type StartState = { error?: string };

export async function startPaperPracticeAction(_prev: StartState, formData: FormData): Promise<StartState> {
  if (!(await getCurrentUser())) redirect("/login");
  const parsed = z.object({ paper: z.uuid(), type: z.enum(TYPES) }).safeParse({ paper: formData.get("paper"), type: formData.get("type") });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await createClient();
  const { data, error } = await db.rpc("start_paper_practice", { _paper: parsed.data.paper, _type: parsed.data.type });
  if (error || !data) return { error: message(error, "The practice could not be started.") };
  revalidatePath(`/dashboard/me/paper/${parsed.data.paper}`);
  redirect(`/exam/${data as string}`);
}

export async function startPaperMockAction(_prev: StartState, formData: FormData): Promise<StartState> {
  if (!(await getCurrentUser())) redirect("/login");
  const parsed = z.object({ paper: z.uuid() }).safeParse({ paper: formData.get("paper") });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await createClient();
  const { data, error } = await db.rpc("start_paper_mock", { _paper: parsed.data.paper });
  if (error || !data) return { error: message(error, "The mock paper could not be started.") };
  revalidatePath(`/dashboard/me/paper/${parsed.data.paper}`);
  redirect(`/exam/${data as string}`);
}

/** "Retry my mistakes" after an ME mock: an untimed practice with only the skipped, wrong or low-scoring questions. */
export async function startRetryAction(_prev: StartState, formData: FormData): Promise<StartState> {
  if (!(await getCurrentUser())) redirect("/login");
  const parsed = z.object({ attempt: z.uuid() }).safeParse({ attempt: formData.get("attempt") });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await createClient();
  const { data, error } = await db.rpc("start_me_retry", { _attempt_id: parsed.data.attempt });
  if (error || !data) return { error: message(error, "The retry could not be started.") };
  revalidatePath(`/dashboard/results/${parsed.data.attempt}`);
  redirect(`/exam/${data as string}`);
}
