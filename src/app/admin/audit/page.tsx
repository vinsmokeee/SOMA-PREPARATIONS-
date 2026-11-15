import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { Table, TBody, TD, TH, THead, TR } from "@/components/ui/table";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Audit log" };

type Log = { id: number; actor_id: string | null; action: string; entity_type: string; entity_id: string | null; before_data: Record<string, unknown> | null; after_data: Record<string, unknown> | null; created_at: string };

const IGNORED = new Set(["updated_at", "search"]);

function changedFields(l: Log): string[] {
  if (!l.before_data || !l.after_data) return [];
  return Object.keys(l.after_data).filter((k) => !IGNORED.has(k) && JSON.stringify(l.before_data?.[k]) !== JSON.stringify(l.after_data?.[k]));
}

export default async function AuditPage() {
  await requirePermission("audit.read", "/admin/audit");
  const db = await createClient();
  const [{ data }, { data: users }] = await Promise.all([
    db.from("audit_logs").select("*").order("created_at", { ascending: false }).limit(200),
    db.rpc("admin_list_users", { _search: null, _limit: 200, _offset: 0 }),
  ]);
  const emails = new Map(((users ?? []) as { id: string; email: string }[]).map((u) => [u.id, u.email]));
  const logs = (data ?? []) as Log[];
  return (
    <>
      <PageTitle title="Audit log" description="The 200 most recent recorded changes to roles, examination structure, content, packages, orders and payments. Entries cannot be edited or deleted." />
      <Table>
        <THead>
          <TR><TH>When</TH><TH>Who</TH><TH>Action</TH><TH>Record</TH><TH>Changed fields</TH></TR>
        </THead>
        <TBody>
          {logs.length === 0 ? <TR><TD colSpan={5} className="text-muted-foreground">No entries.</TD></TR> : null}
          {logs.map((l) => (
            <TR key={l.id}>
              <TD className="whitespace-nowrap tabular-nums text-muted-foreground">{new Date(l.created_at).toLocaleString("en-GB", { timeZone: "Asia/Thimphu" })}</TD>
              <TD className="whitespace-nowrap">{l.actor_id ? (emails.get(l.actor_id) ?? l.actor_id.slice(0, 8)) : <span className="text-muted-foreground">system</span>}</TD>
              <TD><Badge tone={l.action === "DELETE" ? "danger" : l.action === "INSERT" ? "green" : "neutral"}>{l.action}</Badge></TD>
              <TD className="whitespace-nowrap"><span className="text-ink">{l.entity_type}</span> <code className="text-xs text-muted-foreground">{l.entity_id?.slice(0, 8)}</code></TD>
              <TD className="text-xs text-muted-foreground">{changedFields(l).join(", ") || "—"}</TD>
            </TR>
          ))}
        </TBody>
      </Table>
    </>
  );
}
