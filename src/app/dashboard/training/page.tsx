import type { Metadata } from "next";
import Link from "next/link";
import { Award, Flame, Lock } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { TodayPlan } from "@/components/training/today-plan";
import { Alert } from "@/components/ui/alert";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { BADGES, PHASES, streakLabel, streakMessage, upcomingAssessments, type TrainingData } from "@/lib/training/model";
import { cn, formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Today's training" };

export default async function TrainingPage() {
  await requireUser("/dashboard/training");
  const db = await createClient();
  const { data, error } = await db.rpc("my_training");
  if (error || !data) {
    return (
      <>
        <PageTitle title="Today's training" />
        <Alert tone="danger">Your plan could not be loaded. Please refresh the page.</Alert>
      </>
    );
  }
  const t = data as TrainingData;
  const earned = new Set(t.badges.map((b) => b.code));
  const upcoming = upcomingAssessments(t.plan.cycle_day, t.plan.cycle_days);
  const daysToExam = t.exam_date ? Math.round((Date.parse(t.exam_date) - Date.parse(t.today)) / 86400000) : null;
  const weekPct = Math.min(100, Math.round((t.week.answered / Math.max(t.week.goal, 1)) * 100));

  return (
    <>
      <PageTitle
        title="Today's training"
        description="A new plan every day, built from your pathway, your weak areas and the questions due for revision."
      />
      <div className="grid gap-6 lg:grid-cols-[1fr_320px]">
        <div className="min-w-0 space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Your plan for {formatDate(t.today)}</CardTitle>
              {t.plan.focus ? <CardDescription>Focus today: {t.plan.focus}</CardDescription> : null}
            </CardHeader>
            <CardContent>
              <TodayPlan data={t} compact={false} />
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Your {t.plan.cycle_days}-day cycle</CardTitle>
              <CardDescription>Each cycle covers every section. When it ends, a new one starts with what you have learned.</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex gap-0.5" aria-label={`Day ${t.plan.cycle_day} of ${t.plan.cycle_days}`}>
                {Array.from({ length: t.plan.cycle_days }, (_, i) => (
                  <span key={i} className={cn("h-2 flex-1 rounded-full", i + 1 < t.plan.cycle_day ? "bg-primary" : i + 1 === t.plan.cycle_day ? "bg-warning" : "bg-muted")} />
                ))}
              </div>
              <ul className="mt-4 grid gap-2 sm:grid-cols-2">
                {PHASES.filter((p) => p.key !== "readiness" || t.plan.phase === "readiness").map((p) => {
                  const current = p.key === t.plan.phase;
                  return (
                    <li key={p.key} className={cn("rounded-lg border p-3 text-sm", current ? "border-primary bg-primary-soft" : "border-border")}>
                      <p className="font-medium text-ink">{p.label}{current ? " · now" : ""}</p>
                      <p className="text-muted-foreground">{p.description}</p>
                    </li>
                  );
                })}
              </ul>
              {upcoming.length ? (
                <div className="mt-4 text-sm">
                  <p className="font-medium text-ink">Coming up</p>
                  <ul className="mt-1 space-y-1 text-muted-foreground">
                    {upcoming.map((u) => <li key={u.kind + u.inDays}>{u.label} — {u.inDays === 1 ? "tomorrow" : `in ${u.inDays} days`}</li>)}
                  </ul>
                </div>
              ) : null}
            </CardContent>
          </Card>

          {t.subjects.length ? (
            <Card>
              <CardHeader>
                <CardTitle>Sections this cycle</CardTitle>
                <CardDescription>Questions practised in this cycle and your overall accuracy.</CardDescription>
              </CardHeader>
              <CardContent>
                <ul className="space-y-3">
                  {t.subjects.map((s) => (
                    <li key={s.name} className="text-sm">
                      <div className="flex justify-between gap-2">
                        <span className="font-medium text-ink">{s.name}</span>
                        <span className="text-muted-foreground">{s.answered_cycle} this cycle{s.accuracy !== null ? ` · ${Math.round(Number(s.accuracy) * 100)}% correct` : ""}</span>
                      </div>
                      <div className="mt-1 h-1.5 rounded-full bg-muted">
                        <div className={cn("h-1.5 rounded-full", s.accuracy !== null && Number(s.accuracy) < 0.6 ? "bg-warning" : "bg-primary")}
                          style={{ width: `${Math.min(100, s.accuracy === null ? 0 : Math.round(Number(s.accuracy) * 100))}%` }} />
                      </div>
                    </li>
                  ))}
                </ul>
              </CardContent>
            </Card>
          ) : null}
        </div>

        <aside className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2"><Flame className="size-5 text-warning" aria-hidden /> {streakLabel(t.stats.current_streak)}</CardTitle>
              <CardDescription>{streakMessage(t.stats)}</CardDescription>
            </CardHeader>
            <CardContent className="space-y-1 text-sm text-muted-foreground">
              <p>Best streak: <span className="font-medium text-ink">{t.stats.best_streak} days</span></p>
              <p>Rest days saved: <span className="font-medium text-ink">{t.stats.rest_tokens}</span> <span className="text-xs">(one missed day is forgiven per rest day; you earn one every 7 days)</span></p>
              <p>Days practised: <span className="font-medium text-ink">{t.stats.active_days}</span></p>
              {daysToExam !== null && daysToExam >= 0 ? <p>Examination in <span className="font-medium text-ink">{daysToExam} days</span></p> : null}
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>This week&apos;s challenge</CardTitle>
              <CardDescription>Answer {t.week.goal} questions this week.</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="h-2 rounded-full bg-muted"><div className="h-2 rounded-full bg-primary" style={{ width: `${weekPct}%` }} /></div>
              <p className="mt-2 text-sm text-muted-foreground">{t.week.answered} of {t.week.goal} · {t.week.days_active} active day{t.week.days_active === 1 ? "" : "s"}</p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Revision queue</CardTitle>
              <CardDescription>Questions you got wrong come back after 1, 3, 7, 14 and 30 days until you master them.</CardDescription>
            </CardHeader>
            <CardContent className="space-y-1 text-sm text-muted-foreground">
              <p>Due now: <span className="font-medium text-ink">{t.revision_due}</span> · waiting: <span className="font-medium text-ink">{t.revision_total}</span></p>
              <p>Mastered: <span className="font-medium text-ink">{t.stats.mastered}</span></p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader><CardTitle>Personal bests</CardTitle></CardHeader>
            <CardContent className="space-y-1 text-sm text-muted-foreground">
              <p>Weekly test: <span className="font-medium text-ink">{t.bests.weekly_test !== null ? `${t.bests.weekly_test}%` : "—"}</span></p>
              <p>Monthly mock: <span className="font-medium text-ink">{t.bests.monthly_mock !== null ? `${t.bests.monthly_mock}%` : "—"}</span></p>
              <p>Most questions in a day: <span className="font-medium text-ink">{t.bests.most_in_a_day ?? "—"}</span></p>
            </CardContent>
          </Card>

          <Card>
            <CardHeader><CardTitle>Badges</CardTitle><CardDescription>{earned.size} of {BADGES.length} earned</CardDescription></CardHeader>
            <CardContent>
              <ul className="grid grid-cols-2 gap-2">
                {BADGES.map((b) => {
                  const has = earned.has(b.code);
                  return (
                    <li key={b.code} className={cn("rounded-lg border p-2 text-xs", has ? "border-primary bg-primary-soft" : "border-border text-muted-foreground")} title={b.hint}>
                      <p className="flex items-center gap-1 font-medium text-ink">
                        {has ? <Award className="size-3.5 text-primary" aria-hidden /> : <Lock className="size-3.5" aria-hidden />} {b.title}
                      </p>
                      {!has ? <p className="mt-0.5">{b.hint}</p> : null}
                    </li>
                  );
                })}
              </ul>
            </CardContent>
          </Card>
          <p className="text-xs text-muted-foreground">
            Your plan is built automatically. Change what you are preparing for in <Link href="/dashboard/welcome" className="text-primary hover:underline">My examination</Link>.
          </p>
        </aside>
      </div>
    </>
  );
}
