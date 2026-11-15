"use client";

import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { startExam, type StartState } from "@/app/exam/actions";

export function StartForm({ examId, resume }: { examId: string; resume: boolean }) {
  const [state, action, pending] = useActionState<StartState, FormData>(startExam, {});
  return (
    <form action={action} className="space-y-4">
      {state.error ? <Alert tone="danger">{state.error}</Alert> : null}
      <input type="hidden" name="examId" value={examId} />
      <label className="flex items-start gap-3 rounded-lg border border-border bg-muted/50 p-4 text-[15px] leading-relaxed">
        <input type="checkbox" name="confirmed" required className="mt-1 size-4 accent-[var(--primary)]" />
        <span>
          I have read the instructions. I understand the timer {resume ? "is already running" : "starts as soon as I begin"} and cannot be paused,
          and that the examination is submitted automatically when time runs out.
        </span>
      </label>
      <button type="submit" disabled={pending} className="h-12 w-full rounded-md bg-primary px-6 text-base font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-60 sm:w-auto">
        {pending ? "Preparing your paper…" : resume ? "Resume examination" : "Start examination"}
      </button>
    </form>
  );
}
