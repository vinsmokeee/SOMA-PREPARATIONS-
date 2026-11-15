import type { Metadata } from "next";
import { ExternalLink } from "lucide-react";
import { Container, PageHeader } from "@/components/ui/container";
import { officialLinks } from "@/config/site";

export const metadata: Metadata = {
  title: "Study resources",
  description: "Official BCSE links and Soma study resources.",
};

export default function ResourcesPage() {
  return (
    <>
      <PageHeader
        eyebrow="Study resources"
        title="Official links and study guides"
        description="Start with the official sources. Soma's own study notes and guides will be added here as they are reviewed and published."
      />
      <Container className="max-w-3xl space-y-10 py-12 sm:py-16">
        <section>
          <h2 className="font-serif text-2xl font-semibold">Official sources</h2>
          <ul className="mt-4 divide-y divide-border rounded-xl border border-border">
            {[
              { href: officialLinks.rcsc, title: "Royal Civil Service Commission", body: "Announcements, schedules, results and the Bhutan Civil Service Rules and Regulations." },
              { href: officialLinks.bcseRegistration, title: "BCSE online registration", body: "The RCSC's registration system for the BCSE." },
            ].map((l) => (
              <li key={l.href} className="p-5">
                <a href={l.href} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1.5 font-semibold text-primary hover:underline">
                  {l.title} <ExternalLink className="size-3.5" aria-hidden />
                </a>
                <p className="mt-1 text-sm text-muted-foreground">{l.body}</p>
              </li>
            ))}
          </ul>
        </section>
        <section>
          <h2 className="font-serif text-2xl font-semibold">Soma study guides</h2>
          <p className="mt-2 text-muted-foreground">
            No study guides have been published yet. Guides are reviewed before publication and will appear here.
          </p>
        </section>
      </Container>
    </>
  );
}
