import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { ExamChooser } from "@/components/student/exam-flow";
import { ChooserInfo } from "@/components/student/exam-info";
import { loadPackage } from "@/lib/student/area";
import { Alert } from "@/components/ui/alert";
import { requireUser } from "@/lib/auth/dal";
import { loadExamState } from "@/lib/student/exam-state";

export const metadata: Metadata = { title: "Home" };

const NOTICES: Record<string, { tone: "success" | "warning"; text: string }> = {
  forbidden: { tone: "warning", text: "You do not have access to that area." },
  "password-updated": { tone: "success", text: "Your password has been updated." },
};

/**
 * Student home. New students choose PE or ME; returning students go straight
 * back to the exam they were working on ("continue where you left off").
 */
export default async function DashboardPage({ searchParams }: PageProps<"/dashboard">) {
  const user = await requireUser();
  const params = await searchParams;
  const notice = typeof params.notice === "string" ? NOTICES[params.notice] : undefined;
  const state = await loadExamState(user.id);
  if (!notice && params.choose !== "1" && state.lastStage) {
    redirect(state.lastStage === "PE" ? "/dashboard/pe" : "/dashboard/me");
  }
  const status = (s: "PE" | "ME") => (state.premium[s] ? state.premium[s] : s === "ME" ? "Premium only" : state.started[s] ? "Free" : null);
  return (
    <>
      {notice ? <Alert tone={notice.tone} className="mx-auto mb-4 max-w-lg">{notice.text}</Alert> : null}
      <ExamChooser firstName={user.fullName.split(" ")[0] ?? ""} status={{ PE: status("PE"), ME: status("ME") }} />
      <ChooserInfo packages={{ PE: await loadPackage("PE"), ME: await loadPackage("ME") }} />
    </>
  );
}
