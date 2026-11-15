/** Permission keys. Must match public.permissions in the database. */
export const PERMISSIONS = [
  "admin.access",
  "users.manage",
  "roles.manage",
  "exam_config.manage",
  "syllabus.manage",
  "questions.create",
  "questions.review",
  "questions.publish",
  "exams.manage",
  "papers.manage",
  "imports.run",
  "packages.manage",
  "orders.manage",
  "payments.verify",
  "ca.manage",
  "resources.manage",
  "ai.run",
  "evaluations.assign",
  "evaluations.perform",
  "support.manage",
  "reports.view",
  "audit.read",
  "settings.manage",
] as const;

export type Permission = (typeof PERMISSIONS)[number];

export const ROLES = [
  "student",
  "super_admin",
  "admin",
  "content_reviewer",
  "question_developer",
  "researcher",
  "subject_specialist",
  "content_writer",
  "evaluator",
] as const;

export type AppRole = (typeof ROLES)[number];

export const ROLE_LABELS: Record<AppRole, string> = {
  student: "Student",
  super_admin: "Super Administrator",
  admin: "Administrator",
  content_reviewer: "Content reviewer",
  question_developer: "Question developer",
  researcher: "Researcher",
  subject_specialist: "Subject specialist",
  content_writer: "Content writer",
  evaluator: "Written-answer evaluator",
};

/** Roles that may be granted from the dashboard. super_admin is granted only via the bootstrap script. */
export const GRANTABLE_ROLES: AppRole[] = [
  "admin",
  "content_reviewer",
  "question_developer",
  "researcher",
  "subject_specialist",
  "content_writer",
  "evaluator",
];

export function isAppRole(value: unknown): value is AppRole {
  return typeof value === "string" && (ROLES as readonly string[]).includes(value);
}
