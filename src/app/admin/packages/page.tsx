import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { AreaField, SelectField, TextField } from "@/components/app/fields";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatNu } from "@/lib/utils";
import { createPackage, updatePackage } from "../actions";
import { PACKAGE_FEATURES } from "@/lib/commerce/features";

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
  const [{ data: packages }, { data: cats }] = await Promise.all([
    db.from("packages").select("*, exam_cycles(name)").order("sort_order"),
    db.from("exam_categories").select("id, name").order("sort_order"),
  ]);

  return (
    <>
      <PageTitle title="Packages & pricing" description="Prices, features and access terms shown on the packages page. Changes appear on the public site immediately." />
      <Alert tone="info" className="mb-6" title="Prices, durations and features are all editable here">
        Set a package to “Available” to let students buy it. A package needs an access period (days or an end date) first.
        Existing subscriptions keep the terms they were bought with.
      </Alert>
      <details className="mb-6 rounded-lg border border-border p-4">
        <summary className="cursor-pointer font-medium text-ink">Create a new package</summary>
        <ActionForm action={createPackage} submitLabel="Create package" className="mt-3">
          <div className="grid gap-4 sm:grid-cols-3">
            <TextField name="name" label="Name" required />
            <TextField name="slug" label="Short web name (e.g. me-premium)" required />
            <TextField type="number" step="0.01" name="price" label="Price (Nu.)" required />
          </div>
        </ActionForm>
      </details>
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
              <ActionForm key={String(p.updated_at)} action={updatePackage} submitLabel="Save package">
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
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                  <TextField name="programme" label="Programme" defaultValue={p.programme ?? "bcse"} hint="bcse now; e.g. class10 later" />
                  <SelectField name="category_id" label="ME entry group (optional)" defaultValue={p.category_id ?? ""} options={[{ value: "", label: "Any / not specific" }, ...(cats ?? []).map((c) => ({ value: c.id, label: c.name }))]} />
                  <TextField type="number" name="ai_evaluations" label="AI evaluations included" defaultValue={p.ai_evaluations} hint="Blank = default setting" />
                </div>
                <fieldset className="grid gap-2 text-sm sm:grid-cols-2">
                  <legend className="mb-1 text-sm font-medium text-ink">Access and rules</legend>
                  <label className="flex items-center gap-2"><input type="checkbox" name="includes_pe" defaultChecked={p.includes_pe} /> Includes PE (Preliminary)</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="includes_me" defaultChecked={p.includes_me} /> Includes ME (Main)</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="renewable" defaultChecked={p.renewable ?? true} /> Can be renewed (adds time to the current expiry)</label>
                  <label className="flex items-center gap-2"><input type="checkbox" name="promo_allowed" defaultChecked={p.promo_allowed ?? true} /> Coupon codes allowed</label>
                </fieldset>
                <fieldset className="grid gap-2 text-sm sm:grid-cols-2">
                  <legend className="mb-1 text-sm font-medium text-ink">Included features</legend>
                  {Object.entries(PACKAGE_FEATURES).map(([k, label]) => (
                    <label key={k} className="flex items-center gap-2"><input type="checkbox" name="feature_keys" value={k} defaultChecked={(p.feature_keys ?? []).includes(k)} /> {label}</label>
                  ))}
                </fieldset>
                <AreaField name="features" label="Features shown to students (one per line)" rows={6} defaultValue={(Array.isArray(p.features) ? p.features : []).join("\n")} />
                <AreaField name="terms" label="Access terms shown to students" rows={3} defaultValue={p.terms} />
              </ActionForm>
            </div>
          </details>
        ))}
      </div>
    </>
  );
}
