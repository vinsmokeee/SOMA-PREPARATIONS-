import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { AreaField, SelectField, TextField } from "@/components/app/fields";
import { CandidateReview, type ReviewCandidate } from "@/components/admin/candidate-review";
import { DownloadOriginal } from "@/components/admin/download-original";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { can, requirePermission } from "@/lib/auth/dal";
import { DOC_TYPE_LABELS, USAGE_LABELS } from "@/lib/admin/document-labels";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { createHistoricalPaper } from "../../papers/actions";
import { reextractDocument, updateDocument } from "../actions";

export const metadata: Metadata = { title: "Document" };

export default async function DocumentPage({ params, searchParams }: PageProps<"/admin/imports/[id]">) {
  const { id } = await params;
  const user = await requirePermission("imports.run", `/admin/imports/${id}`);
  const sp = await searchParams;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const [{ data: doc }, { data: versions }, { data: cands }, { data: papers }, { data: permissions }, { data: subjects }, { data: categories }, { data: examPapers }] = await Promise.all([
    db.from("source_documents").select("*").eq("id", id).maybeSingle(),
    db.from("source_document_versions").select("id, version_number, sha256, byte_size, page_count, retrieved_at, change_summary, extracted_text").eq("document_id", id).order("version_number", { ascending: false }),
    db.from("import_candidates").select("id, number, section, stem, options, answer_label, answer_source, page, confidence, issues, status, question_id").eq("document_id", id).order("number", { nullsFirst: false }),
    db.from("historical_papers").select("id, original_title, exam_year, stage").eq("source_document_id", id),
    db.from("usage_permissions").select("id, title, allows_reproduction"),
    db.from("subjects").select("id, name, stage").eq("is_active", true).order("sort_order"),
    db.from("exam_categories").select("id, name").eq("is_active", true).order("sort_order"),
    db.from("exam_papers").select("id, title, stage").order("sort_order"),
  ]);
  if (!doc) notFound();
  const usage = USAGE_LABELS[doc.usage_status] ?? USAGE_LABELS.unknown;
  const latest = versions?.[0];
  const canManage = can(user, "papers.manage");

  return (
    <>
      <Link href="/admin/imports" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Imports
      </Link>
      <div className="mt-3">
        <PageTitle
          title={doc.title}
          description={
            <span className="inline-flex flex-wrap items-center gap-2">
              <Badge>{DOC_TYPE_LABELS[doc.document_type]}</Badge>
              <Badge tone={usage.tone}>{usage.label}</Badge>
              {doc.exam_year ? <span>{doc.exam_year}</span> : null}
              {doc.stage ? <span>· {doc.stage}</span> : null}
              {doc.page_count ? <span>· {doc.page_count} pages</span> : null}
            </span>
          }
          actions={<DownloadOriginal documentId={doc.id} />}
        />
      </div>
      {sp.imported === "1" ? <Alert tone="success" className="mb-6">Document imported. Review the extracted questions below.</Alert> : null}

      <div className="grid gap-8 xl:grid-cols-[1fr_360px]">
        <section>
          <div className="mb-4 flex flex-wrap items-center justify-between gap-3">
            <h2 className="text-lg font-semibold">Extracted questions</h2>
            {doc.document_type === "past_paper" ? (
              <ActionForm action={reextractDocument} submitLabel="Re-run extraction" variant="secondary" confirm="Re-run extraction? Pending (unreviewed) candidates will be replaced; accepted and rejected ones are kept." className="space-y-0">
                <input type="hidden" name="id" value={doc.id} />
              </ActionForm>
            ) : null}
          </div>
          {doc.document_type !== "past_paper" ? (
            <p className="text-sm text-muted-foreground">Questions are only extracted from documents of type “Past paper”. Change the type on the right and re-run extraction if needed.</p>
          ) : (cands ?? []).length === 0 ? (
            <Alert tone="warning" title="No questions were found">
              The layout may not be recognised yet, or the PDF may be scanned. Open the extracted text below to check what was read.
            </Alert>
          ) : (
            <CandidateReview
              candidates={(cands ?? []) as ReviewCandidate[]}
              subjects={(subjects ?? []).filter((s) => !doc.stage || s.stage === doc.stage)}
              papers={(papers ?? []).map((p) => ({ id: p.id, title: `${p.original_title} (${p.exam_year} ${p.stage})` }))}
              defaultPaperId={papers?.length === 1 ? papers[0].id : null}
            />
          )}

          {latest?.extracted_text ? (
            <details className="mt-8 rounded-xl border border-border">
              <summary className="cursor-pointer p-4 font-medium text-ink">Extracted text (version {latest.version_number})</summary>
              <pre className="max-h-[32rem] overflow-auto whitespace-pre-wrap border-t border-border p-4 font-mono text-xs leading-relaxed text-foreground">{latest.extracted_text}</pre>
            </details>
          ) : null}
        </section>

        <aside className="space-y-6">
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Details and rights</h2>
            {canManage ? (
              <ActionForm key={doc.updated_at} action={updateDocument} submitLabel="Save" className="mt-3">
                <input type="hidden" name="id" value={doc.id} />
                <TextField name="title" label="Title" defaultValue={doc.title} required />
                <SelectField name="document_type" label="Type" defaultValue={doc.document_type} options={Object.entries(DOC_TYPE_LABELS).map(([value, label]) => ({ value, label }))} />
                <div className="grid grid-cols-2 gap-3">
                  <TextField type="number" name="exam_year" label="Exam year" defaultValue={doc.exam_year} />
                  <SelectField name="stage" label="Stage" defaultValue={doc.stage ?? ""} options={[{ value: "", label: "—" }, { value: "PE", label: "PE" }, { value: "ME", label: "ME" }]} />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <TextField type="date" name="published_on" label="Published on" defaultValue={doc.published_on} />
                  <TextField name="reference_number" label="Reference no." defaultValue={doc.reference_number} />
                </div>
                <SelectField name="permission_id" label="Written permission" defaultValue={doc.permission_id ?? ""} options={[{ value: "", label: "— None recorded —" }, ...(permissions ?? []).map((p) => ({ value: p.id, label: p.title }))]} />
                <SelectField name="usage_status" label="Use by Soma" defaultValue={doc.usage_status} options={Object.entries(USAGE_LABELS).map(([value, v]) => ({ value, label: v.label }))} />
                <AreaField name="usage_notes" label="Rights notes" defaultValue={doc.usage_notes} />
              </ActionForm>
            ) : null}
            <dl className="mt-4 space-y-1 text-xs text-muted-foreground">
              <div>Source: {doc.origin === "upload" ? `uploaded file ${doc.original_filename ?? ""}` : <a href={doc.url} className="break-all text-primary underline" target="_blank" rel="noopener noreferrer">{doc.url}</a>}</div>
              <div>First retrieved {formatDate(doc.first_retrieved_at)} · last {formatDate(doc.last_retrieved_at)}</div>
              <div className="break-all">SHA-256 {doc.current_sha256}</div>
            </dl>
          </section>

          {canManage ? (
            <section className="rounded-xl border border-border p-4">
              <h2 className="font-semibold text-ink">Historical paper</h2>
              {(papers ?? []).length ? (
                <ul className="mt-2 space-y-1 text-sm">{(papers ?? []).map((p) => <li key={p.id}><Link href={`/admin/papers/${p.id}`} className="text-primary hover:underline">{p.original_title}</Link></li>)}</ul>
              ) : (
                <p className="mt-1 text-sm text-muted-foreground">Create a library entry for this paper to group its questions and build a timed practice examination.</p>
              )}
              <details className="mt-3">
                <summary className="cursor-pointer text-sm font-medium text-primary">Create historical paper</summary>
                <ActionForm action={createHistoricalPaper} submitLabel="Create paper" className="mt-3">
                  <input type="hidden" name="source_document_id" value={doc.id} />
                  <TextField name="original_title" label="Original title" defaultValue={doc.title} required />
                  <div className="grid grid-cols-2 gap-3">
                    <TextField type="number" name="exam_year" label="Year" defaultValue={doc.exam_year} required />
                    <SelectField name="stage" label="Stage" defaultValue={doc.stage ?? "PE"} options={[{ value: "PE", label: "PE" }, { value: "ME", label: "ME" }]} />
                  </div>
                  <SelectField name="category_id" label="ME category" options={[{ value: "", label: "— All / PE —" }, ...(categories ?? []).map((c) => ({ value: c.id, label: c.name }))]} />
                  <SelectField name="paper_id" label="Paper" options={[{ value: "", label: "—" }, ...(examPapers ?? []).map((p) => ({ value: p.id, label: `${p.stage} · ${p.title}` }))]} />
                  <TextField type="date" name="exam_date" label="Examination date" />
                  <label className="flex items-center gap-2 text-sm"><input type="checkbox" name="has_official_key" className="size-4 accent-[var(--primary)]" /> An official answer key is available</label>
                </ActionForm>
              </details>
            </section>
          ) : null}

          <section className="rounded-xl border border-border p-4 text-sm">
            <h2 className="font-semibold text-ink">Versions</h2>
            <ul className="mt-2 space-y-2">
              {(versions ?? []).map((v) => (
                <li key={v.id}>
                  <span className="text-ink">Version {v.version_number}</span> · {formatDate(v.retrieved_at)} · {Math.round((v.byte_size ?? 0) / 1024)} KB
                  {v.change_summary ? <span className="block text-xs text-muted-foreground">{v.change_summary}</span> : null}
                </li>
              ))}
            </ul>
          </section>
        </aside>
      </div>
    </>
  );
}
