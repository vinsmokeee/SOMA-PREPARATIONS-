import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { DevExamHarness } from "@/components/exam/dev-exam-harness";
import type { AttemptPaper, PaperQuestion } from "@/lib/exam/types";

export const metadata: Metadata = { title: "Exam room preview", robots: { index: false } };
export const instant = false;

/**
 * Development-only preview of the examination room with fixture questions.
 * Available ONLY when SOMA_PUBLIC_DATA=fixture (local development and
 * automated tests without Supabase). Returns 404 everywhere else.
 */
export default async function ExamPreviewPage({ searchParams }: PageProps<"/dev/exam-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const sp = await searchParams;
  const stage = sp.stage === "ME" ? "ME" : "PE";
  const seconds = Math.max(3, Math.min(7200, Number(sp.seconds ?? 1800) || 1800));
  const failSaves = Math.max(0, Math.min(20, Number(sp.failSaves ?? 0) || 0));
  const now = new Date();

  const mcq = (n: number): PaperQuestion => ({
    exam_question_id: `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`,
    number: n,
    section: n <= 3 ? "English communication" : "Logic and problem-solving",
    marks: 1,
    type: "mcq",
    stem: `Preview question ${n}. Which option is the example answer for this preview?`,
    word_limit: null,
    options: ["A", "B", "C", "D"].map((label, i) => ({ id: `10000000-0000-4000-8000-${String(n * 10 + i).padStart(12, "0")}`, label, body: `Option ${label} for question ${n}` })),
  });
  const written = (n: number): PaperQuestion => ({
    exam_question_id: `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`,
    number: n,
    section: "Paper II",
    marks: 10,
    type: n === 1 ? "short_answer" : "essay",
    stem: n === 1 ? "Preview: explain the purpose of a preliminary examination in about 100 words." : "Preview: write an essay on public service in about 400 words.",
    word_limit: n === 1 ? 100 : 400,
    options: [],
  });

  const questions = stage === "PE" ? Array.from({ length: 10 }, (_, i) => mcq(i + 1)) : [written(1), written(2)];
  const paper: AttemptPaper = {
    attempt: {
      id: "99999999-0000-4000-8000-000000000001",
      status: "in_progress",
      started_at: now.toISOString(),
      deadline_at: new Date(now.getTime() + seconds * 1000).toISOString(),
      server_now: now.toISOString(),
    },
    exam: { id: "x", title: stage === "PE" ? "PE preview examination" : "ME preview paper", stage, kind: "sample", instructions: null, duration_minutes: Math.ceil(seconds / 60), omr_mode: stage === "PE", negative_mark_per_wrong: 0 },
    questions,
    answers: [],
  };
  return <DevExamHarness paper={paper} failSaves={failSaves} />;
}
