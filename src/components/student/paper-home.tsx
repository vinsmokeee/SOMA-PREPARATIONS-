import Link from "next/link";
import { ArrowRight, BarChart3, ClipboardCheck, PenLine, TrendingDown, TrendingUp } from "lucide-react";

/**
 * One ME paper (Paper I, II or III): practise, a timed mock paper and progress for this paper only.
 * Past papers and their years are not shown to students (founder, 20 Nov 2026).
 * DRAFT layout for the founder's review; question types, time and marks come from the RCSC papers once loaded.
 */
export type PaperHomeData = {
  number: string;              // "III"
  title: string;
  weight: string | null;       // "40% of the written exam", from the database; null when unknown
  types: { label: string; count: number }[];
  mock: { time: string | null; marks: string | null };
  progress: { marked: number; average: number | null; strong: string[]; weak: string[] };
};

export function PaperHome({ d }: { d: PaperHomeData }) {
  return (
    <div data-exam="ME" className="mx-auto max-w-lg space-y-5">
      <section className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-slate-600 via-slate-700 to-slate-800 p-5 text-white shadow-xl">
        <span className="absolute -right-8 -top-8 size-32 rounded-full bg-white/10" aria-hidden />
        <p className="relative text-3xl font-black">Paper {d.number}</p>
        <p className="relative text-base text-white/90">{d.title}</p>
        {d.weight ? <p className="relative mt-3 inline-block rounded-full bg-white/15 px-3 py-1 text-xs font-bold">{d.weight}</p> : null}
      </section>

      {/* 1. Practise */}
      <section aria-labelledby="practise-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="practise-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><PenLine className="size-5 text-slate-700" aria-hidden /> Practise</h2>
        <p className="mt-1 text-sm text-muted-foreground">One question at a time. Write on paper and upload a photo, or type. AI marks it and shows how to improve.</p>
        <div className="mt-4 grid gap-2">
          {d.types.map((t) => (
            <Link key={t.label} href="#" className="flex items-center justify-between rounded-2xl bg-slate-100 px-4 py-3 font-bold text-ink active:scale-[0.99]">
              <span>{t.label} <span className="ml-1 text-xs font-medium text-muted-foreground">{t.count} questions</span></span>
              <ArrowRight className="size-5 text-slate-600" aria-hidden />
            </Link>
          ))}
        </div>
      </section>

      {/* 2. Mock paper */}
      <section aria-labelledby="mock-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="mock-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><ClipboardCheck className="size-5 text-slate-700" aria-hidden /> Mock paper</h2>
        <p className="mt-1 text-sm text-muted-foreground">The whole paper in the RCSC pattern, timed like the real exam. New questions every time.</p>
        <div className="mt-3 flex flex-wrap gap-2 text-xs font-bold">
          <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{d.mock.time ?? "Time: from the RCSC paper"}</span>
          <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{d.mock.marks ?? "Marks: from the RCSC paper"}</span>
        </div>
        <Link href="#" className="mt-4 flex h-12 items-center justify-center rounded-2xl bg-slate-800 text-base font-bold text-white active:scale-[0.98]">Start mock paper</Link>
      </section>

      {/* 3. My progress in this paper */}
      <section aria-labelledby="prog-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="prog-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><BarChart3 className="size-5 text-slate-700" aria-hidden /> My progress in Paper {d.number}</h2>
        <div className="mt-3 grid grid-cols-2 gap-3 text-center">
          <div className="rounded-2xl bg-slate-100 p-3"><p className="text-2xl font-black text-ink">{d.progress.marked}</p><p className="text-xs text-muted-foreground">answers marked</p></div>
          <div className="rounded-2xl bg-slate-100 p-3"><p className="text-2xl font-black text-ink">{d.progress.average === null ? "—" : `${d.progress.average}%`}</p><p className="text-xs text-muted-foreground">average score</p></div>
        </div>
        <div className="mt-4 grid gap-3 sm:grid-cols-2">
          <div className="rounded-2xl bg-emerald-50 p-3 ring-1 ring-emerald-200">
            <p className="flex items-center gap-1.5 text-sm font-bold text-emerald-800"><TrendingUp className="size-4" aria-hidden /> Strong</p>
            <ul className="mt-1 space-y-0.5 text-sm text-emerald-900">{d.progress.strong.map((s) => <li key={s}>{s}</li>)}</ul>
          </div>
          <div className="rounded-2xl bg-amber-50 p-3 ring-1 ring-amber-200">
            <p className="flex items-center gap-1.5 text-sm font-bold text-amber-800"><TrendingDown className="size-4" aria-hidden /> Work on</p>
            <ul className="mt-1 space-y-0.5 text-sm text-amber-900">{d.progress.weak.map((s) => <li key={s}>{s}</li>)}</ul>
          </div>
        </div>
        <p className="mt-3 text-[11px] text-subtle">Scores are Soma&apos;s indicative estimates, not RCSC marks.</p>
      </section>
    </div>
  );
}

