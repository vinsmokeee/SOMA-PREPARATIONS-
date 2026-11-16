import { AppShell } from "@/components/app/app-shell";
import type { NavItem, NavSection } from "@/components/app/app-nav";
import { can, requirePermission } from "@/lib/auth/dal";
import { ROLE_LABELS, type Permission } from "@/lib/auth/permissions";

export const instant = false;

export default async function AdminLayout({ children }: LayoutProps<"/admin">) {
  const user = await requirePermission("admin.access", "/admin");

  const item = (href: string, label: string, permission: Permission, exact = false): NavItem[] =>
    can(user, permission) ? [{ href, label, exact }] : [];

  const sections: NavSection[] = [
    { items: [{ href: "/admin", label: "Overview", exact: true }, { href: "/admin/status", label: "Setup status" }] },
    {
      title: "Examinations",
      items: [
        ...item("/admin/exam-structure", "Examination structure", "exam_config.manage"),
        ...item("/admin/syllabus", "Subjects & topics", "syllabus.manage"),
        ...item("/admin/exams", "Examinations", "exams.manage"),
      ],
    },
    {
      title: "Content",
      items: [
        ...item("/admin/questions", "Question bank", "questions.create").concat(can(user, "questions.create") ? [] : item("/admin/questions", "Question bank", "questions.review")),
        ...item("/admin/imports", "Imports", "imports.run"),
        ...item("/admin/papers", "Historical papers", "papers.manage"),
        ...item("/admin/permissions", "Permissions", "papers.manage"),
        ...item("/admin/evaluations", "Written-answer evaluation", "evaluations.assign"),
        ...item("/admin/ai", "AI question drafts", "ai.run"),
        ...item("/admin/current-affairs", "Current affairs", "ca.manage"),
      ],
    },
    {
      title: "Business",
      items: [
        ...item("/admin/packages", "Packages & pricing", "packages.manage"),
        ...item("/admin/commerce", "Orders & payments", "payments.verify"),
        ...item("/admin/users", "Users & roles", "users.manage"),
        ...item("/admin/security", "Account security", "users.manage"),
        ...item("/admin/messages", "Support messages", "support.manage"),
        ...item("/admin/audit", "Audit log", "audit.read"),
      ],
    },
    { items: [{ href: "/dashboard", label: "Student view" }] },
  ];
  const primaryRole = user.isSuperAdmin ? "super_admin" : (user.roles.find((r) => r !== "student") ?? "student");
  return (
    <AppShell area="admin" sections={sections} user={{ name: user.fullName, email: user.email, roleLabel: ROLE_LABELS[primaryRole] }}>
      {children}
    </AppShell>
  );
}
