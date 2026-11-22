"use client";

import { useRouter } from "next/navigation";
import { useEffect, useRef, useSyncExternalStore } from "react";

/** Today's date in Bhutan, e.g. "Monday 23 November". Plans renew at midnight Bhutan time. */
const bhutanDay = () => new Intl.DateTimeFormat("en-GB", { timeZone: "Asia/Thimphu", weekday: "long", day: "numeric", month: "long" }).format(new Date());

function subscribe(onChange: () => void) {
  const timer = window.setInterval(onChange, 60_000);
  document.addEventListener("visibilitychange", onChange);
  window.addEventListener("focus", onChange);
  return () => { window.clearInterval(timer); document.removeEventListener("visibilitychange", onChange); window.removeEventListener("focus", onChange); };
}

/**
 * Shows which day Today's plan is for, and fetches the new plan when the day changes while Soma is open
 * (or when the student comes back to it the next day). Founder, 23 Nov 2026.
 */
export function PlanDay() {
  const router = useRouter();
  const day = useSyncExternalStore(subscribe, bhutanDay, () => null);
  const first = useRef<string | null>(null);
  useEffect(() => {
    if (!day) return;
    if (first.current === null) { first.current = day; return; }
    if (day !== first.current) { first.current = day; router.refresh(); }
  }, [day, router]);
  return <span className="block text-sm font-normal text-muted-foreground" data-testid="plan-day">{day ?? " "}</span>;
}
