import "server-only";
import type { EditorLookups } from "@/components/admin/question-editor";
import { createClient } from "@/lib/supabase/server";

export async function loadQuestionLookups(): Promise<EditorLookups> {
  const db = await createClient();
  const [subjects, topics, papers, categories] = await Promise.all([
    db.from("subjects").select("id, stage, name").eq("is_active", true).order("sort_order"),
    db.from("topics").select("id, subject_id, parent_id, name").eq("is_active", true).order("sort_order").order("name"),
    db.from("exam_papers").select("id, stage, title, code").order("sort_order"),
    db.from("exam_categories").select("id, name").eq("is_active", true).order("sort_order"),
  ]);
  return {
    subjects: subjects.data ?? [],
    topics: topics.data ?? [],
    papers: papers.data ?? [],
    categories: categories.data ?? [],
  };
}

export { STATUS_LABELS, STATUS_TONES } from "./question-labels";
