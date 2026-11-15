import "server-only";
import { createHash } from "node:crypto";
import { extractText, getDocumentProxy } from "unpdf";

export function sha256(bytes: Uint8Array): string {
  return createHash("sha256").update(bytes).digest("hex");
}

export type Extracted = { pages: string[]; pageCount: number; likelyScanned: boolean };

/** Extracts text page by page. Scanned (image-only) PDFs yield little or no text. */
export async function extractPdf(bytes: Uint8Array): Promise<Extracted> {
  const pdf = await getDocumentProxy(new Uint8Array(bytes));
  const { totalPages, text } = await extractText(pdf, { mergePages: false });
  const pages = (Array.isArray(text) ? text : [text]).map((t) => t.replace(/ /g, " ").replace(/[ \t]+\n/g, "\n"));
  const chars = pages.reduce((s, p) => s + p.replace(/\s/g, "").length, 0);
  return { pages, pageCount: totalPages, likelyScanned: totalPages > 0 && chars / totalPages < 80 };
}
