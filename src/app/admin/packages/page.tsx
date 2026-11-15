import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { AreaField, SelectField, TextField } from "@/components/app/fields";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatNu } from "@/lib/utils";
import { updatePackage } from "../actions";

export const metadata: Metadata = { title: "Packages & pricing" };

const STATUS_OPTIONS = [
  { value: "draft", label: "Draft (hidden)" },
  { value: "coming_soon", label: "Coming soon (shown, cannot be bought)" },
  { value: "available", label: "Available" },
  { value: "retired", label: "Retired (hidden)" },
];

const day = (v: string | null) => (v ? v.slice(0, 10) : "");

export default async function AdminPackagesPage() {
  await requirePermission("packages.manage", "/admin/packages");
  const db = await createClient();
  const { data: packages } = await db.from("packages").select("*, exam_cycles(name)").order("sort_order");

  return (
    <>
      <PageTitle title="Packages & pricing" description="Prices, features and access terms shown on the packages page. Changes appear on the public site immediately." />
      <Alert tone="warning" className="mb-6" title="Sales are not open yet">
        Checkout and payment verification arrive in Milestone 8. A package can only be set to “Available” once an access
        period is defined. Offer the combined PE + ME package only when ME materials are ready.
      </Alert>
      <div className="space-y-4">
        {(packages ?? []).map((p) => (
          <details key={p.id} className="group rounded-lg border border-border">
            <summary className="flex cursor-pointer flex-wrap items-center gap-3 px-4 py-3">
              <span className="font-semibold text-ink">{p.name}</span>
              <span className="tabular-nums text-ink">{formatNu(p.price)}</span>
              <Badge tone={p.status === "available" ? "green" : "neutral"}>{String(p.status).replace("_", " ")}</Badge>
              {(p.exam_cycles as { name: string } | null)?.name ? <span className="text-sm text-muted-foreground">{(p.exam_cycles as { name: string }).name}</span> : null}
            </summary>
            <div className="border-t border-border p-4">
              <ActionForm action={updatePackage} submitLabel="Save package">
                <input type="hidden" name="id" value={p.id} />
                <div className="grid gap-4 sm:grid-cols-2">
                  <TextField name="name" label="Name" defaultValue={p.name} required />
                  <TextField name="tagline" label="Tagline" defaultValue={p.tagline} />
                </div>
                <AreaField name="description" label="Description" defaultValue={p.description} />
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                  <TextField type="number" step="0.01" name="price" label="Price (Nu.)" defaultValue={p.price} required />
                  <TextField type="number" step="0.01" name="promo_price" label="Promotional price (Nu.)" defaultValue={p.promo_price} />
                  <TextField type="date" name="promo_starts_at" label="Promotion starts" defaultValue={day(p.promo_starts_at)} />
                  <TextField type="date" name="promo_ends_at" label="Promotion ends" defaultValue={day(p.promo_ends_at)} />
                  <TextField type="number" name="access_days" label="Access (days)" defaultValue={p.access_days} hint="Or set an end date" />
                  <TextField type="date" name="access_ends_at" label="Access ends on" defaultValue={day(p.access_ends_at)} />
                  <SelectField name="status" label="Status" defaultValue={p.status} options={STATUS_OPTIONS} />
                </div>
                <AreaField name="features" label="Features (one per line)" rows={6} defaultValue={(Array.isArray(p.features) ? p.features : []).join("\n")} />
                <AreaField name="terms" label="Access terms shown to students" rows={3} defaultValue={p.terms} />
              </ActionForm>
            </div>
          </details>
        ))}
      </div>
    </>
  );
}
