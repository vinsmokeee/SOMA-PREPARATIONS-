import Link from "next/link";
import { Alert } from "@/components/ui/alert";
import { createClient } from "@/lib/supabase/server";

type Entry = { pathway: string | null; group: string | null; category: string | null; specialisation: string | null; paper2: string | null };

/** The signed-in student's examination entry (pathway, category, specialisation). */
export async function loadMyEntry(userId: string): Promise<Entry> {
  const db = await createClient();
  const { data } = await db
    .from("profiles")
    .select("pathway, exam_categories(name, public_group), specialisations(name), subject_groups(name)")
    .eq("id", userId)
    .maybeSingle();
  const cat = data?.exam_categories as unknown as { name: string; public_group: string | null } | null;
  const spec = data?.specialisations as unknown as { name: string } | null;
  const sg = data?.subject_groups as unknown as { name: string } | null;
  return { pathway: data?.pathway ?? null, group: cat?.public_group ?? null, category: cat?.name ?? null, specialisation: spec?.name ?? null, paper2: sg?.name ?? null };
}

export function entryLabel(e: Entry): string {
  if (!e.group) return "ME pathway not chosen";
  return [e.category, e.specialisation, e.paper2 ? `Paper II: ${e.paper2}` : null].filter(Boolean).join(" · ");
}

/** Shows the student's ME entry, or asks them to choose one so ME content can be matched. */
export async function EntrySummary({ userId, compact = false }: { userId: string; compact?: boolean }) {
  const e = await loadMyEntry(userId);
  if (!e.group) {
    return (
      <Alert tone="info" title="Choose your ME pathway" className="mb-6">
        ME papers differ for General, Technical and Dzongkha graduates, and by technical specialisation. Choose yours to see
        the right ME practice. <Link href="/dashboard/welcome" className="font-medium text-primary underline">Choose now</Link>
      </Alert>
    );
  }
  return (
    <p className={compact ? "mb-6 text-sm text-muted-foreground" : "mb-6 rounded-lg border border-border px-4 py-3 text-sm text-muted-foreground"}>
      Your ME entry: <span className="font-medium text-ink">{entryLabel(e)}</span>{" "}
      <Link href="/dashboard/welcome" className="font-medium text-primary hover:underline">Change</Link>
    </p>
  );
}
