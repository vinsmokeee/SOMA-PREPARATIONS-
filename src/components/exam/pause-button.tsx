"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Dialog } from "radix-ui";
import { Pause } from "lucide-react";
import { pauseAttempt } from "@/app/exam/actions";

/** The honesty reminder shown right after pausing (founder, 22 Nov 2026: no time limit on a pause). */
export function HonestyNote({ onClose }: { onClose?: () => void }) {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-ink/50 p-6" role="alertdialog" aria-live="assertive" aria-label="Exam paused" onClick={onClose}>
      <div className="w-full max-w-sm rounded-2xl bg-background p-6 text-center shadow-xl">
        <Pause className="mx-auto size-8 text-slate-600" aria-hidden />
        <p className="mt-3 font-serif text-xl font-semibold text-ink">Please don&apos;t cheat</p>
        <p className="mt-2 text-[15px] leading-relaxed text-muted-foreground">
          This is a practice exam. Looking up answers while it is paused only cheats yourself: your marks would not show what you really know.
        </p>
        <p className="mt-3 text-sm font-medium text-ink">Your exam is paused. Continue it any time from Paused exam.</p>
        {onClose ? (
          <button type="button" onClick={onClose} className="mt-5 h-11 w-full rounded-xl bg-slate-700 text-sm font-semibold text-white">OK, I understand</button>
        ) : null}
      </div>
    </div>
  );
}

/** Pause button for screens outside the writing room (the "choose your questions" paper). */
export function PauseButton({ attemptId, stage }: { attemptId: string; stage: "PE" | "ME" }) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [busy, setBusy] = useState(false);
  const [done, setDone] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const pause = async () => {
    setBusy(true); setError(null);
    const r = await pauseAttempt(attemptId).catch(() => ({ ok: false as const, message: undefined }));
    setBusy(false);
    if (!r.ok) { setError(r.message ?? "The examination could not be paused. Please try again."); return; }
    setOpen(false);
    setDone(true);
    // Straight to Paused exam, which shows the honesty reminder (founder, 23 Nov 2026: it must always appear).
    router.replace(`/dashboard/paused?stage=${stage}&paused=1`);
  };
  return (
    <>
      <button type="button" onClick={() => setOpen(true)} className="inline-flex shrink-0 items-center gap-1 rounded-md border border-border-strong px-2.5 py-1.5 text-xs font-semibold text-ink hover:bg-muted">
        <Pause className="size-3.5" aria-hidden /> Pause
      </button>
      <Dialog.Root open={open} onOpenChange={setOpen}>
        <Dialog.Portal>
          <Dialog.Overlay className="fixed inset-0 z-40 bg-ink/40" />
          <Dialog.Content className="fixed left-1/2 top-1/2 z-50 w-[calc(100%-2rem)] max-w-md -translate-x-1/2 -translate-y-1/2 rounded-2xl bg-background p-6 shadow-xl focus:outline-none">
            <Dialog.Title className="font-serif text-xl font-semibold text-ink">Pause your examination?</Dialog.Title>
            <Dialog.Description className="mt-2 text-[15px] leading-relaxed text-muted-foreground">
              The timer stops where it is. Continue any time from <strong className="text-ink">Paused exam</strong> on your home page. You cannot start another mock test until you finish this one.
            </Dialog.Description>
            {error ? <p role="alert" className="mt-3 text-sm font-medium text-danger">{error}</p> : null}
            <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
              <Dialog.Close className="h-11 rounded-md border border-border-strong px-4 text-sm font-medium">Keep working</Dialog.Close>
              <button type="button" disabled={busy} onClick={() => void pause()} className="h-11 rounded-md bg-slate-700 px-4 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60">
                {busy ? "Pausing…" : "Pause examination"}
              </button>
            </div>
          </Dialog.Content>
        </Dialog.Portal>
      </Dialog.Root>
      {done ? <HonestyNote /> : null}
    </>
  );
}
