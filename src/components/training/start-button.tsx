"use client";

import { useActionState } from "react";
import { startItemAction, type ItemState } from "@/app/dashboard/training/actions";
import { cn } from "@/lib/utils";

/** One big button that starts (or continues) a plan item. */
export function StartButton({ itemId, label, className }: { itemId: string; label: string; className?: string }) {
  const [state, start, pending] = useActionState(startItemAction, {} as ItemState);
  return (
    <form action={start} className="w-full">
      <input type="hidden" name="item" value={itemId} />
      <button
        type="submit"
        disabled={pending}
        className={cn("h-14 w-full rounded-2xl text-lg font-bold shadow-lg transition active:scale-[0.98] disabled:opacity-60", className)}
      >
        {pending ? "Opening…" : label}
      </button>
      {state.error ? <p role="alert" className="mt-2 text-sm font-medium">{state.error}</p> : null}
    </form>
  );
}
