import { XMLParser } from "fast-xml-parser";

/** One entry from an RSS 2.0 or Atom feed, normalised. */
export type FeedEntry = { title: string; url: string; publishedAt: string | null; snippet: string | null; body: string | null };

const parser = new XMLParser({
  ignoreAttributes: false,
  attributeNamePrefix: "@",
  textNodeName: "#text",
  processEntities: true,
  htmlEntities: true,
  cdataPropName: false,
  trimValues: true,
});

const asArray = <T,>(v: T | T[] | undefined | null): T[] => (v == null ? [] : Array.isArray(v) ? v : [v]);
const text = (v: unknown): string => {
  if (v == null) return "";
  if (typeof v === "string" || typeof v === "number") return String(v);
  if (typeof v === "object" && "#text" in (v as Record<string, unknown>)) return String((v as Record<string, unknown>)["#text"] ?? "");
  return "";
};

/** Strips tags, scripts and entities left in feed HTML and collapses whitespace. */
export function htmlToText(html: string): string {
  return html
    .replace(/<(script|style|iframe|noscript)[\s\S]*?<\/\1>/gi, " ")
    .replace(/<br\s*\/?>|<\/p>|<\/li>|<\/h\d>/gi, "\n")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, '"').replace(/&#0?39;|&rsquo;|&lsquo;/g, "'")
    .replace(/&#(\d+);/g, (_, n) => String.fromCodePoint(Number(n)))
    .replace(/[ \t\f\v]+/g, " ")
    .replace(/\s*\n\s*/g, "\n")
    .replace(/\n{2,}/g, "\n")
    .trim();
}

function parseDate(v: string): string | null {
  if (!v) return null;
  const d = new Date(v);
  return Number.isNaN(d.getTime()) ? null : d.toISOString();
}

function cleanUrl(v: string): string | null {
  try {
    const u = new URL(v.trim());
    if (u.protocol !== "https:" && u.protocol !== "http:") return null;
    u.hash = "";
    for (const k of [...u.searchParams.keys()]) if (/^(utm_|fbclid$|gclid$)/i.test(k)) u.searchParams.delete(k);
    return u.toString();
  } catch {
    return null;
  }
}

/** Parses RSS 2.0 / RSS 1.0 (RDF) / Atom. Invalid entries are skipped. */
export function parseFeed(xml: string, opts: { keepBody?: boolean; max?: number } = {}): FeedEntry[] {
  let doc: Record<string, unknown>;
  try {
    doc = parser.parse(xml) as Record<string, unknown>;
  } catch {
    return [];
  }
  const rss = doc.rss as { channel?: { item?: unknown } } | undefined;
  const rdf = doc["rdf:RDF"] as { item?: unknown } | undefined;
  const atom = doc.feed as { entry?: unknown } | undefined;
  type Raw = Record<string, unknown>;
  const items: Raw[] = rss?.channel ? asArray(rss.channel.item as Raw | Raw[]) : rdf ? asArray(rdf.item as Raw | Raw[]) : atom ? asArray(atom.entry as Raw | Raw[]) : [];

  const out: FeedEntry[] = [];
  for (const it of items) {
    const title = htmlToText(text(it.title)).slice(0, 500);
    let link = text(it.link);
    if (!link && it.link) {
      const links = asArray(it.link as Raw | Raw[]);
      const alt = links.find((l) => !l["@rel"] || l["@rel"] === "alternate") ?? links[0];
      link = String(alt?.["@href"] ?? "");
    }
    if (!link && typeof it.guid === "string" && /^https?:/.test(it.guid)) link = it.guid;
    const url = cleanUrl(link);
    if (!title || !url) continue;
    const descHtml = text(it.description) || text(it.summary) || "";
    const bodyHtml = text(it["content:encoded"]) || text(it.content) || "";
    const snippet = htmlToText(descHtml || bodyHtml).slice(0, 1500) || null;
    out.push({
      title,
      url,
      publishedAt: parseDate(text(it.pubDate) || text(it.published) || text(it.updated) || text(it["dc:date"])),
      snippet,
      body: opts.keepBody && bodyHtml ? htmlToText(bodyHtml).slice(0, 20000) : null,
    });
    if (out.length >= (opts.max ?? 50)) break;
  }
  return out;
}
