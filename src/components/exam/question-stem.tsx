import { cn } from "@/lib/utils";

type StemBlock = { kind: "text"; text: string } | { kind: "heading"; text: string } | { kind: "table"; rows: string[][] };

/**
 * A passage title: a paragraph of one short line, not the last block, that does not end like a sentence or ask a
 * question - e.g. "Bhutaneseness: Preserving Identity in a Rapidly Changing World" or "Digital Currency"
 * (founder, 20 Nov 2026: titles looked like ordinary text).
 */
export function isTitleLine(p: string): boolean {
  const t = p.trim();
  return t.length > 0 && t.length <= 100 && !t.includes("\n") && !t.includes("?") && !t.includes("__") && !/[.!:;,]$/.test(t)
    && /^[A-Z]/.test(t) && /[A-Za-z]{4,}/.test(t) && !/marks?\)$/i.test(t) && !/[ༀ-࿿]/.test(t);
}

/** Splits a stem into text, passage titles and simple Markdown tables (lines that start with "|"). */
export function stemBlocks(stem: string): StemBlock[] {
  const raw: StemBlock[] = [];
  let text: string[] = [];
  let table: string[][] = [];
  const flushText = () => { if (text.join("\n").trim()) raw.push({ kind: "text", text: text.join("\n").trim() }); text = []; };
  const flushTable = () => { if (table.length) raw.push({ kind: "table", rows: table }); table = []; };
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
  // Paragraphs inside a text block: a short title paragraph (not the last thing in the stem) becomes a heading.
  const out: StemBlock[] = [];
  raw.forEach((b, i) => {
    if (b.kind !== "text") { out.push(b); return; }
    const paras = b.text.split(/\n\s*\n/);
    let buf: string[] = [];
    paras.forEach((p, j) => {
      const last = i === raw.length - 1 && j === paras.length - 1;
      if (!last && isTitleLine(p)) {
        if (buf.length) out.push({ kind: "text", text: buf.join("\n\n") });
        buf = [];
        out.push({ kind: "heading", text: p.trim() });
      } else buf.push(p);
    });
    if (buf.length) out.push({ kind: "text", text: buf.join("\n\n") });
  });
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
        b.kind === "heading" ? (
          <p key={i} className={cn("text-balance font-semibold leading-snug text-ink", large ? "text-lg sm:text-xl" : "text-base")}>{b.text}</p>
        ) : b.kind === "text" ? (
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
