import { describe, expect, it } from "vitest";
import { accuracy, readiness, recommendations, type Performance, type PracticeOptions } from "@/lib/analytics";

const base: Performance = {
  totals: { attempts: 0, answered: 0, correct: 0, time_seconds: 0, written_answers: 0, distinct_questions: 0 },
  by_subject: [],
  by_topic: [],
  trend: [],
  coverage: [{ stage: "PE", practised: 0, total: 4 }],
  mistakes: 0,
};

const subj = (id: string, answered: number, correct: number) => ({ id, name: id, stage: "PE" as const, answered, correct, avg_seconds: 40, last_at: null });

describe("readiness (Soma estimate)", () => {
  it("needs enough answers before estimating", () => {
    expect(readiness("PE", { ...base, by_subject: [subj("a", 10, 9)] }).band).toBe("not_enough");
  });
  it("is strong only with high accuracy AND broad coverage", () => {
    const p = { ...base, by_subject: [subj("a", 20, 16), subj("b", 20, 15)], coverage: [{ stage: "PE" as const, practised: 2, total: 4 }] };
    expect(readiness("PE", p).band).toBe("developing");
    expect(readiness("PE", { ...p, coverage: [{ stage: "PE", practised: 4, total: 4 }] }).band).toBe("strong");
  });
  it("prefers recent accuracy when available", () => {
    const p: Performance = {
      ...base,
      by_subject: [subj("a", 40, 32)],
      coverage: [{ stage: "PE", practised: 4, total: 4 }],
      trend: [{ id: "1", title: "t", kind: "mock", stage: "PE", submitted_at: "", answered: 20, correct: 6 }],
    };
    const r = readiness("PE", p);
    expect(r.band).toBe("foundations");
    expect(r.reasons.join(" ")).toMatch(/Recent accuracy 30%/);
  });
  it("never talks about passing", () => {
    for (const band of ["not_enough", "foundations", "developing", "strong"]) expect(band).not.toMatch(/pass/);
    expect(JSON.stringify(readiness("PE", { ...base, by_subject: [subj("a", 50, 45)], coverage: [{ stage: "PE", practised: 4, total: 4 }] }))).not.toMatch(/pass/i);
  });
});

describe("recommendations", () => {
  const options: Partial<Record<"PE" | "ME", PracticeOptions>> = {
    PE: { full_access: true, total: 40, mistakes: 3, subjects: [{ id: "a", name: "English", available: 10, topics: [] }, { id: "z", name: "Data", available: 8, topics: [] }] },
  };
  it("orders mistakes, weak topics, weak subjects, then unpractised areas", () => {
    const perf: Performance = {
      ...base,
      by_subject: [subj("a", 20, 8)],
      by_topic: [{ id: "t1", name: "Grammar", subject_id: "a", subject: "English", stage: "PE", answered: 10, correct: 3 }],
    };
    const r = recommendations(perf, options, 10);
    expect(r.map((x) => x.kind)).toEqual(["mistakes", "weak_topic", "unpractised"]);
    expect(r[1]).toMatchObject({ topicId: "t1", detail: "30% accuracy in English" });
    expect(r[2]).toMatchObject({ subjectId: "z" });
  });
  it("ignores areas with too few answers to judge", () => {
    const perf: Performance = { ...base, by_subject: [subj("a", 3, 0)] };
    expect(recommendations(perf, { PE: { ...options.PE!, mistakes: 0 } }, 10).map((x) => x.kind)).toEqual(["unpractised"]);
  });
  it("computes accuracy safely", () => {
    expect(accuracy(0, 0)).toBeNull();
    expect(accuracy(2, 3)).toBe(67);
  });
});
