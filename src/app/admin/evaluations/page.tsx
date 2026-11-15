import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";
import { can, requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { resolveReportAction, saveEvaluationSettingsAction, saveSubjectCriteriaAction } from "./actions";
import { cn } from "@/lib/utils";

export const metadata: Metadata = { title: "Written-answer evaluation" };

// Claude Opus 5.5 list prices (US$ per million tokens), for the cost estimate only.
const PRICE = { input: 4, output: 20 };
const TABS = [["overview", "Overview"], ["review", "Quality review"], ["reports", "Reports"], ["settings", "Settings"], ["criteria", "Subject criteria"]] as const;
type Tab = (typeof TABS)[number][0];

type Usage = { evaluations: Record<string, number> | null; open_reports: number; problems: number; jobs: { kind: string; jobs: number; input_tokens: number; output_tokens: number }[]; per_day: { day: string; n: number }[] };
const KIND: Record<string, string> = { answer_feedback: "Evaluations and improved answers", answer_transcription: "Handwriting reading", question_generation: "Question drafting", paper_analysis: "Past-paper analysis" };

export default async function EvaluationsAdminPage({ searchParams }: PageProps<"/admin/evaluations">) {
  const user = await requirePermission("evaluations.assign", "/admin/evaluations");
  const sp = await searchParams;
  const tab: Tab = (TABS.map((t) => t[0]) as string[]).includes(String(sp.tab)) ? (sp.tab as Tab) : "overview";
  const db = await createClient();

  return (
    <>
      <PageTitle title="Written-answer evaluation" description="AI-assisted evaluation of ME answers: usage and cost, quality review, student reports and settings. Students always see AI marks labelled as indicative." />
      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Sections">
        {TABS.map(([k, l]) => (
          <Link key={k} href={`/admin/evaluations?tab=${k}`} className={cn("rounded-full border px-4 py-1.5 text-sm font-medium", tab === k ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>{l}</Link>
        ))}
      </nav>
      {tab === "overview" ? <Overview db={db} /> : null}
      {tab === "review" ? <Review db={db} filter={String(sp.filter ?? "all")} /> : null}
      {tab === "reports" ? <Reports db={db} /> : null}
      {tab === "settings" ? <Settings db={db} canEdit={can(user, "settings.manage")} /> : null}
      {tab === "criteria" ? <Criteria db={db} canEdit={can(user, "syllabus.manage")} /> : null}
    </>
  );
}

type Db = Awaited<ReturnType<typeof createClient>>;

async function Overview({ db }: { db: Db }) {
  const { data } = await db.rpc("evaluation_usage", { _days: 30 });
  const u = (data ?? { evaluations: {}, open_reports: 0, problems: 0, jobs: [], per_day: [] }) as Usage;
  const ev = u.evaluations ?? {};
  const cost = u.jobs.reduce((s, j) => s + (j.input_tokens * PRICE.input + j.output_tokens * PRICE.output) / 1e6, 0);
  return (
    <div className="space-y-6">
      <dl className="grid grid-cols-2 gap-3 md:grid-cols-4">
        {[
          ["Evaluations completed (30 days)", ev.completed ?? 0],
          ["Failed / withdrawn", (ev.failed ?? 0) + (ev.withdrawn ?? 0)],
          ["Open student reports", u.open_reports],
          ["Estimated AI cost (30 days)", `US$${cost.toFixed(2)}`],
        ].map(([k, v]) => (
          <div key={String(k)} className="rounded-xl border border-border p-4"><dt className="text-xs text-muted-foreground">{k}</dt><dd className="mt-1 text-2xl font-semibold tabular-nums text-ink">{v}</dd></div>
        ))}
      </dl>
      <section className="rounded-xl border border-border p-5">
        <h2 className="font-semibold text-ink">AI usage by task (30 days)</h2>
        {u.jobs.length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No AI usage yet.</p> : (
          <table className="mt-3 w-full text-sm">
            <thead className="text-left text-xs text-muted-foreground"><tr><th className="py-1 font-medium">Task</th><th className="py-1 text-right font-medium">Calls</th><th className="py-1 text-right font-medium">Tokens in / out</th><th className="py-1 text-right font-medium">Est. cost</th></tr></thead>
            <tbody className="divide-y divide-border">
              {u.jobs.map((j) => (
                <tr key={j.kind}><td className="py-2">{KIND[j.kind] ?? j.kind}</td><td className="py-2 text-right tabular-nums">{j.jobs}</td><td className="py-2 text-right tabular-nums">{j.input_tokens.toLocaleString("en")} / {j.output_tokens.toLocaleString("en")}</td><td className="py-2 text-right tabular-nums">US${((j.input_tokens * PRICE.input + j.output_tokens * PRICE.output) / 1e6).toFixed(2)}</td></tr>
              ))}
            </tbody>
          </table>
        )}
        <p className="mt-3 text-xs text-muted-foreground">Estimate at Claude Opus 5.5 list prices (US$4 / US$20 per million input / output tokens). Your Anthropic console shows the exact amount billed.</p>
      </section>
      {u.per_day.length ? (
        <section className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Evaluations per day</h2>
          <ul className="mt-3 grid grid-cols-2 gap-x-6 gap-y-1 text-sm sm:grid-cols-4">{u.per_day.map((d) => <li key={d.day} className="flex justify-between"><span className="text-muted-foreground">{formatDate(d.day)}</span><span className="tabular-nums">{d.n}</span></li>)}</ul>
        </section>
      ) : null}
    </div>
  );
}

type EvRow = { id: string; status: string; score: number | null; max_score: number | null; scored: boolean | null; confidence: string | null; quality_status: string | null; assigned_at: string; weakness_tags: string[]; attempt_answers: { answer_mode: string; transcript_edit_ratio: number | null } | null };

async function Review({ db, filter }: { db: Db; filter: string }) {
  let q = db.from("evaluations").select("id, status, score, max_score, scored, confidence, quality_status, assigned_at, weakness_tags, attempt_answers(answer_mode, transcript_edit_ratio)").eq("method", "ai_feedback").order("assigned_at", { ascending: false }).limit(100);
  if (filter === "low") q = q.eq("confidence", "low");
  if (filter === "problem") q = q.eq("quality_status", "problem");
  if (filter === "unreviewed") q = q.is("quality_status", null).eq("status", "completed");
  if (filter === "failed") q = q.eq("status", "failed");
  const { data } = await q;
  const rows = (data ?? []) as unknown as EvRow[];
  return (
    <div>
      <nav className="mb-4 flex flex-wrap gap-2 text-sm" aria-label="Filter">
        {[["all", "All"], ["unreviewed", "Not yet reviewed"], ["low", "Low confidence"], ["problem", "Marked as problem"], ["failed", "Failed"]].map(([k, l]) => (
          <Link key={k} href={`/admin/evaluations?tab=review&filter=${k}`} className={cn("rounded-md border px-3 py-1", filter === k ? "border-primary text-primary" : "border-border hover:bg-muted")}>{l}</Link>
        ))}
      </nav>
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">No evaluations in this view.</p> : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {rows.map((r) => (
            <li key={r.id}>
              <Link href={`/admin/evaluations/${r.id}`} className="flex flex-wrap items-center gap-2 p-3 text-sm hover:bg-muted/50">
                <span className="w-36 text-muted-foreground">{formatDate(r.assigned_at)}</span>
                <Badge tone={r.status === "completed" ? "green" : r.status === "failed" ? "danger" : "warning"}>{r.status}</Badge>
                <span className="tabular-nums">{r.scored && r.score !== null ? `${Number(r.score)}/${Number(r.max_score)}` : "no score"}</span>
                <Badge tone="outline">{r.attempt_answers?.answer_mode ?? "—"}</Badge>
                {r.confidence === "low" ? <Badge tone="warning">low confidence</Badge> : null}
                {Number(r.attempt_answers?.transcript_edit_ratio ?? 0) > 0.35 ? <Badge tone="warning">heavily edited</Badge> : null}
                {r.quality_status ? <Badge tone={r.quality_status === "good" ? "green" : "danger"}>{r.quality_status}</Badge> : null}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

async function Reports({ db }: { db: Db }) {
  const { data } = await db.from("evaluation_reports").select("id, evaluation_id, reason, message, status, resolution, created_at").order("status").order("created_at", { ascending: false }).limit(100);
  const rows = data ?? [];
  const REASONS: Record<string, string> = { marks_unfair: "Marks unfair", misread_handwriting: "Handwriting misread", factually_wrong: "Feedback factually wrong", missed_points: "Missed points", other: "Other" };
  return rows.length === 0 ? <p className="text-sm text-muted-foreground">No reports.</p> : (
    <ul className="space-y-3">
      {rows.map((r) => (
        <li key={r.id} className="rounded-xl border border-border p-4 text-sm">
          <div className="flex flex-wrap items-center gap-2">
            <Badge tone={r.status === "open" ? "warning" : "neutral"}>{r.status}</Badge>
            <span className="font-medium text-ink">{REASONS[r.reason] ?? r.reason}</span>
            <span className="text-muted-foreground">{formatDate(r.created_at)}</span>
            <Link href={`/admin/evaluations/${r.evaluation_id}`} className="ml-auto font-medium text-primary hover:underline">Open evaluation</Link>
          </div>
          <p className="mt-2 whitespace-pre-wrap">{r.message}</p>
          {r.status === "open" ? (
            <ActionForm action={resolveReportAction} submitLabel="Save" className="mt-3 space-y-2">
              <input type="hidden" name="id" value={r.id} />
              <div className="grid gap-2 sm:grid-cols-[160px_1fr]">
                <Select name="status" defaultValue="resolved" aria-label="Outcome" className="h-10"><option value="resolved">Resolved</option><option value="dismissed">Dismissed</option></Select>
                <Input name="resolution" placeholder="What was done (e.g. evaluation withdrawn, rubric corrected)" aria-label="Resolution" className="h-10" />
              </div>
            </ActionForm>
          ) : r.resolution ? <p className="mt-2 text-muted-foreground">Resolution: {r.resolution}</p> : null}
        </li>
      ))}
    </ul>
  );
}

async function Settings({ db, canEdit }: { db: Db; canEdit: boolean }) {
  const { data } = await db.rpc("evaluation_config");
  const c = (data ?? {}) as Record<string, string | number | boolean>;
  return (
    <section className="max-w-2xl rounded-xl border border-border p-5">
      {!canEdit ? <p className="mb-4 text-sm text-warning">Only users with the settings permission can change these values.</p> : null}
      <ActionForm action={saveEvaluationSettingsAction} submitLabel="Save settings">
        <div className="grid gap-4 sm:grid-cols-2">
          <Num name="free_total" label="AI evaluations for free accounts (total)" value={c.free_total} />
          <Num name="me_package_total" label="AI evaluations per ME package" value={c.me_package_total} />
          <Num name="upload_window_minutes" label="Upload window after a timed exam (minutes)" value={c.upload_window_minutes} />
          <Num name="max_pages" label="Maximum pages per answer" value={c.max_pages} />
          <Num name="max_page_kb" label="Maximum size per page (KB)" value={c.max_page_kb} />
        </div>
        <label className="flex items-center gap-2 text-sm"><input type="checkbox" name="dzongkha_handwriting" defaultChecked={c.dzongkha_handwriting !== false} /> Offer Dzongkha handwriting recognition (Beta)</label>
        <Field>
          <Label htmlFor="instr">Additional marking guidance for the AI (optional)</Label>
          <Textarea id="instr" name="instructions" rows={4} defaultValue={String(c.instructions ?? "")} maxLength={4000} />
          <FieldHint>Appended to every evaluation, e.g. “Expect Bhutan-specific examples; credit references to GNH where relevant.”</FieldHint>
        </Field>
      </ActionForm>
    </section>
  );
}

function Num({ name, label, value }: { name: string; label: string; value: unknown }) {
  return <Field><Label htmlFor={name}>{label}</Label><Input id={name} name={name} type="number" defaultValue={String(value ?? "")} className="h-10" /></Field>;
}

async function Criteria({ db, canEdit }: { db: Db; canEdit: boolean }) {
  const { data } = await db.from("subjects").select("id, name, assessment_criteria, exam_papers(title)").eq("stage", "ME").order("sort_order");
  const rows = (data ?? []) as unknown as { id: string; name: string; assessment_criteria: string | null; exam_papers: { title: string } | null }[];
  return (
    <div className="space-y-4">
      <p className="text-sm text-muted-foreground">What a good answer looks like in each ME subject (for example language quality for Dzongkha, analysis for current affairs). Sent to the AI with every evaluation in that subject.</p>
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">No ME subjects yet. Add them in <Link href="/admin/syllabus" className="font-medium text-primary hover:underline">Subjects & topics</Link>.</p> : null}
      {rows.map((s) => (
        <section key={s.id} className="rounded-xl border border-border p-4">
          <h2 className="font-semibold text-ink">{s.name}{s.exam_papers ? <span className="font-normal text-muted-foreground"> · {s.exam_papers.title}</span> : null}</h2>
          {canEdit ? (
            <ActionForm action={saveSubjectCriteriaAction} submitLabel="Save" className="mt-2 space-y-2">
              <input type="hidden" name="id" value={s.id} />
              <Textarea name="criteria" rows={3} defaultValue={s.assessment_criteria ?? ""} maxLength={10000} aria-label={`Assessment criteria for ${s.name}`} />
            </ActionForm>
          ) : <p className="mt-2 whitespace-pre-wrap text-sm">{s.assessment_criteria ?? "—"}</p>}
        </section>
      ))}
    </div>
  );
}
