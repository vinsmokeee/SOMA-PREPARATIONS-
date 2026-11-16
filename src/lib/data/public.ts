import "server-only";
import { cacheLife, cacheTag } from "next/cache";
import { createPublicClient } from "@/lib/supabase/public";
import { publicDataSource } from "./source";
import type { Cycle, DataResult, ExamStructure, PackageSummary } from "./types";

export const CACHE_TAGS = {
  examStructure: "exam-structure",
  packages: "packages",
  currentAffairs: "current-affairs",
  exams: "exams",
} as const;

export type PublishedCaItem = {
  id: string;
  title: string;
  url: string;
  primary_source_url: string | null;
  published_on: string | null;
  feature_date: string | null;
  area: "bhutan" | "regional" | "world" | null;
  verification: string;
  category: string | null;
  summary: string | null;
};

const NOT_CONFIGURED = {
  ok: false as const,
  reason: "not_configured" as const,
  message: "The examination database is not connected in this environment.",
};

async function loadFixture<T>(name: "exam-structure" | "packages"): Promise<T> {
  const mod = name === "exam-structure"
    ? await import("./fixtures/exam-structure.json")
    : await import("./fixtures/packages.json");
  return mod.default as unknown as T;
}

/** Official examination structure (current framework). Cached; invalidated on admin edits. */
export async function getExamStructure(): Promise<DataResult<ExamStructure>> {
  "use cache";
  cacheTag(CACHE_TAGS.examStructure);
  cacheLife("hours");

  const source = publicDataSource();
  if (source === "none") return NOT_CONFIGURED;
  if (source === "fixture") return { ok: true, data: await loadFixture<ExamStructure>("exam-structure"), source };

  try {
    const db = createPublicClient();
    const fw = await db
      .from("exam_frameworks")
      .select("id, code, name, description, verification_status, source_document_id, verified_at")
      .eq("is_current", true)
      .maybeSingle();
    if (fw.error) throw fw.error;
    const frameworkId = fw.data?.id ?? "00000000-0000-0000-0000-000000000000";

    const [cycles, categories, papers, paperCategories, meComponents, subjects, citations, sections, cutoffs, specialisations, subjectGroups] = await Promise.all([
      db.from("exam_cycles").select("id, code, name, year, status, registration_opens, registration_closes, pe_date, me_start_date, me_end_date, pe_cutoff_note, verification_status, source_document_id, notes").order("year", { ascending: false }),
      db.from("exam_categories").select("id, code, name, description, eligibility_summary, pe_exempt, sort_order, public_group, is_offered, pe_rule_note").eq("is_active", true).order("sort_order"),
      db.from("exam_papers").select("id, stage, code, paper_number, title, description, answer_format, weightage_percent, max_marks, duration_minutes, question_count, params_source, bank_scope, verification_status, source_document_id, sort_order").eq("framework_id", frameworkId).order("sort_order"),
      db.from("exam_paper_categories").select("paper_id, category_id, weightage_percent"),
      db.from("me_components").select("category_id, component, weightage_percent").eq("framework_id", frameworkId),
      db.from("subjects").select("id, stage, slug, name, description, paper_id, is_official, sort_order").eq("is_active", true).order("sort_order"),
      db.rpc("get_official_citations"),
      db.from("paper_sections").select("id, paper_id, title, subject_id, question_count, marks, formats, params_source, sort_order").order("sort_order"),
      db.from("pe_cutoff_history").select("year, value, unit, verification_status, source_document_id").order("year", { ascending: false }),
      db.from("specialisations").select("id, code, name, category_id, subject_group_id, pe_required, sort_order").eq("is_active", true).order("sort_order"),
      db.from("subject_groups").select("id, name").eq("is_active", true).order("sort_order"),
    ]);
    for (const r of [cycles, categories, papers, paperCategories, meComponents, subjects, citations, sections, cutoffs, specialisations, subjectGroups]) {
      if (r.error) throw r.error;
    }
    const num = (v: unknown) => (v === null || v === undefined ? null : Number(v));
    return {
      ok: true,
      source,
      data: {
        framework: fw.data ?? null,
        cycles: (cycles.data ?? []) as Cycle[],
        categories: categories.data ?? [],
        papers: (papers.data ?? []).map((p) => ({
          ...p,
          weightage_percent: num(p.weightage_percent),
          max_marks: num(p.max_marks),
        })),
        paperCategories: (paperCategories.data ?? []).map((p) => ({ ...p, weightage_percent: num(p.weightage_percent) })),
        meComponents: (meComponents.data ?? []).map((m) => ({ ...m, weightage_percent: Number(m.weightage_percent) })),
        subjects: subjects.data ?? [],
        citations: citations.data ?? [],
        sections: (sections.data ?? []).map((s) => ({ ...s, marks: num(s.marks) })),
        cutoffs: (cutoffs.data ?? []).map((c) => ({ ...c, value: Number(c.value) })),
        specialisations: specialisations.data ?? [],
        subjectGroups: subjectGroups.data ?? [],
      } as ExamStructure,
    };
  } catch (e) {
    console.error("getExamStructure failed", e);
    return { ok: false, reason: "error", message: "The examination structure could not be loaded. Please try again shortly." };
  }
}

