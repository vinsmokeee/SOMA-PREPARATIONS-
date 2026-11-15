"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import { Dialog } from "radix-ui";
import { AlertTriangle, ChevronLeft, ChevronRight, Clock3, Flag, LayoutGrid, Loader2, Save, WifiOff, X } from "lucide-react";
import type { SaveInput, SaveResult, SubmitResult } from "@/app/exam/actions";
import { clockOffset, countWords, formatClock, questionState, remainingSeconds, type QuestionState } from "@/lib/exam/logic";
import type { AttemptPaper, PaperQuestion } from "@/lib/exam/types";
import { cn } from "@/lib/utils";
import { useAutosave } from "./use-autosave";

type Answer = { selected: string | null; text: string; flagged: boolean };
type LocalBackup = Record<string, Answer & { t: number }>;
type View = "question" | "review" | "sheet";

const TEXT_DEBOUNCE_MS = 1200;

export type ExamRoomProps = {
  paper: AttemptPaper;
  save: (input: SaveInput) => Promise<SaveResult>;
  submit: (attemptId: string) => Promise<SubmitResult>;
  onFinished: () => void;
};

function isWritten(q: PaperQuestion) {
  return q.type !== "mcq";
}

function isAnswered(q: PaperQuestion, a: Answer | undefined) {
  if (!a) return false;
  return isWritten(q) ? a.text.trim().length > 0 : Boolean(a.selected);
}

