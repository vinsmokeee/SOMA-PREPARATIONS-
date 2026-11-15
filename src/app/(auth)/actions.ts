"use server";

import { redirect } from "next/navigation";
import { siteConfig } from "@/config/site";
import { isSupabaseConfigured } from "@/lib/env";
import { createClient } from "@/lib/supabase/server";
import { safeRedirectPath } from "@/lib/utils";
import { forgotSchema, loginSchema, registerSchema, resetSchema, toFieldErrors, type FieldErrors } from "@/lib/validation/auth";

export type AuthState = { status: "idle" | "error" | "success"; message?: string; fieldErrors?: FieldErrors };

const NOT_CONFIGURED: AuthState = {
  status: "error",
  message: "Sign-in is not available in this environment because the authentication service is not configured.",
};

export async function signIn(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = loginSchema.safeParse({ email: formData.get("email"), password: formData.get("password") });
  if (!parsed.success) return { status: "error", fieldErrors: toFieldErrors(parsed.error) };
  if (!isSupabaseConfigured()) return NOT_CONFIGURED;

  const supabase = await createClient();
  const { error } = await supabase.auth.signInWithPassword(parsed.data);
  if (error) {
    if (error.code === "email_not_confirmed") {
      return { status: "error", message: "Please confirm your email address first. Check your inbox for the confirmation link." };
    }
    // Deliberately generic: do not reveal whether the email exists.
    return { status: "error", message: "The email or password is incorrect." };
  }
  redirect(safeRedirectPath(formData.get("next")));
}

export async function signUp(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = registerSchema.safeParse({
    fullName: formData.get("fullName"),
    email: formData.get("email"),
    password: formData.get("password"),
    confirmPassword: formData.get("confirmPassword"),
    acceptTerms: formData.get("acceptTerms") ?? undefined,
  });
  if (!parsed.success) return { status: "error", fieldErrors: toFieldErrors(parsed.error) };
  if (!isSupabaseConfigured()) return NOT_CONFIGURED;

  const supabase = await createClient();
  const { data, error } = await supabase.auth.signUp({
    email: parsed.data.email,
    password: parsed.data.password,
    options: {
      data: { full_name: parsed.data.fullName },
      emailRedirectTo: `${siteConfig.url}/auth/confirm?next=/dashboard`,
    },
  });
  if (error) {
    if (error.code === "weak_password") return { status: "error", fieldErrors: { password: error.message } };
    if (error.code === "over_email_send_rate_limit") {
      return { status: "error", message: "Too many attempts. Please wait a few minutes and try again." };
    }
    return { status: "error", message: "We could not create your account. Please try again." };
  }
  if (data.session) redirect("/dashboard?welcome=1");
  // Email confirmation required (or the address is already registered — Supabase
  // intentionally returns the same response so accounts cannot be enumerated).
  return {
    status: "success",
    message: `We have sent a confirmation link to ${parsed.data.email}. Open it to activate your account.`,
  };
}

export async function requestPasswordReset(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = forgotSchema.safeParse({ email: formData.get("email") });
  if (!parsed.success) return { status: "error", fieldErrors: toFieldErrors(parsed.error) };
  if (!isSupabaseConfigured()) return NOT_CONFIGURED;

  const supabase = await createClient();
  await supabase.auth.resetPasswordForEmail(parsed.data.email, {
    redirectTo: `${siteConfig.url}/auth/confirm?next=/reset-password`,
  });
  // Same response whether or not the account exists.
  return { status: "success", message: "If an account exists for that email, a password reset link is on its way." };
}

export async function updatePassword(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = resetSchema.safeParse({ password: formData.get("password"), confirmPassword: formData.get("confirmPassword") });
  if (!parsed.success) return { status: "error", fieldErrors: toFieldErrors(parsed.error) };
  if (!isSupabaseConfigured()) return NOT_CONFIGURED;

  const supabase = await createClient();
  const { data: claims } = await supabase.auth.getClaims();
  if (!claims?.claims?.sub) {
    return { status: "error", message: "Your reset link has expired. Please request a new one." };
  }
  const { error } = await supabase.auth.updateUser({ password: parsed.data.password });
  if (error) {
    if (error.code === "same_password") return { status: "error", fieldErrors: { password: "Choose a password different from your current one." } };
    return { status: "error", message: "Your password could not be updated. Please request a new link." };
  }
  redirect("/dashboard?notice=password-updated");
}
