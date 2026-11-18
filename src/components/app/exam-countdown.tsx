"use client";

import { useActionState, useEffect, useState, useSyncExternalStore } from "react";
import Link from "next/link";
import { CalendarClock, PartyPopper, X } from "lucide-react";
import { saveExamDateAction, type ExamDateState } from "@/app/dashboard/exam-date-actions";
import { bhutanToday, COUNTDOWN_STORAGE_KEY, countdownLabel, daysUntil, examDayNote, readSavedCountdown, type CountdownStage, type SavedCountdown } from "@/lib/student/countdown";
import { cn } from "@/lib/utils";

const DISMISS_KEY = "soma-exam-countdown-later";

// The current minute, so the number of days changes at midnight without a reload. Null while rendering on the server.
function subscribeMinute(cb: () => void) {
  const t = setInterval(cb, 60_000);
  document.addEventListener("visibilitychange", cb);
  return () => { clearInterval(t); document.removeEventListener("visibilitychange", cb); };
}
const useMinute = () => useSyncExternalStore(subscribeMinute, () => Math.floor(Date.now() / 60_000), () => null);

function subscribeStorage(cb: () => void) {
  window.addEventListener("storage", cb);
  return () => window.removeEventListener("storage", cb);
}
function storageGet(store: "local" | "session", key: string): string | null {
  try { return (store === "local" ? localStorage : sessionStorage).getItem(key); } catch { return null; }
}
function storageSet(store: "local" | "session", key: string, value: string) {
  try { (store === "local" ? localStorage : sessionStorage).setItem(key, value); } catch { /* private mode: ignore */ }
}

/** The countdown chip. Days are worked out on the device, so it keeps counting on its own. */
function Chip({ saved, onClick, href }: { saved: SavedCountdown; onClick?: () => void; href?: string }) {
  const minute = useMinute();
  if (minute === null) return null;
  const days = daysUntil(saved.date, new Date(minute * 60_000));
  if (days === null) return null;
  const cls = cn("inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-bold shadow-sm ring-1",
    days < 0 ? "bg-muted text-muted-foreground ring-border-strong" : "bg-primary text-primary-foreground ring-primary");
  const body = <><CalendarClock className="size-3.5" aria-hidden /> {countdownLabel(saved.stage, days)}</>;
  if (href) return <Link href={href} className={cls} aria-label={`${countdownLabel(saved.stage, days)}. Open Soma`}>{body}</Link>;
  return <button type="button" onClick={onClick} className={cls} aria-label={`${countdownLabel(saved.stage, days)}. Change your exam date`}>{body}</button>;
}

/**
 * Student area: the exam-day countdown at the top left, and the pop-up that asks for the exam date
 * (shown until the student enters it; "Later" hides it until their next visit).
 */
