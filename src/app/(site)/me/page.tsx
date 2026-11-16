import type { Metadata } from "next";
import Link from "next/link";
import { Bot, Calculator, CheckCircle2, UserCheck } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Container, Eyebrow, PageHeader } from "@/components/ui/container";
import { Table, TBody, TD, TH, THead, TR } from "@/components/ui/table";
import { Citations, DataUnavailable, FixtureDataNotice, NotOfficialNotice, VerificationBadge } from "@/components/site/official";
import { getExamStructure } from "@/lib/data/public";
import { citationsFor, COMPONENT_LABELS, groupMeCategories } from "@/lib/data/structure";
import type { ExamStructure } from "@/lib/data/types";
import { ME_RESULT_NOTE, PUBLIC_GROUP_LABELS } from "@/lib/exam/entry";
import { formatPercent, toRoman } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Main Examination (ME) preparation",
  description:
    "BCSE Main Examination structure by category, based on official RCSC information, and how Soma prepares you for the written papers.",
};

export default async function MePage() {
  const result = await getExamStructure();
  return (
    <>
      <PageHeader
        eyebrow="Stage II of the BCSE"
        title="Main Examination (ME)"
        description="The ME tests your core competencies and subject or general knowledge for final selection. Candidates are grouped by category, and each category sits its own written papers."
      >
        <div className="flex flex-col gap-3 sm:flex-row">
          <Button asChild size="lg">
            <Link href="/packages">ME Premium</Link>
          </Button>
          <Button asChild size="lg" variant="secondary">
            <Link href="/samples">Sample examinations</Link>
          </Button>
        </div>
      </PageHeader>

      <Container className="grid gap-12 py-12 sm:py-16 lg:grid-cols-[1fr_320px]">
        <div className="min-w-0 space-y-14">
          {result.ok ? <OfficialMe structure={result.data} source={result.source} /> : <DataUnavailable message={result.message} />}
          <SomaMe />
          <Evaluation />
        </div>
        <aside className="space-y-6 lg:sticky lg:top-24 lg:self-start">
          <NotOfficialNotice />
        </aside>
      </Container>
    </>
  );
}

function OfficialMe({ structure, source }: { structure: ExamStructure; source: "database" | "fixture" }) {
  const groups = groupMeCategories(structure);
  const mePapers = structure.papers.filter((p) => p.stage === "ME");
  const verified = mePapers.length > 0 && mePapers.every((p) => p.verification_status === "official_verified");
  const citations = citationsFor(structure, [structure.framework?.source_document_id, ...mePapers.map((p) => p.source_document_id)]);

  return (
    <section aria-labelledby="official-me" className="space-y-8">
      <FixtureDataNotice source={source} />
      <div className="space-y-3">
        <div className="flex flex-wrap items-center gap-3">
          <Eyebrow>Official information</Eyebrow>
          <VerificationBadge status={verified ? "official_verified" : "unverified"} />
        </div>
        <h2 id="official-me" className="font-serif text-2xl font-semibold sm:text-3xl">
          Structure by category
        </h2>
        <p className="leading-relaxed text-muted-foreground">
          The ME has three parts — Academic Achievement, a Written Examination and a Viva Voce — weighted for merit
          ranking, selection and placement.
          {structure.framework ? ` Shown here as per the ${structure.framework.name}.` : ""}
        </p>
      </div>

      <div className="space-y-6">
        {groups.map((g) => (
          <article key={g.categories.map((c) => c.id).join("-")} className="rounded-xl border border-border">
            <header className="border-b border-border px-5 py-4 sm:px-6">
              <h3 className="font-serif text-xl font-semibold">
                {g.categories[0]?.public_group ? `${PUBLIC_GROUP_LABELS[g.categories[0].public_group]}: ` : ""}
                {g.categories.map((c) => c.name).join(" · ")}
              </h3>
              {g.categories.every((c) => c.is_offered === false) ? <p className="mt-1 text-sm font-medium text-warning">Soma does not offer preparation for this category yet.</p> : null}
              {g.components.length > 0 ? (
                <p className="mt-1.5 text-sm text-muted-foreground">
                  {g.components.map((c) => `${COMPONENT_LABELS[c.component]} ${formatPercent(c.weightage_percent)}`).join(" · ")}
                </p>
              ) : null}
            </header>
            <div className="p-4 sm:p-6">
              <Table>
                <THead>
                  <TR>
                    <TH className="w-20">Paper</TH>
                    <TH>Title</TH>
                    <TH className="w-32">Marks · time</TH>
                    <TH className="w-28 text-right">Weightage</TH>
                  </TR>
                </THead>
                <TBody>
                  {g.papers.map((p) => (
                    <TR key={p.id}>
                      <TD className="font-medium text-ink">{toRoman(p.paper_number)}</TD>
                      <TD>
                        <span className="text-ink">{p.title}</span>
                        {p.description ? <span className="mt-1 block text-[13px] text-muted-foreground">{p.description}</span> : null}
                      </TD>
                      <TD className="text-[13px]">
                        {p.max_marks || p.duration_minutes ? (
                          <>
                            {[p.max_marks ? `${p.max_marks} marks` : null, p.duration_minutes ? `${p.duration_minutes} min` : null].filter(Boolean).join(" · ")}
                            {p.params_source !== "official" ? <span className="block text-muted-foreground">Soma practice format*</span> : null}
                          </>
                        ) : (
                          <span className="text-muted-foreground">Not stated</span>
                        )}
                      </TD>
                      <TD className="text-right tabular-nums">{formatPercent(p.effectiveWeightage)}</TD>
                    </TR>
                  ))}
                </TBody>
              </Table>
              {g.categories.some((c) => c.code === "technical") && structure.specialisations.length ? (
                <details className="mt-4 text-sm">
                  <summary className="cursor-pointer font-medium text-primary">Technical specialisations Soma covers ({structure.specialisations.length})</summary>
                  <p className="mt-2 text-muted-foreground">
                    Paper I is common to all technical graduates. Paper II and Paper III follow your specialisation.
                  </p>
                  <ul className="mt-2 grid gap-1 text-muted-foreground sm:grid-cols-2">
                    {structure.specialisations.map((s) => <li key={s.id}>{s.name}</li>)}
                  </ul>
                </details>
              ) : null}
              {g.categories.some((c) => c.eligibility_summary) ? (
                <details className="mt-4 text-sm">
                  <summary className="cursor-pointer font-medium text-primary">Academic requirement</summary>
                  <ul className="mt-2 space-y-1.5 text-muted-foreground">
                    {g.categories.map((c) => (
                      <li key={c.id}>
                        <span className="font-medium text-ink">{c.name}:</span> {c.eligibility_summary}
                      </li>
                    ))}
                  </ul>
                </details>
              ) : null}
            </div>
          </article>
        ))}
      </div>
      <p className="text-sm text-muted-foreground">
        Paper weightages are percentages of the overall ME result. *Marks and times marked &quot;Soma practice format&quot; are what
        Soma&apos;s practice papers use; the RCSC announces the official durations and marks for each examination.
      </p>
      <Citations citations={citations} />
    </section>
  );
}

