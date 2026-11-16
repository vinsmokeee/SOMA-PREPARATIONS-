import { Gauge, Lightbulb, MessageCircleHeart, SkipForward } from "lucide-react";
import type { CoachAdvice } from "@/lib/exam/coach";
import { cn } from "@/lib/utils";

/** "Your coach": what went wrong, where to gain marks, pace and skipped questions. */
export function CoachCard({ advice }: { advice: CoachAdvice }) {
  return (
    <section aria-labelledby="coach-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border sm:p-6">
      <h2 id="coach-h" className="flex items-center gap-2 text-lg font-extrabold text-ink">
        <MessageCircleHeart className="size-5 text-primary" aria-hidden /> Your coach
      </h2>
      <p className="mt-2 text-[15px] text-ink">{advice.summary}</p>

      {advice.gainMarks.length ? (
        <div className="mt-4 space-y-3">
          <p className="text-sm font-bold uppercase tracking-wide text-muted-foreground">Where to gain marks</p>
          {advice.gainMarks.map((g) => (
            <div key={g.section} className="flex gap-3 rounded-2xl bg-primary-soft p-3">
              <Lightbulb className="mt-0.5 size-5 shrink-0 text-primary" aria-hidden />
              <p className="text-sm text-ink"><span className="font-bold">{g.section}: </span>{g.text}</p>
            </div>
          ))}
        </div>
      ) : null}

      {advice.pace ? (
        <div className={cn("mt-3 flex gap-3 rounded-2xl p-3", advice.pace.tone === "warn" ? "bg-amber-100" : "bg-success-soft")}>
          <Gauge className={cn("mt-0.5 size-5 shrink-0", advice.pace.tone === "warn" ? "text-amber-700" : "text-success")} aria-hidden />
          <p className="text-sm text-ink"><span className="font-bold">Your pace: </span>{advice.pace.text}</p>
        </div>
      ) : null}

      {advice.skipped ? (
        <div className="mt-3 flex gap-3 rounded-2xl bg-muted p-3">
          <SkipForward className="mt-0.5 size-5 shrink-0 text-muted-foreground" aria-hidden />
          <p className="text-sm text-ink">{advice.skipped}</p>
        </div>
      ) : null}

      <p className="mt-4 text-xs text-muted-foreground">Each question you missed is explained below, and it will come back in your revision so you can get it right next time.</p>
    </section>
  );
}
