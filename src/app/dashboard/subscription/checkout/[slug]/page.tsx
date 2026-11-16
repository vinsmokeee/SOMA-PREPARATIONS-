import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Check, ChevronLeft } from "lucide-react";
import { CheckoutForm } from "@/components/commerce/checkout-form";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate, formatNu, requestTimeMs } from "@/lib/utils";

export const metadata: Metadata = { title: "Checkout" };

export default async function CheckoutPage({ params }: PageProps<"/dashboard/subscription/checkout/[slug]">) {
  const { slug } = await params;
  await requireUser(`/dashboard/subscription/checkout/${slug}`);
  const db = await createClient();
  const { data: p } = await db.from("packages").select("id, name, tagline, price, promo_price, promo_starts_at, promo_ends_at, features, access_days, access_ends_at, terms, status").eq("slug", slug).maybeSingle();
  if (!p) notFound();
  const now = requestTimeMs();
  const promo = p.promo_price !== null && (!p.promo_starts_at || new Date(p.promo_starts_at).getTime() <= now) && (!p.promo_ends_at || new Date(p.promo_ends_at).getTime() > now);
  const price = Number(promo ? p.promo_price : p.price);
  return (
    <div className="mx-auto max-w-xl">
      <Link href="/packages" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink"><ChevronLeft className="size-4" aria-hidden /> Packages</Link>
      <h1 className="mt-3 font-serif text-3xl font-semibold">{p.name}</h1>
      {p.tagline ? <p className="mt-1 text-muted-foreground">{p.tagline}</p> : null}
      {p.status !== "available" ? (
        <p className="mt-6 rounded-lg bg-muted p-4 text-sm">This package cannot be bought yet. Please check back soon.</p>
      ) : (
        <>
          <ul className="mt-6 space-y-2">{(p.features as string[]).map((f) => <li key={f} className="flex gap-2 text-[15px]"><Check className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden /> {f}</li>)}</ul>
          <p className="mt-4 text-sm text-muted-foreground">
            Access: {p.access_days ? `${p.access_days} days from activation` : p.access_ends_at ? `until ${formatDate(p.access_ends_at)}` : "—"}. If you already have this package, the time is added to your current expiry date.
            {promo ? ` Launch price ${formatNu(price)} (normally ${formatNu(p.price)}).` : ""}
          </p>
          {p.terms ? <p className="mt-2 text-sm text-muted-foreground">{p.terms}</p> : null}
          <div className="mt-6"><CheckoutForm packageId={p.id} price={price} /></div>
          <p className="mt-4 text-xs text-muted-foreground">By continuing you agree to the <Link href="/terms" className="underline">Terms</Link>, the <Link href="/refunds" className="underline">refund policy</Link> and that one subscription is for one student.</p>
        </>
      )}
    </div>
  );
}