export function ExamRoom({ paper, save, submit, onFinished }: ExamRoomProps) {
  const attemptId = paper.attempt.id;
  const questions = paper.questions;
  const storageKey = `soma:attempt:${attemptId}`;

  // ---- answers ------------------------------------------------------------
  const [answers, setAnswers] = useState<Record<string, Answer>>(() => {
    const init: Record<string, Answer> = {};
    for (const a of paper.answers) {
      init[a.exam_question_id] = { selected: a.selected_option_id, text: a.text_answer ?? "", flagged: a.flagged };
    }
    return init;
  });

  const finishedRef = useRef(false);
  const finish = useCallback(() => {
    if (finishedRef.current) return;
    finishedRef.current = true;
    try {
      localStorage.removeItem(storageKey);
    } catch {}
    onFinished();
  }, [onFinished, storageKey]);

  const { enqueue, flush, drain, status, lastSavedAt, pendingCount } = useAutosave({ attemptId, save, onClosed: finish });

  const writeBackup = useCallback(
    (id: string, a: Answer) => {
      try {
        const raw = localStorage.getItem(storageKey);
        const data: LocalBackup = raw ? JSON.parse(raw) : {};
        data[id] = { ...a, t: Date.now() };
        localStorage.setItem(storageKey, JSON.stringify(data));
      } catch {}
    },
    [storageKey],
  );

  // Recover answers kept on this device that never reached the server.
  useEffect(() => {
    let backup: LocalBackup = {};
    try {
      backup = JSON.parse(localStorage.getItem(storageKey) ?? "{}");
    } catch {}
    const valid = new Set(questions.map((q) => q.exam_question_id));
    const restored: Record<string, Answer> = {};
    for (const [id, local] of Object.entries(backup)) {
      if (!valid.has(id)) continue;
      const server = paper.answers.find((a) => a.exam_question_id === id);
      const differs =
        !server ||
        (server.text_answer ?? "") !== local.text ||
        server.selected_option_id !== local.selected ||
        server.flagged !== local.flagged;
      if (differs) {
        restored[id] = { selected: local.selected, text: local.text, flagged: local.flagged };
        const q = questions.find((x) => x.exam_question_id === id)!;
        enqueue(
          id,
          isWritten(q)
            ? { textAnswer: local.text, flagged: local.flagged }
            : local.selected
              ? { selectedOptionId: local.selected, flagged: local.flagged }
              : { clearSelection: true, flagged: local.flagged },
          false,
        );
      }
    }
    if (Object.keys(restored).length > 0) {
      // eslint-disable-next-line react-hooks/set-state-in-effect -- one-time recovery from device storage
      setAnswers((prev) => ({ ...prev, ...restored }));
      void flush();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps -- run once on mount
  }, []);

  // ---- navigation & time per question ------------------------------------
  const [index, setIndex] = useState(0);
  const [view, setView] = useState<View>("question");
  const [paletteOpen, setPaletteOpen] = useState(false);
  const activeSince = useRef<number>(0);
  useEffect(() => {
    activeSince.current = Date.now();
  }, []);
  const current = questions[index];

  const takeTime = useCallback(() => {
    const now = Date.now();
    const secs = Math.round((now - activeSince.current) / 1000);
    activeSince.current = now;
    return Math.max(0, Math.min(600, secs));
  }, []);

  const textTimers = useRef(new Map<string, ReturnType<typeof setTimeout>>());

  const flushText = useCallback(
    (id: string) => {
      const t = textTimers.current.get(id);
      if (t) {
        clearTimeout(t);
        textTimers.current.delete(id);
      }
    },
    [],
  );

  const leaveQuestion = useCallback(() => {
    if (!current) return;
    flushText(current.exam_question_id);
    const delta = view === "question" ? takeTime() : 0;
    const a = answers[current.exam_question_id];
    if (isWritten(current) && a) {
      enqueue(current.exam_question_id, { textAnswer: a.text, timeSpentDelta: delta });
    } else if (delta > 0) {
      enqueue(current.exam_question_id, { timeSpentDelta: delta });
    }
  }, [answers, current, enqueue, flushText, takeTime, view]);

  const goTo = useCallback(
    (i: number) => {
      if (i < 0 || i >= questions.length) return;
      leaveQuestion();
      activeSince.current = Date.now();
      setIndex(i);
      setView("question");
      setPaletteOpen(false);
      window.scrollTo({ top: 0 });
    },
    [leaveQuestion, questions.length],
  );

  // Pause the per-question clock while the tab is hidden; save on hide.
  useEffect(() => {
    const onVis = () => {
      if (document.visibilityState === "hidden") {
        leaveQuestion();
        void flush();
      } else {
        activeSince.current = Date.now();
      }
    };
    document.addEventListener("visibilitychange", onVis);
    return () => document.removeEventListener("visibilitychange", onVis);
  }, [flush, leaveQuestion]);

  // ---- answering -----------------------------------------------------------
  const choose = (q: PaperQuestion, optionId: string) => {
    const prev = answers[q.exam_question_id] ?? { selected: null, text: "", flagged: false };
    const next = { ...prev, selected: prev.selected === optionId ? prev.selected : optionId };
    setAnswers((s) => ({ ...s, [q.exam_question_id]: next }));
    writeBackup(q.exam_question_id, next);
    enqueue(q.exam_question_id, { selectedOptionId: optionId });
  };

  const clearChoice = (q: PaperQuestion) => {
    const prev = answers[q.exam_question_id];
    if (!prev?.selected) return;
    const next = { ...prev, selected: null };
    setAnswers((s) => ({ ...s, [q.exam_question_id]: next }));
    writeBackup(q.exam_question_id, next);
    enqueue(q.exam_question_id, { clearSelection: true });
  };

  const write = (q: PaperQuestion, text: string) => {
    const prev = answers[q.exam_question_id] ?? { selected: null, text: "", flagged: false };
    const next = { ...prev, text };
    setAnswers((s) => ({ ...s, [q.exam_question_id]: next }));
    writeBackup(q.exam_question_id, next);
    flushText(q.exam_question_id);
    textTimers.current.set(
      q.exam_question_id,
      setTimeout(() => {
        textTimers.current.delete(q.exam_question_id);
        enqueue(q.exam_question_id, { textAnswer: text });
      }, TEXT_DEBOUNCE_MS),
    );
  };

  const toggleFlag = (q: PaperQuestion) => {
    const prev = answers[q.exam_question_id] ?? { selected: null, text: "", flagged: false };
    const next = { ...prev, flagged: !prev.flagged };
    setAnswers((s) => ({ ...s, [q.exam_question_id]: next }));
    writeBackup(q.exam_question_id, next);
    enqueue(q.exam_question_id, { flagged: next.flagged });
  };

  // ---- timer ---------------------------------------------------------------
  // Server time minus device time, measured once when the paper loads.
  const [offset] = useState(() => clockOffset(paper.attempt.server_now, Date.now()));
  const [remaining, setRemaining] = useState(() => remainingSeconds(paper.attempt.deadline_at, Date.now(), offset));
  const [announcement, setAnnouncement] = useState("");
  const warned = useRef({ five: false, one: false });

  useEffect(() => {
    const tick = () => setRemaining(remainingSeconds(paper.attempt.deadline_at, Date.now(), offset));
    const id = setInterval(tick, 500);
    return () => clearInterval(id);
  }, [offset, paper.attempt.deadline_at]);

  useEffect(() => {
    if (remaining <= 300 && remaining > 60 && !warned.current.five) {
      warned.current.five = true;
      setAnnouncement("5 minutes remaining.");
    } else if (remaining <= 60 && remaining > 0 && !warned.current.one) {
      warned.current.one = true;
      setAnnouncement("1 minute remaining. The examination will be submitted automatically.");
    }
  }, [remaining]);

  // ---- submission ----------------------------------------------------------
  const [submitting, setSubmitting] = useState<null | "manual" | "auto">(null);
  const [submitError, setSubmitError] = useState<string | null>(null);
  const [confirmOpen, setConfirmOpen] = useState(false);

  const doSubmit = useCallback(
    async (mode: "manual" | "auto") => {
      if (finishedRef.current) return;
      setSubmitting(mode);
      setSubmitError(null);
      setConfirmOpen(false);
      // Push any text still waiting for its debounce, then wait for saves.
      for (const id of [...textTimers.current.keys()]) {
        flushText(id);
        const q = questions.find((x) => x.exam_question_id === id);
        const a = answers[id];
        if (q && a) enqueue(id, { textAnswer: a.text });
      }
      if (current && view === "question") {
        const delta = takeTime();
        if (delta > 0) enqueue(current.exam_question_id, { timeSpentDelta: delta });
      }
      await drain(mode === "auto" ? 7000 : 10000);
      let result: SubmitResult;
      try {
        result = await submit(attemptId);
      } catch {
        result = { ok: false, error: "NETWORK" };
      }
      if (result.ok || result.error === "ATTEMPT_NOT_FOUND") {
        finish();
        return;
      }
      setSubmitting(null);
      setSubmitError(
        mode === "auto"
          ? "Time is up, but we could not reach the server. Your saved answers are safe and the examination will be submitted as soon as you reconnect."
          : "Your examination could not be submitted. Check your connection and try again — your answers are saved.",
      );
    },
    [answers, attemptId, current, drain, enqueue, finish, flushText, questions, submit, takeTime, view],
  );

  const autoTriggered = useRef(false);
  useEffect(() => {
    if (remaining === 0 && !autoTriggered.current) {
      autoTriggered.current = true;
      void doSubmit("auto");
    }
  }, [doSubmit, remaining]);

  // Warn before leaving with unsaved changes.
  useEffect(() => {
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      if (pendingCount > 0 || textTimers.current.size > 0) {
        e.preventDefault();
      }
    };
    window.addEventListener("beforeunload", onBeforeUnload);
    return () => window.removeEventListener("beforeunload", onBeforeUnload);
  }, [pendingCount]);

  // ---- derived -------------------------------------------------------------
  const states: QuestionState[] = questions.map((q) => {
    const a = answers[q.exam_question_id];
    return questionState(isAnswered(q, a), Boolean(a?.flagged));
  });
  const answeredCount = states.filter((s) => s === "answered" || s === "answered_flagged").length;
  const flaggedCount = states.filter((s) => s === "flagged" || s === "answered_flagged").length;
  const unansweredCount = questions.length - answeredCount;
  const lowTime = remaining <= 300;
  const hasMcq = questions.some((q) => !isWritten(q));

  return (
    <div className="flex min-h-dvh flex-col bg-background">
      <p className="sr-only" aria-live="assertive">{announcement}</p>

      {/* Header: title, save status and the always-visible timer */}
      <header className="sticky top-0 z-30 border-b border-border bg-background/95 backdrop-blur">
        <div className="mx-auto flex h-14 max-w-6xl items-center gap-3 px-3 sm:h-16 sm:px-6">
          <div className="min-w-0 flex-1">
            <p className="truncate text-sm font-semibold text-ink sm:text-base">{paper.exam.title}</p>
            <p className="text-xs text-muted-foreground">
              {view === "review" ? "Final review" : view === "sheet" ? "Answer sheet" : `Question ${index + 1} of ${questions.length}`}
              <span className="hidden sm:inline"> · {answeredCount} answered</span>
            </p>
          </div>
          <SaveIndicator status={status} pending={pendingCount} lastSavedAt={lastSavedAt} />
          <div
            role="timer"
            aria-label={`Time remaining ${formatClock(remaining)}`}
            className={cn(
              "flex items-center gap-1.5 rounded-md px-2.5 py-1.5 font-mono text-sm font-semibold tabular-nums sm:text-base",
              lowTime ? "bg-danger text-white" : "bg-ink text-white",
            )}
          >
            <Clock3 className="size-4" aria-hidden />
            {formatClock(remaining)}
          </div>
        </div>
      </header>

      <div className="mx-auto flex w-full max-w-6xl flex-1 gap-8 px-3 pb-28 pt-5 sm:px-6 lg:pb-10">
        <main id="main" className="min-w-0 flex-1">
          {view === "question" && current ? (
            <QuestionView
              q={current}
              answer={answers[current.exam_question_id]}
              onChoose={(id) => choose(current, id)}
              onClear={() => clearChoice(current)}
              onWrite={(t) => write(current, t)}
              onBlurText={() => {
                const a = answers[current.exam_question_id];
                flushText(current.exam_question_id);
                if (a) enqueue(current.exam_question_id, { textAnswer: a.text });
              }}
            />
          ) : null}
          {view === "review" ? (
            <ReviewView
              questions={questions}
              states={states}
              answered={answeredCount}
              unanswered={unansweredCount}
              flagged={flaggedCount}
              onGo={goTo}
              onSubmit={() => setConfirmOpen(true)}
            />
          ) : null}
          {view === "sheet" ? (
            <AnswerSheet questions={questions} answers={answers} onChoose={(q, id) => choose(q, id)} onGo={goTo} />
          ) : null}
        </main>

        {/* Desktop side panel */}
        <aside className="hidden w-72 shrink-0 lg:block">
          <div className="sticky top-24 space-y-5">
            <Palette questions={questions} states={states} current={view === "question" ? index : -1} onGo={goTo} />
            <div className="space-y-2">
              {hasMcq && paper.exam.omr_mode ? (
                <button type="button" onClick={() => { leaveQuestion(); setView(view === "sheet" ? "question" : "sheet"); }} className="w-full rounded-md border border-border-strong px-3 py-2 text-sm font-medium hover:bg-muted">
                  {view === "sheet" ? "Back to questions" : "Open answer sheet (OMR)"}
                </button>
              ) : null}
              <button type="button" onClick={() => { leaveQuestion(); setView("review"); }} className="w-full rounded-md bg-primary px-3 py-2.5 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">
                Review and submit
              </button>
            </div>
          </div>
        </aside>
      </div>

      {/* Footer navigation (fixed on mobile) */}
      {view === "question" && current ? (
        <footer className="fixed inset-x-0 bottom-0 z-30 border-t border-border bg-background/95 backdrop-blur lg:static lg:border-0 lg:bg-transparent">
          <div className="mx-auto flex max-w-6xl items-center gap-2 px-3 py-3 sm:px-6 lg:pb-8 lg:pr-[22rem]">
            <button type="button" onClick={() => goTo(index - 1)} disabled={index === 0} className="inline-flex h-11 items-center gap-1 rounded-md border border-border-strong px-3 text-sm font-medium disabled:opacity-40">
              <ChevronLeft className="size-4" aria-hidden /> <span className="hidden sm:inline">Previous</span>
            </button>
            <button
              type="button"
              onClick={() => toggleFlag(current)}
              aria-pressed={Boolean(answers[current.exam_question_id]?.flagged)}
              className={cn(
                "inline-flex h-11 items-center gap-1.5 rounded-md border px-3 text-sm font-medium",
                answers[current.exam_question_id]?.flagged ? "border-warning bg-warning-soft text-warning" : "border-border-strong",
              )}
            >
              <Flag className="size-4" aria-hidden />
              <span className="hidden sm:inline">{answers[current.exam_question_id]?.flagged ? "Marked for review" : "Mark for review"}</span>
              <span className="sm:hidden">Review</span>
            </button>
            <button type="button" onClick={() => setPaletteOpen(true)} className="inline-flex h-11 items-center gap-1.5 rounded-md border border-border-strong px-3 text-sm font-medium lg:hidden" aria-label="All questions">
              <LayoutGrid className="size-4" aria-hidden />
              <span className="tabular-nums">{answeredCount}/{questions.length}</span>
            </button>
            <div className="flex-1" />
            {index < questions.length - 1 ? (
              <button type="button" onClick={() => goTo(index + 1)} className="inline-flex h-11 items-center gap-1 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">
                Next <ChevronRight className="size-4" aria-hidden />
              </button>
            ) : (
              <button type="button" onClick={() => { leaveQuestion(); setView("review"); }} className="inline-flex h-11 items-center rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">
                Review answers
              </button>
            )}
          </div>
        </footer>
      ) : null}

      {view !== "question" ? (
        <footer className="fixed inset-x-0 bottom-0 z-30 border-t border-border bg-background/95 p-3 lg:hidden">
          <button type="button" onClick={() => setView("question")} className="h-11 w-full rounded-md border border-border-strong text-sm font-medium">
            Back to questions
          </button>
        </footer>
      ) : null}

      {/* Mobile palette */}
      <Dialog.Root open={paletteOpen} onOpenChange={setPaletteOpen}>
        <Dialog.Portal>
          <Dialog.Overlay className="fixed inset-0 z-40 bg-ink/30" />
          <Dialog.Content className="fixed inset-x-0 bottom-0 z-50 max-h-[80dvh] overflow-y-auto rounded-t-2xl bg-background p-5 shadow-xl focus:outline-none">
            <div className="mb-4 flex items-center justify-between">
              <Dialog.Title className="font-semibold text-ink">All questions</Dialog.Title>
              <Dialog.Description className="sr-only">Jump to any question</Dialog.Description>
              <Dialog.Close className="inline-flex size-9 items-center justify-center rounded-md hover:bg-muted" aria-label="Close">
                <X className="size-5" />
              </Dialog.Close>
            </div>
            <Palette questions={questions} states={states} current={index} onGo={goTo} />
            <div className="mt-5 grid gap-2">
              {hasMcq && paper.exam.omr_mode ? (
                <button type="button" onClick={() => { leaveQuestion(); setView("sheet"); setPaletteOpen(false); }} className="h-11 rounded-md border border-border-strong text-sm font-medium">
                  Open answer sheet (OMR)
                </button>
              ) : null}
              <button type="button" onClick={() => { leaveQuestion(); setView("review"); setPaletteOpen(false); }} className="h-11 rounded-md bg-primary text-sm font-semibold text-primary-foreground">
                Review and submit
              </button>
            </div>
          </Dialog.Content>
        </Dialog.Portal>
      </Dialog.Root>

      {/* Submit confirmation */}
      <Dialog.Root open={confirmOpen} onOpenChange={setConfirmOpen}>
        <Dialog.Portal>
          <Dialog.Overlay className="fixed inset-0 z-40 bg-ink/40" />
          <Dialog.Content className="fixed left-1/2 top-1/2 z-50 w-[calc(100%-2rem)] max-w-md -translate-x-1/2 -translate-y-1/2 rounded-2xl bg-background p-6 shadow-xl focus:outline-none">
            <Dialog.Title className="font-serif text-xl font-semibold text-ink">Submit your examination?</Dialog.Title>
            <Dialog.Description className="mt-2 text-[15px] leading-relaxed text-muted-foreground">
              You have answered {answeredCount} of {questions.length} questions
              {unansweredCount > 0 ? ` (${unansweredCount} unanswered)` : ""}
              {flaggedCount > 0 ? ` and marked ${flaggedCount} for review` : ""}. After submitting you cannot change your answers.
            </Dialog.Description>
            <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
              <Dialog.Close className="h-11 rounded-md border border-border-strong px-4 text-sm font-medium">Keep working</Dialog.Close>
              <button type="button" onClick={() => void doSubmit("manual")} className="h-11 rounded-md bg-primary px-4 text-sm font-semibold text-primary-foreground hover:bg-primary-hover">
                Submit examination
              </button>
            </div>
          </Dialog.Content>
        </Dialog.Portal>
      </Dialog.Root>

      {/* Submitting overlay */}
      {submitting ? (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-background/95 p-6" role="alertdialog" aria-live="assertive" aria-label="Submitting">
          <div className="max-w-sm text-center">
            <Loader2 className="mx-auto size-8 animate-spin text-primary" aria-hidden />
            <p className="mt-4 font-serif text-xl font-semibold text-ink">{submitting === "auto" ? "Time is up" : "Submitting your examination"}</p>
            <p className="mt-2 text-sm text-muted-foreground">Saving your final answers and marking your paper. Please keep this page open.</p>
          </div>
        </div>
      ) : null}

      {submitError ? (
        <div className="fixed inset-x-3 bottom-24 z-50 mx-auto max-w-lg rounded-lg border border-[#f1cfca] bg-danger-soft p-4 text-sm shadow-lg lg:bottom-6" role="alert">
          <p className="flex items-start gap-2 text-ink">
            <AlertTriangle className="mt-0.5 size-4 shrink-0 text-danger" aria-hidden /> {submitError}
          </p>
          <button type="button" onClick={() => void doSubmit(remaining === 0 ? "auto" : "manual")} className="mt-3 h-10 rounded-md bg-danger px-4 text-sm font-semibold text-white">
            Try again
          </button>
        </div>
      ) : null}
    </div>
  );
}

