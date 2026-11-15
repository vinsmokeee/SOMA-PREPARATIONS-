// Manual smoke test: npx tsx scripts/ai-smoke.ts  (needs ANTHROPIC_API_KEY)
import { AnthropicProvider } from "../src/lib/ai/anthropic";
import { buildGenerationPrompt, checkMcqDraft, mcqDraftSchema, SYSTEM_PROMPT } from "../src/lib/ai/question-drafts";

const p = new AnthropicProvider();
const prompt = buildGenerationPrompt({ stage: "PE", kind: "mcq", subject: { name: "Data interpretation ability", description: null, isOfficial: true }, topic: "Percentages", difficulty: "mixed", count: 3, marks: 1, styleExamples: [], existingStems: [] });
const t = Date.now();
const r = await p.generateStructured({ system: SYSTEM_PROMPT, prompt, schema: mcqDraftSchema, maxTokens: 8000, effort: "medium" });
console.log(JSON.stringify(r, null, 2).slice(0, 5000));
if (r.ok) console.log(r.data.questions.map(checkMcqDraft), `${Math.round((Date.now() - t) / 1000)}s`);
