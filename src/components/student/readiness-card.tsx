import { Info } from "lucide-react";
import type { Readiness } from "@/lib/analytics";
import { cn } from "@/lib/utils";

const STEPS = ["foundations", "developing", "strong"] as const;
const LABELS = { foundations: "Building foundations", developing: "Developing", strong: "Strong" };

/** A Soma estimate, shown as a three-step scale with its reasons. Never a pass probability. */
export function ReadinessCard({ stage, r }: { stage: "PE" | "ME"; r: Readiness }) {
  const idx = STEPS.indexOf(r.band as (typeof STEPS)[number]);
  return (
    <div className="rounded-xl border border-border p-5">
      <p className="text-sm text-muted-foreground">{stage === "PE" ? "Preliminary Examination" : "Main Examination"} · Soma estimate</p>
      <p className="mt-1 font-serif text-xl font-semibold text-ink">{r.label}</p>
      <ol className="mt-3 grid grid-cols-3 gap-1" aria-label="Preparation scale">
        {STEPS.map((s, i) => (
          <li key={s} className="text-[11px] text-muted-foreground">
            <span className={cn("mb-1 block h-2 rounded-full", idx >= i ? "bg-primary" : "bg-muted")} aria-hidden />
            <span className={idx === i ? "font-semibold text-ink" : undefined}>{LABELS[s]}</span>
          </li>
        ))}
      </ol>
      <p className="mt-3 text-sm text-foreground">{r.summary}</p>
      {r.reasons.length ? <ul className="mt-2 list-disc space-y-0.5 pl-5 text-xs text-muted-foreground">{r.reasons.map((x) => <li key={x}>{x}</li>)}</ul> : null}
      <p className="mt-3 flex gap-1.5 text-xs text-muted-foreground">
        <Info className="mt-0.5 size-3.5 shrink-0" aria-hidden />
        Based only on your practice on Soma. It is not an RCSC assessment and does not predict your result.
      </p>
    </div>
  );
}
