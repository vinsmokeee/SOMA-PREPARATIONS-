/**
 * Splits the text of an examination paper into candidate questions.
 *
 * Handles common layouts:
 *   "1. Stem" / "1) Stem" / "Q1. Stem" / "Question 1: Stem"
 *   options on their own lines: "(a) text", "a) text", "A. text"
 *   options inline: "(a) x (b) y (c) z (d) w"
 *   inline answers: "Answer: B", "Ans. (c)"
 *   answer-key sections: "Answer key" followed by "1. B  2. C ..." / "1-B" etc.
 *   section headings: "SECTION A", "Part II: ...", short ALL-CAPS lines
 *
 * It never guesses silently: anything unusual is reported in `issues`, and
 * every candidate goes to human review before it can become a question.
 */

export type CandidateOption = { label: string; body: string };

export type Candidate = {
  number: number | null;
  section: string | null;
  stem: string;
  options: CandidateOption[];
  answer_label: string | null;
  answer_source: "official_key" | "none";
  page: number;
  confidence: number;
  issues: string[];
};

export type SplitResult = { candidates: Candidate[]; answerKeyFound: boolean; warnings: string[] };

const LETTERS = "ABCDEFGH";
const QUESTION_RE = /^\s*(?:Q(?:uestion)?\s*\.?\s*)?(\d{1,3})\s*[.):]\s*(.*)$/i;
const OPTION_RE = /^\s*\(?([a-hA-H])\s*[).]\s+(.*)$/;
const INLINE_ANSWER_RE = /^\s*(?:correct\s+)?ans(?:wer)?\s*\.?\s*[:\-–]?\s*\(?([a-hA-H])\)?\s*\.?\s*$/i;
const KEY_HEADER_RE = /^\s*(answer\s*key|answers|key\s+to\s+answers|answer\s+sheet\s+key)\b\s*:?\s*$/i;
const KEY_PAIR_RE = /(\d{1,3})\s*[.)\-:–]?\s*\(?([a-hA-H])\)?(?=\s|$|,|;)/g;
const SECTION_RE = /^\s*(section|part)\s+([A-Z]|[IVX]+|\d+)\b.*$/i;
const NOISE_RE = /^\s*(page\s+\d+(\s+of\s+\d+)?|\d+\s*\/\s*\d+|-\s*\d+\s*-|\d{1,3})\s*$/i;

function isAllCapsHeading(line: string): boolean {
  const t = line.trim();
  if (t.length < 4 || t.length > 80) return false;
  if (!/[A-Z]{3}/.test(t) || /[a-z]/.test(t)) return false;
  return !QUESTION_RE.test(t) && !OPTION_RE.test(t);
}

/** Splits "(a) x (b) y (c) z" into options if the markers run in order from `startLetter`. */
export function splitInlineOptions(text: string, startLetter = "A"): CandidateOption[] | null {
  const re = /(?:^|\s)\(([a-hA-H])\)\s*|(?:^|\s)([a-hA-H])\)\s+/g;
  const marks: { label: string; index: number; end: number }[] = [];
  let m: RegExpExecArray | null;
  while ((m = re.exec(text))) {
    marks.push({ label: (m[1] ?? m[2]).toUpperCase(), index: m.index, end: re.lastIndex });
  }
  if (marks.length < 2) return null;
  let expected = LETTERS.indexOf(startLetter);
  for (const mk of marks) {
    if (mk.label !== LETTERS[expected]) return null;
    expected++;
  }
  return marks.map((mk, i) => ({ label: mk.label, body: text.slice(mk.end, i + 1 < marks.length ? marks[i + 1].index : undefined).trim() }));
}

function parseAnswerKey(lines: string[]): Map<number, string> {
  const key = new Map<number, string>();
  for (const line of lines) {
    for (const m of line.matchAll(KEY_PAIR_RE)) {
      const n = Number(m[1]);
      if (!key.has(n)) key.set(n, m[2].toUpperCase());
    }
  }
  return key;
}

