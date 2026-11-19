"use client";

import { useEffect, useMemo, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { CheckCircle2, Circle, Clock3, Info } from "lucide-react";
import { chooseQuestionsAction } from "@/app/exam/[attemptId]/choose-actions";
import { choiceProblems, choiceSections } from "@/lib/exam/choice";
import type { AttemptPaper } from "@/lib/exam/types";
import { cn } from "@/lib/utils";

const clock = (s: number) => {
  const t = Math.max(0, Math.floor(s));
  const h = Math.floor(t / 3600), m = Math.floor((t % 3600) / 60), sec = t % 60;
  return `${h ? `${h}:` : ""}${String(m).padStart(h ? 2 : 1, "0")}:${String(sec).padStart(2, "0")}`;
};

/**
 * The question paper of an "answer any N" mock, like the printed RCSC paper during reading time (founder, 20 Nov 2026):
 * the student reads every question and chooses which ones to answer in each part, then starts writing.
 */
export function ChoosePaper({ paper, changing }: { paper: AttemptPaper; changing: boolean }) {
  const router = useRouter();
  const sections = useMemo(() => choiceSections(paper.questions), [paper.questions]);
  const [chosen, setChosen] = useState<Set<string>>(() => new Set(paper.attempt.chosen_groups ?? []));
  const [error, setError] = useState<string | null>(null);
  const [pending, start] = useTransition();
  const problems = choiceProblems(sections, chosen);

  // Reading time, then writing time, counted from the server's clock.
  const [offset] = useState(() => new Date(paper.attempt.server_now).getTime() - Date.now());
  const readingEnds = paper.exam.reading_minutes ? new Date(paper.attempt.started_at).getTime() + paper.exam.reading_minutes * 60_000 : null;
  const deadline = new Date(paper.attempt.deadline_at).getTime();
  const [now, setNow] = useState<number | null>(null);
  useEffect(() => {
    const tick = () => setNow(Date.now() + offset);
    tick();
    const t = setInterval(tick, 1000);
    return () => clearInterval(t);
  }, [offset]);
  const reading = now !== null && readingEnds !== null && now < readingEnds;

  const toggle = (sectionOrder: number, key: string) => {
    setError(null);
    setChosen((prev) => {
      const next = new Set(prev);
      if (next.has(key)) { next.delete(key); return next; }
      const s = sections.find((x) => x.order === sectionOrder)!;
      if (s.groups.filter((g) => next.has(g.key)).length >= s.chooseAny) return prev; // full: remove one first
      next.add(key);
      return next;
    });
  };
  const save = () => start(async () => {
    const r = await chooseQuestionsAction(paper.attempt.id, [...chosen]);
    if (!r.ok) { setError(r.message); return; }
    router.replace(`/exam/${paper.attempt.id}`);
    router.refresh();
  });

  return (
    <div className="min-h-dvh bg-background pb-40">
      <header className="sticky top-0 z-30 border-b border-border bg-background/95 backdrop-blur">
        <div className="mx-auto flex h-14 max-w-3xl items-center gap-3 px-3 sm:h-16 sm:px-6">
          <div className="min-w-0 flex-1">
            <p className="truncate text-sm font-semibold text-ink sm:text-base">{paper.exam.title}</p>
            <p className="text-xs text-muted-foreground">Question paper</p>
          </div>
          {now !== null ? (
            <div role="timer" className={cn("flex items-center gap-1.5 rounded-md px-2.5 py-1.5 font-mono text-sm font-semibold tabular-nums text-white", reading ? "bg-amber-600" : "bg-ink")}>
              <Clock3 className="size-4" aria-hidden />
              {reading ? `Reading ${clock((readingEnds! - now) / 1000)}` : clock((deadline - now) / 1000)}
            </div>
          ) : null}
        </div>
      </header>

      <main className="mx-auto max-w-3xl space-y-6 px-3 pt-5 sm:px-6">
        {/* The rule, impossible to miss (founder: "I couldn't see that on my first try") */}
        <section aria-labelledby="choose-h" className="rounded-3xl border-2 border-amber-400 bg-amber-50 p-5 text-amber-950">
          <h1 id="choose-h" className="flex items-center gap-2 text-xl font-extrabold"><Info className="size-6 shrink-0" aria-hidden /> {changing ? "Change your questions" : "Choose your questions first"}</h1>
          <p className="mt-1 text-sm">
            Like the real RCSC paper, you do not answer every question. Read them all, then tap <strong>Choose this question</strong> on the ones you will answer:
          </p>
          <ul className="mt-3 space-y-1.5">
            {sections.map((s) => {
              const got = s.groups.filter((g) => chosen.has(g.key)).length;
              return (
                <li key={s.order} className="flex items-center justify-between gap-3 rounded-xl bg-white/70 px-3 py-2 text-sm">
                  <span><strong>{s.title}:</strong> choose {s.chooseAny} of {s.groups.length}</span>
                  <span className={cn("shrink-0 rounded-full px-2.5 py-0.5 text-xs font-bold", got === s.chooseAny ? "bg-success text-white" : "bg-amber-200 text-amber-900")}>{got} of {s.chooseAny} chosen</span>
                </li>
              );
            })}
          </ul>
          {reading ? <p className="mt-3 text-xs">Reading time: like the exam hall, use it to read and choose. Your writing time starts when it ends.</p> : null}
          {changing ? <p className="mt-3 text-xs">Answers you already wrote for a question you remove are kept, but only the chosen questions are marked.</p> : null}
        </section>

        {sections.map((s) => {
          const full = s.groups.filter((g) => chosen.has(g.key)).length >= s.chooseAny;
          return (
            <section key={s.order} aria-labelledby={`sec-${s.order}`} className="space-y-3">
              <div>
                <h2 id={`sec-${s.order}`} className="text-lg font-extrabold text-ink">{s.title}</h2>
                <p className="text-sm font-semibold text-amber-800">Answer any {s.chooseAny} of these {s.groups.length} questions.</p>
              </div>
              {s.groups.map((g) => {
                const on = chosen.has(g.key);
                return (
                  <article key={g.key} className={cn("rounded-3xl bg-white p-5 shadow-sm ring-2 transition", on ? "ring-success" : "ring-border")}>
                    <div className="flex items-baseline justify-between gap-3">
                      <h3 className="text-base font-extrabold text-ink">Question {g.number}</h3>
                      <span className="text-xs font-semibold text-muted-foreground">{g.marks} marks</span>
                    </div>
                    <div className="mt-2 space-y-3 whitespace-pre-wrap text-sm leading-relaxed text-ink">
                      {g.parts.map((p, i) => {
                        // A shared introduction is printed once, as on the paper.
                        const prev = g.parts[i - 1]?.stem ?? "";
                        let k = 0;
                        while (i > 0 && k < prev.length && k < p.stem.length && prev[k] === p.stem[k]) k++;
                        const cut = i > 0 ? p.stem.lastIndexOf("\n\n", k) : -1;
                        return <p key={p.exam_question_id}>{cut > 0 ? p.stem.slice(cut + 2) : p.stem}</p>;
                      })}
                    </div>
                    <button type="button" onClick={() => toggle(s.order, g.key)} disabled={!on && full}
                      aria-pressed={on}
                      className={cn("mt-4 flex h-12 w-full items-center justify-center gap-2 rounded-2xl text-base font-bold transition active:scale-[0.99]",
                        on ? "bg-success text-white" : full ? "bg-muted text-muted-foreground" : "bg-slate-800 text-white")}>
                      {on ? <><CheckCircle2 className="size-5" aria-hidden /> Chosen · tap to remove</> : full ? `You have chosen ${s.chooseAny}. Remove one to choose this` : <><Circle className="size-5" aria-hidden /> Choose this question</>}
                    </button>
                  </article>
                );
              })}
            </section>
          );
        })}
      </main>

      <div className="fixed inset-x-0 bottom-0 z-30 border-t border-border bg-background/95 p-3 backdrop-blur">
        <div className="mx-auto max-w-3xl">
          {error ? <p role="alert" className="mb-2 text-sm font-medium text-danger">{error}</p> : null}
          <p className="mb-2 text-center text-sm font-semibold text-ink" aria-live="polite">{problems.length ? problems[0] : "Ready: you will answer your chosen questions, one part at a time."}</p>
          <button type="button" onClick={save} disabled={problems.length > 0 || pending}
            className="h-12 w-full rounded-2xl bg-primary text-base font-bold text-primary-foreground shadow disabled:opacity-50">
            {pending ? "Saving…" : changing ? "Save my choice" : "Start writing"}
          </button>
        </div>
      </div>
    </div>
  );
}
