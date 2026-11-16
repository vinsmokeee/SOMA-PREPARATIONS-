"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Home, Newspaper } from "lucide-react";
import { cn } from "@/lib/utils";

const TABS = [
  { href: "/dashboard", label: "Home", icon: Home, exact: true },
  { href: "/dashboard/current-affairs", label: "News", icon: Newspaper },
];

/** Phone navigation for students: Home and News. */
export function BottomNav() {
  const path = usePathname();
  const home = (h: string) => h === "/dashboard" && (path === "/dashboard" || path === "/dashboard/pe" || path === "/dashboard/me");
  return (
    <nav aria-label="Main" className="fixed inset-x-0 bottom-0 z-30 border-t border-border bg-white/95 pb-[env(safe-area-inset-bottom)] backdrop-blur lg:hidden">
      <ul className="mx-auto grid max-w-xs grid-cols-2">
        {TABS.map((t) => {
          const active = t.exact ? home(t.href) : path.startsWith(t.href);
          return (
            <li key={t.href}>
              <Link href={t.href} aria-current={active ? "page" : undefined}
                className={cn("flex flex-col items-center gap-0.5 py-2 text-[11px] font-semibold", active ? "text-primary" : "text-muted-foreground")}>
                <span className={cn("flex h-8 w-14 items-center justify-center rounded-full", active && "bg-primary-soft")}>
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
