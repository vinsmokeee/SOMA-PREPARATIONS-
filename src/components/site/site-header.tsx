import Link from "next/link";
import { mainNav } from "@/config/site";
import { Logo } from "@/components/brand/logo";
import { Container } from "@/components/ui/container";
import { AccountLink } from "./account-link";
import { MobileNav } from "./mobile-nav";

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-30 border-b border-border bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/85">
      <Container className="flex h-16 items-center justify-between gap-6">
        <Logo />
        <nav className="hidden items-center gap-1 lg:flex" aria-label="Main">
          {mainNav.map((item) => (
            <Link key={item.href} href={item.href} className="rounded-md px-3 py-2 text-sm font-medium text-foreground/80 hover:bg-muted hover:text-ink">
              {item.label}
            </Link>
          ))}
        </nav>
        <div className="hidden lg:block">
          <AccountLink />
        </div>
        <MobileNav />
      </Container>
    </header>
  );
}