/**
 * Overall ME progress: the three papers together, combined with RCSC's weightage (from the database).
 * DRAFT layout for the founder's review.
 */
export type MeOverallData = {
  papers: { number: string; title: string; weight: number | null; average: number | null; marked: number }[];
};

/** Weighted average of the papers that have a score and a weight; null until there is something to combine. */
export function weightedScore(papers: MeOverallData["papers"]): number | null {
  const scored = papers.filter((p) => p.average !== null && p.weight);
  const w = scored.reduce((n, p) => n + (p.weight ?? 0), 0);
  return w ? Math.round(scored.reduce((n, p) => n + (p.average ?? 0) * (p.weight ?? 0), 0) / w) : null;
}

export function MeOverall({ d }: { d: MeOverallData }) {
  const overall = weightedScore(d.papers);
  const marked = d.papers.reduce((n, p) => n + p.marked, 0);
  // Focus: the paper where improving gains the most (lowest score × highest weight), or one not started yet.
  const focus = [...d.papers].sort((a, b) => ((100 - (b.average ?? 0)) * (b.weight ?? 0)) - ((100 - (a.average ?? 0)) * (a.weight ?? 0)))[0];
  return (
    <section aria-labelledby="overall-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
      <h2 id="overall-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><BarChart3 className="size-5 text-slate-700" aria-hidden /> My overall ME progress</h2>
      <div className="mt-4 flex items-center gap-4">
        <div className="flex size-24 shrink-0 flex-col items-center justify-center rounded-full bg-slate-800 text-white shadow-lg">
          <span className="text-3xl font-black leading-none">{overall === null ? "—" : `${overall}%`}</span>
          <span className="mt-1 text-[10px] font-semibold uppercase tracking-wide text-white/80">overall</span>
        </div>
        <p className="text-sm text-muted-foreground">
          Your three papers combined the way RCSC weighs them. <span className="font-semibold text-ink">{marked} answers marked</span> so far.
        </p>
      </div>

      <ul className="mt-5 space-y-3">
        {d.papers.map((p) => (
          <li key={p.number}>
            <div className="flex items-baseline justify-between text-sm">
              <span className="font-bold text-ink">Paper {p.number} <span className="font-normal text-muted-foreground">{p.weight ? `· ${p.weight}%` : ""}</span></span>
              <span className="font-bold text-ink">{p.average === null ? "Not started" : `${p.average}%`}</span>
            </div>
            <div className="mt-1 h-3 overflow-hidden rounded-full bg-slate-100">
              <div className="h-full rounded-full bg-gradient-to-r from-slate-500 to-slate-800" style={{ width: `${p.average ?? 0}%` }} />
            </div>
          </li>
        ))}
      </ul>

      {focus ? (
        <p className="mt-5 rounded-2xl bg-amber-50 p-3 text-sm text-amber-900 ring-1 ring-amber-200">
          <span className="font-bold">Focus next: Paper {focus.number}.</span>{" "}
          {focus.average === null ? "You have not started it yet" : `It is your biggest chance to gain marks`}{focus.weight ? ` and it carries ${focus.weight}% of the written exam.` : "."}
        </p>
      ) : null}
      <p className="mt-3 text-[11px] text-subtle">Scores are Soma&apos;s indicative estimates, not RCSC marks.</p>
    </section>
  );
}
