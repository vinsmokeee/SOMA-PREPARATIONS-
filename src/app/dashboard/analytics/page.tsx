import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { AccuracyBars } from "@/components/charts/accuracy-bars";
import { AccuracyTrend } from "@/components/charts/accuracy-trend";
import { QuickPractice } from "@/components/student/practice-builder";
import { ReadinessCard } from "@/components/student/readiness-card";
import { Alert } from "@/components/ui/alert";
import { requireUser } from "@/lib/auth/dal";
import { accuracy, forStage, readiness, recommendations } from "@/lib/analytics";
import { MeOverall } from "@/components/student/paper-home";
import { loadMeProgress } from "@/lib/student/area";
import { loadExamState } from "@/lib/student/exam-state";
import { loadLearningData } from "@/lib/analytics-server";
import { formatDuration } from "@/lib/exam/logic";
import { createClient } from "@/lib/supabase/server";
import { writtenAdvice, type WrittenPerformance } from "@/lib/written/insights";

export const metadata: Metadata = { title: "Performance" };

/** My scores for one exam: the one the student is preparing for, or ?stage=PE|ME (founder, 20 Nov 2026). */
export default async function AnalyticsPage({ searchParams }: PageProps<"/dashboard/analytics">) {
  const user = await requireUser("/dashboard/analytics");
  const sp = await searchParams;
  const db = await createClient();
  const stage: "PE" | "ME" = sp.stage === "PE" || sp.stage === "ME" ? sp.stage : ((await loadExamState(user.id)).lastStage ?? "PE");
  const [{ performance: all, options, error }, written, { data: peAccess }, mePapers] = await Promise.all([
    loadLearningData(), stage === "ME" ? loadWritten() : Promise.resolve(null), db.rpc("has_stage_access", { _stage: "PE" }),
    stage === "ME" ? loadMeProgress() : Promise.resolve([]),
  ]);
  if (error || !all) return <Alert tone="danger">Your performance could not be loaded. Please try again.</Alert>;
  const p = forStage(all, stage);
  const title = `${stage} scores`;
  const description = stage === "ME" ? "Your Main Examination results: papers, written answers and multiple-choice questions." : "Your Preliminary Examination results: accuracy, timing and weak areas.";

  const acc = accuracy(p.totals.correct, p.totals.answered);
  const recs = recommendations(p, options, 6).filter((r) => r.stage === stage);
  const trend = p.trend.map((t) => ({ id: t.id, label: t.title, date: t.submitted_at, accuracy: accuracy(t.correct, t.answered) ?? 0, answered: t.answered }));
  const weakTopics = [...p.by_topic]
    .filter((t) => t.answered >= 3)
    .sort((a, b) => (accuracy(a.correct, a.answered) ?? 0) - (accuracy(b.correct, b.answered) ?? 0))
    .slice(0, 8);

  if (p.totals.answered === 0 && p.totals.written_answers === 0 && !written?.evaluated && !mePapers.some((x) => x.marked)) {
    return (
      <>
        <PageTitle title={title} description={description} />
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">No results yet</p>
          <p className="mx-auto mt-2 max-w-md text-sm text-muted-foreground">Complete a practice set or an examination and your performance will appear here.</p>
          <div className="mt-4 flex justify-center gap-3">
            {stage === "ME" ? (
              <Link href="/dashboard/me" className="inline-flex h-10 items-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground">Go to your papers</Link>
            ) : (
              <>
                <Link href="/dashboard/practice" className="inline-flex h-10 items-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground">Start practice</Link>
                <Link href="/dashboard/exams" className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium">Examinations</Link>
              </>
            )}
          </div>
        </div>
      </>
    );
  }

  return (
    <>
      <PageTitle title={title} description={description} />
      {stage === "ME" && mePapers.length ? <div className="mb-8"><MeOverall papers={mePapers} /></div> : null}
      <dl className="grid grid-cols-2 gap-3 md:grid-cols-4">
        {[
          ["Questions answered", p.totals.answered.toLocaleString("en")],
          ["Accuracy", acc === null ? "—" : `${acc}%`],
          ["Examinations & sets", String(p.totals.attempts)],
          ["Time practising", formatDuration(p.totals.time_seconds)],
        ].map(([k, v]) => (
          <div key={k} className="rounded-xl border border-border p-4">
            <dt className="text-xs text-muted-foreground">{k}</dt>
            <dd className="mt-1 text-2xl font-semibold tabular-nums text-ink">{v}</dd>
          </div>
        ))}
      </dl>

      <div className="mt-8 grid gap-4 md:grid-cols-2">
        <ReadinessCard stage={stage} r={readiness(stage, p)} />
      </div>

      {recs.length ? (
        <section className="mt-8 rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">What to practise next</h2>
          <p className="text-sm text-muted-foreground">Your weakest areas, worst first.</p>
          {!peAccess ? (
            <Link href="/dashboard/pe?plans=1" className="mt-3 flex items-center gap-2 rounded-xl bg-yellow-100 p-3 text-sm text-yellow-950 ring-1 ring-yellow-300">
              <span><span className="font-bold">Premium:</span> practise each weak area in one tap with 10 fresh questions.</span>
              <span aria-hidden className="ml-auto">→</span>
            </Link>
          ) : null}
          <ul className="mt-3 divide-y divide-border">
            {recs.map((r, i) => (
              <li key={i} className="flex flex-col gap-2 py-3 sm:flex-row sm:items-center">
                <div className="flex-1">
                  <p className="text-sm font-medium text-ink">{r.title}</p>
                  <p className="text-xs text-muted-foreground">{r.detail}</p>
                </div>
                {/* Free PE accounts have one test a day, so the one-tap practice is a Premium feature (founder, 20 Nov 2026). */}
                {peAccess || r.stage !== "PE" ? <QuickPractice stage={r.stage} subjectId={r.subjectId} topicId={r.topicId} mode={r.kind === "mistakes" ? "mistakes" : "mixed"} label={r.kind === "mistakes" ? "Retry" : "Practise 10"} /> : null}
              </li>
            ))}
          </ul>
        </section>
      ) : null}

      {trend.length > 1 ? (
        <section className="mt-8 rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Accuracy over time</h2>
          <p className="text-sm text-muted-foreground">Each point is one examination or practice set (objective questions).</p>
          <div className="mt-4"><AccuracyTrend data={trend} /></div>
        </section>
      ) : null}

      <div className="mt-8 grid gap-6 lg:grid-cols-2">
        <section className="rounded-xl border border-border p-5">
          <h2 className="mb-4 font-semibold text-ink">By subject</h2>
          {p.by_subject.length ? (
            <AccuracyBars
              data={p.by_subject.map((s) => ({
                id: s.id,
                label: s.name,
                accuracy: accuracy(s.correct, s.answered),
                detail: `${s.correct}/${s.answered} · ${formatDuration(s.avg_seconds)} each`,
              }))}
            />
          ) : <p className="text-sm text-muted-foreground">No subject data yet.</p>}
        </section>
        <section className="rounded-xl border border-border p-5">
          <h2 className="mb-4 font-semibold text-ink">Weakest topics</h2>
          {weakTopics.length ? (
            <AccuracyBars data={weakTopics.map((t) => ({ id: t.id, label: t.name, accuracy: accuracy(t.correct, t.answered), detail: `${t.subject} · ${t.correct}/${t.answered}` }))} />
          ) : <p className="text-sm text-muted-foreground">Topic analysis appears once you have answered at least 3 questions in a topic.</p>}
        </section>
      </div>
      {stage === "ME" ? <WrittenSection w={written} fallbackCount={p.totals.written_answers} /> : null}
    </>
  );
}

