import type { Metadata } from "next";
import { CheckCircle2, CircleAlert, XCircle } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { can, requirePermission } from "@/lib/auth/dal";
import { isSupabaseConfigured } from "@/lib/env";
import { createAdminClient } from "@/lib/supabase/admin";
import { createClient } from "@/lib/supabase/server";
import { formatDate, requestTimeMs } from "@/lib/utils";
import { testAiAction } from "./actions";

export const metadata: Metadata = { title: "Setup status" };

type State = "ok" | "missing" | "warning";
type Check = { label: string; state: State; detail: string; fix?: string };

export default async function StatusPage() {
  const user = await requirePermission("admin.access", "/admin/status");
  const checks: Check[] = [];

  checks.push(isSupabaseConfigured()
    ? { label: "Database connection", state: "ok", detail: "Supabase URL and public key are set." }
    : { label: "Database connection", state: "missing", detail: "Supabase is not configured.", fix: "Set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY in Vercel." });

  // Server key: needed for automatic current affairs and AI marking. Checked by a harmless read.
  let secretOk = false;
  if (process.env.SUPABASE_SECRET_KEY) {
    try {
      const { error } = await createAdminClient().from("ca_scheduler").select("id").limit(1);
      secretOk = !error;
    } catch { secretOk = false; }
  }
  checks.push(secretOk
    ? { label: "Database server key", state: "ok", detail: "SUPABASE_SECRET_KEY is set and works." }
    : { label: "Database server key", state: "missing", detail: process.env.SUPABASE_SECRET_KEY ? "SUPABASE_SECRET_KEY is set but was rejected." : "SUPABASE_SECRET_KEY is not set.", fix: "Copy the secret key from Supabase → Project Settings → API Keys into Vercel, then redeploy." });

  const aiKey = Boolean(process.env.ANTHROPIC_API_KEY);
  checks.push(aiKey
    ? { label: "AI key", state: "ok", detail: "ANTHROPIC_API_KEY is set. Use “Test AI” below to confirm it works." }
    : { label: "AI key", state: "missing", detail: "ANTHROPIC_API_KEY is not set. AI drafting, answer marking, and current-affairs notes and questions are switched off until it is added.", fix: "Buy credit at platform.claude.com, create an API key, add it to Vercel as ANTHROPIC_API_KEY (Secret), then redeploy." });

  checks.push(process.env.NEXT_PUBLIC_SITE_URL
    ? { label: "Site address", state: "ok", detail: `NEXT_PUBLIC_SITE_URL is ${process.env.NEXT_PUBLIC_SITE_URL}.` }
    : { label: "Site address", state: "warning", detail: "NEXT_PUBLIC_SITE_URL is not set; email links may point to the wrong address." });

  // Current affairs health (staff with ca.manage only).
  if (can(user, "ca.manage")) {
    const db = await createClient();
    const [{ data: lastRun }, { count: waiting }, { count: failing }] = await Promise.all([
      db.from("ca_runs").select("status, started_at, trigger").neq("status", "skipped").order("started_at", { ascending: false }).limit(1).maybeSingle(),
      db.from("ca_articles").select("id", { count: "exact", head: true }).eq("state", "new"),
      db.from("ca_sources").select("id", { count: "exact", head: true }).eq("is_active", true).gte("consecutive_failures", 3),
    ]);
    const hoursAgo = lastRun ? (requestTimeMs() - new Date(lastRun.started_at).getTime()) / 3.6e6 : Infinity;
    checks.push(!lastRun
      ? { label: "Current-affairs schedule", state: "missing", detail: "No collection run has happened yet.", fix: "The schedule runs every 3 hours once the database server key is set." }
      : { label: "Current-affairs schedule", state: hoursAgo <= 4 ? "ok" : "warning", detail: `Last run ${formatDate(lastRun.started_at)} (${lastRun.trigger}, ${lastRun.status}).${hoursAgo > 4 ? " That is more than 4 hours ago — check the schedule." : ""}` });
    checks.push({
      label: "Articles waiting for AI", state: (waiting ?? 0) > 0 && !aiKey ? "warning" : "ok",
      detail: `${waiting ?? 0} collected article${waiting === 1 ? "" : "s"} waiting to be sorted and written up${aiKey ? "." : " — this starts once the AI key is added."}`,
    });
    if (failing) checks.push({ label: "News sources", state: "warning", detail: `${failing} active source${failing === 1 ? " is" : "s are"} failing repeatedly.`, fix: "Admin → Current affairs → Sources: change the feed address or turn the source off." });
  }

  const Icon = { ok: CheckCircle2, missing: XCircle, warning: CircleAlert };
  const tone = { ok: "text-primary", missing: "text-danger", warning: "text-warning" };

  return (
    <>
      <PageTitle title="Setup status" description="What is connected and working. Values of keys are never shown." />
      <ul className="divide-y divide-border rounded-xl border border-border">
        {checks.map((c) => {
          const I = Icon[c.state];
          return (
            <li key={c.label} className="flex gap-3 p-4">
              <I className={`mt-0.5 size-5 shrink-0 ${tone[c.state]}`} aria-label={c.state} />
              <div className="text-sm">
                <p className="font-medium text-ink">{c.label}</p>
                <p className="text-muted-foreground">{c.detail}</p>
                {c.fix && c.state !== "ok" ? <p className="mt-1 text-foreground"><span className="font-medium">How to fix:</span> {c.fix}</p> : null}
              </div>
            </li>
          );
        })}
      </ul>
      {can(user, "ai.run") ? (
        <section className="mt-6 max-w-xl rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Test the AI connection</h2>
          <p className="mt-1 text-sm text-muted-foreground">Sends one tiny request (costs well under one US cent) and shows whether the AI answered.</p>
          <ActionForm action={testAiAction} submitLabel="Test AI" className="mt-3" />
        </section>
      ) : null}
    </>
  );
}
