import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { requirePermission } from "@/lib/auth/dal";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { KIND_LABELS } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Examinations" };

export default async function AdminExamsPage() {
  await requirePermission("exams.manage", "/admin/exams");
  const db = await createClient();
  const { data } = await db.from("exams").select("id, title, slug, stage, kind, status, duration_minutes, is_free, exam_questions(count), exam_attempts!exam_attempts_exam_id_fkey(count)").order("updated_at", { ascending: false });
  const rows = (data ?? []) as unknown as { id: string; title: string; slug: string; stage: string; kind: keyof typeof KIND_LABELS; status: string; duration_minutes: number; is_free: boolean; exam_questions: { count: number }[]; exam_attempts: { count: number }[] }[];
  return (
    <>
      <PageTitle title="Examinations" description="Build practice examinations from published questions. An examination can only be published when all its questions are published." actions={<Button asChild><Link href="/admin/exams/new">New examination</Link></Button>} />
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">No examinations yet.</p> : null}
      <ul className="divide-y divide-border rounded-xl border border-border">
        {rows.map((e) => (
          <li key={e.id}>
            <Link href={`/admin/exams/${e.id}`} className="flex flex-col gap-1 p-4 hover:bg-muted/50 sm:flex-row sm:items-center sm:gap-4">
              <span className="flex-1 font-medium text-ink">{e.title}</span>
              <span className="flex flex-wrap items-center gap-2 text-sm text-muted-foreground">
                <Badge tone="outline">{e.stage}</Badge>
                <span>{KIND_LABELS[e.kind]}{e.is_free ? " · free" : ""}</span>
                <span>· {e.exam_questions[0]?.count ?? 0} questions · {e.duration_minutes} min · {e.exam_attempts[0]?.count ?? 0} attempts</span>
                <Badge tone={STATUS_TONES[e.status]}>{STATUS_LABELS[e.status]}</Badge>
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </>
  );
}
