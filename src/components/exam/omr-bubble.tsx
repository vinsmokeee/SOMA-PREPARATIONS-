"use client";

import { useRef, useState } from "react";
import { judgeShading, measureShading } from "@/lib/exam/omr";
import type { MarkQuality } from "@/lib/exam/types";
import { cn } from "@/lib/utils";

const BOX = 64; // drawing area (CSS px): room to see pencil going outside the circle
const R = 20; // the circle a student must shade
const PEN = 7; // pencil width in CSS px

/**
 * An empty OMR circle the student shades with a finger, mouse or stylus, like a pencil on the answer sheet.
 * After each stroke the shading is judged and reported with `onShade`. `quality` is the saved result, shown
 * as a picture when the circle is not being drawn on (for example after coming back to a question).
 * Give it a new `key` to wipe it (after "Erase", or when another circle is chosen).
 */
export function OmrBubble({ label, quality, onShade, disabled }: {
  label: string;
  quality: MarkQuality | null;
  onShade: (q: MarkQuality) => void;
  disabled?: boolean;
}) {
  const ref = useRef<HTMLCanvasElement>(null);
  const drawing = useRef(false);
  // Has the student drawn on this circle since it appeared? (The parent remounts it when the answer is erased.)
  const [drew, setDrew] = useState(false);
  const last = useRef<{ x: number; y: number } | null>(null);

  const ctx = () => {
    const c = ref.current;
    if (!c) return null;
    const dpr = Math.min(3, window.devicePixelRatio || 1);
    if (c.width !== BOX * dpr) { c.width = BOX * dpr; c.height = BOX * dpr; }
    const g = c.getContext("2d");
    if (!g) return null;
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.strokeStyle = "#2b2b2b"; g.fillStyle = "#2b2b2b";
    g.lineWidth = PEN; g.lineCap = "round"; g.lineJoin = "round";
    return g;
  };
  const point = (e: React.PointerEvent) => {
    const rect = ref.current!.getBoundingClientRect();
    return { x: ((e.clientX - rect.left) / rect.width) * BOX, y: ((e.clientY - rect.top) / rect.height) * BOX };
  };

  const down = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (disabled) return;
    e.preventDefault();
    ref.current?.setPointerCapture(e.pointerId);
    drawing.current = true;
    setDrew(true);
    const p = point(e);
    last.current = p;
    const g = ctx();
    g?.beginPath(); g?.arc(p.x, p.y, PEN / 2, 0, Math.PI * 2); g?.fill();
  };
  const move = (e: React.PointerEvent<HTMLCanvasElement>) => {
    if (!drawing.current) return;
    const p = point(e);
    const g = ctx();
    if (g && last.current) { g.beginPath(); g.moveTo(last.current.x, last.current.y); g.lineTo(p.x, p.y); g.stroke(); }
    last.current = p;
  };
  const up = () => {
    if (!drawing.current) return;
    drawing.current = false;
    last.current = null;
    const c = ref.current;
    const g = c?.getContext("2d");
    if (!c || !g) return;
    const img = g.getImageData(0, 0, c.width, c.height);
    const alpha = new Uint8ClampedArray(c.width * c.height);
    for (let i = 0; i < alpha.length; i++) alpha[i] = img.data[i * 4 + 3];
    const scale = c.width / BOX;
    onShade(judgeShading(measureShading(alpha, c.width, c.height, (BOX / 2) * scale, (BOX / 2) * scale, R * scale)));
  };

  // A saved answer with no drawing on this screen: show how it was shaded.
  const showSaved = quality !== null && !drew;
  return (
    <span className="relative inline-block shrink-0" style={{ width: BOX, height: BOX }}>
      <span aria-hidden className="absolute rounded-full border-2 border-ink/60 bg-white" style={{ left: BOX / 2 - R, top: BOX / 2 - R, width: R * 2, height: R * 2 }} />
      {showSaved ? (
        <span aria-hidden className={cn("absolute rounded-full",
          quality === "good" ? "bg-[#2b2b2b]" : quality === "too_light" ? "bg-[#2b2b2b]/35" : "bg-[#2b2b2b]")}
          style={quality === "outside"
            ? { left: BOX / 2 - R - 6, top: BOX / 2 - R - 4, width: R * 2 + 12, height: R * 2 + 8 }
            : quality === "too_light"
              ? { left: BOX / 2 - R / 2, top: BOX / 2 - R / 2, width: R, height: R }
              : { left: BOX / 2 - R, top: BOX / 2 - R, width: R * 2, height: R * 2 }} />
      ) : null}
      <canvas
        ref={ref}
        width={BOX}
        height={BOX}
        role="img"
        aria-label={`Circle ${label}: shade it with your finger`}
        onPointerDown={down}
        onPointerMove={move}
        onPointerUp={up}
        onPointerCancel={up}
        className={cn("absolute inset-0 touch-none", disabled ? "cursor-not-allowed" : "cursor-crosshair")}
        style={{ width: BOX, height: BOX }}
      />
      <span aria-hidden className="pointer-events-none absolute -bottom-0.5 left-0 right-0 text-center text-[10px] font-bold text-muted-foreground">{label}</span>
    </span>
  );
}
