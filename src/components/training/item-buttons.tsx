"use client";

import { useActionState } from "react";
import { skipItemAction, startItemAction, type ItemState } from "@/app/dashboard/training/actions";
import { itemAction, type TrainingItem } from "@/lib/training/model";
import { cn } from "@/lib/utils";

export function ItemButtons({ item }: { item: TrainingItem }) {
  const [startState, start, starting] = useActionState(startItemAction, {} as ItemState);
  const [skipState, skip, skipping] = useActionState(skipItemAction, {} as ItemState);
  const error = startState.error ?? skipState.error;
  const primary = item.status === "pending" || (item.status === "started");
  return (
    <div className="flex flex-col items-stretch gap-1 sm:items-end">
      <div className="flex gap-2">
        <form action={start}>
          <input type="hidden" name="item" value={item.id} />
          <button
            type="submit"
            disabled={starting}
            className={cn("h-10 min-w-24 rounded-md px-4 text-sm font-semibold disabled:opacity-50",
              primary ? "bg-primary text-primary-foreground" : "border border-border-strong text-ink")}
          >
            {starting ? "Opening…" : itemAction(item)}
          </button>
        </form>
        {item.status === "pending" || item.status === "started" ? (
          <form action={skip}>
            <input type="hidden" name="item" value={item.id} />
            <button type="submit" disabled={skipping} className="h-10 rounded-md px-3 text-sm text-muted-foreground hover:bg-muted disabled:opacity-50">
              Skip
            </button>
          </form>
        ) : null}
      </div>
      {error ? <p role="alert" className="text-sm text-danger">{error}</p> : null}
    </div>
  );
}
