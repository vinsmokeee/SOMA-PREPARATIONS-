import type { Category, ExamStructure, MeComponent, Paper } from "./types";

export type CategoryGroup = {
  categories: Category[];
  papers: (Paper & { effectiveWeightage: number | null })[];
  components: MeComponent[];
};

/**
 * Groups ME categories that sit the same set of papers with the same weightages
 * (e.g. Administrative / Finance / PGDE) so the structure is shown once per group.
 */
export function groupMeCategories(s: ExamStructure): CategoryGroup[] {
  const mePapers = s.papers.filter((p) => p.stage === "ME");
  const groups = new Map<string, CategoryGroup>();

  for (const cat of s.categories) {
    const links = s.paperCategories.filter((pc) => pc.category_id === cat.id);
    const papers = mePapers
      .filter((p) => links.some((l) => l.paper_id === p.id))
      .map((p) => {
        const link = links.find((l) => l.paper_id === p.id);
        return { ...p, effectiveWeightage: link?.weightage_percent ?? p.weightage_percent };
      })
      .sort((a, b) => (a.paper_number ?? 0) - (b.paper_number ?? 0) || a.sort_order - b.sort_order);
    if (papers.length === 0) continue;
    const components = s.meComponents
      .filter((m) => m.category_id === cat.id)
      .sort((a, b) => COMPONENT_ORDER.indexOf(a.component) - COMPONENT_ORDER.indexOf(b.component));
    const key =
      papers.map((p) => `${p.id}:${p.effectiveWeightage}`).join("|") +
      "#" +
      components.map((c) => `${c.component}:${c.weightage_percent}`).join("|");
    const g = groups.get(key);
    if (g) g.categories.push(cat);
    else groups.set(key, { categories: [cat], papers, components });
  }
  return [...groups.values()];
}

export const COMPONENT_ORDER: MeComponent["component"][] = ["academic_achievement", "written_examination", "viva_voce"];

export const COMPONENT_LABELS: Record<MeComponent["component"], string> = {
  academic_achievement: "Academic Achievement",
  written_examination: "Written Examination",
  viva_voce: "Viva Voce",
};

export function citationsFor(s: ExamStructure, ids: (string | null | undefined)[]) {
  const set = new Set(ids.filter(Boolean));
  return s.citations.filter((c) => set.has(c.id));
}
