import type { Metadata } from "next";
import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Container, PageHeader } from "@/components/ui/container";
import { DataUnavailable } from "@/components/site/official";
import { getPublishedCurrentAffairs } from "@/lib/data/public";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Bhutan, regional and world current affairs",
  description: "Daily, source-linked current-affairs notes for BCSE preparation: Bhutan, South Asia and the world.",
};

export default async function CurrentAffairsPage() {
  const result = await getPublishedCurrentAffairs();
  return (
    <>
      <PageHeader
        eyebrow="Current affairs"
        title="Current affairs for the BCSE"
        description="Short daily notes on important developments in Bhutan, South Asia and the world, each with links to its sources. The last 7 days are free; sign in for the Question of the Day, notes and practice."
      />
      <Container className="max-w-3xl py-12 sm:py-16">
        {!result.ok ? (
          <DataUnavailable message={result.message} />
        ) : result.data.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
            <p className="font-semibold text-ink">No current-affairs notes this week yet</p>
            <p className="mx-auto mt-2 max-w-md text-sm leading-relaxed text-muted-foreground">
              Soma collects news from official and established sources several times a day and publishes only items that pass its verification checks.
            </p>
          </div>
        ) : (
          <ul className="divide-y divide-border">
            {result.data.map((item) => {
              const v = VERIFICATION_LABELS[item.verification];
              return (
                <li key={item.id} className="py-6">
                  <div className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                    <span>{formatDate(item.feature_date ?? item.published_on)}</span>
                    {item.area ? <Badge tone="solid">{AREA_LABELS[item.area]}</Badge> : null}
                    {item.category ? <Badge>{item.category}</Badge> : null}
                    {v ? <Badge tone={v.tone}>{v.label}</Badge> : null}
                  </div>
                  <h2 className="mt-2 text-lg font-semibold">{item.title}</h2>
                  {item.summary ? <p className="mt-2 leading-relaxed text-muted-foreground">{item.summary}</p> : null}
                  <div className="mt-3 flex flex-wrap gap-4 text-sm font-medium">
                    <Link href={`/dashboard/current-affairs/${item.id}`} className="text-primary hover:underline">Study note and questions</Link>
                    <a href={item.primary_source_url ?? item.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1.5 text-primary hover:underline">
                      Original source <ExternalLink className="size-3.5" aria-hidden />
                    </a>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
        <p className="mt-10 text-xs leading-relaxed text-muted-foreground">
          Notes are written by Soma with AI assistance from the linked sources and checked automatically for official confirmation or agreement between sources. Practice questions are Soma questions, not RCSC questions.
        </p>
      </Container>
    </>
  );
}
