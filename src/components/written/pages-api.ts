"use client";

import { arrangePagesAction, listPagesAction, registerPageAction, setAnswerModeAction } from "@/app/dashboard/written/actions";
import { getBrowserClient } from "@/lib/supabase/client";
import type { PagesApi } from "./handwritten-pages";

/** Real implementation: photos go straight from the browser to private Storage, then are registered. */
export function createPagesApi(userId: string, attemptId: string, examQuestionId: string): PagesApi {
  return {
    ensureAnswer: () => setAnswerModeAction(attemptId, examQuestionId, "handwritten"),
    list: listPagesAction,
    arrange: arrangePagesAction,
    async upload(answerId, blob, meta) {
      const db = getBrowserClient();
      if (!db) return { ok: false, message: "Uploads are not available." };
      const path = `${userId}/${answerId}/${crypto.randomUUID().replace(/-/g, "")}.jpg`;
      const { error } = await db.storage.from("answer-sheets").upload(path, blob, { contentType: "image/jpeg", upsert: false });
      if (error) return { ok: false, message: "The photo could not be uploaded. Check your connection and try again." };
      return registerPageAction({ answerId, path, width: meta.width, height: meta.height, bytes: blob.size, warnings: meta.warnings });
    },
  };
}
