import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { getAiProvider } from "@/lib/ai";
import type { PaperAnalysis } from "@/lib/ai/question-drafts";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { analysePastPapersAction, generateQuestionsAction } from "./actions";

export const metadata: Metadata = { title: "AI question drafts" };
// AI drafting can take a few minutes.
export const maxDuration = 300;

type SubjectStat = {
  id: string; name: string; stage: "PE" | "ME"; is_official: boolean;
  published: number; in_review: number; drafts: number; ai_drafted: number; past_paper: number;
  foundation: number; standard: number; advanced: number;
  topics: { id: string; name: string; published: number }[];
};
type Analysis = { subjects: SubjectStat[]; past_papers_by_year: { exam_year: number; stage: string; papers: number; questions: number }[]; unclassified: number };
type Job = {
  id: string; kind: string; model: string; status: string; created_at: string; error_message: string | null;
  input_tokens: number | null; output_tokens: number | null;
  input: { subject?: string; topic?: string | null; kind?: string; count?: number; questions?: number } | null;
  output: { created?: { id: string; confidence: string; fact_check_notes: string }[]; skipped?: { stem: string; reason: string }[]; used_fallback?: boolean; analysis?: PaperAnalysis } | null;
};

const KIND_OPTIONS = [
  ["mcq", "Multiple choice (PE)"], ["short_answer", "Short answer (ME)"], ["long_answer", "Long answer (ME)"],
  ["essay", "Essay (ME)"], ["analytical", "Analytical (ME)"], ["descriptive", "Descriptive (ME)"],
] as const;

