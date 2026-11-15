import type { Metadata } from "next";
import Link from "next/link";
import { CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Container, Eyebrow, PageHeader } from "@/components/ui/container";
import { DefinitionRow, NotStated } from "@/components/site/definition-row";
import { Citations, DataUnavailable, FixtureDataNotice, NotOfficialNotice, VerificationBadge } from "@/components/site/official";
import { getExamStructure } from "@/lib/data/public";
import { citationsFor } from "@/lib/data/structure";
import type { ExamStructure } from "@/lib/data/types";

export const metadata: Metadata = {
  title: "Preliminary Examination (PE) preparation",
  description:
    "What the BCSE Preliminary Examination tests, according to official RCSC information, and how Soma helps you prepare.",
};

export default async function PePage() {
  const result = await getExamStructure();

  return (
    <>
      <PageHeader
        eyebrow="Stage I of the BCSE"
        title="Preliminary Examination (PE)"
        description="The PE is the first stage of the Bhutan Civil Service Examination. It shortlists candidates for the Main Examination and ensures a minimum standard."
      >
        <div className="flex flex-col gap-3 sm:flex-row">
          <Button asChild size="lg">
            <Link href="/practice">Free PE practice</Link>
          </Button>
          <Button asChild size="lg" variant="secondary">
            <Link href="/packages">PE Premium</Link>
          </Button>
        </div>
      </PageHeader>

      <Container className="grid gap-12 py-12 sm:py-16 lg:grid-cols-[1fr_320px]">
        <div className="min-w-0 space-y-14">
          {result.ok ? <OfficialPe structure={result.data} source={result.source} /> : <DataUnavailable message={result.message} />}

          <section aria-labelledby="soma-pe">
            <Eyebrow>Soma&apos;s preparation</Eyebrow>
            <h2 id="soma-pe" className="mt-2 font-serif text-2xl font-semibold sm:text-3xl">
              How Soma prepares you for the PE
            </h2>
            <ul className="mt-6 grid gap-4 sm:grid-cols-2">
              {[
                ["Full-length timed simulations", "Sit complete practice examinations in a realistic, distraction-free environment with a visible countdown and automatic submission."],
                ["OMR answer-sheet practice", "The PE is answered on an OMR sheet. Practise the marking procedure so it feels routine."],
                ["Subject-wise and topic-wise practice", "Work on English, Dzongkha, logical reasoning, data interpretation or current affairs individually."],
                ["Explanations for every question", "Every Soma question is checked by a reviewer and comes with a clear explanation."],
                ["Bhutan current affairs", "Concise, source-linked notes and practice questions on national and international developments."],
                ["Performance analytics", "Track accuracy, timing and weak topics across attempts, with suggested revision."],
              ].map(([title, body]) => (
                <li key={title} className="rounded-xl border border-border p-5">
                  <p className="flex items-center gap-2 font-semibold text-ink">
                    <CheckCircle2 className="size-4 text-primary" aria-hidden /> {title}
                  </p>
                  <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{body}</p>
                </li>
              ))}
            </ul>
          </section>
        </div>

        <aside className="space-y-6 lg:sticky lg:top-24 lg:self-start">
          <NotOfficialNotice />
        </aside>
      </Container>
    </>
  );
}

function OfficialPe({ structure, source }: { structure: ExamStructure; source: "database" | "fixture" }) {
  const pe = structure.papers.find((p) => p.stage === "PE");
  const subjects = structure.subjects.filter((s) => s.stage === "PE");
  const exempt = structure.categories.filter((c) => c.pe_exempt);
  const technical = structure.categories.find((c) => c.code === "technical");
  const currentCycle = structure.cycles.find((c) => c.verification_status === "official_verified");
  const citations = citationsFor(structure, [
    pe?.source_document_id,
    structure.framework?.source_document_id,
    currentCycle?.source_document_id,
  ]);

  return (
    <section aria-labelledby="official-pe" className="space-y-6">
      <FixtureDataNotice source={source} />
      <div className="flex flex-wrap items-center gap-3">
        <Eyebrow>Official information</Eyebrow>
        {pe ? <VerificationBadge status={pe.verification_status} /> : null}
      </div>
      <h2 id="official-pe" className="font-serif text-2xl font-semibold sm:text-3xl">
        What the PE tests
      </h2>
      <p className="leading-relaxed text-muted-foreground">
        According to the RCSC, the PE consists of objective-type questions, common to all categories of graduates, that
        test:
      </p>
      <ul className="grid gap-3 sm:grid-cols-2">
        {subjects.map((s) => (
          <li key={s.id} className="flex items-start gap-3 rounded-lg border border-border px-4 py-3">
            <CheckCircle2 className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden />
            <span className="text-[15px] font-medium text-ink">{s.name}</span>
          </li>
        ))}
      </ul>

      <Card>
        <CardHeader>
          <CardTitle>Key rules</CardTitle>
        </CardHeader>
        <CardContent>
          <dl className="divide-y divide-border text-[15px]">
            <DefinitionRow label="Answer format">
              Objective type, answered on an Optical Mark Reader (OMR) answer sheet
            </DefinitionRow>
            <DefinitionRow label="Who sits the PE">Common to all categories of graduates, except those exempted</DefinitionRow>
            {exempt.length > 0 || technical?.description ? (
              <DefinitionRow label="Exemptions">
                {exempt.map((c) => c.name).join(", ")}
                {technical?.description ? (
                  <span className="mt-1 block text-muted-foreground">{technical.description}</span>
                ) : null}
              </DefinitionRow>
            ) : null}
            <DefinitionRow label="Qualifying for the ME">
              {currentCycle?.pe_cutoff_note ?? "Candidates must achieve the minimum cut-off decided by the Commission."}
            </DefinitionRow>
            <DefinitionRow label="Duration">
              {pe?.duration_minutes ? `${pe.duration_minutes} minutes` : <NotStated />}
            </DefinitionRow>
            <DefinitionRow label="Number of questions">{pe?.question_count ?? <NotStated />}</DefinitionRow>
            <DefinitionRow label="Total marks">{pe?.max_marks ?? <NotStated />}</DefinitionRow>
          </dl>
        </CardContent>
      </Card>

      <Citations citations={citations} />
    </section>
  );
}
