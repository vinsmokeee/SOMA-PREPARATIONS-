"use client";

import { useState, useTransition } from "react";
import { importQuestionsAction, type ImportRowResult } from "@/app/admin/questions/actions";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { mapCsvRecord, type Lookups, type RowResult } from "@/lib/admin/question-csv";
import { csvToRecords, parseCsv } from "@/lib/csv";
import { cn } from "@/lib/utils";

export function CsvImporter({ lookups }: { lookups: Lookups }) {
  const [rows, setRows] = useState<RowResult[] | null>(null);
  const [results, setResults] = useState<Map<number, ImportRowResult>>(new Map());
  const [error, setError] = useState<string | null>(null);
  const [pending, start] = useTransition();

  const load = async (file: File | undefined) => {
    setError(null);
    setResults(new Map());
    if (!file) return;
    if (file.size > 5 * 1024 * 1024) return setError("The file is larger than 5 MB. Split it into smaller files.");
    const records = csvToRecords(parseCsv(await file.text()));
    if (records.length === 0) return setError("No rows found. Use the template's column headings in the first row.");
    if (!("question" in records[0])) return setError("The first row must contain column headings, including “question”. Download the template to see the format.");
    if (records.length > 1000) return setError("At most 1,000 questions per file.");
    setRows(records.map((r, i) => mapCsvRecord(r, i + 2, lookups)));
  };

  const valid = rows?.filter((r) => r.payload) ?? [];
  const invalid = rows?.filter((r) => !r.payload) ?? [];

  const run = () =>
    start(async () => {
      const map = new Map(results);
      for (let i = 0; i < valid.length; i += 25) {
        const batch = valid.slice(i, i + 25).filter((r) => !map.get(r.row)?.ok).map((r) => ({ row: r.row, payload: r.payload! }));
        if (!batch.length) continue;
        const res = await importQuestionsAction(batch);
        for (const r of res) map.set(r.row, r);
        setResults(new Map(map));
      }
    });

  const imported = [...results.values()].filter((r) => r.ok).length;

  return (
    <div className="space-y-5">
      <div className="flex flex-wrap items-center gap-4">
        <input type="file" accept=".csv,text/csv" onChange={(e) => load(e.target.files?.[0])} className="text-sm" aria-label="Choose CSV file" />
        <a href="/templates/soma-questions-template.csv" download className="text-sm font-medium text-primary hover:underline">Download the template</a>
      </div>
      {error ? <Alert tone="danger">{error}</Alert> : null}
      {rows ? (
        <>
          <Alert tone={invalid.length ? "warning" : "success"} title={`${valid.length} rows ready${invalid.length ? `, ${invalid.length} with problems` : ""}`}>
            Rows with problems are skipped. Fix them in your spreadsheet and import that file again — rows already imported will be reported as duplicates.
          </Alert>
          <div className="max-h-[28rem] overflow-auto rounded-lg border border-border">
            <table className="w-full text-left text-sm">
              <thead className="sticky top-0 bg-muted text-xs uppercase tracking-wide text-muted-foreground">
                <tr><th className="px-3 py-2">Row</th><th className="px-3 py-2">Question</th><th className="px-3 py-2">Status</th></tr>
              </thead>
              <tbody className="divide-y divide-border">
                {rows.map((r) => {
                  const res = results.get(r.row);
                  return (
                    <tr key={r.row} className="align-top">
                      <td className="px-3 py-2 tabular-nums text-muted-foreground">{r.row}</td>
                      <td className="px-3 py-2"><span className="line-clamp-2 text-ink">{r.payload?.stem ?? "—"}</span></td>
                      <td className={cn("px-3 py-2", res ? (res.ok ? "text-primary" : "text-danger") : r.errors.length ? "text-danger" : "text-muted-foreground")}>
                        {res ? res.message : r.errors.length ? r.errors.join("; ") : "Ready"}
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
          <Button type="button" onClick={run} disabled={pending || valid.length === 0}>
            {pending ? `Importing… (${imported}/${valid.length})` : `Import ${valid.length} question${valid.length === 1 ? "" : "s"} as drafts`}
          </Button>
          {imported > 0 && !pending ? <Alert tone="success">{imported} questions imported as drafts. Review them in the question bank.</Alert> : null}
        </>
      ) : null}
    </div>
  );
}
