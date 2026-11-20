import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { formatDuration } from "@/lib/exam/logic";
import { createClient } from "@/lib/supabase/server";
import { loadExamState } from "@/lib/student/exam-state";
import { formatDate, requestTimeMs } from "@/lib/utils";

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

/** Tests of one exam only: the one the student is preparing for, or ?stage=PE|ME (founder, 20 Nov 2026). */
export default async function HistoryPage({ searchParams }: PageProps<"/dashboard/history">) {
  const user = await requireUser("/dashboard/history");
  const sp = await searchParams;
  const stage: "PE" | "ME" = sp.stage === "PE" || sp.stage === "ME" ? sp.stage : ((await loadExamState(user.id)).lastStage ?? "PE");
  const supabase = await createClient();
  const { data } = await supabase
    .from("exam_attempts")
    .select("id, status, started_at, deadline_at, score, max_score, correct_count, incorrect_count, time_spent_seconds, exams!exam_attempts_exam_id_fkey!inner(title, stage, slug)")
    .eq("exams.stage", stage)
    .order("started_at", { ascending: false })
    .limit(100);
  const rows = (data ?? []) as unknown as Row[];
  const now = requestTimeMs();

  return (
    <>
      <PageTitle title={`${stage} test history`} description={`Every ${stage} test and practice you have taken, with links to full results.`} />
      {rows.length === 0 ? (
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">No {stage} tests yet</p>
          <Link href={stage === "ME" ? "/dashboard/me" : "/dashboard/pe"} className="mt-3 inline-block text-sm font-medium text-primary hover:underline">Go to {stage}</Link>
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
                    {formatDate(r.started_at)}
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
