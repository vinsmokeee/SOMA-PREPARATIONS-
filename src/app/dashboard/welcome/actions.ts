"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

const schema = z.object({
  pathway: z.enum(["PE", "ME", "both"]),
  entry_category_id: z.union([z.uuid(), z.literal("")]),
  phone: z.union([z.literal(""), z.string().trim().regex(/^[0-9+ ()-]{6,20}$/, "Enter a valid phone number.")]),
});

export async function saveWelcomeAction(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const user = await getCurrentUser();
  if (!user) return { error: "Please sign in again." };
  const parsed = schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: parsed.error.issues[0]?.message ?? "Check the details." };
  const db = await createClient();
  const { error } = await db.from("profiles").update({
    pathway: parsed.data.pathway, entry_category_id: parsed.data.entry_category_id || null,
    phone: parsed.data.phone || null, onboarded_at: new Date().toISOString(),
  }).eq("id", user.id);
  if (error) return { error: "Could not save. Please try again." };
  redirect("/dashboard");
}
