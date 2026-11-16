import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { requirePermission } from "@/lib/auth/dal";
import { createAdminClient } from "@/lib/supabase/admin";
import { formatNu } from "@/lib/utils";
import { sandboxDecideAction } from "./actions";

export const metadata: Metadata = { title: "Test bank", robots: { index: false } };

/** The sandbox provider's "bank page". Admins only; no real money moves. */
export default async function SandboxBankPage({ params }: PageProps<"/pay/sandbox/[tx]">) {
  const { tx } = await params;
  await requirePermission("payments.verify", `/pay/sandbox/${tx}`);
  if (!/^[0-9a-f-]{36}$/i.test(tx)) notFound();
  const { data: t } = await createAdminClient().from("payment_transactions").select("id, amount, provider, status, orders(reference)").eq("id", tx).maybeSingle();
  if (!t || t.provider !== "sandbox") notFound();
  const ref = (t.orders as unknown as { reference: string } | null)?.reference;
  const btn = (outcome: string, duplicate: string, label: string, cls: string) => (
    <form action={sandboxDecideAction}>
      <input type="hidden" name="tx" value={t.id} />
      <input type="hidden" name="outcome" value={outcome} />
      <input type="hidden" name="duplicate" value={duplicate} />
      <button type="submit" className={`h-11 w-full rounded-md px-4 text-sm font-semibold ${cls}`}>{label}</button>
    </form>
  );
  return (
    <main id="main" className="mx-auto max-w-md p-6">
      <p className="rounded-md bg-warning-soft p-2 text-center text-xs font-semibold uppercase tracking-wide text-warning">Test gateway — no real money</p>
      <h1 className="mt-4 font-serif text-2xl font-semibold">Test Bank of Soma</h1>
      <p className="mt-2 text-sm">Pay <b>{formatNu(t.amount)}</b> for order {ref}. Status: {t.status}.</p>
      <div className="mt-6 space-y-3">
        {btn("succeeded", "0", "Approve payment", "bg-primary text-primary-foreground")}
        {btn("succeeded", "1", "Approve and send the notification twice (duplicate test)", "border border-border-strong")}
        {btn("failed", "0", "Decline payment", "bg-danger text-white")}
      </div>
    </main>
  );
}
