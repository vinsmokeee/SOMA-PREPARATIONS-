import type { z } from "zod";

/**
 * Provider-agnostic AI interface. Soma's features depend only on this, so the
 * underlying AI company can change without touching question generation or
 * analysis code. Implementations live in server-only modules and read their
 * API keys from server environment variables.
 */
export type StructuredRequest<S extends z.ZodType> = {
  system: string;
  prompt: string;
  schema: S;
  /** Upper bound on generated tokens. */
  maxTokens?: number;
  /** Relative thinking/effort level; providers map it to their own setting. */
  effort?: "low" | "medium" | "high";
  /** Images sent before the prompt (e.g. photographed answer sheets), in order. */
  images?: AiImage[];
};

export type AiImage = { mediaType: "image/jpeg" | "image/png" | "image/webp"; base64: string };

export type StructuredResult<T> =
  | { ok: true; data: T; model: string; inputTokens: number; outputTokens: number; usedFallback: boolean }
  | { ok: false; reason: "refused" | "invalid_output" | "truncated" | "error" | "not_configured"; message: string; model?: string; inputTokens?: number; outputTokens?: number };

/** Half-price batch processing (results within hours). Optional: providers without it are used instantly. */
export type BatchSubmit = { ok: true; batchId: string } | { ok: false; message: string };
/** null while the batch is still processing; otherwise one result per request id. */
export type BatchResults<T> = Map<string, StructuredResult<T>> | null;

export interface AiProvider {
  readonly name: string;
  readonly model: string;
  generateStructured<S extends z.ZodType>(req: StructuredRequest<S>): Promise<StructuredResult<z.infer<S>>>;
  submitBatch?<S extends z.ZodType>(items: { id: string; req: StructuredRequest<S> }[]): Promise<BatchSubmit>;
  batchResults?<S extends z.ZodType>(batchId: string, schema: S): Promise<BatchResults<z.infer<S>>>;
}
