import type { ResultQuestion } from "./types";

/** Remaining whole seconds, using the server/client clock offset measured at load. */
export function remainingSeconds(deadlineIso: string, clientNowMs: number, offsetMs: number): number {
  const ms = new Date(deadlineIso).getTime() - (clientNowMs + offsetMs);
  return Math.max(0, Math.ceil(ms / 1000));
}

/** Server time minus client time, measured when the paper was loaded. */
export function clockOffset(serverNowIso: string, clientNowMs: number): number {
  return new Date(serverNowIso).getTime() - clientNowMs;
}

export function formatClock(totalSeconds: number): string {
  const s = Math.max(0, Math.floor(totalSeconds));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  const pad = (n: number) => String(n).padStart(2, "0");
  return h > 0 ? `${pad(h)}:${pad(m)}:${pad(sec)}` : `${pad(m)}:${pad(sec)}`;
}

export function formatDuration(totalSeconds: number | null | undefined): string {
  if (totalSeconds === null || totalSeconds === undefined) return "—";
  const s = Math.max(0, Math.round(totalSeconds));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  if (h > 0) return `${h} h ${m} min`;
  if (m > 0) return sec ? `${m} min ${sec} s` : `${m} min`;
  return `${sec} s`;
}

export function countWords(text: string): number {
  const t = text.trim();
  return t ? t.split(/\s+/).length : 0;
}

export type QuestionState = "answered" | "unanswered" | "flagged" | "answered_flagged";

export function questionState(answered: boolean, flagged: boolean): QuestionState {
  if (flagged) return answered ? "answered_flagged" : "flagged";
  return answered ? "answered" : "unanswered";
}

export type Breakdown = {
  name: string;
  total: number;
  correct: number;
  incorrect: number;
  unanswered: number;
  accuracy: number | null; // correct / attempted, 0..100
  timeSeconds: number;
};

/**
 * Per-subject (or per-topic) performance for objective questions.
 * Accuracy is correct answers as a share of questions attempted.
 */
export function breakdownBy(questions: ResultQuestion[], key: "subject" | "topic"): Breakdown[] {
  const map = new Map<string, Breakdown>();
  for (const q of questions) {
    if (q.type !== "mcq") continue;
    const name = q[key] ?? (key === "subject" ? "Unclassified" : "No topic");
    const b = map.get(name) ?? { name, total: 0, correct: 0, incorrect: 0, unanswered: 0, accuracy: null, timeSeconds: 0 };
    b.total += 1;
    b.timeSeconds += q.answer?.time_spent_seconds ?? 0;
    if (q.answer?.is_correct === true) b.correct += 1;
    else if (q.answer?.selected_option_id) b.incorrect += 1;
    else b.unanswered += 1;
    map.set(name, b);
  }
  return [...map.values()]
    .map((b) => ({ ...b, accuracy: b.correct + b.incorrect > 0 ? Math.round((b.correct / (b.correct + b.incorrect)) * 100) : null }))
    .sort((a, b) => (a.accuracy ?? 101) - (b.accuracy ?? 101) || b.total - a.total);
}

/** Areas to revise: attempted areas below the threshold, or mostly unanswered. */
export function revisionSuggestions(rows: Breakdown[], threshold = 60): Breakdown[] {
  return rows.filter((r) => (r.accuracy !== null && r.accuracy < threshold) || r.unanswered > r.total / 2);
}
