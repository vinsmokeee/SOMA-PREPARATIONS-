import { CheckCircle2, Clock, MinusCircle, XCircle } from "lucide-react";
import { cn } from "@/lib/utils";

export type CutoffRef = { year: number; value: number; unit: "percent" | "marks" } | null;

/** "Your score compared with last year's PE cut-off" — reference only, never a pass/fail. */
export function cutoffComparison(score: number, max: number, c: CutoffRef): { line: string; above: boolean } | null {
  if (!c || max <= 0) return null;
  const pct = Math.round((score / max) * 100);
  const cutPct = c.unit === "percent" ? c.value : max === 100 ? c.value : null;
  if (cutPct === null) return null;
  const cutText = c.unit === "percent" ? `${c.value}%` : `${c.value} marks`;
  return {
    above: pct >= cutPct,
    line: `Last year's PE cut-off (${c.year}) was ${cutText}. You scored ${max === 100 ? `${score} marks` : `${pct}%`} in this test.`,
  };
}

/** The colourful summary at the top of a results page. */
export function ResultHero({ title, score, max, correct, incorrect, unanswered, time, stage, cutoff }: {
  title: string; score: number; max: number; correct: number; incorrect: number; unanswered: number; time: string;
  stage: "PE" | "ME"; cutoff: CutoffRef;
}) {
  const pct = max > 0 ? Math.round((score / max) * 100) : 0;
  const cmp = stage === "PE" ? cutoffComparison(score, max, cutoff) : null;
  const ring = `conic-gradient(#fde68a ${pct * 3.6}deg, rgba(255,255,255,0.25) 0deg)`;
  return (
    <section className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-amber-400 via-orange-600 to-[#7a1e3a] p-5 text-white shadow-xl sm:p-7">
      <span className="absolute -right-10 -top-10 size-40 rounded-full bg-white/10" aria-hidden />
      <p className="relative text-sm font-semibold uppercase tracking-wider text-white/80">Your result</p>
      <h1 className="relative mt-1 text-xl font-extrabold leading-snug text-white sm:text-2xl">{title}</h1>
      <div className="relative mt-5 flex items-center gap-5">
        <div className="flex size-28 shrink-0 items-center justify-center rounded-full" style={{ background: ring }} role="img" aria-label={`${pct} percent`}>
          <div className="flex size-[5.5rem] flex-col items-center justify-center rounded-full bg-[#9a3412]">
            <span className="text-3xl font-black leading-none">{pct}%</span>
          </div>
        </div>
        <div>
          <p className="text-4xl font-black leading-none">{score}<span className="text-xl font-bold text-white/75"> / {max}</span></p>
          <p className="mt-1 text-sm text-white/85">marks</p>
          <p className="mt-2 flex items-center gap-1 text-sm text-white/85"><Clock className="size-4" aria-hidden /> {time}</p>
        </div>
      </div>
      <div className="relative mt-5 grid grid-cols-3 gap-2 text-center">
        {[
          { n: correct, label: "correct", icon: CheckCircle2 },
          { n: incorrect, label: "wrong", icon: XCircle },
          { n: unanswered, label: "skipped", icon: MinusCircle },
        ].map((s) => (
          <div key={s.label} className="rounded-2xl bg-white/15 px-2 py-3">
            <s.icon className="mx-auto size-5 text-yellow-100" aria-hidden />
            <p className="mt-1 text-xl font-extrabold leading-none">{s.n}</p>
            <p className="text-xs text-white/85">{s.label}</p>
          </div>
        ))}
      </div>
      {cmp ? (
        <div className={cn("relative mt-4 rounded-2xl p-3 text-sm", cmp.above ? "bg-white text-[#14532d]" : "bg-white/15 text-white")}>
          <p className="font-bold">{cmp.above ? "Above last year's cut-off" : "Below last year's cut-off — keep practising"}</p>
          <p className={cmp.above ? "text-[#166534]" : "text-white/90"}>{cmp.line} RCSC sets the cut-off each year, so this is a guide, not a pass or fail.</p>
        </div>
      ) : null}
    </section>
  );
}

/** Section scores as simple coloured bars. */
export function SectionBars({ rows }: { rows: { name: string; correct: number; total: number; accuracy: number | null }[] }) {
  return (
    <ul className="space-y-3">
      {rows.map((s) => (
        <li key={s.name} className="rounded-2xl bg-white p-4 shadow-sm ring-1 ring-border">
          <div className="flex items-baseline justify-between gap-3">
            <span className="font-semibold text-ink">{s.name}</span>
            <span className="text-sm tabular-nums text-muted-foreground">{s.correct}/{s.total} · <span className="font-bold text-ink">{s.accuracy === null ? "—" : `${s.accuracy}%`}</span></span>
          </div>
          <div className="mt-2 h-2.5 rounded-full bg-muted">
            <div className={cn("h-2.5 rounded-full", (s.accuracy ?? 0) >= 60 ? "bg-success" : (s.accuracy ?? 0) >= 40 ? "bg-amber-500" : "bg-rose-500")} style={{ width: `${s.accuracy ?? 0}%` }} />
          </div>
        </li>
      ))}
    </ul>
  );
}
