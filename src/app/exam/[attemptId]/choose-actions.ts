"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const MESSAGES: Record<string, string> = {
  WRONG_NUMBER_CHOSEN: "Please choose exactly the number of questions asked in each part.",
  INVALID_CHOICE: "One of the chosen questions is not in this paper. Please choose again.",
  ATTEMPT_CLOSED: "This paper has already ended.",
  ATTEMPT_NOT_FOUND: "This paper could not be found.",
};

/** The student's choice of questions in an "answer any N" mock (checked again in the database). */
export async function chooseQuestionsAction(attemptId: string, groups: string[]): Promise<{ ok: true } | { ok: false; message: string }> {
  if (!(await getCurrentUser())) return { ok: false, message: "Please sign in again." };
  const parsed = z.object({ attemptId: z.uuid(), groups: z.array(z.string().min(1).max(80)).max(50) }).safeParse({ attemptId, groups });
  if (!parsed.success) return { ok: false, message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("choose_mock_questions", { _attempt_id: parsed.data.attemptId, _groups: parsed.data.groups });
  if (error) return { ok: false, message: Object.entries(MESSAGES).find(([k]) => error.message.includes(k))?.[1] ?? "Your choice could not be saved. Please try again." };
  revalidatePath(`/exam/${parsed.data.attemptId}`);
  return { ok: true };
}
