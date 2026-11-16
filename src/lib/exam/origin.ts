/** Student-facing label for where a question comes from. */
export function originLabel(origin: string | null | undefined, sourceYear?: number | null): string | null {
  switch (origin) {
    case "historical_official": return sourceYear ? `From the RCSC ${sourceYear} examination paper` : "From a past RCSC examination paper";
    case "ai_variation": return "AI-generated practice question based on another question, reviewed by Soma";
    case "ai_generated": return "AI-generated practice question, reviewed by Soma";
    case "current_affairs": return "Current-affairs practice question";
    case "original": return "Soma practice question";
    default: return null;
  }
}
