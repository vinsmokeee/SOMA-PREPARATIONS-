import Image from "next/image";
import Link from "next/link";
import { siteConfig } from "@/config/site";
import { cn } from "@/lib/utils";

/** SOMA Academy's logo (the whole square image, never cropped) with the name beside it. */
export function Logo({ className, href = "/" }: { className?: string; href?: string }) {
  const { logo } = siteConfig;
  return (
    <Link href={href} className={cn("inline-flex items-center gap-2.5", className)} aria-label={`${siteConfig.name} — home`}>
      {logo.src ? (
        <Image src={logo.src} alt="" width={logo.width} height={logo.height} priority className="size-12 shrink-0" />
      ) : null}
      <span className="font-serif text-[1.3rem] font-semibold tracking-tight text-ink">
        SOMA <span className="font-normal text-muted-foreground">Academy</span>
      </span>
    </Link>
  );
}
