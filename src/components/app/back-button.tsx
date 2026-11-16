"use client";

import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { ChevronLeft } from "lucide-react";

/** "Back": one step back in the student's own clicks (home if there is nowhere to go back to). */
export function BackButton() {
  const router = useRouter();
  const path = usePathname();
  const query = useSearchParams().toString();
  if (path === "/dashboard") return null;
  // From an exam's home, "back" is the PE / ME choice (not the login page).
  const examHome = (path === "/dashboard/pe" || path === "/dashboard/me") && !query;
  return (
    <button
      type="button"
      onClick={() => (examHome ? router.push("/dashboard?choose=1") : window.history.length > 1 ? router.back() : router.push("/dashboard"))}
      className="mb-4 inline-flex h-10 items-center gap-1 rounded-full bg-white pl-2 pr-4 text-sm font-bold text-ink shadow-sm ring-1 ring-border active:scale-[0.97]"
    >
      <ChevronLeft className="size-5 text-primary" aria-hidden /> Back
    </button>
  );
}
