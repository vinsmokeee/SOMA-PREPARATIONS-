import { describe, expect, it } from "vitest";
import { judgeShading, measureShading } from "@/lib/exam/omr";

/** Build an alpha channel with a painted disc of radius `paint` around the centre, optionally offset. */
function canvas(size: number, paint: (x: number, y: number) => boolean) {
  const a = new Uint8ClampedArray(size * size);
  for (let y = 0; y < size; y++) for (let x = 0; x < size; x++) a[y * size + x] = paint(x + 0.5, y + 0.5) ? 255 : 0;
  return a;
}

describe("OMR shading", () => {
  const S = 80, C = 40, R = 24;
  it("accepts a fully shaded circle", () => {
    const m = measureShading(canvas(S, (x, y) => Math.hypot(x - C, y - C) <= R), S, S, C, C, R);
    expect(m.fill).toBeGreaterThan(0.95);
    expect(judgeShading(m)).toBe("good");
  });
  it("flags a light tick in the middle as too little", () => {
    const m = measureShading(canvas(S, (x, y) => Math.hypot(x - C, y - C) <= 10), S, S, C, C, R);
    expect(judgeShading(m)).toBe("too_light");
  });
  it("flags shading that spills well outside the circle", () => {
    const m = measureShading(canvas(S, (x, y) => Math.hypot(x - C, y - C) <= 36), S, S, C, C, R);
    expect(judgeShading(m)).toBe("outside");
  });
  it("forgives a hair over the edge", () => {
    const m = measureShading(canvas(S, (x, y) => Math.hypot(x - C, y - C) <= R + 2), S, S, C, C, R);
    expect(judgeShading(m)).toBe("good");
  });
  it("reports nothing for an empty circle", () => {
    expect(judgeShading(measureShading(new Uint8ClampedArray(S * S), S, S, C, C, R))).toBe("too_light");
  });
});
