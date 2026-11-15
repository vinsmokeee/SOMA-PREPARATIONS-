import Image from "next/image";
import Link from "next/link";
import { siteConfig } from "@/config/site";
import { cn } from "@/lib/utils";

/**
 * Renders Soma's official logo once supplied (siteConfig.logo.src).
 * Until then it renders a plain typographic wordmark — a placeholder,
 * not a logo design.
 */
export function Logo({ className, href = "/" }: { className?: string; href?: string }) {
  const { logo } = siteConfig;
  return (
    <Link href={href} className={cn("inline-flex items-center", className)} aria-label={`${siteConfig.name} — home`}>
      {logo.src ? (
        <Image src={logo.src} alt={logo.alt} width={logo.width} height={logo.height} priority className="h-9 w-auto" />
      ) : (
        <span className="font-serif text-[1.3rem] font-semibold tracking-tight text-ink">
          Soma <span className="font-normal text-muted-foreground">Preparations</span>
        </span>
      )}
    </Link>
  );
}
