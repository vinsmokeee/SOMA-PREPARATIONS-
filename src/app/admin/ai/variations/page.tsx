import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Field, FieldHint, Input, Label, Select } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { getAiProvider } from "@/lib/ai";
import { VARIATION_TYPES } from "@/lib/ai/question-variations";
import { createClient } from "@/lib/supabase/server";
import { batchVariationsAction, generateVariationsAction } from "../variation-actions";

export const metadata: Metadata = { title: "AI question variations" };
// Writing and checking variations takes up to a few minutes.
export const maxDuration = 300;

const DEFAULT_TYPES = ["new_scenario", "other_angle", "harder"];

function TypeChoices() {
  return (
    <fieldset>
      <legend className="text-sm font-medium text-ink">Variation types (one question each)</legend>
      <div className="mt-2 grid gap-2 sm:grid-cols-2">
        {VARIATION_TYPES.map((v) => (
          <label key={v.key} className="flex items-start gap-2 rounded-lg border border-border p-2 text-sm has-[:checked]:border-primary">
            <input type="checkbox" name="types" value={v.key} defaultChecked={DEFAULT_TYPES.includes(v.key)} className="mt-0.5 size-4 accent-[var(--primary)]" />
            <span><span className="font-medium text-ink">{v.label}</span><span className="block text-muted-foreground">{v.instruction}</span></span>
          </label>
        ))}
      </div>
    </fieldset>
  );
}

export default async function VariationsPage({ searchParams }: PageProps<"/admin/ai/variations">) {
  await requirePermission("ai.run", "/admin/ai/variations");
  const sp = await searchParams;
  const search = typeof sp.q === "string" ? sp.q.trim().slice(0, 100) : "";
  const subjectFilter = typeof sp.subject === "string" && /^[0-9a-f-]{36}$/i.test(sp.subject) ? sp.subject : "";
  const preselected = typeof sp.source === "string" && /^[0-9a-f-]{36}$/i.test(sp.source) ? sp.source : "";
  const db = await createClient();
  let q = db.from("questions").select("id, stem, stage, question_type, origin, source_year, subjects(name)")
    .in("status", ["verified", "published"]).order("created_at", { ascending: false }).limit(40);
  if (search) q = q.ilike("stem", `%${search}%`);
  if (subjectFilter) q = q.eq("subject_id", subjectFilter);
  if (preselected) q = db.from("questions").select("id, stem, stage, question_type, origin, source_year, subjects(name)").eq("id", preselected);
  const [{ data: sources }, { data: subjects }, { data: overview }] = await Promise.all([
    q,
    db.from("subjects").select("id, stage, name").eq("is_active", true).order("stage").order("sort_order"),
    db.rpc("ai_question_overview"),
  ]);
  const o = overview as { awaiting_review: number; flagged: number; variations: number } | null;
  const configured = Boolean(getAiProvider());

  return (
    <>
      <PageTitle
        title="AI question variations"
        description="Turn a verified question into new questions that test the same concept differently. Every draft is checked automatically, then waits for your approval. Nothing reaches students until you approve it."
      />
      {!configured ? <Alert tone="warning" className="mb-6">AI is not configured. Add ANTHROPIC_API_KEY in Vercel.</Alert> : null}
      {o ? (
        <p className="mb-6 text-sm text-muted-foreground">
          {o.variations} variations so far · <Link href="/admin/ai/review" className="font-medium text-primary hover:underline">{o.awaiting_review} drafts waiting for review{o.flagged ? ` (${o.flagged} flagged)` : ""}</Link>
        </p>
      ) : null}

      <div className="grid gap-8 xl:grid-cols-2">
        <section className="rounded-xl border border-border p-5">
          <h2 className="text-lg font-semibold">Vary one question</h2>
          <form className="mt-3 flex flex-wrap gap-2" role="search">
            <Input name="q" defaultValue={search} placeholder="Search question text" aria-label="Search question text" className="h-10 flex-1" />
            <Select name="subject" defaultValue={subjectFilter} aria-label="Subject" className="h-10 w-48">
              <option value="">All subjects</option>
              {(subjects ?? []).map((s) => <option key={s.id} value={s.id}>{s.stage} · {s.name}</option>)}
            </Select>
            <button type="submit" className="h-10 rounded-md border border-border-strong px-4 text-sm font-medium">Find</button>
          </form>
          <ActionForm action={generateVariationsAction} submitLabel="Write variations" className="mt-4 space-y-4">
            <fieldset>
              <legend className="text-sm font-medium text-ink">Source question (verified or published)</legend>
              {(sources ?? []).length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No matching questions.</p> : null}
              <ul className="mt-2 max-h-80 space-y-2 overflow-y-auto">
                {(sources ?? []).map((s) => (
                  <li key={s.id}>
                    <label className="flex cursor-pointer items-start gap-2 rounded-lg border border-border p-2 text-sm has-[:checked]:border-primary has-[:checked]:bg-primary-soft">
                      <input type="radio" name="source_id" value={s.id} defaultChecked={s.id === preselected} required className="mt-1" />
                      <span className="min-w-0">
                        <span className="line-clamp-2 text-ink">{s.stem}</span>
                        <span className="mt-0.5 flex flex-wrap gap-1 text-xs text-muted-foreground">
                          {s.stage} · {(s.subjects as unknown as { name: string } | null)?.name ?? "No subject"} · {s.question_type === "mcq" ? "MCQ" : "written"}
                          {s.origin === "historical_official" ? <Badge tone="outline">RCSC {s.source_year ?? "past paper"}</Badge> : null}
                        </span>
                      </span>
                    </label>
                  </li>
                ))}
              </ul>
            </fieldset>
            <TypeChoices />
            <FieldHint>Cost per question, including the automatic check: about $0.01–0.02 for multiple choice, about $0.07 for written questions. Takes 1–2 minutes.</FieldHint>
          </ActionForm>
        </section>

        <section className="rounded-xl border border-border p-5">
          <h2 className="text-lg font-semibold">Batch: vary several questions in a subject</h2>
          <p className="mt-1 text-sm text-muted-foreground">Soma picks the questions with the fewest variations, past RCSC questions first.</p>
          <ActionForm action={batchVariationsAction} submitLabel="Write batch" className="mt-4 space-y-4">
            <Field>
              <Label htmlFor="b-subject">Subject</Label>
              <Select id="b-subject" name="subject_id" required defaultValue="" className="h-10">
                <option value="" disabled>Choose a subject</option>
                {(subjects ?? []).map((s) => <option key={s.id} value={s.id}>{s.stage} · {s.name}</option>)}
              </Select>
            </Field>
            <Field>
              <Label htmlFor="b-count">Questions to vary</Label>
              <Select id="b-count" name="sources" defaultValue="3" className="h-10">
                <option value="1">1</option><option value="2">2</option><option value="3">3</option>
              </Select>
              <FieldHint>Up to 3 per run (about 3 minutes). Run it again for more.</FieldHint>
            </Field>
            <TypeChoices />
          </ActionForm>
        </section>
      </div>
    </>
  );
}
