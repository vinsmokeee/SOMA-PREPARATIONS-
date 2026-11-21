"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { getBrowserClient } from "@/lib/supabase/client";
import { safeRedirectPath } from "@/lib/utils";

/** Opens an e-mail sign-in or password-reset link in whichever browser or app the person tapped it in. */
export default function EmailLinkPage() {
  const [failed, setFailed] = useState(false);
  useEffect(() => {
    const hash = new URLSearchParams(window.location.hash.slice(1));
    const search = new URLSearchParams(window.location.search);
    const access_token = hash.get("access_token");
    const refresh_token = hash.get("refresh_token");
    const next = hash.get("type") === "recovery" ? "/reset-password" : safeRedirectPath(search.get("next"));
    const supabase = getBrowserClient();
    if (!access_token || !refresh_token || !supabase) { void Promise.resolve().then(() => setFailed(true)); return; }
    supabase.auth.setSession({ access_token, refresh_token }).then(({ error }) => {
      if (error) setFailed(true);
      else window.location.replace(next);
    });
  }, []);
  return (
    <main className="mx-auto max-w-md px-4 py-16 text-center">
      {failed ? (
        <>
          <h1 className="text-xl font-semibold text-ink">This link has expired or was already used</h1>
          <p className="mt-2 text-sm text-muted-foreground">Please sign in again and ask for a new link.</p>
          <Link href="/login" className="mt-6 inline-flex h-11 items-center rounded-xl bg-primary px-5 text-sm font-bold text-primary-foreground">Go to sign in</Link>
        </>
      ) : (
        <p role="status" className="text-sm text-muted-foreground">Signing you in…</p>
      )}
    </main>
  );
}
