"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { getBrowserClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";

/**
 * Header account controls. Runs on the client so public pages stay fully
 * static; it only reflects session state and grants no access by itself.
 */
export function AccountLink({ onNavigate, stacked = false }: { onNavigate?: () => void; stacked?: boolean }) {
  // Without a configured auth service the visitor is always signed out.
  const [signedIn, setSignedIn] = useState<boolean | null>(() => (getBrowserClient() ? null : false));

  useEffect(() => {
    const supabase = getBrowserClient();
    if (!supabase) return;
    supabase.auth.getSession().then(({ data }) => setSignedIn(Boolean(data.session)));
    const { data: sub } = supabase.auth.onAuthStateChange((_event, session) => setSignedIn(Boolean(session)));
    return () => sub.subscription.unsubscribe();
  }, []);

  const wrap = stacked ? "flex flex-col gap-2" : "flex items-center gap-2";

  if (signedIn) {
    return (
      <div className={wrap}>
        <Button asChild size="sm" className={stacked ? "h-11" : undefined}>
          <Link href="/dashboard" onClick={onNavigate}>My dashboard</Link>
        </Button>
      </div>
    );
  }

  return (
    <div className={wrap} aria-busy={signedIn === null}>
      <Button asChild variant="ghost" size="sm" className={stacked ? "h-11 border border-border-strong" : undefined}>
        <Link href="/login" onClick={onNavigate}>Sign in</Link>
      </Button>
      <Button asChild size="sm" className={stacked ? "h-11" : undefined}>
        <Link href="/register" onClick={onNavigate}>Create free account</Link>
      </Button>
    </div>
  );
}
