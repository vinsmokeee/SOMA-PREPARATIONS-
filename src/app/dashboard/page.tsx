import type { Metadata } from "next";
import Link from "next/link";
import { BookOpenCheck, ClipboardList, PenLine } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { QuickPractice } from "@/components/student/practice-builder";
import { TodayPlan } from "@/components/training/today-plan";
import type { TrainingData } from "@/lib/training/model";
import { requireUser } from "@/lib/auth/dal";
import { accuracy, readiness, recommendations, type Performance } from "@/lib/analytics";
import { loadLearningData } from "@/lib/analytics-server";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Dashboard" };

const NOTICES: Record<string, { tone: "success" | "warning"; text: string }> = {
  forbidden: { tone: "warning", text: "You do not have access to that area." },
  "password-updated": { tone: "success", text: "Your password has been updated." },
};

type AttemptRow = {
  id: string;
  status: string;
  started_at: string;
  score: number | null;
  max_score: number | null;
  exams: { title: string; stage: string } | null;
};

export default async function DashboardPage({ searchParams }: PageProps<"/dashboard">) {
  const user = await requireUser();
  const params = await searchParams;
  const notice = typeof params.notice === "string" ? NOTICES[params.notice] : undefined;
  const welcome = params.welcome === "1";

  const supabase = await createClient();
  const [attempts, entitlements, learning, profile, unread, training] = await Promise.all([
    supabase
      .from("exam_attempts")
      .select("id, status, started_at, score, max_score, exams(title, stage)")
      .order("started_at", { ascending: false })
      .limit(5),
    supabase.from("entitlements").select("id, ends_at, revoked_at, status, packages(name)").is("revoked_at", null).eq("status", "active").or(`ends_at.is.null,ends_at.gt.${new Date().toISOString()}`),
    loadLearningData(),
    supabase.from("profiles").select("onboarded_at").eq("id", user.id).maybeSingle(),
    supabase.from("notifications").select("id", { count: "exact", head: true }).is("read_at", null),
    supabase.rpc("my_training"),
  ]);
  const today = (training.data ?? null) as TrainingData | null;
  const perf = learning.performance;
  const next = perf ? recommendations(perf, learning.options, 2) : [];
  const attemptRows = (attempts.data ?? []) as unknown as AttemptRow[];
  const access = (entitlements.data ?? []) as unknown as { id: string; ends_at: string | null; packages: { name: string } | null }[];
  const firstName = user.fullName.split(" ")[0];

  return (
    <>
      <PageTitle
        title={firstName ? `Welcome${welcome ? "" : " back"}, ${firstName}` : "Welcome"}
        description="Your BCSE preparation at a glance."
      />
      <div className="space-y-6">
        {notice ? <Alert tone={notice.tone}>{notice.text}</Alert> : null}
        {profile.data && !profile.data.onboarded_at ? (
          <Alert tone="info" title="Tell us what you are preparing for">It takes ten seconds and helps Soma show the right practice. <Link href="/dashboard/welcome" className="font-medium text-primary underline">Continue</Link></Alert>
        ) : null}
        {unread.count ? <Alert tone="info">You have {unread.count} new notification{unread.count === 1 ? "" : "s"}. <Link href="/dashboard/notifications" className="font-medium text-primary underline">View</Link></Alert> : null}
        {welcome ? <Alert tone="success" title="Your account is ready">Start with a free sample examination from <Link href="/dashboard/exams" className="font-medium text-primary underline">Examinations</Link>.</Alert> : null}

        {today ? (
          <Card>
            <CardHeader>
              <CardTitle>Today&apos;s training</CardTitle>
              <CardDescription>
                Your plan is ready. <Link href="/dashboard/training" className="font-medium text-primary hover:underline">See streak, badges and progress</Link>
              </CardDescription>
            </CardHeader>
            <CardContent>
              <TodayPlan data={today} />
            </CardContent>
          </Card>
        ) : null}

        <div className="grid gap-4 md:grid-cols-3">
          <StageCard icon={<BookOpenCheck className="size-5 text-primary" aria-hidden />} title="PE preparation" stage="PE" perf={perf} />
          <StageCard icon={<PenLine className="size-5 text-primary" aria-hidden />} title="ME preparation" stage="ME" perf={perf} />
          <Card>
            <CardHeader>
              <ClipboardList className="size-5 text-primary" aria-hidden />
              <CardTitle className="mt-2">Your access</CardTitle>
              {access.length === 0 ? (
                <CardDescription>Free account. Your progress is always kept when you upgrade.</CardDescription>
              ) : (
                <ul className="mt-1 space-y-1 text-sm">
                  {access.map((e) => (
                    <li key={e.id}>
                      <span className="font-medium text-ink">{e.packages?.name}</span>
                      <span className="text-muted-foreground"> · {e.ends_at ? `until ${formatDate(e.ends_at)}` : "no end date"}</span>
                    </li>
                  ))}
                </ul>
              )}
            </CardHeader>
            <CardContent>
              <Button asChild variant="secondary" size="sm"><Link href="/dashboard/subscription">{access.length ? "Manage subscription" : "View packages"}</Link></Button>
            </CardContent>
          </Card>
        </div>

        {next.length || (perf?.mistakes ?? 0) > 0 ? (
          <Card>
            <CardHeader>
              <CardTitle>Next steps</CardTitle>
              <CardDescription>
                {perf?.mistakes ? `${perf.mistakes} question${perf.mistakes === 1 ? "" : "s"} pending revision. ` : ""}
                <Link href="/dashboard/analytics" className="font-medium text-primary hover:underline">See full performance</Link>
              </CardDescription>
            </CardHeader>
            <CardContent>
              <ul className="divide-y divide-border">
                {next.map((r, i) => (
                  <li key={i} className="flex flex-col gap-2 py-3 sm:flex-row sm:items-center">
                    <div className="flex-1">
                      <p className="text-sm font-medium text-ink">{r.title}</p>
                      <p className="text-xs text-muted-foreground">{r.detail}</p>
                    </div>
                    <QuickPractice stage={r.stage} subjectId={r.subjectId} topicId={r.topicId} mode={r.kind === "mistakes" ? "mistakes" : "mixed"} label={r.kind === "mistakes" ? "Retry" : "Practise 10"} />
                  </li>
                ))}
              </ul>
            </CardContent>
          </Card>
        ) : null}

        <Card>
          <CardHeader>
            <CardTitle>Recent examinations</CardTitle>
          </CardHeader>
          <CardContent>
            {attemptRows.length === 0 ? (
              <div className="flex flex-col items-start gap-3">
                <p className="text-sm text-muted-foreground">You have not taken any examinations yet.</p>
                <Button asChild size="sm"><Link href="/dashboard/exams">Browse examinations</Link></Button>
              </div>
            ) : (
              <ul className="divide-y divide-border">
                {attemptRows.map((a) => (
                  <li key={a.id} className="flex flex-wrap items-center justify-between gap-2 py-3 text-sm">
                    <Link href={a.status === "in_progress" ? `/exam/${a.id}` : `/dashboard/results/${a.id}`} className="font-medium text-ink hover:text-primary">{a.exams?.title ?? "Examination"}</Link>
                    <span className="flex items-center gap-3 text-muted-foreground">
                      {formatDate(a.started_at)}
                      <Badge tone={a.status === "in_progress" ? "warning" : "green"}>{a.status.replace("_", " ")}</Badge>
                      {a.score !== null && a.max_score ? <span className="tabular-nums">{a.score}/{a.max_score}</span> : null}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </CardContent>
        </Card>

        <p className="text-xs leading-relaxed text-muted-foreground">
          Progress and readiness indicators on Soma are Soma estimates based on your practice. They are not RCSC
          assessments and do not guarantee any result.
        </p>
      </div>
    </>
  );
}

function StageCard({ icon, title, stage, perf }: { icon: React.ReactNode; title: string; stage: "PE" | "ME"; perf: Performance | null }) {
  const subjects = perf?.by_subject.filter((s) => s.stage === stage) ?? [];
  const answered = subjects.reduce((n, s) => n + s.answered, 0);
  const correct = subjects.reduce((n, s) => n + s.correct, 0);
  const acc = accuracy(correct, answered);
  const cov = perf?.coverage.find((c) => c.stage === stage);
  const covPct = cov && cov.total > 0 ? Math.round((cov.practised / cov.total) * 100) : 0;
  const r = perf ? readiness(stage, perf) : null;
  return (
    <Card>
      <CardHeader>
        {icon}
        <CardTitle className="mt-2">{title}</CardTitle>
        <CardDescription>
          {answered === 0 ? (stage === "ME" && perf?.totals.written_answers ? `${perf.totals.written_answers} written answers so far.` : "No answers yet.") : `${answered} answered · ${acc}% accuracy`}
        </CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-2 rounded-full bg-muted" role="img" aria-label={`${covPct}% of subject areas practised`}>
          <div className="h-2 rounded-full bg-primary" style={{ width: `${covPct}%` }} />
        </div>
        <p className="mt-2 text-xs text-muted-foreground">
          {cov ? `${cov.practised} of ${cov.total} subject areas practised` : "Subject coverage appears once questions are published."}
          {r && r.band !== "not_enough" ? ` · Soma estimate: ${r.label}` : ""}
        </p>
        <Link href={`/dashboard/practice?stage=${stage}`} className="mt-3 inline-block text-sm font-medium text-primary hover:underline">Practise {stage}</Link>
      </CardContent>
    </Card>
  );
}
