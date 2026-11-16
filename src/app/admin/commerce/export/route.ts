import { getCurrentUser, can } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

/** CSV exports for records and offline backups (staff with payments.verify; read as the user, RLS applies). */
const csv = (rows: Record<string, unknown>[]) => {
  if (!rows.length) return "";
  const cols = Object.keys(rows[0]);
  const cell = (v: unknown) => {
    const s = v === null || v === undefined ? "" : typeof v === "object" ? JSON.stringify(v) : String(v);
    const safe = /^[=+\-@\t\r]/.test(s) ? `'${s}` : s; // no spreadsheet formulas
    return /[",\n]/.test(safe) ? `"${safe.replace(/"/g, '""')}"` : safe;
  };
  return [cols.join(","), ...rows.map((r) => cols.map((c) => cell(r[c])).join(","))].join("\n");
};

export async function GET(request: Request) {
  const user = await getCurrentUser();
  if (!can(user, "payments.verify")) return new Response("Not allowed", { status: 403 });
  const type = new URL(request.url).searchParams.get("type");
  const db = await createClient();
  let rows: Record<string, unknown>[] = [];
  if (type === "orders") rows = (await db.from("orders").select("reference, status, kind, amount, subtotal, discount, provider, created_at, paid_at, user_id, package_id").order("created_at")).data ?? [];
  else if (type === "transactions") rows = (await db.from("payment_transactions").select("id, order_id, provider, provider_ref, payer_reference, amount, status, failure_reason, reviewed_by, reviewed_at, review_note, created_at")).data ?? [];
  else if (type === "subscriptions") rows = (await db.from("entitlements").select("id, user_id, package_id, status, source, starts_at, ends_at, status_reason, created_at")).data ?? [];
  else if (type === "students") rows = ((await db.rpc("admin_list_users", { _search: null, _limit: 10000, _offset: 0 })).data ?? []) as Record<string, unknown>[];
  else return new Response("Unknown export", { status: 400 });
  const day = new Date().toISOString().slice(0, 10);
  return new Response(csv(rows), {
    headers: { "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": `attachment; filename="soma-${type}-${day}.csv"`, "Cache-Control": "no-store" },
  });
}
