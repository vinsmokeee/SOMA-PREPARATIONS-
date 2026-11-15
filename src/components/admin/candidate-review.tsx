"use client";

import { useRouter } from "next/navigation";
import { useState, useTransition } from "react";
import { AlertTriangle, Plus, Trash2 } from "lucide-react";
import { acceptCandidates, rejectCandidates, saveCandidate } from "@/app/admin/imports/actions";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input, Label, Select, Textarea } from "@/components/ui/input";
import { cn } from "@/lib/utils";

export type ReviewCandidate = {
  id: string;
  number: number | null;
  section: string | null;
  stem: string;
  options: { label: string; body: string }[];
  answer_label: string | null;
  answer_source: "official_key" | "soma" | "none";
  page: number | null;
  confidence: number | null;
  issues: string[];
  status: "pending" | "accepted" | "rejected";
  question_id: string | null;
};

const LETTERS = "ABCDEFGH";

export function CandidateReview({
  candidates,
  subjects,
  papers,
  defaultPaperId,
}: {
  candidates: ReviewCandidate[];
  subjects: { id: string; name: string }[];
  papers: { id: string; title: string }[];
  defaultPaperId: string | null;
}) {
  const router = useRouter();
  const [pending, start] = useTransition();
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [filter, setFilter] = useState<"pending" | "issues" | "accepted" | "rejected" | "all">("pending");
  const [subjectId, setSubjectId] = useState("");
  const [paperId, setPaperId] = useState(defaultPaperId ?? "");
  const [marks, setMarks] = useState("1");
  const [result, setResult] = useState<{ tone: "success" | "danger" | "warning"; message: string; details?: string[] } | null>(null);

  const visible = candidates.filter((c) =>
    filter === "all" ? true : filter === "issues" ? c.status === "pending" && c.issues.length > 0 : c.status === filter,
  );
  const pendingIds = candidates.filter((c) => c.status === "pending").map((c) => c.id);
  const toggle = (id: string) => setSelected((s) => {
    const n = new Set(s);
    if (n.has(id)) n.delete(id);
    else n.add(id);
    return n;
  });

  const accept = () => {
    const ids = [...selected];
    if (!ids.length) return;
    start(async () => {
      const r = await acceptCandidates({ ids, subject_id: subjectId, historical_paper_id: paperId, marks });
      setResult({ tone: r.failed.length ? (r.created ? "warning" : "danger") : "success", message: r.message, details: r.failed.map((f) => f.reason) });
      setSelected(new Set());
      router.refresh();
    });
  };
  const reject = () => {
    const ids = [...selected];
    if (!ids.length || !window.confirm(`Reject ${ids.length} extracted question${ids.length === 1 ? "" : "s"}?`)) return;
    start(async () => {
      const r = await rejectCandidates({ ids });
      setResult({ tone: "success", message: r.message });
      setSelected(new Set());
      router.refresh();
    });
  };

  const counts = {
    pending: candidates.filter((c) => c.status === "pending").length,
    issues: candidates.filter((c) => c.status === "pending" && c.issues.length > 0).length,
    accepted: candidates.filter((c) => c.status === "accepted").length,
    rejected: candidates.filter((c) => c.status === "rejected").length,
    all: candidates.length,
  };

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap gap-2" role="tablist">
        {(["pending", "issues", "accepted", "rejected", "all"] as const).map((f) => (
          <button key={f} type="button" role="tab" aria-selected={filter === f} onClick={() => setFilter(f)} className={cn("rounded-full border px-3 py-1 text-sm", filter === f ? "border-primary bg-primary text-white" : "border-border-strong hover:bg-muted")}>
            {{ pending: "To review", issues: "Needs attention", accepted: "Accepted", rejected: "Rejected", all: "All" }[f]} <span className="tabular-nums opacity-80">({counts[f]})</span>
          </button>
        ))}
      </div>

      {counts.pending > 0 ? (
        <div className="sticky top-0 z-10 space-y-3 rounded-xl border border-border bg-background/95 p-4 backdrop-blur">
          <div className="flex flex-wrap items-center gap-3 text-sm">
            <label className="flex items-center gap-2">
              <input type="checkbox" className="size-4 accent-[var(--primary)]" checked={selected.size > 0 && pendingIds.every((id) => selected.has(id))} onChange={(e) => setSelected(e.target.checked ? new Set(pendingIds) : new Set())} />
              Select all to review ({counts.pending})
            </label>
            <span className="text-muted-foreground">{selected.size} selected</span>
          </div>
          <div className="grid gap-3 sm:grid-cols-[1fr_1fr_90px]">
            <div>
              <Label htmlFor="acc-subject">Subject for accepted questions</Label>
              <Select id="acc-subject" value={subjectId} onChange={(e) => setSubjectId(e.target.value)} className="h-10">
                <option value="">— Set later —</option>
                {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
              </Select>
            </div>
            <div>
              <Label htmlFor="acc-paper">Historical paper</Label>
              <Select id="acc-paper" value={paperId} onChange={(e) => setPaperId(e.target.value)} className="h-10">
                <option value="">— None —</option>
                {papers.map((p) => <option key={p.id} value={p.id}>{p.title}</option>)}
              </Select>
            </div>
            <div>
              <Label htmlFor="acc-marks">Marks each</Label>
              <Input id="acc-marks" type="number" min="0.5" step="0.5" value={marks} onChange={(e) => setMarks(e.target.value)} className="h-10" />
            </div>
          </div>
          <div className="flex flex-wrap gap-2">
            <Button type="button" onClick={accept} disabled={pending || selected.size === 0}>Accept into question bank</Button>
            <Button type="button" variant="secondary" onClick={reject} disabled={pending || selected.size === 0}>Reject</Button>
          </div>
          <p className="text-xs text-muted-foreground">Accepted questions become drafts in the question bank. Add explanations there, then verify and publish them as usual.</p>
        </div>
      ) : null}

      {result ? (
        <Alert tone={result.tone} title={result.message}>
          {result.details?.length ? <ul className="list-disc pl-5">{result.details.map((d) => <li key={d}>{d}</li>)}</ul> : null}
        </Alert>
      ) : null}

      {visible.length === 0 ? <p className="text-sm text-muted-foreground">Nothing in this view.</p> : null}
      <ol className="space-y-3">
        {visible.map((c) => (
          <CandidateCard key={`${c.id}-${c.status}`} c={c} selected={selected.has(c.id)} onToggle={() => toggle(c.id)} />
        ))}
      </ol>
    </div>
  );
}

