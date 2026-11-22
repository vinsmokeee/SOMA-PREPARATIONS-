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
  if (s.data === "ME") redirect("/dashboard/me"); // ME has no free plan
  const db = await createClient();
  // A student prepares for one exam at a time (PE first; ME months later), so the choice replaces the old one.
  const pathway = s.data;
  await db.from("profiles").update({ pathway, onboarded_at: new Date().toISOString() }).eq("id", user.id);
  revalidatePath("/dashboard", "layout");
  redirect(s.data === "PE" ? "/dashboard/pe" : "/dashboard/me");
}

/** The student picked PE or ME on the "Which exam" screen: remember it (one exam at a time) and open it. */
export async function chooseExamAction(formData: FormData): Promise<void> {
  const user = await getCurrentUser();
  if (!user) redirect("/login");
  const s = stage.safeParse(formData.get("stage"));
  if (!s.success) redirect("/dashboard");
  const db = await createClient();
  const { data: p } = await db.from("profiles").select("pathway").eq("id", user.id).maybeSingle();
  // Only switch a student who already chose an exam; a new student still picks Free or Premium first.
  if (p?.pathway && p.pathway !== s.data) {
    await db.from("profiles").update({ pathway: s.data }).eq("id", user.id);
    revalidatePath("/dashboard", "layout");
  }
  redirect(s.data === "PE" ? "/dashboard/pe" : "/dashboard/me");
}

const ENTRY_ERRORS: Record<string, string> = {
  ENTRY_LOCKED: "locked",
  ENTRY_NOT_OFFERED: "not-offered",
  SPECIALISATION_MISMATCH: "mismatch",
};

/** ME Premium: the student confirms the subject shown in the pop-up; then all other subjects are locked. */
export async function confirmMeEntryAction(formData: FormData): Promise<void> {
  const user = await getCurrentUser();
  if (!user) redirect("/login");
  const parsed = z.object({ category: z.uuid(), specialisation: z.union([z.uuid(), z.literal("")]).optional() })
    .safeParse({ category: formData.get("category"), specialisation: formData.get("specialisation") ?? "" });
  if (!parsed.success) redirect("/dashboard/me");
  const db = await createClient();
  const { error } = await db.rpc("confirm_me_entry", { _category: parsed.data.category, _specialisation: parsed.data.specialisation || undefined });
  if (error) redirect(`/dashboard/me?error=${error.message.includes("ENTRY_CHANGED") ? "changed" : "failed"}`);
  revalidatePath("/dashboard", "layout");
  redirect("/dashboard/me");
}

/** The student picked their ME entry: category; B.Ed. graduate type; Technical specialisation and Paper II group. */
export async function setMeEntryAction(formData: FormData): Promise<void> {
  const user = await getCurrentUser();
  if (!user) redirect("/login");
  const parsed = z.object({ category: z.uuid(), specialisation: z.union([z.uuid(), z.literal("")]).optional(), subject_group: z.union([z.uuid(), z.literal("")]).optional() })
    .safeParse({ category: formData.get("category"), specialisation: formData.get("specialisation") ?? "", subject_group: formData.get("subject_group") ?? "" });
  if (!parsed.success) redirect("/dashboard/me");
  const db = await createClient();
  const { error } = await db.from("profiles")
    .update({ entry_category_id: parsed.data.category, specialisation_id: parsed.data.specialisation || null, subject_group_id: parsed.data.subject_group || null })
    .eq("id", user.id);
  if (error) {
    const key = Object.keys(ENTRY_ERRORS).find((k) => error.message.includes(k));
    redirect(`/dashboard/me?error=${key ? ENTRY_ERRORS[key] : "failed"}`);
  }
  revalidatePath("/dashboard", "layout");
  redirect("/dashboard/me");
}