export function ExamCountdown({ saved: fromServer, ask, defaultStage }: { saved: SavedCountdown | null; ask: boolean; defaultStage: CountdownStage }) {
  const [state, action, pending] = useActionState(saveExamDateAction, {} as ExamDateState);
  const justSaved: SavedCountdown | null = state.ok && state.stage && state.date ? { stage: state.stage, date: state.date } : null;
  const saved = justSaved ?? fromServer;
  const dismissed = useSyncExternalStore(subscribeStorage, () => storageGet("session", DISMISS_KEY) === "1", () => true);
  const [manual, setManual] = useState<boolean | null>(null);
  const open = justSaved ? false : manual ?? (ask && !dismissed);

  // Keep a copy on this device so the countdown also shows when signed out.
  useEffect(() => { if (saved) storageSet("local", COUNTDOWN_STORAGE_KEY, JSON.stringify(saved)); }, [saved]);

  const later = () => { storageSet("session", DISMISS_KEY, "1"); setManual(false); };
  const [stage, setStage] = useState<CountdownStage>(saved?.stage ?? defaultStage);

  return (
    <>
      {saved ? <Chip saved={saved} onClick={() => setManual(true)} /> : (
        <button type="button" onClick={() => setManual(true)} className="inline-flex items-center gap-1.5 rounded-full bg-white px-3 py-1 text-xs font-bold text-primary shadow-sm ring-1 ring-border-strong">
          <CalendarClock className="size-3.5" aria-hidden /> Set exam date
        </button>
      )}
      {saved ? <ExamDayNote saved={saved} /> : null}
      {open ? (
        <div className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center" role="dialog" aria-modal="true" aria-labelledby="countdown-title">
          <form action={action} className="relative w-full max-w-md rounded-3xl bg-background p-6 shadow-2xl">
            <button type="button" onClick={later} className="absolute right-4 top-4 rounded-full p-1 text-muted-foreground hover:bg-muted" aria-label="Close">
              <X className="size-5" aria-hidden />
            </button>
            <p className="flex items-center gap-2 text-primary"><CalendarClock className="size-6" aria-hidden /></p>
            <h2 id="countdown-title" className="mt-2 text-xl font-extrabold text-ink">Set your exam countdown</h2>
            <p className="mt-1 text-sm text-muted-foreground">
              RCSC announces new PE and ME dates every year. Enter the date of your exam and Soma will count down the days for you.
            </p>
            <fieldset className="mt-4">
              <legend className="text-sm font-semibold text-ink">Which exam are you appearing for?</legend>
              <div className="mt-2 grid grid-cols-2 gap-2">
                {(["PE", "ME"] as const).map((s) => (
                  <label key={s} className={cn("flex cursor-pointer flex-col rounded-2xl border-2 p-3 text-sm", stage === s ? "border-primary bg-primary-soft" : "border-border-strong")}>
                    <input type="radio" name="stage" value={s} checked={stage === s} onChange={() => setStage(s)} className="sr-only" />
                    <span className="text-lg font-black text-ink">{s}</span>
                    <span className="text-xs text-muted-foreground">{s === "PE" ? "Preliminary Examination" : "Main Examination"}</span>
                  </label>
                ))}
              </div>
            </fieldset>
            <label className="mt-4 block text-sm font-semibold text-ink" htmlFor="exam-date">Exam date</label>
            <input id="exam-date" name="date" type="date" required min={bhutanToday()} defaultValue={saved?.stage === stage ? saved.date : undefined} key={stage}
              className="mt-1 h-12 w-full rounded-xl border border-border-strong bg-white px-3 text-base" />
            <p className="mt-1 text-xs text-muted-foreground">Use the date in RCSC&apos;s official announcement for your exam.</p>
            {state.error ? <p role="alert" className="mt-2 text-sm font-medium text-danger">{state.error}</p> : null}
            <button type="submit" disabled={pending} className="mt-5 h-12 w-full rounded-2xl bg-primary text-base font-bold text-primary-foreground shadow disabled:opacity-60">
              {pending ? "Saving…" : "Start my countdown"}
            </button>
            <button type="button" onClick={later} className="mt-2 h-10 w-full rounded-2xl text-sm font-semibold text-muted-foreground hover:bg-muted">
              Later
            </button>
          </form>
        </div>
      ) : null}
    </>
  );
}

/** Public pages: the countdown saved on this device, shown even when signed out. */
export function SavedCountdownChip() {
  const raw = useSyncExternalStore(subscribeStorage, () => storageGet("local", COUNTDOWN_STORAGE_KEY), () => null);
  const saved = readSavedCountdown(raw);
  return saved ? <Chip saved={saved} href="/dashboard" /> : null;
}

/** The day before and on the exam day: a good-luck card at the top of the student's pages. */
function ExamDayNote({ saved }: { saved: SavedCountdown }) {
  const minute = useMinute();
  const [hidden, setHidden] = useState(false);
  if (minute === null || hidden) return null;
  const days = daysUntil(saved.date, new Date(minute * 60_000));
  const note = days === null ? null : examDayNote(saved.stage, days);
  if (!note) return null;
  return (
    <div role="status" className="relative w-full overflow-hidden rounded-3xl bg-gradient-to-br from-amber-400 via-orange-500 to-rose-600 p-5 text-white shadow-xl">
      <span className="absolute -right-8 -top-8 size-32 rounded-full bg-white/15" aria-hidden />
      <button type="button" onClick={() => setHidden(true)} className="absolute right-3 top-3 rounded-full p-1 text-white/80 hover:bg-white/15" aria-label="Hide this message">
        <X className="size-5" aria-hidden />
      </button>
      <PartyPopper className="relative size-8 text-yellow-100" aria-hidden />
      <p className="relative mt-2 pr-6 text-xl font-extrabold">{note.title}</p>
      <p className="relative mt-1 text-sm leading-relaxed text-white/95">{note.body}</p>
      <div className="relative mt-4 flex justify-end">
        <Link href={`/dashboard/last-minute?stage=${saved.stage}`} className="inline-flex items-center gap-1.5 rounded-full bg-white px-4 py-2 text-sm font-bold text-[#9a3412] shadow">
          Last-minute summary →
        </Link>
      </div>
    </div>
  );
}
