import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate, formatNu, requestTimeMs } from "@/lib/utils";

export const metadata: Metadata = { title: "My subscription" };

type Ent = { id: string; starts_at: string; ends_at: string | null; status: string; source: string; status_reason: string | null; packages: { name: string; slug: string; renewable: boolean; includes_pe: boolean; includes_me: boolean } | null };
type Ord = { id: string; reference: string; amount: number; discount: number; status: string; kind: string; created_at: string; paid_at: string | null; packages: { name: string } | null; coupons: { code: string } | null };

const ORDER_LABEL: Record<string, string> = { pending_payment: "Waiting for payment", awaiting_verification: "Being verified", paid: "Paid", cancelled: "Cancelled", refunded: "Refunded", failed: "Failed", expired: "Expired" };
const SOURCE_LABEL: Record<string, string> = { purchase: "Purchased", renewal: "Renewed", complimentary: "Complimentary", promotional: "Promotional", manual: "Granted by Soma" };

export default async function SubscriptionPage() {
  await requireUser("/dashboard/subscription");
  const db = await createClient();
  const [{ data: ents }, { data: orders }, { data: pkgs }] = await Promise.all([
    db.from("entitlements").select("id, starts_at, ends_at, status, source, status_reason, packages(name, slug, renewable, includes_pe, includes_me)").order("ends_at", { ascending: false, nullsFirst: true }),
    db.from("orders").select("id, reference, amount, discount, status, kind, created_at, paid_at, packages(name), coupons(code)").order("created_at", { ascending: false }).limit(30),
    db.from("packages").select("id, slug, name, tagline, price, status").eq("status", "available").order("sort_order"),
  ]);
  const now = requestTimeMs();
  const entitlements = (ents ?? []) as unknown as Ent[];
  const active = entitlements.filter((e) => e.status === "active" && (!e.ends_at || new Date(e.ends_at).getTime() > now));
  const past = entitlements.filter((e) => !active.includes(e));
  const ords = (orders ?? []) as unknown as Ord[];
  const open = ords.filter((o) => o.status === "pending_payment" || o.status === "awaiting_verification");

  return (
    <>
      <PageTitle title="My subscription" description="Your packages, payments and renewal options." />
      <div className="space-y-8">
        {open.map((o) => (
          <Link key={o.id} href={`/dashboard/subscription/order/${o.id}`} className="block rounded-xl border border-warning/50 bg-warning-soft/40 p-4 text-sm hover:bg-warning-soft">
            <span className="font-medium text-ink">{o.packages?.name}</span> — {ORDER_LABEL[o.status]} · {formatNu(o.amount)} · {o.reference}
            <span className="ml-2 font-medium text-primary">{o.status === "pending_payment" ? "Pay now →" : "View →"}</span>
          </Link>
        ))}

        <section aria-labelledby="active-h">
          <h2 id="active-h" className="text-lg font-semibold">Current access</h2>
          {active.length === 0 ? (
            <p className="mt-2 text-sm text-muted-foreground">You are on a free account. Your progress and results are always kept.</p>
          ) : (
            <ul className="mt-3 grid gap-3 sm:grid-cols-2">
              {active.map((e) => {
                const days = e.ends_at ? Math.max(0, Math.ceil((new Date(e.ends_at).getTime() - now) / 86400000)) : null;
                return (
                  <li key={e.id} className="rounded-xl border border-border p-5">
                    <div className="flex flex-wrap items-center gap-2"><span className="font-semibold text-ink">{e.packages?.name}</span><Badge tone="green">Active</Badge><Badge tone="outline">{SOURCE_LABEL[e.source] ?? e.source}</Badge></div>
                    <p className="mt-2 text-sm text-muted-foreground">{[e.packages?.includes_pe ? "PE" : null, e.packages?.includes_me ? "ME" : null].filter(Boolean).join(" + ")} · since {formatDate(e.starts_at)}</p>
                    <p className={`mt-1 text-sm ${days !== null && days <= 7 ? "font-medium text-warning" : "text-ink"}`}>{e.ends_at ? `Ends ${formatDate(e.ends_at)} · ${days} day${days === 1 ? "" : "s"} left` : "No end date"}</p>
                    {e.packages?.renewable && e.packages.slug ? <Link href={`/dashboard/subscription/checkout/${e.packages.slug}`} className="mt-3 inline-block text-sm font-medium text-primary hover:underline">Renew (adds time to the end date)</Link> : null}
                  </li>
                );
              })}
            </ul>
          )}
        </section>

        {(pkgs ?? []).length ? (
          <section aria-labelledby="buy-h">
            <h2 id="buy-h" className="text-lg font-semibold">Packages</h2>
            <ul className="mt-3 grid gap-3 sm:grid-cols-2">
              {(pkgs ?? []).map((p) => (
                <li key={p.id} className="rounded-xl border border-border p-4">
                  <p className="font-semibold text-ink">{p.name} <span className="font-normal text-muted-foreground">· {formatNu(p.price)}</span></p>
                  {p.tagline ? <p className="text-sm text-muted-foreground">{p.tagline}</p> : null}
                  <Link href={`/dashboard/subscription/checkout/${p.slug}`} className="mt-2 inline-block text-sm font-medium text-primary hover:underline">Choose</Link>
                </li>
              ))}
            </ul>
          </section>
        ) : null}

        <section aria-labelledby="hist-h">
          <h2 id="hist-h" className="text-lg font-semibold">Payment history</h2>
          {ords.length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No payments yet.</p> : (
            <ul className="mt-3 divide-y divide-border rounded-xl border border-border text-sm">
              {ords.map((o) => (
                <li key={o.id}>
                  <Link href={`/dashboard/subscription/order/${o.id}`} className="flex flex-wrap items-center gap-2 p-3 hover:bg-muted/50">
                    <span className="flex-1"><span className="font-medium text-ink">{o.packages?.name}</span>{o.kind === "renewal" ? " (renewal)" : ""} · {o.reference}{o.coupons?.code ? ` · code ${o.coupons.code}` : ""}</span>
                    <span className="tabular-nums">{formatNu(o.amount)}</span>
                    <Badge tone={o.status === "paid" ? "green" : o.status === "refunded" ? "neutral" : "warning"}>{ORDER_LABEL[o.status] ?? o.status}</Badge>
                    <span className="text-xs text-muted-foreground">{formatDate(o.paid_at ?? o.created_at)}</span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </section>

        {past.length ? (
          <section aria-labelledby="past-h">
            <h2 id="past-h" className="text-lg font-semibold">Earlier access</h2>
            <ul className="mt-2 space-y-1 text-sm">{past.map((e) => <li key={e.id}>{e.packages?.name} · {formatDate(e.starts_at)} – {e.ends_at ? formatDate(e.ends_at) : "—"} · <span className="text-muted-foreground">{e.status === "active" ? "expired" : e.status}{e.status_reason ? ` (${e.status_reason})` : ""}</span></li>)}</ul>
          </section>
        ) : null}
        <p className="text-xs text-muted-foreground">Questions about a payment? <Link href="/contact" className="underline">Contact Soma</Link> with your order number. See the <Link href="/refunds" className="underline">refund policy</Link>.</p>
      </div>
    </>
  );
}
