import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { QuestionEditor, type EditorQuestion } from "@/components/admin/question-editor";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Textarea } from "@/components/ui/input";
import { can, requirePermission } from "@/lib/auth/dal";
import { loadQuestionLookups, STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { reviewQuestionAction } from "../actions";

export const metadata: Metadata = { title: "Edit question" };

type Action = { action: string; label: string; variant: "primary" | "secondary" | "danger"; needsComment?: boolean; permission: "questions.create" | "questions.review" | "questions.publish" };

const TRANSITIONS: Record<string, Action[]> = {
  draft: [{ action: "submit", label: "Submit for review", variant: "primary", permission: "questions.create" }, { action: "reject", label: "Reject", variant: "danger", needsComment: true, permission: "questions.review" }],
  ai_generated: [{ action: "submit", label: "Submit for review", variant: "primary", permission: "questions.create" }, { action: "reject", label: "Reject", variant: "danger", needsComment: true, permission: "questions.review" }],
  revision_requested: [{ action: "submit", label: "Resubmit for review", variant: "primary", permission: "questions.create" }, { action: "reject", label: "Reject", variant: "danger", needsComment: true, permission: "questions.review" }],
  awaiting_review: [
    { action: "verify", label: "Verify", variant: "primary", permission: "questions.review" },
    { action: "request_revision", label: "Request revision", variant: "secondary", needsComment: true, permission: "questions.review" },
    { action: "reject", label: "Reject", variant: "danger", needsComment: true, permission: "questions.review" },
  ],
  verified: [
    { action: "publish", label: "Publish", variant: "primary", permission: "questions.publish" },
    { action: "request_revision", label: "Request revision", variant: "secondary", needsComment: true, permission: "questions.review" },
  ],
  published: [{ action: "unpublish", label: "Unpublish", variant: "secondary", permission: "questions.publish" }],
  rejected: [{ action: "submit", label: "Resubmit for review", variant: "secondary", permission: "questions.create" }],
  archived: [],
};

export default async function EditQuestionPage({ params, searchParams }: PageProps<"/admin/questions/[id]">) {
  const { id } = await params;
  const user = await requirePermission("admin.access", `/admin/questions/${id}`);
  const sp = await searchParams;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const [{ data: q }, { data: options }, { data: rubric }, { data: refs }, { data: reviews }, { data: usage }, lookups] = await Promise.all([
    db.from("questions").select("*").eq("id", id).maybeSingle(),
    db.from("question_options").select("id, body, is_correct, position").eq("question_id", id).order("position"),
    db.from("rubric_criteria").select("id, label, description, max_marks, position").eq("question_id", id).order("position"),
    db.from("question_references").select("citation, url").eq("question_id", id),
    db.from("content_reviews").select("id, action, from_status, to_status, comment, created_at, reviewer_id").eq("entity_type", "question").eq("entity_id", id).order("created_at", { ascending: false }),
    db.from("exam_questions").select("exams(title, status)").eq("question_id", id),
    loadQuestionLookups(),
  ]);
  if (!q) notFound();
  const aiNote = q.ai_job_id && can(user, "ai.run") ? await loadAiNote(db, q.ai_job_id, q.id) : null;

  const initial: EditorQuestion = {
    id: q.id,
    stage: q.stage,
    question_type: q.question_type,
    stem: q.stem,
    explanation: q.explanation ?? "",
    model_answer: q.model_answer ?? "",
    word_limit: q.word_limit?.toString() ?? "",
    subject_id: q.subject_id ?? "",
    topic_id: q.topic_id ?? "",
    paper_id: q.paper_id ?? "",
    category_id: q.category_id ?? "",
    specialisation_id: q.specialisation_id ?? "",
    subject_group_id: q.subject_group_id ?? "",
    source_year: q.source_year?.toString() ?? "",
    source_page: q.source_page?.toString() ?? "",
    difficulty: q.difficulty,
    marks: String(Number(q.marks)),
    estimated_seconds: q.estimated_seconds?.toString() ?? "",
    is_free_sample: q.is_free_sample,
    options: (options ?? []).map((o) => ({ id: o.id, body: o.body, is_correct: o.is_correct })),
    rubric: (rubric ?? []).map((r) => ({ id: r.id, label: r.label, description: r.description, max_marks: String(Number(r.max_marks)) })),
    references: (refs ?? []).map((r) => ({ citation: r.citation, url: r.url ?? "" })),
    key_points: ((q.key_points ?? []) as { point: string; marks: number | null }[]).map((k) => ({ point: k.point, marks: k.marks === null ? "" : String(k.marks) })),
    alternative_answers: q.alternative_answers ?? "",
  };
  const locked = ["verified", "published"].includes(q.status) && !can(user, "questions.review");
  const actions = (TRANSITIONS[q.status] ?? []).filter((a) => can(user, a.permission));
  const exams = ((usage ?? []) as unknown as { exams: { title: string; status: string } | null }[]).map((u) => u.exams).filter(Boolean);

  return (
    <>
      <Link href="/admin/questions" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Question bank
      </Link>
      <div className="mt-3">
        <PageTitle
          title="Edit question"
          description={
            <span className="inline-flex flex-wrap items-center gap-2">
              <Badge tone={STATUS_TONES[q.status]}>{STATUS_LABELS[q.status]}</Badge>
              <span>Version {q.version} · updated {formatDate(q.updated_at)}{ORIGIN_NOTES[q.origin as string] ?? ""}</span>
            </span>
          }
        />
      </div>
      {sp.saved === "1" ? <Alert tone="success" className="mb-6">Question created as a draft.</Alert> : null}

      <div className="grid gap-8 xl:grid-cols-[1fr_320px]">
        <QuestionEditor
          key={q.updated_at}
          initial={initial}
          lookups={lookups}
          readOnlyReason={locked ? "This question has been verified. Only reviewers can change its content." : undefined}
        />
        <aside className="space-y-6 xl:sticky xl:top-8 xl:self-start">
          {aiNote ? (
            <section className="rounded-xl border border-warning/40 bg-warning-soft/40 p-4 text-sm">
              <h2 className="font-semibold text-ink">AI draft — check before verifying</h2>
              <p className="mt-1 text-muted-foreground">Drafted by {aiNote.model}{aiNote.fallback ? " (fallback model)" : ""}. Model confidence: {aiNote.confidence ?? "—"}.</p>
              {aiNote.notes ? <p className="mt-2 whitespace-pre-wrap">{aiNote.notes}</p> : null}
              {aiNote.topic ? <p className="mt-2 text-xs text-muted-foreground">Suggested topic: {aiNote.topic}</p> : null}
              <p className="mt-2 text-xs text-muted-foreground">Verify every fact, the answer key and any references against a reliable source. AI references can be wrong.</p>
            </section>
          ) : null}
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Review</h2>
            {actions.length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No actions available for you at this status.</p> : null}
            <div className="mt-3 space-y-3">
              {actions.map((a) => (
                <ActionForm key={`${a.action}-${q.updated_at}`} action={reviewQuestionAction} submitLabel={a.label} variant={a.variant} className="space-y-2">
                  <input type="hidden" name="id" value={q.id} />
                  <input type="hidden" name="action" value={a.action} />
                  {a.needsComment ? <Textarea name="comment" rows={2} placeholder="What needs to change? (required)" aria-label={`Comment for ${a.label}`} className="min-h-16 text-sm" /> : null}
                </ActionForm>
              ))}
            </div>
            <p className="mt-3 text-xs text-muted-foreground">Verify checks: subject chosen; MCQs have one correct option and an explanation; written questions have a model answer.</p>
          </section>
          {exams.length ? (
            <section className="rounded-xl border border-border p-4 text-sm">
              <h2 className="font-semibold text-ink">Used in</h2>
              <ul className="mt-2 space-y-1">{exams.map((e, i) => <li key={i}>{e!.title} <span className="text-muted-foreground">({e!.status})</span></li>)}</ul>
            </section>
          ) : null}
          <section className="rounded-xl border border-border p-4 text-sm">
            <h2 className="font-semibold text-ink">History</h2>
            {(reviews ?? []).length === 0 ? <p className="mt-2 text-muted-foreground">No review activity yet.</p> : (
              <ul className="mt-2 space-y-2">
                {(reviews ?? []).map((r) => (
                  <li key={r.id}>
                    <span className="text-ink">{STATUS_LABELS[r.from_status ?? ""] ?? "—"} → {STATUS_LABELS[r.to_status ?? ""] ?? "—"}</span>
                    <span className="block text-xs text-muted-foreground">{formatDate(r.created_at)}</span>
                    {r.comment ? <span className="block whitespace-pre-wrap text-muted-foreground">“{r.comment}”</span> : null}
                  </li>
                ))}
              </ul>
            )}
          </section>
        </aside>
      </div>
    </>
  );
}

async function loadAiNote(db: Awaited<ReturnType<typeof createClient>>, jobId: string, questionId: string) {
  const { data } = await db.from("ai_jobs").select("model, output").eq("id", jobId).maybeSingle();
  if (!data) return null;
  const out = (data.output ?? {}) as { created?: { id: string; confidence?: string; fact_check_notes?: string; topic_suggestion?: string }[]; used_fallback?: boolean };
  const c = out.created?.find((x) => x.id === questionId);
  return { model: data.model as string, fallback: Boolean(out.used_fallback), confidence: c?.confidence, notes: c?.fact_check_notes, topic: c?.topic_suggestion };
}

const ORIGIN_NOTES: Record<string, string> = {
  ai_generated: " · AI-generated original",
  ai_variation: " · AI variation of another question",
  historical_official: " · From an official RCSC paper",
  current_affairs: " · From current affairs",
};
