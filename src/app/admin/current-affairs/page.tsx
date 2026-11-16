import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";
import { estimateCost } from "@/lib/ai";
import { can, requirePermission } from "@/lib/auth/dal";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import type { CaConfig } from "@/lib/ca/rules";
import { createClient } from "@/lib/supabase/server";
import { cn, formatDate } from "@/lib/utils";
import { addCategoryAction, addSourceAction, runPipelineNowAction, saveCaSettingsAction, toggleSourceAction } from "./actions";

export const metadata: Metadata = { title: "Current affairs" };
// "Run now" executes the pipeline after the response (up to 5 minutes).
export const maxDuration = 300;

const TABS = [["overview", "Overview"], ["stories", "Stories"], ["articles", "Collected articles"], ["sources", "Sources"], ["categories", "Categories"], ["settings", "Settings"]] as const;
type Tab = (typeof TABS)[number][0];
type Db = Awaited<ReturnType<typeof createClient>>;

export default async function CurrentAffairsAdminPage({ searchParams }: PageProps<"/admin/current-affairs">) {
  const user = await requirePermission("ca.manage", "/admin/current-affairs");
  const sp = await searchParams;
  const tab: Tab = (TABS.map((t) => t[0]) as string[]).includes(String(sp.tab)) ? (sp.tab as Tab) : "overview";
  const db = await createClient();
  return (
    <>
      <PageTitle title="Current affairs" description="Automatic collection, verification, notes and questions. Items that pass the rules publish themselves; held items wait here for you." />
      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Sections">
        {TABS.map(([k, l]) => <Link key={k} href={`/admin/current-affairs?tab=${k}`} className={cn("rounded-full border px-4 py-1.5 text-sm font-medium", tab === k ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>{l}</Link>)}
      </nav>
      {tab === "overview" ? <Overview db={db} /> : null}
      {tab === "stories" ? <Stories db={db} filter={String(sp.filter ?? "held")} /> : null}
      {tab === "articles" ? <Articles db={db} /> : null}
      {tab === "sources" ? <Sources db={db} /> : null}
      {tab === "categories" ? <Categories db={db} /> : null}
      {tab === "settings" ? <Settings db={db} canEdit={can(user, "settings.manage")} /> : null}
    </>
  );
}

type Overview = { articles: number; stories: Record<string, number> | null; held: number; questions: number; failing_sources: number; ai: { model: string; calls: number; input_tokens: number; output_tokens: number }[] };
type Run = { id: string; trigger: string; status: string; started_at: string; finished_at: string | null; stats: Record<string, number>; errors: { step: string; message: string }[] };

async function Overview({ db }: { db: Db }) {
  const [{ data: o }, { data: runs }] = await Promise.all([
    db.rpc("ca_overview", { _days: 7 }),
    db.from("ca_runs").select("id, trigger, status, started_at, finished_at, stats, errors").order("started_at", { ascending: false }).limit(12),
  ]);
  const ov = (o ?? { articles: 0, stories: {}, held: 0, questions: 0, failing_sources: 0, ai: [] }) as Overview;
  const cost = ov.ai.reduce((s, a) => s + estimateCost(a.model, a.input_tokens, a.output_tokens), 0);
  const runRows = (runs ?? []) as Run[];
  return (
    <div className="space-y-6">
      <dl className="grid grid-cols-2 gap-3 md:grid-cols-5">
        {[
          ["Articles collected (7 days)", ov.articles],
          ["Stories published (7 days)", ov.stories?.published ?? 0],
          ["Held for review", ov.held],
          ["Questions written (7 days)", ov.questions],
          ["AI cost (7 days, est.)", `US$${cost.toFixed(2)}`],
        ].map(([k, v]) => <div key={String(k)} className="rounded-xl border border-border p-4"><dt className="text-xs text-muted-foreground">{k}</dt><dd className="mt-1 text-2xl font-semibold tabular-nums text-ink">{v}</dd></div>)}
      </dl>
      {ov.held ? <p className="text-sm"><Link href="/admin/current-affairs?tab=stories&filter=held" className="font-medium text-primary hover:underline">Review {ov.held} held stor{ov.held === 1 ? "y" : "ies"}</Link></p> : null}
      {ov.failing_sources ? <p className="text-sm text-warning">{ov.failing_sources} source(s) failing repeatedly — see Sources.</p> : null}
      <section className="rounded-xl border border-border p-5">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <h2 className="font-semibold text-ink">Pipeline runs</h2>
          <ActionForm action={runPipelineNowAction} submitLabel="Run now" variant="secondary" className="space-y-0" />
        </div>
        <p className="mt-1 text-xs text-muted-foreground">Runs automatically every 3 hours (Bhutan time). Each run collects, checks and writes within time and budget limits.</p>
        {runRows.length === 0 ? <p className="mt-3 text-sm text-muted-foreground">No runs yet.</p> : (
          <ul className="mt-3 divide-y divide-border text-sm">
            {runRows.map((r) => (
              <li key={r.id} className="py-3">
                <div className="flex flex-wrap items-center gap-2">
                  <Badge tone={r.status === "succeeded" ? "green" : r.status === "failed" ? "danger" : r.status === "running" ? "warning" : "neutral"}>{r.status}</Badge>
                  <span className="text-muted-foreground">{formatDate(r.started_at)} · {r.trigger}</span>
                  <span className="text-xs text-muted-foreground">{Object.entries(r.stats ?? {}).filter(([, v]) => typeof v === "number").map(([k, v]) => `${k.replace(/_/g, " ")}: ${v}`).join(" · ")}</span>
                </div>
                {r.errors?.length ? <ul className="mt-1 list-disc pl-5 text-xs text-warning">{r.errors.slice(0, 6).map((e, i) => <li key={i}>{e.step}: {e.message}</li>)}</ul> : null}
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  );
}

type Story = { id: string; title: string; area: string | null; verification: string; confidence: string | null; pipeline_status: string; hold_reason: string | null; created_at: string; importance: number | null; sensitive: boolean };

async function Stories({ db, filter }: { db: Db; filter: string }) {
  let q = db.from("ca_items").select("id, title, area, verification, confidence, pipeline_status, hold_reason, created_at, importance, sensitive").order("created_at", { ascending: false }).limit(100);
  if (filter !== "all") q = q.eq("pipeline_status", filter);
  const { data } = await q;
  const rows = (data ?? []) as Story[];
  return (
    <div>
      <nav className="mb-4 flex flex-wrap gap-2 text-sm" aria-label="Filter">
        {[["held", "Held for review"], ["published", "Published"], ["collected", "Waiting to be written"], ["failed", "Failed"], ["rejected", "Rejected"], ["all", "All"]].map(([k, l]) => (
          <Link key={k} href={`/admin/current-affairs?tab=stories&filter=${k}`} className={cn("rounded-md border px-3 py-1", filter === k ? "border-primary text-primary" : "border-border hover:bg-muted")}>{l}</Link>
        ))}
      </nav>
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">No stories in this view.</p> : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {rows.map((s) => (
            <li key={s.id}>
              <Link href={`/admin/current-affairs/${s.id}`} className="block p-4 hover:bg-muted/50">
                <div className="flex flex-wrap items-center gap-2 text-xs">
                  <span className="text-muted-foreground">{formatDate(s.created_at)}</span>
                  {s.area ? <Badge tone="solid">{AREA_LABELS[s.area]}</Badge> : null}
                  <Badge tone={VERIFICATION_LABELS[s.verification]?.tone ?? "neutral"}>{VERIFICATION_LABELS[s.verification]?.label ?? s.verification}</Badge>
                  {s.confidence ? <Badge tone={s.confidence === "high" ? "green" : "warning"}>{s.confidence} confidence</Badge> : null}
                  {s.sensitive ? <Badge tone="danger">sensitive</Badge> : null}
                  {s.importance !== null ? <span className="text-muted-foreground">importance {s.importance}</span> : null}
                </div>
                <p className="mt-1 font-medium text-ink">{s.title}</p>
                {s.hold_reason ? <p className="text-xs text-warning">{s.hold_reason}</p> : null}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

async function Articles({ db }: { db: Db }) {
  const { data } = await db.from("ca_articles").select("id, title, url, published_at, retrieved_at, state, relevance, ca_sources(name)").order("retrieved_at", { ascending: false }).limit(100);
  const rows = (data ?? []) as unknown as { id: string; title: string; url: string; published_at: string | null; retrieved_at: string; state: string; relevance: number | null; ca_sources: { name: string } }[];
  return rows.length === 0 ? <p className="text-sm text-muted-foreground">Nothing collected yet. The first scheduled run, or “Run now”, collects from the active sources.</p> : (
    <ul className="divide-y divide-border rounded-xl border border-border text-sm">
      {rows.map((a) => (
        <li key={a.id} className="flex flex-wrap items-center gap-2 p-3">
          <Badge tone={a.state === "grouped" ? "green" : a.state === "ignored" ? "neutral" : "warning"}>{a.state === "new" ? "awaiting AI" : a.state}</Badge>
          {a.relevance !== null ? <span className="tabular-nums text-muted-foreground">{a.relevance}</span> : null}
          <a href={a.url} target="_blank" rel="noopener noreferrer" className="min-w-0 flex-1 truncate font-medium text-ink hover:text-primary">{a.title}</a>
          <span className="text-xs text-muted-foreground">{a.ca_sources.name} · {formatDate(a.published_at ?? a.retrieved_at)}</span>
        </li>
      ))}
    </ul>
  );
}

async function Sources({ db }: { db: Db }) {
  const { data } = await db.from("ca_sources").select("id, name, feed_url, area, country, tier, is_active, last_success_at, last_error, consecutive_failures, items_collected").order("area").order("priority", { ascending: false });
  return (
    <div className="space-y-6">
      <ul className="divide-y divide-border rounded-xl border border-border text-sm">
        {(data ?? []).map((s) => (
          <li key={s.id} className="flex flex-col gap-2 p-4 sm:flex-row sm:items-center">
            <div className="min-w-0 flex-1">
              <p className="font-medium text-ink">{s.name} <span className="text-xs font-normal text-muted-foreground">· {AREA_LABELS[s.area]}{s.country ? ` · ${s.country}` : ""} · {s.tier}</span></p>
              <p className="truncate text-xs text-muted-foreground">{s.feed_url ?? "No feed configured"}</p>
              <p className="text-xs">
                {s.last_success_at ? <span className="text-primary">Last success {formatDate(s.last_success_at)} · {s.items_collected} collected</span> : <span className="text-muted-foreground">Not collected yet</span>}
                {s.last_error ? <span className="text-warning"> · Last error: {s.last_error}{s.consecutive_failures > 1 ? ` (${s.consecutive_failures} in a row)` : ""}</span> : null}
              </p>
            </div>
            <ActionForm action={toggleSourceAction} submitLabel={s.is_active ? "Switch off" : "Switch on"} variant="secondary" className="space-y-0">
              <input type="hidden" name="id" value={s.id} /><input type="hidden" name="active" value={s.is_active ? "false" : "true"} />
            </ActionForm>
          </li>
        ))}
      </ul>
      <section className="max-w-2xl rounded-xl border border-border p-5">
        <h2 className="font-semibold text-ink">Add a source</h2>
        <p className="mt-1 text-xs text-muted-foreground">An RSS or Atom feed (https). Official sources count as verified; news outlets confirm each other.</p>
        <ActionForm action={addSourceAction} submitLabel="Add source" className="mt-3">
          <div className="grid gap-3 sm:grid-cols-2">
            <Field><Label htmlFor="s-name">Name</Label><Input id="s-name" name="name" className="h-10" /></Field>
            <Field><Label htmlFor="s-country">Country (optional)</Label><Input id="s-country" name="country" className="h-10" /></Field>
            <Field><Label htmlFor="s-base">Website</Label><Input id="s-base" name="base_url" placeholder="https://" className="h-10" /></Field>
            <Field><Label htmlFor="s-feed">Feed address</Label><Input id="s-feed" name="feed_url" placeholder="https://…/feed" className="h-10" /></Field>
            <Field><Label htmlFor="s-area">Area</Label><Select id="s-area" name="area" className="h-10"><option value="bhutan">Bhutan</option><option value="regional">Regional</option><option value="world">World</option></Select></Field>
            <Field><Label htmlFor="s-tier">Type</Label><Select id="s-tier" name="tier" defaultValue="established" className="h-10"><option value="official">Official (government / UN body)</option><option value="established">Established news outlet</option><option value="other">Other</option></Select></Field>
          </div>
        </ActionForm>
      </section>
    </div>
  );
}

async function Categories({ db }: { db: Db }) {
  const { data } = await db.from("ca_categories").select("id, name, parent_id, is_active").order("sort_order");
  const rows = data ?? [];
  return (
    <div className="space-y-6">
      <ul className="grid gap-2 sm:grid-cols-2">{rows.map((c) => <li key={c.id} className="rounded-lg border border-border px-3 py-2 text-sm">{c.parent_id ? <span className="text-muted-foreground">{rows.find((p) => p.id === c.parent_id)?.name} › </span> : null}{c.name}</li>)}</ul>
      <section className="max-w-xl rounded-xl border border-border p-5">
        <h2 className="font-semibold text-ink">Add a category or subcategory</h2>
        <ActionForm action={addCategoryAction} submitLabel="Add" className="mt-3">
          <div className="grid gap-3 sm:grid-cols-2">
            <Field><Label htmlFor="c-name">Name</Label><Input id="c-name" name="name" className="h-10" /></Field>
            <Field><Label htmlFor="c-parent">Under (optional)</Label><Select id="c-parent" name="parent_id" className="h-10"><option value="">— Top level —</option>{rows.filter((c) => !c.parent_id).map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}</Select></Field>
          </div>
          <FieldHint>The AI files stories under the main categories; subcategories help you organise the archive.</FieldHint>
        </ActionForm>
      </section>
    </div>
  );
}

async function Settings({ db, canEdit }: { db: Db; canEdit: boolean }) {
  const { data } = await db.rpc("ca_config");
  const c = (data ?? {}) as CaConfig;
  return (
    <section className="max-w-2xl rounded-xl border border-border p-5">
      {!canEdit ? <p className="mb-4 text-sm text-warning">Only users with the settings permission can change these values.</p> : null}
      <ActionForm action={saveCaSettingsAction} submitLabel="Save settings">
        <div className="space-y-2 text-sm">
          <label className="flex items-center gap-2"><input type="checkbox" name="enabled" defaultChecked={c.enabled !== false} /> Pipeline switched on</label>
          <label className="flex items-center gap-2"><input type="checkbox" name="auto_publish" defaultChecked={c.auto_publish !== false} /> Publish automatically when the verification rules pass</label>
          <label className="flex items-center gap-2"><input type="checkbox" name="allow_single_source" defaultChecked={Boolean(c.allow_single_source)} /> Also auto-publish stories reported by a single established outlet</label>
        </div>
        <div className="grid gap-3 sm:grid-cols-3">
          <Field><Label htmlFor="pd-b">Bhutan items per day</Label><Input id="pd-b" name="bhutan" type="number" defaultValue={c.per_day?.bhutan ?? 3} className="h-10" /></Field>
          <Field><Label htmlFor="pd-r">Regional per day</Label><Input id="pd-r" name="regional" type="number" defaultValue={c.per_day?.regional ?? 2} className="h-10" /></Field>
          <Field><Label htmlFor="pd-w">World per day</Label><Input id="pd-w" name="world" type="number" defaultValue={c.per_day?.world ?? 2} className="h-10" /></Field>
          <Field><Label htmlFor="rel">Minimum relevance (0–100)</Label><Input id="rel" name="min_relevance" type="number" defaultValue={c.min_relevance ?? 60} className="h-10" /></Field>
          <Field><Label htmlFor="bud">Daily AI budget (US$)</Label><Input id="bud" name="daily_budget_usd" type="number" step="0.1" defaultValue={c.daily_budget_usd ?? 1.5} className="h-10" /></Field>
          <Field><Label htmlFor="qpi">Questions per story</Label><Input id="qpi" name="questions_per_item" type="number" defaultValue={c.questions_per_item ?? 4} className="h-10" /></Field>
        </div>
        <Field><Label htmlFor="wm">Model for notes and questions</Label>
          <Select id="wm" name="write_model" defaultValue={c.write_model ?? "claude-sonnet-5-5"} className="h-10"><option value="claude-sonnet-5-5">Claude Sonnet 5.5 (recommended, ~US$25/month)</option><option value="claude-opus-5-5">Claude Opus 5.5 (~US$50/month)</option></Select>
        </Field>
        <Field><Label htmlFor="sens">Sensitive terms (one per line) — stories mentioning these are always held</Label>
          <Textarea id="sens" name="sensitive_terms" rows={6} defaultValue={(c.sensitive_terms ?? []).join("\n")} />
        </Field>
      </ActionForm>
    </section>
  );
}
