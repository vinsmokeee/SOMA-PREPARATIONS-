import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { formatDuration } from "@/lib/exam/logic";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Examination history" };

type Row = {
  id: string;
  status: "in_progress" | "submitted" | "auto_submitted" | "abandoned";
  started_at: string;
  deadline_at: string;
  score: number | null;
  max_score: number | null;
  correct_count: number | null;
  incorrect_count: number | null;
  time_spent_seconds: number | null;
  exams: { title: string; stage: string; slug: string } | null;
};

export default async function HistoryPage() {
  await requireUser("/dashboard/history");
  const supabase = await createClient();
  const { data } = await supabase
    .from("exam_attempts")
    .select("id, status, started_at, deadline_at, score, max_score, correct_count, incorrect_count, time_spent_seconds, exams(title, stage, slug)")
    .order("started_at", { ascending: false })
    .limit(100);
  const rows = (data ?? []) as unknown as Row[];
  const now = Date.now();

  return (
    <>
      <PageTitle title="Examination history" description="Every examination you have taken, with links to full results." />
      {rows.length === 0 ? (
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">No examinations yet</p>
          <Link href="/dashboard/exams" className="mt-3 inline-block text-sm font-medium text-primary hover:underline">Browse examinations</Link>
        </div>
      ) : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {rows.map((r) => {
            const open = r.status === "in_progress";
            const expired = open && new Date(r.deadline_at).getTime() < now;
            const attempted = (r.correct_count ?? 0) + (r.incorrect_count ?? 0);
            return (
              <li key={r.id} className="flex flex-col gap-2 p-4 sm:flex-row sm:items-center">
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-ink">{r.exams?.title ?? "Examination"}</p>
                  <p className="text-sm text-muted-foreground">
                    {r.exams?.stage} · {formatDate(r.started_at)}
                    {!open ? ` · ${formatDuration(r.time_spent_seconds)}` : ""}
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  {open ? (
                    <Badge tone="warning">{expired ? "Time up — open to finish" : "In progress"}</Badge>
                  ) : (
                    <>
                      {r.status === "auto_submitted" ? <Badge>Auto-submitted</Badge> : null}
                      {r.max_score ? (
                        <span className="text-sm tabular-nums text-ink">
                          {Number(r.score)} marks{attempted ? ` · ${Math.round(((r.correct_count ?? 0) / attempted) * 100)}% accuracy` : ""}
                        </span>
                      ) : null}
                    </>
                  )}
                  <Link href={open ? `/exam/${r.id}` : `/dashboard/results/${r.id}`} className="inline-flex h-9 items-center rounded-md border border-border-strong px-3 text-sm font-medium hover:bg-muted">
                    {open ? (expired ? "Finish" : "Resume") : "View results"}
                  </Link>
                </div>
              </li>
            );
          })}
        </ul>
      )}
    </>
  );
}
