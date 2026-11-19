"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

/** Publish every waiting question of one batch (founder taps once per batch). */
export async function publishBatchAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  try { await assertPermission("questions.publish"); } catch { return { status: "error", message: "Only users who can publish questions can do this." }; }
  const batch = z.string().min(1).max(80).safeParse(formData.get("batch"));
  if (!batch.success) return { status: "error", message: "Choose a batch to publish." };
  const db = await createClient();
  const { data, error } = await db.rpc("publish_question_batch", { _batch: batch.data });
  if (error) return { status: "error", message: "The batch could not be published. Please try again." };
  revalidatePath("/admin/ai/review");
  revalidatePath("/admin/questions");
  const n = Number(data ?? 0);
  return n ? { status: "success", message: `${n} questions from “${batch.data}” are now published for students.` } : { status: "error", message: "Nothing was published: the questions may need a closer look. Open them below." };
}
