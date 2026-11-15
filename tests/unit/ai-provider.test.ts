import { beforeEach, describe, expect, it, vi } from "vitest";
import { z } from "zod";

const parse = vi.fn();
let failWith: Error | null = null;
vi.mock("@anthropic-ai/sdk", async (orig) => {
  const real = await orig<typeof import("@anthropic-ai/sdk")>();
  class Fake { beta = { messages: { parse: (...a: unknown[]) => { if (failWith) return Promise.reject(failWith); return parse(...a); } } }; static AuthenticationError = real.AuthenticationError; static RateLimitError = real.RateLimitError; static APIError = real.APIError; }
  return { default: Fake };
});

const { AnthropicProvider } = await import("@/lib/ai/anthropic");
const schema = z.object({ answer: z.string() });
const base = { model: "claude-opus-5-5", usage: { input_tokens: 100, output_tokens: 50 } };
const req = { system: "s", prompt: "p", schema };

describe("AnthropicProvider", () => {
  beforeEach(() => { parse.mockReset(); failWith = null; });

  it("returns validated data and sends structured-output + fallback options", async () => {
    parse.mockResolvedValue({ ...base, stop_reason: "end_turn", parsed_output: { answer: "ok" } });
    const r = await new AnthropicProvider().generateStructured(req);
    expect(r).toMatchObject({ ok: true, data: { answer: "ok" }, inputTokens: 100, usedFallback: false });
    const args = parse.mock.calls[0][0];
    expect(args.model).toBe("claude-opus-5-5");
    expect(args.fallbacks).toBe("default");
    expect(args.output_config.format).toBeTruthy();
  });
  it("reports refusals, truncation and invalid output", async () => {
    parse.mockResolvedValueOnce({ ...base, stop_reason: "refusal", parsed_output: null });
    expect((await new AnthropicProvider().generateStructured(req)).ok).toBe(false);
    parse.mockResolvedValueOnce({ ...base, stop_reason: "max_tokens", parsed_output: null });
    expect(await new AnthropicProvider().generateStructured(req)).toMatchObject({ ok: false, reason: "truncated" });
    parse.mockResolvedValueOnce({ ...base, stop_reason: "end_turn", parsed_output: { wrong: 1 } });
    expect(await new AnthropicProvider().generateStructured(req)).toMatchObject({ ok: false, reason: "invalid_output" });
  });
  it("detects a server-side fallback", async () => {
    parse.mockResolvedValue({ ...base, model: "claude-other", usage: { ...base.usage, iterations: [{ type: "message" }, { type: "fallback_message" }] }, stop_reason: "end_turn", parsed_output: { answer: "x" } });
    expect(await new AnthropicProvider().generateStructured(req)).toMatchObject({ ok: true, usedFallback: true, model: "claude-other" });
  });
  it("never throws on network errors", async () => {
    failWith = new TypeError("fetch failed");
    expect(await new AnthropicProvider().generateStructured(req)).toMatchObject({ ok: false, reason: "error" });
  });
});
