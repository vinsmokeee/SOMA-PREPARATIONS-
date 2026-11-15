"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const KNOWN = ["ATTEMPT_CLOSED", "ATTEMPT_NOT_FOUND", "ACCESS_REQUIRED", "EXAM_NOT_FOUND", "EXAM_EMPTY", "INVALID_OPTION", "QUESTION_NOT_IN_ATTEMPT", "ANSWER_TOO_LONG", "NOT_SIGNED_IN"] as const;
export type EngineError = (typeof KNOWN)[number] | "NETWORK" | "UNKNOWN";

function engineError(message: string | undefined): EngineError {
  return (KNOWN.find((k) => message?.includes(k)) as EngineError | undefined) ?? "UNKNOWN";
}

export type StartState = { error?: string };

const START_MESSAGES: Partial<Record<EngineError, string>> = {
  ACCESS_REQUIRED: "This examination is part of a premium package.",
  EXAM_NOT_FOUND: "This examination is not available.",
  EXAM_EMPTY: "This examination has no questions yet.",
  NOT_SIGNED_IN: "Your session has expired. Please sign in again.",
};

export async function startExam(_prev: StartState, formData: FormData): Promise<StartState> {
  const parsed = z.object({ examId: z.uuid(), confirmed: z.literal("on") }).safeParse({
    examId: formData.get("examId"),
    confirmed: formData.get("confirmed") ?? undefined,
  });
  if (!parsed.success) return { error: "Please confirm that you have read the instructions." };
  const user = await getCurrentUser();
  if (!user) return { error: START_MESSAGES.NOT_SIGNED_IN };

  const supabase = await createClient();
  const { data, error } = await supabase.rpc("start_attempt", { _exam_id: parsed.data.examId });
  if (error || !data) {
    const code = engineError(error?.message);
    return { error: START_MESSAGES[code] ?? "The examination could not be started. Please try again." };
  }
  redirect(`/exam/${data as string}`);
}

const saveSchema = z.object({
  attemptId: z.uuid(),
  examQuestionId: z.uuid(),
  selectedOptionId: z.uuid().nullable().optional(),
  clearSelection: z.boolean().optional(),
  textAnswer: z.string().max(60000).nullable().optional(),
  flagged: z.boolean().nullable().optional(),
  timeSpentDelta: z.number().int().min(0).max(600).optional(),
});

export type SaveInput = z.infer<typeof saveSchema>;
export type SaveResult = { ok: true; savedAt: string } | { ok: false; error: EngineError };

export async function saveAnswer(input: SaveInput): Promise<SaveResult> {
  const parsed = saveSchema.safeParse(input);
  if (!parsed.success) return { ok: false, error: "UNKNOWN" };
  const d = parsed.data;
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("save_answer", {
    _attempt_id: d.attemptId,
    _exam_question_id: d.examQuestionId,
    _selected_option_id: d.selectedOptionId ?? null,
    _clear_selection: d.clearSelection ?? false,
    _text_answer: d.textAnswer ?? null,
    _flagged: d.flagged ?? null,
    _time_spent_delta: d.timeSpentDelta ?? 0,
  });
  if (error) return { ok: false, error: engineError(error.message) };
  return { ok: true, savedAt: (data as { saved_at: string }).saved_at };
}

export type SubmitResult = { ok: true } | { ok: false; error: EngineError };

export async function submitAttempt(attemptId: string): Promise<SubmitResult> {
  if (!z.uuid().safeParse(attemptId).success) return { ok: false, error: "UNKNOWN" };
  const supabase = await createClient();
  const { error } = await supabase.rpc("submit_attempt", { _attempt_id: attemptId });
  if (error) return { ok: false, error: engineError(error.message) };
  return { ok: true };
}
