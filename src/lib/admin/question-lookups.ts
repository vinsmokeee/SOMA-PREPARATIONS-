import "server-only";
import type { EditorLookups } from "@/components/admin/question-editor";
import { createClient } from "@/lib/supabase/server";

export async function loadQuestionLookups(): Promise<EditorLookups> {
  const db = await createClient();
  const [subjects, topics, papers, categories, specialisations, groups] = await Promise.all([
    db.from("subjects").select("id, stage, name").eq("is_active", true).order("sort_order"),
    db.from("topics").select("id, subject_id, parent_id, name").eq("is_active", true).order("sort_order").order("name"),
    db.from("exam_papers").select("id, stage, title, code, bank_scope").order("sort_order"),
    db.from("exam_categories").select("id, name").eq("is_active", true).order("sort_order"),
    // All specialisations and groups, including earlier-list ones, so old papers can be classified.
    db.from("specialisations").select("id, name, is_active, list_source").order("is_active", { ascending: false }).order("sort_order"),
    db.from("subject_groups").select("id, name, is_active").order("is_active", { ascending: false }).order("sort_order"),
  ]);
  return {
    subjects: subjects.data ?? [],
    topics: topics.data ?? [],
    papers: papers.data ?? [],
    categories: categories.data ?? [],
    specialisations: (specialisations.data ?? []).map((s) => ({ id: s.id, name: s.is_active ? s.name : `${s.name} (earlier list${s.list_source ? `: ${s.list_source}` : ""})` })),
    groups: (groups.data ?? []).map((g) => ({ id: g.id, name: g.is_active ? g.name : `${g.name} (not offered now)` })),
  };
}

export { STATUS_LABELS, STATUS_TONES } from "./question-labels";
