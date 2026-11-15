import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { AccuracyBars } from "@/components/charts/accuracy-bars";
import { AccuracyTrend } from "@/components/charts/accuracy-trend";
import { QuickPractice } from "@/components/student/practice-builder";
import { ReadinessCard } from "@/components/student/readiness-card";
import { Alert } from "@/components/ui/alert";
import { requireUser } from "@/lib/auth/dal";
import { accuracy, readiness, recommendations } from "@/lib/analytics";
import { loadLearningData } from "@/lib/analytics-server";
import { formatDuration } from "@/lib/exam/logic";

export const metadata: Metadata = { title: "Performance" };

export default async function AnalyticsPage() {
  await requireUser("/dashboard/analytics");
  const { performance: p, options, error } = await loadLearningData();
  if (error || !p) return <Alert tone="danger">Your performance could not be loaded. Please try again.</Alert>;

  const acc = accuracy(p.totals.correct, p.totals.answered);
  const recs = recommendations(p, options, 6);
  const trend = p.trend.map((t) => ({ id: t.id, label: t.title, date: t.submitted_at, accuracy: accuracy(t.correct, t.answered) ?? 0, answered: t.answered }));
  const weakTopics = [...p.by_topic]
    .filter((t) => t.answered >= 3)
    .sort((a, b) => (accuracy(a.correct, a.answered) ?? 0) - (accuracy(b.correct, b.answered) ?? 0))
    .slice(0, 8);

  if (p.totals.answered === 0 && p.totals.written_answers === 0) {
    return (
      <>
        <PageTitle title="Performance" description="Your accuracy, timing and weak areas across every examination and practice set." />
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">No results yet</p>
          <p className="mx-auto mt-2 max-w-md text-sm text-muted-foreground">Complete a practice set or an examination and your performance will appear here.</p>
          <div className="mt-4 flex justify-center gap-3">
            <Link href="/dashboard/practice" className="inline-flex h-10 items-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground">Start practice</Link>
            <Link href="/dashboard/exams" className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium">Examinations</Link>
          </div>
        </div>
      </>
    );
  }

  return (
    <>
      <PageTitle title="Performance" description="Your accuracy, timing and weak areas across every examination and practice set." />
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
        <ReadinessCard stage="PE" r={readiness("PE", p)} />
        <ReadinessCard stage="ME" r={readiness("ME", p)} />
      </div>

      {recs.length ? (
        <section className="mt-8 rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">What to practise next</h2>
          <ul className="mt-3 divide-y divide-border">
            {recs.map((r, i) => (
              <li key={i} className="flex flex-col gap-2 py-3 sm:flex-row sm:items-center">
                <div className="flex-1">
                  <p className="text-sm font-medium text-ink">{r.title}</p>
                  <p className="text-xs text-muted-foreground">{r.detail}</p>
                </div>
                <QuickPractice stage={r.stage} subjectId={r.subjectId} topicId={r.topicId} mode={r.kind === "mistakes" ? "mistakes" : "mixed"} label={r.kind === "mistakes" ? "Retry" : "Practise 10"} />
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
                label: `${s.stage} · ${s.name}`,
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
      {p.totals.written_answers ? (
        <p className="mt-6 text-sm text-muted-foreground">
          You have written {p.totals.written_answers} ME answer{p.totals.written_answers === 1 ? "" : "s"}. Written answers are not included in accuracy; compare them with the model answers in your results.
        </p>
      ) : null}
    </>
  );
}
