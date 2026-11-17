"use client";

import { useState } from "react";
import { Bot, Calculator, Check, ExternalLink, Flag, UserCheck, X } from "lucide-react";
import { formatDuration } from "@/lib/exam/logic";
import { originLabel } from "@/lib/exam/origin";
import { TYPE_LABELS, type ResultQuestion } from "@/lib/exam/types";
import { cn } from "@/lib/utils";
import { QuestionStem } from "@/components/exam/question-stem";

type Filter = "all" | "incorrect" | "unanswered" | "flagged" | "written";

function outcome(q: ResultQuestion): "correct" | "incorrect" | "unanswered" | "written" {
  if (q.type !== "mcq") return "written";
  if (q.answer?.is_correct === true) return "correct";
  if (q.answer?.selected_option_id) return "incorrect";
  return "unanswered";
}

const METHOD = {
  automated: { label: "Automated scoring", Icon: Calculator },
  ai_feedback: { label: "AI-assisted feedback (indicative only)", Icon: Bot },
  expert: { label: "Expert evaluation", Icon: UserCheck },
} as const;

export function ResultReview({ questions }: { questions: ResultQuestion[] }) {
  const [filter, setFilter] = useState<Filter>("all");
  const hasWritten = questions.some((q) => q.type !== "mcq");
  const hasMcq = questions.some((q) => q.type === "mcq");
  const counts = {
    all: questions.length,
    incorrect: questions.filter((q) => outcome(q) === "incorrect").length,
    unanswered: questions.filter((q) => outcome(q) === "unanswered").length,
    flagged: questions.filter((q) => q.answer?.flagged).length,
    written: questions.filter((q) => q.type !== "mcq").length,
  };
  const tabs: { key: Filter; label: string; show: boolean }[] = [
    { key: "all", label: "All", show: true },
    { key: "incorrect", label: "Incorrect", show: hasMcq },
    { key: "unanswered", label: "Unanswered", show: hasMcq },
    { key: "flagged", label: "Marked for review", show: true },
    { key: "written", label: "Written", show: hasWritten && hasMcq },
  ];
  const visible = questions.filter((q) => {
    switch (filter) {
      case "incorrect": return outcome(q) === "incorrect";
      case "unanswered": return outcome(q) === "unanswered";
      case "flagged": return Boolean(q.answer?.flagged);
      case "written": return q.type !== "mcq";
      default: return true;
    }
  });

  return (
    <section aria-labelledby="review-heading" className="mt-10">
      <h2 id="review-heading" className="font-serif text-2xl font-semibold">Answers and explanations</h2>
      <div className="mt-4 flex flex-wrap gap-2" role="tablist" aria-label="Filter questions">
        {tabs.filter((t) => t.show).map((t) => (
          <button
            key={t.key}
            type="button"
            role="tab"
            aria-selected={filter === t.key}
            onClick={() => setFilter(t.key)}
            className={cn("rounded-full border px-3.5 py-1.5 text-sm font-medium", filter === t.key ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}
          >
            {t.label} <span className="tabular-nums opacity-80">({counts[t.key]})</span>
          </button>
        ))}
      </div>
      {visible.length === 0 ? <p className="mt-6 text-sm text-muted-foreground">No questions in this view.</p> : null}
      <ol className="mt-6 space-y-5">
        {visible.map((q) => <QuestionCard key={q.exam_question_id} q={q} />)}
      </ol>
    </section>
  );
}

function QuestionCard({ q }: { q: ResultQuestion }) {
  const o = outcome(q);
  const tone = {
    correct: "border-l-success",
    incorrect: "border-l-danger",
    unanswered: "border-l-border-strong",
    written: "border-l-accent",
  }[o];
  return (
    <li className={cn("rounded-xl border border-border border-l-4 p-5", tone)}>
      <div className="flex flex-wrap items-center gap-2 text-xs font-medium text-muted-foreground">
        <span className="font-semibold text-ink">Question {q.number}</span>
        {o === "correct" ? <span className="inline-flex items-center gap-1 text-success"><Check className="size-3.5" aria-hidden /> Correct</span> : null}
        {o === "incorrect" ? <span className="inline-flex items-center gap-1 text-danger"><X className="size-3.5" aria-hidden /> Incorrect</span> : null}
        {o === "unanswered" ? <span>Not answered</span> : null}
        {o === "written" ? <span>{TYPE_LABELS[q.type]}</span> : null}
        {q.answer?.flagged ? <span className="inline-flex items-center gap-1 text-warning"><Flag className="size-3" aria-hidden /> Marked</span> : null}
        <span>· {q.subject ?? "Unclassified"}{q.topic ? ` › ${q.topic}` : ""}</span>
        <span>· {q.answer?.time_spent_seconds ? formatDuration(q.answer.time_spent_seconds) : "no time recorded"}</span>
        {q.type === "mcq" && q.answer?.marks_awarded !== null && q.answer?.marks_awarded !== undefined ? (
          <span className="ml-auto tabular-nums">{Number(q.answer.marks_awarded)} / {q.marks}</span>
        ) : null}
      </div>
      <QuestionStem stem={q.stem} imageUrl={q.image_url} className="mt-3" />
      {originLabel(q.origin, q.source_year) ? <p className="mt-1 text-xs text-muted-foreground">{originLabel(q.origin, q.source_year)}</p> : null}

      {q.type === "mcq" ? (
        <ul className="mt-4 space-y-2">
          {q.options.map((opt) => {
            const chosen = q.answer?.selected_option_id === opt.id;
            return (
              <li
                key={opt.id}
                className={cn(
                  "flex items-start gap-3 rounded-lg border px-3 py-2.5 text-[15px]",
                  opt.is_correct ? "border-success bg-success-soft" : chosen ? "border-danger bg-danger-soft" : "border-border",
                )}
              >
                <span className="font-semibold">{opt.label}</span>
                <span className="flex-1">{opt.body}</span>
                {opt.is_correct ? <span className="text-xs font-semibold text-success">Correct answer</span> : null}
                {chosen && !opt.is_correct ? <span className="text-xs font-semibold text-danger">Your answer</span> : null}
                {chosen && opt.is_correct ? <span className="sr-only">(your answer)</span> : null}
              </li>
            );
          })}
        </ul>
      ) : (
        <div className="mt-4 space-y-4">
          <div>
            <p className="text-sm font-semibold text-ink">Your answer{q.answer?.word_count ? ` · ${q.answer.word_count} words` : ""}</p>
            <p className="mt-1.5 whitespace-pre-wrap rounded-lg bg-muted/70 p-3 text-[15px] leading-relaxed text-foreground">
              {q.answer?.text_answer?.trim() ? q.answer.text_answer : <span className="text-muted-foreground">No answer written.</span>}
            </p>
          </div>
          {q.answer?.evaluations.length ? (
            q.answer.evaluations.map((ev, i) => {
              const m = METHOD[ev.method];
              return (
                <div key={i} className="rounded-lg border border-border p-3">
                  <p className="flex items-center gap-2 text-sm font-semibold text-ink"><m.Icon className="size-4 text-primary" aria-hidden /> {m.label}</p>
                  {ev.score !== null ? <p className="mt-1 text-sm tabular-nums">{Number(ev.score)} / {Number(ev.max_score ?? q.marks)} (Soma practice mark — not an RCSC mark)</p> : null}
                  {ev.feedback ? <p className="mt-1 whitespace-pre-wrap text-sm text-foreground">{ev.feedback}</p> : null}
                </div>
              );
            })
          ) : (
            <p className="text-sm text-muted-foreground">Written answers are not marked automatically. Compare your answer with the model answer and rubric below.</p>
          )}
          {q.model_answer ? (
            <div>
              <p className="text-sm font-semibold text-ink">Model answer</p>
              <p className="mt-1.5 whitespace-pre-wrap text-[15px] leading-relaxed text-foreground">{q.model_answer}</p>
            </div>
          ) : null}
          {q.rubric.length ? (
            <div>
              <p className="text-sm font-semibold text-ink">Marking rubric</p>
              <ul className="mt-1.5 divide-y divide-border rounded-lg border border-border text-sm">
                {q.rubric.map((r) => (
                  <li key={r.label} className="flex gap-3 p-3">
                    <span className="flex-1"><span className="font-medium text-ink">{r.label}.</span> {r.description}</span>
                    <span className="shrink-0 tabular-nums text-muted-foreground">{Number(r.max_marks)} marks</span>
                  </li>
                ))}
              </ul>
            </div>
          ) : null}
        </div>
      )}

      {q.explanation ? (
        <div className="mt-4 rounded-lg bg-info-soft p-3">
          <p className="text-sm font-semibold text-ink">Explanation</p>
          <p className="mt-1 whitespace-pre-wrap text-[15px] leading-relaxed text-foreground">{q.explanation}</p>
        </div>
      ) : null}
      {q.references.length ? (
        <ul className="mt-3 space-y-1 text-xs text-muted-foreground">
          {q.references.map((r, i) => (
            <li key={i}>
              Source: {r.url ? <a href={r.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-primary hover:underline">{r.citation} <ExternalLink className="size-3" aria-hidden /></a> : r.citation}
            </li>
          ))}
        </ul>
      ) : null}
    </li>
  );
}
