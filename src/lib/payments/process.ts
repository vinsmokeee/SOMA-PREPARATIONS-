import "server-only";
import { createAdminClient } from "@/lib/supabase/admin";
import { getProvider } from "./registry";

/**
 * Server-side payment processing shared by webhooks, the return page and
 * reconciliation. Every path ends in verifyPayment() at the provider followed
 * by the idempotent database functions confirm_payment() / fail_payment().
 */

export type Outcome = { status: "activated" | "pending" | "failed" | "duplicate" | "ignored" | "error"; message?: string };

/** Asks the provider for the truth about a transaction and records the result. */
export async function settleTransaction(transactionId: string): Promise<Outcome> {
  const db = createAdminClient();
  const { data: tx } = await db.from("payment_transactions").select("id, provider, provider_ref, status").eq("id", transactionId).maybeSingle();
  if (!tx) return { status: "error", message: "Unknown transaction" };
  if (tx.status === "succeeded") return { status: "activated" };
  if (["failed", "cancelled", "refunded", "rejected"].includes(tx.status)) return { status: "ignored" };
  const provider = getProvider(tx.provider);
  if (!provider || !provider.isConfigured()) return { status: "error", message: "Provider not available" };
  const v = await provider.verifyPayment({ transactionId: tx.id, providerRef: tx.provider_ref });
  if (v.status === "succeeded") {
    const { error } = await db.rpc("confirm_payment", { _tx_id: tx.id, _provider_ref: v.providerRef ?? tx.provider_ref, _amount: v.amount ?? null });
    if (error) return { status: "error", message: error.message.includes("AMOUNT_MISMATCH") ? "Amount paid is less than the order total" : "Could not confirm" };
    return { status: "activated" };
  }
  if (v.status === "failed") {
    await db.rpc("fail_payment", { _tx_id: tx.id, _reason: v.reason ?? "The payment was declined." });
    return { status: "failed", message: v.reason };
  }
  return { status: "pending" };
}

/** Handles a provider webhook: authenticate, record once, then verify with the provider. */
export async function handleWebhook(providerId: string, headers: Headers, rawBody: string): Promise<{ httpStatus: number; outcome: Outcome }> {
  const provider = getProvider(providerId);
  if (!provider || !provider.isConfigured()) return { httpStatus: 404, outcome: { status: "error", message: "Unknown provider" } };
  const parsed = await provider.parseWebhook({ headers, rawBody });
  if (!parsed.ok) return { httpStatus: 400, outcome: { status: "error", message: parsed.message } };
  const db = createAdminClient();
  const ev = parsed.event;
  const { data: isNew } = await db.rpc("record_payment_event", {
    _provider: providerId, _event_id: ev.eventId, _type: ev.type, _payload: ev.payload as object,
    _signature_ok: parsed.signatureValid, _tx_id: ev.transactionId && /^[0-9a-f-]{36}$/i.test(ev.transactionId) ? ev.transactionId : null,
  });
  if (!parsed.signatureValid) return { httpStatus: 401, outcome: { status: "error", message: "Invalid signature" } };
  if (isNew === false) return { httpStatus: 200, outcome: { status: "duplicate" } };
  if (!ev.transactionId) return { httpStatus: 200, outcome: { status: "ignored" } };
  // Never act on the notification alone: ask the provider.
  const outcome = await settleTransaction(ev.transactionId);
  return { httpStatus: 200, outcome };
}

/** Re-checks gateway payments still pending after a few minutes (missed webhooks). */
export async function reconcilePending(): Promise<{ checked: number; activated: number; failed: number }> {
  const db = createAdminClient();
  const { data } = await db.from("payment_transactions").select("id").in("status", ["initiated", "pending"]).neq("provider", "manual")
    .lt("created_at", new Date(Date.now() - 10 * 60 * 1000).toISOString()).gt("created_at", new Date(Date.now() - 3 * 86400000).toISOString()).limit(50);
  let activated = 0, failed = 0;
  for (const t of data ?? []) {
    const o = await settleTransaction(t.id);
    if (o.status === "activated") activated++;
    if (o.status === "failed") failed++;
  }
  return { checked: data?.length ?? 0, activated, failed };
}
