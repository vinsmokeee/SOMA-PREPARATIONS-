import "server-only";
import { createClient } from "@supabase/supabase-js";
import { supabaseConfig } from "@/lib/env";

/**
 * Privileged Supabase client using the SECRET key. Bypasses Row Level Security.
 *
 * Use ONLY in server code for operations that cannot run as the user
 * (e.g. scheduled jobs, verified payment-gateway callbacks, bootstrap scripts),
 * and ALWAYS after performing an explicit authorisation check.
 * The "server-only" import makes any client-side import a build error.
 */
export function createAdminClient() {
  const secret = process.env.SUPABASE_SECRET_KEY;
  if (!secret) {
    throw new Error("SUPABASE_SECRET_KEY is not set (server-only). See docs/ENVIRONMENT.md.");
  }
  const { url } = supabaseConfig();
  return createClient(url, secret, {
    auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
  });
}
