import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Input, Select } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { WEAKNESS_TAGS, type WeaknessTag } from "@/lib/ai/written-evaluation";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { markQualityAction, withdrawEvaluationAction } from "../actions";

export const metadata: Metadata = { title: "Evaluation review" };

type Details = { summary?: string; strengths?: string[]; key_points_missing?: string[]; inaccuracies?: { statement: string; correction: string }[]; suggestions?: string[]; notices?: string[]; uncertain_facts?: string; improved_answer?: string; model?: string; used_fallback?: boolean };

export default async function EvaluationReviewPage({ params }: PageProps<"/admin/evaluations/[id]">) {
  const { id } = await params;
  await requirePermission("evaluations.assign", `/admin/evaluations/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const { data: ev } = await db.from("evaluations").select("*").eq("id", id).maybeSingle();
  if (!ev) notFound();
  const [{ data: aa }, { data: pages }, { data: reports }] = await Promise.all([
    db.from("attempt_answers").select("id, answer_mode, text_answer, word_count, transcript_text, transcript_confidence, transcript_edit_ratio, exam_questions(question_id, marks)").eq("id", ev.answer_id).maybeSingle(),
    db.from("answer_pages").select("id, storage_path, position, quality").eq("answer_id", ev.answer_id).order("position"),
    db.from("evaluation_reports").select("reason, message, status, created_at").eq("evaluation_id", id),
  ]);
  const eqRow = aa?.exam_questions as unknown as { question_id: string; marks: number | null } | null;
  const { data: q } = eqRow ? await db.from("questions").select("id, stem, model_answer, marks, status").eq("id", eqRow.question_id).maybeSingle() : { data: null };
  const signed = pages?.length ? (await db.storage.from("answer-sheets").createSignedUrls(pages.map((p) => p.storage_path), 3600)).data ?? [] : [];
  const d = (ev.details ?? {}) as Details;
  const rubric = (ev.rubric_scores ?? []) as { criterion: string; marks: number; max_marks: number; comment: string }[];

  return (
    <>
      <Link href="/admin/evaluations?tab=review" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink"><ChevronLeft className="size-4" aria-hidden /> Quality review</Link>
      <div className="mt-3">
        <PageTitle title="Evaluation review" description={<span className="inline-flex flex-wrap items-center gap-2"><Badge tone={ev.status === "completed" ? "green" : ev.status === "failed" ? "danger" : "warning"}>{ev.status}</Badge>{formatDate(ev.assigned_at)}{d.model ? ` · ${d.model}` : ""}{d.used_fallback ? " · fallback model" : ""}</span>} />
      </div>
      <div className="grid gap-8 xl:grid-cols-[1fr_320px]">
        <div className="space-y-6">
          <section>
            <h2 className="font-semibold text-ink">Question</h2>
            {q ? <p className="mt-1 whitespace-pre-wrap">{q.stem} <Link href={`/admin/questions/${q.id}`} className="text-sm font-medium text-primary hover:underline">Edit question & answer guide</Link></p> : <p className="text-sm text-muted-foreground">Question not found.</p>}
          </section>
          {pages?.length ? (
            <section>
              <h2 className="font-semibold text-ink">Answer sheets ({pages.length})</h2>
              <ol className="mt-2 grid grid-cols-2 gap-3 md:grid-cols-4">
                {pages.map((p, i) => (
                  <li key={p.id} className="rounded border border-border p-1">
                    <a href={signed[i]?.signedUrl ?? undefined} target="_blank" rel="noreferrer" className="flex h-48 items-center justify-center bg-muted">
                      {/* eslint-disable-next-line @next/next/no-img-element -- private signed URL */}
                      {signed[i]?.signedUrl ? <img src={signed[i].signedUrl} alt={`Page ${i + 1}`} className="max-h-full max-w-full object-contain" /> : null}
                    </a>
                    <p className="mt-1 text-xs">Page {i + 1}{(p.quality as { warnings?: string[] })?.warnings?.length ? ` · ⚠ ${(p.quality as { warnings: string[] }).warnings.join(", ")}` : ""}</p>
                  </li>
                ))}
              </ol>
            </section>
          ) : null}
          {aa?.answer_mode === "handwritten" ? (
            <section>
              <h2 className="font-semibold text-ink">AI reading of the handwriting <span className="text-sm font-normal text-muted-foreground">(confidence {aa.transcript_confidence ?? "—"})</span></h2>
              <p className="mt-1 whitespace-pre-wrap rounded-lg bg-muted/40 p-3 text-sm">{aa.transcript_text ?? "—"}</p>
            </section>
          ) : null}
          <section>
            <h2 className="font-semibold text-ink">Evaluated text <span className="text-sm font-normal text-muted-foreground">({aa?.word_count ?? 0} words{aa?.transcript_edit_ratio !== null && aa?.transcript_edit_ratio !== undefined ? ` · edit ratio ${Number(aa.transcript_edit_ratio).toFixed(2)}` : ""})</span></h2>
            <p className="mt-1 whitespace-pre-wrap rounded-lg border border-border p-3 text-sm">{aa?.text_answer ?? "—"}</p>
          </section>
          <section className="space-y-3 text-sm">
            <h2 className="font-semibold text-ink">AI evaluation</h2>
            <p>{ev.scored ? <strong>{Number(ev.score)} / {Number(ev.max_score)} (indicative)</strong> : "No score (no approved marking guide)"} · confidence {ev.confidence ?? "—"}</p>
            {ev.error_message ? <p className="text-danger">{ev.error_message}</p> : null}
            {d.notices?.length ? <ul className="list-disc pl-5 text-warning">{d.notices.map((n) => <li key={n}>{n}</li>)}</ul> : null}
            {d.summary ? <p>{d.summary}</p> : null}
            {rubric.length ? <ul className="space-y-1">{rubric.map((r) => <li key={r.criterion}><strong>{r.criterion}</strong> {r.marks}/{r.max_marks} — {r.comment}</li>)}</ul> : null}
            {(ev.weakness_tags as string[])?.length ? <p>Tags: {(ev.weakness_tags as string[]).map((t) => WEAKNESS_TAGS[t as WeaknessTag] ?? t).join(", ")}</p> : null}
            {d.inaccuracies?.length ? <div><strong>Inaccuracies flagged:</strong><ul className="list-disc pl-5">{d.inaccuracies.map((x, i) => <li key={i}>“{x.statement}” → {x.correction}</li>)}</ul></div> : null}
            {d.key_points_missing?.length ? <p><strong>Missing:</strong> {d.key_points_missing.join("; ")}</p> : null}
            {d.uncertain_facts ? <p><strong>Unverified:</strong> {d.uncertain_facts}</p> : null}
            {q?.model_answer ? <details><summary className="cursor-pointer font-medium">Reference answer</summary><p className="mt-2 whitespace-pre-wrap">{q.model_answer}</p></details> : null}
            {d.improved_answer ? <details><summary className="cursor-pointer font-medium">Improved answer shown to the student</summary><p className="mt-2 whitespace-pre-wrap">{d.improved_answer}</p></details> : null}
          </section>
        </div>
        <aside className="space-y-6">
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Quality review</h2>
            {ev.quality_status ? <p className="mt-1 text-sm">Current: <Badge tone={ev.quality_status === "good" ? "green" : "danger"}>{ev.quality_status}</Badge>{ev.quality_note ? <span className="block text-muted-foreground">{ev.quality_note}</span> : null}</p> : null}
            <ActionForm action={markQualityAction} submitLabel="Save review" className="mt-3 space-y-2">
              <input type="hidden" name="id" value={ev.id} />
              <Select name="quality" defaultValue={ev.quality_status ?? "good"} aria-label="Quality" className="h-10"><option value="good">Good evaluation</option><option value="problem">Problem</option></Select>
              <Input name="note" placeholder="Note (optional)" aria-label="Note" className="h-10" />
            </ActionForm>
          </section>
          {ev.status === "completed" ? (
            <section className="rounded-xl border border-border p-4">
              <h2 className="font-semibold text-ink">Withdraw evaluation</h2>
              <p className="mt-1 text-xs text-muted-foreground">Removes it from the student&apos;s view, refunds it from their allowance and lets them request a new one.</p>
              <ActionForm action={withdrawEvaluationAction} submitLabel="Withdraw" variant="danger" className="mt-3 space-y-2" confirm="Withdraw this evaluation?">
                <input type="hidden" name="id" value={ev.id} />
                <Input name="note" placeholder="Reason" aria-label="Reason" className="h-10" />
              </ActionForm>
            </section>
          ) : null}
          {reports?.length ? (
            <section className="rounded-xl border border-border p-4 text-sm">
              <h2 className="font-semibold text-ink">Student reports</h2>
              <ul className="mt-2 space-y-2">{reports.map((r, i) => <li key={i}><Badge tone={r.status === "open" ? "warning" : "neutral"}>{r.status}</Badge> {r.message}</li>)}</ul>
            </section>
          ) : null}
        </aside>
      </div>
    </>
  );
}
