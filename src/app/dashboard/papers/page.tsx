import type { Metadata } from "next";
import Link from "next/link";
import { Clock3, FileText, Lock } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import type { CatalogueExam } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Past papers" };

export default async function PastPapersPage({ searchParams }: PageProps<"/dashboard/papers">) {
  await requireUser("/dashboard/papers");
  const sp = await searchParams;
  const stage = sp.stage === "PE" || sp.stage === "ME" ? sp.stage : null;
  const supabase = await createClient();
  const { data } = await supabase.rpc("exam_catalogue", { _stage: stage });
  const papers = ((data ?? []) as (CatalogueExam & { exam_year: number | null; attribution: string | null })[]).filter((e) => e.kind === "historical");
  const years = [...new Set(papers.map((p) => p.exam_year ?? 0))].sort((a, b) => b - a);

  return (
    <>
      <PageTitle title="Past papers" description="Real BCSE papers from previous years, in the timed examination room, with answers and explanations after you submit." />
      <nav className="mb-6 flex gap-2" aria-label="Filter by stage">
        {[{ href: "/dashboard/papers", label: "All", on: !stage }, { href: "/dashboard/papers?stage=PE", label: "PE", on: stage === "PE" }, { href: "/dashboard/papers?stage=ME", label: "ME", on: stage === "ME" }].map((t) => (
          <Link key={t.href} href={t.href} className={t.on ? "rounded-full border border-primary bg-primary px-4 py-1.5 text-sm font-medium text-white" : "rounded-full border border-border-strong px-4 py-1.5 text-sm font-medium hover:bg-muted"}>{t.label}</Link>
        ))}
      </nav>
      {papers.length === 0 ? (
        <div className="rounded-xl border border-dashed border-border-strong p-8 text-center">
          <p className="font-semibold text-ink">Past papers are being prepared</p>
          <p className="mx-auto mt-2 max-w-md text-sm text-muted-foreground">Each paper is checked question by question before it is added here.</p>
        </div>
      ) : (
        years.map((y) => (
          <section key={y} className="mb-8">
            <h2 className="mb-3 font-serif text-xl font-semibold">{y || "Undated"}</h2>
            <ul className="grid gap-4 md:grid-cols-2">
              {papers.filter((p) => (p.exam_year ?? 0) === y).map((p) => (
                <li key={p.id} className="flex flex-col rounded-xl border border-border p-5">
                  <div className="flex flex-wrap gap-2"><Badge tone="solid">{p.stage}</Badge>{p.category_name ? <Badge>{p.category_name}</Badge> : null}{p.is_free ? <Badge tone="green">Free</Badge> : null}{p.open_attempt_id ? <Badge tone="warning">In progress</Badge> : null}</div>
                  <h3 className="mt-3 font-serif text-lg font-semibold text-ink">{p.title}</h3>
                  <p className="mt-2 flex gap-4 text-sm text-muted-foreground">
                    <span className="inline-flex items-center gap-1.5"><Clock3 className="size-4" aria-hidden /> {p.duration_minutes} min</span>
                    <span className="inline-flex items-center gap-1.5"><FileText className="size-4" aria-hidden /> {p.question_count} questions</span>
                  </p>
                  {p.attribution ? <p className="mt-2 text-xs text-muted-foreground">{p.attribution}</p> : null}
                  <div className="flex-1" />
                  {p.has_access ? (
                    <Link href={`/dashboard/exams/${p.slug}`} className="mt-4 inline-flex h-11 items-center justify-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">{p.open_attempt_id ? "Resume" : p.completed_attempts ? "Take again" : "Start this paper"}</Link>
                  ) : (
                    <Link href="/packages" className="mt-4 inline-flex h-11 items-center justify-center gap-2 rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted"><Lock className="size-4" aria-hidden /> Included in premium packages</Link>
                  )}
                </li>
              ))}
            </ul>
          </section>
        ))
      )}
    </>
  );
}
