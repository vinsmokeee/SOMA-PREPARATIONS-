import "server-only";
import type { PracticeOptions, Performance } from "@/lib/analytics";
import { createClient } from "@/lib/supabase/server";

/** Loads the signed-in student's analytics and practice options for both stages. */
export async function loadLearningData() {
  const db = await createClient();
  const [perf, pe, me] = await Promise.all([
    db.rpc("my_performance", { _stage: null }),
    db.rpc("practice_options", { _stage: "PE" }),
    db.rpc("practice_options", { _stage: "ME" }),
  ]);
  return {
    performance: (perf.data ?? null) as Performance | null,
    options: { PE: (pe.data ?? undefined) as PracticeOptions | undefined, ME: (me.data ?? undefined) as PracticeOptions | undefined },
    error: Boolean(perf.error),
  };
}
