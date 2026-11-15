"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState, useTransition } from "react";
import { bulkReviewAction } from "@/app/admin/questions/actions";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Select } from "@/components/ui/input";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-labels";
import { TYPE_LABELS, type QuestionType } from "@/lib/exam/types";
import { formatDate } from "@/lib/utils";

export type ListRow = {
  id: string;
  stage: string;
  question_type: QuestionType;
  stem: string;
  status: string;
  difficulty: string;
  origin: string;
  updated_at: string;
  subject: string | null;
};

const ACTIONS = [
  { value: "submit", label: "Submit for review" },
  { value: "verify", label: "Verify" },
  { value: "publish", label: "Publish" },
  { value: "unpublish", label: "Unpublish" },
  { value: "archive", label: "Archive" },
] as const;

export function QuestionList({ rows }: { rows: ListRow[] }) {
  const router = useRouter();
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [action, setAction] = useState<(typeof ACTIONS)[number]["value"]>("verify");
  const [result, setResult] = useState<{ tone: "success" | "warning"; message: string; details: string[] } | null>(null);
  const [pending, start] = useTransition();

  const all = rows.length > 0 && rows.every((r) => selected.has(r.id));
  const run = () => {
    const ids = [...selected];
    if (!ids.length) return;
    if (!window.confirm(`${ACTIONS.find((a) => a.value === action)?.label} ${ids.length} question${ids.length === 1 ? "" : "s"}?`)) return;
    start(async () => {
      const r = await bulkReviewAction({ ids, action });
      const byId = new Map(rows.map((x) => [x.id, x.stem.slice(0, 60)]));
      setResult({ tone: r.failed.length ? "warning" : "success", message: `${r.done} updated${r.failed.length ? `, ${r.failed.length} not changed` : ""}.`, details: r.failed.slice(0, 10).map((f) => `${byId.get(f.id)}… — ${f.message}`) });
      setSelected(new Set());
      router.refresh();
    });
  };

  return (
    <div className="space-y-3">
      <div className="flex flex-wrap items-center gap-3 rounded-lg border border-border bg-muted/40 p-3 text-sm">
        <label className="flex items-center gap-2">
          <input type="checkbox" className="size-4 accent-[var(--primary)]" checked={all} onChange={(e) => setSelected(e.target.checked ? new Set(rows.map((r) => r.id)) : new Set())} />
          Select all on this page
        </label>
        <span className="text-muted-foreground">{selected.size} selected</span>
        <span className="flex-1" />
        <Select aria-label="Action" value={action} onChange={(e) => setAction(e.target.value as typeof action)} className="h-9 w-48">
          {ACTIONS.map((a) => <option key={a.value} value={a.value}>{a.label}</option>)}
        </Select>
        <Button type="button" size="sm" onClick={run} disabled={pending || selected.size === 0}>{pending ? "Working…" : "Apply"}</Button>
      </div>
      {result ? (
        <Alert tone={result.tone} title={result.message}>
          {result.details.length ? <ul className="list-disc pl-5">{result.details.map((d) => <li key={d}>{d}</li>)}</ul> : null}
        </Alert>
      ) : null}
      <ul className="divide-y divide-border rounded-xl border border-border">
        {rows.map((r) => (
          <li key={r.id} className="flex gap-3 p-4 hover:bg-muted/40">
            <input type="checkbox" className="mt-1 size-4 shrink-0 accent-[var(--primary)]" checked={selected.has(r.id)} aria-label="Select question" onChange={() => setSelected((s) => { const n = new Set(s); if (n.has(r.id)) n.delete(r.id); else n.add(r.id); return n; })} />
            <Link href={`/admin/questions/${r.id}`} className="min-w-0 flex-1">
              <div className="flex flex-wrap items-center gap-2 text-xs">
                <Badge tone={STATUS_TONES[r.status]}>{STATUS_LABELS[r.status]}</Badge>
                <Badge tone="outline">{r.stage}</Badge>
                {r.origin === "historical_official" ? <Badge tone="neutral">Past paper</Badge> : null}
                <span className="text-muted-foreground">{TYPE_LABELS[r.question_type]} · {r.subject ?? "No subject"} · {r.difficulty}</span>
                <span className="ml-auto text-muted-foreground">{formatDate(r.updated_at)}</span>
              </div>
              <p className="mt-2 line-clamp-2 text-[15px] text-ink">{r.stem}</p>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
