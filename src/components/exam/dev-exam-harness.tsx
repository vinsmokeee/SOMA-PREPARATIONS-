"use client";

import { useCallback, useState } from "react";
import type { SaveInput, SaveResult, SubmitResult } from "@/app/exam/actions";
import type { AttemptPaper } from "@/lib/exam/types";
import { ExamRoom } from "./exam-room";

declare global {
  interface Window {
    __somaExam?: { saves: SaveInput[]; submits: number; failNext: number };
  }
}

/**
 * Development/test harness: the real ExamRoom with in-memory save/submit.
 * `failSaves` makes the first N saves fail (simulates a lost connection).
 */
export function DevExamHarness({ paper, failSaves }: { paper: AttemptPaper; failSaves: number }) {
  const [finished, setFinished] = useState(false);

  const state = () => {
    if (typeof window === "undefined") return { saves: [], submits: 0, failNext: 0 };
    window.__somaExam ??= { saves: [], submits: 0, failNext: failSaves };
    return window.__somaExam;
  };

  const save = useCallback(async (input: SaveInput): Promise<SaveResult> => {
    const s = state();
    await new Promise((r) => setTimeout(r, 80));
    if (s.failNext > 0) {
      s.failNext -= 1;
      return { ok: false, error: "NETWORK" };
    }
    s.saves.push(input);
    return { ok: true, savedAt: new Date().toISOString() };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const submit = useCallback(async (): Promise<SubmitResult> => {
    state().submits += 1;
    await new Promise((r) => setTimeout(r, 150));
    return { ok: true };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  if (finished) {
    return (
      <main id="main" className="mx-auto max-w-lg p-10 text-center">
        <h1 className="font-serif text-2xl font-semibold">Examination submitted</h1>
        <p className="mt-2 text-muted-foreground">Development harness — results page would open here.</p>
      </main>
    );
  }
  return <ExamRoom paper={paper} save={save} submit={submit} onFinished={() => setFinished(true)} />;
}
