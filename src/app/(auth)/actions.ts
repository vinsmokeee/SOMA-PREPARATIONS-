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
    await recordFailedLogin(parsed.data.email);
    // Deliberately generic: do not reveal whether the email exists.
    return { status: "error", message: "The email or password is incorrect." };
  }
  redirect(safeRedirectPath(formData.get("next")));
}

/** Records a failed sign-in for risk checks (by e-mail hash; never reveals whether the account exists). */
async function recordFailedLogin(email: string) {
  if (!process.env.SUPABASE_SECRET_KEY) return;
  try {
    const [{ createHash }, { headers }, { createAdminClient }] = await Promise.all([import("node:crypto"), import("next/headers"), import("@/lib/supabase/admin")]);
    const country = (await headers()).get("x-vercel-ip-country");
    await createAdminClient().rpc("record_failed_login", {
      _email_hash: createHash("sha256").update(email.trim().toLowerCase()).digest("hex"),
      _country: country && /^[A-Z]{2}$/.test(country) ? country : null,
    });
  } catch {
    // monitoring must never block sign-in
  }
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
    if (error.code === "user_already_exists" || error.code === "email_exists") {
      return { status: "error", message: "This email already has an account. Please sign in instead." };
    }
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

/** Sends a one-time sign-in link to the signed-in user's own e-mail (device confirmation). */
export async function sendDeviceLink(_prev: AuthState, formData: FormData): Promise<AuthState> {
  if (!isSupabaseConfigured()) return NOT_CONFIGURED;
  const supabase = await createClient();
  const { data } = await supabase.auth.getClaims();
  const email = typeof data?.claims?.email === "string" ? data.claims.email : null;
  if (!email) return { status: "error", message: "Please sign in again." };
  const next = safeRedirectPath(formData.get("next"));
  const { error } = await supabase.auth.signInWithOtp({
    email,
    options: { shouldCreateUser: false, emailRedirectTo: `${siteConfig.url}/auth/confirm?next=${encodeURIComponent(next)}` },
  });
  if (error) {
    return { status: "error", message: error.code === "over_email_send_rate_limit" ? "Too many e-mails were sent recently. Please wait a few minutes and try again." : "The link could not be sent. Please try again." };
  }
  return { status: "success", message: "Check your e-mail and open the link in this same browser." };
}
