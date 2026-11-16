import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { TextField } from "@/components/app/fields";
import { Alert } from "@/components/ui/alert";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { can, requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { saveTrainingConfigAction } from "./actions";

export const metadata: Metadata = { title: "Daily training" };

const FIELDS: [string, string, string?][] = [
  ["cycle_days", "Cycle length (days)", "Foundation, development, improvement and revision phases scale with it."],
  ["practice_questions", "Daily practice questions"],
  ["revision_questions", "Revision questions per day", "Doubled in the revision and exam-readiness phases."],
  ["weak_questions", "Weak-topic questions"],
  ["weekly_test_questions", "Weekly test: questions"],
  ["weekly_test_minutes", "Weekly test: minutes"],
  ["fortnight_test_questions", "Fortnightly test: questions"],
  ["fortnight_test_minutes", "Fortnightly test: minutes"],
  ["mock_questions", "Monthly mock: questions", "Used when no published mock examination fits the student."],
  ["mock_minutes", "Monthly mock: minutes"],
  ["readiness_days", "Exam-readiness days", "Days before the student's examination date when the plan switches to readiness."],
  ["weekly_goal_questions", "Weekly challenge (questions)"],
];

type Overview = { enrolled: number; plans_today: number; active_today: number; active_7d: number; items_7d: number; done_7d: number; streak_7plus: number; revision_items: number; empty_plans_7d: number };

export default async function AdminTrainingPage() {
  const user = await requirePermission("reports.view", "/admin/training");
  const db = await createClient();
  const [{ data: overview, error }, { data: cfg }] = await Promise.all([
    db.rpc("training_overview"),
    db.rpc("training_config"),
  ]);
  const o = overview as Overview | null;
  const config = (cfg ?? {}) as Record<string, number>;
  const completion = o && o.items_7d ? Math.round((o.done_7d / o.items_7d) * 100) : null;

  return (
    <>
      <PageTitle
        title="Daily training"
        description="Every student gets a plan for today, created automatically when they open their dashboard. Questions come only from the published, verified bank, matched to each student's pathway and specialisation."
      />
      {error ? <Alert tone="danger" className="mb-6">The overview could not be loaded.</Alert> : null}
      {o ? (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {[
            ["Students with a plan", o.enrolled],
            ["Plans today", o.plans_today],
            ["Practised today", o.active_today],
            ["Active in 7 days", o.active_7d],
            ["Items done (7 days)", completion === null ? "—" : `${completion}%`],
            ["Streaks of 7+ days", o.streak_7plus],
            ["Questions in revision", o.revision_items],
            ["Empty plans (7 days)", o.empty_plans_7d],
          ].map(([label, value]) => (
            <Card key={label as string}>
              <CardHeader>
                <CardDescription>{label}</CardDescription>
                <CardTitle className="text-2xl">{value}</CardTitle>
              </CardHeader>
            </Card>
          ))}
        </div>
      ) : null}
      {o && o.empty_plans_7d > 0 ? (
        <Alert tone="warning" className="mt-4">
          Some students received an empty plan: there were no published questions available to them (for free accounts, only free-sample questions are used).
        </Alert>
      ) : null}

      <Card className="mt-8">
        <CardHeader>
          <CardTitle>Plan settings</CardTitle>
          <CardDescription>
            Days 7, 14, 21 and 28: weekly test · day 15 and 29: fortnightly revision test · last day: monthly mock. Reminders go out
            in the evening (Bhutan time) to students with a streak; a weekly report goes out on Sunday evenings.
          </CardDescription>
        </CardHeader>
        <CardContent>
          {can(user, "settings.manage") ? (
            <ActionForm action={saveTrainingConfigAction} submitLabel="Save settings" className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {FIELDS.map(([name, label, hint]) => (
                <TextField key={name} type="number" name={name} label={label} hint={hint} defaultValue={config[name]} />
              ))}
            </ActionForm>
          ) : (
            <p className="text-sm text-muted-foreground">You need the settings permission to change these.</p>
          )}
        </CardContent>
      </Card>
    </>
  );
}
