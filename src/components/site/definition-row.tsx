import type { ReactNode } from "react";

export function DefinitionRow({ label, children }: { label: string; children: ReactNode }) {
  return (
    <div className="grid gap-1 py-3 sm:grid-cols-[200px_1fr] sm:gap-4">
      <dt className="font-medium text-ink">{label}</dt>
      <dd className="text-foreground">{children}</dd>
    </div>
  );
}

/** Explicit marker for official parameters that the recorded RCSC source does not state. */
export function NotStated() {
  return <span className="text-muted-foreground">Not stated in the recorded RCSC source</span>;
}
