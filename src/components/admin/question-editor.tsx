"use client";

import { useRouter } from "next/navigation";
import { useState, useTransition } from "react";
import { ArrowDown, ArrowUp, Plus, Trash2 } from "lucide-react";
import { findSimilarAction, saveQuestionAction, type SimilarQuestion } from "@/app/admin/questions/actions";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";
import { TYPE_LABELS } from "@/lib/exam/types";
import { DIFFICULTIES, QUESTION_TYPES, type QuestionPayload } from "@/lib/validation/question";

type Option = { id: string | null; body: string; is_correct: boolean };
type Criterion = { id: string | null; label: string; description: string; max_marks: string };
type Ref = { citation: string; url: string };

export type EditorQuestion = {
  id: string | null;
  stage: "PE" | "ME";
  question_type: (typeof QUESTION_TYPES)[number];
  stem: string;
  explanation: string;
  model_answer: string;
  word_limit: string;
  subject_id: string;
  topic_id: string;
  paper_id: string;
  category_id: string;
  difficulty: (typeof DIFFICULTIES)[number];
  marks: string;
  estimated_seconds: string;
  is_free_sample: boolean;
  options: Option[];
  rubric: Criterion[];
  references: Ref[];
};

export type EditorLookups = {
  subjects: { id: string; stage: string; name: string }[];
  topics: { id: string; subject_id: string; parent_id: string | null; name: string }[];
  papers: { id: string; stage: string; title: string; code: string }[];
  categories: { id: string; name: string }[];
};

export function emptyQuestion(stage: "PE" | "ME" = "PE"): EditorQuestion {
  return {
    id: null,
    stage,
    question_type: stage === "PE" ? "mcq" : "essay",
    stem: "",
    explanation: "",
    model_answer: "",
    word_limit: "",
    subject_id: "",
    topic_id: "",
    paper_id: "",
    category_id: "",
    difficulty: "standard",
    marks: "1",
    estimated_seconds: "",
    is_free_sample: false,
    options: [
      { id: null, body: "", is_correct: true },
      { id: null, body: "", is_correct: false },
      { id: null, body: "", is_correct: false },
      { id: null, body: "", is_correct: false },
    ],
    rubric: [],
    references: [],
  };
}

