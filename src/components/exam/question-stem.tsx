import { cn } from "@/lib/utils";

/** Splits a stem into text and simple Markdown tables (lines that start with "|"). */
export function stemBlocks(stem: string): ({ kind: "text"; text: string } | { kind: "table"; rows: string[][] })[] {
  const out: ({ kind: "text"; text: string } | { kind: "table"; rows: string[][] })[] = [];
  let text: string[] = [];
  let table: string[][] = [];
  const flushText = () => { if (text.join("\n").trim()) out.push({ kind: "text", text: text.join("\n").trim() }); text = []; };
  const flushTable = () => { if (table.length) out.push({ kind: "table", rows: table }); table = []; };
  for (const line of stem.split("\n")) {
    const t = line.trim();
    if (t.startsWith("|") && t.endsWith("|") && t.length > 2) {
      flushText();
      if (/^\|[\s:|-]+\|$/.test(t)) continue; // the |---|---| separator row
      table.push(t.slice(1, -1).split("|").map((c) => c.trim()));
    } else {
      flushTable();
      text.push(line);
    }
  }
  flushText();
  flushTable();
  return out;
}

/** A question's picture (chart, figure or original Dzongkha print) and its text, with simple tables. */
export function QuestionStem({ stem, imageUrl, className, large = false }: { stem: string; imageUrl?: string | null; className?: string; large?: boolean }) {
  return (
    <div className={cn("space-y-3", className)}>
      {imageUrl ? (
        // eslint-disable-next-line @next/next/no-img-element -- static past-paper images of varying size
        <img src={imageUrl} alt="Figure for this question" loading="lazy" className="w-full max-w-2xl rounded-xl bg-white ring-1 ring-border" />
      ) : null}
      {stemBlocks(stem).map((b, i) =>
        b.kind === "text" ? (
          <p key={i} className={cn("whitespace-pre-wrap leading-relaxed text-ink", large && "text-[17px] sm:text-lg")}>{b.text}</p>
        ) : (
          <div key={i} className="overflow-x-auto rounded-xl ring-1 ring-border">
            <table className="w-full min-w-max border-collapse bg-white text-sm tabular-nums">
              <thead className="bg-muted">
                <tr>{b.rows[0].map((c, j) => <th key={j} scope="col" className="px-3 py-2 text-left font-semibold text-ink">{c}</th>)}</tr>
              </thead>
              <tbody>
                {b.rows.slice(1).map((r, k) => (
                  <tr key={k} className="border-t border-border">{r.map((c, j) => <td key={j} className="px-3 py-1.5 text-ink">{c}</td>)}</tr>
                ))}
              </tbody>
            </table>
          </div>
        ),
      )}
    </div>
  );
}
