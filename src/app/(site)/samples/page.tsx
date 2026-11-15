import type { Metadata } from "next";
import Link from "next/link";
import { Suspense } from "react";
import { FreeExams } from "@/components/site/free-exams";
import { Button } from "@/components/ui/button";
import { Container, PageHeader } from "@/components/ui/container";

export const metadata: Metadata = {
  title: "Sample examinations",
  description: "Free sample PE and ME examinations in Soma's realistic examination environment.",
};

export default function SamplesPage() {
  return (
    <>
      <PageHeader
        eyebrow="Sample examinations"
        title="Experience the examination environment"
        description="Sit a complete sample examination with a countdown timer, question palette, mark-for-review and a full results report."
      />
      <Container className="max-w-3xl space-y-8 py-12 sm:py-16">
        <Suspense fallback={<div className="h-40 rounded-xl bg-muted" aria-hidden />}>
          <FreeExams
            emptyTitle="Sample examinations open soon"
            emptyText="Sample PE and ME examinations will be listed here, and in your dashboard, as soon as their questions have been reviewed and published."
          />
        </Suspense>
        <div className="grid gap-4 sm:grid-cols-2">
          <div className="rounded-xl border border-border p-6">
            <p className="font-semibold text-ink">Sample PE examination</p>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">Objective questions, OMR-style answer practice, automatic marking and explanations.</p>
          </div>
          <div className="rounded-xl border border-border p-6">
            <p className="font-semibold text-ink">Sample ME paper</p>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">Written answers with word counts, then model answers and a marking rubric.</p>
          </div>
        </div>
        <Button asChild><Link href="/register">Create a free account</Link></Button>
      </Container>
    </>
  );
}
