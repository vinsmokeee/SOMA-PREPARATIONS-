"use client";

import type { ReactNode } from "react";
import { usePathname } from "next/navigation";

/** Student area colours follow the page being shown: PE pages orange, ME pages maroon; other pages use the student's exam. */
export function ExamThemeRoot({ fallback, className, children }: { fallback: "PE" | "ME"; className: string; children: ReactNode }) {
  const path = usePathname() ?? "";
  const stage = path.startsWith("/dashboard/me") ? "ME" : path.startsWith("/dashboard/pe") ? "PE" : fallback;
  return <div data-exam={stage} className={className}>{children}</div>;
}
