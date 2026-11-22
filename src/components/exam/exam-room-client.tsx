"use client";

import { useRouter } from "next/navigation";
import { useCallback, useMemo } from "react";
import { pauseAttempt, saveAnswer, submitAttempt } from "@/app/exam/actions";
import { setAnswerModeAction } from "@/app/dashboard/written/actions";
import { createPagesApi } from "@/components/written/pages-api";
import type { PagesApi } from "@/components/written/handwritten-pages";
import type { AttemptPaper } from "@/lib/exam/types";
import { ExamRoom, type WrittenMode } from "./exam-room";

/** Connects the exam room to the real server actions. */
export function ExamRoomClient({ paper, userId, written, untimed, maxPages, paperHref }: {
  paper: AttemptPaper; userId: string; written: Record<string, WrittenMode>; untimed: boolean; maxPages: number; paperHref?: string;
}) {
  const router = useRouter();
  const attemptId = paper.attempt.id;
  const onFinished = useCallback(() => {
    router.replace(`/dashboard/results/${attemptId}`);
  }, [router, attemptId]);
  const support = useMemo(() => {
    const cache = new Map<string, PagesApi>();
    return {
      initial: written,
      maxPages,
      setMode: (eqId: string, mode: "typed" | "handwritten") => setAnswerModeAction(attemptId, eqId, mode),
      pagesApi: (eqId: string) => {
        if (!cache.has(eqId)) cache.set(eqId, createPagesApi(userId, attemptId, eqId));
        return cache.get(eqId)!;
      },
    };
  }, [attemptId, maxPages, userId, written]);
  const onPaused = useCallback(() => {
    router.replace(`/dashboard/paused?stage=${paper.exam.stage}&paused=1`);
  }, [router, paper.exam.stage]);
  const hasWritten = paper.questions.some((q) => q.type !== "mcq");
  return <ExamRoom paper={paper} save={saveAnswer} submit={submitAttempt} onFinished={onFinished} written={hasWritten ? support : undefined} untimed={untimed} paperHref={paperHref} pause={untimed ? undefined : pauseAttempt} onPaused={onPaused} />;
}
