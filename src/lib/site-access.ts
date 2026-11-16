/**
 * Private preview mode: when SITE_ACCESS_CODE is set, every page asks for the
 * code first. The browser keeps only a hash of the code in an http-only cookie.
 * Machine endpoints (/api/*: scheduler, payment webhooks) are not gated — they
 * have their own authentication.
 */
export const ACCESS_COOKIE = "soma_access";

export async function accessToken(code: string): Promise<string> {
  const bytes = new TextEncoder().encode(`soma-preview:${code}`);
  const digest = await crypto.subtle.digest("SHA-256", bytes);
  return Array.from(new Uint8Array(digest), (b) => b.toString(16).padStart(2, "0")).join("");
}

/** Paths reachable without the access code. */
export function isOpenPath(pathname: string): boolean {
  return pathname === "/access" || pathname.startsWith("/api/") || pathname === "/robots.txt";
}

export function safeNext(next: string | null | undefined): string {
  return next && next.startsWith("/") && !next.startsWith("//") && !next.startsWith("/access") ? next : "/";
}
