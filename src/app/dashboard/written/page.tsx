import type { Metadata } from "next";
import Link from "next/link";
import { Lock } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { EntrySummary } from "@/components/app/entry-summary";
import { ME_RESULT_NOTE } from "@/lib/exam/entry";
import { StartWritten } from "@/components/written/start-written";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { cn } from "@/lib/utils";

export const metadata: Metadata = { title: "Written answers" };

type Q = { id: string; stem: string; question_type: string; marks: number; word_limit: number | null; subject: string | null; topic: string | null; paper_id: string | null; paper: string | null; category: string | null; exam_year: number | null; is_free_sample: boolean; has_access: boolean; attempts: number; last_score: number | null; last_max: number | null };

export default async function WrittenPage({ searchParams }: PageProps<"/dashboard/written">) {
  const user = await requireUser("/dashboard/written");
  const sp = await searchParams;
  const db = await createClient();
  const [{ data: qs }, { data: allowance }, { data: cats }] = await Promise.all([
    db.rpc("written_practice_questions"),
    db.rpc("my_evaluation_allowance"),
    db.from("exam_categories").select("id, name, exam_paper_categories(paper_id)").eq("is_active", true).order("sort_order"),
  ]);
  const all = (qs ?? []) as Q[];
  const groups = ((cats ?? []) as { id: string; name: string; exam_paper_categories: { paper_id: string }[] }[]);
  const group = typeof sp.group === "string" ? groups.find((g) => g.id === sp.group) : undefined;
  const paper = typeof sp.paper === "string" ? sp.paper : undefined;
  const groupPapers = new Set(group?.exam_paper_categories.map((x) => x.paper_id));
  const inGroup = group ? all.filter((q) => q.paper_id && groupPapers.has(q.paper_id)) : all;
  const papers = [...new Map(inGroup.filter((q) => q.paper_id).map((q) => [q.paper_id!, q.paper ?? "Paper"])).entries()];
  const list = paper ? inGroup.filter((q) => q.paper_id === paper) : inGroup;
  const a = allowance as { limit: number; used: number; remaining: number; plan: string } | null;
  const href = (g?: string, p?: string) => `/dashboard/written?${new URLSearchParams({ ...(g ? { group: g } : {}), ...(p ? { paper: p } : {}) })}`;

  return (
    <>
      <PageTitle title="Written answers" description="Practise Main Examination questions the way you would in the examination: write on paper and upload photos, or type your answer. Get AI-assisted feedback with indicative marks." />
      <EntrySummary userId={user.id} compact />
      <p className="mb-6 text-sm text-muted-foreground">{ME_RESULT_NOTE}</p>
      <div className="mb-6 flex flex-wrap items-center gap-3">
        <Link href="/dashboard/written/history" className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted">My submissions and feedback</Link>
        <Link href="/dashboard/exams?stage=ME" className="inline-flex h-10 items-center rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted">Full ME examination simulations</Link>
        {a ? <span className="text-sm text-muted-foreground">{a.remaining} of {a.limit} AI evaluations left{a.plan === "free" ? " (free account)" : ""}</span> : null}
      </div>

      <nav aria-label="Entry group" className="mb-3 flex flex-wrap gap-2">
        <Chip href={href()} active={!group}>All entry groups</Chip>
        {groups.map((g) => <Chip key={g.id} href={href(g.id)} active={group?.id === g.id}>{g.name}</Chip>)}
      </nav>
      {papers.length > 1 ? (
        <nav aria-label="Paper" className="mb-6 flex flex-wrap gap-2">
          <Chip href={href(group?.id)} active={!paper} small>All papers</Chip>
          {papers.map(([id, name]) => <Chip key={id} href={href(group?.id, id)} active={paper === id} small>{name}</Chip>)}
        </nav>
      ) : <div className="mb-6" />}

      {list.length === 0 ? (
        <Alert tone="info">No written questions are published for this selection yet. They will appear here as the Soma ME question bank grows.</Alert>
      ) : (
        <ul className="space-y-3">
          {list.map((q) => (
            <li key={q.id} className="rounded-xl border border-border p-4 sm:p-5">
              <div className="flex flex-wrap gap-2 text-xs">
                {q.paper ? <Badge tone="outline">{q.paper}</Badge> : null}
                {q.subject ? <Badge tone="neutral">{q.subject}</Badge> : null}
                {q.exam_year ? <Badge tone="neutral">BCSE {q.exam_year}</Badge> : null}
                {q.is_free_sample ? <Badge tone="green">Free</Badge> : null}
                <span className="text-muted-foreground">{Number(q.marks)} marks{q.word_limit ? ` · ~${q.word_limit} words` : ""}</span>
              </div>
              <p className="mt-2 line-clamp-3 whitespace-pre-wrap leading-relaxed text-ink">{q.stem}</p>
              <div className="mt-3 flex flex-wrap items-center justify-between gap-3">
                <span className="text-xs text-muted-foreground">
                  {q.attempts ? `Answered ${q.attempts} time${q.attempts === 1 ? "" : "s"}` : "Not attempted"}
                  {q.last_score !== null && q.last_max ? ` · last indicative score ${Number(q.last_score)}/${Number(q.last_max)}` : ""}
                </span>
                {q.has_access ? <StartWritten questionId={q.id} wordLimit={q.word_limit} /> : (
                  <span className="inline-flex items-center gap-1.5 text-sm text-muted-foreground"><Lock className="size-4" aria-hidden /> ME Premium</span>
                )}
              </div>
            </li>
          ))}
        </ul>
      )}
      <p className="mt-8 text-xs text-muted-foreground">AI evaluations are indicative practice feedback. They are not official RCSC marks and do not predict examination results.</p>
    </>
  );
}

function Chip({ href, active, children, small }: { href: string; active: boolean; children: React.ReactNode; small?: boolean }) {
  return <Link href={href} className={cn("rounded-full border font-medium", small ? "px-3 py-1 text-xs" : "px-4 py-1.5 text-sm", active ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>{children}</Link>;
}
