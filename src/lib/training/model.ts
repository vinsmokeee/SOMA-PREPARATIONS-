/** Shapes and wording for the daily training plan (data comes from my_training()). */
export type TrainingPhase = "foundation" | "development" | "improvement" | "revision" | "readiness";
export type ItemKind = "practice" | "revision" | "weak_topic" | "ca" | "written" | "weekly_test" | "fortnight_test" | "monthly_mock";

export type TrainingItem = {
  id: string;
  kind: ItemKind;
  title: string;
  detail: string | null;
  minutes: number | null;
  questions: number;
  status: "pending" | "started" | "done" | "skipped";
  attempt_id: string | null;
  score: number | null;
  max_score: number | null;
  attempt_open: boolean | null;
};

export type TrainingData = {
  today: string;
  plan: { id: string; cycle_no: number; cycle_day: number; cycle_days: number; phase: TrainingPhase; stage: "PE" | "ME"; focus: string | null };
  items: TrainingItem[];
  stats: { current_streak: number; best_streak: number; rest_tokens: number; active_days: number; mastered: number; active_today: boolean };
  badges: { code: string; earned_at: string }[];
  revision_due: number;
  revision_total: number;
  week: { goal: number; answered: number; days_active: number };
  bests: { weekly_test: number | null; monthly_mock: number | null; most_in_a_day: number | null };
  subjects: { name: string; answered_cycle: number; answered: number; accuracy: number | null; available: number }[];
  exam_date: string | null;
};

export const PHASES: { key: TrainingPhase; label: string; description: string }[] = [
  { key: "foundation", label: "Foundation", description: "Baseline practice across every section." },
  { key: "development", label: "Development", description: "One section in focus each day, least practised first." },
  { key: "improvement", label: "Improvement", description: "Extra work on your weakest sections and topics." },
  { key: "revision", label: "Revision", description: "Mixed practice and more revision of past mistakes." },
  { key: "readiness", label: "Exam readiness", description: "Your examination is close: revision and timed practice." },
];
export const phaseLabel = (p: TrainingPhase) => PHASES.find((x) => x.key === p)?.label ?? p;

/** Phase boundaries for a cycle of any length (same proportions as 7/14/21/30 days). */
export function phaseForDay(day: number, length: number): Exclude<TrainingPhase, "readiness"> {
  const f = day / length;
  if (f <= 7 / 30) return "foundation";
  if (f <= 14 / 30) return "development";
  if (f <= 21 / 30) return "improvement";
  return "revision";
}

export type Upcoming = { kind: "weekly_test" | "fortnight_test" | "monthly_mock"; label: string; inDays: number };

/** Scheduled assessments in the rest of the cycle (mirrors ensure_today_plan). */
export function upcomingAssessments(cycleDay: number, length: number, limit = 3): Upcoming[] {
  const out: Upcoming[] = [];
  for (let d = cycleDay + 1; d <= length && out.length < limit; d++) {
    const inDays = d - cycleDay;
    if (d === length) out.push({ kind: "monthly_mock", label: "Monthly mock", inDays });
    else if (d > 1 && d % 14 === 1) out.push({ kind: "fortnight_test", label: "Fortnightly revision test", inDays });
    else if (d % 7 === 0) out.push({ kind: "weekly_test", label: "Weekly test", inDays });
  }
  return out;
}

export const BADGES: { code: string; title: string; hint: string }[] = [
  { code: "first_day", title: "First day", hint: "Finish any practice" },
  { code: "streak_3", title: "3-day streak", hint: "Practise 3 days in a row" },
  { code: "streak_7", title: "7-day streak", hint: "Practise 7 days in a row" },
  { code: "streak_14", title: "14-day streak", hint: "Practise 14 days in a row" },
  { code: "streak_30", title: "30-day streak", hint: "Practise 30 days in a row" },
  { code: "plan_complete", title: "Full day", hint: "Finish every item in a day's plan" },
  { code: "revision", title: "Second chance", hint: "Finish a revision set" },
  { code: "weekly_test", title: "Weekly test", hint: "Finish a weekly test" },
  { code: "monthly_mock", title: "Monthly mock", hint: "Finish a monthly mock" },
  { code: "questions_100", title: "100 questions", hint: "Answer 100 questions" },
  { code: "questions_500", title: "500 questions", hint: "Answer 500 questions" },
  { code: "questions_1000", title: "1,000 questions", hint: "Answer 1,000 questions" },
  { code: "mastered_25", title: "Mistakes mastered", hint: "Clear 25 questions from revision" },
];

export const streakLabel = (n: number) => (n > 0 ? `${n}-day streak` : "No streak yet");

/** Encouraging, never discouraging. */
export function streakMessage(s: TrainingData["stats"]): string {
  if (s.active_today) return s.current_streak > 1 ? `Day ${s.current_streak} done. See you tomorrow.` : "Today counts. Come back tomorrow to start a streak.";
  if (s.current_streak > 0) return `Practise today to make it ${s.current_streak + 1} days in a row.`;
  if (s.best_streak > 0) return "Welcome back. Every day is a fresh start — a few questions today is enough.";
  return "Start with today's plan. A few questions a day adds up.";
}

export const itemAction = (i: TrainingItem): string =>
  i.status === "done" ? "Review" : i.status === "started" && i.attempt_open ? "Continue" : i.status === "skipped" ? "Do it anyway" : "Start";
