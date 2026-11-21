"use client";

import { useActionState, useState } from "react";
import { AlertTriangle, Bot, Loader2 } from "lucide-react";
import { improvedAnswerAction, reportEvaluationAction, type ReportState } from "@/app/dashboard/written/actions";
import { WEAKNESS_TAGS, type WeaknessTag } from "@/lib/ai/written-evaluation";
import { cn } from "@/lib/utils";

export type EvaluationDetails = {
  summary?: string; strengths?: string[]; key_points_covered?: string[]; key_points_missing?: string[];
  inaccuracies?: { statement: string; correction: string }[]; structure_feedback?: string; suggestions?: string[];
  uncertain_facts?: string; relevance?: string; notices?: string[]; improved_answer?: string; improved_changes?: string[];
};
export type EvaluationRow = {
  id: string; status: string; score: number | null; max_score: number | null; scored: boolean | null; confidence: string | null;
  weakness_tags: string[]; rubric_scores: { criterion: string; marks: number; max_marks: number; comment: string }[] | null;
  details: EvaluationDetails | null; error_message: string | null; completed_at: string | null; improved_requested_at: string | null;
  delivery?: string | null;
};

export function EvaluationView({ ev, answerId, reported }: { ev: EvaluationRow; answerId: string; reported: boolean }) {
  const d = ev.details ?? {};
  const [improving, setImproving] = useState(false);
  const [improveError, setImproveError] = useState<string | null>(null);
  const [mountedAt] = useState(() => Date.now());
  const improvedPending = !d.improved_answer && (improving || Boolean(ev.improved_requested_at && mountedAt - new Date(ev.improved_requested_at).getTime() < 5 * 60 * 1000));

  return (
    <div className="space-y-6" data-testid="evaluation">
      <div className="rounded-xl border border-border p-5">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <p className="flex items-center gap-1.5 text-xs font-medium uppercase tracking-wide text-muted-foreground"><Bot className="size-4" aria-hidden /> AI-assisted evaluation</p>
            {ev.scored && ev.score !== null ? (
              <p className="mt-1 font-serif text-4xl font-semibold text-ink tabular-nums">{Number(ev.score)}<span className="text-2xl text-muted-foreground"> / {Number(ev.max_score)}</span></p>
            ) : (
              <p className="mt-1 text-lg font-semibold text-ink">Feedback only — no score</p>
            )}
            <p className="mt-1 text-sm text-muted-foreground">{ev.scored ? "Indicative AI score — not an official RCSC mark." : "This question has no approved marking guide yet, so no score is given."}</p>
          </div>
          {ev.confidence ? (
            <span className={cn("rounded-full px-3 py-1 text-xs font-medium", ev.confidence === "low" ? "bg-warning-soft text-warning" : "bg-primary-soft text-primary")}>
              {ev.confidence === "high" ? "High" : ev.confidence === "medium" ? "Medium" : "Low"} confidence
            </span>
          ) : null}
        </div>
        {d.notices?.length ? (
          <ul className="mt-4 space-y-1 rounded-lg bg-warning-soft p-3 text-sm text-warning">
            {d.notices.map((n) => <li key={n} className="flex gap-2"><AlertTriangle className="mt-0.5 size-4 shrink-0" aria-hidden />{n}</li>)}
          </ul>
        ) : null}
        {d.summary ? <p className="mt-4 leading-relaxed text-ink">{d.summary}</p> : null}
        {ev.weakness_tags.length ? (
          <p className="mt-3 flex flex-wrap gap-1.5">{ev.weakness_tags.map((t) => <span key={t} className="rounded-full border border-border-strong px-2.5 py-0.5 text-xs">{WEAKNESS_TAGS[t as WeaknessTag] ?? t}</span>)}</p>
        ) : null}
      </div>

      {ev.rubric_scores?.length ? (
        <section>
          <h3 className="font-semibold text-ink">Marks by criterion</h3>
          <ul className="mt-2 divide-y divide-border rounded-xl border border-border">
            {ev.rubric_scores.map((r) => (
              <li key={r.criterion} className="p-4 text-sm">
                <div className="flex justify-between gap-3"><span className="font-medium text-ink">{r.criterion}</span><span className="tabular-nums">{r.marks} / {r.max_marks}</span></div>
                <p className="mt-1 text-muted-foreground">{r.comment}</p>
              </li>
            ))}
          </ul>
        </section>
      ) : null}

      <div className="grid gap-4 md:grid-cols-2">
        <ListBox title="Strengths" items={d.strengths} />
        <ListBox title="Key points you covered" items={d.key_points_covered} />
        <ListBox title="Missing key points" items={d.key_points_missing} tone="warning" />
        <ListBox title="Suggestions to improve" items={d.suggestions} />
      </div>
      {d.inaccuracies?.length ? (
        <section className="rounded-xl border border-danger/30 p-4 text-sm">
          <h3 className="font-semibold text-ink">Incorrect or misleading statements</h3>
          <ul className="mt-2 space-y-2">{d.inaccuracies.map((x, i) => <li key={i}><span className="text-danger">“{x.statement}”</span><br /><span className="text-foreground">{x.correction}</span></li>)}</ul>
        </section>
      ) : null}
      {d.structure_feedback ? <section className="text-sm"><h3 className="font-semibold text-ink">Structure and clarity</h3><p className="mt-1 leading-relaxed">{d.structure_feedback}</p></section> : null}
      {d.uncertain_facts ? <p className="text-sm text-muted-foreground"><span className="font-medium">Could not be verified by the AI:</span> {d.uncertain_facts}</p> : null}

      <section className="rounded-xl border border-border p-5">
        <h3 className="font-semibold text-ink">Improved sample answer</h3>
        {d.improved_answer ? (
          <>
            <p className="mt-1 text-xs text-muted-foreground">Written by AI for learning — not an official RCSC answer. Check facts before relying on them.</p>
            <p className="mt-3 whitespace-pre-wrap leading-relaxed">{d.improved_answer}</p>
            {d.improved_changes?.length ? <ul className="mt-3 list-disc pl-5 text-sm text-muted-foreground">{d.improved_changes.map((c) => <li key={c}>{c}</li>)}</ul> : null}
          </>
        ) : improvedPending ? (
          <p className="mt-2 flex items-center gap-2 text-sm text-muted-foreground"><Loader2 className="size-4 animate-spin" aria-hidden /> Writing an improved answer… this takes about a minute.</p>
        ) : (
          <>
            <p className="mt-1 text-sm text-muted-foreground">See a stronger version of your answer that keeps your good points and fixes the gaps. This uses one AI evaluation from your plan.</p>
            <button type="button" className="mt-3 inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted" onClick={async () => {
              setImproving(true); setImproveError(null);
              const r = await improvedAnswerAction(ev.id, answerId);
              if (!r.ok) { setImproveError(r.message); setImproving(false); }
            }}>Show improved answer</button>
            {improveError ? <p role="alert" className="mt-2 text-sm text-danger">{improveError}</p> : null}
          </>
        )}
      </section>

      <ReportForm evaluationId={ev.id} answerId={answerId} reported={reported} />
    </div>
  );
}

