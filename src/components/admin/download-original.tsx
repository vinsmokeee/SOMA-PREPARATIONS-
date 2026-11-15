"use client";

import { useState, useTransition } from "react";
import { documentDownloadUrl } from "@/app/admin/imports/actions";
import { Button } from "@/components/ui/button";

export function DownloadOriginal({ documentId }: { documentId: string }) {
  const [pending, start] = useTransition();
  const [error, setError] = useState(false);
  return (
    <span className="inline-flex items-center gap-2">
      <Button
        type="button"
        variant="secondary"
        size="sm"
        disabled={pending}
        onClick={() =>
          start(async () => {
            const url = await documentDownloadUrl(documentId);
            if (url) window.open(url, "_blank", "noopener");
            else setError(true);
          })
        }
      >
        {pending ? "Preparing…" : "Open original PDF"}
      </Button>
      {error ? <span className="text-sm text-danger">Not available</span> : null}
    </span>
  );
}
