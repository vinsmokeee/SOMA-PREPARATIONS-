import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "My written answers" };

type Item = {
  id: string; saved_at: string; answer_mode: string; word_count: number | null; transcript_status: string | null; attempt_status: string; exam_title: string; is_practice: boolean;
  stem: string; marks: number; subject: string | null; paper: string | null; category: string | null; exam_year: number | null; pages: number;
  evaluation_status: string | null; score: number | null; max_score: number | null; scored: boolean | null;
};

function status(i: Item): { label: string; tone: "green" | "warning" | "neutral" | "danger" } {
  if (i.evaluation_status === "completed") return { label: i.scored && i.score !== null ? `${Number(i.score)}/${Number(i.max_score)} indicative` : "Feedback ready", tone: "green" };
  if (i.evaluation_status === "queued" || i.evaluation_status === "in_progress") return { label: "Evaluating", tone: "warning" };
  if (i.evaluation_status === "failed") return { label: "Evaluation failed", tone: "danger" };
  if (i.answer_mode === "handwritten" && i.transcript_status !== "confirmed") return { label: i.transcript_status === "needs_review" ? "Check text" : "Pages uploaded", tone: "warning" };
  return { label: "Not evaluated", tone: "neutral" };
}

export default async function WrittenHistoryPage() {
  await requireUser("/dashboard/written/history");
  const db = await createClient();
  const { data } = await db.rpc("my_written_answers", { _limit: 200 });
  const items = (data ?? []) as Item[];
  return (
    <>
      <PageTitle title="My written answers" description="Every written answer you have submitted, with its method, photos, text and AI feedback." />
      {items.length === 0 ? (
        <p className="text-sm text-muted-foreground">No written answers yet. Start from <Link href="/dashboard/written" className="font-medium text-primary hover:underline">Written answers</Link>.</p>
      ) : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {items.map((i) => {
            const s = status(i);
            return (
              <li key={i.id}>
                <Link href={i.attempt_status === "in_progress" ? "#" : `/dashboard/written/${i.id}`} className="block p-4 hover:bg-muted/50">
                  <div className="flex flex-wrap items-center gap-2 text-xs">
                    <Badge tone={s.tone}>{s.label}</Badge>
                    <Badge tone="outline">{i.answer_mode === "handwritten" ? `Handwritten · ${i.pages} page${i.pages === 1 ? "" : "s"}` : "Typed"}</Badge>
                    <span className="text-muted-foreground">{formatDate(i.saved_at)} · {i.is_practice ? "Practice" : i.exam_title}</span>
                  </div>
                  <p className="mt-2 line-clamp-2 text-sm text-ink">{i.stem}</p>
                  <p className="mt-1 text-xs text-muted-foreground">{[i.category, i.paper, i.subject, i.exam_year ? `BCSE ${i.exam_year}` : null].filter(Boolean).join(" · ")}</p>
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </>
  );
}
