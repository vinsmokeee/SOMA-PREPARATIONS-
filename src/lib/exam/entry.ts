/** Shared wording for examination entries (pathways) shown to students and staff. */
export const PUBLIC_GROUP_LABELS: Record<string, string> = {
  general: "General Graduates",
  technical: "Technical Graduates",
  dzongkha: "Dzongkha Graduates",
  bed: "B.Ed Graduates",
};

export const PARAMS_SOURCE_OPTIONS = [
  { value: "", label: "Not set" },
  { value: "official", label: "Official (stated in an RCSC document)" },
  { value: "founder_brief", label: "From the founder's brief (unconfirmed)" },
  { value: "admin", label: "Set by admin (unconfirmed)" },
];

/** Shown wherever the ME is described or sold. */
export const ME_RESULT_NOTE =
  "SOMA Academy trains you for the written examination of the ME. Your academic marks and the viva/interview may also count toward the final selection result.";

export type CutoffRow = { year: number; value: number; unit: "percent" | "marks" };

/** "2026: 55%, 2025: 55 marks" — newest first. Reference information, never a rule. */
export function formatCutoffs(rows: CutoffRow[]): string {
  return [...rows]
    .sort((a, b) => b.year - a.year)
    .map((r) => `${r.year}: ${Number(r.value)}${r.unit === "percent" ? "%" : " marks"}`)
    .join(" · ");
}
