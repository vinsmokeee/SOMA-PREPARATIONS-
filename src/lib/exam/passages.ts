/**
 * Reading passages in a paper (founder, 20 Nov 2026): questions that share a passage carry the full passage in their
 * stem. The first of them shows it; the others fold the shared text, which the student can open again.
 * Returns, for each folded question, how many characters of its stem are the shared passage and which question number
 * first showed it.
 */
export type Fold = { sharedLength: number; firstNumber: number };

type Q = { exam_question_id: string; number: number; stem: string; passage_group?: string | null };

/** The text two stems share from the start, cut back to the end of a whole paragraph. */
export function sharedParagraphs(a: string, b: string): number {
  let i = 0;
  while (i < a.length && i < b.length && a[i] === b[i]) i++;
  const cut = a.lastIndexOf("\n\n", i);
  return cut > 0 ? cut : 0;
}

export function passageFolds(questions: Q[], minLength = 150): Map<string, Fold> {
  const first = new Map<string, Q>();
  const folds = new Map<string, Fold>();
  for (const q of questions) {
    if (!q.passage_group) continue;
    const f = first.get(q.passage_group);
    if (!f) { first.set(q.passage_group, q); continue; }
    const n = sharedParagraphs(f.stem, q.stem);
    if (n >= minLength) folds.set(q.exam_question_id, { sharedLength: n, firstNumber: f.number });
  }
  return folds;
}
