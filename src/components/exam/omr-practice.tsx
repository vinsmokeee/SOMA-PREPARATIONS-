"use client";

import { useState } from "react";
import { CheckCircle2, AlertTriangle, RotateCcw } from "lucide-react";
import { MARK_MESSAGES } from "@/lib/exam/omr";
import type { MarkQuality } from "@/lib/exam/types";
import { cn } from "@/lib/utils";
import { OmrBubble } from "./omr-bubble";

const ROWS = 5;
const LABELS = ["A", "B", "C", "D"];

/** Practise shading OMR circles: shade one circle per row and see whether a scanner would read it. */
export function OmrPractice() {
  const [marks, setMarks] = useState<Record<number, { col: number; q: MarkQuality }>>({});
  const [round, setRound] = useState(0);
  const done = Object.values(marks);
  const good = done.filter((m) => m.q === "good").length;

  return (
    <div className="mx-auto max-w-lg space-y-5">
      <div className="rounded-2xl bg-primary-soft p-4 text-sm text-ink">
        <p className="font-bold">Practise your sketch</p>
        <p className="mt-1">
          In the real PE you shade the circle of your answer on an OMR sheet with a pencil, and a scanner reads it. Shade one circle in
          each row with your finger: fill it completely and stay inside the line.
        </p>
      </div>

      <ol className="space-y-2" key={round}>
        {Array.from({ length: ROWS }, (_, r) => {
          const m = marks[r];
          return (
            <li key={r} className="rounded-2xl border border-border bg-white p-2">
              <div className="flex items-center gap-1">
                <span className="w-7 text-right text-sm font-bold tabular-nums text-ink">{r + 1}</span>
                {LABELS.map((l, c) => (
                  <OmrBubble key={`${c}-${m && m.col !== c ? "off" : "on"}`} label={l} quality={m?.col === c ? m.q : null}
                    onShade={(q) => setMarks((s) => ({ ...s, [r]: { col: c, q } }))} />
                ))}
              </div>
              {m ? (
                <p className={cn("ml-8 mt-1 flex items-start gap-1.5 text-sm", m.q === "good" ? "text-success" : "text-warning")}>
                  {m.q === "good" ? <CheckCircle2 className="mt-0.5 size-4 shrink-0" aria-hidden /> : <AlertTriangle className="mt-0.5 size-4 shrink-0" aria-hidden />}
                  <span><span className="font-semibold">{MARK_MESSAGES[m.q].title}.</span> {MARK_MESSAGES[m.q].tip}</span>
                </p>
              ) : null}
            </li>
          );
        })}
      </ol>

      <div className="flex items-center justify-between gap-3 rounded-2xl bg-muted p-4">
        <p className="text-sm text-ink" role="status">
          {done.length === 0 ? "Shade a circle in each row." : `${good} of ${done.length} shaded circles would be read.`}
        </p>
        <button type="button" onClick={() => { setMarks({}); setRound((n) => n + 1); }} className="inline-flex h-10 shrink-0 items-center gap-1.5 rounded-xl border border-border-strong bg-white px-3 text-sm font-semibold text-ink">
          <RotateCcw className="size-4" aria-hidden /> Erase all
        </button>
      </div>
      <p className="text-xs text-muted-foreground">
        Tip: in the exam, use the pencil RCSC allows, shade firmly from edge to edge, and erase cleanly if you change your answer.
        Soma&apos;s check is a practice guide, not the RCSC scanner.
      </p>
    </div>
  );
}
