"use server";

import { isSupabaseConfigured } from "@/lib/env";
import { createClient } from "@/lib/supabase/server";
import { contactSchema } from "@/lib/validation/contact";

export type ContactState = {
  status: "idle" | "success" | "error";
  message?: string;
  fieldErrors?: Partial<Record<"name" | "email" | "topic" | "message", string>>;
};

export async function submitContact(_prev: ContactState, formData: FormData): Promise<ContactState> {
  // Honeypot: real users never fill this hidden field.
  if (String(formData.get("company") ?? "").length > 0) {
    return { status: "success", message: "Thank you. We will reply by email." };
  }

  const parsed = contactSchema.safeParse({
    name: formData.get("name"),
    email: formData.get("email"),
    topic: formData.get("topic"),
    message: formData.get("message"),
  });
  if (!parsed.success) {
    const fieldErrors: ContactState["fieldErrors"] = {};
    for (const issue of parsed.error.issues) {
      const key = issue.path[0] as keyof NonNullable<ContactState["fieldErrors"]>;
      fieldErrors[key] ??= issue.message;
    }
    return { status: "error", message: "Please check the highlighted fields.", fieldErrors };
  }

  if (!isSupabaseConfigured()) {
    return { status: "error", message: "Messages cannot be sent from this environment yet. Please try again later." };
  }

  // Runs as the visitor (anon or signed in). RLS allows insert-only.
  const supabase = await createClient();
  const { data: claims } = await supabase.auth.getClaims();
  const { error } = await supabase.from("contact_messages").insert({
    ...parsed.data,
    user_id: claims?.claims?.sub ?? null,
  });
  if (error) {
    console.error("contact insert failed", error.code);
    return { status: "error", message: "Your message could not be sent. Please try again in a few minutes." };
  }
  return { status: "success", message: "Thank you — your message has been received. We will reply by email." };
}
