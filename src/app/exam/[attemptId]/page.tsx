import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { ChoosePaper } from "@/components/exam/choose-paper";
import { ExamRoomClient } from "@/components/exam/exam-room-client";
import { PausedExamCard } from "@/components/student/paused-exams";
import { chosenQuestions, hasChoice } from "@/lib/exam/choice";
import type { WrittenMode } from "@/components/exam/exam-room";
import { requireUser } from "@/lib/auth/dal";
import type { AttemptPaper } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Examination", robots: { index: false } };
export const instant = false;

export default async function ExamPage({ params, searchParams }: PageProps<"/exam/[attemptId]">) {
  const { attemptId } = await params;
  const sp = await searchParams;
  const user = await requireUser(`/exam/${attemptId}`);
  if (!/^[0-9a-f-]{36}$/i.test(attemptId)) notFound();

  const supabase = await createClient();
  const { data, error } = await supabase.rpc("get_attempt_paper", { _attempt_id: attemptId });
  if (error || !data) notFound();
  let paper = data as AttemptPaper;
  if (paper.attempt.status !== "in_progress") redirect(`/dashboard/results/${attemptId}`);

  // A paused exam opens with its Continue button; the timer starts again only when the student continues.
  const { data: state } = await supabase.from("exam_attempts").select("paused_at, paused_seconds").eq("id", attemptId).maybeSingle();
  if (state?.paused_at) {
    return (
      <main className="mx-auto max-w-lg px-4 py-10">
        <h1 className="font-serif text-2xl font-semibold text-ink">This exam is paused</h1>
        <p className="mt-2 text-sm text-muted-foreground">Your answers are saved and the timer is stopped.</p>
        <ul className="mt-6">
          <PausedExamCard e={{ attempt_id: attemptId, title: paper.exam.title, stage: paper.exam.stage, kind: paper.exam.kind, paused: true,
            paused_at: state.paused_at, started_at: paper.attempt.started_at, seconds_left: Number(state.paused_seconds ?? 0), answered: 0 }} />
        </ul>
      </main>
    );
  }

  // "Answer any N" papers: read the whole paper and choose the questions first; then write only those.
  const choice = hasChoice(paper.questions);
  if (choice) {
    const chosen = paper.attempt.chosen_groups ?? [];
    if (!chosen.length || sp.choose === "1") return <ChoosePaper paper={paper} changing={chosen.length > 0} />;
    paper = { ...paper, questions: chosenQuestions(paper.questions, chosen) };
  }

  const written: Record<string, WrittenMode> = {};
  const { data: exam } = await supabase.from("exams").select("untimed").eq("id", paper.exam.id).maybeSingle();
  const untimed = Boolean(exam?.untimed);
  let maxPages = 10;
  if (paper.questions.some((q) => q.type !== "mcq")) {
    const [{ data: rows }, { data: cfg }] = await Promise.all([
      supabase.from("attempt_answers").select("id, exam_question_id, answer_mode, answer_pages(count)").eq("attempt_id", attemptId),
      supabase.rpc("evaluation_config"),
    ]);
    for (const r of (rows ?? []) as { id: string; exam_question_id: string; answer_mode: "typed" | "handwritten"; answer_pages: { count: number }[] }[]) {
      written[r.exam_question_id] = { mode: r.answer_mode, answerId: r.id, pages: r.answer_pages?.[0]?.count ?? 0 };
    }
    maxPages = Number((cfg as { max_pages?: number } | null)?.max_pages ?? 10);
  }

  return <ExamRoomClient paper={paper} userId={user.id} written={written} untimed={untimed} maxPages={maxPages} paperHref={choice ? `/exam/${attemptId}?choose=1` : undefined} />;
}
