import "server-only";
import { AnthropicProvider } from "./anthropic";
import type { AiProvider } from "./provider";

/** Returns the configured AI provider (optionally for a specific model), or null when no provider key is set. */
export function getAiProvider(model?: string): AiProvider | null {
  const provider = (process.env.AI_PROVIDER || "anthropic").toLowerCase();
  if (provider === "anthropic") {
    if (!process.env.ANTHROPIC_API_KEY) return null;
    return new AnthropicProvider(model || undefined);
  }
  return null;
}

/** Approximate list prices (US$ per million tokens) for cost estimates and budget caps. */
export const MODEL_PRICES: Record<string, { input: number; output: number }> = {
  "claude-opus-5-5": { input: 4, output: 20 },
  "claude-sonnet-5-5": { input: 2, output: 10 },
  "claude-haiku-5-5": { input: 0.1, output: 0.5 },
};
export function estimateCost(model: string, inputTokens: number, outputTokens: number): number {
  const p = MODEL_PRICES[model] ?? MODEL_PRICES["claude-opus-5-5"];
  return (inputTokens * p.input + outputTokens * p.output) / 1e6;
}

export type { AiProvider } from "./provider";
