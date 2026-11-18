import type { SupabaseClient } from "@supabase/supabase-js";

/**
 * The exam a student is preparing for: from the page address, or else their profile. Students prepare for one
 * exam at a time (PE first; ME months later for those who qualify). Older "both" profiles open ME, like the menu.
 */
export async function pageStage(db: SupabaseClient, userId: string, param: unknown): Promise<"PE" | "ME"> {
  if (param === "PE" || param === "ME") return param;
  const { data } = await db.from("profiles").select("pathway").eq("id", userId).maybeSingle();
  return data?.pathway === "ME" || data?.pathway === "both" ? "ME" : "PE";
}
