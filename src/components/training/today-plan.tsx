import { BookOpenCheck, CalendarCheck2, CheckCircle2, Circle, Flame, History, Newspaper, PenLine, SkipForward, Target, Trophy } from "lucide-react";
import { ItemButtons } from "@/components/training/item-buttons";
import { phaseLabel, streakLabel, type ItemKind, type TrainingData } from "@/lib/training/model";
import { cn } from "@/lib/utils";

const ICONS: Record<ItemKind, typeof BookOpenCheck> = {
  practice: BookOpenCheck,
  revision: History,
  weak_topic: Target,
  ca: Newspaper,
  written: PenLine,
  weekly_test: CalendarCheck2,
  fortnight_test: CalendarCheck2,
  monthly_mock: Trophy,
};

export function TodayPlan({ data }: { data: TrainingData }) {
  const done = data.items.filter((i) => i.status === "done" || i.status === "skipped").length;
  return (
    <div>
      <div className="flex flex-wrap items-center gap-x-4 gap-y-1 text-sm text-muted-foreground">
        <span>Day {data.plan.cycle_day} of {data.plan.cycle_days}{data.plan.cycle_no > 1 ? ` · cycle ${data.plan.cycle_no}` : ""}</span>
        <span>{phaseLabel(data.plan.phase)} phase</span>
        <span className="inline-flex items-center gap-1"><Flame className="size-4 text-warning" aria-hidden /> {streakLabel(data.stats.current_streak)}</span>
        {data.items.length ? <span>{done} of {data.items.length} done</span> : null}
      </div>
      {data.items.length === 0 ? (
        <p className="mt-4 rounded-lg border border-dashed border-border-strong p-4 text-sm text-muted-foreground">
          No practice questions are available for your plan yet. New questions are added after review; with a package,
          your plan uses the full question bank.
        </p>
      ) : (
        <ol className="mt-4 divide-y divide-border rounded-xl border border-border">
          {data.items.map((i) => {
            const Icon = ICONS[i.kind];
            const finished = i.status === "done";
            return (
              <li key={i.id} className="flex flex-col gap-3 p-4 sm:flex-row sm:items-center">
                <div className="flex flex-1 items-start gap-3">
                  {finished ? <CheckCircle2 className="mt-0.5 size-5 shrink-0 text-primary" aria-label="Done" />
                    : i.status === "skipped" ? <SkipForward className="mt-0.5 size-5 shrink-0 text-muted-foreground" aria-label="Skipped" />
                    : <Circle className="mt-0.5 size-5 shrink-0 text-border-strong" aria-label="To do" />}
                  <div className="min-w-0">
                    <p className={cn("flex items-center gap-2 font-medium text-ink", i.status === "skipped" && "text-muted-foreground line-through")}>
                      <Icon className="size-4 shrink-0 text-primary" aria-hidden /> {i.title}
                    </p>
                    <p className="mt-0.5 text-sm text-muted-foreground">
                      {i.detail}
                      {i.minutes ? ` · about ${i.minutes} min` : ""}
                      {finished && i.max_score ? ` · scored ${Number(i.score)}/${Number(i.max_score)}` : ""}
                    </p>
                  </div>
                </div>
                <ItemButtons item={i} />
              </li>
            );
          })}
        </ol>
      )}
    </div>
  );
}
