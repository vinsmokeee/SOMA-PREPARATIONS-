import Link from "next/link";
import { footerNav, officialLinks, siteConfig } from "@/config/site";
import { Container } from "@/components/ui/container";

export async function SiteFooter() {
  "use cache";
  return (
    <footer className="mt-auto border-t border-border bg-muted/60">
      <Container className="grid gap-10 py-12 md:grid-cols-[1.4fr_repeat(3,1fr)]">
        <div className="max-w-sm">
          <p className="font-serif text-xl font-semibold text-ink">{siteConfig.name}</p>
          <p className="mt-1 text-sm font-medium text-primary">{siteConfig.tagline}</p>
          <p className="mt-4 text-sm leading-relaxed text-muted-foreground">
            An independent preparation platform for the Bhutan Civil Service Examination. Soma is not affiliated with,
            endorsed by, or part of the Royal Civil Service Commission (RCSC). For official information always refer to{" "}
            <a href={officialLinks.rcsc} className="font-medium text-primary underline-offset-4 hover:underline" rel="noopener noreferrer" target="_blank">
              rcsc.gov.bt
            </a>
            .
          </p>
        </div>
        {Object.entries(footerNav).map(([group, links]) => (
          <div key={group}>
            <p className="text-sm font-semibold text-ink">{group}</p>
            <ul className="mt-3 space-y-2">
              {links.map((l) => (
                <li key={l.href}>
                  <Link href={l.href} className="text-sm text-muted-foreground hover:text-ink">
                    {l.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </Container>
      <div className="border-t border-border">
        <Container className="flex flex-col gap-2 py-5 text-xs text-muted-foreground sm:flex-row sm:items-center sm:justify-between">
          <p>© {new Date().getFullYear()} {siteConfig.name}. All rights reserved.</p>
          <p>Prices are shown in Bhutanese Ngultrum (Nu.).</p>
        </Container>
      </div>
    </footer>
  );
}
