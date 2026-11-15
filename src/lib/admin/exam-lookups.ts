import "server-only";
import type { ExamLookups } from "@/components/admin/exam-settings-form";
import { createClient } from "@/lib/supabase/server";

export async function loadExamLookups(): Promise<ExamLookups> {
  const db = await createClient();
  const [cycles, papers, categories] = await Promise.all([
    db.from("exam_cycles").select("id, name").order("year", { ascending: false }),
    db.from("exam_papers").select("id, stage, title").order("sort_order"),
    db.from("exam_categories").select("id, name").eq("is_active", true).order("sort_order"),
  ]);
  return { cycles: cycles.data ?? [], papers: papers.data ?? [], categories: categories.data ?? [] };
}