function SaveIndicator({ status, pending, lastSavedAt }: { status: string; pending: number; lastSavedAt: Date | null }) {
  if (status === "offline") {
    return (
      <span className="inline-flex items-center gap-1 rounded-md bg-warning-soft px-2 py-1 text-xs font-medium text-warning" role="status">
        <WifiOff className="size-3.5" aria-hidden /> <span className="hidden sm:inline">Offline — will retry</span><span className="sm:hidden">Offline</span>
      </span>
    );
  }
  const saving = status === "saving" || pending > 0;
  return (
    <span className="hidden items-center gap-1 text-xs text-muted-foreground sm:inline-flex" role="status" title={lastSavedAt ? `Last saved ${lastSavedAt.toLocaleTimeString()}` : undefined}>
      {saving ? <Loader2 className="size-3.5 animate-spin" aria-hidden /> : <Save className="size-3.5" aria-hidden />}
      {saving ? "Saving…" : "All answers saved"}
    </span>
  );
}

function QuestionView({
  q,
  answer,
  onChoose,
  onClear,
  onWrite,
  onBlurText,
}: {
  q: PaperQuestion;
  answer: Answer | undefined;
  onChoose: (optionId: string) => void;
  onClear: () => void;
  onWrite: (text: string) => void;
  onBlurText: () => void;
}) {
  const words = countWords(answer?.text ?? "");
  const over = q.word_limit ? words > q.word_limit : false;
  return (
    <article aria-labelledby={`q-${q.exam_question_id}`}>
      <div className="flex flex-wrap items-center gap-2 text-xs font-medium text-muted-foreground">
        {q.section ? <span className="rounded bg-muted px-2 py-0.5">{q.section}</span> : null}
        <span>{q.marks} {q.marks === 1 ? "mark" : "marks"}</span>
        {q.word_limit ? <span>· about {q.word_limit} words</span> : null}
      </div>
      <h1 id={`q-${q.exam_question_id}`} className="mt-3 text-sm font-semibold uppercase tracking-wide text-primary">
        Question {q.number}
      </h1>
      <p className="mt-2 whitespace-pre-wrap text-[17px] leading-relaxed text-ink sm:text-lg">{q.stem}</p>

      {q.type === "mcq" ? (
        <fieldset className="mt-6">
          <legend className="sr-only">Choose one answer</legend>
          <div className="space-y-2.5">
            {q.options.map((o) => {
              const selected = answer?.selected === o.id;
              return (
                <label
                  key={o.id}
                  className={cn(
                    "flex cursor-pointer items-start gap-3 rounded-lg border px-4 py-3.5 transition-colors",
                    selected ? "border-primary bg-primary-soft" : "border-border hover:border-border-strong hover:bg-muted/50",
                  )}
                >
                  <input type="radio" name={`q-${q.exam_question_id}`} value={o.id} checked={selected} onChange={() => onChoose(o.id)} className="sr-only" />
                  <span
                    aria-hidden
                    className={cn(
                      "mt-0.5 flex size-7 shrink-0 items-center justify-center rounded-full text-sm font-semibold",
                      selected ? "bg-primary text-white" : "border border-border-strong text-foreground",
                    )}
                  >
                    {o.label}
                  </span>
                  <span className="pt-0.5 text-[15px] leading-relaxed text-ink sm:text-base">{o.body}</span>
                </label>
              );
            })}
          </div>
          {answer?.selected ? (
            <button type="button" onClick={onClear} className="mt-3 text-sm font-medium text-muted-foreground underline-offset-4 hover:text-ink hover:underline">
              Clear my answer
            </button>
          ) : null}
        </fieldset>
      ) : (
        <div className="mt-6">
          <label htmlFor={`a-${q.exam_question_id}`} className="sr-only">Your answer</label>
          <textarea
            id={`a-${q.exam_question_id}`}
            value={answer?.text ?? ""}
            onChange={(e) => onWrite(e.target.value)}
            onBlur={onBlurText}
            rows={14}
            spellCheck
            maxLength={60000}
            placeholder="Write your answer here. It is saved automatically."
            className="min-h-72 w-full rounded-lg border border-border-strong bg-background p-4 text-[16px] leading-relaxed text-ink focus-visible:border-primary focus-visible:outline-2 focus-visible:outline-offset-0 focus-visible:outline-primary/30"
          />
          <p className={cn("mt-2 text-sm tabular-nums", over ? "font-medium text-warning" : "text-muted-foreground")} aria-live="polite">
            {words} {words === 1 ? "word" : "words"}
            {q.word_limit ? ` of about ${q.word_limit}` : ""}
            {over ? " — over the suggested length" : ""}
          </p>
        </div>
      )}
    </article>
  );
}

