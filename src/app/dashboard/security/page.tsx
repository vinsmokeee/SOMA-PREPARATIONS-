import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Field, Input, Label } from "@/components/ui/input";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { changePasswordAction, signOutOtherDevicesAction, signOutSessionAction } from "./actions";

export const metadata: Metadata = { title: "Security" };

const EVENT_LABELS: Record<string, string> = {
  sign_in: "Signed in", new_device: "Signed in on a new device", sign_in_failed: "Wrong password", session_revoked: "Session ended",
  session_limit: "Oldest device signed out (device limit)", verification_required: "Verification requested", verified: "Device confirmed by e-mail", risk_elevated: "Unusual sign-in checked",
};

export default async function SecurityPage() {
  const user = await requireUser("/dashboard/security");
  const db = await createClient();
  const [{ data: sessions }, { data: devices }, { data: events }] = await Promise.all([
    db.from("user_sessions").select("id, created_at, last_seen_at, country, revoked_at, user_devices(label)").is("revoked_at", null).order("last_seen_at", { ascending: false }).limit(20),
    db.from("user_devices").select("id, label, first_seen, last_seen, last_country, trusted").order("last_seen", { ascending: false }).limit(20),
    db.from("login_events").select("id, kind, country, created_at").order("created_at", { ascending: false }).limit(20),
  ]);
  type S = { id: string; created_at: string; last_seen_at: string; country: string | null; user_devices: { label: string | null } | null };
  return (
    <>
      <PageTitle title="Security" description="Where your account is signed in, recent activity and your password." />
      <div className="space-y-8">
        <p className="rounded-lg bg-muted p-3 text-sm">One Soma subscription is for one student. You can stay signed in on up to two devices at a time; signing in on another device signs out the oldest one.</p>

        <section aria-labelledby="sess-h">
          <div className="flex flex-wrap items-center justify-between gap-3">
            <h2 id="sess-h" className="text-lg font-semibold">Signed-in sessions</h2>
            <ActionForm action={signOutOtherDevicesAction} submitLabel="Sign out all other devices" variant="secondary" className="space-y-0" confirm="Sign out every other device?" />
          </div>
          <ul className="mt-3 divide-y divide-border rounded-xl border border-border">
            {((sessions ?? []) as unknown as S[]).map((s) => (
              <li key={s.id} className="flex flex-wrap items-center gap-3 p-4 text-sm">
                <div className="flex-1">
                  <p className="font-medium text-ink">{s.user_devices?.label ?? "Device"} {s.id === user.sessionId ? <Badge tone="green">This device</Badge> : null}</p>
                  <p className="text-xs text-muted-foreground">Signed in {formatDate(s.created_at)} · last active {formatDate(s.last_seen_at)}{s.country ? ` · ${s.country}` : ""}</p>
                </div>
                {s.id !== user.sessionId ? (
                  <ActionForm action={signOutSessionAction} submitLabel="Sign out" variant="secondary" className="space-y-0"><input type="hidden" name="id" value={s.id} /></ActionForm>
                ) : null}
              </li>
            ))}
          </ul>
        </section>

        <section aria-labelledby="dev-h">
          <h2 id="dev-h" className="text-lg font-semibold">Recognised devices</h2>
          <ul className="mt-3 divide-y divide-border rounded-xl border border-border text-sm">
            {(devices ?? []).map((d) => (
              <li key={d.id} className="p-4">
                <p className="font-medium text-ink">{d.label ?? "Device"} {d.trusted ? <Badge tone="green">Confirmed</Badge> : null}</p>
                <p className="text-xs text-muted-foreground">First seen {formatDate(d.first_seen)} · last used {formatDate(d.last_seen)}{d.last_country ? ` · ${d.last_country}` : ""}</p>
              </li>
            ))}
          </ul>
        </section>

        <section aria-labelledby="act-h">
          <h2 id="act-h" className="text-lg font-semibold">Recent activity</h2>
          <ul className="mt-3 space-y-1 text-sm">
            {(events ?? []).map((e) => <li key={e.id} className="flex justify-between gap-3"><span>{EVENT_LABELS[e.kind] ?? e.kind}{e.country ? ` · ${e.country}` : ""}</span><span className="text-muted-foreground">{formatDate(e.created_at)}</span></li>)}
          </ul>
        </section>

        <section aria-labelledby="pw-h" className="max-w-md rounded-xl border border-border p-5">
          <h2 id="pw-h" className="text-lg font-semibold">Change password</h2>
          <ActionForm action={changePasswordAction} submitLabel="Change password" className="mt-3">
            <Field><Label htmlFor="pw">New password</Label><Input id="pw" name="password" type="password" autoComplete="new-password" minLength={8} className="h-10" /></Field>
            <Field><Label htmlFor="pw2">Repeat new password</Label><Input id="pw2" name="confirm" type="password" autoComplete="new-password" className="h-10" /></Field>
          </ActionForm>
        </section>
      </div>
    </>
  );
}
