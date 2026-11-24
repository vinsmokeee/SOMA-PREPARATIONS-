import "server-only";
import { lookup } from "node:dns/promises";
import { checkImportUrl, isPrivateAddress } from "./url";

export const MAX_DOCUMENT_BYTES = 25 * 1024 * 1024;
const ALLOWED_TYPES = ["application/pdf", "application/octet-stream"];

export type Fetched = { ok: true; bytes: Uint8Array; contentType: string; finalUrl: string } | { ok: false; reason: string };

/**
 * Fetches a document from an allow-listed host with SSRF protection:
 * every hop (including redirects) is re-validated, DNS answers must be public
 * addresses, the response must be a PDF and is capped in size and time.
 */
export async function fetchDocument(input: string, allowedHosts: string[]): Promise<Fetched> {
  let current = input;
  for (let hop = 0; hop <= 3; hop++) {
    const check = checkImportUrl(current, allowedHosts);
    if (!check.ok) return { ok: false, reason: check.reason };
    try {
      const addresses = await lookup(check.url.hostname, { all: true });
      if (addresses.length === 0 || addresses.some((a) => isPrivateAddress(a.address))) {
        return { ok: false, reason: "The address of that site could not be verified as public." };
      }
    } catch {
      return { ok: false, reason: "The site could not be found. Check the link." };
    }

    let res: Response;
    try {
      res = await fetch(check.url, {
        redirect: "manual",
        signal: AbortSignal.timeout(30_000),
        headers: { "User-Agent": "SomaAcademy-DocumentImport/1.0", Accept: "application/pdf" },
      });
    } catch {
      return { ok: false, reason: "The site did not respond. It may be temporarily unavailable." };
    }

    if (res.status >= 300 && res.status < 400) {
      const location = res.headers.get("location");
      if (!location) return { ok: false, reason: "The site sent an invalid redirect." };
      current = new URL(location, check.url).toString();
      continue;
    }
    if (res.status === 403) {
      return { ok: false, reason: "The site refused automated access (HTTP 403). Download the PDF yourself and upload it instead." };
    }
    if (!res.ok) return { ok: false, reason: `The site returned an error (HTTP ${res.status}).` };

    const type = (res.headers.get("content-type") ?? "").split(";")[0].trim().toLowerCase();
    if (type && !ALLOWED_TYPES.includes(type)) {
      return { ok: false, reason: `That link is not a PDF document (it is ${type || "unknown"}). Link to the PDF file itself.` };
    }
    const declared = Number(res.headers.get("content-length") ?? 0);
    if (declared > MAX_DOCUMENT_BYTES) return { ok: false, reason: "The document is larger than 25 MB." };

    const reader = res.body?.getReader();
    if (!reader) return { ok: false, reason: "The document was empty." };
    const chunks: Uint8Array[] = [];
    let total = 0;
    for (;;) {
      const { done, value } = await reader.read();
      if (done) break;
      total += value.byteLength;
      if (total > MAX_DOCUMENT_BYTES) {
        await reader.cancel();
        return { ok: false, reason: "The document is larger than 25 MB." };
      }
      chunks.push(value);
    }
    const bytes = new Uint8Array(total);
    let offset = 0;
    for (const c of chunks) {
      bytes.set(c, offset);
      offset += c.byteLength;
    }
    if (!isPdf(bytes)) return { ok: false, reason: "The downloaded file is not a valid PDF." };
    return { ok: true, bytes, contentType: "application/pdf", finalUrl: check.url.toString() };
  }
  return { ok: false, reason: "Too many redirects." };
}

export function isPdf(bytes: Uint8Array): boolean {
  return bytes.length > 4 && bytes[0] === 0x25 && bytes[1] === 0x50 && bytes[2] === 0x44 && bytes[3] === 0x46; // %PDF
}
