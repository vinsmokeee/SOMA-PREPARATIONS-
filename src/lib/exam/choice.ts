import type { PaperQuestion } from "./types";

/**
 * "Answer any N" papers (founder, 20 Nov 2026): the student reads the whole question paper, chooses the questions
 * to answer in each section (e.g. 2 of 4 in Part A), then writes only those, one part per screen.
 */
export type ChoiceGroup = { key: string; number: number; parts: PaperQuestion[]; marks: number };
export type ChoiceSection = { order: number; title: string; chooseAny: number; groups: ChoiceGroup[] };

/** Section title without the "(answer any N of the M questions)" added to each part. */
export const sectionTitle = (s: string | null) => (s ?? "Questions").replace(/\s*\(answer any \d+ of the \d+ questions\)\s*$/i, "");

export const hasChoice = (questions: PaperQuestion[]) => questions.some((q) => q.choose_any && q.choice_group);

export function choiceSections(questions: PaperQuestion[]): ChoiceSection[] {
  const sections = new Map<number, ChoiceSection>();
  let n = 0;
  for (const q of questions) {
    if (!q.choose_any || !q.choice_group) continue;
    const order = q.section_order ?? 0;
    let s = sections.get(order);
    if (!s) { s = { order, title: sectionTitle(q.section), chooseAny: q.choose_any, groups: [] }; sections.set(order, s); }
    let g = s.groups.find((x) => x.key === q.choice_group);
    if (!g) { g = { key: q.choice_group, number: ++n, parts: [], marks: 0 }; s.groups.push(g); }
    g.parts.push(q);
    g.marks += Number(q.marks);
  }
  return [...sections.values()].sort((a, b) => a.order - b.order);
}

/** What is still missing before writing can start; empty when the choice is complete. */
export function choiceProblems(sections: ChoiceSection[], chosen: Set<string>): string[] {
  return sections.flatMap((s) => {
    const got = s.groups.filter((g) => chosen.has(g.key)).length;
    if (got === s.chooseAny) return [];
    return got < s.chooseAny
      ? [`Choose ${s.chooseAny - got} more question${s.chooseAny - got === 1 ? "" : "s"} in ${s.title}`]
      : [`Remove ${got - s.chooseAny} question${got - s.chooseAny === 1 ? "" : "s"} in ${s.title}`];
  });
}

/** The parts to write after choosing: questions without a choice rule, plus the chosen ones, renumbered. */
export function chosenQuestions(questions: PaperQuestion[], chosen: string[] | null | undefined): PaperQuestion[] {
  const set = new Set(chosen ?? []);
  return questions
    .filter((q) => !q.choose_any || (q.choice_group && set.has(q.choice_group)))
    .map((q, i) => ({ ...q, number: i + 1, section: q.choose_any ? sectionTitle(q.section) : q.section }));
}
