/**
 * Whether a written answer may be uploaded as handwritten pages (founder, 22 Nov 2026).
 * Mirrors the database function public.upload_allowed, which is what the server enforces.
 * ME: English answers are typed only; Dzongkha answers (and translation into Dzongkha) may be uploaded;
 * questions that ask to draw or show working keep the upload option. Other stages are unchanged.
 */
const DZONGKHA = /[ༀ-࿿]/;
const INTO_ENGLISH = /into\s+english/i;
const WORKING = /\b(draw|drawing|sketch|sketches|diagram|diagrams|calculate|calculation|calculations|compute|determine|derive|prove|solve|evaluate|design|find|show\s+that|graph|plot)\b/i;

export function uploadAllowed(stage: string, type: string, stem: string | null | undefined): boolean {
  if (stage !== "ME") return true;
  if (type === "mcq") return false;
  const s = stem ?? "";
  if (DZONGKHA.test(s) && !INTO_ENGLISH.test(s)) return true;
  return WORKING.test(s);
}
