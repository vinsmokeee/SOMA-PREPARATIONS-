/** Mistakes of an ME mock, from me_attempt_mistakes(): what "Retry my mistakes" will include. */
export type Mistake = { question_id: string; pos: number; reason: "skipped" | "wrong" | "low" | "not_marked" | null };

export function retrySummary(rows: Mistake[]) {
  const count = (r: Mistake["reason"]) => rows.filter((m) => m.reason === r).length;
  const retry = count("skipped") + count("wrong") + count("low");
  return { retry, skipped: count("skipped"), wrong: count("wrong"), low: count("low"), notMarked: count("not_marked") };
}

/** "Before -> Now" per question of a retry, with a short verdict. */
export type Compare = { question_id: string; pos: number; before_score: number | null; before_max: number | null; now_score: number | null; now_max: number | null };
export function compareVerdict(c: Compare): "better" | "same" | "worse" | "not_marked" {
  if (c.now_score === null || c.now_max === null) return "not_marked";
  const before = c.before_score !== null && c.before_max ? Number(c.before_score) / Number(c.before_max) : 0;
  const now = Number(c.now_score) / Number(c.now_max);
  return now > before ? "better" : now < before ? "worse" : "same";
}
