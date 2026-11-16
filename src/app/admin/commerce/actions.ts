"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import type { Permission } from "@/lib/auth/permissions";
import { getProvider } from "@/lib/payments/registry";
import { createAdminClient } from "@/lib/supabase/admin";
import { createClient } from "@/lib/supabase/server";

async function guard(...perms: Permission[]): Promise<ActionState | null> {
  try { for (const p of perms) await assertPermission(p); return null; }
  catch (e) { return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." }; }
}
const ok = (message: string): ActionState => { revalidatePath("/admin/commerce"); return { status: "success", message }; };
const fail = (e: { message: string } | null, fallback: string): ActionState => {
  const map: Record<string, string> = {
    ALREADY_REVIEWED: "This payment was already reviewed.", NOTE_REQUIRED: "Add a short reason.", INVALID_AMOUNT: "Check the refund amount.",
    ORDER_NOT_REFUNDABLE: "Only paid orders can be refunded.", INVALID_INPUT: "Check the values.", INVALID_DAYS: "Days must be between 1 and 1000.",
  };
  return { status: "error", message: Object.entries(map).find(([k]) => e?.message.includes(k))?.[1] ?? fallback };
};

/** Looks a user up by e-mail through the staff-only admin_list_users function (runs as the admin). */
async function findUserByEmail(db: Awaited<ReturnType<typeof createClient>>, email: string): Promise<{ id: string } | null> {
  const { data } = await db.rpc("admin_list_users", { _search: email, _limit: 20, _offset: 0 });
  return ((data ?? []) as { id: string; email: string }[]).find((u) => u.email?.toLowerCase() === email.toLowerCase()) ?? null;
}

export async function reviewPaymentAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("payments.verify"); if (d) return d;
  const p = z.object({ id: z.uuid(), decision: z.enum(["approve", "reject"]), note: z.string().trim().max(1000).optional() }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("review_manual_payment", { _tx_id: p.data.id, _approve: p.data.decision === "approve", _note: p.data.note ?? null });
  if (error) return fail(error, "Could not save the decision.");
  return ok(p.data.decision === "approve" ? "Approved — access is active and the student was notified." : "Rejected — the student was notified.");
}

export async function refundAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("payments.verify", "orders.manage"); if (d) return d;
  const p = z.object({ order: z.uuid(), amount: z.coerce.number().positive(), reason: z.string().trim().min(3).max(1000) }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: "Enter an amount and a reason." };
  const db = await createClient();
  const { data: refundId, error } = await db.rpc("request_refund", { _order_id: p.data.order, _amount: p.data.amount, _reason: p.data.reason });
  if (error || !refundId) return fail(error, "Could not record the refund.");
  // Gateway payments: ask the provider to refund, then complete the record.
  const admin = createAdminClient();
  const { data: r } = await admin.from("refunds").select("id, status, amount, payment_transactions(provider, provider_ref)").eq("id", refundId as string).single();
  const t = r?.payment_transactions as unknown as { provider: string; provider_ref: string | null } | null;
  if (r?.status === "processing" && t) {
    const provider = getProvider(t.provider);
    const res = provider?.refund && t.provider_ref ? await provider.refund({ providerRef: t.provider_ref, amount: Number(r.amount), reason: p.data.reason }) : { ok: false as const, message: "Provider does not support refunds" };
    await db.rpc("complete_refund", { _refund_id: r.id, _success: res.ok, _provider_ref: res.ok ? res.providerRef ?? null : null });
    if (!res.ok) return { status: "error", message: `The provider could not refund: ${res.message}. Refund it in the bank portal and record it again.` };
  }
  return ok("Refund recorded and the student was notified.");
}

export async function grantAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("payments.verify"); if (d) return d;
  const p = z.object({ email: z.email(), package: z.uuid(), days: z.coerce.number().int().min(1).max(1000), source: z.enum(["complimentary", "promotional", "manual"]), note: z.string().trim().min(3).max(500) }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: p.error.issues[0]?.message ?? "Check the fields." };
  const db = await createClient();
  const u = await findUserByEmail(db, p.data.email);
  if (!u) return { status: "error", message: "No account with that e-mail." };
  const { error } = await db.rpc("admin_grant_subscription", { _user: u.id, _package_id: p.data.package, _days: p.data.days, _source: p.data.source, _note: p.data.note });
  if (error) return fail(error, "Could not grant access.");
  return ok(`Access granted to ${p.data.email}.`);
}

export async function subscriptionAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("payments.verify"); if (d) return d;
  const p = z.object({ id: z.uuid(), op: z.enum(["extend", "suspended", "active", "revoked"]), days: z.coerce.number().int().optional(), note: z.string().trim().min(3, "Add a short reason.").max(500) }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: p.error.issues[0]?.message ?? "Check the fields." };
  const db = await createClient();
  const { error } = p.data.op === "extend"
    ? await db.rpc("admin_extend_subscription", { _ent: p.data.id, _days: p.data.days ?? 0, _note: p.data.note })
    : await db.rpc("admin_set_subscription_status", { _ent: p.data.id, _status: p.data.op, _reason: p.data.note });
  if (error) return fail(error, "Could not update the subscription.");
  return ok("Subscription updated and the student notified.");
}

