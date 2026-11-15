import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { ExamRoomClient } from "@/components/exam/exam-room-client";
import { requireUser } from "@/lib/auth/dal";
import type { AttemptPaper } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Examination", robots: { index: false } };
export const instant = false;

export default async function ExamPage({ params }: PageProps<"/exam/[attemptId]">) {
  const { attemptId } = await params;
  await requireUser(`/exam/${attemptId}`);
  if (!/^[0-9a-f-]{36}$/i.test(attemptId)) notFound();

  const supabase = await createClient();
  const { data, error } = await supabase.rpc("get_attempt_paper", { _attempt_id: attemptId });
  if (error || !data) notFound();
  const paper = data as AttemptPaper;
  if (paper.attempt.status !== "in_progress") redirect(`/dashboard/results/${attemptId}`);

  return <ExamRoomClient paper={paper} />;
}
