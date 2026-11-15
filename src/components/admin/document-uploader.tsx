"use client";

import { useRouter } from "next/navigation";
import { useRef, useState } from "react";
import { CheckCircle2, FileUp, Loader2, XCircle } from "lucide-react";
import { registerUpload } from "@/app/admin/imports/actions";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { getBrowserClient } from "@/lib/supabase/client";

type Row = {
  file: File;
  title: string;
  year: string;
  stage: "" | "PE" | "ME";
  type: string;
  state: "ready" | "uploading" | "processing" | "done" | "error";
  message?: string;
  documentId?: string;
};

const MAX_BYTES = 25 * 1024 * 1024;

/** Guess year and stage from names like "BCSE_2015_PE.pdf" or "Main Exam 2019 Paper II.pdf". */
export function guessFromFilename(name: string): { title: string; year: string; stage: "" | "PE" | "ME" } {
  const base = name.replace(/\.pdf$/i, "").replace(/[_]+/g, " ").replace(/\s+/g, " ").trim();
  const year = /\b(19|20)\d{2}\b/.exec(base)?.[0] ?? "";
  const stage = /\b(PE|prelim|preliminary)\b/i.test(base) ? "PE" : /\b(ME|main)\b/i.test(base) ? "ME" : "";
  return { title: base, year, stage };
}

function safeName(name: string) {
  return name.replace(/[^\w.\- ]+/g, "").replace(/\s+/g, "-").slice(0, 120) || "document.pdf";
}

export function DocumentUploader() {
  const router = useRouter();
  const input = useRef<HTMLInputElement>(null);
  const [rows, setRows] = useState<Row[]>([]);
  const [busy, setBusy] = useState(false);

  const add = (files: FileList | null) => {
    if (!files) return;
    const next: Row[] = [];
    for (const file of Array.from(files)) {
      const g = guessFromFilename(file.name);
      const bad = file.type !== "application/pdf" && !file.name.toLowerCase().endsWith(".pdf");
      next.push({
        file,
        title: g.title,
        year: g.year,
        stage: g.stage,
        type: "past_paper",
        state: bad || file.size > MAX_BYTES ? "error" : "ready",
        message: bad ? "Not a PDF" : file.size > MAX_BYTES ? "Larger than 25 MB" : undefined,
      });
    }
    setRows((r) => [...r, ...next]);
    if (input.current) input.current.value = "";
  };

  const update = (i: number, patch: Partial<Row>) => setRows((r) => r.map((x, j) => (j === i ? { ...x, ...patch } : x)));

  const uploadAll = async () => {
    const supabase = getBrowserClient();
    if (!supabase) return;
    setBusy(true);
    for (let i = 0; i < rows.length; i++) {
      const row = rows[i];
      if (row.state !== "ready") continue;
      update(i, { state: "uploading", message: "Uploading…" });
      const path = `uploads/${crypto.randomUUID()}/${safeName(row.file.name)}`;
      const { error } = await supabase.storage.from("source-documents").upload(path, row.file, { contentType: "application/pdf", upsert: false });
      if (error) {
        update(i, { state: "error", message: `Upload failed: ${error.message}` });
        continue;
      }
      update(i, { state: "processing", message: "Extracting text and questions…" });
      try {
        const res = await registerUpload({ storagePath: path, filename: row.file.name, title: row.title, document_type: row.type, exam_year: row.year, stage: row.stage });
        update(i, { state: res.status === "error" ? "error" : "done", message: res.message ?? (res.fieldErrors ? Object.values(res.fieldErrors).join(" ") : ""), documentId: res.documentId });
      } catch {
        update(i, { state: "error", message: "Processing failed. Please try again." });
      }
    }
    setBusy(false);
    router.refresh();
  };

  const ready = rows.filter((r) => r.state === "ready").length;

  return (
    <div className="space-y-4">
      <label className="flex cursor-pointer flex-col items-center justify-center gap-2 rounded-xl border-2 border-dashed border-border-strong p-8 text-center hover:bg-muted/50">
        <FileUp className="size-6 text-primary" aria-hidden />
        <span className="font-medium text-ink">Choose PDF files</span>
        <span className="text-sm text-muted-foreground">You can select many papers at once. Up to 25 MB each.</span>
        <input ref={input} type="file" accept="application/pdf,.pdf" multiple className="sr-only" onChange={(e) => add(e.target.files)} />
      </label>

      {rows.length > 0 ? (
        <ul className="space-y-3">
          {rows.map((r, i) => (
            <li key={i} className="rounded-lg border border-border p-3">
              <div className="flex items-center gap-2 text-sm">
                {r.state === "done" ? <CheckCircle2 className="size-4 text-primary" aria-hidden /> : r.state === "error" ? <XCircle className="size-4 text-danger" aria-hidden /> : r.state === "ready" ? <FileUp className="size-4 text-muted-foreground" aria-hidden /> : <Loader2 className="size-4 animate-spin text-primary" aria-hidden />}
                <span className="min-w-0 flex-1 truncate font-medium text-ink">{r.file.name}</span>
                <span className="text-xs text-muted-foreground">{Math.round(r.file.size / 1024)} KB</span>
              </div>
              {r.state === "ready" ? (
                <div className="mt-3 grid gap-2 sm:grid-cols-[2fr_90px_110px_160px]">
                  <Input aria-label="Title" value={r.title} onChange={(e) => update(i, { title: e.target.value })} className="h-9" />
                  <Input aria-label="Year" inputMode="numeric" placeholder="Year" value={r.year} onChange={(e) => update(i, { year: e.target.value })} className="h-9" />
                  <Select aria-label="Stage" value={r.stage} onChange={(e) => update(i, { stage: e.target.value as Row["stage"] })} className="h-9">
                    <option value="">Stage?</option>
                    <option value="PE">PE</option>
                    <option value="ME">ME</option>
                  </Select>
                  <Select aria-label="Type" value={r.type} onChange={(e) => update(i, { type: e.target.value })} className="h-9">
                    <option value="past_paper">Past paper</option>
                    <option value="answer_key">Answer key</option>
                    <option value="syllabus">Syllabus</option>
                    <option value="announcement">Announcement</option>
                    <option value="other">Other</option>
                  </Select>
                </div>
              ) : null}
              {r.message ? (
                <p className={r.state === "error" ? "mt-2 text-sm text-danger" : "mt-2 text-sm text-muted-foreground"}>
                  {r.message}{" "}
                  {r.documentId ? <a href={`/admin/imports/${r.documentId}`} className="font-medium text-primary underline">Open</a> : null}
                </p>
              ) : null}
            </li>
          ))}
        </ul>
      ) : null}

      {ready > 0 ? (
        <Button type="button" onClick={uploadAll} disabled={busy}>
          {busy ? "Working…" : `Upload and process ${ready} file${ready === 1 ? "" : "s"}`}
        </Button>
      ) : null}
    </div>
  );
}
