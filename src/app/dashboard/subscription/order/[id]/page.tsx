import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { GatewayButton } from "@/components/commerce/gateway-button";
import { ManualPaymentForm } from "@/components/commerce/manual-payment-form";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate, formatNu } from "@/lib/utils";
import { cancelOrderAction } from "../../actions";

export const metadata: Metadata = { title: "Payment" };

const STATUS: Record<string, { label: string; tone: "green" | "warning" | "neutral" | "danger" }> = {
  pending_payment: { label: "Waiting for payment", tone: "warning" }, awaiting_verification: { label: "Payment being verified", tone: "warning" },
  paid: { label: "Paid — access active", tone: "green" }, cancelled: { label: "Cancelled", tone: "neutral" }, refunded: { label: "Refunded", tone: "neutral" },
  failed: { label: "Failed", tone: "danger" }, expired: { label: "Expired", tone: "neutral" },
};

type Options = { manual_enabled: boolean; manual_instructions: string | null; manual_methods: { label: string; details: string }[]; gateway_provider: string | null; sandbox: boolean };

export default async function OrderPage({ params, searchParams }: PageProps<"/dashboard/subscription/order/[id]">) {
  const { id } = await params;
  const sp = await searchParams;
  const user = await requireUser(`/dashboard/subscription/order/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const [{ data: o }, { data: opts }] = await Promise.all([
    db.from("orders").select("id, reference, amount, subtotal, discount, status, expires_at, created_at, kind, packages(name), payment_transactions(id, provider, status, payer_reference, review_note, failure_reason, created_at)").eq("id", id).maybeSingle(),
    db.rpc("payment_options"),
  ]);
  if (!o) notFound();
  const options = (opts ?? { manual_enabled: true, manual_instructions: null, manual_methods: [], gateway_provider: null, sandbox: false }) as Options;
  const txs = ((o.payment_transactions ?? []) as { id: string; provider: string; status: string; payer_reference: string | null; review_note: string | null; failure_reason: string | null; created_at: string }[]).sort((a, b) => b.created_at.localeCompare(a.created_at));
  const lastRejected = txs.find((t) => t.status === "rejected");
  const st = STATUS[o.status] ?? { label: o.status, tone: "neutral" as const };
  const pkg = (o.packages as unknown as { name: string } | null)?.name;

  return (
    <div className="mx-auto max-w-xl">
      <Link href="/dashboard/subscription" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink"><ChevronLeft className="size-4" aria-hidden /> My subscription</Link>
      <h1 className="mt-3 font-serif text-3xl font-semibold">{pkg}{o.kind === "renewal" ? " — renewal" : ""}</h1>
      <div className="mt-2 flex flex-wrap items-center gap-2 text-sm"><Badge tone={st.tone}>{st.label}</Badge><span className="text-muted-foreground">Order {o.reference}</span></div>
      {sp.result === "failed" ? <p className="mt-4 rounded-lg bg-warning-soft p-3 text-sm text-warning">The payment did not go through. You can try again.</p> : null}
      {sp.result === "pending" ? <p className="mt-4 rounded-lg bg-muted p-3 text-sm">We are waiting for the bank to confirm your payment. This page will show the result shortly.</p> : null}

      <dl className="mt-6 space-y-1 rounded-xl bg-muted/60 p-4 text-sm">
        {Number(o.discount) > 0 ? <div className="flex justify-between"><dt>Price</dt><dd>{formatNu(o.subtotal)}</dd></div> : null}
        {Number(o.discount) > 0 ? <div className="flex justify-between text-primary"><dt>Discount</dt><dd>− {formatNu(o.discount)}</dd></div> : null}
        <div className="flex justify-between text-base font-semibold text-ink"><dt>Amount to pay</dt><dd className="tabular-nums">{formatNu(o.amount)}</dd></div>
        {o.status === "pending_payment" && o.expires_at ? <div className="flex justify-between text-xs text-muted-foreground"><dt>Pay before</dt><dd>{formatDate(o.expires_at)}</dd></div> : null}
      </dl>

      {o.status === "pending_payment" ? (
        <div className="mt-8 space-y-8">
          {lastRejected ? <p className="rounded-lg bg-warning-soft p-3 text-sm text-warning">Your previous submission could not be verified: {lastRejected.review_note}</p> : null}
          {options.gateway_provider ? (
            <section><h2 className="text-lg font-semibold">Pay online</h2><div className="mt-3"><GatewayButton orderId={o.id} provider={options.gateway_provider} label={`Pay ${formatNu(o.amount)} online`} /></div></section>
          ) : null}
          {options.sandbox ? (
            <section className="rounded-xl border border-dashed border-warning p-4"><h2 className="font-semibold">Test gateway (admins only)</h2><p className="mt-1 text-xs text-muted-foreground">Simulates a bank payment. No real money moves.</p><div className="mt-3"><GatewayButton orderId={o.id} provider="sandbox" label="Pay with the test gateway" /></div></section>
          ) : null}
          {options.manual_enabled ? (
            <section aria-labelledby="manual-h">
              <h2 id="manual-h" className="text-lg font-semibold">Pay by bank transfer or mobile banking</h2>
              {options.manual_instructions ? <p className="mt-2 text-sm leading-relaxed">{options.manual_instructions}</p> : null}
              {options.manual_methods.length ? (
                <ul className="mt-3 space-y-2">{options.manual_methods.map((m) => <li key={m.label} className="rounded-lg border border-border p-3 text-sm"><p className="font-medium text-ink">{m.label}</p><p className="whitespace-pre-wrap text-muted-foreground">{m.details}</p></li>)}</ul>
              ) : <p className="mt-2 text-sm text-warning">Payment account details have not been published yet. Please contact Soma support.</p>}
              <p className="mt-3 text-sm">Use <b>{o.reference}</b> as the payment remark if your bank allows it.</p>
              <div className="mt-4"><ManualPaymentForm orderId={o.id} amount={Number(o.amount)} userId={user.id} /></div>
            </section>
          ) : null}
          <form action={cancelOrderAction.bind(null, o.id)}><button type="submit" className="text-sm text-muted-foreground underline-offset-4 hover:underline">Cancel this order</button></form>
        </div>
      ) : o.status === "awaiting_verification" ? (
        <p className="mt-8 rounded-lg bg-muted p-4 text-sm">We received your payment details (reference {txs.find((t) => t.status === "submitted")?.payer_reference}). Soma will verify them, usually within one working day, and you will be notified.</p>
      ) : o.status === "paid" ? (
        <p className="mt-8 rounded-lg bg-primary-soft p-4 text-sm text-primary">Payment confirmed. Your access is active. <Link href="/dashboard" className="font-medium underline">Start preparing</Link></p>
      ) : (
        <p className="mt-8 text-sm"><Link href="/packages" className="font-medium text-primary underline">Choose a package again</Link></p>
      )}
    </div>
  );
}
