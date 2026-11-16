"use client";

import { useActionState } from "react";
import { startCaPracticeAction, startQuestionOfDayAction, startStoryPracticeAction, type CaStartState } from "@/app/dashboard/current-affairs/actions";

const btn = "inline-flex h-10 items-center rounded-md px-4 text-sm font-semibold disabled:opacity-50";

export function QotdButton() {
  const [s, action, pending] = useActionState(startQuestionOfDayAction, {} as CaStartState);
  return (
    <form action={action}>
      <button type="submit" disabled={pending} className={`${btn} bg-primary text-primary-foreground hover:bg-primary-hover`}>{pending ? "Opening…" : "Answer the Question of the Day"}</button>
      {s.error ? <p role="alert" className="mt-2 text-sm text-danger">{s.error}</p> : null}
    </form>
  );
}

export function CaPracticeForm({ locked }: { locked: boolean }) {
  const [s, action, pending] = useActionState(startCaPracticeAction, {} as CaStartState);
  return (
    <form action={action} className="flex flex-wrap items-center gap-2">
      <label className="sr-only" htmlFor="ca-area">Area</label>
      <select id="ca-area" name="area" className="h-10 rounded-md border border-border-strong bg-background px-2 text-sm" defaultValue="">
        <option value="">All areas</option><option value="bhutan">Bhutan</option><option value="regional">Regional</option><option value="world">World</option>
      </select>
      <label className="sr-only" htmlFor="ca-count">Questions</label>
      <select id="ca-count" name="count" className="h-10 rounded-md border border-border-strong bg-background px-2 text-sm" defaultValue="10">
        {[5, 10, 20, 30].map((n) => <option key={n} value={n}>{n} questions</option>)}
      </select>
      <button type="submit" disabled={pending || locked} className={`${btn} border border-border-strong hover:bg-muted`}>{pending ? "Starting…" : "Practise"}</button>
      {locked ? <p className="w-full text-xs text-muted-foreground">Personalised practice is part of the PE and PE + ME packages.</p> : null}
      {s.error ? <p role="alert" className="w-full text-sm text-danger">{s.error}</p> : null}
    </form>
  );
}

export function StoryPracticeButton({ id, count }: { id: string; count: number }) {
  const [s, action, pending] = useActionState(startStoryPracticeAction, {} as CaStartState);
  if (!count) return null;
  return (
    <form action={action}>
      <input type="hidden" name="id" value={id} />
      <button type="submit" disabled={pending} className={`${btn} bg-primary text-primary-foreground hover:bg-primary-hover`}>{pending ? "Starting…" : `Practise ${count} question${count === 1 ? "" : "s"}`}</button>
      {s.error ? <p role="alert" className="mt-2 text-sm text-danger">{s.error}</p> : null}
    </form>
  );
}
