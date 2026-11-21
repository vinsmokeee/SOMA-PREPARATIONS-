import Link from "next/link";
import { BookMarked, CheckCircle2 } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { QuestionStem } from "@/components/exam/question-stem";

export type Note = {
  question_id: string; kind: "mcq" | "written";
  paper_id: string | null; paper_number: number | null; paper_title: string | null;
  subject: string; subject_order: number;
  stem: string; image_url: string | null; source_year: number | null;
  answer: string | null; explanation: string | null; model_answer: string | null;
  score: number | null; max_score: number | null; saved_at: string;
};
export type NotebookPaper = { id: string; number: number | null; title: string };

const ROMAN = ["", "I", "II", "III", "IV", "V"];
export const paperName = (p: { number: number | null; title: string }) => (p.number ? `Paper ${ROMAN[p.number] ?? p.number}` : p.title);

/** Notes grouped by subject, keeping the order the database gives (subject order, newest first). */
export function bySubject(notes: Note[]): { subject: string; notes: Note[] }[] {
  const groups = new Map<string, Note[]>();
  for (const n of notes) groups.set(n.subject, [...(groups.get(n.subject) ?? []), n]);
  return [...groups].map(([subject, list]) => ({ subject, notes: list }));
}

/**
 * One box per paper (Paper I, II, III): the student's own papers for their current entry. Notes only ever come from
 * that entry (the database leaves out other subjects), so papers never repeat and subjects never mix.
 */
export function notebookPapers(own: NotebookPaper[], notes: Note[]): NotebookPaper[] {
  const out: NotebookPaper[] = [...own];
  if (!out.length) for (const n of notes) if (n.paper_id && !out.some((x) => x.id === n.paper_id)) out.push({ id: n.paper_id, number: n.paper_number, title: n.paper_title ?? "Paper" });
  return out.sort((a, b) => (a.number ?? 99) - (b.number ?? 99));
}

/** The notes under a paper box: that paper's own questions only. */
export const notesForPaper = (notes: Note[], p: NotebookPaper) => notes.filter((n) => n.paper_id === p.id);

function NoteCard({ n }: { n: Note }) {
  return (
    <li className="rounded-2xl border border-[#e7d6c6] bg-white p-4">
      {n.source_year ? <p className="text-xs font-medium text-muted-foreground">BCSE {n.source_year}</p> : null}
      <QuestionStem stem={n.stem} imageUrl={n.image_url} className="mt-1" />
      {n.kind === "mcq" && n.answer ? (
        <p className="mt-3 flex items-start gap-2 rounded-xl bg-success-soft px-3 py-2 text-sm font-semibold text-success">
          <CheckCircle2 className="mt-0.5 size-4 shrink-0" aria-hidden /> Answer: {n.answer}
        </p>
      ) : null}
      {n.kind === "written" && n.score !== null ? (
        <p className="mt-3 flex items-start gap-2 rounded-xl bg-success-soft px-3 py-2 text-sm font-semibold text-success">
          <CheckCircle2 className="mt-0.5 size-4 shrink-0" aria-hidden /> Your best mark: {Number(n.score)}/{Number(n.max_score)}
        </p>
      ) : null}
      {n.explanation ? <p className="mt-2 text-sm leading-relaxed text-ink">{n.explanation}</p> : null}
      {n.model_answer ? (
        <details className="mt-3 rounded-xl bg-[#faf3ec] p-3">
          <summary className="cursor-pointer text-sm font-semibold text-[#7c4a2d]">Model answer</summary>
          <p className="mt-2 whitespace-pre-wrap text-sm leading-relaxed text-ink">{n.model_answer}</p>
        </details>
      ) : null}
    </li>
  );
}

