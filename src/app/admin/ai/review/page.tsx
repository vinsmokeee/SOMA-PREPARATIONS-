import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { DraftReviewQueue, type ReviewDraft } from "@/components/admin/draft-review-queue";
import { cn } from "@/lib/utils";
import { can, requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Review AI drafts" };

export default async function AiReviewPage({ searchParams }: PageProps<"/admin/ai/review">) {
  const user = await requirePermission("questions.review", "/admin/ai/review");
  const sp = await searchParams;
  const filter = sp.show === "flagged" || sp.show === "passed" ? sp.show : "all";
  const db = await createClient();
  let q = db.from("questions")
    .select("id, status, stem, question_type, origin, variation_type, difficulty, explanation, model_answer, ai_review, parent_question_id, subjects(name), question_options(body, is_correct, position)")
    .in("origin", ["ai_generated", "ai_variation"]).in("status", ["ai_generated", "awaiting_review", "verified"])
    .order("created_at", { ascending: false }).limit(50);
  if (filter === "flagged") q = q.eq("ai_review->>verdict", "flag");
  if (filter === "passed") q = q.eq("ai_review->>verdict", "pass");
  const { data } = await q;
  const parents = [...new Set((data ?? []).map((d) => d.parent_question_id).filter(Boolean))] as string[];
  const { data: sources } = parents.length ? await db.from("questions").select("id, stem, origin").in("id", parents) : { data: [] };
  const drafts: ReviewDraft[] = (data ?? []).map((d) => ({
    id: d.id, status: d.status, stem: d.stem, question_type: d.question_type, origin: d.origin, variation_type: d.variation_type, difficulty: d.difficulty,
    subject: (d.subjects as unknown as { name: string } | null)?.name ?? null,
    options: [...((d.question_options ?? []) as { body: string; is_correct: boolean; position: number }[])].sort((a, b) => a.position - b.position),
    explanation: d.explanation, model_answer: d.model_answer, ai_review: d.ai_review as ReviewDraft["ai_review"],
    source: (sources ?? []).find((s) => s.id === d.parent_question_id) ?? null,
  }));

  return (
    <>
      <PageTitle
        title="Review AI drafts"
        description="AI-written questions and variations waiting for your decision. Each was checked automatically by a second AI that answered it without seeing the key; flagged drafts need a closer look."
      />
      <nav className="mb-4 flex gap-2 text-sm" aria-label="Filter drafts">
        {[["all", "All"], ["flagged", "Flagged"], ["passed", "Passed the check"]].map(([k, l]) => (
          <Link key={k} href={k === "all" ? "/admin/ai/review" : `/admin/ai/review?show=${k}`}
            className={cn("rounded-full border px-3 py-1", filter === k ? "border-primary bg-primary text-white" : "border-border-strong")}>{l}</Link>
        ))}
        <Link href="/admin/ai/variations" className="ml-auto font-medium text-primary hover:underline">Create variations</Link>
      </nav>
      {drafts.length === 0 ? (
        <p className="rounded-xl border border-dashed border-border-strong p-8 text-center text-sm text-muted-foreground">No drafts waiting. Create variations to grow the question bank.</p>
      ) : (
        <DraftReviewQueue drafts={drafts} canPublish={can(user, "questions.publish")} />
      )}
    </>
  );
}
