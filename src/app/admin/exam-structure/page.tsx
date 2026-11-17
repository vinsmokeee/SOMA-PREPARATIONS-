import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { VerificationBadge } from "@/components/site/official";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Field, Label, Select } from "@/components/ui/input";
import { AreaField, SelectField, TextField, VERIFICATION_OPTIONS } from "@/components/app/fields";
import { requirePermission } from "@/lib/auth/dal";
import type { Category, Cycle, Paper, VerificationStatus } from "@/lib/data/types";
import { createClient } from "@/lib/supabase/server";
import { formatPercent, toRoman } from "@/lib/utils";
import { createSpecialisation, createSubjectGroup, deletePaperSection, saveCutoff, savePaperSection, updateCategory, updateCycle, updatePaper, updateSpecialisation, updateSubjectGroup } from "../actions";
import { PARAMS_SOURCE_OPTIONS, PUBLIC_GROUP_LABELS } from "@/lib/exam/entry";

export const metadata: Metadata = { title: "Examination structure" };

const CYCLE_STATUSES = ["planned", "announced", "registration_open", "pe_completed", "me_completed", "closed"] as const;

export default async function ExamStructurePage() {
  await requirePermission("exam_config.manage", "/admin/exam-structure");
  const db = await createClient();
  const [fw, cycles, categories, papers, links, sources, sectionsRes, specsRes, groupsRes, cutoffsRes, subjectsRes] = await Promise.all([
    db.from("exam_frameworks").select("id, name, description, verification_status, is_current").order("created_at"),
    db.from("exam_cycles").select("*").order("year", { ascending: false }),
    db.from("exam_categories").select("*").order("sort_order"),
    db.from("exam_papers").select("*").order("sort_order"),
    db.from("exam_paper_categories").select("paper_id, category_id"),
    db.from("source_documents").select("id, title, url"),
    db.from("paper_sections").select("*").order("sort_order"),
    db.from("specialisations").select("*").order("sort_order"),
    db.from("subject_groups").select("*").order("sort_order"),
    db.from("pe_cutoff_history").select("*").order("year", { ascending: false }),
    db.from("subjects").select("id, stage, name, paper_id").order("sort_order"),
  ]);
  const sections = (sectionsRes.data ?? []) as Section[];
  const specs = (specsRes.data ?? []) as Spec[];
  const groups = (groupsRes.data ?? []) as Group[];
  const cutoffs = (cutoffsRes.data ?? []) as Cutoff[];
  const subjects = (subjectsRes.data ?? []) as { id: string; stage: string; name: string; paper_id: string | null }[];
  const technical = (categories.data ?? []).find((c) => c.code === "technical");
  const groupOptions = [{ value: "", label: "Own Paper II bank (not linked)" }, ...groups.map((g) => ({ value: g.id, label: g.name }))];
  const catById = new Map((categories.data ?? []).map((c) => [c.id as string, c as Category & { is_active: boolean; is_offered: boolean; public_group: string | null; pe_rule_note: string | null; updated_at: string }]));
  const sourceById = new Map((sources.data ?? []).map((s) => [s.id as string, s as { title: string; url: string }]));
  const loadError = [fw, cycles, categories, papers, links, sectionsRes, specsRes, groupsRes, cutoffsRes].some((r) => r.error);

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
              {c.public_group ? <Badge>{PUBLIC_GROUP_LABELS[c.public_group]}</Badge> : null}
              {c.pe_exempt ? <Badge tone="outline">PE exempt</Badge> : null}
              {!c.is_active ? <Badge tone="warning">Hidden</Badge> : null}
              {!c.is_offered ? <Badge tone="warning">Not offered</Badge> : null}
              <span className="ml-auto text-sm text-primary group-open:hidden">Edit</span>
            </summary>
            <div className="border-t border-border p-4">
              <ActionForm key={String(c.updated_at)} action={updateCategory} submitLabel="Save category">
                <input type="hidden" name="id" value={c.id} />
                <TextField name="name" label="Name" defaultValue={c.name} />
                <AreaField name="description" label="Description (public)" defaultValue={c.description} />
                <AreaField name="eligibility_summary" label="Academic requirement (public)" defaultValue={c.eligibility_summary} />
                <SelectField name="public_group" label="Shown to students as" defaultValue={c.public_group ?? ""} options={[{ value: "", label: "—" }, ...Object.entries(PUBLIC_GROUP_LABELS).map(([value, label]) => ({ value, label }))]} />
                <AreaField name="pe_rule_note" label="PE eligibility note (source and rule)" defaultValue={c.pe_rule_note} />
                <div className="flex flex-wrap gap-6 text-sm">
                  <label className="flex items-center gap-2"><input type="checkbox" name="pe_exempt" defaultChecked={c.pe_exempt} className="size-4 accent-[var(--primary)]" /> Exempt from PE</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="is_active" defaultChecked={c.is_active} className="size-4 accent-[var(--primary)]" /> Shown on the site</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="is_offered" defaultChecked={c.is_offered} className="size-4 accent-[var(--primary)]" /> Students can choose it (Soma offers preparation)</label>
                </div>
              </ActionForm>
            </div>
          </details>
        ))}
      </section>

      <section className="mt-10 space-y-3">
        <h2 className="text-lg font-semibold">Papers</h2>
        <p className="text-sm text-muted-foreground">
          Paper weightage is the percentage of the overall ME result. &quot;Values from&quot; says where marks, duration and question
          count come from; only choose &quot;Official&quot; when an RCSC document states them.
        </p>
        {((papers.data ?? []) as PaperRow[]).map((p) => {
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
                {p.params_source && p.params_source !== "official" ? <Badge tone="warning">{p.params_source === "founder_brief" ? "Values from brief" : "Values set by admin"}</Badge> : null}
                {p.bank_scope !== "common" ? <Badge tone="outline">{p.bank_scope === "subject_group" ? "Bank per Paper II group" : "Bank per specialisation"}</Badge> : null}
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
                    <TextField type="number" step="0.01" name="qualifying_marks" label="Qualifying mark (Soma setting)" defaultValue={p.qualifying_marks} hint="Not an RCSC rule. Leave empty if unknown." />
                    <SelectField name="params_source" label="Values from" defaultValue={p.params_source ?? ""} options={PARAMS_SOURCE_OPTIONS} />
                    <SelectField name="bank_scope" label="Question bank" defaultValue={p.bank_scope} options={BANK_SCOPE_OPTIONS} />
                  </div>
                  <AreaField name="params_note" label="Note on these values" defaultValue={p.params_note} />
                  <VerificationSelect id={p.id} value={p.verification_status} />
                </ActionForm>
                <PaperSections paper={p} sections={sections.filter((x) => x.paper_id === p.id)} subjects={subjects.filter((x) => x.stage === p.stage)} />
              </div>
            </details>
          );
        })}
      </section>

      <section className="mt-10 space-y-3" aria-labelledby="specs-h">
        <h2 id="specs-h" className="text-lg font-semibold">Specialisations (Technical Paper III and B.Ed. graduate types)</h2>
        <p className="text-sm text-muted-foreground">
          Paper I is common to all technical graduates. Paper II uses the specialisation&apos;s group bank, or its own bank
          when no group is linked. Paper III is always per specialisation. Link a group only after checking RCSC&apos;s
          paper for that year. &quot;PE required&quot; is left unset until checked. Students can only choose
          specialisations that are <b>Active</b>; switch them on or off each year from the RCSC vacancy announcement.
          Inactive ones stay for classifying old papers.
        </p>
        {specs.map((sp) => (
          <details key={sp.id} className="group rounded-lg border border-border">
            <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
              <span className="font-semibold text-ink">{sp.name}</span>
              <Badge tone="outline">{groups.find((g) => g.id === sp.subject_group_id)?.name ?? "Own Paper II bank"}</Badge>
              <Badge tone={sp.pe_required === null ? "warning" : "outline"}>{sp.pe_required === null ? "PE: not set" : sp.pe_required ? "PE required" : "PE exempt"}</Badge>
              {sp.review_note ? <Badge tone="warning">Review</Badge> : null}
              {!sp.is_active ? <Badge tone="warning">Not offered</Badge> : null}
              {sp.list_source ? <Badge tone="outline">{sp.list_source}</Badge> : null}
              <VerificationBadge status={sp.verification_status} />
              <span className="ml-auto text-sm text-primary group-open:hidden">Edit</span>
            </summary>
            <div className="border-t border-border p-4">
              {sp.review_note ? <Alert tone="warning" className="mb-4">{sp.review_note}</Alert> : null}
              <ActionForm key={String(sp.updated_at)} action={updateSpecialisation} submitLabel="Save specialisation">
                <input type="hidden" name="id" value={sp.id} />
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                  <TextField name="name" label="Name" defaultValue={sp.name} />
                  <SelectField name="subject_group_id" label="Paper II bank" defaultValue={sp.subject_group_id ?? ""} options={groupOptions} />
                  <SelectField name="pe_required" label="PE required" defaultValue={sp.pe_required === null ? "" : sp.pe_required ? "yes" : "no"} options={PE_REQUIRED_OPTIONS} />
                  <TextField type="number" name="sort_order" label="Order" defaultValue={sp.sort_order} />
                </div>
                <div className="grid gap-4 sm:grid-cols-2">
                  <TextField name="list_source" label="Listed in (RCSC source)" defaultValue={sp.list_source ?? ""} />
                  <TextField name="offered_years" label="BCSE years offered (e.g. 2025, 2026)" defaultValue={(sp.offered_years ?? []).join(", ")} />
                </div>
                <AreaField name="pe_rule_note" label="PE rule note (source)" defaultValue={sp.pe_rule_note} />
                <AreaField name="review_note" label="Review note (internal)" defaultValue={sp.review_note} hint="Clear it once resolved." />
                <VerificationSelect id={sp.id} value={sp.verification_status} />
                <label className="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" defaultChecked={sp.is_active} className="size-4 accent-[var(--primary)]" /> Active: offered this year (students can choose it)</label>
              </ActionForm>
            </div>
          </details>
        ))}
        {technical ? (
          <ActionForm action={createSpecialisation} submitLabel="Add specialisation" className="grid gap-3 rounded-lg border border-dashed border-border-strong p-4 sm:grid-cols-[1fr_1fr_auto]">
            <input type="hidden" name="category_id" value={technical.id as string} />
            <TextField name="name" label="New specialisation" />
            <TextField name="code" label="Code (e.g. water-engineering)" />
          </ActionForm>
        ) : null}
      </section>

      <section className="mt-10 space-y-3" aria-labelledby="groups-h">
        <h2 id="groups-h" className="text-lg font-semibold">Technical Paper II groups</h2>
        <p className="text-sm text-muted-foreground">Groups that share one Paper II, as set by RCSC. Specialisations linked to a group share its Paper II questions.</p>
        {groups.map((g) => (
          <details key={g.id} className="group rounded-lg border border-border">
            <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
              <span className="font-semibold text-ink">{g.name}</span>
              <span className="text-sm text-muted-foreground">{specs.filter((s) => s.subject_group_id === g.id).length} linked</span>
              <VerificationBadge status={g.verification_status} />
              {!g.is_active ? <Badge tone="warning">Inactive</Badge> : null}
              <span className="ml-auto text-sm text-primary group-open:hidden">Edit</span>
            </summary>
            <div className="border-t border-border p-4">
              <ActionForm key={String(g.updated_at)} action={updateSubjectGroup} submitLabel="Save group">
                <input type="hidden" name="id" value={g.id} />
                <TextField name="name" label="Name" defaultValue={g.name} />
                <AreaField name="notes" label="Notes (source)" defaultValue={g.notes} />
                <VerificationSelect id={g.id} value={g.verification_status} />
                <label className="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" defaultChecked={g.is_active} className="size-4 accent-[var(--primary)]" /> Active</label>
              </ActionForm>
            </div>
          </details>
        ))}
        <ActionForm action={createSubjectGroup} submitLabel="Add group" className="grid gap-3 rounded-lg border border-dashed border-border-strong p-4 sm:grid-cols-[1fr_1fr_auto]">
          <TextField name="name" label="New Paper II group" />
          <TextField name="code" label="Code (e.g. agriculture)" />
        </ActionForm>
      </section>

      <section className="mt-10 space-y-3" aria-labelledby="cutoff-h">
        <h2 id="cutoff-h" className="text-lg font-semibold">PE cut-off history (reference only)</h2>
        <p className="text-sm text-muted-foreground">Shown to students as past information. RCSC decides the cut-off each year; it is never applied as a rule.</p>
        {[...cutoffs, null].map((c) => (
          <ActionForm key={c?.id ?? "new"} action={saveCutoff} submitLabel={c ? "Save" : "Add year"} className="grid gap-3 rounded-lg border border-border p-4 sm:grid-cols-2 lg:grid-cols-5">
            <input type="hidden" name="id" value={c?.id ?? ""} />
            <TextField type="number" name="year" label="Year" defaultValue={c?.year} />
            <TextField type="number" step="0.01" name="value" label="Cut-off" defaultValue={c?.value} />
            <SelectField name="unit" label="Unit" defaultValue={c?.unit ?? "percent"} options={[{ value: "percent", label: "Percent" }, { value: "marks", label: "Marks" }]} />
            <VerificationSelect id={c?.id ?? "new"} value={c?.verification_status ?? "unverified"} />
            <TextField name="note" label="Note" defaultValue={c?.note} />
          </ActionForm>
        ))}
      </section>
    </>
  );
}

