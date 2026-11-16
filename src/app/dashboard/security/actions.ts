"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export async function signOutOtherDevicesAction(_prev: ActionState): Promise<ActionState> {
  void _prev;
  const user = await getCurrentUser();
  if (!user) return { status: "error", message: "Please sign in again." };
  const db = await createClient();
  const { data, error } = await db.rpc("revoke_my_sessions", { _keep: user.sessionId, _only: null });
  if (error) return { status: "error", message: "Could not sign out other devices." };
  revalidatePath("/dashboard/security");
  return { status: "success", message: `Signed out ${data ?? 0} other session${data === 1 ? "" : "s"}.` };
}

export async function signOutSessionAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const user = await getCurrentUser();
  if (!user) return { status: "error", message: "Please sign in again." };
  const id = z.uuid().safeParse(formData.get("id"));
  if (!id.success || id.data === user.sessionId) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("revoke_my_sessions", { _keep: user.sessionId, _only: id.data });
  if (error) return { status: "error", message: "Could not sign out that session." };
  revalidatePath("/dashboard/security");
  return { status: "success", message: "Signed out." };
}

const pw = z.object({
  password: z.string().min(8, "Use at least 8 characters.").max(72),
  confirm: z.string(),
}).refine((v) => v.password === v.confirm, { message: "The passwords do not match.", path: ["confirm"] });

export async function changePasswordAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const user = await getCurrentUser();
  if (!user) return { status: "error", message: "Please sign in again." };
  const parsed = pw.safeParse({ password: formData.get("password"), confirm: formData.get("confirm") });
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the password." };
  const db = await createClient();
  const { error } = await db.auth.updateUser({ password: parsed.data.password });
  if (error) {
    return { status: "error", message: error.code === "weak_password" ? "That password is too weak. Choose a longer one." : error.code === "same_password" ? "Choose a password different from the current one." : "The password could not be changed. Sign in again and retry." };
  }
  await db.rpc("revoke_my_sessions", { _keep: user.sessionId, _only: null });
  revalidatePath("/dashboard/security");
  return { status: "success", message: "Password changed. Other devices have been signed out." };
}
