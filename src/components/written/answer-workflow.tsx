"use client";

import { useEffect, useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { CheckCircle2, Loader2, ScanText } from "lucide-react";
import { confirmTranscriptAction, readHandwritingAction, requestEvaluationAction } from "@/app/dashboard/written/actions";
import { HandwrittenPages } from "@/components/written/handwritten-pages";
import { createPagesApi } from "@/components/written/pages-api";
import { EvaluationView, type EvaluationRow } from "@/components/written/evaluation-view";
import { cn } from "@/lib/utils";

export type WorkflowProps = {
  userId: string; answerId: string; attemptId: string; examQuestionId: string;
  mode: "typed" | "handwritten"; textAnswer: string | null; wordCount: number | null; wordLimit: number | null;
  transcript: { status: string | null; text: string | null; confidence: string | null; notes: { message?: string; retake?: boolean; page_issues?: { page: number; issue: string }[] } | null; editRatio: number | null };
  pageCount: number; canEditPages: boolean; maxPages: number; dzongkhaBeta: boolean;
  evaluation: EvaluationRow | null; allowance: { limit: number; used: number; remaining: number; plan: string } | null; reported: boolean;
  /** Free handwriting re-reads left for this answer (after that, each uses one AI evaluation). */
  freeRereadsLeft?: number | null;
};

const BUSY = new Set(["reading", "queued", "in_progress"]);

export function AnswerWorkflow(p: WorkflowProps) {
  const router = useRouter();
  const [pages, setPages] = useState(p.pageCount);
  const [text, setText] = useState(p.transcript.text ?? "");
  const [error, setError] = useState<string | null>(null);
  const [pending, setPending] = useState<string | null>(null);
  const api = useMemo(() => createPagesApi(p.userId, p.attemptId, p.examQuestionId), [p.userId, p.attemptId, p.examQuestionId]);

  const evStatus = p.evaluation?.status ?? null;
  const improving = Boolean(p.evaluation?.improved_requested_at && !p.evaluation.details?.improved_answer);
  const batchQueued = p.evaluation?.delivery === "batch" && evStatus === "queued";
  const busy = BUSY.has(p.transcript.status ?? "") || (BUSY.has(evStatus ?? "") && !batchQueued) || improving;

  // While AI work runs in the background, refresh the page every few seconds (for up to 5 minutes).
  useEffect(() => {
    if (!busy) return;
    const started = Date.now();
    const id = setInterval(() => {
      if (Date.now() - started > 5 * 60 * 1000) clearInterval(id);
      else router.refresh();
    }, 4000);
    return () => clearInterval(id);
  }, [busy, router]);

  const run = async (key: string, fn: () => Promise<{ ok: boolean; message?: string }>) => {
    setPending(key); setError(null);
    const r = await fn();
    if (!r.ok) setError(r.message ?? "Something went wrong.");
    setPending(null);
    router.refresh();
  };

  const locked = Boolean(p.evaluation && !["failed", "withdrawn"].includes(p.evaluation.status));
  const unclear = (text.match(/\[unclear\]/gi) ?? []).length;
  const [askUnclear, setAskUnclear] = useState(false);
  const ts = p.transcript.status;

  return (
    <div className="space-y-8">
      {p.mode === "handwritten" ? (
        <section aria-labelledby="pages-h" className="space-y-3">
          <h2 id="pages-h" className="text-lg font-semibold">Your answer sheets</h2>
          <HandwrittenPages api={api} initialAnswerId={p.answerId} maxPages={p.maxPages} disabled={!p.canEditPages || locked} onCountChange={setPages} />
          {p.dzongkhaBeta ? <p className="text-xs text-muted-foreground">Dzongkha handwriting recognition is in Beta: always check the text carefully.</p> : null}
        </section>
      ) : null}

      {p.mode === "handwritten" ? (
        <section aria-labelledby="text-h" className="space-y-3">
          <h2 id="text-h" className="text-lg font-semibold">Text of your answer</h2>
          {ts === "reading" ? (
            <p className="flex items-center gap-2 text-sm text-muted-foreground" role="status"><Loader2 className="size-4 animate-spin" aria-hidden /> Reading your handwriting… this usually takes under a minute.</p>
          ) : ts === "needs_review" || (ts === "confirmed" && !locked) ? (
            <div className="space-y-3">
              {p.transcript.notes?.message ? (
                <p className={cn("rounded-lg p-3 text-sm", p.transcript.confidence === "low" || p.transcript.notes.retake ? "bg-warning-soft text-warning" : "bg-muted text-foreground")}>{p.transcript.notes.message}</p>
              ) : null}
              {p.transcript.notes?.page_issues?.filter((x) => x.issue).length ? (
                <ul className="text-sm text-warning">{p.transcript.notes.page_issues.filter((x) => x.issue).map((x) => <li key={x.page}>Page {x.page}: {x.issue}</li>)}</ul>
              ) : null}
              <label htmlFor="transcript" className="text-sm font-medium text-ink">Check and correct the text read from your pages</label>
              <textarea id="transcript" value={text} onChange={(e) => setText(e.target.value)} rows={14} maxLength={60000}
                className="min-h-72 w-full rounded-lg border border-border-strong bg-background p-4 text-[16px] leading-relaxed" />
              <p className="text-xs text-muted-foreground">
                {unclear ? `${unclear} [unclear] ${unclear === 1 ? "part remains" : "parts remain"} — replace ${unclear === 1 ? "it" : "them"} with what you wrote. ` : ""}
                Correct reading mistakes only. Large changes are noted on your evaluation, and your original photos are kept.
              </p>
              {askUnclear && unclear > 0 ? (
                <p role="alert" className="rounded-lg bg-warning-soft p-3 text-sm text-warning">
                  {unclear} {unclear === 1 ? "part" : "parts"} still marked [unclear]. You can fix {unclear === 1 ? "it" : "them"} above, or confirm as it is: the AI will mark only the words it can read, so you may lose marks for the unclear parts.
                </p>
              ) : null}
              <div className="flex flex-wrap gap-2">
                <button type="button" disabled={pending !== null || !text.trim()}
                  onClick={() => (unclear > 0 && !askUnclear ? setAskUnclear(true) : run("confirm", () => confirmTranscriptAction(p.answerId, text)))}
                  className="inline-flex h-11 items-center gap-2 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground disabled:opacity-50">
                  {pending === "confirm" ? <Loader2 className="size-4 animate-spin" aria-hidden /> : <CheckCircle2 className="size-4" aria-hidden />}
                  {askUnclear && unclear > 0 ? "Confirm with unclear parts" : ts === "confirmed" ? "Save corrections" : "This matches my answer"}
                </button>
                {p.canEditPages ? <button type="button" disabled={pending !== null} onClick={() => run("read", () => readHandwritingAction(p.answerId))} className="inline-flex h-11 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted disabled:opacity-50">Read the pages again</button> : null}
              </div>
              {p.canEditPages && typeof p.freeRereadsLeft === "number" ? (
                <p className="text-xs text-muted-foreground">
                  {p.freeRereadsLeft > 0 ? `${p.freeRereadsLeft} free re-read${p.freeRereadsLeft === 1 ? "" : "s"} left for this answer. After that, each re-read uses one AI evaluation.` : "Each further re-read uses one AI evaluation. You can also correct the text yourself above, which is free."}
                </p>
              ) : null}
              {ts === "confirmed" ? <p className="flex items-center gap-1.5 text-sm text-primary"><CheckCircle2 className="size-4" aria-hidden /> Text confirmed.</p> : null}
            </div>
          ) : ts === "confirmed" ? (
            <AnswerText text={p.textAnswer} words={p.wordCount} limit={p.wordLimit} note={p.transcript.editRatio !== null && p.transcript.editRatio > 0.35 ? "This text was substantially changed after your handwriting was read." : undefined} />
          ) : pages > 0 ? (
            <div className="space-y-2">
              {ts === "failed" && p.transcript.notes?.message ? <p className="rounded-lg bg-warning-soft p-3 text-sm text-warning">{p.transcript.notes.message}</p> : null}
              <p className="text-sm text-muted-foreground">When all pages are uploaded and in order, let the AI read your handwriting. You will check the text before anything is evaluated.</p>
              <button type="button" disabled={pending !== null} onClick={() => run("read", () => readHandwritingAction(p.answerId))}
                className="inline-flex h-11 items-center gap-2 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground disabled:opacity-50">
                {pending === "read" ? <Loader2 className="size-4 animate-spin" aria-hidden /> : <ScanText className="size-4" aria-hidden />} Read my handwriting
              </button>
            </div>
          ) : (
            <p className="text-sm text-muted-foreground">Upload your answer pages first.</p>
          )}
        </section>
      ) : (
        <section aria-labelledby="text-h">
          <h2 id="text-h" className="text-lg font-semibold">Your answer</h2>
          <AnswerText text={p.textAnswer} words={p.wordCount} limit={p.wordLimit} />
        </section>
      )}

      <section aria-labelledby="eval-h" className="space-y-3">
        <h2 id="eval-h" className="text-lg font-semibold">AI evaluation</h2>
        {evStatus === "completed" && p.evaluation ? (
          <EvaluationView ev={p.evaluation} answerId={p.answerId} reported={p.reported} />
        ) : evStatus === "queued" || evStatus === "in_progress" ? (
          p.evaluation?.delivery === "batch" ? (
            <p className="flex items-start gap-2 rounded-lg bg-muted p-3 text-sm text-ink" role="status"><Loader2 className="mt-0.5 size-4 shrink-0 animate-spin" aria-hidden /> Your mock-test answer is in the marking queue. Mock answers are marked together, and your feedback will be ready within a few hours (usually within an hour). We will send you a notification — you can close this page.</p>
          ) : (
            <p className="flex items-center gap-2 text-sm text-muted-foreground" role="status"><Loader2 className="size-4 animate-spin" aria-hidden /> Evaluating your answer… this usually takes one to two minutes. You can leave this page and come back.</p>
          )
        ) : (
          <div className="space-y-2">
            {evStatus === "withdrawn" ? <p className="rounded-lg bg-muted p-3 text-sm">Your previous evaluation was withdrawn by the Soma team after review. You can request a new one; it was not counted towards your allowance.</p> : null}
            {evStatus === "failed" ? <p className="rounded-lg bg-warning-soft p-3 text-sm text-warning">{p.evaluation?.error_message ?? "The evaluation could not be completed."} This did not use up your allowance.</p> : null}
            {p.allowance ? <p className="text-sm text-muted-foreground">{p.allowance.remaining} of {p.allowance.limit} AI evaluations left. Improved answers and extra handwriting re-reads also use one.</p> : null}
            <button type="button"
              disabled={pending !== null || (p.mode === "handwritten" && ts !== "confirmed") || !(p.textAnswer ?? "").trim() || (p.allowance?.remaining ?? 0) <= 0}
              onClick={() => run("evaluate", () => requestEvaluationAction(p.answerId))}
              className="inline-flex h-11 items-center gap-2 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground disabled:opacity-50">
              {pending === "evaluate" ? <Loader2 className="size-4 animate-spin" aria-hidden /> : null}
              {evStatus === "failed" ? "Try again" : "Get AI evaluation"}
            </button>
            {p.mode === "handwritten" && ts !== "confirmed" ? <p className="text-xs text-muted-foreground">Confirm the text of your handwritten answer first.</p> : null}
            <p className="text-xs text-muted-foreground">AI evaluations are indicative practice feedback, not official RCSC marks.</p>
          </div>
        )}
      </section>
      {error ? <p role="alert" className="text-sm font-medium text-danger">{error}</p> : null}
    </div>
  );
}

function AnswerText({ text, words, limit, note }: { text: string | null; words: number | null; limit: number | null; note?: string }) {
  if (!text?.trim()) return <p className="mt-2 text-sm text-muted-foreground">No answer was written.</p>;
  return (
    <div className="mt-2">
      <p className="whitespace-pre-wrap rounded-lg border border-border bg-muted/30 p-4 leading-relaxed text-ink">{text}</p>
      <p className="mt-1 text-xs text-muted-foreground">{words ?? 0} words{limit ? ` (suggested about ${limit})` : ""}</p>
      {note ? <p className="mt-1 text-xs text-warning">{note}</p> : null}
    </div>
  );
}
