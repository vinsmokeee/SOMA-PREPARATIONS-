import type { Metadata } from "next";
import Link from "next/link";
import { ChevronLeft } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { CsvImporter } from "@/components/admin/csv-importer";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Import questions" };

export default async function ImportQuestionsPage() {
  await requirePermission("questions.create", "/admin/questions/import");
  const db = await createClient();
  const [{ data: subjects }, { data: topics }] = await Promise.all([
    db.from("subjects").select("id, stage, slug, name").eq("is_active", true),
    db.from("topics").select("id, subject_id, slug, name").eq("is_active", true),
  ]);
  return (
    <>
      <Link href="/admin/questions" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> Question bank
      </Link>
      <div className="mt-3">
        <PageTitle title="Import questions from a spreadsheet" description="Prepare questions in Excel or Google Sheets, save as CSV and upload. Every row is checked before import, and imported questions start as drafts." />
      </div>
      <details className="mb-6 rounded-xl border border-border p-4 text-sm">
        <summary className="cursor-pointer font-medium text-ink">Column guide</summary>
        <ul className="mt-3 list-disc space-y-1 pl-5 text-muted-foreground">
          <li><b>stage</b>: PE or ME · <b>type</b>: mcq, short_answer, long_answer, essay, analytical, descriptive</li>
          <li><b>subject</b> and <b>topic</b>: the short identifier or the exact name shown in Subjects &amp; topics</li>
          <li><b>difficulty</b>: foundation, standard or advanced · <b>marks</b>: a number</li>
          <li><b>question</b>; for MCQs <b>option_a</b>…<b>option_e</b> and <b>correct</b> (a letter)</li>
          <li><b>explanation</b> (MCQ), <b>model_answer</b> and <b>word_limit</b> (written)</li>
          <li><b>reference</b> and <b>reference_url</b>: where the facts can be checked · <b>free_sample</b>: yes/no</li>
        </ul>
      </details>
      <CsvImporter lookups={{ subjects: subjects ?? [], topics: topics ?? [] }} />
    </>
  );
}
