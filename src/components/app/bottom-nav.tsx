"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { BookOpenCheck, ClipboardCheck, Home, Newspaper, UserRound } from "lucide-react";
import { cn } from "@/lib/utils";

const TABS = [
  { href: "/dashboard", label: "Home", icon: Home, exact: true },
  { href: "/dashboard/practice", label: "Practice", icon: BookOpenCheck },
  { href: "/dashboard/exams", label: "Exams", icon: ClipboardCheck },
  { href: "/dashboard/current-affairs", label: "News", icon: Newspaper },
  { href: "/dashboard/profile", label: "Me", icon: UserRound },
];

/** Phone navigation for students: five big tabs at the bottom of the screen. */
export function BottomNav() {
  const path = usePathname();
  return (
    <nav aria-label="Main" className="fixed inset-x-0 bottom-0 z-30 border-t border-border bg-white/95 pb-[env(safe-area-inset-bottom)] backdrop-blur lg:hidden">
      <ul className="mx-auto grid max-w-lg grid-cols-5">
        {TABS.map((t) => {
          const active = t.exact ? path === t.href : path.startsWith(t.href);
          return (
            <li key={t.href}>
              <Link href={t.href} aria-current={active ? "page" : undefined}
                className={cn("flex flex-col items-center gap-0.5 py-2 text-[11px] font-semibold", active ? "text-primary" : "text-muted-foreground")}>
                <span className={cn("flex h-8 w-12 items-center justify-center rounded-full", active && "bg-primary-soft")}>
                  <t.icon className="size-5" aria-hidden />
                </span>
                {t.label}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
