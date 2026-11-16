import type { Metadata } from "next";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { CoachCard } from "@/components/exam/coach-card";
import { MockCta } from "@/components/exam/mock-cta";
import { coach } from "@/lib/exam/coach";
import { ResultHero, SectionBars } from "@/components/exam/result-hero";
import { ResultReview } from "@/components/exam/result-review";
import { requireUser } from "@/lib/auth/dal";
import { breakdownBy, formatDuration, revisionSuggestions } from "@/lib/exam/logic";
import type { AttemptResult } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { formatDate, requestTimeMs } from "@/lib/utils";
import { Badge } from "@/components/ui/badge";
import { ensureWrittenAnswerAction } from "@/app/dashboard/written/actions";
import type { ResultQuestion } from "@/lib/exam/types";

export const metadata: Metadata = { title: "Examination results" };

export default async function ResultsPage({ params }: PageProps<"/dashboard/results/[attemptId]">) {
  const { attemptId } = await params;
  await requireUser(`/dashboard/results/${attemptId}`);
  if (!/^[0-9a-f-]{36}$/i.test(attemptId)) notFound();
  const supabase = await createClient();
  const [{ data, error }, { data: cut }] = await Promise.all([
    supabase.rpc("get_attempt_result", { _attempt_id: attemptId }),
    supabase.from("pe_cutoff_history").select("year, value, unit").order("year", { ascending: false }).limit(1).maybeSingle(),
  ]);
  const { data: peAccess } = await supabase.rpc("has_stage_access", { _stage: "PE" });
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
      {mcqs.length > 0 ? (
        <div className="mt-3">
          <ResultHero
            title={r.exam.title} score={Number(a.score)} max={mcqMax} correct={a.correct_count} incorrect={a.incorrect_count}
            unanswered={mcqs.filter((q) => !q.answer?.selected_option_id).length}
            time={`${formatDuration(a.time_spent_seconds)} of ${r.exam.duration_minutes} min`}
            stage={r.exam.stage as "PE" | "ME"}
            cutoff={cut ? { year: cut.year, value: Number(cut.value), unit: cut.unit as "percent" | "marks" } : null}
          />
          <p className="mt-2 text-xs text-muted-foreground">
            {a.status === "auto_submitted" ? "Submitted automatically when time ran out" : "Submitted"} on {formatDate(a.submitted_at)}
            {accuracy !== null ? ` · ${accuracy}% of the questions you answered were correct` : ""}
          </p>
          <div className="mt-6">
            <CoachCard advice={coach({
              sections: subjects, total: mcqs.length, correct: a.correct_count, wrong: a.incorrect_count,
              skipped: mcqs.filter((q) => !q.answer?.selected_option_id).length,
              timeUsedSeconds: a.time_spent_seconds ?? 0, timeAllowedMinutes: r.exam.duration_minutes,
              negativeMarking: Number(r.exam.negative_mark_per_wrong), autoSubmitted: a.status === "auto_submitted",
            })} />
          </div>
        </div>
      ) : (
        <>
          <h1 className="mt-3 text-2xl font-extrabold tracking-tight text-ink">{r.exam.title}</h1>
          <p className="mt-1 text-sm text-muted-foreground">Submitted on {formatDate(a.submitted_at)} · time used {formatDuration(a.time_spent_seconds)}</p>
        </>
      )}
      {written.length > 0 ? <WrittenPanel attemptId={a.id} written={written} closedAt={a.submitted_at ?? a.deadline_at} deadline={a.deadline_at} /> : null}
      {r.exam.negative_mark_per_wrong > 0 && mcqs.length > 0 ? (
        <p className="mt-3 text-xs text-muted-foreground">This practice examination deducted {Number(r.exam.negative_mark_per_wrong)} mark per wrong answer.</p>
      ) : null}

      {subjects.length > 0 ? (
        <section className="mt-10">
          <h2 className="text-lg font-bold">Score by section</h2>
          <div className="mt-4">
            <SectionBars rows={subjects} />
          </div>
        </section>
      ) : null}

      <section className="mt-10 grid gap-4 md:grid-cols-2">
        <div className="rounded-2xl bg-white p-5 shadow-sm ring-1 ring-border">
          <h2 className="font-bold text-ink">What to revise next</h2>
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
        <div className="rounded-2xl bg-white p-5 shadow-sm ring-1 ring-border">
          <h2 className="font-bold text-ink">Your time</h2>
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

      {r.exam.stage === "PE" && (r.exam.kind === "mock" || r.exam.kind === "sample" || r.exam.kind === "historical") ? (
        <div className="mt-10"><MockCta premium={Boolean(peAccess)} /></div>
      ) : null}
      <div className="mt-6 flex flex-col gap-3 border-t border-border pt-6 sm:flex-row">
        {r.exam.stage === "PE" && !peAccess && r.exam.kind !== "practice" ? null : <Link href={`/dashboard/exams/${r.exam.slug}`} className="inline-flex h-12 items-center justify-center rounded-2xl bg-primary px-5 text-base font-bold text-primary-foreground hover:bg-primary-hover">Take this test again</Link>}
        <Link href="/dashboard" className="inline-flex h-12 items-center justify-center rounded-2xl bg-white px-5 text-base font-semibold shadow-sm ring-1 ring-border hover:bg-muted">Back to home</Link>
      </div>
    </div>
  );
}

