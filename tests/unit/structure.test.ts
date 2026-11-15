import { describe, expect, it } from "vitest";
import fixture from "@/lib/data/fixtures/exam-structure.json";
import { effectivePrice } from "@/lib/data/public";
import { groupMeCategories } from "@/lib/data/structure";
import type { ExamStructure } from "@/lib/data/types";

const s = fixture as unknown as ExamStructure;

describe("groupMeCategories (on data exported from the migrations)", () => {
  const groups = groupMeCategories(s);
  it("groups Administrative, Finance and PGDE together", () => {
    const general = groups.find((g) => g.categories.some((c) => c.code === "administrative"));
    expect(general?.categories.map((c) => c.code).sort()).toEqual(["administrative", "finance", "pgde"]);
    expect(general?.papers.map((p) => p.effectiveWeightage)).toEqual([15, 15, 40]);
  });
  it("produces four distinct paper sets", () => {
    expect(groups).toHaveLength(4);
  });
  it("B.Ed papers and components follow its own weightage", () => {
    const bed = groups.find((g) => g.categories.some((c) => c.code === "bed"))!;
    expect(bed.papers.map((p) => p.effectiveWeightage)).toEqual([15, 15, 30]);
    expect(bed.components.map((c) => c.weightage_percent)).toEqual([20, 60, 20]);
  });
  it("written-examination weight equals the sum of paper weights in every group", () => {
    for (const g of groups) {
      const we = g.components.find((c) => c.component === "written_examination")!.weightage_percent;
      expect(g.papers.reduce((a, p) => a + (p.effectiveWeightage ?? 0), 0)).toBe(we);
    }
  });
});

describe("effectivePrice", () => {
  const base = { price: 499, promo_price: 399, promo_starts_at: "2027-01-01T00:00:00Z", promo_ends_at: "2027-02-01T00:00:00Z" };
  it("applies a promotion only inside its window", () => {
    expect(effectivePrice(base, new Date("2026-12-31T00:00:00Z"))).toEqual({ price: 499, promo: false });
    expect(effectivePrice(base, new Date("2027-01-15T00:00:00Z"))).toEqual({ price: 399, promo: true });
    expect(effectivePrice(base, new Date("2027-02-02T00:00:00Z"))).toEqual({ price: 499, promo: false });
    expect(effectivePrice({ ...base, promo_price: null }, new Date())).toEqual({ price: 499, promo: false });
  });
});
