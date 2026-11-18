import type { Metadata } from "next";
import Link from "next/link";
import { Clock3, FileText, Lock, PenLine } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { EntrySummary } from "@/components/app/entry-summary";
import { MockCta } from "@/components/exam/mock-cta";
import { requireUser } from "@/lib/auth/dal";
import { KIND_LABELS, type CatalogueExam } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { pageStage } from "@/lib/student/default-stage";

export const metadata: Metadata = { title: "Examinations" };

export default async function ExamsPage({ searchParams }: PageProps<"/dashboard/exams">) {
  const user = await requireUser("/dashboard/exams");
  const params = await searchParams;
  const supabase = await createClient();
  const stage = await pageStage(supabase, user.id, params.stage);
  const [{ data, error }, { data: peAccess }] = await Promise.all([
    supabase.rpc("exam_catalogue", { _stage: stage }),
    supabase.rpc("has_stage_access", { _stage: "PE" }),
  ]);
  const exams = (data ?? []) as CatalogueExam[];

  return (
    <>
      <PageTitle
        title={stage === "PE" ? "PE practice" : stage === "ME" ? "ME practice" : "Examinations"}
        description="Timed practice examinations in Soma's examination environment. These are Soma simulations, not official RCSC papers."
      />
      {stage !== "PE" ? <EntrySummary userId={user.id} compact /> : null}
      {stage !== "ME" ? <div className="mb-6"><MockCta premium={Boolean(peAccess)} /></div> : null}
      {error ? <Alert tone="danger">Examinations could not be loaded. Please try again.</Alert> : null}
      {/* PE always has today's free test or the mock test above, so the empty note only shows for ME. */}
      {!error && exams.length === 0 && stage !== "PE" ? (
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">No examinations are open yet</p>
          <p className="mx-auto mt-2 max-w-md text-sm text-muted-foreground">
            Every question is reviewed before an examination opens. New examinations will appear here as soon as they are published.
          </p>
        </div>
      ) : null}
      <ul className="grid gap-4 md:grid-cols-2">
        {exams.map((e) => (
          <li key={e.id} className="flex flex-col rounded-xl border border-border p-5">
            <div className="flex flex-wrap items-center gap-2">
              <Badge tone="solid">{e.stage}</Badge>
              <Badge tone={e.is_free ? "green" : "neutral"}>{e.is_free ? "Free" : KIND_LABELS[e.kind]}</Badge>
              {e.is_free && e.kind !== "sample" ? <Badge>{KIND_LABELS[e.kind]}</Badge> : null}
              {e.open_attempt_id ? <Badge tone="warning">In progress</Badge> : null}
            </div>
            <h2 className="mt-3 font-serif text-xl font-semibold text-ink">{e.title}</h2>
            {e.description ? <p className="mt-1.5 text-sm leading-relaxed text-muted-foreground">{e.description}</p> : null}
            <p className="mt-4 flex flex-wrap gap-x-4 gap-y-1 text-sm text-muted-foreground">
              <span className="inline-flex items-center gap-1.5"><Clock3 className="size-4" aria-hidden /> {e.duration_minutes} min</span>
              <span className="inline-flex items-center gap-1.5">
                {e.stage === "PE" ? <FileText className="size-4" aria-hidden /> : <PenLine className="size-4" aria-hidden />}
                {e.question_count} {e.question_count === 1 ? "question" : "questions"}
              </span>
              {e.completed_attempts > 0 ? <span>Taken {e.completed_attempts}×</span> : null}
            </p>
            <div className="mt-5 flex-1" />
            {e.has_access ? (
              <Link href={`/dashboard/exams/${e.slug}`} className="inline-flex h-11 items-center justify-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">
                {e.open_attempt_id ? "Resume examination" : e.completed_attempts > 0 ? "Take again" : "View instructions"}
              </Link>
            ) : (
              <Link href="/packages" className="inline-flex h-11 items-center justify-center gap-2 rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted">
                <Lock className="size-4" aria-hidden /> Included in premium packages
              </Link>
            )}
          </li>
        ))}
      </ul>
    </>
  );
}
