import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ArrowDown, ArrowUp, ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { SelectField, TextField } from "@/components/app/fields";
import { ExamSettingsForm, type ExamSettings } from "@/components/admin/exam-settings-form";
import { PreviewExamButton } from "@/components/admin/preview-exam-button";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { loadExamLookups } from "@/lib/admin/exam-lookups";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { TYPE_LABELS, type QuestionType } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { addExamQuestion, moveExamQuestion, removeExamQuestion, setExamStatus } from "../actions";

export const metadata: Metadata = { title: "Edit examination" };

type EQ = { id: string; position: number; section: string | null; marks: number | null; questions: { id: string; stem: string; status: string; question_type: QuestionType; marks: number; subjects: { name: string } | null } };

export default async function EditExamPage({ params }: PageProps<"/admin/exams/[id]">) {
  const { id } = await params;
  await requirePermission("exams.manage", `/admin/exams/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const [{ data: exam }, { data: eqs }, { count: attempts }, lookups] = await Promise.all([
    db.from("exams").select("*").eq("id", id).maybeSingle(),
    db.from("exam_questions").select("id, position, section, marks, questions(id, stem, status, question_type, marks, subjects(name))").eq("exam_id", id).order("position"),
    db.from("exam_attempts").select("id", { count: "exact", head: true }).eq("exam_id", id),
    loadExamLookups(),
  ]);
  if (!exam) notFound();
  const items = (eqs ?? []) as unknown as EQ[];
  const used = new Set(items.map((i) => i.questions.id));
  const { data: candidates } = await db
    .from("questions")
    .select("id, stem, status, subjects(name)")
    .eq("stage", exam.stage)
    .in("status", ["published", "verified", "awaiting_review", "draft"])
    .order("status")
    .limit(300);
  const available = ((candidates ?? []) as unknown as { id: string; stem: string; status: string; subjects: { name: string } | null }[]).filter((c) => !used.has(c.id));
  const unpublished = items.filter((i) => i.questions.status !== "published").length;
  const totalMarks = items.reduce((s, i) => s + Number(i.marks ?? i.questions.marks), 0);

  return (
    <>
      <Link href="/admin/exams" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Examinations
      </Link>
      <div className="mt-3">
        <PageTitle
          title={exam.title}
          description={<span className="inline-flex flex-wrap items-center gap-2"><Badge tone={STATUS_TONES[exam.status]}>{STATUS_LABELS[exam.status]}</Badge> {items.length} questions · {totalMarks} marks · {attempts ?? 0} attempts</span>}
          actions={
            exam.status === "published" ? (
              <Link href={`/dashboard/exams/${exam.slug}`} className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted">View as student</Link>
            ) : items.length > 0 ? (
              <PreviewExamButton examId={exam.id} />
            ) : undefined
          }
        />
      </div>

      {exam.status !== "published" && items.length > 0 ? (
        <Alert tone="info" className="mb-6">
          “Preview as candidate” lets you sit this draft examination exactly as a student would, including unpublished
          questions. Your preview attempts appear in your own examination history; students cannot see this examination.
        </Alert>
      ) : null}
      <section className="rounded-xl border border-border p-4 sm:p-5">
        <h2 className="font-semibold text-ink">Publishing</h2>
        {exam.status !== "published" && unpublished > 0 ? (
          <Alert tone="warning" className="mt-3">{unpublished} {unpublished === 1 ? "question is" : "questions are"} not yet published. Review and publish {unpublished === 1 ? "it" : "them"} in the question bank first.</Alert>
        ) : null}
        <div className="mt-3 flex flex-wrap gap-3">
          {exam.status !== "published" ? (
            <ActionForm key={`pub-${exam.updated_at}`} action={setExamStatus} submitLabel="Publish examination" className="space-y-2">
              <input type="hidden" name="id" value={exam.id} />
              <input type="hidden" name="status" value="published" />
            </ActionForm>
          ) : (
            <ActionForm key={`unpub-${exam.updated_at}`} action={setExamStatus} submitLabel="Unpublish" variant="secondary" confirm="Students will no longer see this examination. Attempts in progress can still be finished. Continue?" className="space-y-2">
              <input type="hidden" name="id" value={exam.id} />
              <input type="hidden" name="status" value="draft" />
            </ActionForm>
          )}
        </div>
      </section>

      <section className="mt-8">
        <h2 className="text-lg font-semibold">Questions</h2>
        {(attempts ?? 0) > 0 ? <p className="mt-1 text-sm text-muted-foreground">Students have taken this examination, so questions can be reordered but not removed.</p> : null}
        {items.length === 0 ? <p className="mt-3 text-sm text-muted-foreground">No questions yet.</p> : (
          <ol className="mt-3 divide-y divide-border rounded-xl border border-border">
            {items.map((i, idx) => (
              <li key={i.id} className="flex flex-col gap-2 p-3 sm:flex-row sm:items-center">
                <span className="w-8 shrink-0 text-sm font-semibold tabular-nums text-ink">{i.position}.</span>
                <div className="min-w-0 flex-1">
                  <Link href={`/admin/questions/${i.questions.id}`} className="line-clamp-2 text-[15px] text-ink hover:text-primary">{i.questions.stem}</Link>
                  <p className="mt-0.5 flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                    <Badge tone={STATUS_TONES[i.questions.status]}>{STATUS_LABELS[i.questions.status]}</Badge>
                    {TYPE_LABELS[i.questions.question_type]} · {Number(i.marks ?? i.questions.marks)} marks · {i.questions.subjects?.name ?? "No subject"}{i.section ? ` · ${i.section}` : ""}
                  </p>
                </div>
                <div className="flex items-center gap-1">
                  <ActionForm key={`up-${i.id}-${i.position}`} action={moveExamQuestion} submitLabel="↑" variant="secondary" className="space-y-0 [&_button]:h-8 [&_button]:px-2.5 [&_p]:hidden">
                    <input type="hidden" name="id" value={i.id} /><input type="hidden" name="direction" value="up" />
                  </ActionForm>
                  <ActionForm key={`down-${i.id}-${i.position}`} action={moveExamQuestion} submitLabel="↓" variant="secondary" className="space-y-0 [&_button]:h-8 [&_button]:px-2.5 [&_p]:hidden">
                    <input type="hidden" name="id" value={i.id} /><input type="hidden" name="direction" value="down" />
                  </ActionForm>
                  {(attempts ?? 0) === 0 && exam.status !== "published" ? (
                    <ActionForm key={`rm-${i.id}`} action={removeExamQuestion} submitLabel="Remove" variant="secondary" className="space-y-0 [&_button]:h-8">
                      <input type="hidden" name="id" value={i.id} />
                    </ActionForm>
                  ) : null}
                </div>
                <span className="sr-only">{idx === 0 ? <ArrowUp /> : <ArrowDown />}</span>
              </li>
            ))}
          </ol>
        )}
        {exam.status !== "published" ? (
          <div className="mt-4 rounded-xl border border-border bg-muted/40 p-4">
            {available.length === 0 ? (
              <p className="text-sm text-muted-foreground">No more {exam.stage} questions available. <Link href={`/admin/questions/new?stage=${exam.stage}`} className="font-medium text-primary hover:underline">Write a new question</Link>.</p>
            ) : (
              <ActionForm key={`add-${items.length}`} action={addExamQuestion} submitLabel="Add question">
                <input type="hidden" name="exam_id" value={exam.id} />
                <div className="grid gap-3 sm:grid-cols-[1fr_200px]">
                  <SelectField
                    name="question_id"
                    label={`Add a ${exam.stage} question`}
                    options={available.map((c) => ({ value: c.id, label: `[${STATUS_LABELS[c.status]}] ${c.subjects?.name ? `${c.subjects.name} — ` : ""}${c.stem.slice(0, 90)}` }))}
                  />
                  <TextField name="section" label="Section (optional)" />
                </div>
              </ActionForm>
            )}
          </div>
        ) : (
          <p className="mt-3 text-sm text-muted-foreground">Unpublish the examination to add or remove questions.</p>
        )}
      </section>

      <section className="mt-10">
        <h2 className="mb-3 text-lg font-semibold">Settings</h2>
        <ExamSettingsForm lookups={lookups} exam={{ ...(exam as ExamSettings), negative_mark_per_wrong: Number(exam.negative_mark_per_wrong) }} />
      </section>
    </>
  );
}
