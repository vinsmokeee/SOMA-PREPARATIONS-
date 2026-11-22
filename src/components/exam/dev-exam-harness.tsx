"use client";

import { useCallback, useMemo, useState } from "react";
import type { PagesApi } from "@/components/written/handwritten-pages";
import type { PageInfo } from "@/app/dashboard/written/actions";
import type { SaveInput, SaveResult, SubmitResult } from "@/app/exam/actions";
import type { AttemptPaper } from "@/lib/exam/types";
import { ExamRoom } from "./exam-room";
import { HonestyNote } from "./pause-button";

declare global {
  interface Window {
    __somaExam?: { saves: SaveInput[]; submits: number; failNext: number };
    __somaPages?: Record<string, PageInfo[]>;
  }
}

/**
 * Development/test harness: the real ExamRoom with in-memory save/submit.
 * `failSaves` makes the first N saves fail (simulates a lost connection).
 */
export function DevExamHarness({ paper, failSaves, untimed }: { paper: AttemptPaper; failSaves: number; untimed?: boolean }) {
  const [finished, setFinished] = useState(false);
  const [paused, setPaused] = useState(false);
  const [note, setNote] = useState(true);
  // In-memory answer-sheet storage for the handwritten option.
  const written = useMemo(() => {
    const store = (): Record<string, PageInfo[]> => (window.__somaPages ??= {});
    const api = (eqId: string): PagesApi => ({
      ensureAnswer: async () => ({ ok: true, data: { answerId: `ans-${eqId}` } }),
      list: async (answerId) => ({ ok: true, data: store()[answerId] ?? [] }),
      upload: async (answerId, blob, meta) => {
        const list = (store()[answerId] ??= []);
        const id = `p${list.length + 1}-${Math.random().toString(36).slice(2, 6)}`;
        list.push({ id, position: list.length + 1, url: URL.createObjectURL(blob), quality: { warnings: meta.warnings } });
        return { ok: true, data: { id } };
      },
      arrange: async (answerId, ids) => {
        const list = store()[answerId] ?? [];
        store()[answerId] = ids.map((id, i) => ({ ...list.find((p) => p.id === id)!, position: i + 1 }));
        return { ok: true, data: undefined };
      },
    });
    return {
      initial: {},
      maxPages: 4,
      setMode: async (eqId: string) => ({ ok: true as const, data: { answerId: `ans-${eqId}` } }),
      pagesApi: api,
    };
  }, []);

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

  if (paused) {
    return (
      <main id="main" className="mx-auto max-w-lg p-10 text-center">
        <h1 className="font-serif text-2xl font-semibold">Examination paused</h1>
        <p className="mt-2 text-muted-foreground">Development harness — the Paused exam page would open here.</p>
        {/* Same as the real Paused exam page right after pausing (?paused=1). */}
        {note ? <HonestyNote onClose={() => setNote(false)} /> : null}
      </main>
    );
  }
  if (finished) {
    return (
      <main id="main" className="mx-auto max-w-lg p-10 text-center">
        <h1 className="font-serif text-2xl font-semibold">Examination submitted</h1>
        <p className="mt-2 text-muted-foreground">Development harness — results page would open here.</p>
      </main>
    );
  }
  const hasWritten = paper.questions.some((q) => q.type !== "mcq");
  return <ExamRoom paper={paper} save={save} submit={submit} onFinished={() => setFinished(true)} written={hasWritten ? written : undefined} untimed={untimed}
    pause={untimed ? undefined : async () => { await new Promise((r) => setTimeout(r, 150)); return { ok: true }; }} onPaused={() => setPaused(true)} />;
}
