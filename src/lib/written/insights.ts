import { WEAKNESS_TAGS, type WeaknessTag } from "@/lib/ai/written-evaluation";

export type WrittenPerformance = {
  evaluated: number; scored: number; avg_pct: number | null;
  by_subject: { subject_id: string | null; subject: string | null; answers: number; avg_pct: number | null }[];
  by_paper: { paper_id: string | null; paper: string | null; answers: number; avg_pct: number | null }[];
  weaknesses: { tag: string; count: number }[];
  trend: { at: string; pct: number }[];
};

const ADVICE: Record<WeaknessTag, string> = {
  lacks_examples: "Support each main point with a specific example — a Bhutanese policy, institution, event or statistic.",
  incomplete: "Before writing, list every part the question asks for and make sure each is answered.",
  factual_errors: "Revise the facts in this area and avoid stating figures or dates you are unsure of.",
  weak_structure: "Plan a short introduction, one paragraph per main point, and a conclusion.",
  off_topic: "Underline the key instruction words (explain, discuss, evaluate) and answer exactly that.",
  too_short: "Develop each point: state it, explain it, then give an example or consequence.",
  too_long: "Keep to the suggested length — cut repetition and focus on the strongest points.",
  unclear_expression: "Use shorter sentences and clear topic sentences at the start of each paragraph.",
  missing_analysis: "Go beyond description: explain why, compare options, and weigh advantages and drawbacks.",
  weak_conclusion: "Open by answering the question directly and close with a clear, reasoned conclusion.",
};

export type WrittenAdvice = { title: string; detail: string };

/** Recurring weaknesses (seen in 2+ evaluations, or the top one) and weak subjects become concrete advice. */
export function writtenAdvice(w: WrittenPerformance, limit = 4): WrittenAdvice[] {
  const out: WrittenAdvice[] = [];
  const recurring = w.weaknesses.filter((x) => x.tag in WEAKNESS_TAGS && (x.count >= 2 || w.evaluated <= 2)).slice(0, 3);
  for (const x of recurring) {
    const tag = x.tag as WeaknessTag;
    out.push({ title: `${WEAKNESS_TAGS[tag]} (${x.count} of ${w.evaluated} answer${w.evaluated === 1 ? "" : "s"})`, detail: ADVICE[tag] });
  }
  for (const s of w.by_subject.filter((s) => s.avg_pct !== null && s.avg_pct < 50 && s.answers >= 2).slice(0, 2)) {
    out.push({ title: `Practise more written questions in ${s.subject ?? "this subject"}`, detail: `Average indicative score ${s.avg_pct}% across ${s.answers} answers.` });
  }
  return out.slice(0, limit);
}
