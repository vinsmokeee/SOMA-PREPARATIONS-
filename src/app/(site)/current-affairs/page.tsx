import type { Metadata } from "next";
import { ExternalLink } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Container, PageHeader } from "@/components/ui/container";
import { DataUnavailable } from "@/components/site/official";
import { getPublishedCurrentAffairs } from "@/lib/data/public";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Bhutan current affairs",
  description: "Reviewed, source-linked current-affairs notes relevant to the BCSE.",
};

export default async function CurrentAffairsPage() {
  const result = await getPublishedCurrentAffairs();
  return (
    <>
      <PageHeader
        eyebrow="Current affairs"
        title="Bhutan current affairs for the BCSE"
        description="Concise notes on national and international developments relevant to the PE and ME. Every item links to its source and is reviewed by a person before publication."
      />
      <Container className="max-w-3xl py-12 sm:py-16">
        {!result.ok ? (
          <DataUnavailable message={result.message} />
        ) : result.data.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
            <p className="font-semibold text-ink">No current-affairs notes have been published yet</p>
            <p className="mx-auto mt-2 max-w-md text-sm leading-relaxed text-muted-foreground">
              We prioritise official sources — the RCSC, the Royal Government of Bhutan, Parliament and national statistics —
              and publish only after review. Notes will appear here as they are approved.
            </p>
          </div>
        ) : (
          <ul className="divide-y divide-border">
            {result.data.map((item) => (
              <li key={item.id} className="py-6">
                <div className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                  <span>{formatDate(item.published_on)}</span>
                  {item.category ? <Badge>{item.category}</Badge> : null}
                  {item.pe_relevant ? <Badge tone="green">PE</Badge> : null}
                  {item.me_relevant ? <Badge tone="green">ME</Badge> : null}
                </div>
                <h2 className="mt-2 text-lg font-semibold">{item.title}</h2>
                {item.summary ? <p className="mt-2 leading-relaxed text-muted-foreground">{item.summary}</p> : null}
                <a href={item.primary_source_url ?? item.url} target="_blank" rel="noopener noreferrer" className="mt-3 inline-flex items-center gap-1.5 text-sm font-medium text-primary hover:underline">
                  Source <ExternalLink className="size-3.5" aria-hidden />
                </a>
              </li>
            ))}
          </ul>
        )}
      </Container>
    </>
  );
}
