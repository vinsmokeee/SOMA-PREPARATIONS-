"use client";

import Link from "next/link";
import { useActionState, useState, useSyncExternalStore } from "react";
import { Crown, PencilLine, Sparkles, X } from "lucide-react";
import { createMockAction, type StartState } from "@/app/exam/actions";

/** Free accounts: one practice or mock test a day, then a note to join Premium. */
export function FreeLimitNote({ title = "You have used today's free practice" }: { title?: string }) {
  return (
    <Link href="/dashboard/pe?plans=1" role="status" className="flex items-center gap-3 rounded-2xl bg-yellow-100 p-4 text-yellow-950 ring-1 ring-yellow-300">
      <Crown className="size-6 shrink-0 text-yellow-700" aria-hidden />
      <span className="text-sm">
        <span className="block font-bold">{title}</span>
        Free accounts get one 25-question test a day. Join PE Premium for full 100-question mock tests and unlimited practice, with new questions every time. Or come back tomorrow.
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
        <p className="flex items-center gap-2 text-lg font-extrabold"><Sparkles className="size-5 text-yellow-200" aria-hidden /> Today’s free test</p>
        <p className="mt-1 text-sm text-white/90">25 BCSE-style questions (real past-paper questions and new ones like them), about 6 from each section, timed like the real exam (about 38 minutes). One free test a day. Premium: full 100-question mock tests, unlimited.</p>
        <StartButton pending={pending} label="Start today’s free test" />
        {state.error ? <p role="alert" className="mt-2 text-sm font-medium">{state.error}</p> : null}
      </form>
    );
  }
  return (
    <form action={action} className="rounded-3xl bg-gradient-to-br from-amber-400 via-orange-500 to-orange-700 p-5 text-white shadow-xl">
      <p className="flex items-center gap-2 text-lg font-extrabold"><Sparkles className="size-5 text-yellow-200" aria-hidden /> New mock test</p>
      <p className="mt-1 text-sm text-white/90">A fresh 100-question PE across all four sections: past-paper style questions, new ones made from them, and some you got wrong before. Timed like the real PE.</p>
      <StartButton pending={pending} label="Start a new mock test" />
      {state.error ? <p role="alert" className="mt-2 text-sm font-medium">{state.error}</p> : null}
    </form>
  );
}

const REMINDER_OFF = "soma-omr-reminder-off";
const subscribe = (cb: () => void) => { window.addEventListener("storage", cb); return () => window.removeEventListener("storage", cb); };
const reminderOff = () => { try { return localStorage.getItem(REMINDER_OFF) === "1"; } catch { return false; } };

/**
 * The start button of a mock test. First it offers OMR shading practice (founder, 19 Nov 2026): badly shaded circles
 * are not counted, so a minute of practice protects the student's marks. "Don't show this again" is remembered on the device.
 */
function StartButton({ pending, label }: { pending: boolean; label: string }) {
  const off = useSyncExternalStore(subscribe, reminderOff, () => false);
  const [open, setOpen] = useState(false);
  const [dontShow, setDontShow] = useState(false);
  const cls = "mt-4 h-12 w-full rounded-2xl bg-white text-base font-bold text-[#9a3412] shadow-lg disabled:opacity-60";
  if (off) return <button type="submit" disabled={pending} className={cls}>{pending ? "Preparing your test…" : label}</button>;
  const remember = () => { if (dontShow) { try { localStorage.setItem(REMINDER_OFF, "1"); } catch { /* private mode */ } } };
  return (
    <>
      <button type="button" disabled={pending} onClick={() => setOpen(true)} className={cls}>{pending ? "Preparing your test…" : label}</button>
      {open ? (
        <div className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center" role="dialog" aria-modal="true" aria-labelledby="omr-reminder-title">
          <div className="relative w-full max-w-md rounded-3xl bg-background p-6 text-ink shadow-2xl">
            <button type="button" onClick={() => setOpen(false)} className="absolute right-4 top-4 rounded-full p-1 text-muted-foreground hover:bg-muted" aria-label="Close">
              <X className="size-5" aria-hidden />
            </button>
            <span className="inline-flex size-12 items-center justify-center rounded-2xl bg-slate-700 text-white"><PencilLine className="size-6" aria-hidden /></span>
            <h2 id="omr-reminder-title" className="mt-3 text-xl font-extrabold">Practise OMR shading first?</h2>
            <p className="mt-1 text-sm text-muted-foreground">
              In this test you answer by shading circles, like the OMR sheet in the real PE. A circle shaded too lightly or outside
              the line is not counted, even if your answer is right. A minute of practice helps you keep every mark.
            </p>
            <a href="/dashboard/omr-practice" onClick={remember} className="mt-5 flex h-12 w-full items-center justify-center gap-2 rounded-2xl bg-slate-700 text-base font-bold text-white shadow">
              <PencilLine className="size-5" aria-hidden /> Practise OMR shading
            </a>
            <button type="submit" disabled={pending} onClick={remember} className="mt-2 h-12 w-full rounded-2xl border border-border-strong bg-white text-base font-bold text-[#9a3412] disabled:opacity-60">
              {pending ? "Preparing your test…" : "Start the test now"}
            </button>
            <label className="mt-3 flex items-center justify-center gap-2 text-sm text-muted-foreground">
              <input type="checkbox" checked={dontShow} onChange={(e) => setDontShow(e.target.checked)} className="size-4" /> Don’t show this again
            </label>
          </div>
        </div>
      ) : null}
    </>
  );
}
