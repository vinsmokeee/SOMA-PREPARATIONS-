export const STATUS_LABELS: Record<string, string> = {
  draft: "Draft",
  ai_generated: "AI generated",
  awaiting_review: "Awaiting review",
  revision_requested: "Revision requested",
  verified: "Verified",
  published: "Published",
  rejected: "Rejected",
  archived: "Archived",
};

export const STATUS_TONES: Record<string, "neutral" | "green" | "solid" | "warning" | "danger" | "outline"> = {
  draft: "neutral",
  ai_generated: "warning",
  awaiting_review: "warning",
  revision_requested: "danger",
  verified: "green",
  published: "solid",
  rejected: "danger",
  archived: "outline",
};
