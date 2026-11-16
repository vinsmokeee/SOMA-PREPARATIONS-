/**
 * Duplicate detection and story grouping (pure).
 * Headlines are normalised to a fingerprint; two articles belong to the same
 * story when their important words overlap strongly within a few days.
 */

const STOP = new Set("a an the of in on at to for and or but with by from as is are was were be been has have had it its this that these those over after before into about amid new says said will would can could than more less up down out not no".split(" "));

export function fingerprint(title: string): string {
  return title
    .toLowerCase()
    .normalize("NFKD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-z0-9ༀ-࿿\s]/g, " ")
    .split(/\s+/)
    .filter((w) => w && !STOP.has(w))
    .join(" ")
    .trim();
}

function tokens(fp: string) {
  return new Set(fp.split(" ").filter((w) => w.length > 2));
}

/** Overlap coefficient of important words (0–1). */
export function similarity(a: string, b: string): number {
  const A = tokens(a), B = tokens(b);
  if (!A.size || !B.size) return 0;
  let inter = 0;
  for (const w of A) if (B.has(w)) inter++;
  return inter / Math.min(A.size, B.size);
}

export type Groupable = { id: string; fingerprint: string; publishedAt: string | null; storyId?: string | null };

/**
 * Assigns each article to an existing story (when a member is similar enough and
 * close in time) or starts a new group. Returns groups of article ids, keyed by
 * existing story id or a new-group key.
 */
export function groupArticles(fresh: Groupable[], existing: Groupable[], opts = { threshold: 0.6, windowHours: 96 }): Map<string, string[]> {
  const groups = new Map<string, string[]>();
  const pool: { key: string; a: Groupable }[] = existing.filter((e) => e.storyId).map((e) => ({ key: `story:${e.storyId}`, a: e }));
  const hours = (x: Groupable, y: Groupable) =>
    x.publishedAt && y.publishedAt ? Math.abs(new Date(x.publishedAt).getTime() - new Date(y.publishedAt).getTime()) / 3.6e6 : 0;
  for (const a of fresh) {
    let best: { key: string; s: number } | null = null;
    for (const p of pool) {
      if (hours(a, p.a) > opts.windowHours) continue;
      const s = similarity(a.fingerprint, p.a.fingerprint);
      if (s >= opts.threshold && (!best || s > best.s)) best = { key: p.key, s };
    }
    const key = best?.key ?? `new:${a.id}`;
    groups.set(key, [...(groups.get(key) ?? []), a.id]);
    pool.push({ key, a });
  }
  return groups;
}
