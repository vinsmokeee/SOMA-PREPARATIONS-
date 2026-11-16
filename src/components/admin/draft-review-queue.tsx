"use client";

import Link from "next/link";
import { useActionState, useState } from "react";
import { approveAndPublishDraftsAction, approveDraftsAction, rejectDraftsAction } from "@/app/admin/ai/variation-actions";
import type { ActionState } from "@/components/app/action-form";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { variationLabel } from "@/lib/ai/question-variations";
import { cn } from "@/lib/utils";

export type ReviewDraft = {
  id: string;
  status: string;
  stem: string;
  question_type: string;
  origin: string;
  variation_type: string | null;
  difficulty: string;
  subject: string | null;
  options: { body: string; is_correct: boolean }[];
  explanation: string | null;
  model_answer: string | null;
  ai_review: { verdict?: string; issues?: string[]; what_changed?: string; fact_check_notes?: string; checker_notes?: string; concept?: string } | null;
  source: { id: string; stem: string; origin: string } | null;
};

export function DraftReviewQueue({ drafts, canPublish }: { drafts: ReviewDraft[]; canPublish: boolean }) {
  // Separate actions for the two approve buttons, so "publish" never depends on
  // which submit button the browser reports.
  const [publishState, approvePublish, publishing] = useActionState(approveAndPublishDraftsAction, { status: "idle" } as ActionState);
  const [approveState, approve, approving] = useActionState(approveDraftsAction, { status: "idle" } as ActionState);
  const [rejectState, reject, rejecting] = useActionState(rejectDraftsAction, { status: "idle" } as ActionState);
  const [picked, setSelected] = useState<Set<string>>(new Set());
  // Drafts that were approved or rejected leave the list; never count them as selected.
  const selected = new Set(drafts.map((d) => d.id).filter((id) => picked.has(id)));
  const toggle = (id: string) => setSelected((s) => { const n = new Set(s); if (n.has(id)) n.delete(id); else n.add(id); return n; });
  const passing = drafts.filter((d) => d.ai_review?.verdict === "pass").map((d) => d.id);
  const busy = publishing || approving || rejecting;

  return (
    <form className="space-y-4">
      {[publishState, approveState, rejectState].map((s, i) =>
        s.status !== "idle" && s.message ? <Alert key={i} tone={s.status === "success" ? "success" : "danger"}>{s.message}</Alert> : null)}
      <div className="sticky top-0 z-10 flex flex-wrap items-center gap-2 rounded-lg border border-border bg-background p-3 text-sm shadow-sm">
        <span className="font-medium text-ink">{selected.size} selected</span>
        <button type="button" onClick={() => setSelected(new Set(passing))} className="rounded-md border border-border-strong px-3 py-1.5">Select all that passed the check ({passing.length})</button>
        <button type="button" onClick={() => setSelected(new Set())} className="rounded-md px-3 py-1.5 text-muted-foreground">Clear</button>
        <span className="flex-1" />
        {canPublish ? (
          <button type="submit" formAction={approvePublish} disabled={!selected.size || busy} className="h-10 rounded-md bg-primary px-4 font-semibold text-primary-foreground disabled:opacity-50">
            {publishing ? "Working…" : "Approve and publish"}
          </button>
        ) : null}
        <button type="submit" formAction={approve} disabled={!selected.size || busy} className="h-10 rounded-md border border-border-strong px-4 font-semibold disabled:opacity-50">
          {approving ? "Working…" : "Approve only"}
        </button>
        <input name="reason" placeholder="Reason (for reject)" aria-label="Reason for rejecting" className="h-10 w-44 rounded-md border border-border-strong px-2" />
        <button type="submit" formAction={reject} disabled={!selected.size || busy} className="h-10 rounded-md border border-danger px-4 font-semibold text-danger disabled:opacity-50">
          Reject
        </button>
      </div>
      <p className="text-xs text-muted-foreground">
        Approving is your verification: read each question, its answer and explanation first. Open a draft to edit it.
        Students only ever see published questions, labelled as AI-generated practice questions.
      </p>

      <ul className="space-y-4">
        {drafts.map((d) => {
          const flag = d.ai_review?.verdict === "flag";
          return (
            <li key={d.id} className={cn("rounded-xl border p-4", selected.has(d.id) ? "border-primary bg-primary-soft/40" : flag ? "border-warning/60" : "border-border")}>
              <div className="flex items-start gap-3">
                <input type="checkbox" name="ids" value={d.id} checked={selected.has(d.id)} onChange={() => toggle(d.id)} className="mt-1 size-5 accent-[var(--primary)]" aria-label="Select this draft" />
                <div className="min-w-0 flex-1 space-y-2 text-sm">
                  <div className="flex flex-wrap items-center gap-2">
                    {d.status === "verified" ? <Badge tone="green">Approved — not yet published</Badge> : null}
                    {d.ai_review?.verdict ? <Badge tone={flag ? "warning" : "green"}>{flag ? "Check flagged issues" : "Passed automatic check"}</Badge> : <Badge>Not checked</Badge>}
                    <Badge tone="outline">{d.variation_type ? variationLabel(d.variation_type) : "New question"}</Badge>
                    <span className="text-muted-foreground">{d.subject ?? "No subject"} · {d.difficulty}</span>
                    <Link href={`/admin/questions/${d.id}`} className="ml-auto font-medium text-primary hover:underline">Open to edit</Link>
                  </div>
                  <p className="whitespace-pre-wrap text-[15px] text-ink">{d.stem}</p>
                  {d.options.length ? (
                    <ol className="space-y-1">
                      {d.options.map((o, i) => (
                        <li key={i} className={cn("rounded px-2 py-1", o.is_correct ? "bg-primary-soft font-medium text-ink" : "text-muted-foreground")}>
                          {String.fromCharCode(65 + i)}. {o.body}{o.is_correct ? " ✓" : ""}
                        </li>
                      ))}
                    </ol>
                  ) : null}
                  {d.explanation ? <p className="text-muted-foreground"><span className="font-medium text-ink">Explanation: </span>{d.explanation}</p> : null}
                  {d.model_answer ? <details><summary className="cursor-pointer font-medium text-primary">Model answer</summary><p className="mt-1 whitespace-pre-wrap text-muted-foreground">{d.model_answer}</p></details> : null}
                  {d.ai_review?.issues?.length ? (
                    <ul className="list-disc space-y-0.5 pl-5 text-warning">{d.ai_review.issues.map((i) => <li key={i}>{i}</li>)}</ul>
                  ) : null}
                  {d.ai_review?.checker_notes ? <p className="text-muted-foreground"><span className="font-medium text-ink">Checker&apos;s notes: </span>{d.ai_review.checker_notes}</p> : null}
                  {d.ai_review?.fact_check_notes ? <p className="text-muted-foreground"><span className="font-medium text-ink">Writer&apos;s notes to check: </span>{d.ai_review.fact_check_notes}</p> : null}
                  {d.source ? (
                    <details className="rounded-md bg-muted/60 p-2">
                      <summary className="cursor-pointer text-muted-foreground">
                        Source question{d.source.origin === "historical_official" ? " (past RCSC paper)" : ""}{d.ai_review?.what_changed ? ` — ${d.ai_review.what_changed}` : ""}
                      </summary>
                      <p className="mt-1 whitespace-pre-wrap">{d.source.stem}</p>
                    </details>
                  ) : null}
                </div>
              </div>
            </li>
          );
        })}
      </ul>
    </form>
  );
}
