"use client";

import { useActionState, useState } from "react";
import { Layers } from "lucide-react";
import { publishBatchAction } from "@/app/admin/ai/batch-actions";
import type { ActionState } from "@/components/app/action-form";

/** One card per waiting batch: look through it below, then publish it all with one tap. */
export function PublishBatch({ batch, waiting }: { batch: string; waiting: number }) {
  const [state, action, pending] = useActionState(publishBatchAction, {} as ActionState);
  const [confirm, setConfirm] = useState(false);
  return (
    <form action={action} className="rounded-2xl border border-border bg-white p-4">
      <input type="hidden" name="batch" value={batch} />
      <p className="flex items-center gap-2 font-bold text-ink"><Layers className="size-5 text-primary" aria-hidden /> {batch}</p>
      <p className="mt-1 text-sm text-muted-foreground">{waiting} question{waiting === 1 ? "" : "s"} waiting. Look through them below; when you are happy, publish the whole batch.</p>
      {state.status ? <p role="status" className={state.status === "success" ? "mt-2 text-sm font-medium text-success" : "mt-2 text-sm font-medium text-danger"}>{state.message}</p> : null}
      {state.status === "success" ? null : confirm ? (
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="submit" disabled={pending} className="inline-flex h-11 items-center rounded-xl bg-primary px-4 text-sm font-bold text-primary-foreground disabled:opacity-60">
            {pending ? "Publishing…" : `Yes, publish all ${waiting}`}
          </button>
          <button type="button" onClick={() => setConfirm(false)} className="inline-flex h-11 items-center rounded-xl px-4 text-sm font-semibold ring-1 ring-border-strong">Cancel</button>
        </div>
      ) : (
        <button type="button" onClick={() => setConfirm(true)} className="mt-3 inline-flex h-11 items-center rounded-xl bg-primary px-4 text-sm font-bold text-primary-foreground">
          Publish this whole batch
        </button>
      )}
    </form>
  );
}
