import { BarChart3, ClipboardCheck, PenLine, TrendingDown, TrendingUp } from "lucide-react";
import { MockButton, PracticeTypeButton } from "./paper-start";

/** One ME paper with the caller's progress, from `my_me_progress()`. */
export type MeProgressPaper = {
  id: string; number: number | null; title: string; weight: number | null;
  duration_minutes: number | null; max_marks: number | null; reading_minutes?: number | null;
  marked: number; recent: number | null;
  types: { type: string; count: number }[];
  by_type: { label: string; pct: number; n: number }[];
  by_topic: { label: string; pct: number; n: number }[];
  mocks: { at: string; pct: number | null }[];
  mock_ready: boolean;
  pattern: { title: string; type: string; count: number; marks_each: number | null; answer_any: number | null }[];
};

export const ROMAN = ["", "I", "II", "III", "IV", "V"];
export const roman = (n: number | null) => (n ? ROMAN[n] ?? String(n) : "");
const TYPE_LABEL: Record<string, string> = {
  short_answer: "Short answers", long_answer: "Long answers", essay: "Essays", analytical: "Analytical questions", descriptive: "Descriptive questions",
  translation: "Translation", passage: "Comprehension", case_study: "Case studies",
};
export const typeLabel = (t: string) => TYPE_LABEL[t] ?? t;
/** A question type's name on this paper: the RCSC part it belongs to when the pattern is known ("Part A: …"). */
export const paperTypeLabel = (p: Pick<MeProgressPaper, "pattern">, t: string) => {
  const parts = p.pattern.filter((b) => b.type === t);
  return parts.length === 1 ? parts[0].title : typeLabel(t);
};

const STRONG = 70; // % and above: strong
const WEAK = 50;   // below: work on

/** Strong and weak areas of a paper: question types and topics with at least 2 marked answers. */
export function areas(p: MeProgressPaper) {
  const all = [...p.by_type.map((x) => ({ ...x, label: paperTypeLabel(p, x.label) })), ...p.by_topic].filter((x) => x.n >= 2);
  return {
    strong: all.filter((x) => x.pct >= STRONG).sort((a, b) => b.pct - a.pct).slice(0, 4).map((x) => x.label),
    weak: all.filter((x) => x.pct < WEAK).sort((a, b) => a.pct - b.pct).slice(0, 4).map((x) => x.label),
  };
}

/**
 * One ME paper (Paper I, II or III): a timed mock paper, practise by question type, and progress for this paper only.
 * Past papers and their years are not shown to students (founder, 20 Nov 2026).
 */