export function QuestionEditor({ initial, lookups, readOnlyReason }: { initial: EditorQuestion; lookups: EditorLookups; readOnlyReason?: string }) {
  const router = useRouter();
  const [q, setQ] = useState<EditorQuestion>(initial);
  const [pending, start] = useTransition();
  const [result, setResult] = useState<{ tone: "success" | "danger"; message: string; issues?: string[] } | null>(null);
  const [similar, setSimilar] = useState<SimilarQuestion[] | null>(null);

  const set = <K extends keyof EditorQuestion>(key: K, value: EditorQuestion[K]) => setQ((s) => ({ ...s, [key]: value }));
  const isMcq = q.question_type === "mcq";
  const subjects = lookups.subjects.filter((s) => s.stage === q.stage);
  const topics = lookups.topics.filter((t) => t.subject_id === q.subject_id);
  const papers = lookups.papers.filter((p) => p.stage === q.stage);
  const rubricTotal = q.rubric.reduce((s, r) => s + (Number(r.max_marks) || 0), 0);

  const save = () => {
    setResult(null);
    const payload: QuestionPayload = {
      ...q,
      word_limit: q.word_limit,
      estimated_seconds: q.estimated_seconds,
      options: q.options,
      rubric: q.rubric.map((r) => ({ ...r, max_marks: r.max_marks })),
      references: q.references,
    } as unknown as QuestionPayload;
    start(async () => {
      const res = await saveQuestionAction(payload);
      if (!res.ok) {
        setResult({ tone: "danger", message: res.message, issues: res.issues });
        return;
      }
      setResult({ tone: "success", message: "Question saved." });
      if (!q.id) router.replace(`/admin/questions/${res.id}?saved=1`);
      else router.refresh();
    });
  };

  const checkSimilar = () => {
    start(async () => setSimilar(await findSimilarAction(q.stem, q.id)));
  };

  const moveOption = (i: number, d: -1 | 1) => {
    const j = i + d;
    if (j < 0 || j >= q.options.length) return;
    const next = [...q.options];
    [next[i], next[j]] = [next[j], next[i]];
    set("options", next);
  };

  const disabled = Boolean(readOnlyReason) || pending;

  return (
    <div className="space-y-8">
      {readOnlyReason ? <Alert tone="warning">{readOnlyReason}</Alert> : null}

      <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field>
          <Label htmlFor="stage">Stage</Label>
          <Select id="stage" value={q.stage} disabled={disabled} onChange={(e) => setQ((s) => ({ ...s, stage: e.target.value as "PE" | "ME", subject_id: "", topic_id: "", paper_id: "" }))}>
            <option value="PE">PE — Preliminary</option>
            <option value="ME">ME — Main</option>
          </Select>
        </Field>
        <Field>
          <Label htmlFor="type">Question type</Label>
          <Select id="type" value={q.question_type} disabled={disabled} onChange={(e) => set("question_type", e.target.value as EditorQuestion["question_type"])}>
            {QUESTION_TYPES.map((t) => <option key={t} value={t}>{TYPE_LABELS[t]}</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="marks">Marks</Label>
          <Input id="marks" type="number" min="0.5" step="0.5" value={q.marks} disabled={disabled} onChange={(e) => set("marks", e.target.value)} className="h-10" />
        </Field>
        <Field>
          <Label htmlFor="difficulty">Difficulty</Label>
          <Select id="difficulty" value={q.difficulty} disabled={disabled} onChange={(e) => set("difficulty", e.target.value as EditorQuestion["difficulty"])}>
            <option value="foundation">Foundation</option>
            <option value="standard">Standard</option>
            <option value="advanced">Advanced</option>
          </Select>
        </Field>
      </section>

      <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field>
          <Label htmlFor="subject">Subject</Label>
          <Select id="subject" value={q.subject_id} disabled={disabled} onChange={(e) => setQ((s) => ({ ...s, subject_id: e.target.value, topic_id: "" }))}>
            <option value="">— Choose —</option>
            {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="topic">Topic</Label>
          <Select id="topic" value={q.topic_id} disabled={disabled || !q.subject_id} onChange={(e) => set("topic_id", e.target.value)}>
            <option value="">— None —</option>
            {topics.map((t) => <option key={t.id} value={t.id}>{t.parent_id ? `— ${t.name}` : t.name}</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="paper">Paper</Label>
          <Select id="paper" value={q.paper_id} disabled={disabled} onChange={(e) => set("paper_id", e.target.value)}>
            <option value="">— Any —</option>
            {papers.map((p) => <option key={p.id} value={p.id}>{p.title}</option>)}
          </Select>
        </Field>
        <Field>
          <Label htmlFor="category">ME category</Label>
          <Select id="category" value={q.category_id} disabled={disabled || q.stage === "PE"} onChange={(e) => set("category_id", e.target.value)}>
            <option value="">— All —</option>
            {lookups.categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
          </Select>
        </Field>
      </section>

      <Field>
        <Label htmlFor="stem">Question</Label>
        <Textarea id="stem" rows={5} value={q.stem} disabled={disabled} onChange={(e) => { set("stem", e.target.value); setSimilar(null); }} />
        <div className="flex flex-wrap items-center gap-3">
          <FieldHint>Plain text. Line breaks are kept.</FieldHint>
          <button type="button" onClick={checkSimilar} disabled={pending || q.stem.trim().length < 15} className="text-sm font-medium text-primary hover:underline disabled:opacity-40">
            Check for similar questions
          </button>
        </div>
        {similar !== null ? (
          similar.length === 0 ? (
            <p className="text-sm text-primary">No similar questions found in the bank.</p>
          ) : (
            <Alert tone="warning" title="Similar questions already in the bank">
              <ul className="mt-1 space-y-1">
                {similar.map((s) => (
                  <li key={s.id}>
                    <a href={`/admin/questions/${s.id}`} target="_blank" rel="noreferrer" className="text-primary underline">{s.stem.slice(0, 120)}</a>{" "}
                    <span className="text-xs">({Math.round(s.similarity * 100)}% similar · {s.status.replace("_", " ")})</span>
                  </li>
                ))}
              </ul>
            </Alert>
          )
        ) : null}
      </Field>

      {isMcq ? (
        <section>
          <p className="text-sm font-medium text-ink">Options</p>
          <p className="text-[13px] text-muted-foreground">Select the correct answer with the circle on the left.</p>
          <ol className="mt-3 space-y-2">
            {q.options.map((o, i) => (
              <li key={i} className="flex items-start gap-2">
                <label className="mt-2.5 flex items-center gap-2 text-sm font-semibold">
                  <input
                    type="radio"
                    name="correct"
                    checked={o.is_correct}
                    disabled={disabled}
                    onChange={() => set("options", q.options.map((x, j) => ({ ...x, is_correct: j === i })))}
                    className="size-4 accent-[var(--primary)]"
                    aria-label={`Option ${String.fromCharCode(65 + i)} is correct`}
                  />
                  {String.fromCharCode(65 + i)}
                </label>
                <Textarea
                  rows={1}
                  value={o.body}
                  disabled={disabled}
                  onChange={(e) => set("options", q.options.map((x, j) => (j === i ? { ...x, body: e.target.value } : x)))}
                  className="min-h-10 flex-1 py-2"
                  aria-label={`Option ${String.fromCharCode(65 + i)} text`}
                />
                <div className="flex shrink-0 flex-col">
                  <button type="button" disabled={disabled || i === 0} onClick={() => moveOption(i, -1)} className="rounded p-1 hover:bg-muted disabled:opacity-30" aria-label="Move up"><ArrowUp className="size-4" /></button>
                  <button type="button" disabled={disabled || i === q.options.length - 1} onClick={() => moveOption(i, 1)} className="rounded p-1 hover:bg-muted disabled:opacity-30" aria-label="Move down"><ArrowDown className="size-4" /></button>
                </div>
                <button type="button" disabled={disabled || q.options.length <= 2} onClick={() => set("options", q.options.filter((_, j) => j !== i))} className="mt-1.5 rounded p-1.5 text-muted-foreground hover:bg-muted hover:text-danger disabled:opacity-30" aria-label="Remove option">
                  <Trash2 className="size-4" />
                </button>
              </li>
            ))}
          </ol>
          {q.options.length < 8 ? (
            <Button type="button" variant="secondary" size="sm" className="mt-3" disabled={disabled} onClick={() => set("options", [...q.options, { id: null, body: "", is_correct: false }])}>
              <Plus /> Add option
            </Button>
          ) : null}
        </section>
      ) : (
        <section className="space-y-4">
          <div className="grid gap-4 sm:grid-cols-2">
            <Field>
              <Label htmlFor="words">Suggested length (words)</Label>
              <Input id="words" type="number" min="10" value={q.word_limit} disabled={disabled} onChange={(e) => set("word_limit", e.target.value)} className="h-10" />
            </Field>
          </div>
          <Field>
            <Label htmlFor="model">Model answer</Label>
            <Textarea id="model" rows={8} value={q.model_answer} disabled={disabled} onChange={(e) => set("model_answer", e.target.value)} />
            <FieldHint>Shown to students after they submit. Required before verification.</FieldHint>
          </Field>
          <div>
            <p className="text-sm font-medium text-ink">Marking rubric</p>
            <p className={rubricTotal && Math.abs(rubricTotal - Number(q.marks)) > 0.001 ? "text-[13px] font-medium text-warning" : "text-[13px] text-muted-foreground"}>
              Criteria total {rubricTotal} of {q.marks || 0} marks.
            </p>
            <ol className="mt-3 space-y-3">
              {q.rubric.map((r, i) => (
                <li key={i} className="grid gap-2 rounded-lg border border-border p-3 sm:grid-cols-[1fr_2fr_90px_auto]">
                  <Input value={r.label} disabled={disabled} placeholder="Criterion" aria-label="Criterion name" className="h-10" onChange={(e) => set("rubric", q.rubric.map((x, j) => (j === i ? { ...x, label: e.target.value } : x)))} />
                  <Input value={r.description} disabled={disabled} placeholder="What earns these marks" aria-label="Criterion description" className="h-10" onChange={(e) => set("rubric", q.rubric.map((x, j) => (j === i ? { ...x, description: e.target.value } : x)))} />
                  <Input type="number" min="0.5" step="0.5" value={r.max_marks} disabled={disabled} aria-label="Marks" className="h-10" onChange={(e) => set("rubric", q.rubric.map((x, j) => (j === i ? { ...x, max_marks: e.target.value } : x)))} />
                  <button type="button" disabled={disabled} onClick={() => set("rubric", q.rubric.filter((_, j) => j !== i))} className="rounded p-2 text-muted-foreground hover:bg-muted hover:text-danger" aria-label="Remove criterion"><Trash2 className="size-4" /></button>
                </li>
              ))}
            </ol>
            <Button type="button" variant="secondary" size="sm" className="mt-3" disabled={disabled} onClick={() => set("rubric", [...q.rubric, { id: null, label: "", description: "", max_marks: "" }])}>
              <Plus /> Add criterion
            </Button>
          </div>
        </section>
      )}

      <Field>
        <Label htmlFor="explanation">Explanation {isMcq ? "(required before verification)" : "(optional)"}</Label>
        <Textarea id="explanation" rows={4} value={q.explanation} disabled={disabled} onChange={(e) => set("explanation", e.target.value)} />
        <FieldHint>Explain why the correct answer is right{isMcq ? " and why the others are not" : ""}. Shown after submission.</FieldHint>
      </Field>

      <section>
        <p className="text-sm font-medium text-ink">Sources and references</p>
        <p className="text-[13px] text-muted-foreground">Cite where facts can be checked, e.g. an Act, an RCSC announcement or official statistics.</p>
        <ul className="mt-3 space-y-2">
          {q.references.map((r, i) => (
            <li key={i} className="grid gap-2 sm:grid-cols-[2fr_2fr_auto]">
              <Input value={r.citation} disabled={disabled} placeholder="Citation" aria-label="Citation" className="h-10" onChange={(e) => set("references", q.references.map((x, j) => (j === i ? { ...x, citation: e.target.value } : x)))} />
              <Input value={r.url} disabled={disabled} placeholder="https://…" aria-label="Link" className="h-10" onChange={(e) => set("references", q.references.map((x, j) => (j === i ? { ...x, url: e.target.value } : x)))} />
              <button type="button" disabled={disabled} onClick={() => set("references", q.references.filter((_, j) => j !== i))} className="rounded p-2 text-muted-foreground hover:bg-muted hover:text-danger" aria-label="Remove reference"><Trash2 className="size-4" /></button>
            </li>
          ))}
        </ul>
        <Button type="button" variant="secondary" size="sm" className="mt-3" disabled={disabled} onClick={() => set("references", [...q.references, { citation: "", url: "" }])}>
          <Plus /> Add reference
        </Button>
      </section>

      <section className="grid gap-4 sm:grid-cols-2">
        <Field>
          <Label htmlFor="est">Estimated answering time (seconds)</Label>
          <Input id="est" type="number" min="5" value={q.estimated_seconds} disabled={disabled} onChange={(e) => set("estimated_seconds", e.target.value)} className="h-10" />
        </Field>
        <label className="flex items-center gap-2 self-end pb-2 text-sm">
          <input type="checkbox" checked={q.is_free_sample} disabled={disabled} onChange={(e) => set("is_free_sample", e.target.checked)} className="size-4 accent-[var(--primary)]" />
          Suitable as a free sample question
        </label>
      </section>

      {result ? (
        <Alert tone={result.tone} title={result.message}>
          {result.issues?.length ? <ul className="list-disc pl-5">{result.issues.map((m) => <li key={m}>{m}</li>)}</ul> : null}
        </Alert>
      ) : null}

      <div className="sticky bottom-0 -mx-4 border-t border-border bg-background/95 px-4 py-3 backdrop-blur sm:mx-0 sm:px-0">
        <Button type="button" onClick={save} disabled={disabled} size="lg">
          {pending ? "Saving…" : q.id ? "Save changes" : "Create question"}
        </Button>
      </div>
    </div>
  );
}
