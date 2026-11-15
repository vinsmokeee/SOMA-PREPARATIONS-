import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { PracticeBuilder, QuickPractice } from "@/components/student/practice-builder";
import { Alert } from "@/components/ui/alert";
import { requireUser } from "@/lib/auth/dal";
import type { PracticeOptions } from "@/lib/analytics";
import { createClient } from "@/lib/supabase/server";
import { cn } from "@/lib/utils";

export const metadata: Metadata = { title: "Practice" };

export default async function PracticePage({ searchParams }: PageProps<"/dashboard/practice">) {
  await requireUser("/dashboard/practice");
  const sp = await searchParams;
  const stage = sp.stage === "ME" ? "ME" : "PE";
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("practice_options", { _stage: stage });
  const options = data as PracticeOptions | null;

  return (
    <>
      <PageTitle title="Practice" description="Build a short practice set by subject, topic and difficulty. Results feed into your performance analytics." />
      <nav className="mb-6 flex gap-2" aria-label="Stage">
        {(["PE", "ME"] as const).map((s) => (
          <Link key={s} href={`/dashboard/practice?stage=${s}`} className={cn("rounded-full border px-4 py-1.5 text-sm font-medium", stage === s ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>
            {s === "PE" ? "Preliminary (PE)" : "Main (ME)"}
          </Link>
        ))}
      </nav>
      {stage === "ME" ? (
        <Alert tone="info" className="mb-6">
          Practice sets use objective questions. For written ME practice, sit an ME paper from <Link href="/dashboard/exams?stage=ME" className="font-medium underline">Examinations</Link>.
        </Alert>
      ) : null}
      {error || !options ? (
        <Alert tone="danger">Practice options could not be loaded. Please try again.</Alert>
      ) : (
        <div className="grid gap-8 lg:grid-cols-[1fr_300px]">
          <section className="rounded-xl border border-border p-5 sm:p-6">
            <PracticeBuilder stage={stage} options={options} />
          </section>
          <aside className="space-y-4">
            <div className="rounded-xl border border-border p-5">
              <p className="font-semibold text-ink">Review my mistakes</p>
              <p className="mt-1 text-sm text-muted-foreground">
                {options.mistakes ? `${options.mistakes} question${options.mistakes === 1 ? "" : "s"} you last answered incorrectly.` : "Nothing to review — questions you get wrong will appear here."}
              </p>
              {options.mistakes ? <div className="mt-3"><QuickPractice stage={stage} mode="mistakes" label="Retry my mistakes" /></div> : null}
            </div>
            <div className="rounded-xl border border-border p-5 text-sm text-muted-foreground">
              <p className="font-semibold text-ink">How sets are chosen</p>
              <p className="mt-1">Soma picks questions you have not seen first, then ones you got wrong, then the rest — in random order.</p>
            </div>
          </aside>
        </div>
      )}
    </>
  );
}
