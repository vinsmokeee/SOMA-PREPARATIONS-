import type { MarkQuality } from "./types";

/**
 * OMR shading check. A scanner reads a circle only when it is shaded well: enough of the circle filled, and no
 * pencil spilling outside it. These limits follow the usual advice on OMR sheets ("fill the circle completely,
 * do not go outside it") and are deliberately a little strict, so practice prepares students for the real sheet.
 */
export const OMR_MIN_FILL = 0.6; // at least 60% of the circle shaded
export const OMR_MAX_OUTSIDE = 0.12; // pencil outside the circle: no more than 12% of the circle's area

export type ShadingMeasure = { fill: number; outside: number };

export function judgeShading(m: ShadingMeasure): MarkQuality {
  if (m.outside > OMR_MAX_OUTSIDE) return "outside";
  if (m.fill < OMR_MIN_FILL) return "too_light";
  return "good";
}

/**
 * Measure the shading on a canvas: `alpha` is the alpha channel of every pixel (row by row), the circle has centre
 * (cx, cy) and radius r in pixels. A small margin around the edge counts as inside, as a scanner allows.
 */
export function measureShading(alpha: ArrayLike<number>, width: number, height: number, cx: number, cy: number, r: number): ShadingMeasure {
  const margin = Math.max(2, r * 0.12);
  let inside = 0, filled = 0, spill = 0;
  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      const d = Math.hypot(x + 0.5 - cx, y + 0.5 - cy);
      const ink = alpha[y * width + x] > 40;
      if (d <= r) { inside++; if (ink) filled++; }
      else if (d > r + margin && ink) spill++;
    }
  }
  return inside ? { fill: filled / inside, outside: spill / inside } : { fill: 0, outside: 0 };
}

export const MARK_MESSAGES: Record<MarkQuality, { title: string; tip: string }> = {
  good: { title: "Good shading", tip: "A scanner would read this answer." },
  too_light: { title: "Too little shading", tip: "Shade the whole circle, edge to edge. A scanner may not read a light or partly shaded circle." },
  outside: { title: "Shading went outside the circle", tip: "Keep the pencil inside the circle. Marks outside it can make the scanner skip your answer." },
};