function CandidateCard({ c, selected, onToggle }: { c: ReviewCandidate; selected: boolean; onToggle: () => void }) {
  const router = useRouter();
  const [editing, setEditing] = useState(false);
  const [stem, setStem] = useState(c.stem);
  const [options, setOptions] = useState(c.options);
  const [answer, setAnswer] = useState(c.answer_label ?? "");
  const [answerSource, setAnswerSource] = useState(c.answer_source);
  const [msg, setMsg] = useState<string | null>(null);
  const [pending, start] = useTransition();

  const save = () =>
    start(async () => {
      const relabelled = options.map((o, i) => ({ label: LETTERS[i], body: o.body }));
      const r = await saveCandidate({
        id: c.id,
        stem,
        options: relabelled,
        answer_label: answer || null,
        answer_source: answer ? (answerSource === "none" ? "soma" : answerSource) : "none",
        section: c.section,
      });
      setMsg(r.message);
      if (r.ok) {
        setEditing(false);
        router.refresh();
      }
    });

  return (
    <li className={cn("rounded-xl border p-4", c.status === "accepted" ? "border-primary/40 bg-primary-soft/40" : c.status === "rejected" ? "border-border opacity-60" : c.issues.length ? "border-[#f0e0b8]" : "border-border")}>
      <div className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
        {c.status === "pending" ? <input type="checkbox" className="size-4 accent-[var(--primary)]" checked={selected} onChange={onToggle} aria-label={`Select question ${c.number ?? ""}`} /> : null}
        <span className="font-semibold text-ink">Question {c.number ?? "?"}</span>
        {c.section ? <span>· {c.section}</span> : null}
        {c.page ? <span>· page {c.page}</span> : null}
        {c.answer_source === "official_key" ? <Badge tone="green">Official answer</Badge> : c.answer_source === "soma" ? <Badge tone="warning">Answer set by Soma</Badge> : null}
        {c.status !== "pending" ? <Badge tone={c.status === "accepted" ? "solid" : "outline"}>{c.status}</Badge> : null}
        {c.question_id ? <a href={`/admin/questions/${c.question_id}`} className="text-primary underline">Open in question bank</a> : null}
        {c.status === "pending" && !editing ? <button type="button" onClick={() => setEditing(true)} className="ml-auto font-medium text-primary hover:underline">Edit</button> : null}
      </div>

      {c.issues.length && c.status === "pending" ? (
        <ul className="mt-2 space-y-1 text-sm text-warning">
          {c.issues.map((i) => <li key={i} className="flex gap-1.5"><AlertTriangle className="mt-0.5 size-3.5 shrink-0" aria-hidden /> {i}</li>)}
        </ul>
      ) : null}

      {editing ? (
        <div className="mt-3 space-y-3">
          <Textarea value={stem} onChange={(e) => setStem(e.target.value)} rows={3} aria-label="Question text" />
          <ol className="space-y-2">
            {options.map((o, i) => (
              <li key={i} className="flex items-center gap-2">
                <label className="flex items-center gap-1.5 text-sm font-semibold">
                  <input type="radio" name={`ans-${c.id}`} checked={answer === LETTERS[i]} onChange={() => { setAnswer(LETTERS[i]); if (answerSource === "none") setAnswerSource("soma"); }} className="size-4 accent-[var(--primary)]" aria-label={`Option ${LETTERS[i]} is correct`} />
                  {LETTERS[i]}
                </label>
                <Input value={o.body} onChange={(e) => setOptions(options.map((x, j) => (j === i ? { ...x, body: e.target.value } : x)))} className="h-9" aria-label={`Option ${LETTERS[i]}`} />
                <button type="button" onClick={() => { setOptions(options.filter((_, j) => j !== i)); if (answer === LETTERS[i]) setAnswer(""); }} className="rounded p-1.5 text-muted-foreground hover:text-danger" aria-label="Remove option"><Trash2 className="size-4" /></button>
              </li>
            ))}
          </ol>
          {options.length < 8 ? <Button type="button" variant="secondary" size="sm" onClick={() => setOptions([...options, { label: LETTERS[options.length], body: "" }])}><Plus /> Add option</Button> : null}
          <div className="flex flex-wrap items-center gap-4 text-sm">
            <label className="flex items-center gap-2">
              Answer source
              <Select value={answerSource} onChange={(e) => setAnswerSource(e.target.value as ReviewCandidate["answer_source"])} className="h-9 w-48">
                <option value="official_key">Official answer key</option>
                <option value="soma">Set by Soma</option>
                <option value="none">No answer</option>
              </Select>
            </label>
          </div>
          <div className="flex gap-2">
            <Button type="button" size="sm" onClick={save} disabled={pending}>{pending ? "Saving…" : "Save"}</Button>
            <Button type="button" size="sm" variant="ghost" onClick={() => { setEditing(false); setStem(c.stem); setOptions(c.options); setAnswer(c.answer_label ?? ""); }}>Cancel</Button>
          </div>
          {msg ? <p className="text-sm text-muted-foreground">{msg}</p> : null}
        </div>
      ) : (
        <>
          <p className="mt-2 whitespace-pre-wrap text-[15px] leading-relaxed text-ink">{c.stem}</p>
          {c.options.length ? (
            <ul className="mt-2 grid gap-1 text-sm sm:grid-cols-2">
              {c.options.map((o) => (
                <li key={o.label} className={cn("rounded-md px-2 py-1", o.label === c.answer_label ? "bg-primary-soft font-medium text-primary" : "")}>
                  <span className="font-semibold">{o.label}.</span> {o.body}
                </li>
              ))}
            </ul>
          ) : null}
        </>
      )}
    </li>
  );
}
