"use client";

import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, FieldHint, Input, Label } from "@/components/ui/input";
import { PASSWORD_MIN } from "@/lib/validation/auth";
import { updatePassword, type AuthState } from "../actions";
import { AuthCard } from "../auth-ui";

export default function ResetPasswordPage() {
  const [state, action, pending] = useActionState<AuthState, FormData>(updatePassword, { status: "idle" });
  const fe = state.fieldErrors ?? {};
  return (
    <AuthCard title="Choose a new password">
      <form action={action} className="space-y-5" noValidate>
        {state.message ? <Alert tone="danger">{state.message}</Alert> : null}
        <Field>
          <Label htmlFor="password">New password</Label>
          <Input id="password" name="password" type="password" autoComplete="new-password" required aria-invalid={Boolean(fe.password)} aria-describedby="password-hint password-error" />
          <FieldHint id="password-hint">At least {PASSWORD_MIN} characters, including a letter and a number.</FieldHint>
          <FieldError id="password-error">{fe.password}</FieldError>
        </Field>
        <Field>
          <Label htmlFor="confirmPassword">Confirm new password</Label>
          <Input id="confirmPassword" name="confirmPassword" type="password" autoComplete="new-password" required aria-invalid={Boolean(fe.confirmPassword)} aria-describedby="confirmPassword-error" />
          <FieldError id="confirmPassword-error">{fe.confirmPassword}</FieldError>
        </Field>
        <Button type="submit" size="lg" className="w-full" disabled={pending}>{pending ? "Saving…" : "Save new password"}</Button>
      </form>
    </AuthCard>
  );
}
