"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const KNOWN = ["PAUSED_EXAM_EXISTS", "ATTEMPT_PAUSED", "FREE_DAILY_LIMIT", "ATTEMPT_CLOSED", "ATTEMPT_NOT_FOUND", "ACCESS_REQUIRED", "EXAM_NOT_FOUND", "EXAM_EMPTY", "INVALID_OPTION", "QUESTION_NOT_IN_ATTEMPT", "ANSWER_TOO_LONG", "NOT_SIGNED_IN"] as const;
export type EngineError = (typeof KNOWN)[number] | "NETWORK" | "UNKNOWN";

function engineError(message: string | undefined): EngineError {
  return (KNOWN.find((k) => message?.includes(k)) as EngineError | undefined) ?? "UNKNOWN";
}

export type StartState = { error?: string };

/** Shown when a student tries to start another mock test while one is paused (founder, 22 Nov 2026). */
const PAUSED_MESSAGE = "Finish your paused exam first. Open “Paused exam” on your home page to continue it.";

const START_MESSAGES: Partial<Record<EngineError, string>> = {
  ACCESS_REQUIRED: "This examination is part of a premium package.",
  FREE_DAILY_LIMIT: "Free accounts get one practice or mock test a day, and you have used today's. Join PE Premium for unlimited practice and mock tests, or come back tomorrow.",
  EXAM_NOT_FOUND: "This examination is not available.",
  EXAM_EMPTY: "This examination has no questions yet.",
  NOT_SIGNED_IN: "Your session has expired. Please sign in again.",
  PAUSED_EXAM_EXISTS: PAUSED_MESSAGE,
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
  markQuality: z.enum(["good", "too_light", "outside"]).nullable().optional(),
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
    _mark_quality: d.markQuality ?? null,
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

/** Premium: build a fresh full-length mock test from questions the student has not seen. */
export async function createMockAction(prev: StartState): Promise<StartState> {
  void prev;
  const user = await getCurrentUser();
  if (!user) return { error: START_MESSAGES.NOT_SIGNED_IN };
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("create_mock_test", { _stage: "PE" });
  if (error || !data) {
    const m = error?.message ?? "";
    return {
      error: m.includes("PAUSED_EXAM_EXISTS") ? PAUSED_MESSAGE
        : m.includes("FREE_DAILY_LIMIT") ? "FREE_DAILY_LIMIT"
        : m.includes("ACCESS_REQUIRED") ? "New mock tests are part of PE Premium."
        : m.includes("NO_QUESTIONS") ? "Not enough questions yet for a new mock test. More are being added."
        : m.includes("RATE_LIMIT") ? "You have created many mock tests today. Please try again tomorrow."
        : "The mock test could not be created. Please try again.",
    };
  }
  redirect(`/exam/${data as string}`);
}

/** Pause a timed exam: answers are already saved; the timer stops until the student continues. */
export async function pauseAttempt(attemptId: string): Promise<{ ok: boolean; message?: string }> {
  if (!z.uuid().safeParse(attemptId).success) return { ok: false };
  const supabase = await createClient();
  const { error } = await supabase.rpc("pause_attempt", { _attempt_id: attemptId });
  if (error) {
    return { ok: false, message: error.message.includes("ATTEMPT_CLOSED") ? "The time for this examination has already ended." : error.message.includes("CANNOT_PAUSE") ? "Untimed practice does not need pausing." : undefined };
  }
  revalidatePath("/dashboard", "layout");
  return { ok: true };
}

/** Continue a paused exam with the time it had left. */
export async function resumeAttemptAction(formData: FormData): Promise<void> {
  const parsed = z.uuid().safeParse(formData.get("attemptId"));
  if (!parsed.success) redirect("/dashboard");
  if (!(await getCurrentUser())) redirect("/login");
  const supabase = await createClient();
  const { error } = await supabase.rpc("resume_attempt", { _attempt_id: parsed.data });
  if (error) redirect(`/dashboard/results/${parsed.data}`);
  revalidatePath("/dashboard", "layout");
  redirect(`/exam/${parsed.data}`);
}
