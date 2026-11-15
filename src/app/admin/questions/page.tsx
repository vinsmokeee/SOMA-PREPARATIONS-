import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { QuestionList, type ListRow } from "@/components/admin/question-list";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import { STATUS_LABELS } from "@/lib/admin/question-labels";
import { TYPE_LABELS } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { QUESTION_TYPES } from "@/lib/validation/question";

export const metadata: Metadata = { title: "Question bank" };

const STATUSES = ["awaiting_review", "draft", "revision_requested", "verified", "published", "rejected", "archived", "ai_generated"];
const PAGE_SIZE = 50;
const str = (v: unknown) => (typeof v === "string" ? v : "");

export default async function QuestionsPage({ searchParams }: PageProps<"/admin/questions">) {
  await requirePermission("admin.access", "/admin/questions");
  const p = await searchParams;
  const status = STATUSES.includes(str(p.status)) ? str(p.status) : "";
  const stage = p.stage === "PE" || p.stage === "ME" ? p.stage : "";
  const type = (QUESTION_TYPES as readonly string[]).includes(str(p.type)) ? str(p.type) : "";
  const difficulty = ["foundation", "standard", "advanced"].includes(str(p.difficulty)) ? str(p.difficulty) : "";
  const origin = ["original", "ai_generated", "historical_official", "current_affairs"].includes(str(p.origin)) ? str(p.origin) : "";
  const subject = /^[0-9a-f-]{36}$/.test(str(p.subject)) ? str(p.subject) : "";
  const q = str(p.q).trim().slice(0, 100);
  const page = Math.max(1, Number(str(p.page)) || 1);

  const db = await createClient();
  let query = db
    .from("questions")
    .select("id, stage, question_type, stem, status, difficulty, origin, updated_at, subjects(name)", { count: "exact" })
    .order("updated_at", { ascending: false })
    .range((page - 1) * PAGE_SIZE, page * PAGE_SIZE - 1);
  query = status ? query.eq("status", status) : query.neq("status", "archived");
  if (stage) query = query.eq("stage", stage);
  if (type) query = query.eq("question_type", type);
  if (difficulty) query = query.eq("difficulty", difficulty);
  if (origin) query = query.eq("origin", origin);
  if (subject) query = query.eq("subject_id", subject);
  if (q) query = query.ilike("stem", `%${q.replace(/[%_\\]/g, (m) => `\\${m}`)}%`);
  const [{ data, error, count }, counts, subjects] = await Promise.all([
    query,
    db.from("questions").select("status"),
    db.from("subjects").select("id, stage, name").eq("is_active", true).order("sort_order"),
  ]);
  const rows: ListRow[] = ((data ?? []) as unknown as (Omit<ListRow, "subject"> & { subjects: { name: string } | null })[]).map(({ subjects: s, ...r }) => ({ ...r, subject: s?.name ?? null }));
  const byStatus = new Map<string, number>();
  for (const r of (counts.data ?? []) as { status: string }[]) byStatus.set(r.status, (byStatus.get(r.status) ?? 0) + 1);
  const pages = Math.max(1, Math.ceil((count ?? 0) / PAGE_SIZE));
  const qs = (n: number) => {
    const sp = new URLSearchParams(Object.entries({ status, stage, type, difficulty, origin, subject, q }).filter(([, v]) => v) as [string, string][]);
    sp.set("page", String(n));
    return `/admin/questions?${sp.toString()}`;
  };

  return (
    <>
      <PageTitle
        title="Question bank"
        description="Every question goes Draft → Awaiting review → Verified → Published. Nothing reaches students until it is published."
        actions={
          <>
            <Button asChild variant="secondary"><Link href="/admin/questions/import">Import CSV</Link></Button>
            <Button asChild><Link href="/admin/questions/new">New question</Link></Button>
          </>
        }
      />
      <div className="mb-4 flex flex-wrap gap-2 text-sm">
        {["awaiting_review", "verified", "published", "draft", "revision_requested"].map((s) => (
          <Link key={s} href={`/admin/questions?status=${s}`} className="rounded-full border border-border-strong px-3 py-1 hover:bg-muted">
            {STATUS_LABELS[s]} <span className="tabular-nums text-muted-foreground">{byStatus.get(s) ?? 0}</span>
          </Link>
        ))}
      </div>
      <form className="mb-6 grid gap-2 sm:grid-cols-2 lg:grid-cols-4" role="search">
        <Input name="q" defaultValue={q} placeholder="Search question text" aria-label="Search question text" className="h-10 lg:col-span-2" />
        <Select name="status" defaultValue={status} aria-label="Status" className="h-10">
          <option value="">All except archived</option>
          {STATUSES.map((s) => <option key={s} value={s}>{STATUS_LABELS[s]}</option>)}
        </Select>
        <Select name="stage" defaultValue={stage} aria-label="Stage" className="h-10">
          <option value="">PE and ME</option><option value="PE">PE</option><option value="ME">ME</option>
        </Select>
        <Select name="subject" defaultValue={subject} aria-label="Subject" className="h-10">
          <option value="">All subjects</option>
          {(subjects.data ?? []).map((s) => <option key={s.id} value={s.id}>{s.stage} · {s.name}</option>)}
        </Select>
        <Select name="type" defaultValue={type} aria-label="Type" className="h-10">
          <option value="">All types</option>
          {QUESTION_TYPES.map((t) => <option key={t} value={t}>{TYPE_LABELS[t]}</option>)}
        </Select>
        <Select name="difficulty" defaultValue={difficulty} aria-label="Difficulty" className="h-10">
          <option value="">Any difficulty</option><option value="foundation">Foundation</option><option value="standard">Standard</option><option value="advanced">Advanced</option>
        </Select>
        <Select name="origin" defaultValue={origin} aria-label="Origin" className="h-10">
          <option value="">Any origin</option><option value="original">Original (Soma)</option><option value="historical_official">Past paper</option><option value="ai_generated">AI-assisted</option><option value="current_affairs">Current affairs</option>
        </Select>
        <Button type="submit" variant="secondary" className="h-10 lg:col-span-4 lg:w-40">Filter</Button>
      </form>
      {error ? <p className="text-sm text-danger">Questions could not be loaded.</p> : null}
      <p className="mb-3 text-sm text-muted-foreground">{count ?? 0} question{count === 1 ? "" : "s"}{pages > 1 ? ` · page ${page} of ${pages}` : ""}</p>
      {rows.length === 0 && !error ? <p className="text-sm text-muted-foreground">No questions match.</p> : <QuestionList rows={rows} />}
      {pages > 1 ? (
        <nav className="mt-6 flex items-center justify-between text-sm" aria-label="Pages">
          {page > 1 ? <Link href={qs(page - 1)} className="font-medium text-primary hover:underline">← Previous</Link> : <span />}
          {page < pages ? <Link href={qs(page + 1)} className="font-medium text-primary hover:underline">Next →</Link> : <span />}
        </nav>
      ) : null}
    </>
  );
}
