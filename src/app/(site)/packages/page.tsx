import { ME_RESULT_NOTE } from "@/lib/exam/entry";
import type { Metadata } from "next";
import Link from "next/link";
import { Check, Crown } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Container, PageHeader } from "@/components/ui/container";
import { DataUnavailable, FixtureDataNotice } from "@/components/site/official";
import { getPublicPackages } from "@/lib/data/public";
import type { PackageSummary } from "@/lib/data/types";
import { cn, formatDate, formatNu } from "@/lib/utils";

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
                <PackageCard key={p.id} pkg={p} />
              ))}
            </div>
          </div>
        )}

        <div className="mt-14 grid gap-8 border-t border-border pt-10 md:grid-cols-2 lg:grid-cols-4">
          {[
            ["How payment works", "When sales open, you will be able to pay through supported Bhutanese payment methods. Access is granted only after your payment is verified."],
            ["How long access lasts", "Each package is tied to an examination cycle and lists its access period before you buy. We do not promise unlimited future updates unless the package says so."],
            ["No guarantees of selection", "Soma helps you prepare. No preparation provider can guarantee success in the BCSE, and we never claim to."],
            ["PE and ME are separate", `Buying a PE package does not include the ME, and the reverse. ${ME_RESULT_NOTE}`],
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
    <div className="flex flex-col rounded-3xl bg-white p-6 shadow-sm ring-1 ring-border sm:p-7">
      <p className="text-xl font-extrabold text-ink">Free</p>
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

function PackageCard({ pkg }: { pkg: PackageSummary }) {
  const comingSoon = pkg.status === "coming_soon";
  const me = pkg.includes_me && !pkg.includes_pe;
  return (
    <div className={cn("relative flex flex-col overflow-hidden rounded-3xl bg-gradient-to-br p-6 text-white shadow-xl sm:p-7",
      me ? "from-rose-500 via-[#9b2c4b] to-[#5b1530]" : "from-amber-400 via-orange-500 to-orange-700")}>
      <span className="absolute -right-8 -top-8 size-36 rounded-full bg-white/10" aria-hidden />
      <div className="relative flex items-start justify-between gap-3">
        <p className="flex items-center gap-2 text-xl font-extrabold"><Crown className="size-5 text-yellow-200" aria-hidden />{pkg.name}</p>
        {comingSoon ? <span className="rounded-full bg-white/20 px-2.5 py-0.5 text-xs font-bold">Coming soon</span> : null}
      </div>
      {pkg.tagline ? <p className="relative mt-1 text-sm text-white/85">{pkg.tagline}</p> : null}
      <p className="relative mt-5 text-4xl font-black tracking-tight">{formatNu(pkg.price)}</p>
      {pkg.promo_price !== null ? (
        <p className="relative mt-1 text-sm font-semibold text-yellow-100">
          Promotional price {formatNu(pkg.promo_price)}
          {pkg.promo_starts_at || pkg.promo_ends_at
            ? ` (${pkg.promo_starts_at ? `from ${formatDate(pkg.promo_starts_at)}` : ""}${pkg.promo_ends_at ? ` until ${formatDate(pkg.promo_ends_at)}` : ""})`
            : ""}
        </p>
      ) : null}
      {pkg.cycle_name ? <p className="relative mt-2 text-sm text-white/85">For {pkg.cycle_name}</p> : null}
      <ul className="relative mt-5 flex-1 space-y-2.5">
        {pkg.features.map((f) => (
          <li key={f} className="flex gap-2.5 text-[15px]">
            <Check className="mt-0.5 size-4 shrink-0 text-yellow-200" aria-hidden /> {f}
          </li>
        ))}
      </ul>
      <div className="relative mt-5 rounded-2xl bg-white/15 px-4 py-3 text-sm text-white/90">
        <span className="font-bold text-white">Access: </span>
        {pkg.access_days
          ? `${pkg.access_days} days from activation`
          : pkg.access_ends_at
            ? `until ${formatDate(pkg.access_ends_at)}`
            : "to be confirmed before sales open"}
        {pkg.terms ? <p className="mt-1">{pkg.terms}</p> : null}
      </div>
      {comingSoon ? (
        <>
          <button type="button" disabled aria-describedby={`${pkg.slug}-soon`} className="relative mt-5 h-12 rounded-2xl bg-white/25 text-base font-bold text-white">
            Purchasing opens soon
          </button>
          <p id={`${pkg.slug}-soon`} className="relative mt-2 text-center text-xs text-white/85">
            Create a free account now — you can upgrade once sales open.
          </p>
        </>
      ) : (
        <Link href={`/dashboard/subscription/checkout/${pkg.slug}`} className={cn("relative mt-5 flex h-12 items-center justify-center rounded-2xl bg-white text-base font-bold", me ? "text-[#881337]" : "text-[#9a3412]")}>
          Get {pkg.name}
        </Link>
      )}
    </div>
  );
}
