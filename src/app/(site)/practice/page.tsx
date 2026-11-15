import type { Metadata } from "next";
import Link from "next/link";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Container, PageHeader } from "@/components/ui/container";

export const metadata: Metadata = {
  title: "Free practice",
  description: "Free BCSE practice questions with explanations from Soma Preparations.",
};

export default function PracticePage() {
  return (
    <>
      <PageHeader
        eyebrow="Free practice"
        title="Try Soma before you decide"
        description="Free sample questions with full explanations, covering each area tested in the Preliminary Examination."
      />
      <Container className="max-w-3xl space-y-8 py-12 sm:py-16">
        <Alert tone="info" title="Free practice is being prepared">
          Our first set of free questions is going through review. Every question is checked by a reviewer before it is
          published, so we are opening practice only when the questions meet our standard. Create a free account and the
          practice set will appear in your dashboard as soon as it opens.
        </Alert>
        <div className="rounded-xl border border-border p-6">
          <h2 className="font-serif text-xl font-semibold">What free practice will include</h2>
          <ul className="mt-4 list-disc space-y-2 pl-5 text-[15px] leading-relaxed text-foreground marker:text-primary">
            <li>Questions in every PE subject area, with answers and explanations</li>
            <li>A free sample PE examination in the full examination interface</li>
            <li>Your results and explanations saved in your dashboard</li>
          </ul>
          <div className="mt-6 flex flex-col gap-3 sm:flex-row">
            <Button asChild><Link href="/register">Create a free account</Link></Button>
            <Button asChild variant="secondary"><Link href="/pe">What the PE tests</Link></Button>
          </div>
        </div>
      </Container>
    </>
  );
}
