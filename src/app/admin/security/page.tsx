import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Input, Select } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { flagAction, securityAction } from "../commerce/actions";

export const metadata: Metadata = { title: "Account security" };

type Flag = { id: string; user_id: string; kind: string; detail: Record<string, unknown>; status: string; created_at: string };

export default async function AdminSecurityPage({ searchParams }: PageProps<"/admin/security">) {
  await requirePermission("users.manage", "/admin/security");
  const sp = await searchParams;
  const q = typeof sp.q === "string" ? sp.q.trim() : "";
  const db = await createClient();
  const [{ data: flags }, { data: users }] = await Promise.all([
    db.from("security_flags").select("id, user_id, kind, detail, status, created_at").eq("status", "open").order("created_at", { ascending: false }).limit(50),
    db.rpc("admin_list_users", { _search: q || null, _limit: q ? 10 : 500, _offset: 0 }),
  ]);
  const people = (users ?? []) as { id: string; email: string; full_name: string }[];
  const who = (id: string) => people.find((p) => p.id === id);
  const target = q ? people[0] : undefined;
  const [{ data: sessions }, { data: devices }, { data: events }, { data: profile }] = target
    ? await Promise.all([
        db.from("user_sessions").select("id, created_at, last_seen_at, country, revoked_at, revoked_reason, verification_required, user_devices(label)").eq("user_id", target.id).order("last_seen_at", { ascending: false }).limit(20),
        db.from("user_devices").select("id, label, first_seen, last_seen, last_country, trusted").eq("user_id", target.id).order("last_seen", { ascending: false }),
        db.from("login_events").select("id, kind, country, detail, created_at").eq("user_id", target.id).order("created_at", { ascending: false }).limit(40),
        db.from("profiles").select("account_status, restricted_reason").eq("id", target.id).maybeSingle(),
      ])
    : [{ data: null }, { data: null }, { data: null }, { data: null }];

  return (
    <>
      <PageTitle title="Account security" description="Possible account sharing, sessions, devices and sign-in history. Restrictions are applied only after your review." />
      <section aria-labelledby="flags-h">
        <h2 id="flags-h" className="text-lg font-semibold">Flagged accounts</h2>
        {(flags ?? []).length === 0 ? <p className="mt-2 text-sm text-muted-foreground">No open flags.</p> : (
          <ul className="mt-3 space-y-3">
            {((flags ?? []) as Flag[]).map((f) => (
              <li key={f.id} className="rounded-xl border border-warning/50 p-4 text-sm">
                <p className="font-medium text-ink">{who(f.user_id)?.email ?? f.user_id} · {f.kind.replace(/_/g, " ")}</p>
                <p className="text-xs text-muted-foreground">{formatDate(f.created_at)} · {Object.entries(f.detail).map(([k, v]) => `${k.replace(/_/g, " ")}: ${v}`).join(" · ")}</p>
                <div className="mt-2 flex flex-wrap gap-2">
                  <a href={`/admin/security?q=${encodeURIComponent(who(f.user_id)?.email ?? "")}`} className="text-sm font-medium text-primary hover:underline">Review activity</a>
                  <ActionForm action={flagAction} submitLabel="Dismiss (normal use)" variant="secondary" className="space-y-0"><input type="hidden" name="id" value={f.id} /><input type="hidden" name="status" value="dismissed" /></ActionForm>
                  <ActionForm action={flagAction} submitLabel="Mark handled" variant="secondary" className="space-y-0"><input type="hidden" name="id" value={f.id} /><input type="hidden" name="status" value="actioned" /></ActionForm>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="mt-10" aria-labelledby="lookup-h">
        <h2 id="lookup-h" className="text-lg font-semibold">Look up a student</h2>
        <form className="mt-2 flex gap-2" role="search"><Input name="q" defaultValue={q} placeholder="E-mail or name" aria-label="E-mail or name" className="h-10 w-72" /><button type="submit" className="h-10 rounded-md border border-border-strong px-4 text-sm font-medium">Search</button></form>
        {q && !target ? <p className="mt-3 text-sm text-muted-foreground">No account found.</p> : null}
        {target ? (
          <div className="mt-4 space-y-6 text-sm">
            <p className="font-medium text-ink">{target.full_name || "—"} · {target.email} {profile?.account_status === "restricted" ? <Badge tone="danger">restricted: {profile.restricted_reason}</Badge> : <Badge tone="green">active</Badge>}</p>
            <ActionForm action={securityAction} submitLabel="Apply" className="grid max-w-2xl gap-2 sm:grid-cols-[220px_1fr_auto]" confirm="Apply this action to the account?">
              <input type="hidden" name="user" value={target.id} />
              <Select name="action" aria-label="Action" className="h-10">
                <option value="revoke_sessions">Sign out everywhere</option>
                <option value="require_verification">Require e-mail verification</option>
                <option value="restrict">Restrict account</option>
                <option value="restore">Restore account</option>
              </Select>
              <Input name="reason" placeholder="Reason (kept in the log; shown to the student when restricting)" aria-label="Reason" className="h-10" />
            </ActionForm>
            <div>
              <h3 className="font-semibold text-ink">Sessions</h3>
              <ul className="mt-1 space-y-1">{(sessions ?? []).map((s) => <li key={s.id}>{(s.user_devices as unknown as { label: string } | null)?.label ?? "Device"} · since {formatDate(s.created_at)} · last {formatDate(s.last_seen_at)}{s.country ? ` · ${s.country}` : ""}{s.revoked_at ? ` · ended (${s.revoked_reason})` : " · active"}{s.verification_required ? " · awaiting verification" : ""}</li>)}</ul>
            </div>
            <div>
              <h3 className="font-semibold text-ink">Devices</h3>
              <ul className="mt-1 space-y-1">{(devices ?? []).map((d) => <li key={d.id}>{d.label} · first {formatDate(d.first_seen)} · last {formatDate(d.last_seen)}{d.last_country ? ` · ${d.last_country}` : ""}{d.trusted ? " · confirmed" : ""}</li>)}</ul>
            </div>
            <div>
              <h3 className="font-semibold text-ink">Sign-in history</h3>
              <ul className="mt-1 space-y-1">{(events ?? []).map((e) => <li key={e.id}>{formatDate(e.created_at)} · {e.kind.replace(/_/g, " ")}{e.country ? ` · ${e.country}` : ""}</li>)}</ul>
            </div>
          </div>
        ) : null}
      </section>
    </>
  );
}
