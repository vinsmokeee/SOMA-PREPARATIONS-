"use client";

import { useActionState } from "react";
import { RotateCcw } from "lucide-react";
import { startRetryAction, type StartState } from "@/app/dashboard/me/paper/actions";

/** "Retry my mistakes" on an ME mock result (founder, 20 Nov 2026). */
export function RetryMistakesButton({ attemptId, count }: { attemptId: string; count: number }) {
  const [state, action, pending] = useActionState(startRetryAction, {} as StartState);
  return (
    <form action={action} className="w-full sm:w-auto">
      <input type="hidden" name="attempt" value={attemptId} />
      <button type="submit" disabled={pending} className="inline-flex h-12 w-full items-center justify-center gap-2 rounded-2xl bg-primary px-5 text-base font-bold text-primary-foreground hover:bg-primary-hover disabled:opacity-60">
        <RotateCcw className="size-5" aria-hidden /> {pending ? "Preparing…" : `Retry my mistakes (${count})`}
      </button>
      {state.error ? <p role="alert" className="mt-2 text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}
