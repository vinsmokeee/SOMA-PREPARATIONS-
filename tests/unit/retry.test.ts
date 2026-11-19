import { describe, expect, it } from "vitest";
import { compareVerdict, retrySummary } from "@/lib/exam/retry";

describe("retry my mistakes", () => {
  it("counts skipped, wrong and low answers; not-marked ones are reported separately", () => {
    expect(retrySummary([
      { question_id: "a", pos: 1, reason: null }, { question_id: "b", pos: 2, reason: "low" }, { question_id: "c", pos: 3, reason: "skipped" },
      { question_id: "d", pos: 4, reason: "wrong" }, { question_id: "e", pos: 5, reason: "not_marked" },
    ])).toEqual({ retry: 3, skipped: 1, wrong: 1, low: 1, notMarked: 1 });
  });
  it("compares before and now", () => {
    expect(compareVerdict({ question_id: "a", pos: 1, before_score: 5, before_max: 20, now_score: 12, now_max: 20 })).toBe("better");
    expect(compareVerdict({ question_id: "a", pos: 1, before_score: null, before_max: null, now_score: 0, now_max: 1 })).toBe("same");
    expect(compareVerdict({ question_id: "a", pos: 1, before_score: 5, before_max: 20, now_score: null, now_max: null })).toBe("not_marked");
  });
});
