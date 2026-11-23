import type { Metadata } from "next";
import { notFound, redirect } from "next/navigation";
import { PaperHome } from "@/components/student/paper-home";
import { can, requireUser } from "@/lib/auth/dal";
import { loadMeProgress } from "@/lib/student/area";
import { loadExamState } from "@/lib/student/exam-state";

export const metadata: Metadata = { title: "ME paper" };

/** One ME paper of the student's entry: practise, mock paper and progress. ME Premium only. */
export default async function MePaperPage({ params }: { params: Promise<{ paperId: string }> }) {
  const { paperId } = await params;
  const user = await requireUser(`/dashboard/me/paper/${paperId}`);
  const state = await loadExamState(user.id);
  if (!state.premium.ME) redirect("/dashboard/me#join-me");
  if (!state.entry.confirmed && !can(user, "users.manage")) redirect("/dashboard/me"); // confirm the subject first
  const paper = (await loadMeProgress()).find((p) => p.id === paperId);
  if (!paper) notFound();
  return <PaperHome p={paper} />;
}
