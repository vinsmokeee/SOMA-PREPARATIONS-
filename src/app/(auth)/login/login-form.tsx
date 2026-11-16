"use client";

import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, Input, Label } from "@/components/ui/input";
import { signIn, type AuthState } from "../actions";

export function LoginForm() {
  const params = useSearchParams();
  const [state, action, pending] = useActionState<AuthState, FormData>(signIn, { status: "idle" });
  const fe = state.fieldErrors ?? {};
  const linkError = params.get("error") === "link";
  const notice = params.get("notice");

  return (
    <form action={action} className="space-y-5" noValidate>
      {linkError && state.status === "idle" ? (
        <Alert tone="warning">That link is invalid or has expired. Please sign in or request a new link.</Alert>
      ) : null}
      {notice === "revoked" && state.status === "idle" ? (
        <Alert tone="warning">You were signed out because your account was used on another device or signed out from your security page. Sign in again to continue. One subscription is for one student.</Alert>
      ) : null}
      {notice === "restricted" && state.status === "idle" ? (
        <Alert tone="danger">This account is restricted. Please contact Soma support.</Alert>
      ) : null}
      {state.message ? <Alert tone="danger">{state.message}</Alert> : null}
      <input type="hidden" name="next" value={params.get("next") ?? "/dashboard"} />
      <Field>
        <Label htmlFor="email">Email</Label>
        <Input id="email" name="email" type="email" autoComplete="email" required aria-invalid={Boolean(fe.email)} aria-describedby="email-error" />
        <FieldError id="email-error">{fe.email}</FieldError>
      </Field>
      <Field>
        <div className="flex items-center justify-between">
          <Label htmlFor="password">Password</Label>
          <Link href="/forgot-password" className="text-sm font-medium text-primary hover:underline">Forgot password?</Link>
        </div>
        <Input id="password" name="password" type="password" autoComplete="current-password" required aria-invalid={Boolean(fe.password)} aria-describedby="password-error" />
        <FieldError id="password-error">{fe.password}</FieldError>
      </Field>
      <Button type="submit" size="lg" className="w-full" disabled={pending}>
        {pending ? "Signing in…" : "Sign in"}
      </Button>
    </form>
  );
}