const couponSchema = z.object({
  code: z.string().trim().toUpperCase().regex(/^[A-Z0-9_-]{3,40}$/, "Code: 3–40 letters, numbers, - or _."),
  description: z.string().trim().max(300).optional(),
  kind: z.enum(["percent", "fixed"]),
  value: z.coerce.number().positive(),
  max_redemptions: z.union([z.literal(""), z.coerce.number().int().positive()]),
  per_user_limit: z.coerce.number().int().min(1).max(100).default(1),
  starts_at: z.string().optional(), ends_at: z.string().optional(),
  package_id: z.union([z.literal(""), z.uuid()]),
  user_email: z.union([z.literal(""), z.email()]),
});

export async function createCouponAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("packages.manage"); if (d) return d;
  const p = couponSchema.safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: p.error.issues[0]?.message ?? "Check the fields." };
  if (p.data.kind === "percent" && p.data.value > 100) return { status: "error", message: "A percentage cannot exceed 100." };
  let userId: string | null = null;
  const db = await createClient();
  if (p.data.user_email) {
    userId = (await findUserByEmail(db, p.data.user_email))?.id ?? null;
    if (!userId) return { status: "error", message: "No account with that e-mail." };
  }
  const { data: { user } } = await db.auth.getUser();
  const { error } = await db.from("coupons").insert({
    code: p.data.code, description: p.data.description || null, kind: p.data.kind, value: p.data.value,
    max_redemptions: p.data.max_redemptions === "" ? null : p.data.max_redemptions, per_user_limit: p.data.per_user_limit,
    starts_at: p.data.starts_at ? new Date(`${p.data.starts_at}T00:00:00+06:00`).toISOString() : null,
    ends_at: p.data.ends_at ? new Date(`${p.data.ends_at}T23:59:59+06:00`).toISOString() : null,
    package_ids: p.data.package_id ? [p.data.package_id] : null, user_id: userId, created_by: user?.id,
  });
  if (error) return { status: "error", message: error.code === "23505" ? "That code already exists." : "Could not create the code." };
  return ok(`Code ${p.data.code} created.`);
}

export async function toggleCouponAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("packages.manage"); if (d) return d;
  const p = z.object({ id: z.uuid(), op: z.enum(["enable", "disable", "delete"]) }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  if (p.data.op === "delete") {
    const { count } = await db.from("coupon_redemptions").select("id", { count: "exact", head: true }).eq("coupon_id", p.data.id);
    if (count) return { status: "error", message: "This code has been used, so it is kept for the records. Disable it instead." };
    await db.from("coupons").delete().eq("id", p.data.id);
    return ok("Code removed.");
  }
  await db.from("coupons").update({ is_active: p.data.op === "enable" }).eq("id", p.data.id);
  return ok(p.data.op === "enable" ? "Code enabled." : "Code disabled.");
}

const settingsSchema = z.object({
  manual_enabled: z.preprocess((v) => v === "on", z.boolean()),
  sandbox_enabled: z.preprocess((v) => v === "on", z.boolean()),
  gateway_provider: z.union([z.literal(""), z.string().regex(/^[a-z0-9_]{2,40}$/)]),
  order_expiry_hours: z.coerce.number().int().min(1).max(720),
  manual_instructions: z.string().trim().max(2000),
  manual_methods: z.string().max(4000),
  expiry_reminder_days: z.string().regex(/^\s*\d{1,3}(\s*,\s*\d{1,3})*\s*$/, "Reminder days: numbers separated by commas."),
  max_concurrent_sessions: z.coerce.number().int().min(1).max(10),
});

export async function savePaymentSettingsAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("settings.manage"); if (d) return d;
  const p = settingsSchema.safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: p.error.issues[0]?.message ?? "Check the values." };
  if (p.data.gateway_provider && !getProvider(p.data.gateway_provider)) return { status: "error", message: "That gateway is not installed yet." };
  // "Label | details" per block, blocks separated by a blank line.
  const methods = p.data.manual_methods.split(/\n\s*\n/).map((b) => b.trim()).filter(Boolean).map((b) => {
    const [label, ...rest] = b.split("\n");
    return { label: label.trim().slice(0, 80), details: rest.join("\n").trim().slice(0, 600) };
  }).slice(0, 10);
  const db = await createClient();
  const [{ data: pay }, { data: sec }] = await Promise.all([
    db.from("app_settings").select("value").eq("key", "payments.config").maybeSingle(),
    db.from("app_settings").select("value").eq("key", "security.config").maybeSingle(),
  ]);
  const previous = ((pay?.value as { manual_methods?: { label: string; image_url?: string }[] } | null)?.manual_methods ?? []);
  const withImages = methods.map((m) => ({ ...m, image_url: previous.find((x) => x.label === m.label)?.image_url ?? undefined }));
  const e1 = await db.from("app_settings").upsert({ key: "payments.config", is_public: false, value: {
    ...((pay?.value as object) ?? {}), manual_enabled: p.data.manual_enabled, sandbox_enabled: p.data.sandbox_enabled,
    gateway_provider: p.data.gateway_provider || null, order_expiry_hours: p.data.order_expiry_hours,
    manual_instructions: p.data.manual_instructions, manual_methods: withImages,
    expiry_reminder_days: p.data.expiry_reminder_days.split(",").map((x) => Number(x.trim())).filter((n) => n > 0),
  } });
  const e2 = await db.from("app_settings").upsert({ key: "security.config", is_public: false, value: { ...((sec?.value as object) ?? {}), max_concurrent_sessions: p.data.max_concurrent_sessions } });
  if (e1.error || e2.error) return { status: "error", message: "Could not save settings." };
  return ok("Settings saved.");
}