function ListBox({ title, items, tone }: { title: string; items?: string[]; tone?: "warning" }) {
  if (!items?.length) return null;
  return (
    <section className={cn("rounded-xl border p-4 text-sm", tone === "warning" ? "border-warning/40" : "border-border")}>
      <h3 className="font-semibold text-ink">{title}</h3>
      <ul className="mt-2 list-disc space-y-1 pl-5">{items.map((x) => <li key={x}>{x}</li>)}</ul>
    </section>
  );
}

function ReportForm({ evaluationId, answerId, reported }: { evaluationId: string; answerId: string; reported: boolean }) {
  const [open, setOpen] = useState(false);
  const [state, action, pending] = useActionState(reportEvaluationAction, { status: "idle" } as ReportState);
  if (reported || state.status === "success") {
    return <p className="text-sm text-muted-foreground" role="status">{state.message ?? "You reported this evaluation. The Soma team will review it."}</p>;
  }
  if (!open) return <button type="button" onClick={() => setOpen(true)} className="text-sm font-medium text-muted-foreground underline-offset-4 hover:text-ink hover:underline">Report an incorrect or unfair evaluation</button>;
  return (
    <form action={action} className="space-y-3 rounded-xl border border-border p-4 text-sm">
      <input type="hidden" name="evaluationId" value={evaluationId} />
      <input type="hidden" name="answerId" value={answerId} />
      <label className="block">
        <span className="font-medium text-ink">What is wrong?</span>
        <select name="reason" className="mt-1 block h-10 w-full rounded-md border border-border-strong bg-background px-2">
          <option value="marks_unfair">Marks seem unfair</option>
          <option value="missed_points">It missed points I made</option>
          <option value="factually_wrong">The feedback is factually wrong</option>
          <option value="misread_handwriting">My handwriting was misread</option>
          <option value="other">Something else</option>
        </select>
      </label>
      <label className="block">
        <span className="font-medium text-ink">Details</span>
        <textarea name="message" rows={3} maxLength={2000} required className="mt-1 block w-full rounded-md border border-border-strong bg-background p-2" />
      </label>
      {state.status === "error" ? <p role="alert" className="text-danger">{state.message}</p> : null}
      <button type="submit" disabled={pending} className="inline-flex h-10 items-center rounded-md bg-primary px-4 font-medium text-primary-foreground disabled:opacity-50">{pending ? "Sending…" : "Send report"}</button>
    </form>
  );
}
