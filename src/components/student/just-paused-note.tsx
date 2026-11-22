"use client";

import { useEffect, useState } from "react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { HonestyNote } from "@/components/exam/pause-button";

/** "Please don't cheat" after pausing (founder, 22-23 Nov 2026): shown on Paused exam for a few seconds, then it
 *  goes away by itself (or on tap). The ?paused=1 flag is removed so a reload does not show it again. */
export function JustPausedNote() {
  const router = useRouter();
  const pathname = usePathname();
  const params = useSearchParams();
  const [open, setOpen] = useState(true);
  useEffect(() => {
    const id = setTimeout(() => setOpen(false), 6000);
    return () => clearTimeout(id);
  }, []);
  useEffect(() => {
    if (open) return;
    const next = new URLSearchParams(params.toString());
    next.delete("paused");
    router.replace(next.size ? `${pathname}?${next}` : pathname, { scroll: false });
  }, [open, params, pathname, router]);
  return open ? <HonestyNote onClose={() => setOpen(false)} /> : null;
}
