import type { Metadata } from "next";
import { LastMinuteSummary, type Summary } from "@/components/student/last-minute-summary";
import { requireUser } from "@/lib/auth/dal";
import { pageStage } from "@/lib/student/default-stage";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Last-minute summary" };

export default async function LastMinutePage({ searchParams }: PageProps<"/dashboard/last-minute">) {
  const user = await requireUser("/dashboard/last-minute");
  const sp = await searchParams;
  const db = await createClient();
  const stage = await pageStage(db, user.id, sp.stage);
  const { data } = await db.rpc("my_last_minute_summary", { _stage: stage });
  const s = (data ?? { premium: false, answered: 0, sections: [], mistakes: [], key_past: [] }) as Summary;
  return <LastMinuteSummary stage={stage} s={s} />;
}
