import "server-only";
import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import { supabaseConfig } from "@/lib/env";

/**
 * Client for sending e-mail links that work in ANY browser (founder, 21 Nov 2026: links opened from the Mail or
 * Gmail app failed and sent people back to sign in). The default (PKCE) flow only works in the browser that asked
 * for the link; the implicit flow puts the session in the link itself, read by /auth/link.
 */
export function emailLinkClient(): SupabaseClient {
  const { url, key } = supabaseConfig();
  return createClient(url, key, { auth: { flowType: "implicit", persistSession: false, autoRefreshToken: false, detectSessionInUrl: false } });
}