function SomaMe() {
  return (
    <section aria-labelledby="soma-me">
      <Eyebrow>Soma&apos;s preparation</Eyebrow>
      <h2 id="soma-me" className="mt-2 font-serif text-2xl font-semibold sm:text-3xl">
        How Soma prepares you for the ME
      </h2>
      <p className="mt-4 rounded-lg border border-primary/30 bg-primary-soft p-4 text-sm leading-relaxed text-ink">{ME_RESULT_NOTE}</p>
      <ul className="mt-6 grid gap-4 sm:grid-cols-2">
        {[
          ["Written-examination simulations", "Paper-specific instructions, a countdown timer and a focused writing space with word counts and question navigation."],
          ["Every answer type", "Multiple choice, short and long answers, essays, translation, passage-based, case-study and analytical questions."],
          ["Model answers and rubrics", "Compare your answer with a model answer and the criteria an examiner would use."],
          ["Safe answer saving", "Answers save continuously and recover after an accidental disconnection."],
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
  );
}

function Evaluation() {
  return (
    <section aria-labelledby="evaluation" className="rounded-xl bg-muted/70 p-6 sm:p-8">
      <h2 id="evaluation" className="font-serif text-2xl font-semibold">
        Three kinds of feedback, always clearly labelled
      </h2>
      <p className="mt-2 text-muted-foreground">
        Soma always tells you how a piece of feedback was produced. None of it is an official RCSC mark.
      </p>
      <ul className="mt-6 grid gap-5 sm:grid-cols-3">
        <li>
          <Calculator className="size-5 text-primary" aria-hidden />
          <p className="mt-2 font-semibold text-ink">Automated scoring</p>
          <p className="mt-1 text-sm leading-relaxed text-muted-foreground">
            Exact marking of objective questions against Soma&apos;s verified answer key.
          </p>
        </li>
        <li>
          <Bot className="size-5 text-primary" aria-hidden />
          <p className="mt-2 font-semibold text-ink">AI-assisted feedback</p>
          <p className="mt-1 text-sm leading-relaxed text-muted-foreground">
            Indicative comments on structure and content. Useful for practice, never a final mark.
          </p>
        </li>
        <li>
          <UserCheck className="size-5 text-primary" aria-hidden />
          <p className="mt-2 font-semibold text-ink">Expert evaluation</p>
          <p className="mt-1 text-sm leading-relaxed text-muted-foreground">
            A qualified evaluator marks your answer against the rubric and adds written comments, where available.
          </p>
        </li>
      </ul>
    </section>
  );
}
