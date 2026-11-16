import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { AppShell } from "@/components/app/app-shell";
import { HomeView, type HomeData } from "@/components/student/home-view";
import type { TrainingData } from "@/lib/training/model";

export const metadata: Metadata = { title: "Home preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of the student home screen (SOMA_PUBLIC_DATA=fixture only). */
export default async function HomePreviewPage({ searchParams }: PageProps<"/dev/home-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const sp = await searchParams;
  const allDone = sp.done === "1";
  const id = (n: number) => `4d000000-0000-4000-8000-00000000000${n}`;
  const training: TrainingData = {
    today: "2026-11-24",
    plan: { id: id(0), cycle_no: 1, cycle_day: 6, cycle_days: 30, phase: "foundation", stage: "PE", focus: null },
    items: [
      { id: id(1), kind: "revision", title: "Revise past mistakes", detail: null, minutes: 5, questions: 5, status: "done", attempt_id: id(9), score: 4, max_score: 5, attempt_open: false },
      { id: id(2), kind: "practice", title: "Daily practice: mixed", detail: null, minutes: 15, questions: 15, status: allDone ? "done" : "pending", attempt_id: null, score: allDone ? 12 : null, max_score: allDone ? 15 : null, attempt_open: null },
      { id: id(3), kind: "ca", title: "Question of the Day", detail: null, minutes: 2, questions: 0, status: allDone ? "done" : "pending", attempt_id: null, score: allDone ? 1 : null, max_score: allDone ? 1 : null, attempt_open: null },
      { id: id(4), kind: "weak_topic", title: "Strengthen: Percentages", detail: null, minutes: 5, questions: 5, status: allDone ? "done" : "pending", attempt_id: null, score: allDone ? 3 : null, max_score: allDone ? 5 : null, attempt_open: null },
    ],
    stats: { current_streak: 5, best_streak: 5, rest_tokens: 0, active_days: 5, mastered: 2, active_today: true },
    badges: [], revision_due: 3, revision_total: 12, week: { goal: 100, answered: 64, days_active: 5 },
    bests: { weekly_test: null, monthly_mock: null, most_in_a_day: 32 }, subjects: [], exam_date: null,
  };
  const d: HomeData = {
    firstName: "Pema", training, unread: 3, needsOnboarding: false, access: null,
    pe: { answered: 64, accuracy: 72 }, me: { answered: 0, written: 2 },
  };
  return (
    <AppShell area="student" sections={[{ items: [{ href: "/dashboard", label: "Home", exact: true }] }]} user={{ name: "Pema", email: "pema@example.com", roleLabel: "Student" }}>
      <div className="mx-auto max-w-2xl"><HomeView d={d} /></div>
    </AppShell>
  );
}
