import type { Metadata } from "next";
import { PausedExams, type PausedExam } from "@/components/student/paused-exams";
import { requireUser } from "@/lib/auth/dal";
import { pageStage } from "@/lib/student/default-stage";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Paused exam" };

export default async function PausedPage({ searchParams }: PageProps<"/dashboard/paused">) {
  const user = await requireUser("/dashboard/paused");
  const sp = await searchParams;
  const db = await createClient();
  const stage = await pageStage(db, user.id, sp.stage);
  const { data } = await db.rpc("my_paused_exams");
  return <PausedExams stage={stage} exams={(data ?? []) as PausedExam[]} />;
}
