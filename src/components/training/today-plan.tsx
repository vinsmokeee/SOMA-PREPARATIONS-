import { BookOpenCheck, CalendarCheck2, Check, History, Newspaper, PenLine, Target, Trophy } from "lucide-react";
import { ItemButtons } from "@/components/training/item-buttons";
import type { ItemKind, TrainingData } from "@/lib/training/model";
import { cn } from "@/lib/utils";

/** Icon and colour for each kind of task, so the list is easy to scan. */
export const KIND_STYLE: Record<ItemKind, { icon: typeof BookOpenCheck; tint: string }> = {
  practice: { icon: BookOpenCheck, tint: "bg-orange-100 text-orange-700" },
  revision: { icon: History, tint: "bg-violet-100 text-violet-700" },
  weak_topic: { icon: Target, tint: "bg-rose-100 text-rose-700" },
  ca: { icon: Newspaper, tint: "bg-sky-100 text-sky-700" },
  written: { icon: PenLine, tint: "bg-emerald-100 text-emerald-700" },
  weekly_test: { icon: CalendarCheck2, tint: "bg-amber-100 text-amber-800" },
  fortnight_test: { icon: CalendarCheck2, tint: "bg-amber-100 text-amber-800" },
  monthly_mock: { icon: Trophy, tint: "bg-yellow-100 text-yellow-800" },
};

/** Today's tasks as a simple tick-list. */
export function TodayPlan({ data }: { data: TrainingData }) {
  if (data.items.length === 0) {
    return (
      <p className="rounded-2xl bg-muted p-4 text-sm text-muted-foreground">
        Your plan fills up as new questions are added. Check back soon.
      </p>
    );
  }
  return (
    <ul className="space-y-2">
      {data.items.map((i) => {
        const { icon: Icon, tint } = KIND_STYLE[i.kind];
        const done = i.status === "done";
        const skipped = i.status === "skipped";
        return (
          <li key={i.id} className={cn("flex items-center gap-3 rounded-2xl bg-white p-3 shadow-sm ring-1 ring-border", (done || skipped) && "opacity-70")}>
            <span className={cn("flex size-11 shrink-0 items-center justify-center rounded-full", done ? "bg-success text-white" : tint)}>
              {done ? <Check className="size-5" aria-label="Done" /> : <Icon className="size-5" aria-hidden />}
            </span>
            <div className="min-w-0 flex-1">
              <p className={cn("font-semibold leading-snug text-ink", skipped && "line-through")}>{i.title}</p>
              <p className="text-sm text-muted-foreground">
                {done && i.max_score ? `Scored ${Number(i.score)}/${Number(i.max_score)}` : skipped ? "Skipped" : i.minutes ? `About ${i.minutes} min` : ""}
              </p>
            </div>
            <ItemButtons item={i} compact />
          </li>
        );
      })}
    </ul>
  );
}
