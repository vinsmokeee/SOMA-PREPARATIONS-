"use client";

import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { sendDeviceLink, type AuthState } from "../actions";

export function VerifyDeviceForm({ email, next }: { email: string; next: string }) {
  const [state, action, pending] = useActionState<AuthState, FormData>(sendDeviceLink, { status: "idle" });
  return (
    <form action={action} className="space-y-4">
      <input type="hidden" name="next" value={next} />
      {state.message ? <Alert tone={state.status === "error" ? "danger" : "success"}>{state.message}</Alert> : null}
      <p className="text-sm text-muted-foreground">We will send a sign-in link to <span className="font-medium text-ink">{email}</span>. Open it <b>in this same browser</b> to continue.</p>
      <p className="rounded-xl bg-muted p-3 text-sm text-ink">If your e-mail app opens the link somewhere else: <b>press and hold</b> the link, tap <b>Copy</b>, then paste it into this browser’s address bar.</p>
      <Button type="submit" size="lg" className="w-full" disabled={pending || state.status === "success"}>{pending ? "Sending…" : "E-mail me a confirmation link"}</Button>
      <p className="text-xs text-muted-foreground">One Soma subscription is for one student. If you did not sign in on another device, change your password after confirming.</p>
    </form>
  );
}
