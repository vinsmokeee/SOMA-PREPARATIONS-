import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { VerificationBadge } from "@/components/site/official";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Field, Label, Select } from "@/components/ui/input";
import { AreaField, SelectField, TextField, VERIFICATION_OPTIONS } from "@/components/app/fields";
import { requirePermission } from "@/lib/auth/dal";
import type { Category, Cycle, Paper } from "@/lib/data/types";
import { createClient } from "@/lib/supabase/server";
import { formatPercent, toRoman } from "@/lib/utils";
import { updateCategory, updateCycle, updatePaper } from "../actions";

export const metadata: Metadata = { title: "Examination structure" };

const CYCLE_STATUSES = ["planned", "announced", "registration_open", "pe_completed", "me_completed", "closed"] as const;

export default async function ExamStructurePage() {
  await requirePermission("exam_config.manage", "/admin/exam-structure");
  const db = await createClient();
  const [fw, cycles, categories, papers, links, sources] = await Promise.all([
    db.from("exam_frameworks").select("id, name, description, verification_status, is_current").order("created_at"),
    db.from("exam_cycles").select("*").order("year", { ascending: false }),
    db.from("exam_categories").select("*").order("sort_order"),
    db.from("exam_papers").select("*").order("sort_order"),
    db.from("exam_paper_categories").select("paper_id, category_id"),
    db.from("source_documents").select("id, title, url"),
  ]);
  const catById = new Map((categories.data ?? []).map((c) => [c.id as string, c as Category & { is_active: boolean; updated_at: string }]));
  const sourceById = new Map((sources.data ?? []).map((s) => [s.id as string, s as { title: string; url: string }]));
  const loadError = [fw, cycles, categories, papers, links].some((r) => r.error);

  return (
    <>
      <PageTitle
        title="Examination structure"
        description="Official BCSE information shown across the site. Every value should match a recorded RCSC source. Leave a field empty when the source does not state it — the site will say so rather than guess."
      />
      {loadError ? <Alert tone="danger" className="mb-6">Some data could not be loaded.</Alert> : null}

      <section className="space-y-3">
        <h2 className="text-lg font-semibold">Framework</h2>
        {(fw.data ?? []).map((f) => (
          <div key={f.id} className="rounded-lg border border-border p-4">
            <div className="flex flex-wrap items-center gap-2">
              <p className="font-semibold text-ink">{f.name}</p>
              {f.is_current ? <Badge tone="solid">Current</Badge> : null}
              <VerificationBadge status={f.verification_status} />
            </div>
            {f.description ? <p className="mt-1 text-sm text-muted-foreground">{f.description}</p> : null}
          </div>
        ))}
      </section>

      <section className="mt-10 space-y-3">
        <h2 className="text-lg font-semibold">Examination cycles</h2>
        {((cycles.data ?? []) as (Cycle & { updated_at: string })[]).map((c) => (
          <details key={c.id} className="group rounded-lg border border-border">
            <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
              <span className="font-semibold text-ink">{c.name}</span>
              <Badge>{c.status.replace("_", " ")}</Badge>
              <VerificationBadge status={c.verification_status} />
              <span className="ml-auto text-sm text-primary group-open:hidden">Edit</span>
            </summary>
            <div className="border-t border-border p-4">
              <SourceLine source={c.source_document_id ? sourceById.get(c.source_document_id) : undefined} />
              <ActionForm key={String(c.updated_at)} action={updateCycle} submitLabel="Save cycle">
                <input type="hidden" name="id" value={c.id} />
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                  <TextField name="name" label="Name" defaultValue={c.name} />
                  <Field>
                    <Label htmlFor={`status-${c.id}`}>Status</Label>
                    <Select id={`status-${c.id}`} name="status" defaultValue={c.status}>
                      {CYCLE_STATUSES.map((s) => <option key={s} value={s}>{s.replace("_", " ")}</option>)}
                    </Select>
                  </Field>
                  <VerificationSelect id={c.id} value={c.verification_status} />
                  <TextField type="date" name="registration_opens" label="Registration opens" defaultValue={c.registration_opens} />
                  <TextField type="date" name="registration_closes" label="Registration closes" defaultValue={c.registration_closes} />
                  <TextField type="date" name="pe_date" label="PE date" defaultValue={c.pe_date} />
                  <TextField type="date" name="me_start_date" label="ME starts" defaultValue={c.me_start_date} />
                  <TextField type="date" name="me_end_date" label="ME ends" defaultValue={c.me_end_date} />
                </div>
                <AreaField name="pe_cutoff_note" label="PE cut-off note (public)" defaultValue={c.pe_cutoff_note} />
                <AreaField name="notes" label="Internal notes" defaultValue={c.notes} />
              </ActionForm>
            </div>
          </details>
        ))}
      </section>

      <section className="mt-10 space-y-3">
        <h2 className="text-lg font-semibold">ME categories</h2>
        {[...catById.values()].map((c) => (
          <details key={c.id} className="group rounded-lg border border-border">
            <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
              <span className="font-semibold text-ink">{c.name}</span>
              {c.pe_exempt ? <Badge tone="outline">PE exempt</Badge> : null}
              {!c.is_active ? <Badge tone="warning">Hidden</Badge> : null}
              <span className="ml-auto text-sm text-primary group-open:hidden">Edit</span>
            </summary>
            <div className="border-t border-border p-4">
              <ActionForm key={String(c.updated_at)} action={updateCategory} submitLabel="Save category">
                <input type="hidden" name="id" value={c.id} />
                <TextField name="name" label="Name" defaultValue={c.name} />
                <AreaField name="description" label="Description (public)" defaultValue={c.description} />
                <AreaField name="eligibility_summary" label="Academic requirement (public)" defaultValue={c.eligibility_summary} />
                <div className="flex flex-wrap gap-6 text-sm">
                  <label className="flex items-center gap-2"><input type="checkbox" name="pe_exempt" defaultChecked={c.pe_exempt} className="size-4 accent-[var(--primary)]" /> Exempt from PE</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="is_active" defaultChecked={c.is_active} className="size-4 accent-[var(--primary)]" /> Shown on the site</label>
                </div>
              </ActionForm>
            </div>
          </details>
        ))}
      </section>

      <section className="mt-10 space-y-3">
        <h2 className="text-lg font-semibold">Papers</h2>
        <p className="text-sm text-muted-foreground">
          Paper weightage is the percentage of the overall ME result. PE numeric parameters are empty because the recorded
          RCSC announcement does not state them.
        </p>
        {((papers.data ?? []) as (Paper & { updated_at: string })[]).map((p) => {
          const cats = (links.data ?? []).filter((l) => l.paper_id === p.id).map((l) => catById.get(l.category_id)?.name).filter(Boolean);
          return (
            <details key={p.id} className="group rounded-lg border border-border">
              <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
                <Badge tone="solid">{p.stage}</Badge>
                <span className="font-semibold text-ink">
                  {p.paper_number ? `Paper ${toRoman(p.paper_number)} · ` : ""}
                  {p.title}
                </span>
                {p.weightage_percent !== null ? <span className="text-sm text-muted-foreground">{formatPercent(p.weightage_percent)}</span> : null}
                <VerificationBadge status={p.verification_status} />
                <span className="w-full text-xs text-muted-foreground">{cats.join(" · ")}</span>
              </summary>
              <div className="border-t border-border p-4">
                <SourceLine source={p.source_document_id ? sourceById.get(p.source_document_id) : undefined} />
                <ActionForm key={String(p.updated_at)} action={updatePaper} submitLabel="Save paper">
                  <input type="hidden" name="id" value={p.id} />
                  <TextField name="title" label="Title" defaultValue={p.title} />
                  <AreaField name="description" label="Description (public)" defaultValue={p.description} />
                  <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                    <TextField type="number" step="0.01" name="weightage_percent" label="Weightage %" defaultValue={p.weightage_percent} />
                    <TextField type="number" name="duration_minutes" label="Duration (minutes)" defaultValue={p.duration_minutes} />
                    <TextField type="number" name="question_count" label="Number of questions" defaultValue={p.question_count} />
                    <TextField type="number" step="0.01" name="max_marks" label="Total marks" defaultValue={p.max_marks} />
                  </div>
                  <VerificationSelect id={p.id} value={p.verification_status} />
                </ActionForm>
              </div>
            </details>
          );
        })}
      </section>
    </>
  );
}

function SourceLine({ source }: { source?: { title: string; url: string } }) {
  return (
    <p className="mb-4 text-sm text-muted-foreground">
      Source:{" "}
      {source ? (
        <a href={source.url} target="_blank" rel="noopener noreferrer" className="font-medium text-primary hover:underline">{source.title}</a>
      ) : (
        <span className="text-warning">none recorded</span>
      )}
    </p>
  );
}

function VerificationSelect({ value }: { id: string; value: string }) {
  return <SelectField name="verification_status" label="Verification" defaultValue={value} options={VERIFICATION_OPTIONS} />;
}

