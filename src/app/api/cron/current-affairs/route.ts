import { timingSafeEqual } from "node:crypto";
import { revalidateTag } from "next/cache";
import { CACHE_TAGS } from "@/lib/data/public";
import { runPipeline } from "@/lib/ca/pipeline";
import { runCommerceMaintenance } from "@/lib/commerce/maintenance";
import { createAdminClient } from "@/lib/supabase/admin";

// The pipeline may take a few minutes.
export const maxDuration = 300;

/**
 * Called by the database scheduler (Supabase Cron, every 3 hours).
 * Authorised by a bearer token that only the database and the server key can read.
 */
export async function POST(request: Request) {
  const header = request.headers.get("authorization") ?? "";
  const given = header.startsWith("Bearer ") ? header.slice(7) : "";
  if (!given || given.length > 200) return Response.json({ error: "unauthorised" }, { status: 401 });
  let expected = "";
  try {
    const db = createAdminClient();
    const { data } = await db.from("ca_scheduler").select("token").eq("id", 1).maybeSingle();
    expected = data?.token ?? "";
  } catch {
    return Response.json({ error: "not configured" }, { status: 503 });
  }
  const a = Buffer.from(given), b = Buffer.from(expected);
  if (!expected || a.length !== b.length || !timingSafeEqual(a, b)) return Response.json({ error: "unauthorised" }, { status: 401 });
  // Commerce housekeeping first (fast), then the current-affairs pipeline.
  const commerce = await runCommerceMaintenance().catch((e) => ({ error: e instanceof Error ? e.message : "failed" }));
  const result = await runPipeline({ trigger: "schedule" });
  revalidateTag(CACHE_TAGS.currentAffairs, "max");
  return Response.json({ status: result.status, commerce });
}