async function loadWritten() {
  const db = await createClient();
  const { data } = await db.rpc("my_written_performance");
  return (data ?? null) as WrittenPerformance | null;
}

function WrittenSection({ w, fallbackCount }: { w: WrittenPerformance | null; fallbackCount: number }) {
  if (!w || w.evaluated === 0) {
    return fallbackCount ? (
      <p className="mt-6 text-sm text-muted-foreground">
        You have written {fallbackCount} ME answer{fallbackCount === 1 ? "" : "s"}. Get AI feedback on them from <Link href="/dashboard/written/history" className="font-medium text-primary hover:underline">My written answers</Link> to see written-answer analytics here.
      </p>
    ) : null;
  }
  const advice = writtenAdvice(w);
  return (
    <section className="mt-8 rounded-xl border border-border p-5" aria-labelledby="written-perf">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h2 id="written-perf" className="font-semibold text-ink">Written answers (ME)</h2>
        <p className="text-sm text-muted-foreground">{w.evaluated} evaluated{w.avg_pct !== null ? ` · average indicative score ${w.avg_pct}%` : ""}</p>
      </div>
      {advice.length ? (
        <ul className="mt-3 space-y-2">
          {advice.map((a) => <li key={a.title} className="rounded-lg bg-muted/50 p-3 text-sm"><p className="font-medium text-ink">{a.title}</p><p className="text-muted-foreground">{a.detail}</p></li>)}
        </ul>
      ) : null}
      <div className="mt-5 grid gap-6 lg:grid-cols-2">
        <div>
          <h3 className="mb-3 text-sm font-semibold text-ink">By subject</h3>
          <AccuracyBars data={w.by_subject.map((s, i) => ({ id: s.subject_id ?? `none-${i}`, label: s.subject ?? "No subject", accuracy: s.avg_pct, detail: `${s.answers} answer${s.answers === 1 ? "" : "s"}` }))} />
        </div>
        <div>
          <h3 className="mb-3 text-sm font-semibold text-ink">By paper</h3>
          <AccuracyBars data={w.by_paper.map((s, i) => ({ id: s.paper_id ?? `none-${i}`, label: s.paper ?? "Other", accuracy: s.avg_pct, detail: `${s.answers} answer${s.answers === 1 ? "" : "s"}` }))} />
        </div>
      </div>
      <p className="mt-4 text-xs text-muted-foreground">Percentages are indicative AI scores on Soma practice questions, not RCSC marks. <Link href="/dashboard/me" className="font-medium text-primary hover:underline">Practise from your papers</Link></p>
    </section>
  );
}
