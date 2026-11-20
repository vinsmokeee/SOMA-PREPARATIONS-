import type { Metadata } from "next";
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { AnswerWorkflow, type WorkflowProps } from "@/components/written/answer-workflow";
import type { EvaluationRow } from "@/components/written/evaluation-view";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import type { AttemptResult } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { formatDate, requestTimeMs } from "@/lib/utils";

export const metadata: Metadata = { title: "Written answer" };
// Background AI work started from this page may take a few minutes.
export const maxDuration = 300;

type Row = {
  id: string; attempt_id: string; exam_question_id: string; answer_mode: "typed" | "handwritten"; text_answer: string | null; word_count: number | null;
  transcript_status: string | null; transcript_text: string | null; transcript_confidence: string | null; transcript_notes: WorkflowProps["transcript"]["notes"];
  transcript_edit_ratio: number | null; saved_at: string;
  exam_attempts: { status: string; submitted_at: string | null; deadline_at: string; exams: { owner_id: string | null; title: string } | null } | null;
  answer_pages: { count: number }[];
};

export default async function WrittenAnswerPage({ params }: PageProps<"/dashboard/written/[answerId]">) {
  const { answerId } = await params;
  const user = await requireUser(`/dashboard/written/${answerId}`);
  if (!/^[0-9a-f-]{36}$/i.test(answerId)) notFound();
  const db = await createClient();
  const { data } = await db
    .from("attempt_answers")
    .select("id, attempt_id, exam_question_id, answer_mode, text_answer, word_count, transcript_status, transcript_text, transcript_confidence, transcript_notes, transcript_edit_ratio, saved_at, exam_attempts!inner(status, submitted_at, deadline_at, user_id, exams!exam_attempts_exam_id_fkey(owner_id, title)), answer_pages(count)")
    .eq("id", answerId)
    .eq("exam_attempts.user_id", user.id)
    .maybeSingle();
  const a = data as unknown as Row | null;
  if (!a) notFound();
  if (a.exam_attempts?.status === "in_progress") redirect(`/exam/${a.attempt_id}`);

  const [{ data: result }, { data: evs }, { data: allowance }, { data: cfg }, { data: reports }] = await Promise.all([
    db.rpc("get_attempt_result", { _attempt_id: a.attempt_id }),
    db.from("evaluations").select("id, status, score, max_score, scored, confidence, weakness_tags, rubric_scores, details, error_message, completed_at, improved_requested_at, assigned_at")
      .eq("answer_id", answerId).eq("method", "ai_feedback").order("assigned_at", { ascending: false }).limit(1),
    db.rpc("my_evaluation_allowance"),
    db.rpc("evaluation_config"),
    db.from("evaluation_reports").select("evaluation_id").eq("user_id", user.id),
  ]);
  const q = (result as AttemptResult | null)?.questions.find((x) => x.exam_question_id === a.exam_question_id);
  if (!q) notFound();
  const ev = (evs?.[0] ?? null) as EvaluationRow | null;
  const config = (cfg ?? {}) as { upload_window_minutes?: number; max_pages?: number; dzongkha_handwriting?: boolean };
  const att = a.exam_attempts!;
  const practice = Boolean(att.exams?.owner_id);
  const closedAt = Math.min(new Date(att.submitted_at ?? att.deadline_at).getTime(), new Date(att.deadline_at).getTime());
  const windowEnds = closedAt + (config.upload_window_minutes ?? 15) * 60 * 1000;
  const canEditPages = practice || requestTimeMs() <= windowEnds;
  const minutesLeft = Math.max(0, Math.round((windowEnds - requestTimeMs()) / 60000));

  return (
    <div className="mx-auto max-w-3xl">
      <Link href="/dashboard/written/history" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> My written answers
      </Link>
      <div className="mt-3 flex flex-wrap gap-2">
        <Badge tone="solid">ME written answer</Badge>
        <Badge tone="outline">{a.answer_mode === "handwritten" ? "Handwritten" : "Typed"}</Badge>
        <Badge tone="neutral">{practice ? "Practice" : "Examination simulation"}</Badge>
      </div>
      <p className="mt-3 text-sm text-muted-foreground">{att.exams?.title} · {formatDate(a.saved_at)}{q.subject ? ` · ${q.subject}` : ""}</p>
      <h1 className="mt-2 whitespace-pre-wrap font-serif text-2xl font-semibold leading-snug">{q.stem}</h1>
      <p className="mt-2 text-sm text-muted-foreground">{Number(q.marks)} marks{q.word_limit ? ` · about ${q.word_limit} words` : ""}</p>
      {!practice && a.answer_mode === "handwritten" && canEditPages && !ev ? (
        <p className="mt-4 rounded-lg bg-warning-soft p-3 text-sm text-warning">You have about {minutesLeft} minute{minutesLeft === 1 ? "" : "s"} left to add or rearrange answer-sheet photos for this examination.</p>
      ) : null}

      <div className="mt-8">
        <AnswerWorkflow
          key={`${a.transcript_status}-${a.transcript_text?.length ?? 0}-${ev?.status ?? "none"}`}
          userId={user.id} answerId={a.id} attemptId={a.attempt_id} examQuestionId={a.exam_question_id}
          mode={a.answer_mode} textAnswer={a.text_answer} wordCount={a.word_count} wordLimit={q.word_limit}
          transcript={{ status: a.transcript_status, text: a.transcript_text, confidence: a.transcript_confidence, notes: a.transcript_notes, editRatio: a.transcript_edit_ratio === null ? null : Number(a.transcript_edit_ratio) }}
          pageCount={a.answer_pages?.[0]?.count ?? 0} canEditPages={canEditPages} maxPages={config.max_pages ?? 10} dzongkhaBeta={config.dzongkha_handwriting !== false}
          evaluation={ev} allowance={allowance as WorkflowProps["allowance"]} reported={(reports ?? []).some((r) => r.evaluation_id === ev?.id)}
        />
      </div>

      {q.model_answer || q.rubric.length ? (
        <details className="mt-10 rounded-xl border border-border p-5">
          <summary className="cursor-pointer font-semibold text-ink">Model answer and marking rubric</summary>
          {q.model_answer ? <p className="mt-3 whitespace-pre-wrap leading-relaxed">{q.model_answer}</p> : null}
          {q.rubric.length ? (
            <ul className="mt-3 space-y-1 text-sm">{q.rubric.map((r) => <li key={r.label}><span className="font-medium">{r.label}</span> ({Number(r.max_marks)} marks){r.description ? ` — ${r.description}` : ""}</li>)}</ul>
          ) : null}
          <p className="mt-3 text-xs text-muted-foreground">Prepared by Soma for practice — not an official RCSC answer.</p>
        </details>
      ) : null}
    </div>
  );
}
