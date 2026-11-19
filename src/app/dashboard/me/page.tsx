import type { Metadata } from "next";
import { EntryPicker, ExamArea, MeLocked } from "@/components/student/exam-flow";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { loadArea, loadMePapers, loadPackage } from "@/lib/student/area";
import { entryComplete, loadExamState } from "@/lib/student/exam-state";

export const metadata: Metadata = { title: "ME" };

const ERRORS: Record<string, string> = {
  locked: "Your ME entry is fixed while your ME subscription is active. Contact support to change it.",
  "not-offered": "Soma does not offer preparation for that entry yet.",
  mismatch: "Please choose again.",
  failed: "Could not save. Please try again.",
};

/** ME: choose your entry; without ME Premium the papers are locked; with it, the ME area. */
export default async function MePage({ searchParams }: PageProps<"/dashboard/me">) {
  const user = await requireUser("/dashboard/me");
  const sp = await searchParams;
  const state = await loadExamState(user.id);
  const changing = sp.change === "1";
  const catParam = typeof sp.cat === "string" ? sp.cat : null;
  if (!entryComplete(state.entry) || changing || catParam) {
    const db = await createClient();
    const [{ data: categories }, { data: specialisations }, { data: groups }] = await Promise.all([
      db.from("exam_categories").select("id, code, name").eq("is_active", true).eq("is_offered", true).order("sort_order"),
      db.from("specialisations").select("id, name, category_id, sort_order").eq("is_active", true).order("sort_order").order("name"),
      db.from("subject_groups").select("id, name").eq("is_active", true).order("sort_order"),
    ]);
    const cat = catParam;
    const spec = typeof sp.spec === "string" ? sp.spec : null;
    return (
      <EntryPicker
        options={{ categories: categories ?? [], specialisations: specialisations ?? [], groups: groups ?? [] }}
        cat={cat}
        spec={spec}
        error={typeof sp.error === "string" ? ERRORS[sp.error] ?? ERRORS.failed : null}
      />
    );
  }
  // ME is Premium only: without it the student sees their papers locked and Join ME Premium.
  if (!state.premium.ME) {
    const [papers, pkg] = await Promise.all([loadMePapers(state.entry.categoryId), loadPackage("ME")]);
    return <MeLocked entryLabel={state.entry.label} papers={papers} pkg={pkg} />;
  }
  return <ExamArea d={await loadArea("ME", state)} />;
}
