"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export type CaStartState = { error?: string };

const MESSAGES: Record<string, string> = {
  NO_QUESTION_TODAY: "There is no Question of the Day yet. Check back later today.",
  ACCESS_REQUIRED: "This is part of the PE and PE + ME packages.",
  NO_QUESTIONS: "No practice questions are available for this yet.",
  RATE_LIMIT: "Daily practice limit reached. Please try again tomorrow.",
  NOT_SIGNED_IN: "Please sign in again.",
};
const msg = (e: { message: string } | null) => Object.entries(MESSAGES).find(([k]) => e?.message.includes(k))?.[1] ?? "Could not start. Please try again.";

async function start(rpc: string, args: Record<string, unknown>): Promise<CaStartState> {
  if (!(await getCurrentUser())) return { error: MESSAGES.NOT_SIGNED_IN };
  const db = await createClient();
  const { data, error } = await db.rpc(rpc, args);
  if (error || !data) return { error: msg(error) };
  redirect(`/exam/${data as string}`);
}

export async function startQuestionOfDayAction(prev: CaStartState): Promise<CaStartState> {
  void prev;
  return start("start_question_of_day", {});
}

export async function startCaPracticeAction(_prev: CaStartState, formData: FormData): Promise<CaStartState> {
  const parsed = z.object({ area: z.enum(["", "bhutan", "regional", "world"]), count: z.coerce.number().int().min(5).max(30) })
    .safeParse({ area: formData.get("area") ?? "", count: formData.get("count") ?? 10 });
  if (!parsed.success) return { error: "Invalid request." };
  return start("create_ca_practice", { _count: parsed.data.count, _area: parsed.data.area || null });
}

export async function startStoryPracticeAction(_prev: CaStartState, formData: FormData): Promise<CaStartState> {
  const id = z.uuid().safeParse(formData.get("id"));
  if (!id.success) return { error: "Invalid request." };
  return start("create_ca_item_practice", { _item_id: id.data });
}
