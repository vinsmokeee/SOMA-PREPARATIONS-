import Link from "next/link";
import { Logo } from "@/components/brand/logo";
import { siteConfig } from "@/config/site";

export default function AuthLayout({ children }: LayoutProps<"/">) {
  return (
    <div className="flex min-h-full flex-1 flex-col bg-muted/60">
      <header className="flex h-16 items-center justify-between px-4 sm:px-8">
        <Logo />
        <Link href="/" className="text-sm font-medium text-muted-foreground hover:text-ink">Back to site</Link>
      </header>
      <main id="main" className="flex flex-1 items-start justify-center px-4 pb-16 pt-6 sm:items-center sm:pt-0">
        <div className="w-full max-w-md">{children}</div>
      </main>
      <footer className="pb-6 text-center text-xs text-muted-foreground">{siteConfig.tagline}</footer>
    </div>
  );
}
