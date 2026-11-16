"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const stage = z.enum(["PE", "ME"]);

/** The student chose the Free option for an exam: remember it and open that exam. */
export async function startFreeAction(formData: FormData): Promise<void> {
  const user = await getCurrentUser();
  if (!user) redirect("/login");
  const s = stage.safeParse(formData.get("stage"));
  if (!s.success) redirect("/dashboard");
  const db = await createClient();
  const { data: p } = await db.from("profiles").select("pathway").eq("id", user.id).maybeSingle();
  const has = (x: "PE" | "ME") => p?.pathway === x || p?.pathway === "both";
  const other = s.data === "PE" ? "ME" : "PE";
  const pathway = has(other) ? "both" : s.data;
  await db.from("profiles").update({ pathway, onboarded_at: new Date().toISOString() }).eq("id", user.id);
  revalidatePath("/dashboard", "layout");
  redirect(s.data === "PE" ? "/dashboard/pe" : "/dashboard/me");
}

const ENTRY_ERRORS: Record<string, string> = {
  ENTRY_LOCKED: "locked",
  ENTRY_NOT_OFFERED: "not-offered",
  SPECIALISATION_MISMATCH: "mismatch",
};

/** The student picked their ME entry (category, and specialisation for technical graduates). */
export async function setMeEntryAction(formData: FormData): Promise<void> {
  const user = await getCurrentUser();
  if (!user) redirect("/login");
  const parsed = z.object({ category: z.uuid(), specialisation: z.union([z.uuid(), z.literal("")]).optional() })
    .safeParse({ category: formData.get("category"), specialisation: formData.get("specialisation") ?? "" });
  if (!parsed.success) redirect("/dashboard/me");
  const db = await createClient();
  const { error } = await db.from("profiles")
    .update({ entry_category_id: parsed.data.category, specialisation_id: parsed.data.specialisation || null })
    .eq("id", user.id);
  if (error) {
    const key = Object.keys(ENTRY_ERRORS).find((k) => error.message.includes(k));
    redirect(`/dashboard/me?error=${key ? ENTRY_ERRORS[key] : "failed"}`);
  }
  revalidatePath("/dashboard", "layout");
  redirect("/dashboard/me");
}
