import { revalidateTag } from "next/cache";
import { CACHE_TAGS } from "@/lib/data/public";
import { runPipeline } from "@/lib/ca/pipeline";
import { runCommerceMaintenance } from "@/lib/commerce/maintenance";
import { cronUnauthorised } from "@/lib/cron/auth";

// The pipeline may take a few minutes.
export const maxDuration = 300;

/**
 * Called by the database scheduler (Supabase Cron, every 3 hours).
 * Authorised by a bearer token that only the database and the server key can read.
 */
export async function POST(request: Request) {
  const denied = await cronUnauthorised(request);
  if (denied) return denied;
  // Commerce housekeeping first (fast), then the current-affairs pipeline.
  const commerce = await runCommerceMaintenance().catch((e) => ({ error: e instanceof Error ? e.message : "failed" }));
  const result = await runPipeline({ trigger: "schedule" });
  revalidateTag(CACHE_TAGS.currentAffairs, "max");
  return Response.json({ status: result.status, commerce });
}
