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

  // ?sample=past shows real past-paper questions: a chart, a table and original Dzongkha print.
  const past: PaperQuestion[] = [
    { ...mcq(1), section: "Data Interpretation", image_url: "/papers/pe-2010/fig-p23-23d6fc.webp", stem: "The bar graph shows the top ten revenue agencies of Bhutan in 2006-07 and 2007-08 (million Ngultrum).\n\nWhat was the total contribution of the top ten agencies in 2006-07?" },
    { ...mcq(2), section: "Data Interpretation", stem: "Sonam’s scores in 4 mock tests:\n\n| Mock | English | Dzongkha | Data Interpretation |\n|---|---|---|---|\n| 1 | 23 | 12 | 19 |\n| 2 | 24 | 17 | 18 |\n| 3 | 22 | 11 | 23 |\n| 4 | 20 | 21 | 22 |\n\nIn which mock test did Sonam score the highest total?" },
    { ...mcq(3), section: "Dzongkha", image_url: "/papers/pe-2010/dz-q41.webp", stem: "Read the question in the picture (from the original paper) and choose the correct answer: ཀ, ཁ, ག or ང.", options: ["ཀ", "ཁ", "ག", "ང"].map((body, i) => ({ id: `20000000-0000-4000-8000-${String(i).padStart(12, "0")}`, label: "ABCD"[i], body })) },
  ];
  const questions = sp.sample === "past" ? past : stage === "PE" ? Array.from({ length: 10 }, (_, i) => mcq(i + 1)) : [written(1), written(2)];
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
  return <DevExamHarness paper={paper} failSaves={failSaves} untimed={sp.untimed === "1"} />;
}
