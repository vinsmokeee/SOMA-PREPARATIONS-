"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getCurrentUser } from "@/lib/auth/dal";
import { getProvider } from "@/lib/payments/registry";
import { siteConfig } from "@/config/site";
import { createAdminClient } from "@/lib/supabase/admin";
import { createClient } from "@/lib/supabase/server";

const MESSAGES: Record<string, string> = {
  PACKAGE_NOT_AVAILABLE: "This package is not available to buy right now.",
  ALREADY_ACTIVE: "You already have this package and it cannot be renewed early.",
  AWAITING_VERIFICATION: "Your earlier payment for this package is still being verified.",
  ACCOUNT_RESTRICTED: "Your account is restricted. Please contact support.",
  MANUAL_DISABLED: "Manual payments are not being accepted at the moment.",
  ORDER_NOT_PAYABLE: "This order can no longer be paid. Start a new one.",
  ORDER_EXPIRED: "This order has expired. Start a new one.",
  REFERENCE_REQUIRED: "Enter the transaction (journal) number from your payment.",
  INVALID_PROOF: "The screenshot could not be attached. Upload it again.",
  PROVIDER_NOT_ENABLED: "That payment method is not available.",
  ORDER_NOT_CANCELLABLE: "This order cannot be cancelled.",
};
const msg = (e: { message: string } | null | undefined, fallback: string) => {
  if (e?.message.includes("COUPON_INVALID")) return e.message.replace(/^.*COUPON_INVALID:\s*/, "") || "This code is not valid.";
  return Object.entries(MESSAGES).find(([k]) => e?.message.includes(k))?.[1] ?? fallback;
};

export type QuoteState = { status: "idle" | "ok" | "error"; subtotal?: number; discount?: number; total?: number; message?: string; code?: string };

export async function quoteAction(_prev: QuoteState, formData: FormData): Promise<QuoteState> {
  const parsed = z.object({ packageId: z.uuid(), code: z.string().trim().max(40) }).safeParse({ packageId: formData.get("packageId"), code: formData.get("code") ?? "" });
  if (!parsed.success) return { status: "error", message: "Invalid request." };
  if (!(await getCurrentUser())) return { status: "error", message: "Please sign in again." };
  const db = await createClient();
  const { data, error } = await db.rpc("quote_order", { _package_id: parsed.data.packageId, _code: parsed.data.code || null });
  if (error || !data) return { status: "error", message: msg(error, "Could not check the price.") };
  const q = data as { subtotal: number; discount: number; total: number; coupon_ok: boolean; message: string | null };
  if (parsed.data.code && !q.coupon_ok) return { status: "error", message: q.message ?? "This code is not valid.", subtotal: q.subtotal, discount: 0, total: q.subtotal };
  return { status: "ok", subtotal: q.subtotal, discount: q.discount, total: q.total, code: parsed.data.code, message: q.discount ? `Code applied: Nu. ${q.discount} off.` : undefined };
}

export async function createOrderAction(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const parsed = z.object({ packageId: z.uuid(), code: z.string().trim().max(40) }).safeParse({ packageId: formData.get("packageId"), code: formData.get("code") ?? "" });
  if (!parsed.success) return { error: "Invalid request." };
  if (!(await getCurrentUser())) return { error: "Please sign in again." };
  const db = await createClient();
  const { data, error } = await db.rpc("create_order", { _package_id: parsed.data.packageId, _code: parsed.data.code || null });
  if (error || !data) return { error: msg(error, "The order could not be created.") };
  revalidatePath("/dashboard/subscription");
  redirect(`/dashboard/subscription/order/${data as string}`);
}

const manualSchema = z.object({
  orderId: z.uuid(),
  reference: z.string().trim().min(4, "Enter the transaction (journal) number.").max(120),
  amount: z.coerce.number().positive().max(1000000),
  proofPath: z.union([z.literal(""), z.string().max(200)]),
});

export async function submitManualPaymentAction(_prev: { status: string; message?: string }, formData: FormData) {
  const parsed = manualSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { status: "error", message: parsed.error.issues[0]?.message ?? "Check the details." };
  if (!(await getCurrentUser())) return { status: "error", message: "Please sign in again." };
  const db = await createClient();
  const { error } = await db.rpc("submit_manual_payment", { _order_id: parsed.data.orderId, _payer_reference: parsed.data.reference, _proof_path: parsed.data.proofPath || null, _amount: parsed.data.amount });
  if (error) return { status: "error", message: msg(error, "The payment details could not be submitted.") };
  revalidatePath(`/dashboard/subscription/order/${parsed.data.orderId}`);
  revalidatePath("/dashboard/subscription");
  return { status: "success", message: "Submitted. Soma will verify your payment, usually within one working day." };
}

/** Starts a gateway payment (bank adapter or the admin-only sandbox) and redirects to the provider. */
export async function startGatewayPaymentAction(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const parsed = z.object({ orderId: z.uuid(), provider: z.string().regex(/^[a-z0-9_]{2,40}$/) }).safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: "Invalid request." };
  const user = await getCurrentUser();
  if (!user) return { error: "Please sign in again." };
  const provider = getProvider(parsed.data.provider);
  if (!provider || !provider.isConfigured()) return { error: MESSAGES.PROVIDER_NOT_ENABLED };
  const db = await createClient();
  const { data, error } = await db.rpc("start_gateway_payment", { _order_id: parsed.data.orderId, _provider: provider.id });
  if (error || !data) return { error: msg(error, "The payment could not be started.") };
  const t = data as { transaction_id: string; amount: number; currency: string; reference: string };
  const r = await provider.createPayment({
    transactionId: t.transaction_id, orderReference: t.reference, amount: Number(t.amount), currency: t.currency,
    description: `Soma Preparations ${t.reference}`,
    returnUrl: `${siteConfig.url}/pay/return?tx=${t.transaction_id}`, webhookUrl: `${siteConfig.url}/api/payments/webhook/${provider.id}`,
    customer: { name: user.fullName, email: user.email },
  });
  const admin = createAdminClient();
  if (!r.ok) {
    await admin.rpc("fail_payment", { _tx_id: t.transaction_id, _reason: r.message });
    return { error: "The payment provider could not start the payment. Please try again later." };
  }
  await admin.from("payment_transactions").update({ status: "pending", provider_ref: r.providerRef ?? null }).eq("id", t.transaction_id);
  redirect(r.redirectUrl);
}

export async function cancelOrderAction(orderId: string): Promise<void> {
  if (!z.uuid().safeParse(orderId).success) return;
  const db = await createClient();
  await db.rpc("cancel_my_order", { _order_id: orderId });
  revalidatePath("/dashboard/subscription");
  redirect("/dashboard/subscription");
}

export async function markNotificationsReadAction(): Promise<void> {
  const user = await getCurrentUser();
  if (!user) return;
  const db = await createClient();
  await db.from("notifications").update({ read_at: new Date().toISOString() }).is("read_at", null);
  revalidatePath("/dashboard", "layout");
}
