"use client";

import { useActionState } from "react";
import { ArrowRight } from "lucide-react";
import { startPaperMockAction, startPaperPracticeAction, type StartState } from "@/app/dashboard/me/paper/actions";

/** One button per question type: each tap gives the student a new question from this paper. */
export function PracticeTypeButton({ paper, type, label, count }: { paper: string; type: string; label: string; count: number }) {
  const [state, action, pending] = useActionState(startPaperPracticeAction, {} as StartState);
  return (
    <form action={action}>
      <input type="hidden" name="paper" value={paper} />
      <input type="hidden" name="type" value={type} />
      <button type="submit" disabled={pending} className="flex w-full items-center justify-between rounded-2xl bg-slate-100 px-4 py-3 text-left font-bold text-ink active:scale-[0.99] disabled:opacity-60">
        <span>{label} <span className="ml-1 text-xs font-medium text-muted-foreground">{count} question{count === 1 ? "" : "s"}</span></span>
        {pending ? <span className="text-xs font-semibold text-muted-foreground">Starting…</span> : <ArrowRight className="size-5 text-slate-600" aria-hidden />}
      </button>
      {state.error ? <p role="alert" className="mt-1 text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}

/** Builds a personal mock paper in the RCSC pattern and opens it. */
export function MockButton({ paper, again }: { paper: string; again: boolean }) {
  const [state, action, pending] = useActionState(startPaperMockAction, {} as StartState);
  return (
    <form action={action} className="mt-4">
      <input type="hidden" name="paper" value={paper} />
      <button type="submit" disabled={pending} className="flex h-12 w-full items-center justify-center rounded-2xl bg-slate-800 text-base font-bold text-white active:scale-[0.98] disabled:opacity-60">
        {pending ? "Preparing your paper…" : again ? "Take another mock paper" : "Start mock paper"}
      </button>
      {state.error ? <p role="alert" className="mt-2 text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}
