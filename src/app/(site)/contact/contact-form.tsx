"use client";

import { useActionState } from "react";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldError, Input, Label, Select, Textarea } from "@/components/ui/input";
import { CONTACT_TOPICS } from "@/lib/validation/contact";
import { submitContact, type ContactState } from "./actions";

const initial: ContactState = { status: "idle" };

export function ContactForm() {
  const [state, action, pending] = useActionState(submitContact, initial);

  if (state.status === "success") {
    return <Alert tone="success" title="Message sent">{state.message}</Alert>;
  }

  const fe = state.fieldErrors ?? {};
  return (
    <form action={action} className="space-y-5" noValidate>
      {state.status === "error" && state.message ? <Alert tone="danger">{state.message}</Alert> : null}
      <div className="grid gap-5 sm:grid-cols-2">
        <Field>
          <Label htmlFor="name">Full name</Label>
          <Input id="name" name="name" autoComplete="name" required maxLength={120} aria-invalid={Boolean(fe.name)} aria-describedby="name-error" />
          <FieldError id="name-error">{fe.name}</FieldError>
        </Field>
        <Field>
          <Label htmlFor="email">Email</Label>
          <Input id="email" name="email" type="email" autoComplete="email" required maxLength={200} aria-invalid={Boolean(fe.email)} aria-describedby="email-error" />
          <FieldError id="email-error">{fe.email}</FieldError>
        </Field>
      </div>
      <Field>
        <Label htmlFor="topic">Topic</Label>
        <Select id="topic" name="topic" defaultValue="general">
          {Object.entries(CONTACT_TOPICS).map(([value, label]) => (
            <option key={value} value={value}>{label}</option>
          ))}
        </Select>
      </Field>
      <Field>
        <Label htmlFor="message">Message</Label>
        <Textarea id="message" name="message" rows={6} required maxLength={5000} aria-invalid={Boolean(fe.message)} aria-describedby="message-error" />
        <FieldError id="message-error">{fe.message}</FieldError>
      </Field>
      <div aria-hidden className="absolute -left-[9999px] h-0 w-0 overflow-hidden">
        <label htmlFor="company">Company</label>
        <input id="company" name="company" tabIndex={-1} autoComplete="off" />
      </div>
      <Button type="submit" size="lg" disabled={pending} className="w-full sm:w-auto">
        {pending ? "Sending…" : "Send message"}
      </Button>
    </form>
  );
}
