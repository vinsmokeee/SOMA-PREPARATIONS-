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
    db.from("specialisations").select("id, name").eq("is_active", true).order("sort_order"),
    db.from("subject_groups").select("id, name").eq("is_active", true).order("sort_order"),
  ]);
  return {
    subjects: subjects.data ?? [],
    topics: topics.data ?? [],
    papers: papers.data ?? [],
    categories: categories.data ?? [],
    specialisations: specialisations.data ?? [],
    groups: groups.data ?? [],
  };
}

export { STATUS_LABELS, STATUS_TONES } from "./question-labels";
