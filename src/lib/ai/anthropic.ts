import "server-only";
import Anthropic from "@anthropic-ai/sdk";
import { betaZodOutputFormat } from "@anthropic-ai/sdk/helpers/beta/zod";
import type { z } from "zod";
import type { AiProvider, BatchResults, BatchSubmit, StructuredRequest, StructuredResult } from "./provider";

export const DEFAULT_ANTHROPIC_MODEL = "claude-opus-5-5";

/**
 * Claude via the official Anthropic SDK.
 *  - Structured outputs (Zod schema) so responses are machine-checkable.
 *  - Server-side refusal fallback ("default" routing) so a safety-classifier
 *    decline is retried on another Claude model instead of failing.
 *  - The API key is read from ANTHROPIC_API_KEY on the server only.
 */
export class AnthropicProvider implements AiProvider {
  readonly name = "anthropic";
  private client: Anthropic;

  constructor(readonly model: string = process.env.AI_MODEL || DEFAULT_ANTHROPIC_MODEL) {
    this.client = new Anthropic({ timeout: 5 * 60 * 1000, maxRetries: 2 });
  }

  async generateStructured<S extends z.ZodType>(req: StructuredRequest<S>): Promise<StructuredResult<z.infer<S>>> {
    try {
      const response = await this.client.beta.messages.parse({
        model: this.model,
        max_tokens: req.maxTokens ?? 16000,
        // Server-side refusal fallback is not offered for Haiku models.
        ...(this.model.includes("haiku") ? {} : { betas: ["server-side-fallback-2026-07-01"], fallbacks: "default" as const }),
        output_config: { effort: req.effort ?? "high", format: betaZodOutputFormat(req.schema) },
        system: req.system,
        messages: [{
          role: "user",
          content: [
            ...(req.images ?? []).map((img) => ({ type: "image" as const, source: { type: "base64" as const, media_type: img.mediaType, data: img.base64 } })),
            { type: "text" as const, text: req.prompt },
          ],
        }],
      });
      const usage = { model: response.model, inputTokens: response.usage.input_tokens, outputTokens: response.usage.output_tokens };
      if (response.stop_reason === "refusal") {
        return { ok: false, reason: "refused", message: "The AI model declined this request.", ...usage };
      }
      if (response.stop_reason === "max_tokens") {
        return { ok: false, reason: "truncated", message: "The AI response was cut off. Try fewer questions at a time.", ...usage };
      }
      const parsed = req.schema.safeParse(response.parsed_output);
      if (!parsed.success) {
        return { ok: false, reason: "invalid_output", message: "The AI response did not match the expected format.", ...usage };
      }
      const usedFallback = (response.usage.iterations ?? []).some((i: { type?: string }) => i.type === "fallback_message");
      return { ok: true, data: parsed.data, usedFallback, ...usage };
    } catch (e) {
      if (e instanceof Anthropic.AuthenticationError) return { ok: false, reason: "not_configured", message: "The AI provider rejected the API key." };
      if (e instanceof Anthropic.RateLimitError) return { ok: false, reason: "error", message: "The AI provider is busy (rate limited). Try again in a minute." };
      if (e instanceof Anthropic.APIError) return { ok: false, reason: "error", message: `AI provider error (${e.status ?? "network"}).` };
      // Keep a short reason so failures can be diagnosed from the AI jobs log.
      const why = e instanceof Error ? `${e.name}: ${e.message}`.slice(0, 160) : "unknown";
      return { ok: false, reason: "error", message: `The AI request failed (${why}).` };
    }
  }

  /**
   * Message Batches API: 50% of the normal price, results usually within an hour (at most 24 hours).
   * Server-side fallback is not requested here; a declined or failed item is re-run instantly by the caller.
   */
  async submitBatch<S extends z.ZodType>(items: { id: string; req: StructuredRequest<S> }[]): Promise<BatchSubmit> {
    try {
      const batch = await this.client.beta.messages.batches.create({
        requests: items.map(({ id, req }) => {
          const format = betaZodOutputFormat(req.schema);
          return {
            custom_id: id,
            params: {
              model: this.model,
              max_tokens: req.maxTokens ?? 16000,
              output_config: { effort: req.effort ?? "high", format: { type: "json_schema" as const, schema: format.schema } },
              system: req.system,
              messages: [{
                role: "user" as const,
                content: [
                  ...(req.images ?? []).map((img) => ({ type: "image" as const, source: { type: "base64" as const, media_type: img.mediaType, data: img.base64 } })),
                  { type: "text" as const, text: req.prompt },
                ],
              }],
            },
          };
        }),
      });
      return { ok: true, batchId: batch.id };
    } catch (e) {
      return { ok: false, message: e instanceof Error ? `${e.name}: ${e.message}`.slice(0, 200) : "batch request failed" };
    }
  }

  async batchResults<S extends z.ZodType>(batchId: string, schema: S): Promise<BatchResults<z.infer<S>>> {
    const batch = await this.client.beta.messages.batches.retrieve(batchId);
    if (batch.processing_status !== "ended") return null;
    const out = new Map<string, StructuredResult<z.infer<S>>>();
    for await (const item of await this.client.beta.messages.batches.results(batchId)) {
      const r = item.result;
      if (r.type !== "succeeded") {
        out.set(item.custom_id, { ok: false, reason: "error", message: `Batch item ${r.type}.` });
        continue;
      }
      const m = r.message;
      const usage = { model: m.model, inputTokens: m.usage.input_tokens, outputTokens: m.usage.output_tokens };
      if (m.stop_reason === "refusal") { out.set(item.custom_id, { ok: false, reason: "refused", message: "The AI model declined this request.", ...usage }); continue; }
      if (m.stop_reason === "max_tokens") { out.set(item.custom_id, { ok: false, reason: "truncated", message: "The AI response was cut off.", ...usage }); continue; }
      const text = m.content.map((b) => (b.type === "text" ? b.text : "")).join("");
      let parsed: ReturnType<S["safeParse"]> | null = null;
      try { parsed = schema.safeParse(JSON.parse(text)) as ReturnType<S["safeParse"]>; } catch { parsed = null; }
      if (!parsed || !parsed.success) { out.set(item.custom_id, { ok: false, reason: "invalid_output", message: "The AI response did not match the expected format.", ...usage }); continue; }
      out.set(item.custom_id, { ok: true, data: parsed.data as z.infer<S>, usedFallback: false, ...usage });
    }
    return out;
  }
}
