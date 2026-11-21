import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Repeated questions" };

type Row = { question_id: string; stage: string; paper: string | null; specialisation: string | null; subject_group: string | null; stem: string; status: string; years: number[] };

/** Questions RCSC asked in two or more years (founder, 21 Nov 2026): most repeated first. */
export default async function RepeatedQuestionsPage() {
  await requirePermission("questions.review", "/admin/questions/repeated");
  const db = await createClient();
  const { data } = await db.rpc("repeated_questions", { _limit: 300 });
  const rows = (data ?? []) as Row[];
  return (
    <div className="mx-auto max-w-4xl">
      <PageTitle title="Repeated questions" description="Questions RCSC asked in more than one year. Students see a 'Repeated question' label on them, and they come up more often in mock tests." />
      {rows.length === 0 ? (
        <p className="mt-6 rounded-2xl bg-white p-5 text-sm text-muted-foreground ring-1 ring-border">No repeats yet. They appear here as papers from more years are loaded.</p>
      ) : (
        <ol className="mt-6 space-y-3">
          {rows.map((r) => (
            <li key={r.question_id} className="rounded-2xl bg-white p-4 ring-1 ring-border">
              <p className="text-xs font-semibold text-warning">Asked {r.years.length} times: {r.years.join(", ")}</p>
              <p className="mt-1 line-clamp-3 text-sm text-ink">{r.stem}</p>
              <p className="mt-1 text-xs text-muted-foreground">{r.stage} · {r.paper ?? "No paper"}{r.specialisation ? ` · ${r.specialisation}` : r.subject_group ? ` · ${r.subject_group}` : ""} · {r.status}</p>
              <Link href={`/admin/questions/${r.question_id}`} className="mt-2 inline-block text-sm font-medium text-primary hover:underline">Open question</Link>
            </li>
          ))}
        </ol>
      )}
    </div>
  );
}
