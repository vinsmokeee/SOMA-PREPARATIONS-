import { describe, expect, it } from "vitest";
import { trainingConfigSchema } from "@/lib/validation/training";
import { BADGES, itemAction, streakLabel, phaseForDay, streakMessage, upcomingAssessments, type TrainingItem } from "@/lib/training/model";

const stats = { current_streak: 0, best_streak: 0, rest_tokens: 0, active_days: 0, mastered: 0, active_today: false };
const item = (over: Partial<TrainingItem>): TrainingItem => ({
  id: "x", kind: "practice", title: "t", detail: null, minutes: 10, questions: 10, status: "pending",
  attempt_id: null, score: null, max_score: null, attempt_open: null, ...over,
});

describe("training cycle", () => {
  it("splits a 30-day cycle into the four phases", () => {
    expect([1, 7, 8, 14, 15, 21, 22, 30].map((d) => phaseForDay(d, 30))).toEqual([
      "foundation", "foundation", "development", "development", "improvement", "improvement", "revision", "revision",
    ]);
  });
  it("scales phases for other cycle lengths", () => {
    expect(phaseForDay(1, 60)).toBe("foundation");
    expect(phaseForDay(30, 60)).toBe("improvement");
    expect(phaseForDay(60, 60)).toBe("revision");
  });
  it("schedules weekly, fortnightly and monthly assessments like the database", () => {
    expect(upcomingAssessments(1, 30, 10).map((u) => `${u.kind}@${u.inDays + 1}`)).toEqual([
      "weekly_test@7", "weekly_test@14", "fortnight_test@15", "weekly_test@21", "weekly_test@28", "fortnight_test@29", "monthly_mock@30",
    ]);
    expect(upcomingAssessments(29, 30)).toEqual([{ kind: "monthly_mock", label: "Monthly mock", inDays: 1 }]);
  });
});

describe("motivation", () => {
  it("never scolds a student who missed days", () => {
    const msg = streakMessage({ ...stats, best_streak: 12 });
    expect(msg).toMatch(/Welcome back/);
    expect(msg).not.toMatch(/lost|failed|broke/i);
  });
  it("tells an active student what keeps the streak", () => {
    expect(streakMessage({ ...stats, current_streak: 4 })).toBe("Practise today to make it 5 days in a row.");
    expect(streakMessage({ ...stats, current_streak: 5, active_today: true })).toBe("Day 5 done. See you tomorrow.");
  });
  it("labels streaks", () => {
    expect(streakLabel(0)).toBe("No streak yet");
    expect(streakLabel(3)).toBe("3-day streak");
  });
  it("has unique badge codes", () => {
    expect(new Set(BADGES.map((b) => b.code)).size).toBe(BADGES.length);
  });
  it("labels item buttons by status", () => {
    expect(itemAction(item({}))).toBe("Start");
    expect(itemAction(item({ status: "started", attempt_open: true }))).toBe("Continue");
    expect(itemAction(item({ status: "done" }))).toBe("Review");
    expect(itemAction(item({ status: "skipped" }))).toBe("Do it anyway");
  });
});

describe("admin settings", () => {
  it("rejects out-of-range values", () => {
    const ok = { cycle_days: "30", practice_questions: "15", revision_questions: "5", weak_questions: "5", weekly_test_questions: "25", weekly_test_minutes: "30",
      fortnight_test_questions: "30", fortnight_test_minutes: "35", mock_questions: "50", mock_minutes: "75", readiness_days: "14", weekly_goal_questions: "100" };
    expect(trainingConfigSchema.safeParse(ok).success).toBe(true);
    expect(trainingConfigSchema.safeParse({ ...ok, cycle_days: "3" }).success).toBe(false);
    expect(trainingConfigSchema.safeParse({ ...ok, practice_questions: "500" }).success).toBe(false);
  });
});
