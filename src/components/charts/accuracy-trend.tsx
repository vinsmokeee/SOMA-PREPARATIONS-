"use client";

import { useEffect, useId, useRef, useState } from "react";
import { formatDate } from "@/lib/utils";

export type TrendDatum = { id: string; label: string; date: string; accuracy: number; answered: number };

const H = 220;
const PAD = { top: 16, right: 16, bottom: 28, left: 40 };

/**
 * Accuracy per attempt (single series): 2px line, r=4 markers with a 2px
 * surface ring, hairline gridlines at 0/50/100%, crosshair + tooltip on hover
 * or keyboard focus, and a table view for screen readers.
 */
export function AccuracyTrend({ data }: { data: TrendDatum[] }) {
  const [active, setActive] = useState<number | null>(null);
  const titleId = useId();
  // Draw at the container's real width so text and marks keep their true size on phones.
  const ref = useRef<HTMLElement>(null);
  const [W, setW] = useState(640);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    const ro = new ResizeObserver(([e]) => setW(Math.max(280, Math.round(e.contentRect.width))));
    ro.observe(el);
    return () => ro.disconnect();
  }, []);
  if (data.length === 0) return null;
  const iw = W - PAD.left - PAD.right;
  const ih = H - PAD.top - PAD.bottom;
  const x = (i: number) => PAD.left + (data.length === 1 ? iw / 2 : (i / (data.length - 1)) * iw);
  const y = (v: number) => PAD.top + ih - (v / 100) * ih;
  const path = data.map((d, i) => `${i ? "L" : "M"}${x(i).toFixed(1)},${y(d.accuracy).toFixed(1)}`).join(" ");
  const last = data[data.length - 1];
  const a = active !== null ? data[active] : null;

  return (
    <figure ref={ref} className="relative">
      <svg
        viewBox={`0 0 ${W} ${H}`}
        width={W}
        height={H}
        className="block max-w-full overflow-visible"
        role="img"
        aria-labelledby={titleId}
        onMouseLeave={() => setActive(null)}
      >
        <title id={titleId}>{`Accuracy over your last ${data.length} attempts; latest ${last.accuracy}%`}</title>
        {[0, 50, 100].map((v) => (
          <g key={v}>
            <line x1={PAD.left} x2={W - PAD.right} y1={y(v)} y2={y(v)} stroke="var(--border)" strokeWidth={1} />
            <text x={PAD.left - 8} y={y(v)} textAnchor="end" dominantBaseline="middle" fontSize={11} fill="var(--muted-foreground)">{v}%</text>
          </g>
        ))}
        {a ? <line x1={x(active!)} x2={x(active!)} y1={PAD.top} y2={PAD.top + ih} stroke="var(--border-strong)" strokeWidth={1} /> : null}
        <path d={`${path} L${x(data.length - 1)},${y(0)} L${x(0)},${y(0)} Z`} fill="var(--primary)" opacity={0.08} />
        <path d={path} fill="none" stroke="var(--primary)" strokeWidth={2} strokeLinejoin="round" strokeLinecap="round" />
        {data.map((d, i) => (
          <g key={d.id}>
            <circle cx={x(i)} cy={y(d.accuracy)} r={active === i ? 6 : 4} fill="var(--primary)" stroke="var(--background)" strokeWidth={2} />
            <rect
              x={x(i) - Math.max(10, iw / data.length / 2)}
              y={PAD.top}
              width={Math.max(20, iw / data.length)}
              height={ih}
              fill="transparent"
              tabIndex={0}
              aria-label={`${d.label}, ${formatDate(d.date)}: ${d.accuracy}% of ${d.answered} answered`}
              onMouseEnter={() => setActive(i)}
              onFocus={() => setActive(i)}
              onBlur={() => setActive(null)}
            />
          </g>
        ))}
        <text x={x(data.length - 1)} y={y(last.accuracy) - 12} textAnchor="end" fontSize={12} fontWeight={600} fill="var(--ink)">{last.accuracy}%</text>
      </svg>
      {a ? (
        <div
          className="pointer-events-none absolute z-10 -translate-x-1/2 rounded-md border border-border bg-background px-3 py-2 text-xs shadow-md"
          style={{ left: `${(x(active!) / W) * 100}%`, top: 0 }}
          role="status"
        >
          <p className="font-semibold text-ink">{a.accuracy}% accuracy</p>
          <p className="text-muted-foreground">{a.label}</p>
          <p className="text-muted-foreground">{formatDate(a.date)} · {a.answered} answered</p>
        </div>
      ) : null}
      <details className="mt-2 text-xs">
        <summary className="cursor-pointer text-muted-foreground">Show as table</summary>
        <table className="mt-2 w-full text-left">
          <thead><tr className="text-muted-foreground"><th className="py-1">Date</th><th>Examination</th><th className="text-right">Answered</th><th className="text-right">Accuracy</th></tr></thead>
          <tbody>{data.map((d) => <tr key={d.id} className="border-t border-border"><td className="py-1">{formatDate(d.date)}</td><td>{d.label}</td><td className="text-right tabular-nums">{d.answered}</td><td className="text-right tabular-nums">{d.accuracy}%</td></tr>)}</tbody>
        </table>
      </details>
    </figure>
  );
}
