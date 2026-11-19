"use client";

import { useState } from "react";
import Link from "next/link";
import { BarChart3, X } from "lucide-react";

/** After a test: "Check your score below" pointing to My scores (founder, 20 Nov 2026). */
export function ScoresHint() {
  const [open, setOpen] = useState(true);
  if (!open) return null;
  return (
    <div className="fixed inset-x-0 bottom-24 z-40 flex justify-center px-4" role="dialog" aria-labelledby="scores-hint-title">
      <div className="relative w-full max-w-md rounded-3xl bg-ink p-5 text-white shadow-2xl">
        <button type="button" onClick={() => setOpen(false)} className="absolute right-3 top-3 rounded-full p-1 text-white/70 hover:bg-white/10" aria-label="Close">
          <X className="size-5" aria-hidden />
        </button>
        <p id="scores-hint-title" className="flex items-center gap-2 text-lg font-extrabold">
          <BarChart3 className="size-5 text-pink-300" aria-hidden /> Check your score below
        </p>
        <p className="mt-1 text-sm text-white/85">Open <b>My scores</b> to see your marks, your strongest and weakest sections, and how you are improving.</p>
        <div className="mt-4 flex gap-2">
          <Link href="/dashboard/analytics" className="inline-flex h-11 flex-1 items-center justify-center rounded-2xl bg-gradient-to-br from-fuchsia-600 to-pink-500 text-sm font-bold">Open My scores</Link>
          <button type="button" onClick={() => setOpen(false)} className="inline-flex h-11 items-center justify-center rounded-2xl px-4 text-sm font-semibold text-white/85 ring-1 ring-white/30">Later</button>
        </div>
      </div>
    </div>
  );
}
