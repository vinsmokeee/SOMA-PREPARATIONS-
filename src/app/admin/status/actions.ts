"use server";

import { z } from "zod";
import type { ActionState } from "@/components/app/action-form";
import { assertPermission, AuthorizationError } from "@/lib/auth/dal";
import { getAiProvider } from "@/lib/ai";

/** Sends one tiny request to the AI provider (costs well under one US cent). */
export async function testAiAction(_prev: ActionState): Promise<ActionState> {
  void _prev;
  try { await assertPermission("ai.run"); } catch (e) { return { status: "error", message: e instanceof AuthorizationError ? e.message : "Not allowed." }; }
  const ai = getAiProvider("claude-haiku-5-5");
  if (!ai) return { status: "error", message: "ANTHROPIC_API_KEY is not set in Vercel (or the site was not redeployed after adding it)." };
  const started = Date.now();
  const r = await ai.generateStructured({
    system: "You are a connectivity check.", prompt: "Reply with ok set to true.",
    schema: z.object({ ok: z.boolean() }), maxTokens: 200, effort: "low",
  });
  if (!r.ok) return { status: "error", message: `AI connection failed: ${r.message}` };
  return { status: "success", message: `AI is working (${r.model}, answered in ${((Date.now() - started) / 1000).toFixed(1)} s).` };
}
