import type { Metadata } from "next";
import Link from "next/link";
import { ChevronLeft, ChevronRight, FolderOpen } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { DraftReviewQueue, type ReviewDraft } from "@/components/admin/draft-review-queue";
import { PublishBatch } from "@/components/admin/publish-batch";
import { cn } from "@/lib/utils";
import { can, requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Review AI drafts" };

const canPublishBatches = (user: Parameters<typeof can>[0]) => can(user, "questions.publish");

/** Batches of Claude-written questions can be published with one tap. */
export const maxDuration = 120;

/** A batch name is "<subject>: <year/part>"; the part before the colon is the section the founder taps. */
const sectionOf = (batch: string) => (batch.includes(":") ? batch.slice(0, batch.indexOf(":")) : batch).trim();
const OTHER = "other";

export default async function AiReviewPage({ searchParams }: PageProps<"/admin/ai/review">) {
  const user = await requirePermission("questions.review", "/admin/ai/review");
  const sp = await searchParams;
  const filter = sp.show === "flagged" || sp.show === "passed" ? sp.show : "all";
  const section = typeof sp.section === "string" && sp.section ? sp.section : null;
  const onlyBatch = typeof sp.batch === "string" && sp.batch ? sp.batch : null;
  const db = await createClient();
  // AI drafts, plus every question loaded in a named batch (for ME this includes the real RCSC questions with Soma's model answers).
  const DRAFTS = "origin.in.(ai_generated,ai_variation),ai_review->>batch.not.is.null";
  const WAITING = ["ai_generated", "awaiting_review", "verified"];
  const [{ data: batchRows }, { count: otherCount }] = await Promise.all([
    db.rpc("question_batches_waiting"),
    db.from("questions").select("id", { count: "exact", head: true }).or(DRAFTS).in("status", WAITING).is("ai_review->>batch", null),
  ]);
  const batches = ((batchRows ?? []) as { batch: string; waiting: number }[]).map((b) => ({ ...b, waiting: Number(b.waiting) }));
  const sections = new Map<string, { batches: number; waiting: number }>();
  for (const b of batches) {
    const k = sectionOf(b.batch);
    const cur = sections.get(k) ?? { batches: 0, waiting: 0 };
    sections.set(k, { batches: cur.batches + 1, waiting: cur.waiting + b.waiting });
  }
  const sectionList = [...sections.entries()].sort(([a], [b]) => a.localeCompare(b));

  // Home: one tile per subject section. Tap a tile to see only that section's drafts.
  if (!section) {
    return (
      <>
        <PageTitle title="Review AI drafts" description="Drafts are sorted by subject and paper. Tap a section to see only its questions." />
        <div className="mb-4 flex justify-end text-sm">
          <Link href="/admin/ai/variations" className="font-medium text-primary hover:underline">Create variations</Link>
        </div>
        {sectionList.length === 0 && !otherCount ? (
          <p className="rounded-xl border border-dashed border-border-strong p-8 text-center text-sm text-muted-foreground">No drafts waiting. Create variations to grow the question bank.</p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2" aria-label="Sections">
            {sectionList.map(([name, s]) => (
              <li key={name}>
                <Link href={`/admin/ai/review?section=${encodeURIComponent(name)}`} className="flex items-center gap-3 rounded-2xl border border-border bg-white p-4 hover:border-primary">
                  <FolderOpen className="size-5 shrink-0 text-primary" aria-hidden />
                  <span className="flex-1">
                    <span className="block font-bold text-ink">{name}</span>
                    <span className="block text-sm text-muted-foreground">{s.waiting} question{s.waiting === 1 ? "" : "s"} waiting · {s.batches} batch{s.batches === 1 ? "" : "es"}</span>
                  </span>
                  <ChevronRight className="size-5 shrink-0 text-muted-foreground" aria-hidden />
                </Link>
              </li>
            ))}
            {otherCount ? (
              <li>
                <Link href={`/admin/ai/review?section=${OTHER}`} className="flex items-center gap-3 rounded-2xl border border-border bg-white p-4 hover:border-primary">
                  <FolderOpen className="size-5 shrink-0 text-primary" aria-hidden />
                  <span className="flex-1">
                    <span className="block font-bold text-ink">Other AI drafts and variations</span>
                    <span className="block text-sm text-muted-foreground">{otherCount} question{otherCount === 1 ? "" : "s"} waiting (not in a batch)</span>
                  </span>
                  <ChevronRight className="size-5 shrink-0 text-muted-foreground" aria-hidden />
                </Link>
              </li>
            ) : null}
          </ul>
        )}
      </>
    );
  }

  const isOther = section === OTHER;
  let q = db.from("questions")
    .select("id, status, stem, question_type, origin, variation_type, difficulty, explanation, model_answer, ai_review, parent_question_id, subjects(name), question_options(body, is_correct, position)", { count: "exact" })
    .or(DRAFTS).in("status", WAITING)
    .order("created_at", { ascending: true }).limit(400);
  if (isOther) q = q.is("ai_review->>batch", null);
  else if (onlyBatch) q = q.eq("ai_review->>batch", onlyBatch);
  else q = q.like("ai_review->>batch", `${section.replace(/[\\%_]/g, "\\$&")}:%`);
  if (filter === "flagged") q = q.eq("ai_review->>verdict", "flag");
  if (filter === "passed") q = q.eq("ai_review->>verdict", "pass");
  const { data, count } = await q;
  const waiting = count ?? 0;
  const parents = [...new Set((data ?? []).map((d) => d.parent_question_id).filter(Boolean))] as string[];
  const { data: sources } = parents.length ? await db.from("questions").select("id, stem, origin").in("id", parents) : { data: [] };
  const drafts: ReviewDraft[] = (data ?? []).map((d) => ({
    id: d.id, status: d.status, stem: d.stem, question_type: d.question_type, origin: d.origin, variation_type: d.variation_type, difficulty: d.difficulty,
    subject: (d.subjects as unknown as { name: string } | null)?.name ?? null,
    options: [...((d.question_options ?? []) as { body: string; is_correct: boolean; position: number }[])].sort((a, b) => a.position - b.position),
    explanation: d.explanation, model_answer: d.model_answer, ai_review: d.ai_review as ReviewDraft["ai_review"],
    source: (sources ?? []).find((s) => s.id === d.parent_question_id) ?? null,
  }));
  const sectionBatches = isOther ? [] : batches.filter((b) => sectionOf(b.batch) === section).sort((a, b) => a.batch.localeCompare(b.batch));
  const here = (extra: Record<string, string | null>) => {
    const p = new URLSearchParams({ section });
    if (onlyBatch) p.set("batch", onlyBatch);
    if (filter !== "all") p.set("show", filter);
    for (const [k, v] of Object.entries(extra)) { if (v === null) p.delete(k); else p.set(k, v); }
    return `/admin/ai/review?${p.toString()}`;
  };

  return (
    <>
      <Link href="/admin/ai/review" className="mb-3 inline-flex items-center gap-1 text-sm font-medium text-primary hover:underline">
        <ChevronLeft className="size-4" aria-hidden /> All sections
      </Link>
      <PageTitle
        title={isOther ? "Other AI drafts and variations" : section}
        description={onlyBatch ? `Showing only: ${onlyBatch}` : "Each draft was checked automatically by a second AI that answered it without seeing the key; flagged drafts need a closer look."}
      />
      {canPublishBatches(user) && sectionBatches.length ? (
        <section aria-label="Batches waiting" className="mb-6 grid gap-3 sm:grid-cols-2">
          {sectionBatches.map((b) => (
            <div key={b.batch}>
              <PublishBatch batch={b.batch} waiting={b.waiting} />
              {sectionBatches.length > 1 ? (
                <Link href={onlyBatch === b.batch ? here({ batch: null }) : here({ batch: b.batch })} className="mt-1 inline-block px-1 text-sm font-medium text-primary hover:underline">
                  {onlyBatch === b.batch ? "Show all years again" : "Show only this batch"}
                </Link>
              ) : null}
            </div>
          ))}
        </section>
      ) : null}
      <nav className="mb-4 flex gap-2 text-sm" aria-label="Filter drafts">
        {[["all", "All"], ["flagged", "Flagged"], ["passed", "Passed the check"]].map(([k, l]) => (
          <Link key={k} href={here({ show: k === "all" ? null : k })}
            className={cn("rounded-full border px-3 py-1", filter === k ? "border-primary bg-primary text-white" : "border-border-strong")}>{l}</Link>
        ))}
      </nav>
      {waiting > drafts.length && (
        <p role="status" className="mb-4 rounded-xl border border-amber-300 bg-amber-50 p-3 text-sm text-amber-900">
          <strong>{waiting} drafts are waiting.</strong> Showing the first {drafts.length}. Tap &ldquo;Show only this batch&rdquo; to see one year at a time.
        </p>
      )}
      {drafts.length === 0 ? (
        <p className="rounded-xl border border-dashed border-border-strong p-8 text-center text-sm text-muted-foreground">No drafts waiting in this section.</p>
      ) : (
        <DraftReviewQueue drafts={drafts} canPublish={can(user, "questions.publish")} />
      )}
    </>
  );
}
