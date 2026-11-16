export const AREA_LABELS: Record<string, string> = { bhutan: "Bhutan", regional: "Regional", world: "World" };

export const VERIFICATION_LABELS: Record<string, { label: string; tone: "green" | "neutral" | "warning" | "danger"; help: string }> = {
  official: { label: "Official source", tone: "green", help: "Reported by an official government or international-organisation source." },
  corroborated: { label: "Confirmed by 2+ sources", tone: "green", help: "Reported independently by at least two reliable outlets." },
  single_source: { label: "Single source", tone: "neutral", help: "Reported by one reliable outlet so far." },
  developing: { label: "Developing", tone: "warning", help: "Details are still emerging." },
  conflicting: { label: "Sources disagree", tone: "danger", help: "Reliable sources report different facts." },
  opinion: { label: "Opinion / analysis", tone: "neutral", help: "Commentary rather than a factual report." },
};
