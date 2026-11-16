/** Feature keys a package can include (stored in packages.feature_keys). */
export const PACKAGE_FEATURES = {
  pe_practice: "PE practice and question bank",
  me_practice: "ME written practice",
  mock_exams: "Full mock examinations",
  past_papers: "Past BCSE papers",
  ca_archive: "Current-affairs archive, challenges and assessments",
  ai_evaluation: "AI evaluation of written answers",
  analytics: "Performance analytics",
} as const;
export type PackageFeature = keyof typeof PACKAGE_FEATURES;
