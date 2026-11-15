import "server-only";
import { isSupabaseConfigured } from "@/lib/env";

/**
 * Where public data comes from.
 *  - "database": Supabase (production and any configured environment).
 *  - "fixture":  a JSON snapshot exported from the migrated database
 *                (scripts/db/export-fixtures.ts). For local UI work and automated
 *                tests WITHOUT a Supabase project. Never used when Supabase is configured.
 */
export function publicDataSource(): "database" | "fixture" | "none" {
  if (isSupabaseConfigured()) return "database";
  if (process.env.SOMA_PUBLIC_DATA === "fixture") return "fixture";
  return "none";
}
