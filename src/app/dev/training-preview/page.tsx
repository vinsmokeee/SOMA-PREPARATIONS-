import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { TodayPlan } from "@/components/training/today-plan";
import type { TrainingData } from "@/lib/training/model";

export const metadata: Metadata = { title: "Training preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of the daily plan (SOMA_PUBLIC_DATA=fixture only). */
export default async function TrainingPreviewPage() {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const id = (n: number) => `4c000000-0000-4000-8000-00000000000${n}`;
  const data: TrainingData = {
    today: "2026-11-24",
    plan: { id: id(0), cycle_no: 1, cycle_day: 7, cycle_days: 30, phase: "foundation", stage: "PE", focus: null },
    items: [
      { id: id(1), kind: "revision", title: "Revise past mistakes", detail: "5 questions you got wrong before, due for revision today.", minutes: 5, questions: 5, status: "done", attempt_id: id(9), score: 4, max_score: 5, attempt_open: false },
      { id: id(2), kind: "practice", title: "Daily practice: mixed", detail: "Baseline practice across all sections.", minutes: 15, questions: 15, status: "started", attempt_id: id(8), score: null, max_score: null, attempt_open: true },
      { id: id(3), kind: "ca", title: "Current affairs: Question of the Day", detail: "One question on today's news. Read the story after you answer.", minutes: 2, questions: 0, status: "pending", attempt_id: null, score: null, max_score: null, attempt_open: null },
      { id: id(4), kind: "weekly_test", title: "Weekly test", detail: "25 mixed questions across all sections, timed.", minutes: 30, questions: 25, status: "skipped", attempt_id: null, score: null, max_score: null, attempt_open: null },
    ],
    stats: { current_streak: 6, best_streak: 6, rest_tokens: 0, active_days: 6, mastered: 0, active_today: true },
    badges: [], revision_due: 0, revision_total: 12, week: { goal: 100, answered: 40, days_active: 3 },
    bests: { weekly_test: null, monthly_mock: null, most_in_a_day: 20 }, subjects: [], exam_date: null,
  };
  return (
    <main id="main" className="mx-auto max-w-3xl p-4 sm:p-6">
      <h1 className="mb-4 font-serif text-2xl font-semibold">Today&apos;s training (preview)</h1>
      <TodayPlan data={data} compact={false} />
    </main>
  );
}
