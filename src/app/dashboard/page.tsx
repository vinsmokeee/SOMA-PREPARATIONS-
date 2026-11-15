import type { Metadata } from "next";
import Link from "next/link";
import { BookOpenCheck, ClipboardList, PenLine } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { requireUser } from "@/lib/auth/dal";
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
  const [attempts, entitlements] = await Promise.all([
    supabase
      .from("exam_attempts")
      .select("id, status, started_at, score, max_score, exams(title, stage)")
      .order("started_at", { ascending: false })
      .limit(5),
    supabase.from("entitlements").select("id, ends_at, revoked_at, packages(name)").is("revoked_at", null),
  ]);
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
        {welcome ? <Alert tone="success" title="Your account is ready">Free practice and sample examinations will appear here as soon as they open.</Alert> : null}

        <div className="grid gap-4 md:grid-cols-3">
          <StageCard icon={<BookOpenCheck className="size-5 text-primary" aria-hidden />} title="PE preparation" attempts={attemptRows.filter((a) => a.exams?.stage === "PE").length} />
          <StageCard icon={<PenLine className="size-5 text-primary" aria-hidden />} title="ME preparation" attempts={attemptRows.filter((a) => a.exams?.stage === "ME").length} />
          <Card>
            <CardHeader>
              <ClipboardList className="size-5 text-primary" aria-hidden />
              <CardTitle className="mt-2">Your access</CardTitle>
              {access.length === 0 ? (
                <CardDescription>Free account. Premium packages will be available to purchase soon.</CardDescription>
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
              <Button asChild variant="secondary" size="sm"><Link href="/packages">View packages</Link></Button>
            </CardContent>
          </Card>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Recent examinations</CardTitle>
          </CardHeader>
          <CardContent>
            {attemptRows.length === 0 ? (
              <p className="text-sm text-muted-foreground">
                You have not taken any examinations yet. The examination engine and free sample examinations are the next
                stage of development.
              </p>
            ) : (
              <ul className="divide-y divide-border">
                {attemptRows.map((a) => (
                  <li key={a.id} className="flex flex-wrap items-center justify-between gap-2 py-3 text-sm">
                    <span className="font-medium text-ink">{a.exams?.title ?? "Examination"}</span>
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

function StageCard({ icon, title, attempts }: { icon: React.ReactNode; title: string; attempts: number }) {
  return (
    <Card>
      <CardHeader>
        {icon}
        <CardTitle className="mt-2">{title}</CardTitle>
        <CardDescription>{attempts === 0 ? "No attempts yet." : `${attempts} recent attempt${attempts === 1 ? "" : "s"}.`}</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="h-2 rounded-full bg-muted" role="img" aria-label="Progress not yet available">
          <div className="h-2 w-0 rounded-full bg-primary" />
        </div>
        <p className="mt-2 text-xs text-muted-foreground">Progress tracking starts with your first examination.</p>
      </CardContent>
    </Card>
  );
}
