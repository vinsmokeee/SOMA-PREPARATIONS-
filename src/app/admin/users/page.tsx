import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { SelectField } from "@/components/app/fields";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { can, requirePermission } from "@/lib/auth/dal";
import { GRANTABLE_ROLES, isAppRole, ROLE_LABELS, type AppRole } from "@/lib/auth/permissions";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { grantRole, revokeRole } from "../actions";

export const metadata: Metadata = { title: "Users & roles" };

type Row = { id: string; email: string; full_name: string | null; is_active: boolean | null; roles: string[]; created_at: string };

export default async function UsersPage({ searchParams }: PageProps<"/admin/users">) {
  const me = await requirePermission("users.manage", "/admin/users");
  const params = await searchParams;
  const q = typeof params.q === "string" ? params.q.slice(0, 100) : "";
  const db = await createClient();
  const { data, error } = await db.rpc("admin_list_users", { _search: q || null, _limit: 100, _offset: 0 });
  const rows = (data ?? []) as Row[];
  const canRoles = can(me, "roles.manage");

  return (
    <>
      <PageTitle title="Users & roles" description="Students and team members. Staff roles grant access to parts of the administration area." />
      <form className="mb-6 flex max-w-md gap-2" role="search">
        <Input name="q" defaultValue={q} placeholder="Search by name or email" aria-label="Search users" className="h-10" />
        <button className="h-10 rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted">Search</button>
      </form>
      {error ? <Alert tone="danger" className="mb-6">Users could not be loaded.</Alert> : null}
      {rows.length === 0 && !error ? <p className="text-sm text-muted-foreground">No users found.</p> : null}
      <ul className="space-y-3">
        {rows.map((u) => {
          const roles = u.roles.filter(isAppRole);
          const staffRoles = roles.filter((r) => r !== "student" && r !== "super_admin");
          const available = GRANTABLE_ROLES.filter((r) => !roles.includes(r));
          return (
            <li key={u.id} className="rounded-lg border border-border p-4">
              <div className="flex flex-wrap items-center gap-2">
                <span className="font-semibold text-ink">{u.full_name || "—"}</span>
                <span className="text-sm text-muted-foreground">{u.email}</span>
                {u.is_active === false ? <Badge tone="danger">Deactivated</Badge> : null}
                <span className="ml-auto text-xs text-muted-foreground">Joined {formatDate(u.created_at)}</span>
              </div>
              <div className="mt-2 flex flex-wrap gap-1.5">
                {roles.map((r) => <Badge key={r} tone={r === "student" ? "neutral" : "green"}>{ROLE_LABELS[r as AppRole]}</Badge>)}
              </div>
              {canRoles && u.id !== me.id ? (
                <div className="mt-4 flex flex-col gap-4 border-t border-border pt-4 md:flex-row md:items-end">
                  {available.length > 0 ? (
                    <ActionForm action={grantRole} submitLabel="Grant role" className="flex flex-wrap items-end gap-3 space-y-0">
                      <input type="hidden" name="user_id" value={u.id} />
                      <div className="w-56"><SelectField name="role" label="Add a staff role" options={available.map((r) => ({ value: r, label: ROLE_LABELS[r] }))} /></div>
                    </ActionForm>
                  ) : null}
                  {staffRoles.map((r) => (
                    <ActionForm key={r} action={revokeRole} submitLabel={`Remove ${ROLE_LABELS[r]}`} variant="secondary" confirm={`Remove the ${ROLE_LABELS[r]} role from ${u.email}?`} className="space-y-0">
                      <input type="hidden" name="user_id" value={u.id} />
                      <input type="hidden" name="role" value={r} />
                    </ActionForm>
                  ))}
                </div>
              ) : null}
            </li>
          );
        })}
      </ul>
      <p className="mt-8 text-xs text-muted-foreground">
        The Super Administrator role is granted only with the bootstrap script (see docs/SETUP.md), never from this page.
      </p>
    </>
  );
}
