import "server-only";
import { createClient } from "@supabase/supabase-js";
import { supabaseConfig } from "@/lib/env";

/**
 * Cookie-less, anonymous Supabase client for PUBLIC data (RLS "anon" role).
 * Safe to use inside `"use cache"` functions because it never reads the request.
 */
export function createPublicClient() {
  const { url, key } = supabaseConfig();
  return createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
  });
}
