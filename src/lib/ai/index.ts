import "server-only";
import { AnthropicProvider } from "./anthropic";
import type { AiProvider } from "./provider";

/** Returns the configured AI provider, or null when no provider key is set. */
export function getAiProvider(): AiProvider | null {
  const provider = (process.env.AI_PROVIDER || "anthropic").toLowerCase();
  if (provider === "anthropic") {
    if (!process.env.ANTHROPIC_API_KEY) return null;
    return new AnthropicProvider();
  }
  return null;
}

export type { AiProvider } from "./provider";
