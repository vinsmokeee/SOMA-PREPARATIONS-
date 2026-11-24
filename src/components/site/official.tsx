import { ExternalLink, ShieldCheck } from "lucide-react";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import type { Citation, VerificationStatus } from "@/lib/data/types";
import { formatDate } from "@/lib/utils";

/** Labels official information and distinguishes it from Soma's own features. */
export function VerificationBadge({ status }: { status: VerificationStatus }) {
  if (status === "official_verified")
    return (
      <Badge tone="green">
        <ShieldCheck className="size-3" aria-hidden /> Checked against RCSC source
      </Badge>
    );
  if (status === "superseded") return <Badge tone="warning">Superseded</Badge>;
  return <Badge tone="warning">Awaiting verification</Badge>;
}

export function Citations({ citations, className }: { citations: Citation[]; className?: string }) {
  if (citations.length === 0) return null;
  return (
    <div className={className}>
      <p className="text-sm font-semibold text-ink">Official sources</p>
      <ul className="mt-3 space-y-3">
        {citations.map((c) => (
          <li key={c.id} className="text-sm leading-relaxed">
            <a href={c.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-start gap-1.5 font-medium text-primary hover:underline">
              <span>{c.title}</span>
              <ExternalLink className="mt-1 size-3.5 shrink-0" aria-hidden />
            </a>
            <p className="text-muted-foreground">
              {c.publisher}
              {c.reference_number ? ` · ${c.reference_number}` : ""}
              {c.published_on ? ` · ${formatDate(c.published_on)}` : ""}
              {c.last_retrieved_at ? ` · retrieved ${formatDate(c.last_retrieved_at)}` : ""}
            </p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export function NotOfficialNotice({ className }: { className?: string }) {
  return (
    <Alert tone="info" title="Soma is independent of the RCSC" className={className}>
      SOMA Academy is a private preparation platform. Our practice examinations are simulations designed to
      familiarise you with BCSE conditions — they are not official RCSC papers, and Soma scores are not RCSC marks.
      Always confirm dates, rules and requirements in the latest RCSC announcement.
    </Alert>
  );
}

export function DataUnavailable({ message }: { message: string }) {
  return (
    <Alert tone="warning" title="Information temporarily unavailable">
      {message} For official information, please visit{" "}
      <a href="https://www.rcsc.gov.bt" className="font-medium text-primary underline" target="_blank" rel="noopener noreferrer">
        rcsc.gov.bt
      </a>
      .
    </Alert>
  );
}

export function FixtureDataNotice({ source }: { source: "database" | "fixture" }) {
  if (source !== "fixture") return null;
  return (
    <p className="rounded-md border border-dashed border-warning/40 bg-warning-soft px-3 py-2 text-xs text-warning">
      Development mode: showing a snapshot of the reference data exported from the database migrations.
    </p>
  );
}
