"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const optUuid = z.union([z.uuid(), z.literal("")]).optional().transform((v) => v || null);
const schema = z.object({
  pathway: z.enum(["PE", "ME", "both"]),
  entry_category_id: optUuid,
  specialisation_id: optUuid,
  group: z.string().optional(),
  phone: z.union([z.literal(""), z.string().trim().regex(/^[0-9+ ()-]{6,20}$/, "Enter a valid phone number.")]),
});

const DB_ERRORS: Record<string, string> = {
  ENTRY_LOCKED: "Your ME entry cannot be changed while your ME subscription is active. Please contact support.",
  ENTRY_NOT_OFFERED: "Soma does not offer preparation for that entry yet.",
  SPECIALISATION_MISMATCH: "Choose a specialisation that belongs to your category.",
};

export async function saveWelcomeAction(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const user = await getCurrentUser();
  if (!user) return { error: "Please sign in again." };
  const parsed = schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.issues[0]?.message ?? "Check the details." };
  const d = parsed.data;
  const db = await createClient();
  // Entry fields are absent when the student chose PE only, or when the entry is locked.
  const wantsMe = d.pathway !== "PE" && formData.has("entry_category_id");
  if (wantsMe && d.group && !d.entry_category_id) return { error: "Choose your category." };
  const { data: current } = await db.from("profiles").select("entry_category_id, specialisation_id").eq("id", user.id).maybeSingle();
  // A PE-only student keeps any ME entry they chose before.
  let category = wantsMe ? d.entry_category_id : current?.entry_category_id ?? null;
  let spec = wantsMe ? d.specialisation_id : current?.specialisation_id ?? null;
  if (wantsMe && category) {
    const { data: cat } = await db.from("exam_categories").select("public_group").eq("id", category).maybeSingle();
    if (!cat) return { error: "Choose your ME pathway." };
    if (cat.public_group === "technical" && !spec) return { error: "Choose your specialisation." };
    if (cat.public_group !== "technical") spec = null;
  }
  if (wantsMe && !category) { category = null; spec = null; }
  const { error } = await db.from("profiles").update({
    pathway: d.pathway, entry_category_id: category, specialisation_id: spec,
    phone: d.phone || null, onboarded_at: new Date().toISOString(),
  }).eq("id", user.id);
  if (error) {
    const key = Object.keys(DB_ERRORS).find((k) => error.message.includes(k));
    return { error: key ? DB_ERRORS[key] : "Could not save. Please try again." };
  }
  revalidatePath("/dashboard", "layout");
  redirect("/dashboard");
}