export async function securityAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("users.manage"); if (d) return d;
  const p = z.object({ user: z.uuid(), action: z.enum(["revoke_sessions", "require_verification", "restrict", "restore"]), reason: z.string().trim().min(3, "Add a short reason.").max(500) }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: p.error.issues[0]?.message ?? "Invalid request." };
  const db = await createClient();
  const { error } = await db.rpc("admin_security_action", { _user: p.data.user, _action: p.data.action, _reason: p.data.reason });
  if (error) return { status: "error", message: "Could not apply the action." };
  revalidatePath("/admin/security");
  return { status: "success", message: "Done." };
}

export async function flagAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("users.manage"); if (d) return d;
  const p = z.object({ id: z.uuid(), status: z.enum(["dismissed", "actioned"]), note: z.string().trim().max(500).optional() }).safeParse(Object.fromEntries(formData));
  if (!p.success) return { status: "error", message: "Invalid request." };
  const db = await createClient();
  const { data: { user } } = await db.auth.getUser();
  await db.from("security_flags").update({ status: p.data.status, note: p.data.note || null, reviewed_by: user?.id, reviewed_at: new Date().toISOString() }).eq("id", p.data.id);
  revalidatePath("/admin/security");
  return { status: "success", message: "Updated." };
}

/** Adds a payment method with a QR code image (shown to students on the payment page). */
export async function addQrMethodAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("settings.manage"); if (d) return d;
  const label = String(formData.get("label") ?? "").trim().slice(0, 80);
  const details = String(formData.get("details") ?? "").trim().slice(0, 600);
  const file = formData.get("qr");
  if (!label) return { status: "error", message: "Give the method a name, e.g. “T Bank QR”." };
  if (!(file instanceof File) || file.size === 0) return { status: "error", message: "Choose the QR code image." };
  if (file.size > 2 * 1024 * 1024) return { status: "error", message: "The image must be under 2 MB." };
  const ext = file.type === "image/png" ? "png" : file.type === "image/webp" ? "webp" : file.type === "image/jpeg" ? "jpg" : null;
  if (!ext) return { status: "error", message: "Use a PNG or JPG image." };
  const db = await createClient();
  const path = `payment-qr/${crypto.randomUUID()}.${ext}`;
  const { error: upErr } = await db.storage.from("site-assets").upload(path, file, { contentType: file.type, upsert: false });
  if (upErr) return { status: "error", message: "The image could not be uploaded." };
  const imageUrl = db.storage.from("site-assets").getPublicUrl(path).data.publicUrl;
  const { data: pay } = await db.from("app_settings").select("value").eq("key", "payments.config").maybeSingle();
  const value = (pay?.value ?? {}) as { manual_methods?: { label: string; details: string; image_url?: string }[] };
  const methods = [...(value.manual_methods ?? []).filter((m) => m.label !== label), { label, details, image_url: imageUrl }].slice(0, 10);
  const { error } = await db.from("app_settings").upsert({ key: "payments.config", is_public: false, value: { ...value, manual_methods: methods } });
  if (error) return { status: "error", message: "Could not save the method." };
  return ok(`“${label}” added with its QR code.`);
}

export async function removeMethodAction(_prev: ActionState, formData: FormData): Promise<ActionState> {
  const d = await guard("settings.manage"); if (d) return d;
  const label = String(formData.get("label") ?? "");
  const db = await createClient();
  const { data: pay } = await db.from("app_settings").select("value").eq("key", "payments.config").maybeSingle();
  const value = (pay?.value ?? {}) as { manual_methods?: { label: string; image_url?: string }[] };
  const removed = (value.manual_methods ?? []).find((m) => m.label === label);
  const { error } = await db.from("app_settings").upsert({ key: "payments.config", is_public: false, value: { ...value, manual_methods: (value.manual_methods ?? []).filter((m) => m.label !== label) } });
  if (error) return { status: "error", message: "Could not remove the method." };
  const path = removed?.image_url?.split("/site-assets/")[1];
  if (path) await db.storage.from("site-assets").remove([path]);
  return ok("Method removed.");
}
