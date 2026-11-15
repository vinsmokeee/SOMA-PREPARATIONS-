"use client";

import { useActionState } from "react";
import { startWrittenPracticeAction } from "@/app/dashboard/written/actions";

export function StartWritten({ questionId, wordLimit }: { questionId: string; wordLimit: number | null }) {
  const [state, action, pending] = useActionState(startWrittenPracticeAction, {});
  const suggested = wordLimit ? Math.min(240, Math.max(10, Math.round(wordLimit / 12))) : 30;
  return (
    <form action={action} className="flex flex-wrap items-center gap-2">
      <input type="hidden" name="questionId" value={questionId} />
      <label className="sr-only" htmlFor={`m-${questionId}`}>Timer</label>
      <select id={`m-${questionId}`} name="minutes" defaultValue="" className="h-9 rounded-md border border-border-strong bg-background px-2 text-sm">
        <option value="">No timer</option>
        {[...new Set([suggested, 15, 30, 45, 60])].sort((a, b) => a - b).map((m) => <option key={m} value={m}>{m} minutes</option>)}
      </select>
      <button type="submit" disabled={pending} className="inline-flex h-9 items-center rounded-md bg-primary px-3 text-sm font-semibold text-primary-foreground disabled:opacity-50">
        {pending ? "Starting…" : "Practise"}
      </button>
      {state.error ? <p role="alert" className="w-full text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}
