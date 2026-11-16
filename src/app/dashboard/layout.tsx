import { AppShell } from "@/components/app/app-shell";
import type { NavSection } from "@/components/app/app-nav";
import { ROLE_LABELS } from "@/lib/auth/permissions";
import { requireUser } from "@/lib/auth/dal";

// Session-dependent area: render per request.
export const instant = false;

export default async function DashboardLayout({ children }: LayoutProps<"/dashboard">) {
  const user = await requireUser("/dashboard");
  const sections: NavSection[] = [
    { items: [{ href: "/dashboard", label: "Overview", exact: true }, { href: "/dashboard/training", label: "Today's training" }] },
    {
      title: "Prepare",
      items: [
        { href: "/dashboard/practice", label: "Practice" },
        { href: "/dashboard/exams", label: "Examinations" },
        { href: "/dashboard/written", label: "Written answers" },
        { href: "/dashboard/current-affairs", label: "Current affairs" },
        { href: "/dashboard/history", label: "Examination history" },
        { href: "/dashboard/papers", label: "Past papers" },
        { href: "/dashboard/analytics", label: "Performance" },
      ],
    },
    {
      title: "Account",
      items: [
        { href: "/dashboard?choose=1", label: "Change exam (PE / ME)" },
        { href: "/dashboard/subscription", label: "My subscription" },
        { href: "/dashboard/notifications", label: "Notifications" },
        { href: "/dashboard/profile", label: "Profile" },
        { href: "/dashboard/security", label: "Security" },
        ...(user.isStaff ? [{ href: "/admin", label: "Administration" }] : []),
      ],
    },
  ];
  const primaryRole = user.roles.find((r) => r !== "student") ?? "student";
  return (
    <AppShell area="student" sections={sections} user={{ name: user.fullName, email: user.email, roleLabel: ROLE_LABELS[primaryRole] }}>
      {children}
    </AppShell>
  );
}
