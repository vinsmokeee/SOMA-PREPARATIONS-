import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { Input, Select } from "@/components/ui/input";
import { requireUser } from "@/lib/auth/dal";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Current-affairs archive" };

type Row = { id: string; title: string; summary: string | null; area: string; category: string | null; verification: string; feature_date: string | null; questions: number };

export default async function ArchivePage({ searchParams }: PageProps<"/dashboard/current-affairs/archive">) {
  await requireUser("/dashboard/current-affairs/archive");
  const sp = await searchParams;
  const month = typeof sp.month === "string" && /^\d{4}-\d{2}$/.test(sp.month) ? sp.month : "";
  const area = typeof sp.area === "string" && ["bhutan", "regional", "world"].includes(sp.area) ? sp.area : "";
  const category = typeof sp.category === "string" && /^[0-9a-f-]{36}$/.test(sp.category) ? sp.category : "";
  const q = typeof sp.q === "string" ? sp.q.slice(0, 100) : "";
  const db = await createClient();
  const [{ data }, { data: cats }, { data: paid }] = await Promise.all([
    db.rpc("ca_archive", { _month: month ? `${month}-01` : null, _area: area || null, _category: category || null, _q: q || null }),
    db.from("ca_categories").select("id, name").eq("is_active", true).order("sort_order"),
    db.rpc("has_any_package"),
  ]);
  const rows = (data ?? []) as Row[];
  return (
    <>
      <PageTitle title="Current-affairs archive" description="Every published note, kept for revision." />
      {!paid ? <p className="mb-4 rounded-lg bg-muted p-3 text-sm">You are seeing the last 7 days. The full archive is part of Premium.</p> : null}
      <form className="mb-6 grid gap-2 sm:grid-cols-[1fr_140px_150px_200px_auto]" role="search">
        <Input name="q" defaultValue={q} placeholder="Search (e.g. Gelephu, budget, India)" aria-label="Search" className="h-10" />
        <Input name="month" type="month" defaultValue={month} aria-label="Month" className="h-10" />
        <Select name="area" defaultValue={area} aria-label="Area" className="h-10"><option value="">All areas</option><option value="bhutan">Bhutan</option><option value="regional">Regional</option><option value="world">World</option></Select>
        <Select name="category" defaultValue={category} aria-label="Topic" className="h-10"><option value="">All topics</option>{(cats ?? []).map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}</Select>
        <button type="submit" className="h-10 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground">Filter</button>
      </form>
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">Nothing found.</p> : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {rows.map((r) => (
            <li key={r.id}>
              <Link href={`/dashboard/current-affairs/${r.id}`} className="block p-4 hover:bg-muted/50">
                <div className="flex flex-wrap items-center gap-2 text-xs">
                  <span className="text-muted-foreground">{formatDate(r.feature_date)}</span>
                  <Badge tone="solid">{AREA_LABELS[r.area] ?? r.area}</Badge>
                  {r.category ? <Badge>{r.category}</Badge> : null}
                  <Badge tone={VERIFICATION_LABELS[r.verification]?.tone ?? "neutral"}>{VERIFICATION_LABELS[r.verification]?.label ?? r.verification}</Badge>
                  {r.questions ? <span className="text-muted-foreground">{r.questions} questions</span> : null}
                </div>
                <p className="mt-1 font-medium text-ink">{r.title}</p>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </>
  );
}
