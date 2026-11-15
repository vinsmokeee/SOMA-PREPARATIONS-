"use client";

import { useEffect } from "react";
import { Button } from "@/components/ui/button";

export default function ErrorPage({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error(error);
  }, [error]);
  return (
    <main id="main" className="flex flex-1 flex-col items-center justify-center px-4 py-24 text-center">
      <h1 className="font-serif text-3xl font-semibold">Something went wrong</h1>
      <p className="mt-3 max-w-md text-muted-foreground">
        An unexpected error occurred. Please try again. If the problem continues, contact support
        {error.digest ? <> and quote reference <code className="text-ink">{error.digest}</code></> : null}.
      </p>
      <Button className="mt-8" onClick={reset}>Try again</Button>
    </main>
  );
}
