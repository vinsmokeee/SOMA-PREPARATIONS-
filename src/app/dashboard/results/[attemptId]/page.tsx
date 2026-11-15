import type { Metadata } from "next";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { ResultReview } from "@/components/exam/result-review";
import { Alert } from "@/components/ui/alert";
import { Table, TBody, TD, TH, THead, TR } from "@/components/ui/table";
import { requireUser } from "@/lib/auth/dal";
import { breakdownBy, formatDuration, revisionSuggestions } from "@/lib/exam/logic";
import type { AttemptResult } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Examination results" };

export default async function ResultsPage({ params }: PageProps<"/dashboard/results/[attemptId]">) {
  const { attemptId } = await params;
  await requireUser(`/dashboard/results/${attemptId}`);
  if (!/^[0-9a-f-]{36}$/i.test(attemptId)) notFound();
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("get_attempt_result", { _attempt_id: attemptId });
  if (error?.message?.includes("ATTEMPT_IN_PROGRESS")) redirect(`/exam/${attemptId}`);
  if (error || !data) notFound();
  const r = data as AttemptResult;
  const a = r.attempt;
  const mcqs = r.questions.filter((q) => q.type === "mcq");
  const written = r.questions.filter((q) => q.type !== "mcq");
  const mcqMax = mcqs.reduce((s, q) => s + Number(q.marks), 0);
  const attempted = a.correct_count + a.incorrect_count;
  const accuracy = attempted > 0 ? Math.round((a.correct_count / attempted) * 100) : null;
  const subjects = breakdownBy(r.questions, "subject");
  const topics = breakdownBy(r.questions, "topic").filter((t) => t.name !== "No topic");
  const revise = revisionSuggestions(topics.length ? topics : subjects);
  const slowest = [...r.questions]
    .filter((q) => (q.answer?.time_spent_seconds ?? 0) > 0)
    .sort((x, y) => (y.answer?.time_spent_seconds ?? 0) - (x.answer?.time_spent_seconds ?? 0))
    .slice(0, 3);
  const avg = r.questions.length ? Math.round((a.time_spent_seconds ?? 0) / r.questions.length) : 0;

  return (
    <div className="mx-auto max-w-4xl">
      <Link href="/dashboard/history" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Examination history
      </Link>
      <h1 className="mt-3 font-serif text-3xl font-semibold tracking-tight">{r.exam.title}</h1>
      <p className="mt-1 text-sm text-muted-foreground">
        {a.status === "auto_submitted" ? "Submitted automatically when time ran out" : "Submitted"} on {formatDate(a.submitted_at)} ·
        time used {formatDuration(a.time_spent_seconds)} of {r.exam.duration_minutes} min
      </p>

      {mcqs.length > 0 ? (
        <dl className="mt-6 grid grid-cols-2 gap-3 md:grid-cols-5">
          <Stat label="Score" value={`${Number(a.score)} / ${mcqMax}`} strong />
          <Stat label="Accuracy" value={accuracy === null ? "—" : `${accuracy}%`} />
          <Stat label="Correct" value={String(a.correct_count)} />
          <Stat label="Incorrect" value={String(a.incorrect_count)} />
          <Stat label="Unanswered" value={String(mcqs.filter((q) => !q.answer?.selected_option_id).length)} />
        </dl>
      ) : null}
      {written.length > 0 ? (
        <Alert tone="info" className="mt-6" title={`${written.length} written ${written.length === 1 ? "answer" : "answers"}`}>
          Written answers are not scored automatically. Review them against the model answers and rubrics below. Expert
          evaluation of written answers will be offered where available.
        </Alert>
      ) : null}
      {r.exam.negative_mark_per_wrong > 0 && mcqs.length > 0 ? (
        <p className="mt-3 text-xs text-muted-foreground">This practice examination deducted {Number(r.exam.negative_mark_per_wrong)} mark per wrong answer.</p>
      ) : null}

      {subjects.length > 0 ? (
        <section className="mt-10">
          <h2 className="font-serif text-2xl font-semibold">Performance by subject</h2>
          <div className="mt-4">
            <Table>
              <THead><TR><TH>Subject</TH><TH className="text-right">Correct</TH><TH className="text-right">Accuracy</TH><TH className="hidden text-right sm:table-cell">Time</TH></TR></THead>
              <TBody>
                {subjects.map((s) => (
                  <TR key={s.name}>
                    <TD className="text-ink">{s.name}</TD>
                    <TD className="text-right tabular-nums">{s.correct} / {s.total}</TD>
                    <TD className="text-right tabular-nums">
                      {s.accuracy === null ? "—" : (
                        <span className="inline-flex items-center gap-2">
                          <span className="hidden h-1.5 w-16 overflow-hidden rounded-full bg-muted sm:inline-block"><span className="block h-full bg-primary" style={{ width: `${s.accuracy}%` }} /></span>
                          {s.accuracy}%
                        </span>
                      )}
                    </TD>
                    <TD className="hidden text-right tabular-nums sm:table-cell">{formatDuration(s.timeSeconds)}</TD>
                  </TR>
                ))}
              </TBody>
            </Table>
          </div>
        </section>
      ) : null}

      <section className="mt-10 grid gap-4 md:grid-cols-2">
        <div className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Suggested revision</h2>
          {revise.length === 0 ? (
            <p className="mt-2 text-sm text-muted-foreground">{mcqs.length ? "No weak areas stood out in this attempt. Keep practising with full-length examinations." : "Compare your written answers with the rubrics to find areas to improve."}</p>
          ) : (
            <ul className="mt-2 space-y-1.5 text-sm">
              {revise.map((t) => (
                <li key={t.name} className="flex justify-between gap-3">
                  <span className="text-ink">{t.name}</span>
                  <span className="tabular-nums text-muted-foreground">{t.accuracy === null ? "mostly unanswered" : `${t.accuracy}% accuracy`}</span>
                </li>
              ))}
            </ul>
          )}
          <p className="mt-3 text-xs text-muted-foreground">A Soma estimate from this attempt only — not an official assessment.</p>
        </div>
        <div className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Time analysis</h2>
          <p className="mt-2 text-sm text-foreground">Average {formatDuration(avg)} per question.</p>
          {slowest.length ? (
            <ul className="mt-2 space-y-1.5 text-sm">
              {slowest.map((q) => (
                <li key={q.exam_question_id} className="flex justify-between gap-3">
                  <span className="text-muted-foreground">Question {q.number}{q.subject ? ` · ${q.subject}` : ""}</span>
                  <span className="tabular-nums text-ink">{formatDuration(q.answer?.time_spent_seconds)}</span>
                </li>
              ))}
            </ul>
          ) : null}
        </div>
      </section>

      <ResultReview questions={r.questions} />

      <div className="mt-10 flex flex-col gap-3 border-t border-border pt-6 sm:flex-row">
        <Link href={`/dashboard/exams/${r.exam.slug}`} className="inline-flex h-11 items-center justify-center rounded-md bg-primary px-5 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">Take this examination again</Link>
        <Link href="/dashboard/exams" className="inline-flex h-11 items-center justify-center rounded-md border border-border-strong px-5 text-sm font-medium hover:bg-muted">More examinations</Link>
      </div>
    </div>
  );
}

function Stat({ label, value, strong }: { label: string; value: string; strong?: boolean }) {
  return (
    <div className="rounded-xl border border-border p-4">
      <dt className="text-xs text-muted-foreground">{label}</dt>
      <dd className={strong ? "mt-1 text-2xl font-semibold tabular-nums text-primary" : "mt-1 text-2xl font-semibold tabular-nums text-ink"}>{value}</dd>
    </div>
  );
}
