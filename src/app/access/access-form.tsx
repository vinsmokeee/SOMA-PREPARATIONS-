"use client";

import { useActionState } from "react";
import { enterAccessCode } from "./actions";

export function AccessForm({ next }: { next: string }) {
  const [state, action, pending] = useActionState(enterAccessCode, {} as { error?: string });
  return (
    <form action={action} className="mt-4 space-y-3">
      <input type="hidden" name="next" value={next} />
      <label className="block text-sm">
        <span className="sr-only">Access code</span>
        <input name="code" type="password" autoComplete="off" required placeholder="Access code" className="block h-11 w-full rounded-md border border-border-strong bg-background px-3" />
      </label>
      {state.error ? <p role="alert" className="text-sm text-danger">{state.error}</p> : null}
      <button type="submit" disabled={pending} className="h-11 w-full rounded-md bg-primary font-semibold text-primary-foreground disabled:opacity-50">{pending ? "Checking…" : "Continue"}</button>
    </form>
  );
}
