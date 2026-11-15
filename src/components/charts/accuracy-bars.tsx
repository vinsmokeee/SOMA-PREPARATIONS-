export type BarDatum = { id: string; label: string; accuracy: number | null; detail: string };

/**
 * Horizontal accuracy bars (single series). Bars are 12px thick with a 4px
 * rounded data-end, the value sits at the tip in text colour, and each row is
 * keyboard-focusable with its full description.
 */
export function AccuracyBars({ data }: { data: BarDatum[] }) {
  return (
    <ul className="space-y-3" aria-label="Accuracy by area">
      {data.map((d) => (
        <li key={d.id} tabIndex={0} title={`${d.label}: ${d.accuracy === null ? "not practised" : `${d.accuracy}%`} — ${d.detail}`} className="rounded-sm focus-visible:outline-2 focus-visible:outline-offset-2">
          <div className="flex items-baseline justify-between gap-3 text-sm">
            <span className="truncate text-ink">{d.label}</span>
            <span className="shrink-0 text-xs text-muted-foreground">{d.detail}</span>
          </div>
          <div className="mt-1.5 flex items-center gap-2">
            <div className="h-3 flex-1 rounded-r-[4px] bg-muted">
              {d.accuracy !== null ? <div className="h-3 rounded-r-[4px] bg-primary" style={{ width: `${Math.max(d.accuracy, 1)}%` }} /> : null}
            </div>
            <span className="w-10 text-right text-sm font-semibold tabular-nums text-ink">{d.accuracy === null ? "—" : `${d.accuracy}%`}</span>
          </div>
        </li>
      ))}
    </ul>
  );
}