async function WrittenPanel({ attemptId, written, closedAt, deadline }: { attemptId: string; written: ResultQuestion[]; closedAt: string; deadline: string }) {
  const db = await createClient();
  const ids = written.map((q) => q.answer?.id).filter(Boolean) as string[];
  const [{ data: rows }, { data: cfg }] = await Promise.all([
    ids.length
      ? db.from("attempt_answers").select("id, answer_mode, transcript_status, answer_pages(count), evaluations(status, score, max_score, scored, method)").in("id", ids)
      : Promise.resolve({ data: [] as never[] }),
    db.rpc("evaluation_config"),
  ]);
  const info = new Map(((rows ?? []) as { id: string; answer_mode: string; transcript_status: string | null; answer_pages: { count: number }[]; evaluations: { status: string; score: number | null; max_score: number | null; scored: boolean | null; method: string }[] }[]).map((r) => [r.id, r]));
  const windowMin = Number((cfg as { upload_window_minutes?: number } | null)?.upload_window_minutes ?? 15);
  const windowEnds = Math.min(new Date(closedAt).getTime(), new Date(deadline).getTime()) + windowMin * 60 * 1000;
  const windowOpen = requestTimeMs() <= windowEnds;
  return (
    <section className="mt-6 rounded-xl border border-border p-5" aria-labelledby="written-h">
      <h2 id="written-h" className="font-semibold text-ink">Written answers — AI-assisted evaluation</h2>
      <p className="mt-1 text-sm text-muted-foreground">
        Open each answer to check handwritten text and get indicative AI feedback. AI marks are not official RCSC marks.
        {windowOpen ? ` You can still add handwritten answer-sheet photos for about ${Math.max(1, Math.round((windowEnds - requestTimeMs()) / 60000))} minutes.` : ""}
      </p>
      <ul className="mt-3 divide-y divide-border">
        {written.map((q) => {
          const r = q.answer?.id ? info.get(q.answer.id) : undefined;
          const ev = r?.evaluations.find((e) => e.method === "ai_feedback" && e.status !== "failed");
          const pages = r?.answer_pages?.[0]?.count ?? 0;
          const hasContent = Boolean(q.answer?.text_answer?.trim()) || pages > 0;
          const label = ev?.status === "completed" ? (ev.scored && ev.score !== null ? `${Number(ev.score)}/${Number(ev.max_score)} indicative` : "Feedback ready")
            : ev ? "Evaluating" : r?.answer_mode === "handwritten" ? (r.transcript_status === "confirmed" ? "Ready to evaluate" : `${pages} page${pages === 1 ? "" : "s"} — check text`) : hasContent ? "Ready to evaluate" : "Not answered";
          return (
            <li key={q.exam_question_id} className="flex flex-col gap-2 py-3 sm:flex-row sm:items-center">
              <span className="flex-1 text-sm"><span className="font-medium text-ink">Question {q.number}</span> <span className="text-muted-foreground">· {Number(q.marks)} marks</span></span>
              <Badge tone={ev?.status === "completed" ? "green" : hasContent ? "warning" : "neutral"}>{label}</Badge>
              {q.answer?.id && hasContent ? (
                <Link href={`/dashboard/written/${q.answer.id}`} className="text-sm font-medium text-primary hover:underline">Open</Link>
              ) : windowOpen ? (
                <form action={ensureWrittenAnswerAction.bind(null, attemptId, q.exam_question_id)}>
                  <button type="submit" className="text-sm font-medium text-primary hover:underline">Upload handwritten pages</button>
                </form>
              ) : null}
            </li>
          );
        })}
      </ul>
    </section>
  );
}