const STATE_STYLES: Record<QuestionState, string> = {
  answered: "bg-primary text-white border-primary",
  unanswered: "border-border text-muted-foreground",
  flagged: "bg-warning-soft text-warning border-[#f0e0b8]",
  answered_flagged: "bg-primary text-white border-warning ring-2 ring-warning/60",
};

const STATE_LABELS: Record<QuestionState, string> = {
  answered: "answered",
  unanswered: "not answered",
  flagged: "marked for review, not answered",
  answered_flagged: "answered and marked for review",
};

function Palette({ questions, states, current, onGo }: { questions: PaperQuestion[]; states: QuestionState[]; current: number; onGo: (i: number) => void }) {
  return (
    <div>
      <div className="grid grid-cols-6 gap-1.5 sm:grid-cols-8 lg:grid-cols-6">
        {questions.map((q, i) => (
          <button
            key={q.exam_question_id}
            type="button"
            onClick={() => onGo(i)}
            aria-label={`Question ${i + 1}, ${STATE_LABELS[states[i]]}`}
            aria-current={i === current ? "step" : undefined}
            className={cn(
              "flex h-10 items-center justify-center rounded-md border text-sm font-semibold tabular-nums",
              STATE_STYLES[states[i]],
              i === current && "outline outline-2 outline-offset-2 outline-ink",
            )}
          >
            {i + 1}
          </button>
        ))}
      </div>
      <ul className="mt-4 grid grid-cols-2 gap-2 text-xs text-muted-foreground">
        <li className="flex items-center gap-2"><span className="size-3 rounded-sm bg-primary" /> Answered</li>
        <li className="flex items-center gap-2"><span className="size-3 rounded-sm border border-border-strong" /> Not answered</li>
        <li className="flex items-center gap-2"><span className="size-3 rounded-sm bg-warning-soft ring-1 ring-warning/40" /> For review</li>
        <li className="flex items-center gap-2"><span className="size-3 rounded-sm bg-primary ring-2 ring-warning/60" /> Answered + review</li>
      </ul>
    </div>
  );
}

