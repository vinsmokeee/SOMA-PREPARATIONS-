import type { SupabaseClient } from "@supabase/supabase-js";

/** The exam a student prepares for (PE or ME), from the page address or else their profile. Null = both. */
export async function pageStage(db: SupabaseClient, userId: string, param: unknown): Promise<"PE" | "ME" | null> {
  if (param === "PE" || param === "ME") return param;
  const { data } = await db.from("profiles").select("pathway").eq("id", userId).maybeSingle();
  return data?.pathway === "PE" || data?.pathway === "ME" ? data.pathway : null;
}
