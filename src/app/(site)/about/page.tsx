import type { Metadata } from "next";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Container, Eyebrow, PageHeader } from "@/components/ui/container";

export const metadata: Metadata = {
  title: "About Soma",
  description: "Why Soma Preparations exists and how we build trustworthy BCSE preparation for Bhutanese graduates.",
};

export default function AboutPage() {
  return (
    <>
      <PageHeader
        eyebrow="About Soma"
        title="Serious preparation for an important examination"
        description="Soma Preparations is a Bhutanese education platform helping graduates prepare for the Bhutan Civil Service Examination with structure, realism and honesty."
      />
      <Container className="grid gap-12 py-12 sm:py-16 lg:grid-cols-[1fr_1fr]">
        <section className="space-y-5 text-[17px] leading-relaxed text-foreground">
          <p>
            Every year, thousands of graduates sit the BCSE conducted by the Royal Civil Service Commission. Good preparation
            depends on knowing what is tested, practising under realistic conditions and understanding your own mistakes.
          </p>
          <p>
            Soma brings these together in one place: preparation for the Preliminary Examination and the Main Examination,
            timed simulations that feel like the real examination, clear explanations and analytics that show what to
            revise next.
          </p>
          <p>
            Soma means <em>preparation</em> in the sense we care about most: steady, deliberate work. Our tagline says it
            simply — <strong className="text-ink">Prepare. Practice. Progress.</strong>
          </p>
        </section>
        <section className="space-y-8">
          {[
            ["Accuracy first", "Official information is sourced from RCSC documents and cited. Questions are reviewed before publication. If we are not sure, we say so."],
            ["Original content", "We write our own questions and study notes. Historical papers are studied for patterns and only reproduced where permitted."],
            ["Honest about results", "Soma estimates are not RCSC assessments. We never promise selection or guaranteed success."],
            ["Built in Bhutan, for Bhutan", "Over time we aim to work with Bhutanese graduates and subject specialists as researchers, question writers and evaluators."],
          ].map(([title, body]) => (
            <div key={title} className="border-l-2 border-primary pl-5">
              <h2 className="text-lg font-semibold">{title}</h2>
              <p className="mt-1.5 leading-relaxed text-muted-foreground">{body}</p>
            </div>
          ))}
        </section>
      </Container>
      <section className="border-t border-border bg-muted/60 py-12">
        <Container className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <Eyebrow>Independent</Eyebrow>
            <p className="mt-2 max-w-2xl text-muted-foreground">
              Soma Preparations is not affiliated with, endorsed by, or part of the Royal Civil Service Commission.
            </p>
          </div>
          <Button asChild variant="secondary">
            <Link href="/contact">Contact us</Link>
          </Button>
        </Container>
      </section>
    </>
  );
}