/** Packages visible to the public (available or coming soon). */
export async function getPublicPackages(): Promise<DataResult<PackageSummary[]>> {
  "use cache";
  cacheTag(CACHE_TAGS.packages);
  cacheLife("hours");

  const source = publicDataSource();
  if (source === "none") return NOT_CONFIGURED;
  if (source === "fixture") return { ok: true, data: await loadFixture<PackageSummary[]>("packages"), source };

  try {
    const db = createPublicClient();
    const { data, error } = await db
      .from("packages")
      .select("id, slug, name, tagline, description, price, promo_price, promo_starts_at, promo_ends_at, features, includes_pe, includes_me, status, access_days, access_ends_at, terms, sort_order, exam_cycles(name)")
      .in("status", ["available", "coming_soon"])
      .order("sort_order");
    if (error) throw error;
    return {
      ok: true,
      source,
      data: (data ?? []).map((p) => {
        const cycle = p.exam_cycles as unknown as { name: string } | { name: string }[] | null;
        return {
          ...p,
          price: Number(p.price),
          promo_price: p.promo_price === null ? null : Number(p.promo_price),
          features: Array.isArray(p.features) ? (p.features as string[]) : [],
          cycle_name: Array.isArray(cycle) ? (cycle[0]?.name ?? null) : (cycle?.name ?? null),
        } as PackageSummary;
      }),
    };
  } catch (e) {
    console.error("getPublicPackages failed", e);
    return { ok: false, reason: "error", message: "Packages could not be loaded. Please try again shortly." };
  }
}

/** Effective price considering an active promotion at time `now`. */
export function effectivePrice(p: Pick<PackageSummary, "price" | "promo_price" | "promo_starts_at" | "promo_ends_at">, now: Date) {
  if (p.promo_price === null) return { price: p.price, promo: false };
  const started = !p.promo_starts_at || new Date(p.promo_starts_at) <= now;
  const notEnded = !p.promo_ends_at || new Date(p.promo_ends_at) > now;
  return started && notEnded ? { price: p.promo_price, promo: true } : { price: p.price, promo: false };
}

/** Published current-affairs stories from the last 7 days (open to everyone), newest first. */
export async function getPublishedCurrentAffairs(limit = 30): Promise<DataResult<PublishedCaItem[]>> {
  "use cache";
  cacheTag(CACHE_TAGS.currentAffairs);
  cacheLife("minutes");

  const source = publicDataSource();
  if (source === "none") return NOT_CONFIGURED;
  if (source === "fixture") return { ok: true, data: [], source };
  try {
    const { data, error } = await createPublicClient()
      .from("ca_items")
      .select("id, title, url, primary_source_url, published_on, feature_date, area, verification, summary, ca_categories(name)")
      .eq("status", "published")
      .order("published_at", { ascending: false, nullsFirst: false })
      .limit(limit);
    if (error) throw error;
    const rows = (data ?? []) as unknown as (Omit<PublishedCaItem, "category"> & { ca_categories: { name: string } | null })[];
    return { ok: true, data: rows.map(({ ca_categories, ...r }) => ({ ...r, category: ca_categories?.name ?? null })), source };
  } catch (e) {
    console.error("getPublishedCurrentAffairs failed", e);
    return { ok: false, reason: "error", message: "Current affairs could not be loaded. Please try again shortly." };
  }
}

export type PublicExam = {
  id: string;
  slug: string;
  title: string;
  description: string | null;
  stage: "PE" | "ME";
  kind: string;
  duration_minutes: number;
  is_free: boolean;
  question_count: number;
};

/** Published examinations (free ones are listed on the public practice pages). */
export async function getPublishedExams(): Promise<DataResult<PublicExam[]>> {
  "use cache";
  cacheTag(CACHE_TAGS.exams);
  cacheLife("hours");

  const source = publicDataSource();
  if (source === "none") return NOT_CONFIGURED;
  if (source === "fixture") return { ok: true, data: [], source };
  try {
    const { data, error } = await createPublicClient().rpc("exam_catalogue", { _stage: null });
    if (error) throw error;
    return {
      ok: true,
      source,
      data: ((data ?? []) as PublicExam[]).map(({ id, slug, title, description, stage, kind, duration_minutes, is_free, question_count }) => ({
        id, slug, title, description, stage, kind, duration_minutes, is_free, question_count,
      })),
    };
  } catch (e) {
    console.error("getPublishedExams failed", e);
    return { ok: false, reason: "error", message: "Examinations could not be loaded." };
  }
}
