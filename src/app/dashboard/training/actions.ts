"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export type ItemState = { error?: string };

const MESSAGES: Record<string, string> = {
  NO_QUESTION_TODAY: "There is no Question of the Day yet. Check back later today.",
  ACCESS_REQUIRED: "This is part of a paid package.",
  NO_QUESTIONS: "These questions are no longer available. Skip this item.",
  QUESTION_NOT_FOUND: "This question is no longer available. Skip this item.",
  ITEM_NOT_FOUND: "This item is no longer in your plan.",
  RATE_LIMIT: "Daily practice limit reached. Please try again tomorrow.",
  PAUSED_EXAM_EXISTS: "Finish your paused exam first. Open “Paused exam” on your home page to continue it.",
};
const message = (e: { message: string } | null) => Object.entries(MESSAGES).find(([k]) => e?.message.includes(k))?.[1] ?? "Could not start. Please try again.";
const itemSchema = z.object({ item: z.uuid() });

export async function startItemAction(_prev: ItemState, formData: FormData): Promise<ItemState> {
  if (!(await getCurrentUser())) return { error: "Please sign in again." };
  const parsed = itemSchema.safeParse({ item: formData.get("item") });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await createClient();
  const { data: item } = await db.from("daily_plan_items").select("status, attempt_id").eq("id", parsed.data.item).maybeSingle();
  // A finished item opens its result instead of starting again.
  if (item?.status === "done" && item.attempt_id) redirect(`/dashboard/results/${item.attempt_id}`);
  const { data, error } = await db.rpc("start_plan_item", { _item: parsed.data.item });
  if (error || !data) return { error: message(error) };
  redirect(`/exam/${data as string}`);
}

export async function skipItemAction(_prev: ItemState, formData: FormData): Promise<ItemState> {
  if (!(await getCurrentUser())) return { error: "Please sign in again." };
  const parsed = itemSchema.safeParse({ item: formData.get("item") });
  if (!parsed.success) return { error: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("skip_plan_item", { _item: parsed.data.item });
  if (error) return { error: message(error) };
  revalidatePath("/dashboard/training");
  revalidatePath("/dashboard");
  return {};
}
