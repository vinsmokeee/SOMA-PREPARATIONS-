"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Crown, Sparkles } from "lucide-react";
import { createMockAction, type StartState } from "@/app/exam/actions";

/** Premium: "New mock test" with fresh questions. Free: one test a day, then Premium. */
export function MockCta({ premium }: { premium: boolean }) {
  const [state, action, pending] = useActionState(createMockAction, {} as StartState);
  if (!premium) {
    return (
      <Link href="/dashboard/subscription/checkout/pe-premium" className="flex items-center gap-3 rounded-2xl bg-yellow-100 p-4 text-yellow-950 ring-1 ring-yellow-300">
        <Crown className="size-6 shrink-0 text-yellow-700" aria-hidden />
        <span className="text-sm">
          <span className="block font-bold">Want another mock test today?</span>
          Free accounts get one mock test a day. Join PE Premium for unlimited mock tests, a new set of questions every time.
        </span>
      </Link>
    );
  }
  return (
    <form action={action} className="rounded-3xl bg-gradient-to-br from-amber-400 via-orange-500 to-orange-700 p-5 text-white shadow-xl">
      <p className="flex items-center gap-2 text-lg font-extrabold"><Sparkles className="size-5 text-yellow-200" aria-hidden /> New mock test</p>
      <p className="mt-1 text-sm text-white/90">A fresh 100-question PE across all four sections: past-paper style questions, new ones made from them, and some you got wrong before. Timed like the real PE.</p>
      <button type="submit" disabled={pending} className="mt-4 h-12 w-full rounded-2xl bg-white text-base font-bold text-[#9a3412] shadow-lg disabled:opacity-60">
        {pending ? "Preparing your test…" : "Start a new mock test"}
      </button>
      {state.error ? <p role="alert" className="mt-2 text-sm font-medium">{state.error}</p> : null}
    </form>
  );
}
