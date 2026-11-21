import { cronUnauthorised } from "@/lib/cron/auth";
import { processEvaluationBatches } from "@/lib/written/batch";

// Collecting results and marking late answers straight away can take a few minutes.
export const maxDuration = 300;

/** Called by the database scheduler (Supabase Cron, every 10 minutes): half-price marking of mock-test answers. */
export async function POST(request: Request) {
  const denied = await cronUnauthorised(request);
  if (denied) return denied;
  return Response.json(await processEvaluationBatches());
}
