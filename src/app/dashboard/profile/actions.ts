"use server";

import { revalidatePath } from "next/cache";
import { getCurrentUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { toFieldErrors, type FieldErrors } from "@/lib/validation/auth";
import { profileSchema } from "@/lib/validation/profile";

export type ProfileState = { status: "idle" | "success" | "error"; message?: string; fieldErrors?: FieldErrors };

export async function updateProfile(_prev: ProfileState, formData: FormData): Promise<ProfileState> {
  const user = await getCurrentUser();
  if (!user) return { status: "error", message: "Your session has expired. Please sign in again." };

  const parsed = profileSchema.safeParse({
    fullName: formData.get("fullName"),
    phone: formData.get("phone"),
    dzongkhag: formData.get("dzongkhag"),
    targetCycle: formData.get("targetCycle"),
  });
  if (!parsed.success) return { status: "error", fieldErrors: toFieldErrors(parsed.error) };

  const supabase = await createClient();
  const { error } = await supabase
    .from("profiles")
    .update({
      full_name: parsed.data.fullName,
      phone: parsed.data.phone,
      dzongkhag: parsed.data.dzongkhag,
      target_cycle: parsed.data.targetCycle,
    })
    .eq("id", user.id);
  if (error) return { status: "error", message: "Your profile could not be saved. Please try again." };
  revalidatePath("/dashboard", "layout");
  return { status: "success", message: "Profile saved." };
}