export function PaperHome({ p }: { p: MeProgressPaper }) {
  const n = roman(p.number);
  const { strong, weak } = areas(p);
  const mocks = [...p.mocks].reverse(); // newest first
  return (
    <div data-exam="ME" className="mx-auto max-w-lg space-y-5">
      <section className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-slate-600 via-slate-700 to-slate-800 p-5 text-white shadow-xl">
        <span className="absolute -right-8 -top-8 size-32 rounded-full bg-white/10" aria-hidden />
        <p className="relative text-3xl font-black">Paper {n}</p>
        <p className="relative text-base text-white/90">{p.title}</p>
        {p.weight ? <p className="relative mt-3 inline-block rounded-full bg-white/15 px-3 py-1 text-xs font-bold">{Number(p.weight)}% of the written exam</p> : null}
      </section>

      {/* 1. Mock paper first, like the PE (founder, 20 Nov 2026) */}
      <section aria-labelledby="mock-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="mock-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><ClipboardCheck className="size-5 text-slate-700" aria-hidden /> Mock paper</h2>
        <p className="mt-1 text-sm text-muted-foreground">The whole paper in the RCSC pattern, timed like the real exam. Built just for you, with new questions every time.{p.pattern.some((b) => b.answer_any) ? " You start by reading the question paper and choosing which questions to answer, like in the exam hall." : ""}</p>
        {p.duration_minutes || p.max_marks ? (
          <div className="mt-3 flex flex-wrap gap-2 text-xs font-bold">
            {p.duration_minutes ? <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{p.duration_minutes >= 60 && p.duration_minutes % 60 === 0 ? `${p.duration_minutes / 60} hour${p.duration_minutes === 60 ? "" : "s"}` : `${p.duration_minutes} minutes`}</span> : null}
            {p.max_marks ? <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{Number(p.max_marks)} marks</span> : null}
            {p.reading_minutes ? <span className="rounded-full bg-amber-100 px-3 py-1 text-amber-800">+ {p.reading_minutes} min reading</span> : null}
          </div>
        ) : null}
        {p.pattern.length ? (
          <ul className="mt-3 space-y-1 text-sm text-muted-foreground">
            {p.pattern.map((b) => (
              <li key={b.title}>· {b.title}: {b.answer_any ? `answer any ${b.answer_any} of ${b.count}` : `${b.count} question${b.count === 1 ? "" : "s"}`}{b.marks_each ? `, ${Number(b.marks_each)} marks each` : ""}</li>
            ))}
          </ul>
        ) : null}
        {p.mock_ready ? <MockButton paper={p.id} again={p.mocks.length > 0} /> : (
          <p className="mt-4 rounded-2xl bg-slate-100 p-4 text-sm text-muted-foreground">Mock papers for this paper are being prepared.</p>
        )}
        {mocks.length ? (
          <div className="mt-4">
            <p className="text-sm font-bold text-ink">My mock papers</p>
            <ul className="mt-2 divide-y divide-border rounded-2xl ring-1 ring-border">
              {mocks.map((m, i) => {
                const prev = mocks[i + 1]?.pct;
                const up = m.pct !== null && prev !== undefined && prev !== null ? m.pct - prev : null;
                return (
                  <li key={m.at} className="flex items-center justify-between px-4 py-2.5 text-sm">
                    <span className="font-semibold text-ink">Mock {mocks.length - i}</span>
                    <span className="font-bold text-ink">
                      {m.pct === null ? "Marking…" : `${m.pct}%`}
                      {up !== null && up !== 0 ? <span className={up > 0 ? "ml-1.5 text-success" : "ml-1.5 text-danger"}>{up > 0 ? "↑" : "↓"}</span> : null}
                    </span>
                  </li>
                );
              })}
            </ul>
          </div>
        ) : null}
      </section>

      {/* 2. Practise */}
      <section aria-labelledby="practise-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="practise-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><PenLine className="size-5 text-slate-700" aria-hidden /> Practise</h2>
        <p className="mt-1 text-sm text-muted-foreground">One question at a time, a new one each time. Write on paper and upload a photo, or type. AI marks it and shows how to improve.</p>
        {p.types.length ? (
          <div className="mt-4 grid gap-2">
            {p.types.map((t) => <PracticeTypeButton key={t.type} paper={p.id} type={t.type} label={paperTypeLabel(p, t.type)} count={t.count} />)}
          </div>
        ) : (
          <p className="mt-4 rounded-2xl bg-slate-100 p-4 text-sm text-muted-foreground">Questions for this paper are being prepared. They will appear here soon.</p>
        )}
      </section>

      {/* 3. My progress in this paper */}
      <section aria-labelledby="prog-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
        <h2 id="prog-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><BarChart3 className="size-5 text-slate-700" aria-hidden /> My progress in Paper {n}</h2>
        <div className="mt-3 grid grid-cols-2 gap-3 text-center">
          <div className="rounded-2xl bg-slate-100 p-3"><p className="text-2xl font-black text-ink">{p.marked}</p><p className="text-xs text-muted-foreground">answers marked</p></div>
          <div className="rounded-2xl bg-slate-100 p-3"><p className="text-2xl font-black text-ink">{p.recent === null ? "—" : `${p.recent}%`}</p><p className="text-xs text-muted-foreground">average (last 10)</p></div>
        </div>
        {strong.length || weak.length ? (
          <div className="mt-4 grid gap-3 sm:grid-cols-2">
            {strong.length ? (
              <div className="rounded-2xl bg-emerald-50 p-3 ring-1 ring-emerald-200">
                <p className="flex items-center gap-1.5 text-sm font-bold text-emerald-800"><TrendingUp className="size-4" aria-hidden /> Strong</p>
                <ul className="mt-1 space-y-0.5 text-sm text-emerald-900">{strong.map((s) => <li key={s}>{s}</li>)}</ul>
              </div>
            ) : null}
            {weak.length ? (
              <div className="rounded-2xl bg-amber-50 p-3 ring-1 ring-amber-200">
                <p className="flex items-center gap-1.5 text-sm font-bold text-amber-800"><TrendingDown className="size-4" aria-hidden /> Work on</p>
                <ul className="mt-1 space-y-0.5 text-sm text-amber-900">{weak.map((s) => <li key={s}>{s}</li>)}</ul>
              </div>
            ) : null}
          </div>
        ) : (
          <p className="mt-4 text-sm text-muted-foreground">{p.marked ? "Answer a few more questions to see your strong areas and what to work on." : "Your strong areas and what to work on appear after your first marked answers."}</p>
        )}
        <p className="mt-3 text-[11px] text-subtle">Scores are Soma&apos;s indicative estimates, not RCSC marks.</p>
      </section>
    </div>
  );
}

