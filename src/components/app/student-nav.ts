import type { NavSection } from "./app-nav";

/** The student menu (left side on computers; behind the round profile button on phones). */
export function studentNav(isStaff: boolean): NavSection[] {
  return [
    {
      items: [
        { href: "/dashboard", label: "Home", exact: true },
        { href: "/dashboard/training", label: "Today's plan & badges" },
      ],
    },
    {
      title: "Prepare",
      items: [
        { href: "/dashboard/practice", label: "Practice" },
        { href: "/dashboard/exams", label: "Mock tests & papers" },
        { href: "/dashboard/written", label: "Written answers" },
        { href: "/dashboard/current-affairs", label: "Current affairs" },
        { href: "/dashboard/papers", label: "Past papers" },
      ],
    },
    {
      title: "My progress",
      items: [
        { href: "/dashboard/analytics", label: "My scores" },
        { href: "/dashboard/history", label: "Exam history" },
      ],
    },
    {
      title: "My account",
      items: [
        { href: "/dashboard/profile", label: "My profile" },
        { href: "/dashboard/subscription", label: "My subscription" },
        { href: "/dashboard?choose=1", label: "Change exam (PE / ME)" },
        { href: "/dashboard/notifications", label: "Notifications" },
        { href: "/dashboard/security", label: "Security" },
        ...(isStaff ? [{ href: "/admin", label: "Administration" }] : []),
      ],
    },
  ];
}
