"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, Input, Label } from "@/components/ui/input";
import { requestPasswordReset, type AuthState } from "../actions";
import { AuthCard } from "../auth-ui";

export default function ForgotPasswordPage() {
  const [state, action, pending] = useActionState<AuthState, FormData>(requestPasswordReset, { status: "idle" });
  const fe = state.fieldErrors ?? {};
  return (
    <AuthCard
      title="Reset your password"
      description="Enter your account email and we will send you a link to choose a new password."
      footer={<Link href="/login" className="font-medium text-primary hover:underline">Back to sign in</Link>}
    >
      {state.status === "success" ? (
        <Alert tone="success" title="Check your email">{state.message}</Alert>
      ) : (
        <form action={action} className="space-y-5" noValidate>
          {state.message ? <Alert tone="danger">{state.message}</Alert> : null}
          <Field>
            <Label htmlFor="email">Email</Label>
            <Input id="email" name="email" type="email" autoComplete="email" required aria-invalid={Boolean(fe.email)} aria-describedby="email-error" />
            <FieldError id="email-error">{fe.email}</FieldError>
          </Field>
          <Button type="submit" size="lg" className="w-full" disabled={pending}>{pending ? "Sending…" : "Send reset link"}</Button>
        </form>
      )}
    </AuthCard>
  );
}
