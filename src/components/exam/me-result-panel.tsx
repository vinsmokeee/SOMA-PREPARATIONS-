import Link from "next/link";
import { RetryMistakesButton } from "./me-retry";
import { compareVerdict, type Compare, type retrySummary } from "@/lib/exam/retry";

const ROMAN = ["", "I", "II", "III", "IV", "V"];

/** ME result actions: "Retry my mistakes", "Before -> Now" after a retry, and back to the paper (founder, 20 Nov 2026). */
export function MeResultPanel({ attemptId, sum, rows, back, paperNumber }: {
  attemptId: string; sum: ReturnType<typeof retrySummary> | null; rows: Compare[]; back: string; paperNumber: number | null;
}) {
  return (
    <div className="mt-10 space-y-4">
      {sum ? (
        <section aria-labelledby="retry-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
          <h2 id="retry-h" className="text-lg font-extrabold text-ink">{sum.retry ? "Fix your mistakes" : sum.notMarked ? "Get your answers marked" : "Well done!"}</h2>
          {sum.retry ? (
            <p className="mt-1 text-sm text-muted-foreground">
              {[sum.skipped ? `${sum.skipped} skipped` : null, sum.wrong ? `${sum.wrong} wrong` : null, sum.low ? `${sum.low} below half marks` : null].filter(Boolean).join(", ")}.
              Practise just these, untimed, and see how much you improve.
            </p>
          ) : sum.notMarked ? null : <p className="mt-1 text-sm text-muted-foreground">No skipped, wrong or low-scoring answers in this mock.</p>}
          {sum.notMarked ? (
            <p className="mt-2 rounded-xl bg-amber-50 p-3 text-sm text-amber-900 ring-1 ring-amber-200">
              {sum.notMarked} written answer{sum.notMarked === 1 ? " is" : "s are"} not marked yet. Get {sum.notMarked === 1 ? "it" : "them"} marked above to see which ones to retry.
            </p>
          ) : null}
          {sum.retry ? <div className="mt-4"><RetryMistakesButton attemptId={attemptId} count={sum.retry} /></div> : null}
        </section>
      ) : null}
      {rows.length ? (
        <section aria-labelledby="cmp-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
          <h2 id="cmp-h" className="text-lg font-extrabold text-ink">Before → Now</h2>
          <ul className="mt-3 divide-y divide-border">
            {rows.map((c, i) => {
              const v = compareVerdict(c);
              const fmt = (s: number | null, m: number | null) => (s === null || m === null ? "—" : `${Number(s)}/${Number(m)}`);
              return (
                <li key={c.question_id} className="flex items-center justify-between gap-3 py-2.5 text-sm">
                  <span className="font-semibold text-ink">Question {i + 1}</span>
                  <span className="tabular-nums text-ink">
                    {fmt(c.before_score, c.before_max)} → {v === "not_marked" ? <span className="text-muted-foreground">get it marked above</span> : fmt(c.now_score, c.now_max)}
                    {v === "better" ? <span className="ml-1.5 font-bold text-success">↑</span> : v === "worse" ? <span className="ml-1.5 font-bold text-danger">↓</span> : null}
                  </span>
                </li>
              );
            })}
          </ul>
        </section>
      ) : null}
      <div className="flex flex-col gap-3 border-t border-border pt-6 sm:flex-row">
        <Link href={back} className="inline-flex h-12 items-center justify-center rounded-2xl bg-white px-5 text-base font-semibold shadow-sm ring-1 ring-border hover:bg-muted">
          {paperNumber ? `Back to Paper ${ROMAN[paperNumber] ?? paperNumber}` : "Back to ME"}
        </Link>
      </div>
    </div>
  );
}
