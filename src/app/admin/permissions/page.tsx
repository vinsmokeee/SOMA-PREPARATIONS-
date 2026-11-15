import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { PermissionForm } from "@/components/admin/permission-form";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { applyPermission } from "../papers/actions";

export const metadata: Metadata = { title: "Permissions" };

export default async function PermissionsPage() {
  await requirePermission("papers.manage", "/admin/permissions");
  const db = await createClient();
  const { data } = await db.from("usage_permissions").select("*").order("created_at", { ascending: false });
  return (
    <>
      <PageTitle title="Permissions" description="Written permissions from rights holders. Real past papers can only be published to students when a permission allowing reproduction is linked to them." />
      {(data ?? []).length ? (
        <ul className="mb-10 space-y-3">
          {(data ?? []).map((p) => (
            <li key={p.id} className="rounded-xl border border-border p-4">
              <div className="flex flex-wrap items-center gap-2">
                <span className="font-semibold text-ink">{p.title}</span>
                <Badge tone={p.allows_reproduction ? "green" : "neutral"}>{p.allows_reproduction ? "Reproduction permitted" : "Analysis only"}</Badge>
                {p.letter_storage_path ? <Badge tone="outline">Letter on file</Badge> : <Badge tone="warning">No letter attached</Badge>}
              </div>
              <p className="mt-1 text-sm text-muted-foreground">
                {p.granted_by}{p.reference_number ? ` · ${p.reference_number}` : ""}{p.granted_on ? ` · ${formatDate(p.granted_on)}` : ""}
                {p.years_from || p.years_to ? ` · papers ${p.years_from ?? "…"}–${p.years_to ?? "present"}` : ""}
              </p>
              <p className="mt-2 text-sm text-foreground">{p.scope}</p>
              {p.conditions ? <p className="mt-1 text-sm text-muted-foreground">Conditions: {p.conditions}</p> : null}
              <ActionForm action={applyPermission} submitLabel="Apply to matching past papers" variant="secondary" className="mt-3 space-y-2" confirm="Link this permission to every past-paper document in its year range and update their rights status?">
                <input type="hidden" name="id" value={p.id} />
              </ActionForm>
            </li>
          ))}
        </ul>
      ) : null}
      <section className="rounded-xl border border-border p-5">
        <h2 className="mb-4 font-semibold text-ink">Record a permission</h2>
        <PermissionForm />
      </section>
    </>
  );
}
