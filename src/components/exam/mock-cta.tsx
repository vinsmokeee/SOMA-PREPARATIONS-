"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Crown, Sparkles } from "lucide-react";
import { createMockAction, type StartState } from "@/app/exam/actions";

/** Free accounts: one practice or mock test a day, then a note to join Premium. */
export function FreeLimitNote({ title = "You have used today's free practice" }: { title?: string }) {
  return (
    <Link href="/dashboard/pe?plans=1" role="status" className="flex items-center gap-3 rounded-2xl bg-yellow-100 p-4 text-yellow-950 ring-1 ring-yellow-300">
      <Crown className="size-6 shrink-0 text-yellow-700" aria-hidden />
      <span className="text-sm">
        <span className="block font-bold">{title}</span>
        Free accounts get one practice or mock test a day. Join PE Premium for unlimited practice and mock tests, with new questions every time. Or come back tomorrow.
      </span>
    </Link>
  );
}

const FREE_LIMIT = "FREE_DAILY_LIMIT";

/** Premium: "New mock test" with fresh questions. Free: one test a day, then Premium. */
export function MockCta({ premium }: { premium: boolean }) {
  const [state, action, pending] = useActionState(createMockAction, {} as StartState);
  if (!premium) {
    if (state.error === FREE_LIMIT) return <FreeLimitNote title="You have taken today’s free test" />;
    return (
      <form action={action} className="rounded-3xl bg-gradient-to-br from-amber-400 via-orange-500 to-orange-700 p-5 text-white shadow-xl">
        <p className="flex items-center gap-2 text-lg font-extrabold"><Sparkles className="size-5 text-yellow-200" aria-hidden /> Today’s free mock test</p>
        <p className="mt-1 text-sm text-white/90">A full PE test from real BCSE past papers, across all four sections, timed like the real exam. Free accounts get one test a day; Premium is unlimited.</p>
        <button type="submit" disabled={pending} className="mt-4 h-12 w-full rounded-2xl bg-white text-base font-bold text-[#9a3412] shadow-lg disabled:opacity-60">
          {pending ? "Preparing your test…" : "Start today’s free mock test"}
        </button>
        {state.error ? <p role="alert" className="mt-2 text-sm font-medium">{state.error}</p> : null}
      </form>
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
