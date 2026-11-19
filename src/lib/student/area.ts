import "server-only";
import type { AreaData, MePaper, PackageInfo } from "@/components/student/exam-flow";
import type { MeProgressPaper } from "@/components/student/paper-home";
import { accuracy } from "@/lib/analytics";
import { loadLearningData } from "@/lib/analytics-server";
import { createClient } from "@/lib/supabase/server";
import type { TrainingData } from "@/lib/training/model";
import type { ExamState, Stage } from "./exam-state";

const PACKAGE_SLUG: Record<Stage, string> = { PE: "pe-premium", ME: "me-premium" };

/** The Premium package for an exam, as shown on the Free / Premium choice. */
export async function loadPackage(stage: Stage): Promise<PackageInfo> {
  const db = await createClient();
  const { data } = await db.from("packages").select("slug, name, price, access_days, features, status").eq("slug", PACKAGE_SLUG[stage]).maybeSingle();
  if (!data || !["available", "coming_soon"].includes(data.status)) return null;
  return {
    slug: data.slug, name: data.name, price: Number(data.price), accessDays: data.access_days,
    features: Array.isArray(data.features) ? (data.features as string[]) : [], available: data.status === "available",
  };
}

/** The ME papers of a student's category, in order (Paper I, II, III). */
export async function loadMePapers(categoryId: string | null): Promise<MePaper[]> {
  if (!categoryId) return [];
  const db = await createClient();
  const { data } = await db.from("exam_papers").select("id, title, paper_number, exam_paper_categories!inner(category_id)")
    .eq("stage", "ME").eq("exam_paper_categories.category_id", categoryId).order("paper_number");
  return (data ?? []).map((p) => ({ id: p.id, number: p.paper_number, title: p.title }));
}

/** The caller's ME papers with their progress (`my_me_progress`), in order. */
export async function loadMeProgress(): Promise<MeProgressPaper[]> {
  const db = await createClient();
  const { data } = await db.rpc("my_me_progress");
  return Array.isArray(data) ? (data as unknown as MeProgressPaper[]) : [];
}

/** Everything the inside of an exam needs. */
export async function loadArea(stage: Stage, state: ExamState): Promise<AreaData> {
  const db = await createClient();
  const [learning, training, allowance, papers] = await Promise.all([
    loadLearningData(),
    db.rpc("my_training"),
    stage === "ME" ? db.rpc("my_evaluation_allowance") : Promise.resolve({ data: null }),
    stage === "ME" ? loadMeProgress() : Promise.resolve([] as MeProgressPaper[]),
  ]);
  const perf = learning.performance;
  const subjects = perf?.by_subject.filter((s) => s.stage === stage) ?? [];
  const answered = subjects.reduce((n, s) => n + s.answered, 0);
  const correct = subjects.reduce((n, s) => n + s.correct, 0);
  const t = (training.data ?? null) as TrainingData | null;
  const premium = state.premium[stage];
  const pool = learning.options[stage]?.total ?? 0;
  const freeUsedUp = !premium && (stage === "PE"
    ? pool > 0 && answered >= pool
    : ((allowance.data as { remaining?: number } | null)?.remaining ?? 1) === 0);
  return {
    stage,
    entryLabel: stage === "ME" ? state.entry.label : null,
    premium,
    openAttempt: state.openAttempt[stage],
    training: t && t.plan.stage === stage ? t : null,
    answered,
    accuracy: answered ? accuracy(correct, answered) : null,
    written: perf?.totals.written_answers ?? 0,
    freeUsedUp,
    aiMarks: stage === "ME" && allowance.data ? { used: (allowance.data as { used: number }).used, limit: (allowance.data as { limit: number }).limit } : null,
    premiumSlug: PACKAGE_SLUG[stage],
    papers: papers.map((p) => ({ id: p.id, number: p.number, title: p.title })),
    progress: papers,
  };
}
