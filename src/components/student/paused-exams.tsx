import Link from "next/link";
import { Clock3, Pause, PlayCircle } from "lucide-react";
import { resumeAttemptAction } from "@/app/exam/actions";
import { PageTitle } from "@/components/app/app-shell";
import { formatClock } from "@/lib/exam/logic";

export type PausedExam = {
  attempt_id: string; title: string; stage: "PE" | "ME"; kind: string;
  paused: boolean; paused_at: string | null; started_at: string; seconds_left: number; answered: number;
};

/** One paused exam with its Continue button (also used on the exam page when a paused exam is opened). */
export function PausedExamCard({ e }: { e: PausedExam }) {
  return (
    <li className="rounded-2xl border border-slate-200 bg-white p-4">
      <div className="flex items-start gap-3">
        <span className="mt-0.5 inline-flex size-10 shrink-0 items-center justify-center rounded-xl bg-slate-100 text-slate-700">
          {e.paused ? <Pause className="size-5" aria-hidden /> : <Clock3 className="size-5" aria-hidden />}
        </span>
        <div className="min-w-0 flex-1">
          <p className="font-bold text-ink">{e.title}</p>
          <p className="mt-0.5 text-sm text-muted-foreground">
            {e.paused ? "Paused" : "In progress, the timer is running"} · {formatClock(e.seconds_left)} left · {e.answered} answered
          </p>
        </div>
      </div>
      {e.paused ? (
        <form action={resumeAttemptAction} className="mt-3">
          <input type="hidden" name="attemptId" value={e.attempt_id} />
          <button type="submit" className="flex h-12 w-full items-center justify-center gap-2 rounded-xl bg-slate-700 text-base font-bold text-white active:scale-[0.98]">
            <PlayCircle className="size-5" aria-hidden /> Continue
          </button>
          <p className="mt-2 text-center text-xs text-muted-foreground">The timer starts again from {formatClock(e.seconds_left)}.</p>
        </form>
      ) : (
        <Link href={`/exam/${e.attempt_id}`} className="mt-3 flex h-12 w-full items-center justify-center gap-2 rounded-xl bg-slate-700 text-base font-bold text-white active:scale-[0.98]">
          <PlayCircle className="size-5" aria-hidden /> Go back to the exam
        </Link>
      )}
    </li>
  );
}

/** "Paused exam": exams the student paused (and any exam still running), each with Continue. */
export function PausedExams({ stage, exams }: { stage: "PE" | "ME"; exams: PausedExam[] }) {
  const mine = exams.filter((e) => e.stage === stage);
  const other = exams.filter((e) => e.stage !== stage);
  const list = [...mine, ...other];
  return (
    <div className="mx-auto max-w-2xl space-y-6">
      <PageTitle title="Paused exam" description="Exams you paused wait here with their time stopped. Press Continue to carry on where you left off. Finish a paused exam before starting another mock test." />
      {list.length ? (
        <ul className="space-y-3">{list.map((e) => <PausedExamCard key={e.attempt_id} e={e} />)}</ul>
      ) : (
        <p className="rounded-2xl bg-slate-100 p-5 text-sm text-slate-700">
          No paused exams. During any timed exam, press <strong>Pause</strong> next to the timer to stop the clock and finish later.
        </p>
      )}
    </div>
  );
}
