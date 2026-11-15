import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { TYPE_LABELS, type QuestionType } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Question bank" };

type Row = {
  id: string;
  stage: string;
  question_type: QuestionType;
  stem: string;
  status: string;
  difficulty: string;
  updated_at: string;
  subjects: { name: string } | null;
};

const STATUSES = ["awaiting_review", "draft", "revision_requested", "verified", "published", "rejected", "archived", "ai_generated"];

export default async function QuestionsPage({ searchParams }: PageProps<"/admin/questions">) {
  await requirePermission("admin.access", "/admin/questions");
  const p = await searchParams;
  const status = typeof p.status === "string" && STATUSES.includes(p.status) ? p.status : "";
  const stage = p.stage === "PE" || p.stage === "ME" ? p.stage : "";
  const q = typeof p.q === "string" ? p.q.trim().slice(0, 100) : "";

  const db = await createClient();
  let query = db.from("questions").select("id, stage, question_type, stem, status, difficulty, updated_at, subjects(name)").order("updated_at", { ascending: false }).limit(200);
  if (status) query = query.eq("status", status);
  else query = query.neq("status", "archived");
  if (stage) query = query.eq("stage", stage);
  if (q) query = query.ilike("stem", `%${q.replace(/[%_]/g, (m) => `\\${m}`)}%`);
  const [{ data, error }, counts] = await Promise.all([query, db.from("questions").select("status")]);
  const rows = (data ?? []) as unknown as Row[];
  const byStatus = new Map<string, number>();
  for (const r of (counts.data ?? []) as { status: string }[]) byStatus.set(r.status, (byStatus.get(r.status) ?? 0) + 1);

  return (
    <>
      <PageTitle
        title="Question bank"
        description="Every question goes Draft → Awaiting review → Verified → Published. Nothing reaches students until it is published."
        actions={<Button asChild><Link href="/admin/questions/new">New question</Link></Button>}
      />
      <div className="mb-4 flex flex-wrap gap-2 text-sm">
        {["awaiting_review", "verified", "published", "draft", "revision_requested"].map((s) => (
          <Link key={s} href={`/admin/questions?status=${s}`} className="rounded-full border border-border-strong px-3 py-1 hover:bg-muted">
            {STATUS_LABELS[s]} <span className="tabular-nums text-muted-foreground">{byStatus.get(s) ?? 0}</span>
          </Link>
        ))}
      </div>
      <form className="mb-6 grid gap-2 sm:grid-cols-[1fr_180px_120px_auto]" role="search">
        <Input name="q" defaultValue={q} placeholder="Search question text" aria-label="Search question text" className="h-10" />
        <Select name="status" defaultValue={status} aria-label="Status" className="h-10">
          <option value="">All except archived</option>
          {STATUSES.map((s) => <option key={s} value={s}>{STATUS_LABELS[s]}</option>)}
        </Select>
        <Select name="stage" defaultValue={stage} aria-label="Stage" className="h-10">
          <option value="">PE and ME</option>
          <option value="PE">PE</option>
          <option value="ME">ME</option>
        </Select>
        <Button type="submit" variant="secondary" className="h-10">Filter</Button>
      </form>
      {error ? <p className="text-sm text-danger">Questions could not be loaded.</p> : null}
      {rows.length === 0 && !error ? <p className="text-sm text-muted-foreground">No questions match.</p> : null}
      <ul className="divide-y divide-border rounded-xl border border-border">
        {rows.map((r) => (
          <li key={r.id}>
            <Link href={`/admin/questions/${r.id}`} className="block p-4 hover:bg-muted/50">
              <div className="flex flex-wrap items-center gap-2 text-xs">
                <Badge tone={STATUS_TONES[r.status]}>{STATUS_LABELS[r.status]}</Badge>
                <Badge tone="outline">{r.stage}</Badge>
                <span className="text-muted-foreground">{TYPE_LABELS[r.question_type]} · {r.subjects?.name ?? "No subject"} · {r.difficulty}</span>
                <span className="ml-auto text-muted-foreground">{formatDate(r.updated_at)}</span>
              </div>
              <p className="mt-2 line-clamp-2 text-[15px] text-ink">{r.stem}</p>
            </Link>
          </li>
        ))}
      </ul>
    </>
  );
}
