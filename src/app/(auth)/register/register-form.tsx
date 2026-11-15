"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, FieldHint, Input, Label } from "@/components/ui/input";
import { PASSWORD_MIN } from "@/lib/validation/auth";
import { signUp, type AuthState } from "../actions";

export function RegisterForm() {
  const [state, action, pending] = useActionState<AuthState, FormData>(signUp, { status: "idle" });
  const fe = state.fieldErrors ?? {};

  if (state.status === "success") {
    return <Alert tone="success" title="Check your email">{state.message}</Alert>;
  }

  return (
    <form action={action} className="space-y-5" noValidate>
      {state.message ? <Alert tone="danger">{state.message}</Alert> : null}
      <Field>
        <Label htmlFor="fullName">Full name</Label>
        <Input id="fullName" name="fullName" autoComplete="name" required maxLength={120} aria-invalid={Boolean(fe.fullName)} aria-describedby="fullName-error" />
        <FieldError id="fullName-error">{fe.fullName}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="email">Email</Label>
        <Input id="email" name="email" type="email" autoComplete="email" required aria-invalid={Boolean(fe.email)} aria-describedby="email-error" />
        <FieldError id="email-error">{fe.email}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="password">Password</Label>
        <Input id="password" name="password" type="password" autoComplete="new-password" required minLength={PASSWORD_MIN} aria-invalid={Boolean(fe.password)} aria-describedby="password-hint password-error" />
        <FieldHint id="password-hint">At least {PASSWORD_MIN} characters, including a letter and a number.</FieldHint>
        <FieldError id="password-error">{fe.password}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="confirmPassword">Confirm password</Label>
        <Input id="confirmPassword" name="confirmPassword" type="password" autoComplete="new-password" required aria-invalid={Boolean(fe.confirmPassword)} aria-describedby="confirmPassword-error" />
        <FieldError id="confirmPassword-error">{fe.confirmPassword}</FieldError>
      </Field>
      <div className="flex flex-col gap-1.5">
        <label className="flex items-start gap-3 text-sm leading-relaxed text-foreground">
          <input type="checkbox" name="acceptTerms" className="mt-1 size-4 accent-[var(--primary)]" aria-invalid={Boolean(fe.acceptTerms)} />
          <span>
            I agree to the <Link href="/terms" className="font-medium text-primary underline-offset-4 hover:underline" target="_blank">terms of use</Link> and{" "}
            <Link href="/privacy" className="font-medium text-primary underline-offset-4 hover:underline" target="_blank">privacy notice</Link>.
          </span>
        </label>
        <FieldError>{fe.acceptTerms}</FieldError>
      </div>
      <Button type="submit" size="lg" className="w-full" disabled={pending}>
        {pending ? "Creating account…" : "Create free account"}
      </Button>
    </form>
  );
}
