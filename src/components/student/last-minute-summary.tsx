import Link from "next/link";
import { BookOpenCheck, CheckCircle2, Crown, Lightbulb, PencilLine } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { QuestionStem } from "@/components/exam/question-stem";
import { tipFor } from "@/lib/exam/coach";

type Item = { stem: string; image_url: string | null; explanation: string | null; subject: string | null; source_year: number | null; answer: string | null; past_paper?: boolean };
export type Summary = { premium: boolean; answered: number; sections: { subject: string; answered: number; correct: number }[]; mistakes: Item[]; key_past: Item[] };

const REMINDERS: Record<"PE" | "ME", string[]> = {
  PE: [
    "Shade each answer circle completely, edge to edge, and keep the pencil inside the line.",
    "If you change an answer, erase the old shading cleanly.",
    "Keep moving: about 1½ minutes per question. Mark hard ones and come back to them.",
    "Read every option before choosing; rule out the clearly wrong ones first.",
    "Bring your admit card and everything RCSC lists for the exam, and reach the centre early.",
  ],
  ME: [
    "Read each question twice and underline what it asks you to do.",
    "Plan your answer in a few lines before you write; keep to the point.",
    "Share your time across all questions; leave a few minutes to read through.",
    "Write clearly with headings and short paragraphs.",
    "Bring your admit card and everything RCSC lists for the exam, and reach the centre early.",
  ],
};

function QuestionCard({ q }: { q: Item }) {
  return (
    <li className="rounded-2xl border border-border bg-white p-4">
      <p className="text-xs font-medium text-muted-foreground">{q.subject ?? "PE"}{q.source_year ? ` · BCSE ${q.source_year}` : ""}</p>
      <QuestionStem stem={q.stem} imageUrl={q.image_url} className="mt-1" />
      {q.answer ? (
        <p className="mt-3 flex items-start gap-2 rounded-xl bg-success-soft px-3 py-2 text-sm font-semibold text-success">
          <CheckCircle2 className="mt-0.5 size-4 shrink-0" aria-hidden /> Answer: {q.answer}
        </p>
      ) : null}
      {q.explanation ? <p className="mt-2 text-sm leading-relaxed text-ink">{q.explanation}</p> : null}
    </li>
  );
}


/** Last-minute revision before the exam: weak sections, past-paper mistakes, key past-paper questions and reminders. */
export function LastMinuteSummary({ stage, s }: { stage: "PE" | "ME"; s: Summary }) {
  const pastMistakes = s.mistakes.filter((m) => m.past_paper);
  const otherMistakes = s.mistakes.filter((m) => !m.past_paper);
  return (
    <div className="mx-auto max-w-2xl space-y-8">
      <PageTitle title={`Last-minute summary · ${stage}`} description="A short read before your exam: where you are strongest and weakest, and the past-paper questions worth one more look." />

      {stage === "PE" && s.sections.length ? (
        <section aria-labelledby="lm-sections">
          <h2 id="lm-sections" className="mb-3 text-lg font-bold">Your sections at a glance</h2>
          <ul className="space-y-3">
            {s.sections.map((x) => {
              const pct = Math.round((x.correct / Math.max(x.answered, 1)) * 100);
              return (
                <li key={x.subject} className="rounded-2xl border border-border bg-white p-4">
                  <div className="flex items-baseline justify-between gap-3">
                    <p className="font-bold text-ink">{x.subject}</p>
                    <p className="text-sm tabular-nums text-muted-foreground">{x.correct} of {x.answered} right · {pct}%</p>
                  </div>
                  <div className="mt-2 h-2 rounded-full bg-muted" aria-hidden><div className="h-2 rounded-full bg-primary" style={{ width: `${pct}%` }} /></div>
                  <p className="mt-2 flex items-start gap-2 text-sm text-ink"><Lightbulb className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden /> {tipFor(x.subject)}</p>
                </li>
              );
            })}
          </ul>
        </section>
      ) : null}

      {pastMistakes.length ? (
        <section aria-labelledby="lm-past">
          <h2 id="lm-past" className="mb-1 text-lg font-bold">Past-paper questions to revise</h2>
          <p className="mb-3 text-sm text-muted-foreground">Real BCSE questions you got wrong. Read the answer and why.</p>
          <ul className="space-y-3">{pastMistakes.map((q, i) => <QuestionCard key={i} q={q} />)}</ul>
        </section>
      ) : null}

      {stage === "PE" ? (
        <section aria-labelledby="lm-key">
          <h2 id="lm-key" className="mb-1 text-lg font-bold">Key past-paper questions</h2>
          {s.premium ? (
            s.key_past.length ? (
              <>
                <p className="mb-3 text-sm text-muted-foreground">Questions from real BCSE papers you have not practised yet, with answers.</p>
                <ul className="space-y-3">{s.key_past.map((q, i) => <QuestionCard key={i} q={q} />)}</ul>
              </>
            ) : <p className="text-sm text-muted-foreground">You have already practised every past-paper question. Well done!</p>
          ) : (
            <Link href="/dashboard/pe?plans=1" className="flex items-center gap-3 rounded-2xl bg-yellow-100 p-4 text-sm text-yellow-950 ring-1 ring-yellow-300">
              <Crown className="size-6 shrink-0 text-yellow-700" aria-hidden />
              <span><span className="block font-bold">Premium: key past-paper questions with answers</span>See important BCSE questions you have not practised yet.</span>
            </Link>
          )}
        </section>
      ) : null}

      {otherMistakes.length ? (
        <section aria-labelledby="lm-other">
          <h2 id="lm-other" className="mb-1 text-lg font-bold">Other mistakes to fix</h2>
          <p className="mb-3 text-sm text-muted-foreground">Practice questions you got wrong recently.</p>
          <ul className="space-y-3">{otherMistakes.map((q, i) => <QuestionCard key={i} q={q} />)}</ul>
        </section>
      ) : null}

      {s.answered === 0 && stage === "PE" ? (
        <p className="flex items-start gap-2 rounded-2xl bg-muted p-4 text-sm text-ink">
          <BookOpenCheck className="mt-0.5 size-5 shrink-0 text-primary" aria-hidden />
          Take a test or two first and your summary will show your own weak areas and the past-paper questions to revise.
        </p>
      ) : null}

      <section aria-labelledby="lm-remind" className="rounded-3xl bg-gradient-to-br from-amber-400 via-orange-500 to-rose-600 p-5 text-white shadow-xl">
        <h2 id="lm-remind" className="flex items-center gap-2 text-lg font-extrabold"><PencilLine className="size-5" aria-hidden /> Exam-day reminders</h2>
        <ul className="mt-2 list-disc space-y-1.5 pl-5 text-sm text-white/95">
          {REMINDERS[stage].map((r) => <li key={r}>{r}</li>)}
        </ul>
        <p className="mt-3 text-sm font-bold">All the best from everyone at Soma! 🙏</p>
      </section>
    </div>
  );
}
