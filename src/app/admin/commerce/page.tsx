import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";
import { can, requirePermission } from "@/lib/auth/dal";
import { listProviders } from "@/lib/payments/registry";
import { createClient } from "@/lib/supabase/server";
import { cn, formatDate, formatNu, requestTimeMs } from "@/lib/utils";
import {
  addQrMethodAction, createCouponAction, grantAction, refundAction, removeMethodAction, reviewPaymentAction, savePaymentSettingsAction, subscriptionAction, toggleCouponAction,
} from "./actions";

export const metadata: Metadata = { title: "Orders & payments" };

const TABS = [
  ["overview", "Overview"], ["approvals", "Payment approvals"], ["orders", "Orders"], ["subscriptions", "Subscriptions"],
  ["coupons", "Coupons"], ["reconcile", "Reconciliation"], ["settings", "Payment settings"],
] as const;
type Tab = (typeof TABS)[number][0];
type Db = Awaited<ReturnType<typeof createClient>>;

export default async function CommercePage({ searchParams }: PageProps<"/admin/commerce">) {
  const user = await requirePermission("payments.verify", "/admin/commerce");
  const sp = await searchParams;
  const tab: Tab = (TABS.map((t) => t[0]) as string[]).includes(String(sp.tab)) ? (sp.tab as Tab) : "overview";
  const db = await createClient();
  return (
    <>
      <PageTitle title="Orders & payments" description="Payments, subscriptions, coupons and revenue. Collected revenue counts confirmed payments only." />
      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Sections">
        {TABS.map(([k, l]) => <Link key={k} href={`/admin/commerce?tab=${k}`} className={cn("rounded-full border px-4 py-1.5 text-sm font-medium", tab === k ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>{l}</Link>)}
      </nav>
      {tab === "overview" ? <Overview db={db} days={Number(sp.days) || 30} /> : null}
      {tab === "approvals" ? <Approvals db={db} /> : null}
      {tab === "orders" ? <Orders db={db} q={typeof sp.q === "string" ? sp.q : ""} status={typeof sp.status === "string" ? sp.status : ""} /> : null}
      {tab === "subscriptions" ? <Subscriptions db={db} q={typeof sp.q === "string" ? sp.q : ""} /> : null}
      {tab === "coupons" ? <Coupons db={db} canEdit={can(user, "packages.manage")} /> : null}
      {tab === "reconcile" ? <Reconcile db={db} /> : null}
      {tab === "settings" ? <Settings db={db} canEdit={can(user, "settings.manage")} /> : null}
    </>
  );
}

type Report = {
  collected: number; refunded: number; pending_amount: number; awaiting_verification: number; failed_payments: number; paid_orders: number; renewals: number;
  students: number; active_subscribers: number; expiring_14d: number; expired_30d: number;
  by_day: { day: string; amount: number; orders: number }[]; by_package: { package: string; orders: number; amount: number }[];
};

async function Overview({ db, days }: { db: Db; days: number }) {
  const { data } = await db.rpc("commerce_report", { _days: days });
  const r = (data ?? {}) as Report;
  const net = Number(r.collected ?? 0) - Number(r.refunded ?? 0);
  const today = new Date(requestTimeMs() + 6 * 3600e3).toISOString().slice(0, 10);
  const sumSince = (n: number) => (r.by_day ?? []).filter((d) => d.day >= new Date(requestTimeMs() + 6 * 3600e3 - n * 86400e3).toISOString().slice(0, 10)).reduce((s, d) => s + Number(d.amount), 0);
  return (
    <div className="space-y-6">
      <nav className="flex gap-2 text-sm" aria-label="Period">{[7, 30, 90, 365].map((n) => <Link key={n} href={`/admin/commerce?tab=overview&days=${n}`} className={cn("rounded-md border px-3 py-1", days === n ? "border-primary text-primary" : "border-border")}>{n} days</Link>)}</nav>
      <dl className="grid grid-cols-2 gap-3 md:grid-cols-4">
        {[
          ["Collected (net of refunds)", formatNu(net)], ["Collected today", formatNu((r.by_day ?? []).find((d) => d.day === today)?.amount ?? 0)],
          ["Last 7 days", formatNu(sumSince(7))], ["Refunds", formatNu(r.refunded ?? 0)],
          ["Pending (not collected)", formatNu(r.pending_amount ?? 0)], ["Awaiting your verification", String(r.awaiting_verification ?? 0)],
          ["Failed / rejected payments", String(r.failed_payments ?? 0)], ["Renewals", String(r.renewals ?? 0)],
          ["Registered students", String(r.students ?? 0)], ["Active subscribers", String(r.active_subscribers ?? 0)],
          ["Expiring in 14 days", String(r.expiring_14d ?? 0)], ["Expired in last 30 days", String(r.expired_30d ?? 0)],
        ].map(([k, v]) => <div key={k} className="rounded-xl border border-border p-4"><dt className="text-xs text-muted-foreground">{k}</dt><dd className="mt-1 text-xl font-semibold tabular-nums text-ink">{v}</dd></div>)}
      </dl>
      <div className="grid gap-6 lg:grid-cols-2">
        <section className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">Collected by day</h2>
          {(r.by_day ?? []).length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No payments in this period.</p> : (
            <table className="mt-3 w-full text-sm"><tbody className="divide-y divide-border">
              {[...(r.by_day ?? [])].reverse().map((d) => <tr key={d.day}><td className="py-1.5">{formatDate(d.day)}</td><td className="py-1.5 text-right tabular-nums">{d.orders}</td><td className="py-1.5 text-right tabular-nums">{formatNu(d.amount)}</td></tr>)}
            </tbody></table>
          )}
        </section>
        <section className="rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">By package</h2>
          {(r.by_package ?? []).length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No sales in this period.</p> : (
            <table className="mt-3 w-full text-sm"><tbody className="divide-y divide-border">
              {(r.by_package ?? []).map((p) => <tr key={p.package}><td className="py-1.5">{p.package}</td><td className="py-1.5 text-right tabular-nums">{p.orders}</td><td className="py-1.5 text-right tabular-nums">{formatNu(p.amount)}</td></tr>)}
            </tbody></table>
          )}
        </section>
      </div>
      <p className="text-sm">Exports (CSV): <a href="/admin/commerce/export?type=orders" className="font-medium text-primary hover:underline">orders</a> · <a href="/admin/commerce/export?type=transactions" className="font-medium text-primary hover:underline">payments</a> · <a href="/admin/commerce/export?type=subscriptions" className="font-medium text-primary hover:underline">subscriptions</a> · <a href="/admin/commerce/export?type=students" className="font-medium text-primary hover:underline">students</a></p>
      <p className="text-xs text-muted-foreground">Collected = orders confirmed as paid in this period (manual approvals and gateway confirmations). Pending amounts are not revenue until confirmed. The free database plan has no automatic backups: download these exports regularly.</p>
    </div>
  );
}

type Tx = { id: string; amount: number; payer_reference: string | null; proof_path: string | null; created_at: string; raw: { duplicate_reference?: boolean; amount_entered?: number } | null;
  orders: { id: string; reference: string; amount: number; user_id: string; packages: { name: string } | null } | null };

async function Approvals({ db }: { db: Db }) {
  const { data } = await db.from("payment_transactions").select("id, amount, payer_reference, proof_path, created_at, raw, orders(id, reference, amount, user_id, packages(name))").eq("provider", "manual").eq("status", "submitted").order("created_at").limit(50);
  const rows = (data ?? []) as unknown as Tx[];
  const paths = rows.map((r) => r.proof_path).filter(Boolean) as string[];
  const signed = paths.length ? (await db.storage.from("payment-proofs").createSignedUrls(paths, 3600)).data ?? [] : [];
  const url = (p: string | null) => (p ? signed.find((s) => s.path === p)?.signedUrl ?? undefined : undefined);
  const { data: users } = rows.length ? await db.rpc("admin_list_users", { _search: null, _limit: 500, _offset: 0 }) : { data: [] };
  const who = (id?: string) => ((users ?? []) as { id: string; email: string; full_name: string }[]).find((u) => u.id === id);
  return rows.length === 0 ? <p className="text-sm text-muted-foreground">No payments waiting for verification.</p> : (
    <ul className="space-y-4">
      {rows.map((t) => {
        const u = who(t.orders?.user_id);
        const mismatch = Number(t.amount) + 0.005 < Number(t.orders?.amount ?? 0);
        return (
          <li key={t.id} className="rounded-xl border border-border p-4 text-sm">
            <div className="flex flex-wrap items-center gap-2">
              <span className="font-semibold text-ink">{t.orders?.packages?.name}</span><span className="text-muted-foreground">{t.orders?.reference}</span>
              <span className="text-muted-foreground">· {u ? `${u.full_name || "—"} (${u.email})` : "student"}</span>
              <span className="ml-auto text-xs text-muted-foreground">{formatDate(t.created_at)}</span>
            </div>
            <p className="mt-2">Order total <b>{formatNu(t.orders?.amount)}</b> · student says paid <b className={mismatch ? "text-danger" : ""}>{formatNu(t.amount)}</b> · reference <b>{t.payer_reference}</b></p>
            {t.raw?.duplicate_reference ? <p className="mt-1 font-medium text-danger">⚠ This reference was already used in another payment. Check carefully.</p> : null}
            {mismatch ? <p className="mt-1 font-medium text-danger">⚠ The amount entered is less than the order total.</p> : null}
            {url(t.proof_path) ? <a href={url(t.proof_path)} target="_blank" rel="noreferrer" className="mt-2 inline-block font-medium text-primary hover:underline">Open payment screenshot</a> : <p className="mt-2 text-muted-foreground">No screenshot attached.</p>}
            <p className="mt-2 text-xs text-muted-foreground">Approve only after you see the money in Soma’s bank account statement.</p>
            <div className="mt-3 grid gap-3 sm:grid-cols-2">
              <ActionForm action={reviewPaymentAction} submitLabel="Approve — money received" className="space-y-2" confirm="Confirm the money is in Soma’s account?">
                <input type="hidden" name="id" value={t.id} /><input type="hidden" name="decision" value="approve" />
                <Input name="note" placeholder="Note (optional)" aria-label="Approval note" className="h-10" />
              </ActionForm>
              <ActionForm action={reviewPaymentAction} submitLabel="Reject" variant="danger" className="space-y-2">
                <input type="hidden" name="id" value={t.id} /><input type="hidden" name="decision" value="reject" />
                <Input name="note" placeholder="Reason shown to the student (required)" aria-label="Rejection reason" className="h-10" />
              </ActionForm>
            </div>
          </li>
        );
      })}
    </ul>
  );
}

type OrderRow = { id: string; reference: string; amount: number; status: string; kind: string; provider: string | null; created_at: string; paid_at: string | null; user_id: string; packages: { name: string } | null;
  payment_transactions: { provider: string; status: string; payer_reference: string | null; provider_ref: string | null }[]; refunds: { amount: number; status: string }[] };

async function Orders({ db, q, status }: { db: Db; q: string; status: string }) {
  let query = db.from("orders").select("id, reference, amount, status, kind, provider, created_at, paid_at, user_id, packages(name), payment_transactions(provider, status, payer_reference, provider_ref), refunds(amount, status)").order("created_at", { ascending: false }).limit(100);
  if (status) query = query.eq("status", status);
  if (q) query = query.ilike("reference", `%${q.replace(/[%_]/g, "")}%`);
  const { data } = await query;
  const rows = (data ?? []) as unknown as OrderRow[];
  return (
    <div className="space-y-4">
      <form className="flex flex-wrap gap-2" role="search">
        <input type="hidden" name="tab" value="orders" />
        <Input name="q" defaultValue={q} placeholder="Order number" aria-label="Order number" className="h-10 w-48" />
        <Select name="status" defaultValue={status} aria-label="Status" className="h-10 w-52">
          <option value="">All statuses</option>{["pending_payment", "awaiting_verification", "paid", "refunded", "cancelled", "expired", "failed"].map((s) => <option key={s} value={s}>{s.replace("_", " ")}</option>)}
        </Select>
        <button type="submit" className="h-10 rounded-md border border-border-strong px-4 text-sm font-medium">Filter</button>
      </form>
      <ul className="divide-y divide-border rounded-xl border border-border text-sm">
        {rows.map((o) => {
          const refunded = o.refunds.filter((r) => r.status === "succeeded").reduce((s, r) => s + Number(r.amount), 0);
          const tx = o.payment_transactions[0];
          return (
            <li key={o.id} className="p-3">
              <details>
                <summary className="flex cursor-pointer flex-wrap items-center gap-2">
                  <span className="font-medium text-ink">{o.reference}</span><span>{o.packages?.name}{o.kind === "renewal" ? " (renewal)" : ""}</span>
                  <span className="tabular-nums">{formatNu(o.amount)}</span>
                  <Badge tone={o.status === "paid" ? "green" : o.status === "refunded" ? "neutral" : o.status === "awaiting_verification" ? "warning" : "outline"}>{o.status.replace("_", " ")}</Badge>
                  <span className="text-xs text-muted-foreground">{o.provider ?? "—"} · {formatDate(o.paid_at ?? o.created_at)}{refunded ? ` · refunded ${formatNu(refunded)}` : ""}</span>
                </summary>
                <div className="mt-3 space-y-2 pl-2">
                  {o.payment_transactions.map((t, i) => <p key={i} className="text-xs text-muted-foreground">{t.provider} · {t.status}{t.payer_reference ? ` · ref ${t.payer_reference}` : ""}{t.provider_ref ? ` · provider ${t.provider_ref}` : ""}</p>)}
                  {o.status === "paid" ? (
                    <ActionForm action={refundAction} submitLabel="Record refund" variant="secondary" className="grid gap-2 sm:grid-cols-[120px_1fr_auto]" confirm="Record this refund? Full refunds end the student's access.">
                      <input type="hidden" name="order" value={o.id} />
                      <Input name="amount" type="number" step="0.01" defaultValue={Number(o.amount) - refunded} aria-label="Refund amount" className="h-10" />
                      <Input name="reason" placeholder="Reason" aria-label="Refund reason" className="h-10" />
                    </ActionForm>
                  ) : null}
                  {o.status === "paid" && tx?.provider === "manual" ? <p className="text-xs text-muted-foreground">Manual payment: send the money back from Soma’s bank first, then record it here.</p> : null}
                </div>
              </details>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

type SubRow = { id: string; user_id: string; status: string; source: string; starts_at: string; ends_at: string | null; status_reason: string | null; packages: { name: string } | null };

async function Subscriptions({ db, q }: { db: Db; q: string }) {
  const [{ data: subs }, { data: pkgs }, { data: users }] = await Promise.all([
    db.from("entitlements").select("id, user_id, status, source, starts_at, ends_at, status_reason, packages(name)").order("created_at", { ascending: false }).limit(200),
    db.from("packages").select("id, name").order("sort_order"),
    db.rpc("admin_list_users", { _search: q || null, _limit: 500, _offset: 0 }),
  ]);
  const u = (users ?? []) as { id: string; email: string; full_name: string }[];
  const rows = ((subs ?? []) as unknown as SubRow[]).filter((s) => !q || u.some((x) => x.id === s.user_id));
  const now = requestTimeMs();
  return (
    <div className="space-y-6">
      <section className="max-w-2xl rounded-xl border border-border p-5">
        <h2 className="font-semibold text-ink">Give access (complimentary, promotional or manual)</h2>
        <ActionForm action={grantAction} submitLabel="Grant access" className="mt-3">
          <div className="grid gap-3 sm:grid-cols-2">
            <Field><Label htmlFor="g-email">Student e-mail</Label><Input id="g-email" name="email" type="email" className="h-10" /></Field>
            <Field><Label htmlFor="g-pkg">Package</Label><Select id="g-pkg" name="package" className="h-10">{(pkgs ?? []).map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}</Select></Field>
            <Field><Label htmlFor="g-days">Days</Label><Input id="g-days" name="days" type="number" defaultValue={30} className="h-10" /></Field>
            <Field><Label htmlFor="g-src">Type</Label><Select id="g-src" name="source" className="h-10"><option value="complimentary">Complimentary</option><option value="promotional">Promotional</option><option value="manual">Manual (e.g. paid outside Soma)</option></Select></Field>
          </div>
          <Field><Label htmlFor="g-note">Reason (kept in the history)</Label><Input id="g-note" name="note" className="h-10" /></Field>
        </ActionForm>
      </section>
      <form className="flex gap-2" role="search"><input type="hidden" name="tab" value="subscriptions" /><Input name="q" defaultValue={q} placeholder="Search by e-mail or name" aria-label="Search" className="h-10 w-72" /><button type="submit" className="h-10 rounded-md border border-border-strong px-4 text-sm font-medium">Search</button></form>
      <ul className="divide-y divide-border rounded-xl border border-border text-sm">
        {rows.map((s) => {
          const person = u.find((x) => x.id === s.user_id);
          const live = s.status === "active" && (!s.ends_at || new Date(s.ends_at).getTime() > now);
          return (
            <li key={s.id} className="p-3">
              <details>
                <summary className="flex cursor-pointer flex-wrap items-center gap-2">
                  <span className="font-medium text-ink">{person?.email ?? s.user_id.slice(0, 8)}</span><span>{s.packages?.name}</span>
                  <Badge tone={live ? "green" : s.status === "suspended" ? "warning" : "neutral"}>{live ? "active" : s.status === "active" ? "expired" : s.status}</Badge>
                  <span className="text-xs text-muted-foreground">{s.source} · {formatDate(s.starts_at)} – {s.ends_at ? formatDate(s.ends_at) : "no end"}{s.status_reason ? ` · ${s.status_reason}` : ""}</span>
                </summary>
                <div className="mt-3 grid gap-3 sm:grid-cols-2">
                  <ActionForm action={subscriptionAction} submitLabel="Extend" variant="secondary" className="space-y-2">
                    <input type="hidden" name="id" value={s.id} /><input type="hidden" name="op" value="extend" />
                    <div className="grid grid-cols-[90px_1fr] gap-2"><Input name="days" type="number" defaultValue={7} aria-label="Days" className="h-10" /><Input name="note" placeholder="Reason" aria-label="Reason" className="h-10" /></div>
                  </ActionForm>
                  <ActionForm action={subscriptionAction} submitLabel="Apply" variant="secondary" className="space-y-2">
                    <input type="hidden" name="id" value={s.id} />
                    <div className="grid grid-cols-[130px_1fr] gap-2">
                      <Select name="op" aria-label="Change" className="h-10"><option value="suspended">Suspend</option><option value="active">Restore</option><option value="revoked">End access</option></Select>
                      <Input name="note" placeholder="Reason (shown to student)" aria-label="Reason" className="h-10" />
                    </div>
                  </ActionForm>
                </div>
              </details>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

type Coupon = { id: string; code: string; description: string | null; kind: string; value: number; max_redemptions: number | null; per_user_limit: number; starts_at: string | null; ends_at: string | null; is_active: boolean; package_ids: string[] | null; user_id: string | null; coupon_redemptions: { status: string }[] };

async function Coupons({ db, canEdit }: { db: Db; canEdit: boolean }) {
  const [{ data }, { data: pkgs }] = await Promise.all([
    db.from("coupons").select("*, coupon_redemptions(status)").order("created_at", { ascending: false }),
    db.from("packages").select("id, name").order("sort_order"),
  ]);
  const rows = (data ?? []) as Coupon[];
  return (
    <div className="space-y-6">
      {canEdit ? (
        <section className="max-w-2xl rounded-xl border border-border p-5">
          <h2 className="font-semibold text-ink">New promotion code</h2>
          <ActionForm action={createCouponAction} submitLabel="Create code" className="mt-3">
            <div className="grid gap-3 sm:grid-cols-3">
              <Field><Label htmlFor="c-code">Code</Label><Input id="c-code" name="code" placeholder="LAUNCH20" className="h-10 uppercase" /></Field>
              <Field><Label htmlFor="c-kind">Type</Label><Select id="c-kind" name="kind" className="h-10"><option value="percent">% off</option><option value="fixed">Nu. off</option></Select></Field>
              <Field><Label htmlFor="c-val">Value</Label><Input id="c-val" name="value" type="number" step="0.01" className="h-10" /></Field>
              <Field><Label htmlFor="c-max">Total uses (blank = unlimited)</Label><Input id="c-max" name="max_redemptions" type="number" className="h-10" /></Field>
              <Field><Label htmlFor="c-per">Uses per student</Label><Input id="c-per" name="per_user_limit" type="number" defaultValue={1} className="h-10" /></Field>
              <Field><Label htmlFor="c-pkg">Package</Label><Select id="c-pkg" name="package_id" className="h-10"><option value="">All packages</option>{(pkgs ?? []).map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}</Select></Field>
              <Field><Label htmlFor="c-from">Starts (optional)</Label><Input id="c-from" name="starts_at" type="date" className="h-10" /></Field>
              <Field><Label htmlFor="c-to">Ends (optional)</Label><Input id="c-to" name="ends_at" type="date" className="h-10" /></Field>
              <Field><Label htmlFor="c-user">Only for (e-mail, optional)</Label><Input id="c-user" name="user_email" type="email" className="h-10" /></Field>
            </div>
            <Field><Label htmlFor="c-desc">Description (internal)</Label><Input id="c-desc" name="description" className="h-10" /></Field>
          </ActionForm>
        </section>
      ) : null}
      <ul className="divide-y divide-border rounded-xl border border-border text-sm">
        {rows.length === 0 ? <li className="p-3 text-muted-foreground">No codes yet.</li> : rows.map((c) => {
          const used = c.coupon_redemptions.filter((r) => r.status === "used").length;
          return (
            <li key={c.id} className="flex flex-wrap items-center gap-2 p-3">
              <span className="font-mono font-semibold text-ink">{c.code}</span>
              <span>{c.kind === "percent" ? `${Number(c.value)}% off` : `${formatNu(c.value)} off`}</span>
              <Badge tone={c.is_active ? "green" : "neutral"}>{c.is_active ? "active" : "disabled"}</Badge>
              <span className="text-xs text-muted-foreground">used {used}{c.max_redemptions ? ` of ${c.max_redemptions}` : ""}{c.ends_at ? ` · ends ${formatDate(c.ends_at)}` : ""}{c.package_ids ? " · one package" : ""}{c.user_id ? " · one student" : ""}{c.description ? ` · ${c.description}` : ""}</span>
              {canEdit ? (
                <span className="ml-auto flex gap-2">
                  <ActionForm action={toggleCouponAction} submitLabel={c.is_active ? "Disable" : "Enable"} variant="secondary" className="space-y-0"><input type="hidden" name="id" value={c.id} /><input type="hidden" name="op" value={c.is_active ? "disable" : "enable"} /></ActionForm>
                  <ActionForm action={toggleCouponAction} submitLabel="Remove" variant="danger" className="space-y-0" confirm="Remove this code?"><input type="hidden" name="id" value={c.id} /><input type="hidden" name="op" value="delete" /></ActionForm>
                </span>
              ) : null}
            </li>
          );
        })}
      </ul>
    </div>
  );
}

async function Reconcile({ db }: { db: Db }) {
  const stale = new Date(requestTimeMs() - 30 * 60 * 1000).toISOString();
  const [{ data: stuck }, { data: failed }, { data: events }, { data: dupes }] = await Promise.all([
    db.from("payment_transactions").select("id, provider, status, amount, created_at, orders(reference)").in("status", ["initiated", "pending"]).neq("provider", "manual").lt("created_at", stale).limit(50),
    db.from("payment_transactions").select("id, provider, status, amount, failure_reason, created_at, orders(reference)").in("status", ["failed", "rejected"]).order("created_at", { ascending: false }).limit(30),
    db.from("payment_events").select("id, provider, event_id, event_type, signature_ok, received_at").order("received_at", { ascending: false }).limit(30),
    db.from("payment_transactions").select("id, payer_reference, status, orders(reference)").eq("provider", "manual").not("raw->duplicate_reference", "is", null).eq("raw->>duplicate_reference", "true").limit(30),
  ]);
  const ref = (o: unknown) => (o as { reference: string } | null)?.reference ?? "—";
  return (
    <div className="space-y-6 text-sm">
      <section><h2 className="font-semibold text-ink">Gateway payments waiting more than 30 minutes</h2>
        <p className="text-xs text-muted-foreground">The scheduler re-checks these with the provider every 3 hours.</p>
        <ul className="mt-2 space-y-1">{(stuck ?? []).length ? (stuck ?? []).map((t) => <li key={t.id}>{ref(t.orders)} · {t.provider} · {formatNu(t.amount)} · {t.status} · {formatDate(t.created_at)}</li>) : <li className="text-muted-foreground">None.</li>}</ul>
      </section>
      <section><h2 className="font-semibold text-ink">Reused transaction references (manual)</h2>
        <ul className="mt-2 space-y-1">{(dupes ?? []).length ? (dupes ?? []).map((t) => <li key={t.id} className="text-danger">{ref(t.orders)} · ref {t.payer_reference} · {t.status}</li>) : <li className="text-muted-foreground">None.</li>}</ul>
      </section>
      <section><h2 className="font-semibold text-ink">Recent failed or rejected payments</h2>
        <ul className="mt-2 space-y-1">{(failed ?? []).length ? (failed ?? []).map((t) => <li key={t.id}>{ref(t.orders)} · {t.provider} · {formatNu(t.amount)} · {t.status}{t.failure_reason ? ` · ${t.failure_reason}` : ""}</li>) : <li className="text-muted-foreground">None.</li>}</ul>
      </section>
      <section><h2 className="font-semibold text-ink">Provider notifications received</h2>
        <ul className="mt-2 space-y-1">{(events ?? []).length ? (events ?? []).map((e) => <li key={e.id}>{formatDate(e.received_at)} · {e.provider} · {e.event_type} · {e.event_id}{e.signature_ok ? "" : <span className="text-danger"> · invalid signature</span>}</li>) : <li className="text-muted-foreground">None.</li>}</ul>
      </section>
    </div>
  );
}

async function Settings({ db, canEdit }: { db: Db; canEdit: boolean }) {
  const [{ data: pay }, { data: sec }] = await Promise.all([
    db.from("app_settings").select("value").eq("key", "payments.config").maybeSingle(),
    db.from("app_settings").select("value").eq("key", "security.config").maybeSingle(),
  ]);
  const c = (pay?.value ?? {}) as { manual_enabled?: boolean; sandbox_enabled?: boolean; gateway_provider?: string | null; order_expiry_hours?: number; manual_instructions?: string; manual_methods?: { label: string; details: string; image_url?: string }[]; expiry_reminder_days?: number[] };
  const s = (sec?.value ?? {}) as { max_concurrent_sessions?: number };
  const providers = listProviders();
  return (
    <div className="max-w-2xl space-y-6">
    <section className="rounded-xl border border-border p-5">
      <h2 className="font-semibold text-ink">Payment methods students see</h2>
      {(c.manual_methods ?? []).length === 0 ? <p className="mt-2 text-sm text-warning">No payment methods yet — students cannot pay until you add one.</p> : (
        <ul className="mt-3 space-y-3">
          {(c.manual_methods ?? []).map((m) => (
            <li key={m.label} className="flex flex-wrap items-start gap-3 rounded-lg border border-border p-3 text-sm">
              {/* eslint-disable-next-line @next/next/no-img-element -- admin-uploaded QR */}
              {m.image_url ? <img src={m.image_url} alt={`${m.label} QR code`} className="size-24 rounded border border-border object-contain" /> : null}
              <div className="min-w-0 flex-1"><p className="font-medium text-ink">{m.label}</p><p className="whitespace-pre-wrap text-muted-foreground">{m.details || "—"}</p></div>
              {canEdit ? <ActionForm action={removeMethodAction} submitLabel="Remove" variant="danger" className="space-y-0" confirm="Remove this payment method?"><input type="hidden" name="label" value={m.label} /></ActionForm> : null}
            </li>
          ))}
        </ul>
      )}
      {canEdit ? (
        <ActionForm action={addQrMethodAction} submitLabel="Add QR payment method" className="mt-4">
          <div className="grid gap-3 sm:grid-cols-2">
            <Field><Label htmlFor="qr-label">Name</Label><Input id="qr-label" name="label" placeholder="T Bank QR" className="h-10" /></Field>
            <Field><Label htmlFor="qr-file">QR code image</Label><Input id="qr-file" name="qr" type="file" accept="image/png,image/jpeg,image/webp" className="h-10 py-1.5" /></Field>
          </div>
          <Field><Label htmlFor="qr-details">Details (optional)</Label><Textarea id="qr-details" name="details" rows={2} placeholder={"Account name: …\nScan with any Bhutanese banking app and pay the exact amount."} /></Field>
        </ActionForm>
      ) : null}
    </section>
    <section className="rounded-xl border border-border p-5">
      {!canEdit ? <p className="mb-4 text-sm text-warning">Only users with the settings permission can change these.</p> : null}
      <ActionForm action={savePaymentSettingsAction} submitLabel="Save settings">
        <div className="space-y-2 text-sm">
          <label className="flex items-center gap-2"><input type="checkbox" name="manual_enabled" defaultChecked={c.manual_enabled !== false} /> Accept manual payments (bank transfer / mobile banking with screenshot)</label>
          <label className="flex items-center gap-2"><input type="checkbox" name="sandbox_enabled" defaultChecked={Boolean(c.sandbox_enabled)} /> Show the test gateway to admins (for testing; never visible to students)</label>
        </div>
        <Field><Label htmlFor="gw">Online payment gateway</Label>
          <Select id="gw" name="gateway_provider" defaultValue={c.gateway_provider ?? ""} className="h-10">
            <option value="">None yet (bank integration pending)</option>
            {providers.filter((p) => p.id !== "sandbox").map((p) => <option key={p.id} value={p.id} disabled={!p.configured}>{p.displayName}{p.configured ? "" : " (not configured)"}</option>)}
          </Select>
          <FieldHint>Bank gateways appear here once their adapter is installed (see the Payment Integration Guide).</FieldHint>
        </Field>
        <Field><Label htmlFor="mi">Instructions shown to students</Label><Textarea id="mi" name="manual_instructions" rows={3} defaultValue={c.manual_instructions ?? ""} /></Field>
        <Field><Label htmlFor="mm">Payment accounts (text)</Label>
          <Textarea id="mm" name="manual_methods" rows={7} defaultValue={(c.manual_methods ?? []).map((m) => `${m.label}\n${m.details}`).join("\n\n")} placeholder={"Bank of Bhutan transfer\nAccount name: …\nAccount number: …\n\nmBoB / mPay\nScan the QR or pay to …"} />
          <FieldHint>First line = name of the method, following lines = details. Leave a blank line between methods.</FieldHint>
        </Field>
        <div className="grid gap-3 sm:grid-cols-3">
          <Field><Label htmlFor="exp">Unpaid order expires after (hours)</Label><Input id="exp" name="order_expiry_hours" type="number" defaultValue={c.order_expiry_hours ?? 72} className="h-10" /></Field>
          <Field><Label htmlFor="rem">Expiry reminders (days before)</Label><Input id="rem" name="expiry_reminder_days" defaultValue={(c.expiry_reminder_days ?? [7, 1]).join(", ")} className="h-10" /></Field>
          <Field><Label htmlFor="ses">Devices signed in at once</Label><Input id="ses" name="max_concurrent_sessions" type="number" defaultValue={s.max_concurrent_sessions ?? 2} className="h-10" /></Field>
        </div>
      </ActionForm>
    </section>
    </div>
  );
}
