"use client";

import { useRouter } from "next/navigation";
import { useCallback } from "react";
import { saveAnswer, submitAttempt } from "@/app/exam/actions";
import type { AttemptPaper } from "@/lib/exam/types";
import { ExamRoom } from "./exam-room";

/** Connects the exam room to the real server actions. */
export function ExamRoomClient({ paper }: { paper: AttemptPaper }) {
  const router = useRouter();
  const onFinished = useCallback(() => {
    router.replace(`/dashboard/results/${paper.attempt.id}`);
  }, [router, paper.attempt.id]);
  return <ExamRoom paper={paper} save={saveAnswer} submit={submitAttempt} onFinished={onFinished} />;
}
