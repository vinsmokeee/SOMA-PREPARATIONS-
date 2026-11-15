import { describe, expect, it } from "vitest";
import { writtenAdvice, type WrittenPerformance } from "@/lib/written/insights";

const base: WrittenPerformance = { evaluated: 5, scored: 5, avg_pct: 55, by_subject: [], by_paper: [], weaknesses: [], trend: [] };

describe("written advice", () => {
  it("turns recurring weaknesses into concrete advice", () => {
    const a = writtenAdvice({ ...base, weaknesses: [{ tag: "lacks_examples", count: 3 }, { tag: "weak_structure", count: 1 }] });
    expect(a).toHaveLength(1);
    expect(a[0].title).toMatch(/Needs relevant examples \(3 of 5 answers\)/);
    expect(a[0].detail).toMatch(/example/);
  });
  it("flags weak subjects with enough answers", () => {
    const a = writtenAdvice({ ...base, by_subject: [{ subject_id: "s", subject: "Governance", answers: 2, avg_pct: 40 }, { subject_id: "t", subject: "Economy", answers: 1, avg_pct: 20 }] });
    expect(a.map((x) => x.title)).toEqual(["Practise more written questions in Governance"]);
  });
  it("ignores unknown tags", () => expect(writtenAdvice({ ...base, weaknesses: [{ tag: "made_up", count: 9 }] })).toEqual([]));
});
