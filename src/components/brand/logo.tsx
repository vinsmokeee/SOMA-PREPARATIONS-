import Image from "next/image";
import Link from "next/link";
import { siteConfig } from "@/config/site";
import { cn } from "@/lib/utils";

/** Soma's logo (the whole square image, never cropped) with the name beside it. */
export function Logo({ className, href = "/" }: { className?: string; href?: string }) {
  const { logo } = siteConfig;
  return (
    <Link href={href} className={cn("inline-flex items-center gap-2.5", className)} aria-label={`${siteConfig.name} — home`}>
      {logo.src ? (
        <Image src={logo.src} alt="" width={logo.width} height={logo.height} priority className="size-12 shrink-0 rounded-xl bg-white shadow-sm ring-1 ring-border" />
      ) : null}
      <span className="font-serif text-[1.3rem] font-semibold tracking-tight text-ink">
        Soma <span className="font-normal text-muted-foreground">Preparations</span>
      </span>
    </Link>
  );
}
