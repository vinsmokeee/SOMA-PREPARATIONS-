/**
 * Verification and publishing rules for current-affairs stories (pure).
 * Founder decision (M7): publish automatically when these rules pass;
 * everything else is held for review.
 */

export type Verification = "official" | "corroborated" | "single_source" | "developing" | "conflicting" | "opinion";
export type Tier = "official" | "established" | "other";

export type StoryEvidence = {
  articles: { source: string; tier: Tier; kind: "fact" | "opinion" | "analysis"; developing: boolean; sensitive: boolean }[];
  noteConfidence: "high" | "medium" | "low" | null;
  conflicts: boolean;
  text: string; // title + summary, for sensitive-term checks
};

export type CaConfig = {
  enabled?: boolean;
  auto_publish?: boolean;
  allow_single_source?: boolean;
  sensitive_terms?: string[];
  per_day?: { bhutan?: number; regional?: number; world?: number };
  min_relevance?: number;
  daily_budget_usd?: number;
  triage_model?: string;
  write_model?: string;
  questions_per_item?: number;
};

export function verificationOf(e: StoryEvidence): Verification {
  const facts = e.articles.filter((a) => a.kind === "fact");
  if (e.articles.length && facts.length === 0) return "opinion";
  if (e.conflicts) return "conflicting";
  if (facts.some((a) => a.tier === "official")) return "official";
  const outlets = new Set(facts.filter((a) => a.tier !== "other").map((a) => a.source));
  const developing = facts.filter((a) => a.developing).length > facts.length / 2;
  if (developing) return "developing";
  if (outlets.size >= 2) return "corroborated";
  return "single_source";
}

export function sensitiveMatch(text: string, terms: string[] = []): string | null {
  const t = text.toLowerCase();
  return terms.find((term) => term.trim() && t.includes(term.toLowerCase().trim())) ?? null;
}

export type PublishDecision = { verification: Verification; publish: boolean; holdReason: string | null; sensitive: boolean };

export function publishDecision(e: StoryEvidence, cfg: CaConfig): PublishDecision {
  const verification = verificationOf(e);
  const term = sensitiveMatch(e.text, cfg.sensitive_terms);
  const sensitive = Boolean(term) || e.articles.some((a) => a.sensitive);
  const hold = (holdReason: string): PublishDecision => ({ verification, publish: false, holdReason, sensitive });

  if (cfg.auto_publish === false) return hold("Automatic publishing is switched off.");
  if (sensitive) return hold(term ? `Sensitive topic (“${term}”).` : "Marked as sensitive by the AI check.");
  if (verification === "opinion") return hold("Opinion or analysis, not a factual report.");
  if (verification === "conflicting") return hold("Sources disagree.");
  if (verification === "developing") return hold("Developing story — not yet confirmed.");
  if (verification === "single_source" && !cfg.allow_single_source) return hold("Reported by only one source so far.");
  if (e.noteConfidence !== "high") return hold(`AI confidence is ${e.noteConfidence ?? "unknown"}.`);
  return { verification, publish: true, holdReason: null, sensitive };
}

/** Bhutan Standard Time (UTC+6) calendar date for a moment. */
export function bhutanDate(d: Date = new Date()): string {
  return new Date(d.getTime() + 6 * 3600 * 1000).toISOString().slice(0, 10);
}
