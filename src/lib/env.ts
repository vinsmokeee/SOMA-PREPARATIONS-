import { z } from "zod";

/**
 * Public (browser-safe) environment. Only NEXT_PUBLIC_* values belong here.
 * Secrets are read exclusively in server-only modules (see lib/supabase/admin.ts).
 */
const publicSchema = z.object({
  NEXT_PUBLIC_SUPABASE_URL: z.url().optional(),
  NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY: z.string().min(20).optional(),
});

const parsed = publicSchema.safeParse({
  NEXT_PUBLIC_SUPABASE_URL: process.env.NEXT_PUBLIC_SUPABASE_URL || undefined,
  NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY: process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY || undefined,
});

export const publicEnv = parsed.success ? parsed.data : {};

export function isSupabaseConfigured(): boolean {
  return Boolean(publicEnv.NEXT_PUBLIC_SUPABASE_URL && publicEnv.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY);
}

export function supabaseConfig() {
  if (!isSupabaseConfigured()) {
    throw new Error(
      "Supabase is not configured. Set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY (see docs/ENVIRONMENT.md).",
    );
  }
  return {
    url: publicEnv.NEXT_PUBLIC_SUPABASE_URL as string,
    key: publicEnv.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY as string,
  };
}
