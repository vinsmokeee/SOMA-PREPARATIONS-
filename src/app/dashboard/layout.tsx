import { AppShell } from "@/components/app/app-shell";
import { ExamCountdown } from "@/components/app/exam-countdown";
import { studentNav } from "@/components/app/student-nav";
import { ROLE_LABELS } from "@/lib/auth/permissions";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

// Session-dependent area: render per request.
export const instant = false;

export default async function DashboardLayout({ children }: LayoutProps<"/dashboard">) {
  const user = await requireUser("/dashboard");
  const sections = studentNav(user.isStaff);
  const primaryRole = user.roles.find((r) => r !== "student") ?? "student";
  const db = await createClient();
  const [{ data: profile }, { count: unread }] = await Promise.all([
    db.from("profiles").select("pathway, pe_exam_date, me_exam_date").eq("id", user.id).maybeSingle(),
    db.from("notifications").select("id", { count: "exact", head: true }).is("read_at", null),
  ]);
  // PE comes first; once a student has started ME, the tabs follow the ME.
  const stage = profile?.pathway === "ME" || profile?.pathway === "both" ? "ME" : "PE";
  // Exam-day countdown: the date for the exam the student is preparing for; ask until it is entered.
  const interest = profile?.pathway ? stage : null;
  const dates = { PE: profile?.pe_exam_date ?? null, ME: profile?.me_exam_date ?? null };
  const pick: "PE" | "ME" | null = interest && dates[interest] ? interest : dates.PE ? "PE" : dates.ME ? "ME" : null;
  const saved = pick ? { stage: pick, date: dates[pick] as string } : null;
  const ask = interest ? !dates[interest] : !dates.PE && !dates.ME;
  return (
    <AppShell area="student" stage={stage} unread={unread ?? 0} countdown={<ExamCountdown saved={saved} ask={ask} defaultStage={interest ?? "PE"} />} sections={sections} user={{ name: user.fullName, email: user.email, roleLabel: ROLE_LABELS[primaryRole] }}>
      {children}
    </AppShell>
  );
}
