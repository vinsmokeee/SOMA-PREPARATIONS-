"use client";

import { useActionState } from "react";
import { startExam, type StartState } from "@/app/exam/actions";

/**
 * Lets staff sit a draft examination exactly as a candidate would, without
 * publishing anything. start_attempt() allows staff with exams.manage to use
 * unpublished examinations and questions.
 */
export function PreviewExamButton({ examId }: { examId: string }) {
  const [state, action, pending] = useActionState<StartState, FormData>(startExam, {});
  return (
    <form action={action} className="space-y-2">
      <input type="hidden" name="examId" value={examId} />
      <input type="hidden" name="confirmed" value="on" />
      <button type="submit" disabled={pending} className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted disabled:opacity-60">
        {pending ? "Opening…" : "Preview as candidate"}
      </button>
      {state.error ? <p className="text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}
