import { describe, expect, it } from "vitest";
import { forStage, type Performance } from "@/lib/analytics";

const perf: Performance = {
  totals: { attempts: 3, answered: 42, correct: 21, time_seconds: 200, written_answers: 2, distinct_questions: 40 },
  by_subject: [
    { id: "pe-en", name: "English", stage: "PE", answered: 20, correct: 13, avg_seconds: 10, last_at: null },
    { id: "me-en", name: "English & General Knowledge", stage: "ME", answered: 20, correct: 7, avg_seconds: 1, last_at: null },
    { id: "pe-di", name: "Data Interpretation", stage: "PE", answered: 2, correct: 1, avg_seconds: 4, last_at: null },
  ],
  by_topic: [
    { id: "t1", name: "Grammar", subject_id: "pe-en", subject: "English", stage: "PE", answered: 3, correct: 1 },
    { id: "t2", name: "English: grammar", subject_id: "me-en", subject: "English & General Knowledge", stage: "ME", answered: 5, correct: 3 },
  ],
  trend: [
    { id: "a", title: "PE test", kind: "mock", stage: "PE", submitted_at: "2026-11-01", answered: 22, correct: 14 },
    { id: "b", title: "ME mock", kind: "mock", stage: "ME", submitted_at: "2026-11-02", answered: 20, correct: 7 },
  ],
  coverage: [{ stage: "PE", practised: 22, total: 600 }, { stage: "ME", practised: 20, total: 100 }],
  mistakes: 5,
};

describe("scores for one exam only", () => {
  it("ME shows only ME subjects, topics and tests, with its own totals", () => {
    const me = forStage(perf, "ME");
    expect(me.by_subject.map((s) => s.id)).toEqual(["me-en"]);
    expect(me.by_topic.map((t) => t.id)).toEqual(["t2"]);
    expect(me.trend.map((t) => t.id)).toEqual(["b"]);
    expect(me.totals).toMatchObject({ attempts: 1, answered: 20, correct: 7, time_seconds: 20, written_answers: 2 });
  });
  it("PE shows only PE, without ME written answers", () => {
    const pe = forStage(perf, "PE");
    expect(pe.by_subject.map((s) => s.id)).toEqual(["pe-en", "pe-di"]);
    expect(pe.totals).toMatchObject({ attempts: 1, answered: 22, correct: 14, time_seconds: 208, written_answers: 0 });
  });
});
