import "server-only";
import { createHmac, timingSafeEqual } from "node:crypto";
import { createAdminClient } from "@/lib/supabase/admin";
import type { PaymentProvider, ParseWebhookResult, VerifyResult } from "../types";

/**
 * Sandbox provider: a fake gateway that behaves like a real one so the
 * automated flow (redirect → webhook → server verification → activation,
 * failures, duplicate notifications, refunds) can be tested end to end.
 * Admin-only (payments.config.sandbox_enabled + payments.verify). Never
 * moves real money.
 */
function secret(): string {
  const base = process.env.PAYMENT_SANDBOX_SECRET || process.env.SUPABASE_SECRET_KEY || "";
  return createHmac("sha256", "soma-sandbox").update(base).digest("hex");
}

export function signSandbox(body: string): string {
  return createHmac("sha256", secret()).update(body).digest("hex");
}

export const sandboxProvider: PaymentProvider = {
  id: "sandbox",
  displayName: "Test gateway (sandbox)",
  isConfigured: () => Boolean(process.env.PAYMENT_SANDBOX_SECRET || process.env.SUPABASE_SECRET_KEY),

  async createPayment(input) {
    return { ok: true, redirectUrl: `/pay/sandbox/${input.transactionId}`, providerRef: `SBX-${input.transactionId.slice(0, 8).toUpperCase()}` };
  },

  async verifyPayment({ transactionId }): Promise<VerifyResult> {
    // The sandbox "bank" keeps its decision on the transaction record.
    const db = createAdminClient();
    const { data } = await db.from("payment_transactions").select("raw, amount, provider_ref").eq("id", transactionId).maybeSingle();
    const outcome = (data?.raw as { sandbox_outcome?: string } | null)?.sandbox_outcome;
    if (outcome === "succeeded") return { status: "succeeded", amount: Number(data?.amount), providerRef: data?.provider_ref ?? undefined };
    if (outcome === "failed") return { status: "failed", reason: "The test bank declined the payment." };
    return { status: "pending" };
  },

  async parseWebhook({ headers, rawBody }): Promise<ParseWebhookResult> {
    let body: { event_id?: string; type?: string; transaction_id?: string; provider_ref?: string; status?: string; amount?: number };
    try { body = JSON.parse(rawBody); } catch { return { ok: false, message: "Invalid JSON" }; }
    if (!body.event_id || !body.transaction_id) return { ok: false, message: "Missing fields" };
    const given = Buffer.from(headers.get("x-sandbox-signature") ?? "");
    const expected = Buffer.from(signSandbox(rawBody));
    const signatureValid = given.length === expected.length && timingSafeEqual(given, expected);
    const status = body.status === "succeeded" ? "succeeded" : body.status === "failed" ? "failed" : "pending";
    return { ok: true, signatureValid, event: { eventId: body.event_id, type: body.type ?? "payment", transactionId: body.transaction_id, providerRef: body.provider_ref, status, amount: body.amount, payload: body } };
  },

  async refund({ providerRef }) {
    return { ok: true, providerRef: `${providerRef}-RF` };
  },
};
