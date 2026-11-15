"use client";

import { createBrowserClient } from "@supabase/ssr";
import type { SupabaseClient } from "@supabase/supabase-js";
import { isSupabaseConfigured, supabaseConfig } from "@/lib/env";

let browserClient: SupabaseClient | null = null;

/** Browser Supabase client (publishable key only). Returns null when not configured. */
export function getBrowserClient(): SupabaseClient | null {
  if (!isSupabaseConfigured()) return null;
  if (!browserClient) {
    const { url, key } = supabaseConfig();
    browserClient = createBrowserClient(url, key);
  }
  return browserClient;
}
