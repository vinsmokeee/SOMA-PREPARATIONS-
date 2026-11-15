"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export type PracticeState = { error?: string };

const schema = z.object({
  stage: z.enum(["PE", "ME"]),
  subject_id: z.preprocess((v) => (v ? v : null), z.uuid().nullable()),
  topic_id: z.preprocess((v) => (v ? v : null), z.uuid().nullable()),
  difficulty: z.preprocess((v) => (v ? v : null), z.enum(["foundation", "standard", "advanced"]).nullable()),
  count: z.coerce.number().int().min(5).max(50),
  minutes: z.preprocess((v) => (v ? v : null), z.coerce.number().int().min(5).max(180).nullable()),
  mode: z.enum(["mixed", "new", "mistakes"]),
});

const MESSAGES: Record<string, string> = {
  NO_QUESTIONS: "No questions match these choices yet. Try a broader selection.",
  RATE_LIMIT: "You have created many practice sets today. Please finish some before starting more.",
  NOT_SIGNED_IN: "Your session has expired. Please sign in again.",
};

export async function startPractice(_prev: PracticeState, formData: FormData): Promise<PracticeState> {
  const parsed = schema.safeParse({
    stage: formData.get("stage"),
    subject_id: formData.get("subject_id"),
    topic_id: formData.get("topic_id"),
    difficulty: formData.get("difficulty"),
    count: formData.get("count") ?? 10,
    minutes: formData.get("minutes"),
    mode: formData.get("mode") ?? "mixed",
  });
  if (!parsed.success) return { error: "Please check your choices." };
  if (!(await getCurrentUser())) return { error: MESSAGES.NOT_SIGNED_IN };
  const d = parsed.data;
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("create_practice_set", {
    _stage: d.stage,
    _subject_id: d.subject_id,
    _topic_id: d.topic_id,
    _difficulty: d.difficulty,
    _count: d.count,
    _minutes: d.minutes,
    _mode: d.mode,
  });
  if (error || !data) {
    const key = Object.keys(MESSAGES).find((k) => error?.message.includes(k));
    return { error: key ? MESSAGES[key] : "The practice set could not be created. Please try again." };
  }
  redirect(`/exam/${data as string}`);
}
