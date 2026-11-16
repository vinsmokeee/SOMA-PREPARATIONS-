"use client";

import { useActionState, useState } from "react";
import { startPractice, type PracticeState } from "@/app/dashboard/practice/actions";
import { FreeLimitNote } from "@/components/exam/mock-cta";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldHint, Label, Select } from "@/components/ui/input";
import type { PracticeOptions } from "@/lib/analytics";

export function PracticeBuilder({ stage, options }: { stage: "PE" | "ME"; options: PracticeOptions }) {
  const [state, action, pending] = useActionState<PracticeState, FormData>(startPractice, {});
  const [subjectId, setSubjectId] = useState("");
  const [timed, setTimed] = useState("auto");
  const subject = options.subjects.find((s) => s.id === subjectId);

  if (options.total === 0) {
    return (
      <Alert tone="info" title="No practice questions yet">
        Practice questions will appear here as soon as they are reviewed and published.
      </Alert>
    );
  }

  return (
    <form action={action} className="space-y-5">
      <input type="hidden" name="stage" value={stage} />
      {state.freeLimit ? <FreeLimitNote /> : null}
      {state.error ? <Alert tone="danger">{state.error}</Alert> : null}
      <div className="grid gap-4 sm:grid-cols-2">
        <Field>
          <Label htmlFor="subject">Subject</Label>
          <select id="subject" name="subject_id" value={subjectId} onChange={(e) => setSubjectId(e.target.value)} className="h-11 w-full rounded-md border border-border-strong bg-background px-3 text-[15px]">
            <option value="">All subjects ({options.total} questions)</option>
            {options.subjects.map((s) => <option key={s.id} value={s.id}>{s.name} ({s.available})</option>)}
          </select>
        </Field>
        <Field>
          <Label htmlFor="topic">Topic</Label>
          <Select id="topic" name="topic_id" disabled={!subject || subject.topics.length === 0} key={subjectId}>
            <option value="">{subject?.topics.length ? "All topics" : "No topics in this subject yet"}</option>
            {subject?.topics.map((t) => <option key={t.id} value={t.id}>{t.name} ({t.available})</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="difficulty">Difficulty</Label>
          <Select id="difficulty" name="difficulty" defaultValue="">
            <option value="">Any</option>
            <option value="foundation">Foundation</option>
            <option value="standard">Standard</option>
            <option value="advanced">Advanced</option>
          </Select>
        </Field>
        <Field>
          <Label htmlFor="count">Number of questions</Label>
          <Select id="count" name="count" defaultValue="10">
            {[5, 10, 20, 30, 50].map((n) => <option key={n} value={n}>{n}</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="mode">Questions to include</Label>
          <Select id="mode" name="mode" defaultValue="mixed">
            <option value="mixed">New questions first, then ones to revisit</option>
            <option value="new">Only questions I have not answered</option>
            <option value="mistakes" disabled={options.mistakes === 0}>Only questions I got wrong ({options.mistakes})</option>
          </Select>
        </Field>
        <Field>
          <Label htmlFor="timing">Time limit</Label>
          <Select id="timing" value={timed} onChange={(e) => setTimed(e.target.value)}>
            <option value="auto">About 1 minute per question</option>
            <option value="15">15 minutes</option>
            <option value="30">30 minutes</option>
            <option value="60">60 minutes</option>
          </Select>
          <input type="hidden" name="minutes" value={timed === "auto" ? "" : timed} />
          <FieldHint>Practice sets use the same examination room, autosave and results as full examinations.</FieldHint>
        </Field>
      </div>
      {!options.full_access ? (
        <Alert tone="info">You are practising with Soma&apos;s free sample questions. Premium packages unlock the full question bank.</Alert>
      ) : null}
      <Button type="submit" size="lg" disabled={pending}>{pending ? "Preparing your questions…" : "Start practice"}</Button>
    </form>
  );
}

/** One-tap targeted practice (used by recommendations). */
export function QuickPractice({ stage, subjectId, topicId, mode = "mixed", label }: { stage: "PE" | "ME"; subjectId?: string; topicId?: string; mode?: "mixed" | "mistakes"; label: string }) {
  const [state, action, pending] = useActionState<PracticeState, FormData>(startPractice, {});
  return (
    <form action={action} className="inline">
      <input type="hidden" name="stage" value={stage} />
      <input type="hidden" name="subject_id" value={subjectId ?? ""} />
      <input type="hidden" name="topic_id" value={topicId ?? ""} />
      <input type="hidden" name="count" value="10" />
      <input type="hidden" name="mode" value={mode} />
      <button type="submit" disabled={pending} className="inline-flex h-9 items-center rounded-md border border-border-strong px-3 text-sm font-medium hover:bg-muted disabled:opacity-60">
        {pending ? "Preparing…" : label}
      </button>
      {state.error ? <span className="ml-2 text-xs text-danger">{state.error}</span> : null}
    </form>
  );
}