export function splitQuestions(pages: string[]): SplitResult {
  type Line = { text: string; page: number };
  const lines: Line[] = [];
  pages.forEach((p, i) => {
    for (const raw of p.split(/\r?\n/)) {
      const text = raw.replace(/\s+$/, "");
      if (!text.trim() || NOISE_RE.test(text)) continue;
      lines.push({ text, page: i + 1 });
    }
  });

  // Separate an answer-key section, if any.
  const keyStart = lines.findIndex((l) => KEY_HEADER_RE.test(l.text));
  const body = keyStart >= 0 ? lines.slice(0, keyStart) : lines;
  const key = keyStart >= 0 ? parseAnswerKey(lines.slice(keyStart + 1).map((l) => l.text)) : new Map<number, string>();

  type Draft = Candidate & { lastOption: number };
  const out: Draft[] = [];
  let current: Draft | null = null;
  let section: string | null = null;

  const startQuestion = (n: number, rest: string, page: number) => {
    current = { number: n, section, stem: rest.trim(), options: [], answer_label: null, answer_source: "none", page, confidence: 1, issues: [], lastOption: -1 };
    out.push(current);
    // Options may already be inline in the first line.
    const inline = rest ? splitInlineOptions(rest) : null;
    if (inline) {
      const first = rest.search(/(?:^|\s)\(?[aA]\)/);
      current.stem = rest.slice(0, Math.max(0, first)).trim();
      current.options = inline;
      current.lastOption = inline.length - 1;
    }
  };

  for (const { text, page } of body) {
    const cur = current as Draft | null;

    const ans = INLINE_ANSWER_RE.exec(text);
    if (ans && cur) {
      cur.answer_label = ans[1].toUpperCase();
      cur.answer_source = "official_key";
      continue;
    }

    const q = QUESTION_RE.exec(text);
    if (q) {
      const n = Number(q[1]);
      const prev = cur?.number ?? 0;
      const plausible = !cur ? n <= 5 || out.length === 0 : n > prev && n - prev <= 3;
      // A numbered line inside options of the current question is more likely a new question;
      // a numbered line in the stem with a non-sequential number is treated as stem text.
      if (plausible) {
        startQuestion(n, q[2] ?? "", page);
        if (cur && n - prev > 1) current!.issues.push(`Question numbers jump from ${prev} to ${n} — a question may be missing.`);
        continue;
      }
    }

    if (cur) {
      const o = OPTION_RE.exec(text);
      const nextLetter = LETTERS[cur.lastOption + 1];
      if (o && o[1].toUpperCase() === nextLetter) {
        // The option line may itself carry further inline options.
        const inline = splitInlineOptions(text.trim(), nextLetter);
        if (inline && inline.length > 1) {
          cur.options.push(...inline);
          cur.lastOption += inline.length;
        } else {
          cur.options.push({ label: nextLetter, body: o[2].trim() });
          cur.lastOption++;
        }
        continue;
      }
      if (cur.options.length === 0) {
        const inline = splitInlineOptions(text.trim());
        if (inline) {
          cur.options = inline;
          cur.lastOption = inline.length - 1;
          continue;
        }
      }
    }

    if (SECTION_RE.test(text) || (isAllCapsHeading(text) && (!cur || cur.options.length > 0))) {
      section = text.trim();
      current = null;
      continue;
    }

    if (cur) {
      if (cur.options.length > 0) {
        const last = cur.options[cur.options.length - 1];
        last.body = `${last.body} ${text.trim()}`.trim();
      } else {
        cur.stem = cur.stem ? `${cur.stem}\n${text.trim()}` : text.trim();
      }
    }
  }

  const seen = new Set<number>();
  const candidates: Candidate[] = out.map((d) => {
    const c: Candidate = { number: d.number, section: d.section, stem: d.stem.trim(), options: d.options, answer_label: d.answer_label, answer_source: d.answer_source, page: d.page, confidence: 1, issues: [...d.issues] };
    if (c.number !== null) {
      if (seen.has(c.number)) c.issues.push(`Question number ${c.number} appears more than once.`);
      seen.add(c.number);
      if (!c.answer_label && key.has(c.number)) {
        c.answer_label = key.get(c.number)!;
        c.answer_source = "official_key";
      }
    }
    if (!c.stem) c.issues.push("The question text is empty.");
    if (c.options.length === 0) c.issues.push("No answer options found — this may be a written question or an extraction problem.");
    else if (c.options.length < 3) c.issues.push(`Only ${c.options.length} options found.`);
    if (c.options.some((o) => !o.body)) c.issues.push("An option is empty.");
    if (c.answer_label && c.options.length && !c.options.some((o) => o.label === c.answer_label)) {
      c.issues.push(`The answer key says ${c.answer_label}, which is not one of the options.`);
    }
    if (c.options.length > 0 && !c.answer_label) c.issues.push("No answer found in the paper — the answer must be added during review.");
    c.confidence = Math.max(0.1, Math.round((1 - 0.2 * c.issues.length) * 100) / 100);
    return c;
  });

  const warnings: string[] = [];
  if (candidates.length === 0) warnings.push("No numbered questions were found. The document may not be a question paper, or it may be scanned.");
  if (keyStart >= 0 && key.size === 0) warnings.push("An answer-key heading was found but no answers could be read from it.");
  return { candidates, answerKeyFound: key.size > 0, warnings };
}
