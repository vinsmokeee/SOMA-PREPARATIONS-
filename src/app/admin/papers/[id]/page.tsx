import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { TextField } from "@/components/app/fields";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { USAGE_LABELS } from "@/lib/admin/document-labels";
import { createClient } from "@/lib/supabase/server";
import { buildExamFromPaper, setPaperStatus } from "../actions";

export const metadata: Metadata = { title: "Historical paper" };

export default async function PaperPage({ params }: PageProps<"/admin/papers/[id]">) {
  const { id } = await params;
  await requirePermission("papers.manage", `/admin/papers/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const [{ data: paper }, { data: cands }, { data: exams }] = await Promise.all([
    db.from("historical_papers").select("*, exam_categories(name), source_documents(id, title, usage_status, permission_id)").eq("id", id).maybeSingle(),
    db.from("import_candidates").select("id, number, status, question_id, questions(status, stem)").eq("historical_paper_id", id).order("number"),
    db.from("exams").select("id, title, status").eq("historical_paper_id", id),
  ]);
  if (!paper) notFound();
  const doc = paper.source_documents as unknown as { id: string; title: string; usage_status: string; permission_id: string | null } | null;
  const usage = USAGE_LABELS[doc?.usage_status ?? "unknown"];
  const accepted = ((cands ?? []) as unknown as { id: string; number: number | null; status: string; question_id: string | null; questions: { status: string; stem: string } | null }[]).filter((c) => c.status === "accepted");
  const published = accepted.filter((c) => c.questions?.status === "published").length;
  const slug = `${paper.stage.toLowerCase()}-${paper.exam_year}${paper.paper_id ? "-paper" : ""}`.replace(/[^a-z0-9-]/g, "");

  return (
    <>
      <Link href="/admin/papers" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Historical papers
      </Link>
      <div className="mt-3">
        <PageTitle
          title={paper.original_title}
          description={
            <span className="inline-flex flex-wrap items-center gap-2">
              <Badge tone="outline">{paper.exam_year} · {paper.stage}{paper.exam_categories ? ` · ${(paper.exam_categories as unknown as { name: string }).name}` : ""}</Badge>
              <Badge tone={usage.tone}>{usage.label}</Badge>
              <Badge tone={STATUS_TONES[paper.status]}>{STATUS_LABELS[paper.status]}</Badge>
            </span>
          }
        />
      </div>

      {doc?.usage_status !== "authorised" ? (
        <Alert tone="warning" className="mb-6" title="Not yet authorised for students">
          This paper can be analysed and its questions prepared, but a practice examination of it can only be published once the source document is linked to a permission allowing reproduction. <Link href={`/admin/imports/${doc?.id}`} className="font-medium underline">Open the document</Link>.
        </Alert>
      ) : paper.attribution_text ? (
        <p className="mb-6 text-sm text-muted-foreground">Credit line: {paper.attribution_text}</p>
      ) : null}

      <div className="grid gap-8 xl:grid-cols-[1fr_340px]">
        <section>
          <h2 className="text-lg font-semibold">Questions ({accepted.length})</h2>
          <p className="mt-1 text-sm text-muted-foreground">{published} of {accepted.length} published. Add explanations and verify each question in the question bank.</p>
          {accepted.length === 0 ? (
            <p className="mt-3 text-sm text-muted-foreground">No questions accepted yet. Review them on the <Link href={`/admin/imports/${doc?.id}`} className="font-medium text-primary hover:underline">document page</Link>.</p>
          ) : (
            <ol className="mt-3 divide-y divide-border rounded-xl border border-border">
              {accepted.map((c) => (
                <li key={c.id} className="flex items-center gap-3 p-3 text-sm">
                  <span className="w-8 font-semibold tabular-nums text-ink">{c.number ?? "?"}.</span>
                  <Link href={`/admin/questions/${c.question_id}`} className="line-clamp-1 flex-1 text-ink hover:text-primary">{c.questions?.stem}</Link>
                  {c.questions ? <Badge tone={STATUS_TONES[c.questions.status]}>{STATUS_LABELS[c.questions.status]}</Badge> : null}
                </li>
              ))}
            </ol>
          )}
        </section>
        <aside className="space-y-6">
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Practice examination</h2>
            {(exams ?? []).length ? (
              <ul className="mt-2 space-y-1 text-sm">{(exams ?? []).map((e) => <li key={e.id}><Link href={`/admin/exams/${e.id}`} className="text-primary hover:underline">{e.title}</Link> <span className="text-muted-foreground">({e.status})</span></li>)}</ul>
            ) : (
              <ActionForm action={buildExamFromPaper} submitLabel="Create draft examination" className="mt-3">
                <input type="hidden" name="paper_id" value={paper.id} />
                <TextField name="title" label="Title" defaultValue={`BCSE ${paper.exam_year} ${paper.stage === "PE" ? "Preliminary Examination" : "Main Examination"}`} required />
                <TextField name="slug" label="Web address" defaultValue={slug} required />
                <TextField type="number" name="duration_minutes" label="Duration (minutes)" hint="Use the official duration if known." required />
                <label className="flex items-center gap-2 text-sm"><input type="checkbox" name="is_free" className="size-4 accent-[var(--primary)]" /> Free for all students</label>
              </ActionForm>
            )}
          </section>
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Library listing</h2>
            <p className="mt-1 text-sm text-muted-foreground">Published papers appear in students’ past-paper library together with their examination.</p>
            <ActionForm key={paper.updated_at} action={setPaperStatus} submitLabel={paper.status === "published" ? "Unpublish" : "Publish in library"} variant={paper.status === "published" ? "secondary" : "primary"} className="mt-3 space-y-0">
              <input type="hidden" name="id" value={paper.id} />
              <input type="hidden" name="status" value={paper.status === "published" ? "draft" : "published"} />
            </ActionForm>
          </section>
        </aside>
      </div>
    </>
  );
}