function ReviewView({
  questions,
  states,
  answered,
  unanswered,
  flagged,
  onGo,
  onSubmit,
}: {
  questions: PaperQuestion[];
  states: QuestionState[];
  answered: number;
  unanswered: number;
  flagged: number;
  onGo: (i: number) => void;
  onSubmit: () => void;
}) {
  const list = (pred: (s: QuestionState) => boolean) => questions.map((q, i) => ({ q, i })).filter(({ i }) => pred(states[i]));
  const unansweredList = list((s) => s === "unanswered" || s === "flagged");
  const flaggedList = list((s) => s === "flagged" || s === "answered_flagged");
  return (
    <section aria-labelledby="review-title">
      <h1 id="review-title" className="font-serif text-2xl font-semibold text-ink sm:text-3xl">Final review</h1>
      <p className="mt-2 text-muted-foreground">Check your progress before submitting. You can still go back to any question.</p>
      <dl className="mt-6 grid grid-cols-3 gap-3">
        {[["Answered", answered, "text-primary"], ["Not answered", unanswered, unanswered ? "text-danger" : "text-ink"], ["Marked for review", flagged, flagged ? "text-warning" : "text-ink"]].map(([label, value, cls]) => (
          <div key={label as string} className="rounded-xl border border-border p-4">
            <dt className="text-xs text-muted-foreground sm:text-sm">{label}</dt>
            <dd className={cn("mt-1 text-2xl font-semibold tabular-nums sm:text-3xl", cls as string)}>{value}</dd>
          </div>
        ))}
      </dl>
      {unansweredList.length > 0 ? <JumpList title="Not answered" items={unansweredList} onGo={onGo} /> : null}
      {flaggedList.length > 0 ? <JumpList title="Marked for review" items={flaggedList} onGo={onGo} /> : null}
      <div className="mt-8 lg:hidden">
        <Palette questions={questions} states={states} current={-1} onGo={onGo} />
      </div>
      <button type="button" onClick={onSubmit} className="mt-8 h-12 w-full rounded-md bg-primary px-6 text-base font-semibold text-primary-foreground hover:bg-primary-hover sm:w-auto">
        Submit examination
      </button>
    </section>
  );
}

