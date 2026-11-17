import "server-only";
import { createClient } from "@/lib/supabase/server";
import type { ExamState } from "./exam-state";

/** One of the student's three ME papers, with what it covers for them and how many questions they can practise. */
export type MyPaper = { id: string; number: number | null; title: string; detail: string | null; questions: number };

export const ROMAN = ["", "I", "II", "III", "IV"];

/** The ME papers of the student's entry (Paper I, II, III), in order. */
export async function loadMyPapers(entry: ExamState["entry"]): Promise<MyPaper[]> {
  if (!entry.categoryId) return [];
  const db = await createClient();
  const [{ data: links }, { data: spec }, { data: own }, { data: qs }] = await Promise.all([
    db.from("exam_paper_categories").select("exam_papers(id, paper_number, title, stage, bank_scope, sort_order)").eq("category_id", entry.categoryId),
    entry.specialisationId
      ? db.from("specialisations").select("name, subject_groups(name)").eq("id", entry.specialisationId).maybeSingle()
      : Promise.resolve({ data: null }),
    entry.subjectGroupId
      ? db.from("subject_groups").select("name").eq("id", entry.subjectGroupId).maybeSingle()
      : Promise.resolve({ data: null }),
    db.rpc("written_practice_questions"),
  ]);
  const specName = (spec as { name: string } | null)?.name ?? null;
  const groupName = (own as { name: string } | null)?.name ?? ((spec as { subject_groups: { name: string } | null } | null)?.subject_groups?.name ?? null);
  const counts = new Map<string, number>();
  for (const q of (qs ?? []) as { paper_id: string | null }[]) if (q.paper_id) counts.set(q.paper_id, (counts.get(q.paper_id) ?? 0) + 1);
  type P = { id: string; paper_number: number | null; title: string; stage: string; bank_scope: string; sort_order: number };
  return ((links ?? []) as unknown as { exam_papers: P | null }[])
    .map((l) => l.exam_papers)
    .filter((p): p is P => Boolean(p && p.stage === "ME"))
    .sort((a, b) => (a.paper_number ?? 9) - (b.paper_number ?? 9) || a.sort_order - b.sort_order)
    .map((p) => ({
      id: p.id,
      number: p.paper_number,
      title: p.title,
      detail: p.bank_scope === "specialisation" ? specName : p.bank_scope === "subject_group" ? (groupName ? `${groupName} group` : null) : null,
      questions: counts.get(p.id) ?? 0,
    }));
}
