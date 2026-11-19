import "server-only";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export type Stage = "PE" | "ME";

export type ExamState = {
  pathway: "PE" | "ME" | "both" | null;
  started: Record<Stage, boolean>;           // the student has chosen Free or Premium for this exam
  premium: Record<Stage, string | null>;     // "Premium until 30 Jan 2027" when they have access
  entry: { categoryId: string | null; code: string | null; specialisationId: string | null; subjectGroupId: string | null; group: string | null; label: string | null };
  lastStage: Stage | null;                   // the exam to open when they come back
  openAttempt: Record<Stage, { id: string; title: string } | null>;
};

/** Where a student is: which exams they started, access, ME entry and unfinished attempts. */
export async function loadExamState(userId: string): Promise<ExamState> {
  const db = await createClient();
  const [{ data: profile }, { data: ents }, { data: attempts }] = await Promise.all([
    db.from("profiles").select("pathway, entry_category_id, specialisation_id, subject_group_id, exam_categories(code, name, public_group), specialisations(name), subject_groups(name)").eq("id", userId).maybeSingle(),
    db.from("entitlements").select("ends_at, packages(includes_pe, includes_me, name)").is("revoked_at", null).eq("status", "active")
      .or(`ends_at.is.null,ends_at.gt.${new Date().toISOString()}`),
    db.from("exam_attempts").select("id, status, started_at, exams(title, stage)").eq("user_id", userId).order("started_at", { ascending: false }).limit(20),
  ]);
  const premium: Record<Stage, string | null> = { PE: null, ME: null };
  for (const e of (ents ?? []) as unknown as { ends_at: string | null; packages: { includes_pe: boolean; includes_me: boolean; name: string } | null }[]) {
    const label = `Premium${e.ends_at ? ` until ${formatDate(e.ends_at)}` : ""}`;
    if (e.packages?.includes_pe) premium.PE = label;
    if (e.packages?.includes_me) premium.ME = label;
  }
  const rows = (attempts ?? []) as unknown as { id: string; status: string; exams: { title: string; stage: Stage } | null }[];
  const openAttempt: Record<Stage, { id: string; title: string } | null> = { PE: null, ME: null };
  for (const a of rows) {
    const s = a.exams?.stage;
    if (s && a.status === "in_progress" && !openAttempt[s]) openAttempt[s] = { id: a.id, title: a.exams!.title };
  }
  const pathway = (profile?.pathway ?? null) as ExamState["pathway"];
  const started: Record<Stage, boolean> = {
    PE: pathway === "PE" || pathway === "both" || Boolean(premium.PE),
    ME: pathway === "ME" || pathway === "both" || Boolean(premium.ME),
  };
  // PE comes first and the ME months later: once a student has started ME, open ME.
  const lastStage: Stage | null = started.ME ? "ME" : started.PE ? "PE" : null;
  const cat = profile?.exam_categories as unknown as { code: string; name: string; public_group: string | null } | null;
  const spec = profile?.specialisations as unknown as { name: string } | null;
  const sg = profile?.subject_groups as unknown as { name: string } | null;
  const group = cat?.public_group ?? null;
  const label = cat ? [cat.name, spec?.name, sg ? sg.name : null].filter(Boolean).join(" · ") : null;
  return {
    pathway, started, premium, lastStage, openAttempt,
    entry: {
      categoryId: profile?.entry_category_id ?? null, code: cat?.code ?? null,
      specialisationId: profile?.specialisation_id ?? null, subjectGroupId: profile?.subject_group_id ?? null, group, label,
    },
  };
}

/** The ME entry is complete when a category is chosen; B.Ed. also needs the graduate type, Technical the
 *  specialisation (its Paper II group comes from the specialisation; founder, 20 Nov 2026). */
export const entryComplete = (e: ExamState["entry"]) =>
  Boolean(e.categoryId && (e.code === "bed" || e.code === "technical" ? e.specialisationId : true));
