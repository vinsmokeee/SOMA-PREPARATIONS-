import type { ReactNode } from "react";
import Link from "next/link";
import { Bell } from "lucide-react";
import { Logo } from "@/components/brand/logo";
import { AppNav, type NavSection } from "./app-nav";
import { BackButton } from "./back-button";
import { BottomNav } from "./bottom-nav";
import { MobileAppNav } from "./mobile-app-nav";

export function AppShell({
  sections,
  user,
  area,
  children,
  stage = "PE",
  unread = 0,
}: {
  sections: NavSection[];
  user: { name: string; email: string | null; roleLabel: string };
  area: "student" | "admin";
  children: ReactNode;
  /** Student area: exam for the bottom tabs, and unread notifications for the bell. */
  stage?: "PE" | "ME";
  unread?: number;
}) {
  return (
    <div data-exam={area === "student" ? stage : undefined} className="flex min-h-full flex-1 flex-col lg:flex-row">
      <aside className="hidden w-64 shrink-0 flex-col border-r border-border bg-muted/50 lg:flex">
        <div className="flex h-16 items-center border-b border-border px-5">
          <Logo href={area === "admin" ? "/admin" : "/dashboard"} />
        </div>
        <div className="flex-1 overflow-y-auto px-3 py-4">
          <AppNav sections={sections} />
        </div>
        <UserBlock user={user} />
      </aside>
      <div className="flex min-w-0 flex-1 flex-col">
        {area === "student" ? (
          <header className="sticky top-0 z-30 grid h-16 grid-cols-[2.5rem_1fr_2.5rem] items-center gap-2 border-b border-border bg-background/95 px-4 backdrop-blur lg:hidden">
            <MobileAppNav sections={sections} user={user} avatar />
            <Logo href="/dashboard" className="justify-self-center" />
            <Link href="/dashboard/notifications" className="relative inline-flex size-10 items-center justify-center rounded-full hover:bg-muted" aria-label={`Notifications${unread ? `: ${unread} new` : ""}`}>
              <Bell className="size-5 text-ink" aria-hidden />
              {unread ? <span className="absolute right-0.5 top-0.5 flex min-w-5 items-center justify-center rounded-full bg-primary px-1 text-[11px] font-bold text-white">{unread > 9 ? "9+" : unread}</span> : null}
            </Link>
          </header>
        ) : (
          <header className="sticky top-0 z-30 flex h-16 items-center justify-between border-b border-border bg-background/95 px-4 backdrop-blur lg:hidden">
            <Logo href="/admin" />
            <MobileAppNav sections={sections} user={user} />
          </header>
        )}
        {area === "admin" ? (
          <div className="border-b border-border bg-ink px-4 py-1.5 text-center text-xs font-medium text-white/85 lg:px-8 lg:text-left">
            Administration · changes here affect the live platform and are recorded in the audit log
          </div>
        ) : null}
        <main id="main" className={area === "student" ? "flex-1 px-4 pb-28 pt-5 sm:px-6 lg:px-10 lg:py-10" : "flex-1 px-4 py-6 sm:px-6 lg:px-10 lg:py-10"}>
          <div className="mx-auto w-full max-w-6xl">{area === "student" ? <BackButton /> : null}{children}</div>
        </main>
      </div>
      {area === "student" ? <BottomNav stage={stage} /> : null}
    </div>
  );
}

export function UserBlock({ user }: { user: { name: string; email: string | null; roleLabel: string } }) {
  return (
    <div className="border-t border-border p-4">
      <p className="truncate text-sm font-semibold text-ink">{user.name || "Your account"}</p>
      {user.email ? <p className="truncate text-xs text-muted-foreground">{user.email}</p> : null}
      <p className="mt-0.5 text-xs text-primary">{user.roleLabel}</p>
      <form action="/auth/signout" method="post" className="mt-3">
        <button type="submit" className="text-sm font-medium text-muted-foreground hover:text-ink">Sign out</button>
      </form>
    </div>
  );
}

export function PageTitle({ title, description, actions }: { title: string; description?: ReactNode; actions?: ReactNode }) {
  return (
    <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
      <div>
        <h1 className="font-serif text-2xl font-semibold tracking-tight sm:text-3xl">{title}</h1>
        {description ? <div className="mt-1.5 max-w-2xl text-[15px] leading-relaxed text-muted-foreground">{description}</div> : null}
      </div>
      {actions ? <div className="flex shrink-0 gap-2">{actions}</div> : null}
    </div>
  );
}
