import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { SelectField, TextField } from "@/components/app/fields";
import { DocumentUploader } from "@/components/admin/document-uploader";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { DOC_TYPE_LABELS, JOB_LABELS, USAGE_LABELS } from "@/lib/admin/document-labels";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { importFromUrl } from "./actions";

export const metadata: Metadata = { title: "Imports" };

const TYPE_OPTIONS = Object.entries(DOC_TYPE_LABELS).filter(([k]) => k !== "news").map(([value, label]) => ({ value, label }));

type Doc = { id: string; title: string; document_type: string; exam_year: number | null; stage: string | null; usage_status: string; origin: string; page_count: number | null; processing_status: string; created_at: string; import_candidates: { status: string }[] };
type Job = { id: string; url: string | null; filename: string | null; status: string; error_message: string | null; created_at: string; document_id: string | null; log: { step: string; message: string }[] };

export default async function ImportsPage() {
  await requirePermission("imports.run", "/admin/imports");
  const db = await createClient();
  const [{ data: docs }, { data: jobs }] = await Promise.all([
    db.from("source_documents").select("id, title, document_type, exam_year, stage, usage_status, origin, page_count, processing_status, created_at, import_candidates(status)").order("exam_year", { ascending: false, nullsFirst: false }).order("created_at", { ascending: false }).limit(300),
    db.from("import_jobs").select("id, url, filename, status, error_message, created_at, document_id, log").order("created_at", { ascending: false }).limit(15),
  ]);

  return (
    <>
      <PageTitle
        title="Imports"
        description="Bring official documents into Soma. Each file is stored privately with its source; questions found in past papers are extracted for your review. Nothing is published automatically."
      />

      <div className="grid gap-6 xl:grid-cols-2">
        <section className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Upload PDFs</h2>
          <p className="mb-4 mt-1 text-sm text-muted-foreground">Recommended for past papers you have received. Year and stage are guessed from file names — check them before uploading.</p>
          <DocumentUploader />
        </section>
        <section className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Import from an RCSC link</h2>
          <p className="mb-4 mt-1 text-sm text-muted-foreground">
            Paste the link to a PDF on rcsc.gov.bt. Soma fetches only that file. If the site refuses automated access, download it yourself and upload it.
          </p>
          <ActionForm action={importFromUrl} submitLabel="Import link">
            <TextField name="url" label="PDF link" hint="https://www.rcsc.gov.bt/…/paper.pdf" required />
            <TextField name="title" label="Title" hint="e.g. BCSE 2026 Announcement" required />
            <div className="grid gap-3 sm:grid-cols-3">
              <SelectField name="document_type" label="Type" defaultValue="past_paper" options={TYPE_OPTIONS} />
              <TextField type="number" name="exam_year" label="Exam year" />
              <SelectField name="stage" label="Stage" defaultValue="" options={[{ value: "", label: "—" }, { value: "PE", label: "PE" }, { value: "ME", label: "ME" }]} />
            </div>
          </ActionForm>
        </section>
      </div>

      <section className="mt-10">
        <h2 className="text-lg font-semibold">Documents</h2>
        {(docs ?? []).length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No documents yet.</p> : (
          <ul className="mt-3 divide-y divide-border rounded-xl border border-border">
            {((docs ?? []) as unknown as Doc[]).map((d) => {
              const pending = d.import_candidates.filter((c) => c.status === "pending").length;
              const accepted = d.import_candidates.filter((c) => c.status === "accepted").length;
              const usage = USAGE_LABELS[d.usage_status] ?? USAGE_LABELS.unknown;
              return (
                <li key={d.id}>
                  <Link href={`/admin/imports/${d.id}`} className="flex flex-col gap-1 p-4 hover:bg-muted/50 sm:flex-row sm:items-center sm:gap-4">
                    <span className="min-w-0 flex-1">
                      <span className="block truncate font-medium text-ink">{d.title}</span>
                      <span className="text-xs text-muted-foreground">
                        {DOC_TYPE_LABELS[d.document_type]}{d.exam_year ? ` · ${d.exam_year}` : ""}{d.stage ? ` · ${d.stage}` : ""}{d.page_count ? ` · ${d.page_count} pages` : ""} · {d.origin === "upload" ? "uploaded" : "from link"} {formatDate(d.created_at)}
                      </span>
                    </span>
                    <span className="flex flex-wrap items-center gap-2 text-xs">
                      {pending ? <Badge tone="warning">{pending} to review</Badge> : null}
                      {accepted ? <Badge tone="green">{accepted} accepted</Badge> : null}
                      <Badge tone={usage.tone}>{usage.label}</Badge>
                    </span>
                  </Link>
                </li>
              );
            })}
          </ul>
        )}
      </section>

      <section className="mt-10">
        <h2 className="text-lg font-semibold">Recent import activity</h2>
        <ul className="mt-3 space-y-2">
          {((jobs ?? []) as Job[]).map((j) => {
            const s = JOB_LABELS[j.status] ?? JOB_LABELS.queued;
            return (
              <li key={j.id} className="rounded-lg border border-border p-3 text-sm">
                <div className="flex flex-wrap items-center gap-2">
                  <Badge tone={s.tone}>{s.label}</Badge>
                  <span className="min-w-0 flex-1 truncate text-ink">{j.filename ?? j.url}</span>
                  <span className="text-xs text-muted-foreground">{formatDate(j.created_at)}</span>
                  {j.document_id ? <Link href={`/admin/imports/${j.document_id}`} className="text-xs font-medium text-primary hover:underline">Open</Link> : null}
                </div>
                {j.error_message ? <p className="mt-1 text-danger">{j.error_message}</p> : null}
                {j.log?.length ? (
                  <details className="mt-1">
                    <summary className="cursor-pointer text-xs text-muted-foreground">Steps</summary>
                    <ol className="mt-1 list-decimal space-y-0.5 pl-5 text-xs text-muted-foreground">{j.log.map((l, i) => <li key={i}>{l.message}</li>)}</ol>
                  </details>
                ) : null}
              </li>
            );
          })}
        </ul>
      </section>
    </>
  );
}
