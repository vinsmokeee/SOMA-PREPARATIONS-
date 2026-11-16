"use client";

import { useActionState } from "react";
import { startGatewayPaymentAction } from "@/app/dashboard/subscription/actions";

export function GatewayButton({ orderId, provider, label }: { orderId: string; provider: string; label: string }) {
  const [state, action, pending] = useActionState(startGatewayPaymentAction, {} as { error?: string });
  return (
    <form action={action}>
      <input type="hidden" name="orderId" value={orderId} />
      <input type="hidden" name="provider" value={provider} />
      <button type="submit" disabled={pending} className="h-12 w-full rounded-md bg-primary text-base font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-50">{pending ? "Opening…" : label}</button>
      {state.error ? <p role="alert" className="mt-2 text-sm text-danger">{state.error}</p> : null}
    </form>
  );
}
