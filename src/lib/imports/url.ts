import { isIP } from "node:net";

export const DEFAULT_ALLOWED_HOSTS = ["rcsc.gov.bt", "www.rcsc.gov.bt"];

export type UrlCheck = { ok: true; url: URL; normalized: string } | { ok: false; reason: string };

/**
 * Normalises a document URL for duplicate detection: lower-case, no fragment,
 * no tracking parameters, no default port, no trailing "?".
 */
export function normalizeUrl(input: string): string {
  const u = new URL(input.trim());
  u.hash = "";
  for (const key of [...u.searchParams.keys()]) {
    if (/^(utm_|fbclid$|gclid$)/i.test(key)) u.searchParams.delete(key);
  }
  if ((u.protocol === "https:" && u.port === "443") || (u.protocol === "http:" && u.port === "80")) u.port = "";
  return u.toString().replace(/\?$/, "").toLowerCase();
}

/**
 * Validates a URL an administrator wants Soma to fetch. Only HTTPS, only hosts
 * on the allow-list, no credentials, no custom ports, no IP literals.
 * (DNS results are checked separately at fetch time.)
 */
export function checkImportUrl(input: string, allowedHosts: string[] = DEFAULT_ALLOWED_HOSTS): UrlCheck {
  let url: URL;
  try {
    url = new URL(input.trim());
  } catch {
    return { ok: false, reason: "That is not a valid web address." };
  }
  if (url.protocol !== "https:") return { ok: false, reason: "Only secure (https://) links can be imported." };
  if (url.username || url.password) return { ok: false, reason: "Links containing usernames or passwords are not allowed." };
  if (url.port && url.port !== "443") return { ok: false, reason: "Links with a custom port are not allowed." };
  const host = url.hostname.toLowerCase();
  if (isIP(host.replace(/^\[|\]$/g, ""))) return { ok: false, reason: "Links must use a domain name, not an IP address." };
  if (!allowedHosts.map((h) => h.toLowerCase()).includes(host)) {
    return { ok: false, reason: `Only links from approved sources can be imported (${allowedHosts.join(", ")}).` };
  }
  return { ok: true, url, normalized: normalizeUrl(url.toString()) };
}

/** True for loopback, private, link-local, CGNAT, multicast and other non-public addresses. */
export function isPrivateAddress(address: string): boolean {
  const v = isIP(address);
  if (v === 4) {
    const [a, b] = address.split(".").map(Number);
    return (
      a === 0 || a === 10 || a === 127 || (a === 100 && b >= 64 && b <= 127) || (a === 169 && b === 254) ||
      (a === 172 && b >= 16 && b <= 31) || (a === 192 && b === 168) || (a === 192 && b === 0) ||
      (a === 198 && (b === 18 || b === 19)) || a >= 224
    );
  }
  if (v === 6) {
    const s = address.toLowerCase();
    if (s === "::1" || s === "::") return true;
    if (s.startsWith("::ffff:")) return isPrivateAddress(s.slice(7));
    return /^(fc|fd|fe8|fe9|fea|feb|ff)/.test(s);
  }
  return true;
}
