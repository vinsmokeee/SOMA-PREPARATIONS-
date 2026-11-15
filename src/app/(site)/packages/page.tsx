import type { Metadata } from "next";
import Link from "next/link";
import { Check } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Container, PageHeader } from "@/components/ui/container";
import { DataUnavailable, FixtureDataNotice } from "@/components/site/official";
import { getPublicPackages } from "@/lib/data/public";
import type { PackageSummary } from "@/lib/data/types";
import { formatDate, formatNu } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Packages and pricing",
  description: "Soma Preparations packages for the BCSE Preliminary and Main Examinations, priced in Ngultrum.",
};

export default async function PackagesPage() {
  const result = await getPublicPackages();
  return (
    <>
      <PageHeader
        eyebrow="Packages"
        title="Clear, one-time pricing"
        description="Start free. Upgrade when you are ready for full-length simulations and complete preparation. Every package states exactly what it includes and how long you keep access."
      />
      <Container className="py-12 sm:py-16">
        {!result.ok ? (
          <DataUnavailable message={result.message} />
        ) : (
          <div className="space-y-8">
            <FixtureDataNotice source={result.source} />
            <div className="grid gap-6 lg:grid-cols-3">
              <FreeTier />
              {result.data.map((p) => (
                <PackageCard key={p.id} pkg={p} highlighted={p.includes_pe && !p.includes_me} />
              ))}
            </div>
          </div>
        )}

        <div className="mt-14 grid gap-8 border-t border-border pt-10 md:grid-cols-3">
          {[
            ["How payment works", "When sales open, you will be able to pay through supported Bhutanese payment methods. Access is granted only after your payment is verified."],
            ["How long access lasts", "Each package is tied to an examination cycle and lists its access period before you buy. We do not promise unlimited future updates unless the package says so."],
            ["No guarantees of selection", "Soma helps you prepare. No preparation provider can guarantee success in the BCSE, and we never claim to."],
          ].map(([title, body]) => (
            <div key={title}>
              <p className="font-semibold text-ink">{title}</p>
              <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{body}</p>
            </div>
          ))}
        </div>
      </Container>
    </>
  );
}

function FreeTier() {
  return (
    <div className="flex flex-col rounded-xl border border-border p-6 sm:p-7">
      <p className="font-serif text-xl font-semibold text-ink">Free</p>
      <p className="mt-1 text-sm text-muted-foreground">Try the platform before you decide</p>
      <p className="mt-6 text-4xl font-semibold tracking-tight text-ink">Nu. 0</p>
      <ul className="mt-6 flex-1 space-y-3">
        {["Free sample questions with explanations", "Free sample mock examinations", "Official BCSE structure, with sources"].map((f) => (
          <li key={f} className="flex gap-2.5 text-[15px]">
            <Check className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden /> {f}
          </li>
        ))}
      </ul>
      <Button asChild variant="secondary" className="mt-8 h-11">
        <Link href="/register">Create a free account</Link>
      </Button>
    </div>
  );
}

function PackageCard({ pkg, highlighted }: { pkg: PackageSummary; highlighted: boolean }) {
  const comingSoon = pkg.status === "coming_soon";
  return (
    <div className={highlighted ? "flex flex-col rounded-xl border-2 border-primary p-6 sm:p-7" : "flex flex-col rounded-xl border border-border p-6 sm:p-7"}>
      <div className="flex items-start justify-between gap-3">
        <p className="font-serif text-xl font-semibold text-ink">{pkg.name}</p>
        {comingSoon ? <Badge>Coming soon</Badge> : null}
      </div>
      {pkg.tagline ? <p className="mt-1 text-sm text-muted-foreground">{pkg.tagline}</p> : null}
      <p className="mt-6 text-4xl font-semibold tracking-tight text-ink">{formatNu(pkg.price)}</p>
      {pkg.promo_price !== null ? (
        <p className="mt-1 text-sm font-medium text-primary">
          Promotional price {formatNu(pkg.promo_price)}
          {pkg.promo_starts_at || pkg.promo_ends_at
            ? ` (${pkg.promo_starts_at ? `from ${formatDate(pkg.promo_starts_at)}` : ""}${pkg.promo_ends_at ? ` until ${formatDate(pkg.promo_ends_at)}` : ""})`
            : ""}
        </p>
      ) : null}
      {pkg.cycle_name ? <p className="mt-2 text-sm text-muted-foreground">For {pkg.cycle_name}</p> : null}
      <ul className="mt-6 flex-1 space-y-3">
        {pkg.features.map((f) => (
          <li key={f} className="flex gap-2.5 text-[15px]">
            <Check className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden /> {f}
          </li>
        ))}
      </ul>
      <div className="mt-6 rounded-lg bg-muted px-4 py-3 text-sm text-muted-foreground">
        <span className="font-medium text-ink">Access: </span>
        {pkg.access_days
          ? `${pkg.access_days} days from activation`
          : pkg.access_ends_at
            ? `until ${formatDate(pkg.access_ends_at)}`
            : "to be confirmed before sales open"}
        {pkg.terms ? <p className="mt-1">{pkg.terms}</p> : null}
      </div>
      {comingSoon ? (
        <Button className="mt-6 h-11" disabled aria-describedby={`${pkg.slug}-soon`}>
          Purchasing opens soon
        </Button>
      ) : (
        <Button asChild className="mt-6 h-11">
          <Link href={`/register?package=${pkg.slug}`}>Get {pkg.name}</Link>
        </Button>
      )}
      {comingSoon ? (
        <p id={`${pkg.slug}-soon`} className="mt-2 text-center text-xs text-muted-foreground">
          Create a free account now — you can upgrade once sales open.
        </p>
      ) : null}
    </div>
  );
}
