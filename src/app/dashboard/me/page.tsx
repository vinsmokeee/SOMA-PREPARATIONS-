import type { Metadata } from "next";
import { EntryPicker, ExamArea, FREE_POINTS, PackageChoice } from "@/components/student/exam-flow";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { loadArea, loadPackage } from "@/lib/student/area";
import { entryComplete, loadExamState } from "@/lib/student/exam-state";

export const metadata: Metadata = { title: "ME" };

const ERRORS: Record<string, string> = {
  locked: "Your ME entry is fixed while your ME subscription is active. Contact support to change it.",
  "not-offered": "Soma does not offer preparation for that entry yet.",
  mismatch: "Please choose again.",
  failed: "Could not save. Please try again.",
};

/** ME: choose your entry, then Free or Premium, then the ME area. */
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
    // A Technical student who has a specialisation but no Paper II group yet goes straight to that step.
    const resume = !catParam && !changing && state.entry.code === "technical" && state.entry.specialisationId;
    const cat = catParam ?? (resume ? "technical" : null);
    const spec = typeof sp.spec === "string" ? sp.spec : resume ? state.entry.specialisationId : null;
    return (
      <EntryPicker
        options={{ categories: categories ?? [], specialisations: specialisations ?? [], groups: groups ?? [] }}
        cat={cat}
        spec={spec}
        error={typeof sp.error === "string" ? ERRORS[sp.error] ?? ERRORS.failed : null}
      />
    );
  }
  if (!state.started.ME || sp.plans === "1") {
    return <PackageChoice stage="ME" entryLabel={state.entry.label} pkg={await loadPackage("ME")} free={FREE_POINTS.ME} onFree={state.started.ME} />;
  }
  return <ExamArea d={await loadArea("ME", state)} />;
}
