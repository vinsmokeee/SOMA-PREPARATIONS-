import { describe, expect, it } from "vitest";
import { mergePatch } from "@/components/exam/use-autosave";
import { breakdownBy, clockOffset, countWords, dueTimeWarnings, formatClock, formatDuration, remainingSeconds, revisionSuggestions, timerTone, timeWarningText } from "@/lib/exam/logic";
import type { ResultQuestion } from "@/lib/exam/types";

describe("timer", () => {
  it("uses the server clock, not the device clock", () => {
    const serverNow = "2026-11-16T10:00:00.000Z";
    const deviceNow = new Date("2026-11-16T10:05:00.000Z").getTime(); // device runs 5 minutes fast
    const offset = clockOffset(serverNow, deviceNow);
    expect(offset).toBe(-5 * 60 * 1000);
    expect(remainingSeconds("2026-11-16T10:30:00.000Z", deviceNow, offset)).toBe(30 * 60);
  });
  it("never goes below zero and rounds up partial seconds", () => {
    expect(remainingSeconds("2026-11-16T10:00:00.000Z", new Date("2026-11-16T10:00:05Z").getTime(), 0)).toBe(0);
    expect(remainingSeconds("2026-11-16T10:00:01.000Z", new Date("2026-11-16T10:00:00.200Z").getTime(), 0)).toBe(1);
  });
  it("formats the clock", () => {
    expect(formatClock(65)).toBe("01:05");
    expect(formatClock(3725)).toBe("01:02:05");
    expect(formatDuration(125)).toBe("2 min 5 s");
    expect(formatDuration(null)).toBe("—");
  });
});

describe("word count", () => {
  it("counts words separated by any whitespace", () => {
    expect(countWords("  Bhutan  pursues\nGross National   Happiness. ")).toBe(5);
    expect(countWords("   ")).toBe(0);
  });
});

describe("autosave patch merging", () => {
  it("keeps the latest choice and adds up time", () => {
    const m = mergePatch({ selectedOptionId: "a", timeSpentDelta: 30 }, { selectedOptionId: "b", timeSpentDelta: 20 });
    expect(m.selectedOptionId).toBe("b");
    expect(m.timeSpentDelta).toBe(50);
  });
  it("a later clear wins over an earlier selection, and vice versa", () => {
    expect(mergePatch({ selectedOptionId: "a" }, { clearSelection: true }).selectedOptionId).toBeNull();
    const re = mergePatch({ clearSelection: true }, { selectedOptionId: "c" });
    expect(re.clearSelection).toBe(false);
    expect(re.selectedOptionId).toBe("c");
  });
  it("keeps the flag when a later patch only changes text", () => {
    expect(mergePatch({ flagged: true }, { textAnswer: "x" })).toMatchObject({ flagged: true, textAnswer: "x" });
  });
  it("caps time at the server limit", () => {
    expect(mergePatch({ timeSpentDelta: 500 }, { timeSpentDelta: 500 }).timeSpentDelta).toBe(600);
  });
});

function q(subject: string, outcome: "c" | "w" | "u", time = 30): ResultQuestion {
  return {
    exam_question_id: Math.random().toString(),
    number: 1,
    section: null,
    marks: 1,
    type: "mcq",
    stem: "",
    word_limit: null,
    explanation: null,
    model_answer: null,
    subject,
    topic: null,
    difficulty: "standard",
    options: [],
    rubric: [],
    references: [],
    answer: { id: "a", selected_option_id: outcome === "u" ? null : "o", text_answer: null, word_count: null, flagged: false, is_correct: outcome === "c" ? true : outcome === "w" ? false : null, marks_awarded: 0, time_spent_seconds: time, evaluations: [] },
  };
}

describe("performance breakdown", () => {
  const qs = [q("English", "c"), q("English", "c"), q("English", "w"), q("Logic", "w"), q("Logic", "w"), q("Logic", "c"), q("Data", "u"), q("Data", "u")];
  const rows = breakdownBy(qs, "subject");
  it("computes accuracy on attempted questions", () => {
    expect(rows.find((r) => r.name === "English")).toMatchObject({ total: 3, correct: 2, incorrect: 1, accuracy: 67 });
    expect(rows.find((r) => r.name === "Data")).toMatchObject({ unanswered: 2, accuracy: null });
  });
  it("lists the weakest areas first and suggests revision", () => {
    expect(rows[0].name).toBe("Logic");
    expect(revisionSuggestions(rows).map((r) => r.name).sort()).toEqual(["Data", "Logic"]);
  });
  it("ignores written questions", () => {
    expect(breakdownBy([{ ...q("Essay", "c"), type: "essay" }], "subject")).toEqual([]);
  });
});

describe("time warnings", () => {
  it("warns at 30, 10, 5 and 1 minutes left, once each", () => {
    const start = 3 * 3600;
    expect(dueTimeWarnings(1801, start, [])).toEqual([]);
    expect(dueTimeWarnings(1800, start, [])).toEqual([1800]);
    expect(dueTimeWarnings(1500, start, [1800])).toEqual([]);
    expect(dueTimeWarnings(600, start, [1800])).toEqual([600]);
    expect(dueTimeWarnings(60, start, [1800, 600, 300])).toEqual([60]);
    expect(dueTimeWarnings(0, start, [])).toEqual([]);
  });
  it("skips warnings that were already passed when the paper opened, and collapses missed ones", () => {
    expect(dueTimeWarnings(480, 500, [])).toEqual([]);          // opened at 8:20 left: no 30- or 10-minute warning
    expect(dueTimeWarnings(300, 500, [])).toEqual([300]);
    expect(dueTimeWarnings(250, 3600, [1800])).toEqual([600, 300]);  // phone was asleep
  });
  it("colours the timer orange from 10 minutes and red from 5", () => {
    expect(timerTone(601)).toBe("normal");
    expect(timerTone(600)).toBe("warning");
    expect(timerTone(300)).toBe("danger");
    expect(timeWarningText(60)).toMatch(/submitted automatically/);
  });
});
