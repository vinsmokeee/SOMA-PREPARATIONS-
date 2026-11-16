/** Device helpers for account security (pure; unit-tested). */

export const DEVICE_COOKIE = "soma_did";

/** Short human label for a user-agent string, e.g. "Chrome on Android". */
export function deviceLabel(ua: string | null | undefined): string {
  if (!ua) return "Unknown device";
  const os = /iPhone|iPad|iPod/.test(ua) ? (/iPad/.test(ua) ? "iPad" : "iPhone")
    : /Android/.test(ua) ? "Android" : /Windows/.test(ua) ? "Windows" : /Mac OS X|Macintosh/.test(ua) ? "Mac" : /Linux/.test(ua) ? "Linux" : "Unknown system";
  const browser = /Edg\//.test(ua) ? "Edge" : /OPR\/|Opera/.test(ua) ? "Opera" : /SamsungBrowser/.test(ua) ? "Samsung Internet"
    : /Firefox\//.test(ua) ? "Firefox" : /CriOS|Chrome\//.test(ua) ? "Chrome" : /Safari\//.test(ua) ? "Safari" : "Browser";
  return `${browser} on ${os}`;
}

type Amr = { method?: string; timestamp?: number }[] | undefined;

/** True when this session was opened with an e-mail link/code (proves access to the inbox). */
export function verifiedByEmail(amr: unknown, nowSeconds: number): boolean {
  const list = Array.isArray(amr) ? (amr as Amr) ?? [] : [];
  return list.some((a) => (a.method === "otp" || a.method === "magiclink" || a.method === "email/signup") && typeof a.timestamp === "number" && nowSeconds - a.timestamp < 24 * 3600);
}

export function isValidCountry(c: string | null | undefined): c is string {
  return Boolean(c && /^[A-Z]{2}$/.test(c));
}
