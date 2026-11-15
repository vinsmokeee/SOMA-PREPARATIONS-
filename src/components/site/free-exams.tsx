import Link from "next/link";
import { Clock3, FileText } from "lucide-react";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { getPublishedExams } from "@/lib/data/public";

/** Lists free published examinations, or explains that they are being prepared. */
export async function FreeExams({ emptyTitle, emptyText }: { emptyTitle: string; emptyText: string }) {
  const result = await getPublishedExams();
  const free = result.ok ? result.data.filter((e) => e.is_free && e.question_count > 0) : [];
  if (free.length === 0) {
    return <Alert tone="info" title={emptyTitle}>{emptyText}</Alert>;
  }
  return (
    <div className="space-y-4">
      <ul className="grid gap-4 sm:grid-cols-2">
        {free.map((e) => (
          <li key={e.id} className="flex flex-col rounded-xl border border-border p-5">
            <div className="flex gap-2"><Badge tone="solid">{e.stage}</Badge><Badge tone="green">Free</Badge></div>
            <p className="mt-3 font-serif text-xl font-semibold text-ink">{e.title}</p>
            {e.description ? <p className="mt-1.5 text-sm leading-relaxed text-muted-foreground">{e.description}</p> : null}
            <p className="mt-3 flex gap-4 text-sm text-muted-foreground">
              <span className="inline-flex items-center gap-1.5"><Clock3 className="size-4" aria-hidden /> {e.duration_minutes} min</span>
              <span className="inline-flex items-center gap-1.5"><FileText className="size-4" aria-hidden /> {e.question_count} questions</span>
            </p>
            <div className="flex-1" />
            <Button asChild className="mt-5 h-11">
              <Link href={`/dashboard/exams/${e.slug}`}>Start free examination</Link>
            </Button>
          </li>
        ))}
      </ul>
      <p className="text-sm text-muted-foreground">You will be asked to sign in or create a free account so your results are saved.</p>
    </div>
  );
}
