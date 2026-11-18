/** Exam-day countdown helpers. Days are counted in Bhutan time (UTC+6), the same calendar RCSC uses. */
export type CountdownStage = "PE" | "ME";
export type SavedCountdown = { stage: CountdownStage; date: string };

export const COUNTDOWN_STORAGE_KEY = "soma-exam-countdown";
const DATE_RE = /^\d{4}-\d{2}-\d{2}$/;

/** Today's date in Bhutan as YYYY-MM-DD. */
export function bhutanToday(now: Date = new Date()): string {
  return new Date(now.getTime() + 6 * 3600_000).toISOString().slice(0, 10);
}

/** Whole days from today (Bhutan) until the exam date: 0 on the day, negative once it has passed. */
export function daysUntil(date: string, now: Date = new Date()): number | null {
  if (!DATE_RE.test(date)) return null;
  const target = Date.parse(`${date}T00:00:00Z`);
  const today = Date.parse(`${bhutanToday(now)}T00:00:00Z`);
  if (Number.isNaN(target)) return null;
  return Math.round((target - today) / 86_400_000);
}

/** The short label shown in the countdown chip. */
export function countdownLabel(stage: CountdownStage, days: number): string {
  if (days > 1) return `${stage} in ${days} days`;
  if (days === 1) return `${stage} is tomorrow`;
  if (days === 0) return `${stage} is today · all the best!`;
  return `${stage} date has passed · update`;
}

/** A date a student may enter: from today up to three years ahead. */
export function isAllowedExamDate(date: string, now: Date = new Date()): boolean {
  const d = daysUntil(date, now);
  return d !== null && d >= 0 && d <= 3 * 366;
}

/** Read the countdown saved on this device (works when signed out or offline). */
export function readSavedCountdown(raw: string | null): SavedCountdown | null {
  if (!raw) return null;
  try {
    const v = JSON.parse(raw) as Partial<SavedCountdown>;
    return (v.stage === "PE" || v.stage === "ME") && typeof v.date === "string" && DATE_RE.test(v.date) ? { stage: v.stage, date: v.date } : null;
  } catch {
    return null;
  }
}
