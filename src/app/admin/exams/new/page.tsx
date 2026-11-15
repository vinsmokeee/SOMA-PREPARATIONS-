import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ExamSettingsForm } from "@/components/admin/exam-settings-form";
import { requirePermission } from "@/lib/auth/dal";
import { loadExamLookups } from "@/lib/admin/exam-lookups";

export const metadata: Metadata = { title: "New examination" };

export default async function NewExamPage() {
  await requirePermission("exams.manage", "/admin/exams/new");
  const lookups = await loadExamLookups();
  return (
    <>
      <PageTitle title="New examination" description="Create the examination, then add questions to it." />
      <ExamSettingsForm
        lookups={lookups}
        exam={{ id: null, title: "", slug: "", description: null, instructions: null, stage: "PE", kind: "sample", cycle_id: null, paper_id: null, category_id: null, duration_minutes: 30, negative_mark_per_wrong: 0, omr_mode: true, is_free: true, shuffle_questions: false }}
      />
    </>
  );
}