function JumpList({ title, items, onGo }: { title: string; items: { q: PaperQuestion; i: number }[]; onGo: (i: number) => void }) {
  return (
    <div className="mt-6">
      <p className="text-sm font-semibold text-ink">{title}</p>
      <div className="mt-2 flex flex-wrap gap-2">
        {items.map(({ i }) => (
          <button key={i} type="button" onClick={() => onGo(i)} className="h-9 min-w-9 rounded-md border border-border-strong px-2.5 text-sm font-medium tabular-nums hover:bg-muted">
            {i + 1}
          </button>
        ))}
      </div>
    </div>
  );
}

/** OMR-style answer sheet: a row of bubbles per objective question. */
function AnswerSheet({
  questions,
  answers,
  onChoose,
  onGo,
}: {
  questions: PaperQuestion[];
  answers: Record<string, Answer>;
  onChoose: (q: PaperQuestion, optionId: string) => void;
  onGo: (i: number) => void;
}) {
  const mcqs = questions.map((q, i) => ({ q, i })).filter(({ q }) => q.type === "mcq");
  return (
    <section aria-labelledby="sheet-title">
      <h1 id="sheet-title" className="font-serif text-2xl font-semibold text-ink sm:text-3xl">Answer sheet</h1>
      <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
        Practise marking answers as on an OMR sheet: fill one bubble per question. Your marks here are the same answers as in
        the question view. Tap a question number to read it.
      </p>
      <div className="mt-6 grid gap-x-8 gap-y-1 sm:grid-cols-2">
        {mcqs.map(({ q, i }) => (
          <div key={q.exam_question_id} className="flex items-center gap-3 border-b border-dashed border-border py-2">
            <button type="button" onClick={() => onGo(i)} className="w-8 text-right text-sm font-semibold tabular-nums text-ink hover:text-primary" aria-label={`Read question ${i + 1}`}>
              {i + 1}
            </button>
            <div className="flex gap-2" role="radiogroup" aria-label={`Answer for question ${i + 1}`}>
              {q.options.map((o) => {
                const on = answers[q.exam_question_id]?.selected === o.id;
                return (
                  <button
                    key={o.id}
                    type="button"
                    role="radio"
                    aria-checked={on}
                    aria-label={`Option ${o.label}`}
                    onClick={() => onChoose(q, o.id)}
                    className={cn(
                      "flex size-9 items-center justify-center rounded-full border-2 text-xs font-semibold",
                      on ? "border-ink bg-ink text-white" : "border-ink/40 text-ink/70 hover:border-ink",
                    )}
                  >
                    {o.label}
                  </button>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
