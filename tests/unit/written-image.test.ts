import { describe, expect, it } from "vitest";
import { analyseGrey, qualityWarnings } from "@/lib/written/image";

function page(w: number, h: number, draw: (x: number, y: number) => number) {
  const g = new Uint8ClampedArray(w * h);
  for (let y = 0; y < h; y++) for (let x = 0; x < w; x++) g[y * w + x] = draw(x, y);
  return g;
}
const big = { width: 1500, height: 2000 };
const codes = (g: Uint8ClampedArray, w: number, h: number, size = big) => qualityWarnings(analyseGrey(g, w, h, size)).map((x) => x.code);

describe("photo quality checks", () => {
  // White page with sharp dark "text lines" away from the edges
  const sharp = page(120, 160, (x, y) => (y > 20 && y < 140 && x > 10 && x < 110 && y % 6 === 0 && x % 3 !== 0 ? 20 : 240));
  it("accepts a sharp, well-lit page", () => expect(codes(sharp, 120, 160)).toEqual([]));
  it("detects blur", () => {
    const blurred = page(120, 160, (x, y) => 160 + 40 * Math.sin(y / 12));
    expect(codes(blurred, 120, 160)).toContain("blurry");
  });
  it("detects dark and blank pages", () => {
    expect(codes(page(120, 160, (x, y) => (y % 6 === 0 ? 5 : 50)), 120, 160)).toContain("dark");
    expect(codes(page(120, 160, () => 230), 120, 160)).toContain("blank");
  });
  it("detects small photos and writing at the edge", () => {
    expect(codes(sharp, 120, 160, { width: 400, height: 600 })).toContain("small");
    const edge = page(120, 160, (x, y) => (x < 4 && y % 2 === 0 ? 10 : y % 6 === 0 && x % 3 !== 0 ? 20 : 240));
    expect(codes(edge, 120, 160)).toContain("cut_off");
  });
});