/** Weighted average of the papers that have a score and a weight; null until there is something to combine. */
export function weightedScore(papers: Pick<MeProgressPaper, "recent" | "weight">[]): number | null {
  const scored = papers.filter((p) => p.recent !== null && p.weight);
  const w = scored.reduce((n, p) => n + Number(p.weight), 0);
  return w ? Math.round(scored.reduce((n, p) => n + Number(p.recent) * Number(p.weight), 0) / w) : null;
}

/** The paper to work on next: not started first (heaviest), else where improving gains the most (gap × weight). */
export function focusPaper<T extends Pick<MeProgressPaper, "recent" | "weight">>(papers: T[]): T | null {
  if (!papers.length) return null;
  const gain = (p: T) => (100 - (p.recent ?? 0)) * Number(p.weight ?? 1);
  return [...papers].sort((a, b) => gain(b) - gain(a))[0];
}

/** Overall ME progress: the three papers together, combined with RCSC's weightage. */
export function MeOverall({ papers }: { papers: MeProgressPaper[] }) {
  const overall = weightedScore(papers);
  const marked = papers.reduce((n, p) => n + p.marked, 0);
  const focus = focusPaper(papers);
  return (
    <section aria-labelledby="overall-h" className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border">
      <h2 id="overall-h" className="flex items-center gap-2 text-lg font-extrabold text-ink"><BarChart3 className="size-5 text-slate-700" aria-hidden /> My overall ME progress</h2>
      <div className="mt-4 flex items-center gap-4">
        <div className="flex size-24 shrink-0 flex-col items-center justify-center rounded-full bg-slate-800 text-white shadow-lg">
          <span className="text-3xl font-black leading-none">{overall === null ? "—" : `${overall}%`}</span>
          <span className="mt-1 text-[10px] font-semibold uppercase tracking-wide text-white/80">overall</span>
        </div>
        <p className="text-sm text-muted-foreground">
          Your three papers combined the way RCSC weighs them, from your latest answers. <span className="font-semibold text-ink">{marked} answer{marked === 1 ? "" : "s"} marked</span> so far.
        </p>
      </div>
      <ul className="mt-5 space-y-3">
        {papers.map((p) => (
          <li key={p.id}>
            <div className="flex items-baseline justify-between text-sm">
              <span className="font-bold text-ink">Paper {roman(p.number)} <span className="font-normal text-muted-foreground">{p.weight ? `· ${Number(p.weight)}%` : ""}</span></span>
              <span className="font-bold text-ink">{p.recent === null ? "Not started" : `${p.recent}%`}</span>
            </div>
            <div className="mt-1 h-3 overflow-hidden rounded-full bg-slate-100">
              <div className="h-full rounded-full bg-gradient-to-r from-slate-500 to-slate-800" style={{ width: `${p.recent ?? 0}%` }} />
            </div>
          </li>
        ))}
      </ul>
      {focus ? (
        <p className="mt-5 rounded-2xl bg-amber-50 p-3 text-sm text-amber-900 ring-1 ring-amber-200">
          <span className="font-bold">Focus next: Paper {roman(focus.number)}.</span>{" "}
          {focus.recent === null ? "You have not started it yet" : "It is your biggest chance to gain marks"}{focus.weight ? `, and it carries ${Number(focus.weight)}% of the written exam.` : "."}
        </p>
      ) : null}
      <p className="mt-3 text-[11px] text-subtle">Scores are Soma&apos;s indicative estimates, not RCSC marks.</p>
    </section>
  );
}
