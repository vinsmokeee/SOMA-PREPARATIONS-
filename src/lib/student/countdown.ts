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

/** The good-luck note shown the day before and on the exam day (null on other days). */
export function examDayNote(stage: CountdownStage, days: number): { title: string; body: string } | null {
  if (days === 1) {
    return {
      title: `Your ${stage} is tomorrow · All the best! 🍀`,
      body: stage === "PE"
        ? "You have prepared well. Tonight, revise lightly instead of learning new topics, keep your admit card and everything RCSC asks you to bring ready, and sleep early. Tomorrow, reach the centre early, read each question carefully and shade every circle fully inside the line."
        : "You have prepared well. Tonight, revise your key points lightly, keep your admit card and everything RCSC asks you to bring ready, and sleep early. Tomorrow, reach the centre early, plan your time for each question and write clearly.",
    };
  }
  if (days === 0) {
    return {
      title: `Today is your ${stage} · Give it your best! 🙏`,
      body: stage === "PE"
        ? "Stay calm and trust your preparation. Read every question and all the options, keep an eye on the time, and shade each circle completely inside the line. All the best from everyone at Soma!"
        : "Stay calm and trust your preparation. Read each question twice, plan your answer before you write, and keep an eye on the time. All the best from everyone at Soma!",
    };
  }
  return null;
}

/**
 * Which exam the countdown is about on a page. PE and ME are separate exams: PE pages use only the PE date, ME pages
 * only the ME date; other pages use the exam the student is preparing for. `ask` = the pop-up should ask for the date.
 */
export function pickCountdown(path: string, interest: CountdownStage | null, dates: Record<CountdownStage, string | null>) {
  const pageStage: CountdownStage | null = path.startsWith("/dashboard/me") ? "ME" : path.startsWith("/dashboard/pe") ? "PE" : null;
  const stage: CountdownStage = pageStage ?? interest ?? (dates.PE ? "PE" : dates.ME ? "ME" : "PE");
  const saved: SavedCountdown | null = dates[stage] ? { stage, date: dates[stage] as string } : null;
  const ask = !dates[stage] && (pageStage !== null || interest !== null || (!dates.PE && !dates.ME));
  return { stage, saved, ask };
}
