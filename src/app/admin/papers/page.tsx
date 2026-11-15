import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { USAGE_LABELS } from "@/lib/admin/document-labels";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Historical papers" };

type Row = { id: string; exam_year: number; stage: string; original_title: string; status: string; attempt_eligible: boolean; exam_categories: { name: string } | null; source_documents: { usage_status: string } | null; import_candidates: { status: string }[] };

export default async function PapersPage() {
  await requirePermission("papers.manage", "/admin/papers");
  const db = await createClient();
  const { data } = await db
    .from("historical_papers")
    .select("id, exam_year, stage, original_title, status, attempt_eligible, exam_categories(name), source_documents(usage_status), import_candidates(status)")
    .order("exam_year", { ascending: false })
    .order("stage");
  const rows = (data ?? []) as unknown as Row[];
  const years = [...new Set(rows.map((r) => r.exam_year))];
  return (
    <>
      <PageTitle title="Historical papers" description="The library of past BCSE papers. Create a paper from an imported document, accept its questions, then build a timed practice examination." />
      {rows.length === 0 ? (
        <p className="text-sm text-muted-foreground">No papers yet. Start in <Link href="/admin/imports" className="font-medium text-primary hover:underline">Imports</Link>: upload a past paper, then choose “Create historical paper”.</p>
      ) : (
        years.map((y) => (
          <section key={y} className="mb-6">
            <h2 className="mb-2 text-lg font-semibold">{y}</h2>
            <ul className="divide-y divide-border rounded-xl border border-border">
              {rows.filter((r) => r.exam_year === y).map((r) => {
                const usage = USAGE_LABELS[r.source_documents?.usage_status ?? "unknown"];
                const accepted = r.import_candidates.filter((c) => c.status === "accepted").length;
                return (
                  <li key={r.id}>
                    <Link href={`/admin/papers/${r.id}`} className="flex flex-col gap-1 p-4 hover:bg-muted/50 sm:flex-row sm:items-center sm:gap-4">
                      <span className="flex-1 font-medium text-ink">{r.original_title}</span>
                      <span className="flex flex-wrap items-center gap-2 text-xs">
                        <Badge tone="outline">{r.stage}{r.exam_categories ? ` · ${r.exam_categories.name}` : ""}</Badge>
                        <span className="text-muted-foreground">{accepted} questions</span>
                        <Badge tone={usage.tone}>{usage.label}</Badge>
                        <Badge tone={STATUS_TONES[r.status]}>{STATUS_LABELS[r.status]}</Badge>
                      </span>
                    </Link>
                  </li>
                );
              })}
            </ul>
          </section>
        ))
      )}
    </>
  );
}
