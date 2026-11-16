import { describe, expect, it } from "vitest";
import { coach, tipFor } from "@/lib/exam/coach";

const sec = (name: string, total: number, correct: number, incorrect: number) => ({
  name, total, correct, incorrect, unanswered: total - correct - incorrect,
  accuracy: correct + incorrect ? Math.round((correct / (correct + incorrect)) * 100) : null, timeSeconds: 0,
});
const base = {
  sections: [sec("English", 25, 20, 5), sec("Data Interpretation", 25, 15, 8), sec("Dzongkha", 25, 24, 1), sec("Aptitude", 25, 25, 0)],
  total: 100, correct: 84, wrong: 14, skipped: 2, timeUsedSeconds: 120 * 60, timeAllowedMinutes: 150, negativeMarking: 0, autoSubmitted: false,
};

describe("coach", () => {
  it("names where marks were lost, biggest first", () => {
    const a = coach(base);
    expect(a.summary).toBe("You lost marks on 16 questions: 10 in Data Interpretation, 5 in English, 1 in Dzongkha.");
    expect(a.gainMarks.map((g) => g.section)).toEqual(["Data Interpretation", "English"]);
    expect(a.gainMarks[0].text).toContain("table or chart");
  });
  it("warns a student who rushed and made mistakes", () => {
    const a = coach({ ...base, correct: 50, wrong: 50, skipped: 0, timeUsedSeconds: 25 * 60 });
    expect(a.pace?.tone).toBe("warn");
    expect(a.pace?.text).toContain("You finished in 25 minutes");
  });
  it("tells a student when time ran out", () => {
    expect(coach({ ...base, autoSubmitted: true }).pace?.text).toContain("Time ran out");
  });
  it("praises a steady pace", () => {
    expect(coach(base).pace?.tone).toBe("good");
  });
  it("gives skip advice that depends on negative marking", () => {
    expect(coach(base).skipped).toContain("no negative marking");
    expect(coach({ ...base, negativeMarking: 0.25 }).skipped).toContain("With negative marking");
    expect(coach({ ...base, skipped: 0 }).skipped).toBeNull();
  });
  it("celebrates a perfect score", () => {
    const a = coach({ ...base, sections: [sec("English", 10, 10, 0)], total: 10, correct: 10, wrong: 0, skipped: 0 });
    expect(a.summary).toMatch(/^Excellent/);
    expect(a.gainMarks).toEqual([]);
  });
  it("has a general tip for unknown sections", () => {
    expect(tipFor("Something else")).toContain("explanations");
  });
});
