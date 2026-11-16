"use client";

import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, FieldHint, Input, Label, Select } from "@/components/ui/input";
import { DZONGKHAGS } from "@/lib/validation/profile";
import { updateProfile, type ProfileState } from "./actions";

export type ProfileValues = { fullName: string; phone: string; dzongkhag: string; targetCycle: string };

export function ProfileForm({ values, cycles }: { values: ProfileValues; cycles: string[] }) {
  const [state, action, pending] = useActionState<ProfileState, FormData>(updateProfile, { status: "idle" });
  const fe = state.fieldErrors ?? {};
  return (
    <form action={action} className="max-w-xl space-y-5" noValidate>
      {state.status === "success" ? <Alert tone="success">{state.message}</Alert> : null}
      {state.status === "error" && state.message ? <Alert tone="danger">{state.message}</Alert> : null}
      <Field>
        <Label htmlFor="fullName">Full name</Label>
        <Input id="fullName" name="fullName" defaultValue={values.fullName} autoComplete="name" aria-invalid={Boolean(fe.fullName)} aria-describedby="fullName-error" />
        <FieldError id="fullName-error">{fe.fullName}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="phone">Phone (optional)</Label>
        <Input id="phone" name="phone" type="tel" defaultValue={values.phone} autoComplete="tel" aria-invalid={Boolean(fe.phone)} aria-describedby="phone-hint phone-error" />
        <FieldHint id="phone-hint">Used only to help with payment or account support.</FieldHint>
        <FieldError id="phone-error">{fe.phone}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="dzongkhag">Dzongkhag (optional)</Label>
        <Select id="dzongkhag" name="dzongkhag" defaultValue={values.dzongkhag} aria-invalid={Boolean(fe.dzongkhag)}>
          <option value="">Prefer not to say</option>
          {DZONGKHAGS.map((d) => <option key={d} value={d}>{d}</option>)}
        </Select>
        <FieldError>{fe.dzongkhag}</FieldError>
      </Field>
      <Field>
        <Label htmlFor="targetCycle">Exam year (optional)</Label>
        <Select id="targetCycle" name="targetCycle" defaultValue={values.targetCycle}>
          <option value="">Not decided</option>
          {cycles.map((c) => <option key={c} value={c}>{c}</option>)}
        </Select>
      </Field>
      <Button type="submit" disabled={pending}>{pending ? "Saving…" : "Save profile"}</Button>
    </form>
  );
}
