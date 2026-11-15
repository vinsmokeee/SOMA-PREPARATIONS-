"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import type { SaveInput, SaveResult } from "@/app/exam/actions";

export type Patch = Omit<SaveInput, "attemptId" | "examQuestionId">;
export type SaveStatus = "saved" | "saving" | "offline" | "closed";

/** Merge two pending patches for the same question (later values win; time adds up). */
export function mergePatch(a: Patch, b: Patch): Patch {
  const out: Patch = { ...a, ...b };
  if (b.selectedOptionId) out.clearSelection = false;
  if (b.clearSelection) out.selectedOptionId = null;
  out.timeSpentDelta = Math.min(600, (a.timeSpentDelta ?? 0) + (b.timeSpentDelta ?? 0));
  return out;
}

const RETRY_MS = [1500, 3000, 6000, 10000, 15000];

/**
 * A per-question save queue. Each question keeps at most one pending patch;
 * saves are sent one at a time and retried with backoff on failure. When the
 * server reports the attempt is closed, `onClosed` is called once.
 */
export function useAutosave({
  attemptId,
  save,
  onClosed,
}: {
  attemptId: string;
  save: (input: SaveInput) => Promise<SaveResult>;
  onClosed: () => void;
}) {
  const pending = useRef(new Map<string, Patch>());
  const running = useRef(false);
  const retry = useRef(0);
  const retryTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const closed = useRef(false);
  const [status, setStatus] = useState<SaveStatus>("saved");
  const [lastSavedAt, setLastSavedAt] = useState<Date | null>(null);
  const [pendingCount, setPendingCount] = useState(0);

  const flush = useCallback(async (): Promise<boolean> => {
    if (running.current || closed.current) return pending.current.size === 0;
    running.current = true;
    try {
      while (pending.current.size > 0 && !closed.current) {
        const [examQuestionId, patch] = pending.current.entries().next().value as [string, Patch];
        pending.current.delete(examQuestionId);
        setPendingCount(pending.current.size);
        setStatus("saving");
        let result: SaveResult;
        try {
          result = await save({ attemptId, examQuestionId, ...patch });
        } catch {
          result = { ok: false, error: "NETWORK" };
        }
        if (result.ok) {
          retry.current = 0;
          setLastSavedAt(new Date());
          continue;
        }
        if (result.error === "ATTEMPT_CLOSED" || result.error === "ATTEMPT_NOT_FOUND") {
          closed.current = true;
          setStatus("closed");
          onClosed();
          return false;
        }
        // Put it back (merging anything newer that arrived meanwhile) and retry later.
        const newer = pending.current.get(examQuestionId);
        pending.current.set(examQuestionId, newer ? mergePatch(patch, newer) : patch);
        setPendingCount(pending.current.size);
        setStatus("offline");
        const wait = RETRY_MS[Math.min(retry.current, RETRY_MS.length - 1)];
        retry.current += 1;
        if (retryTimer.current) clearTimeout(retryTimer.current);
        retryTimer.current = setTimeout(() => void flush(), wait);
        return false;
      }
      if (!closed.current) setStatus("saved");
      return true;
    } finally {
      running.current = false;
    }
  }, [attemptId, save, onClosed]);

  const enqueue = useCallback(
    (examQuestionId: string, patch: Patch, immediate = true) => {
      if (closed.current) return;
      const prev = pending.current.get(examQuestionId);
      pending.current.set(examQuestionId, prev ? mergePatch(prev, patch) : patch);
      setPendingCount(pending.current.size);
      if (immediate) void flush();
    },
    [flush],
  );

  // Retry as soon as the connection comes back.
  useEffect(() => {
    const online = () => {
      retry.current = 0;
      void flush();
    };
    window.addEventListener("online", online);
    return () => {
      window.removeEventListener("online", online);
      if (retryTimer.current) clearTimeout(retryTimer.current);
    };
  }, [flush]);

  /** Waits (up to timeoutMs) for all pending saves to reach the server. */
  const drain = useCallback(
    async (timeoutMs = 8000) => {
      const until = Date.now() + timeoutMs;
      while (Date.now() < until) {
        if (closed.current) return false;
        if (pending.current.size === 0 && !running.current) return true;
        retry.current = 0;
        await flush();
        if (pending.current.size === 0 && !running.current) return true;
        await new Promise((r) => setTimeout(r, 400));
      }
      return pending.current.size === 0;
    },
    [flush],
  );

  return { enqueue, flush, drain, status, lastSavedAt, pendingCount, isClosed: () => closed.current };
}
