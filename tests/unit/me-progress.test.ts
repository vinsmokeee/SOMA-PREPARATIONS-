import { describe, expect, it } from "vitest";
import { areas, focusPaper, typesInPaperOrder, weightedScore, type MeProgressPaper } from "@/components/student/paper-home";

const paper = (o: Partial<MeProgressPaper>): MeProgressPaper => ({
  id: "x", number: 1, title: "P", weight: 15, duration_minutes: null, max_marks: null, marked: 0, recent: null,
  types: [], by_type: [], by_topic: [], mocks: [], mock_ready: false, pattern: [], ...o,
});

describe("ME overall progress", () => {
  it("combines papers with RCSC weightage", () => {
    expect(weightedScore([paper({ weight: 15, recent: 72 }), paper({ weight: 15, recent: 64 }), paper({ weight: 40, recent: 58 })])).toBe(62);
  });
  it("ignores papers without a score, and is empty before any marks", () => {
    expect(weightedScore([paper({ weight: 15, recent: 80 }), paper({ weight: 40, recent: null })])).toBe(80);
    expect(weightedScore([paper({ recent: null })])).toBeNull();
  });
  it("focuses on the heaviest paper not started, else the biggest weighted gap", () => {
    expect(focusPaper([paper({ number: 1, weight: 15, recent: 40 }), paper({ number: 3, weight: 40, recent: null })])?.number).toBe(3);
    expect(focusPaper([paper({ number: 1, weight: 15, recent: 40 }), paper({ number: 3, weight: 40, recent: 70 })])?.number).toBe(3);
    expect(focusPaper([paper({ number: 1, weight: 15, recent: 10 }), paper({ number: 3, weight: 40, recent: 90 })])?.number).toBe(1);
  });
  it("lists strong and weak areas with at least two answers", () => {
    const a = areas(paper({ by_type: [{ label: "essay", pct: 80, n: 2 }, { label: "short_answer", pct: 30, n: 1 }], by_topic: [{ label: "Budget", pct: 40, n: 3 }] }));
    expect(a).toEqual({ strong: ["Essays"], weak: ["Budget"] });
  });
});

describe("question type names on a paper", () => {
  it("use the RCSC part name when the pattern is known", async () => {
    const { paperTypeLabel } = await import("@/components/student/paper-home");
    const p = { pattern: [{ title: "Part A: Institutions", type: "long_answer", count: 4, marks_each: 20, answer_any: 2 }] };
    expect(paperTypeLabel(p, "long_answer")).toBe("Part A: Institutions");
    expect(paperTypeLabel(p, "essay")).toBe("Essays");
  });
});

describe("typesInPaperOrder", () => {
  it("lists practice types in the paper's section order, extra types last", () => {
    const pattern = [
      { title: "Section I: Case study", type: "analytical", count: 1, marks_each: 30, answer_any: null },
      { title: "Section II: Topical discussion", type: "long_answer", count: 1, marks_each: 30, answer_any: null },
      { title: "Section IV: Dzongkha comprehension", type: "passage", count: 1, marks_each: 20, answer_any: null },
      { title: "Section V: Translation", type: "translation", count: 1, marks_each: 15, answer_any: null },
    ];
    const types = [{ type: "translation", count: 7 }, { type: "short_answer", count: 3 }, { type: "passage", count: 21 }, { type: "long_answer", count: 24 }, { type: "analytical", count: 21 }];
    expect(typesInPaperOrder({ pattern, types }).map((t) => t.type)).toEqual(["analytical", "long_answer", "passage", "translation", "short_answer"]);
  });
});
