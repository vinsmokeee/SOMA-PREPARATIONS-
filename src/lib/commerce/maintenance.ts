import "server-only";
import { siteConfig } from "@/config/site";
import { getEmailProvider, renderNotificationEmail } from "@/lib/notify/email";
import { reconcilePending } from "@/lib/payments/process";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Commerce housekeeping, run by the 3-hourly scheduler: expire unpaid orders,
 * expiry reminders and records, re-check pending gateway payments, and send
 * queued notification e-mails when an e-mail provider is configured.
 */
export async function runCommerceMaintenance() {
  const db = createAdminClient();
  const { data: maint, error } = await db.rpc("run_commerce_maintenance");
  const reconcile = await reconcilePending().catch(() => ({ checked: 0, activated: 0, failed: 0 }));
  const emails = await sendQueuedEmails().catch(() => ({ sent: 0, failed: 0, skipped: true }));
  return { maintenance: error ? { error: error.message } : maint, reconcile, emails };
}

export async function sendQueuedEmails(limit = 50) {
  const provider = getEmailProvider();
  if (!provider) return { sent: 0, failed: 0, skipped: true };
  const db = createAdminClient();
  const { data } = await db.from("notifications").select("id, user_id, title, body, link").eq("email_status", "queued")
    .gt("created_at", new Date(Date.now() - 3 * 86400000).toISOString()).order("created_at").limit(limit);
  let sent = 0, failed = 0;
  for (const n of data ?? []) {
    const { data: u } = await db.auth.admin.getUserById(n.user_id);
    const to = u?.user?.email;
    if (!to) { await db.from("notifications").update({ email_status: "failed" }).eq("id", n.id); failed++; continue; }
    const r = await provider.send({ to, ...renderNotificationEmail(n, siteConfig.url) });
    await db.from("notifications").update({ email_status: r.ok ? "sent" : "failed" }).eq("id", n.id);
    if (r.ok) sent++; else failed++;
  }
  return { sent, failed, skipped: false };
}
