"use client";

import { useActionState } from "react";
import { skipItemAction, startItemAction, type ItemState } from "@/app/dashboard/training/actions";
import { itemAction, type TrainingItem } from "@/lib/training/model";
import { cn } from "@/lib/utils";

/**
 * Start / continue / review a plan item. `compact` shows a single pill (home
 * screen); the full version also offers Skip (training page).
 */
export function ItemButtons({ item, compact = false }: { item: TrainingItem; compact?: boolean }) {
  const [startState, start, starting] = useActionState(startItemAction, {} as ItemState);
  const [skipState, skip, skipping] = useActionState(skipItemAction, {} as ItemState);
  const error = startState.error ?? skipState.error;
  const todo = item.status === "pending" || item.status === "started";
  return (
    <div className="flex shrink-0 flex-col items-end gap-1">
      <div className="flex items-center gap-1">
        {!compact && todo ? (
          <form action={skip}>
            <input type="hidden" name="item" value={item.id} />
            <button type="submit" disabled={skipping} className="h-10 rounded-full px-3 text-sm text-muted-foreground hover:bg-muted disabled:opacity-50">
              Skip
            </button>
          </form>
        ) : null}
        <form action={start}>
          <input type="hidden" name="item" value={item.id} />
          <button
            type="submit"
            disabled={starting}
            className={cn("h-10 rounded-full px-5 text-sm font-bold disabled:opacity-50",
              todo ? "bg-primary text-primary-foreground shadow-sm" : "bg-muted text-ink")}
          >
            {starting ? "…" : itemAction(item)}
          </button>
        </form>
      </div>
      {error ? <p role="alert" className="max-w-48 text-right text-xs text-danger">{error}</p> : null}
    </div>
  );
}
