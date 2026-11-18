import Link from "next/link";
import { CaPracticeForm, QotdButton } from "@/components/student/ca-buttons";

/** Current affairs: the coloured practice box at the top of the News page. */
export function CaPracticeBox({ question, paid, assessments, done = null }: {
  question: { stem: string } | null;
  /** Today's Question of the Day already answered: show that, not "Answer" again. */
  done?: { correct: boolean; attemptId: string } | null;
  paid: boolean;
  assessments: { id: string; slug: string; title: string; question_count: number }[];
}) {
  return (
  <section aria-labelledby="ca-practice" className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-violet-500 via-purple-600 to-purple-900 p-5 text-white shadow-xl sm:p-7">
    <span className="absolute -right-10 -top-10 size-40 rounded-full bg-white/10" aria-hidden />
    <p className="relative text-sm font-semibold uppercase tracking-wider text-white/80">Practice</p>
    <h2 id="ca-practice" className="relative mt-1 text-2xl font-extrabold text-white">Practise with the news</h2>
    <p className="relative mt-1 text-sm text-white/90">Read the news below, then test yourself here. Current affairs come up in the exam, so a few minutes every day really helps.</p>

    <div id="question-of-the-day" className="relative mt-4 scroll-mt-24 rounded-2xl bg-white p-4 text-ink">
      <p className="text-sm font-bold uppercase tracking-wide text-purple-700">Question of the Day</p>
      {question ? (
        <>
          <p className="mt-1 leading-relaxed">{question.stem}</p>
          {done ? (
            <div className={done.correct ? "mt-3 rounded-xl bg-success-soft p-3" : "mt-3 rounded-xl bg-amber-100 p-3"}>
              <p className="font-bold text-ink">{done.correct ? "✓ You answered today’s question correctly." : "You answered today’s question. Not quite right this time."}</p>
              <Link href={`/dashboard/results/${done.attemptId}`} className="mt-1 inline-block text-sm font-semibold text-purple-700 underline underline-offset-2">See your answer and the explanation</Link>
              <p className="mt-1 text-sm text-muted-foreground">A new question comes tomorrow.</p>
            </div>
          ) : <div className="mt-3"><QotdButton /></div>}
        </>
      ) : <p className="mt-1 text-sm text-muted-foreground">Today’s question appears once today’s stories are verified.</p>}
    </div>

    <div className="relative mt-3 rounded-2xl bg-white p-4 text-ink">
      <p className="text-sm font-bold uppercase tracking-wide text-purple-700">Practise current affairs</p>
      <p className="mt-1 text-sm text-muted-foreground">Questions chosen for you: this week’s important stories first, then your weaker areas.</p>
      <div className="mt-3"><CaPracticeForm locked={!paid} /></div>
    </div>

    <div className="relative mt-3 rounded-2xl bg-white/15 p-4">
      <p className="text-sm font-bold">Weekly Challenge and Monthly Assessment</p>
      {assessments.length ? (
        <ul className="mt-2 space-y-2 text-sm">{assessments.map((e) => <li key={e.id}><Link href={`/dashboard/exams/${e.slug}`} className="font-semibold underline underline-offset-2">{e.title}</Link> <span className="text-white/80">· {e.question_count} questions</span></li>)}</ul>
      ) : <p className="mt-1 text-sm text-white/85">The first Weekly Challenge appears after a full week of verified stories.</p>}
    </div>
  </section>
  );
}