export default async function AiPage() {
  await requirePermission("ai.run", "/admin/ai");
  const db = await createClient();
  const [{ data: analysis }, { data: jobs }] = await Promise.all([
    db.rpc("question_bank_analysis", { _stage: null }),
    db.from("ai_jobs").select("id, kind, model, status, created_at, error_message, input_tokens, output_tokens, input, output").in("kind", ["question_generation", "paper_analysis"]).order("created_at", { ascending: false }).limit(15),
  ]);
  const a = (analysis ?? { subjects: [], past_papers_by_year: [], unclassified: 0 }) as Analysis;
  const jobRows = (jobs ?? []) as Job[];
  const configured = Boolean(getAiProvider());
  const thin = a.subjects.filter((s) => s.published + s.in_review < 20);

  return (
    <>
      <PageTitle
        title="AI question drafts"
        description="Find gaps in the question bank and draft original questions with AI. Every draft enters the review workflow — nothing reaches students until a person verifies and publishes it."
      />
      <div className="space-y-8">
        {!configured ? <Alert tone="warning" title="AI is not configured">Add <code>ANTHROPIC_API_KEY</code> to the server environment (Vercel → Settings → Environment Variables), then redeploy. See docs/ENVIRONMENT.md.</Alert> : null}

        <section>
          <h2 className="text-lg font-semibold">Question bank coverage</h2>
          <p className="mt-1 text-sm text-muted-foreground">
            “Ready” counts published questions; “In review” counts awaiting review, revision requested and verified. {thin.length ? `${thin.length} subject${thin.length === 1 ? " has" : "s have"} fewer than 20 questions ready or in review.` : ""}
            {a.unclassified ? ` ${a.unclassified} question${a.unclassified === 1 ? " has" : "s have"} no subject.` : ""}
          </p>
          <div className="mt-3 overflow-x-auto rounded-xl border border-border">
            <table className="w-full min-w-[720px] text-sm">
              <thead className="bg-muted/60 text-left text-xs text-muted-foreground">
                <tr>
                  <th className="px-3 py-2 font-medium">Subject</th>
                  {["Ready", "In review", "Drafts", "AI drafts", "Past paper", "Foundation / Standard / Advanced", "Topics without ready questions"].map((h) => <th key={h} className="px-3 py-2 font-medium">{h}</th>)}
                </tr>
              </thead>
              <tbody className="divide-y divide-border">
                {a.subjects.map((s) => {
                  const empty = s.topics.filter((t) => t.published === 0);
                  return (
                    <tr key={s.id}>
                      <td className="px-3 py-2"><span className="font-medium text-ink">{s.name}</span> <Badge tone="outline">{s.stage}</Badge></td>
                      <td className={`px-3 py-2 tabular-nums ${s.published + s.in_review < 20 ? "font-semibold text-danger" : ""}`}>{s.published}</td>
                      <td className="px-3 py-2 tabular-nums">{s.in_review}</td>
                      <td className="px-3 py-2 tabular-nums">{s.drafts}</td>
                      <td className="px-3 py-2 tabular-nums">{s.ai_drafted}</td>
                      <td className="px-3 py-2 tabular-nums">{s.past_paper}</td>
                      <td className="px-3 py-2 tabular-nums">{s.foundation} / {s.standard} / {s.advanced}</td>
                      <td className="px-3 py-2 text-xs text-muted-foreground">{s.topics.length === 0 ? "No topics defined" : empty.length === 0 ? "—" : empty.map((t) => t.name).join(", ")}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
          {a.past_papers_by_year.length ? (
            <p className="mt-2 text-xs text-muted-foreground">
              Past-paper questions imported: {a.past_papers_by_year.map((y) => `${y.exam_year} ${y.stage} (${y.questions})`).join(" · ")}
            </p>
          ) : <p className="mt-2 text-xs text-muted-foreground">No past-paper questions imported yet. Pattern analysis becomes available once papers are imported.</p>}
        </section>

        <div className="grid gap-8 lg:grid-cols-2">
          <section className="rounded-xl border border-border p-5">
            <h2 className="text-lg font-semibold">Draft new questions</h2>
            <p className="mt-1 text-sm text-muted-foreground">Up to 10 at a time. Drafts are checked for format and near-duplicates, then saved with status “AI generated”.</p>
            <ActionForm action={generateQuestionsAction} submitLabel="Draft questions" className="mt-4">
              <Field>
                <Label htmlFor="ai-subject">Subject</Label>
                <Select id="ai-subject" name="subject_id" required className="h-10" defaultValue="">
                  <option value="" disabled>Choose a subject</option>
                  {(["PE", "ME"] as const).map((st) => (
                    <optgroup key={st} label={st === "PE" ? "Preliminary Examination" : "Main Examination"}>
                      {a.subjects.filter((s) => s.stage === st).map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
                    </optgroup>
                  ))}
                </Select>
              </Field>
              <Field>
                <Label htmlFor="ai-topic">Topic (optional)</Label>
                <Select id="ai-topic" name="topic_id" className="h-10" defaultValue="">
                  <option value="">Any topic in the subject</option>
                  {a.subjects.filter((s) => s.topics.length).map((s) => (
                    <optgroup key={s.id} label={s.name}>{s.topics.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}</optgroup>
                  ))}
                </Select>
                <FieldHint>Must belong to the chosen subject; otherwise it is ignored.</FieldHint>
              </Field>
              <div className="grid gap-4 sm:grid-cols-3">
                <Field>
                  <Label htmlFor="ai-kind">Question type</Label>
                  <Select id="ai-kind" name="kind" className="h-10" defaultValue="mcq">{KIND_OPTIONS.map(([v, l]) => <option key={v} value={v}>{l}</option>)}</Select>
                </Field>
                <Field>
                  <Label htmlFor="ai-diff">Difficulty</Label>
                  <Select id="ai-diff" name="difficulty" className="h-10" defaultValue="mixed">
                    <option value="mixed">Mixed</option><option value="foundation">Foundation</option><option value="standard">Standard</option><option value="advanced">Advanced</option>
                  </Select>
                </Field>
                <Field>
                  <Label htmlFor="ai-count">How many</Label>
                  <Input id="ai-count" name="count" type="number" min={1} max={10} defaultValue={5} className="h-10" />
                </Field>
              </div>
              <div className="grid gap-4 sm:grid-cols-2">
                <Field>
                  <Label htmlFor="ai-marks">Marks (written only)</Label>
                  <Input id="ai-marks" name="marks" type="number" min={1} max={100} defaultValue={10} className="h-10" />
                </Field>
                <Field>
                  <Label htmlFor="ai-words">Word limit (written, optional)</Label>
                  <Input id="ai-words" name="word_limit" type="number" min={30} max={3000} className="h-10" />
                </Field>
              </div>
              <Field>
                <Label htmlFor="ai-guidance">Guidance (optional)</Label>
                <Textarea id="ai-guidance" name="guidance" rows={3} maxLength={1500} placeholder="e.g. Use Bhutanese contexts and Nu. amounts; focus on percentage change." />
              </Field>
            </ActionForm>
          </section>

          <section className="rounded-xl border border-border p-5">
            <h2 className="text-lg font-semibold">Past-paper pattern analysis</h2>
            <p className="mt-1 text-sm text-muted-foreground">Summarises frequent topics, styles and trends in imported past-paper questions of one subject, to guide what to draft. It describes the past; it does not predict the examination.</p>
            <ActionForm action={analysePastPapersAction} submitLabel="Analyse" className="mt-4">
              <Field>
                <Label htmlFor="an-subject">Subject</Label>
                <Select id="an-subject" name="subject_id" required className="h-10" defaultValue="">
                  <option value="" disabled>Choose a subject</option>
                  {a.subjects.map((s) => <option key={s.id} value={s.id} disabled={s.past_paper < 5}>{s.stage} · {s.name} ({s.past_paper} past questions)</option>)}
                </Select>
                <FieldHint>Needs at least 5 imported past-paper questions.</FieldHint>
              </Field>
            </ActionForm>
          </section>
        </div>

        <section>
          <h2 className="text-lg font-semibold">Recent AI jobs</h2>
          {jobRows.length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No AI jobs yet.</p> : (
            <ul className="mt-3 space-y-3">
              {jobRows.map((j) => <JobCard key={j.id} job={j} />)}
            </ul>
          )}
        </section>
      </div>
    </>
  );
}

function JobCard({ job: j }: { job: Job }) {
  const created = j.output?.created ?? [];
  const skipped = j.output?.skipped ?? [];
  const an = j.output?.analysis;
  return (
    <li className="rounded-xl border border-border p-4 text-sm">
      <div className="flex flex-wrap items-center gap-2">
        <span className="font-medium text-ink">{j.kind === "paper_analysis" ? "Pattern analysis" : "Question drafts"} · {j.input?.subject ?? "—"}{j.input?.topic ? ` · ${j.input.topic}` : ""}</span>
        <Badge tone={j.status === "succeeded" ? "green" : j.status === "failed" ? "danger" : "warning"}>{j.status}</Badge>
        {j.output?.used_fallback ? <Badge tone="outline">fallback model used</Badge> : null}
        <span className="text-xs text-muted-foreground">{formatDate(j.created_at)} · {j.model}{j.input_tokens ? ` · ${j.input_tokens.toLocaleString()} in / ${(j.output_tokens ?? 0).toLocaleString()} out tokens` : ""}</span>
      </div>
      {j.error_message ? <p className="mt-2 text-danger">{j.error_message}</p> : null}
      {created.length ? (
        <ul className="mt-2 space-y-1">
          {created.map((c, i) => (
            <li key={c.id}>
              <Link href={`/admin/questions/${c.id}`} className="font-medium text-primary hover:underline">Draft {i + 1}</Link>
              <span className="text-muted-foreground"> · confidence {c.confidence}{c.fact_check_notes ? ` · check: ${c.fact_check_notes}` : ""}</span>
            </li>
          ))}
        </ul>
      ) : null}
      {skipped.length ? <p className="mt-2 text-xs text-muted-foreground">Skipped: {skipped.map((s) => s.reason).join("; ")}</p> : null}
      {an ? (
        <div className="mt-3 space-y-2">
          <p>{an.summary}</p>
          {an.frequent_topics.length ? <p><span className="font-medium">Frequent topics:</span> {an.frequent_topics.map((t) => `${t.topic} (${t.share})`).join(", ")}</p> : null}
          {an.question_styles.length ? <p><span className="font-medium">Styles:</span> {an.question_styles.join("; ")}</p> : null}
          <p><span className="font-medium">Difficulty:</span> {an.difficulty_observations}</p>
          <p><span className="font-medium">Trends:</span> {an.trends}</p>
          {an.gaps_and_suggestions.length ? <p><span className="font-medium">Suggestions:</span> {an.gaps_and_suggestions.join("; ")}</p> : null}
          <p className="text-xs text-muted-foreground">AI analysis of {j.input?.questions ?? "?"} past questions — a guide for drafting, not a prediction.</p>
        </div>
      ) : null}
    </li>
  );
}
