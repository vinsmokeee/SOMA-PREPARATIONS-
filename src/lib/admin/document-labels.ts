export const DOC_TYPE_LABELS: Record<string, string> = {
  past_paper: "Past paper",
  answer_key: "Answer key",
  syllabus: "Syllabus",
  announcement: "Announcement",
  rules: "Rules",
  result: "Result",
  news: "News",
  other: "Other",
};

export const USAGE_LABELS: Record<string, { label: string; tone: "neutral" | "green" | "warning" | "danger" | "outline" }> = {
  unknown: { label: "Rights not assessed", tone: "warning" },
  research_only: { label: "Research only", tone: "neutral" },
  permission_requested: { label: "Permission requested", tone: "warning" },
  authorised: { label: "Reproduction authorised", tone: "green" },
  not_permitted: { label: "Not permitted", tone: "danger" },
};

export const JOB_LABELS: Record<string, { label: string; tone: "neutral" | "green" | "warning" | "danger" | "solid" }> = {
  queued: { label: "Queued", tone: "neutral" },
  fetching: { label: "Fetching", tone: "warning" },
  extracting: { label: "Extracting", tone: "warning" },
  classifying: { label: "Splitting questions", tone: "warning" },
  awaiting_review: { label: "Ready for review", tone: "solid" },
  completed: { label: "Completed", tone: "green" },
  duplicate_unchanged: { label: "Already imported", tone: "neutral" },
  failed: { label: "Failed", tone: "danger" },
  cancelled: { label: "Cancelled", tone: "neutral" },
};