type PaperRow = Paper & { updated_at: string; qualifying_marks: number | null; bank_scope: string; params_source: string | null; params_note: string | null };
type Section = { id: string; paper_id: string; title: string; subject_id: string | null; question_count: number | null; marks: number | null; formats: string | null; params_source: string | null; sort_order: number; updated_at: string };
type Spec = { id: string; name: string; list_source: string | null; offered_years: number[] | null; subject_group_id: string | null; pe_required: boolean | null; pe_rule_note: string | null; review_note: string | null; verification_status: VerificationStatus; is_active: boolean; sort_order: number; updated_at: string };
type Group = { id: string; name: string; notes: string | null; verification_status: VerificationStatus; is_active: boolean; updated_at: string };
type Cutoff = { id: string; year: number; value: number; unit: string; note: string | null; verification_status: string };

const BANK_SCOPE_OPTIONS = [
  { value: "common", label: "One bank for everyone on this paper" },
  { value: "subject_group", label: "Per Paper II group (or own bank)" },
  { value: "specialisation", label: "Per specialisation" },
];
const PE_REQUIRED_OPTIONS = [
  { value: "", label: "Not set — check the announcement" },
  { value: "yes", label: "Required" },
  { value: "no", label: "Exempt" },
];

function PaperSections({ paper, sections, subjects }: { paper: PaperRow; sections: Section[]; subjects: { id: string; name: string; paper_id: string | null }[] }) {
  const subjectOptions = [{ value: "", label: "—" }, ...subjects.filter((s) => !s.paper_id || s.paper_id === paper.id).map((s) => ({ value: s.id, label: s.name }))];
  return (
    <div className="mt-6 space-y-3">
      <h3 className="text-sm font-semibold text-ink">Sections</h3>
      {sections.length === 0 ? <p className="text-sm text-muted-foreground">No sections defined.</p> : null}
      {[...sections, null].map((s) => (
        <div key={s?.id ?? "new"} className="rounded-md border border-border p-3">
          <ActionForm action={savePaperSection} submitLabel={s ? "Save section" : "Add section"} className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            <input type="hidden" name="id" value={s?.id ?? ""} />
            <input type="hidden" name="paper_id" value={paper.id} />
            <TextField name="title" label="Section" defaultValue={s?.title} />
            <SelectField name="subject_id" label="Subject" defaultValue={s?.subject_id ?? ""} options={subjectOptions} />
            <TextField type="number" name="question_count" label="Questions" defaultValue={s?.question_count} />
            <TextField type="number" step="0.5" name="marks" label="Marks" defaultValue={s?.marks} />
            <TextField name="formats" label="Formats" defaultValue={s?.formats} />
            <SelectField name="params_source" label="Values from" defaultValue={s?.params_source ?? ""} options={PARAMS_SOURCE_OPTIONS} />
            <TextField type="number" name="sort_order" label="Order" defaultValue={s?.sort_order ?? (sections.length + 1) * 10} />
          </ActionForm>
          {s ? (
            <ActionForm action={deletePaperSection} submitLabel="Remove section" variant="secondary" className="mt-2 space-y-0" confirm={`Remove the section "${s.title}"?`}>
              <input type="hidden" name="id" value={s.id} />
            </ActionForm>
          ) : null}
        </div>
      ))}
    </div>
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

