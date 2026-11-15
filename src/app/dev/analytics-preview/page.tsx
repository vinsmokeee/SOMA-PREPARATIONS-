import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { AccuracyBars } from "@/components/charts/accuracy-bars";
import { AccuracyTrend } from "@/components/charts/accuracy-trend";
import { ReadinessCard } from "@/components/student/readiness-card";
import { accuracy, readiness, type Performance } from "@/lib/analytics";

export const metadata: Metadata = { title: "Analytics preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of analytics components with fixture data (SOMA_PUBLIC_DATA=fixture only). */
export default async function AnalyticsPreview() {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const subjects = [
    ["English communication skills", 48, 39],
    ["Logic, analytical ability and problem-solving", 40, 22],
    ["Data interpretation ability", 36, 25],
    ["General awareness and current affairs", 30, 13],
  ] as const;
  const p: Performance = {
    totals: { attempts: 9, answered: 154, correct: 99, time_seconds: 9400, written_answers: 2, distinct_questions: 120 },
    by_subject: subjects.map(([name, a, c], i) => ({ id: String(i), name, stage: "PE", answered: a, correct: c, avg_seconds: 45 + i * 7, last_at: null })),
    by_topic: [
      { id: "t1", name: "Percentages", subject_id: "2", subject: "Data interpretation", stage: "PE", answered: 12, correct: 5 },
      { id: "t2", name: "Syllogisms", subject_id: "1", subject: "Logic", stage: "PE", answered: 10, correct: 4 },
      { id: "t3", name: "Constitution", subject_id: "3", subject: "General awareness", stage: "PE", answered: 9, correct: 5 },
    ],
    trend: [42, 48, 55, 51, 60, 58, 66, 63, 70].map((acc, i) => ({ id: String(i), title: i % 3 === 0 ? "PE sample examination 1" : "Practice: Mixed PE practice", kind: "practice", stage: "PE", submitted_at: new Date(Date.UTC(2026, 10, 1 + i * 2)).toISOString(), answered: 20, correct: Math.round((acc / 100) * 20) })),
    coverage: [{ stage: "PE", practised: 4, total: 4 }, { stage: "ME", practised: 0, total: 3 }],
    mistakes: 23,
  };
  return (
    <main id="main" className="mx-auto max-w-5xl space-y-8 px-4 py-8">
      <h1 className="font-serif text-2xl font-semibold">Analytics preview</h1>
      <div className="grid gap-4 md:grid-cols-2">
        <ReadinessCard stage="PE" r={readiness("PE", p)} />
        <ReadinessCard stage="ME" r={readiness("ME", p)} />
      </div>
      <section className="rounded-xl border border-border p-5">
        <h2 className="font-semibold">Accuracy over time</h2>
        <div className="mt-4"><AccuracyTrend data={p.trend.map((t) => ({ id: t.id, label: t.title, date: t.submitted_at, accuracy: accuracy(t.correct, t.answered) ?? 0, answered: t.answered }))} /></div>
      </section>
      <section className="rounded-xl border border-border p-5">
        <h2 className="mb-4 font-semibold">By subject</h2>
        <AccuracyBars data={p.by_subject.map((s) => ({ id: s.id, label: s.name, accuracy: accuracy(s.correct, s.answered), detail: `${s.correct}/${s.answered}` }))} />
      </section>
    </main>
  );
}
