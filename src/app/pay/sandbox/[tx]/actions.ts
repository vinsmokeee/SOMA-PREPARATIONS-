"use server";

import { redirect } from "next/navigation";
import { z } from "zod";
import { assertPermission } from "@/lib/auth/dal";
import { handleWebhook } from "@/lib/payments/process";
import { signSandbox } from "@/lib/payments/providers/sandbox";
import { createAdminClient } from "@/lib/supabase/admin";

/** Test bank decision → signed notification → normal webhook processing (optionally delivered twice). */
export async function sandboxDecideAction(formData: FormData): Promise<void> {
  await assertPermission("payments.verify");
  const p = z.object({ tx: z.uuid(), outcome: z.enum(["succeeded", "failed"]), duplicate: z.enum(["0", "1"]).default("0") }).parse(Object.fromEntries(formData));
  const db = createAdminClient();
  const { data: tx } = await db.from("payment_transactions").select("id, amount, provider, provider_ref, raw").eq("id", p.tx).single();
  if (!tx || tx.provider !== "sandbox") throw new Error("Not a sandbox transaction");
  await db.from("payment_transactions").update({ raw: { ...((tx.raw as object) ?? {}), sandbox_outcome: p.outcome } }).eq("id", tx.id);
  const body = JSON.stringify({ event_id: `sbx-${tx.id}-${p.outcome}`, type: `payment.${p.outcome}`, transaction_id: tx.id, provider_ref: tx.provider_ref, status: p.outcome, amount: Number(tx.amount) });
  const headers = new Headers({ "x-sandbox-signature": signSandbox(body) });
  await handleWebhook("sandbox", headers, body);
  if (p.duplicate === "1") await handleWebhook("sandbox", headers, body);
  redirect(`/pay/return?tx=${tx.id}`);
}
