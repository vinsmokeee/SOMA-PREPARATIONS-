"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";

export type NavItem = { href: string; label: string; exact?: boolean; milestone?: string };
export type NavSection = { title?: string; items: NavItem[] };

export function AppNav({ sections, onNavigate }: { sections: NavSection[]; onNavigate?: () => void }) {
  const pathname = usePathname();
  return (
    <nav aria-label="Dashboard" className="space-y-6">
      {sections.map((section, i) => (
        <div key={section.title ?? i}>
          {section.title ? (
            <p className="px-3 pb-1.5 text-[11px] font-semibold uppercase tracking-[0.12em] text-subtle">{section.title}</p>
          ) : null}
          <ul className="space-y-0.5">
            {section.items.map((item) => {
              if (item.milestone) {
                return (
                  <li key={item.href}>
                    <span className="flex items-center justify-between rounded-md px-3 py-2 text-sm text-subtle" title="Planned for a later milestone">
                      {item.label}
                      <span className="rounded bg-muted px-1.5 py-0.5 text-[10px] font-semibold text-muted-foreground">{item.milestone}</span>
                    </span>
                  </li>
                );
              }
              const active = item.exact ? pathname === item.href : pathname === item.href || pathname.startsWith(`${item.href}/`);
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onNavigate}
                    aria-current={active ? "page" : undefined}
                    className={cn(
                      "block rounded-md px-3 py-2 text-sm font-medium transition-colors",
                      active ? "bg-primary-soft text-primary" : "text-foreground/80 hover:bg-muted hover:text-ink",
                    )}
                  >
                    {item.label}
                  </Link>
                </li>
              );
            })}
          </ul>
        </div>
      ))}
    </nav>
  );
}
