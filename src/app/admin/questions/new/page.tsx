import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { emptyQuestion, QuestionEditor } from "@/components/admin/question-editor";
import { requirePermission } from "@/lib/auth/dal";
import { loadQuestionLookups } from "@/lib/admin/question-lookups";

export const metadata: Metadata = { title: "New question" };

export default async function NewQuestionPage({ searchParams }: PageProps<"/admin/questions/new">) {
  await requirePermission("questions.create", "/admin/questions/new");
  const p = await searchParams;
  const lookups = await loadQuestionLookups();
  return (
    <>
      <PageTitle title="New question" description="New questions are saved as drafts. Submit them for review when ready." />
      <QuestionEditor initial={emptyQuestion(p.stage === "ME" ? "ME" : "PE")} lookups={lookups} />
    </>
  );
}
