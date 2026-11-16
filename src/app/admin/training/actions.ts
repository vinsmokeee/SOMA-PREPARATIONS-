"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { trainingConfigSchema } from "@/lib/validation/training";



export async function saveTrainingConfigAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  try {
    await assertPermission("settings.manage");
  } catch (e) {
    return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." };
  }
  const parsed = trainingConfigSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: "Check the numbers: " + parsed.error.issues.map((i) => i.path.join(".")).join(", ") };
  const db = await createClient();
  const { error } = await db.from("app_settings").upsert({ key: "training.config", is_public: false, value: parsed.data });
  if (error) return { status: "error", message: "The settings could not be saved." };
  revalidatePath("/admin/training");
  return { status: "success", message: "Saved. New settings apply to plans created from tomorrow." };
}