function Subjects({ notes }: { notes: Note[] }) {
  return (
    <div className="space-y-3">
      {bySubject(notes).map((g) => (
        <details key={g.subject} open className="rounded-2xl bg-[#f6ede4] p-3">
          <summary className="flex cursor-pointer items-baseline justify-between gap-3 px-1 py-1">
            <span className="font-bold text-[#5c3a22]">{g.subject}</span>
            <span className="text-sm tabular-nums text-[#7c4a2d]">{g.notes.length} note{g.notes.length === 1 ? "" : "s"}</span>
          </summary>
          <ul className="mt-2 space-y-3">{g.notes.map((n) => <NoteCard key={n.question_id} n={n} />)}</ul>
        </details>
      ))}
    </div>
  );
}

function Empty({ stage }: { stage: "PE" | "ME" }) {
  return (
    <p className="rounded-2xl bg-[#f6ede4] p-5 text-sm text-[#5c3a22]">
      No notes here yet. {stage === "PE" ? "Every question you answer correctly in tests and practice" : "Every multiple-choice question you get right, and every written answer that scores 60% or more,"} will be saved here with its answer.
    </p>
  );
}

function PaperChooser({ tabs, notes }: { tabs: NotebookPaper[]; notes: Note[] }) {
  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <PageTitle title="Your notebook · ME" description="All your correct answers are saved here as notes, with the answer. Choose a paper." />
      {tabs.length ? (
        <ul className="grid grid-cols-1 gap-3">
          {tabs.map((p) => {
            const count = notesForPaper(notes, p).length;
            return (
              <li key={p.id} className="min-w-0">
                <Link href={`/dashboard/notebook?stage=ME&paper=${p.id}`} className="flex w-full min-w-0 items-center gap-4 rounded-2xl bg-gradient-to-br from-[#7c4a2d] to-[#a8703f] p-4 text-white shadow-md active:scale-[0.98]">
                  <BookMarked className="size-7 shrink-0" aria-hidden />
                  <span className="min-w-0 flex-1">
                    <span className="block text-lg font-extrabold">{paperName(p)}</span>
                    <span className="block truncate text-xs text-white/85">{p.title}</span>
                  </span>
                  <span className="shrink-0 rounded-full bg-white/20 px-2.5 py-1 text-xs font-bold">{count} note{count === 1 ? "" : "s"}</span>
                </Link>
              </li>
            );
          })}
        </ul>
      ) : <Empty stage="ME" />}
    </div>
  );
}

/** "Your notebook": every question the student has answered correctly, kept as a note with its answer. */
export function Notebook({ stage, notes, papers, paperId }: { stage: "PE" | "ME"; notes: Note[]; papers: NotebookPaper[]; paperId: string | null }) {
  const tabs = stage === "ME" ? notebookPapers(papers, notes) : [];
  const current = tabs.find((p) => p.id === paperId) ?? null;
  const shown = stage === "ME" ? (current ? notesForPaper(notes, current) : []) : notes;
  // ME: first choose Paper I, II or III; then that paper's notes (founder, 22 Nov 2026).
  if (stage === "ME" && !current) return <PaperChooser tabs={tabs} notes={notes} />;
  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <PageTitle title={`Your notebook · ${stage}`} description="All your correct answers are saved here as notes, with the answer, so you can revise any time." />
      <div className="flex items-center gap-3 rounded-2xl bg-gradient-to-br from-[#7c4a2d] to-[#a8703f] p-4 text-white">
        <BookMarked className="size-7 shrink-0" aria-hidden />
        <p className="text-sm"><span className="block text-2xl font-extrabold">{shown.length}</span>note{shown.length === 1 ? "" : "s"} {current ? `in ${paperName(current)}` : "so far"}. Every correct answer adds one.</p>
      </div>

      {stage === "ME" && current ? (
        <div className="flex items-center justify-between gap-3">
          <div>
            <h2 className="text-lg font-extrabold text-[#5c3a22]">{paperName(current)}</h2>
            <p className="text-sm text-muted-foreground">{current.title}</p>
          </div>
          <Link href="/dashboard/notebook?stage=ME" className="shrink-0 rounded-full bg-[#f6ede4] px-3 py-1.5 text-sm font-semibold text-[#7c4a2d]">All papers</Link>
        </div>
      ) : null}

      {shown.length ? <Subjects notes={shown} /> : <Empty stage={stage} />}
    </div>
  );
}
