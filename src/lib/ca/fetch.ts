import "server-only";
import { lookup } from "node:dns/promises";
import { checkImportUrl, isPrivateAddress } from "@/lib/imports/url";

const MAX_FEED_BYTES = 5 * 1024 * 1024;

/**
 * Fetches a feed from a configured source with the same SSRF protection as
 * document imports: HTTPS only, the source's own host, public DNS answers,
 * every redirect re-checked, size and time limits.
 */
export async function fetchFeed(url: string): Promise<{ ok: true; text: string } | { ok: false; reason: string }> {
  const host = (() => { try { return new URL(url).hostname.toLowerCase(); } catch { return ""; } })();
  if (!host) return { ok: false, reason: "Invalid feed address" };
  const allowed = [host, host.startsWith("www.") ? host.slice(4) : `www.${host}`];
  let current = url;
  for (let hop = 0; hop <= 3; hop++) {
    const check = checkImportUrl(current, allowed);
    if (!check.ok) return { ok: false, reason: check.reason };
    try {
      const addrs = await lookup(check.url.hostname, { all: true });
      if (!addrs.length || addrs.some((a) => isPrivateAddress(a.address))) return { ok: false, reason: "Address not public" };
    } catch {
      return { ok: false, reason: "Host not found" };
    }
    let res: Response;
    try {
      res = await fetch(check.url, {
        redirect: "manual",
        signal: AbortSignal.timeout(20_000),
        headers: { "User-Agent": "SomaPreparations-CurrentAffairs/1.0 (+education; feed reader)", Accept: "application/rss+xml, application/atom+xml, application/xml, text/xml;q=0.9, */*;q=0.5" },
      });
    } catch {
      return { ok: false, reason: "No response (timeout or network error)" };
    }
    if (res.status >= 300 && res.status < 400) {
      const loc = res.headers.get("location");
      if (!loc) return { ok: false, reason: "Invalid redirect" };
      current = new URL(loc, check.url).toString();
      continue;
    }
    if (!res.ok) return { ok: false, reason: `HTTP ${res.status}${res.status === 403 ? " (automated access refused)" : ""}` };
    const len = Number(res.headers.get("content-length") ?? 0);
    if (len > MAX_FEED_BYTES) return { ok: false, reason: "Feed too large" };
    const buf = await res.arrayBuffer();
    if (buf.byteLength > MAX_FEED_BYTES) return { ok: false, reason: "Feed too large" };
    const text = new TextDecoder("utf-8").decode(buf);
    if (!/<(rss|feed|rdf:RDF)[\s>]/i.test(text.slice(0, 4000))) return { ok: false, reason: "Not an RSS or Atom feed" };
    return { ok: true, text };
  }
  return { ok: false, reason: "Too many redirects" };
}
