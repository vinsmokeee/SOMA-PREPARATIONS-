"use client";

import { useActionState, type ReactNode } from "react";
import { cn } from "@/lib/utils";

export type ActionState = { status: "idle" | "success" | "error"; message?: string; fieldErrors?: Record<string, string> };
export type FormAction = (prev: ActionState, formData: FormData) => Promise<ActionState>;

/**
 * Small wrapper for admin forms backed by a server action. Shows the outcome
 * inline and disables submission while pending.
 */
export function ActionForm({
  action,
  children,
  submitLabel = "Save",
  className,
  confirm,
  variant = "primary",
}: {
  action: FormAction;
  children?: ReactNode;
  submitLabel?: string;
  className?: string;
  confirm?: string;
  variant?: "primary" | "secondary" | "danger";
}) {
  const [state, formAction, pending] = useActionState(action, { status: "idle" });
  const btn = {
    primary: "bg-primary text-primary-foreground hover:bg-primary-hover",
    secondary: "border border-border-strong bg-background text-ink hover:bg-muted",
    danger: "bg-danger text-white hover:bg-[#87201a]",
  }[variant];
  return (
    <form
      action={formAction}
      className={cn("space-y-4", className)}
      onSubmit={(e) => {
        if (confirm && !window.confirm(confirm)) e.preventDefault();
      }}
    >
      {children}
      {state.fieldErrors && Object.keys(state.fieldErrors).length > 0 ? (
        <ul role="alert" className="space-y-1 text-[13px] font-medium text-danger">
          {Object.entries(state.fieldErrors).map(([k, v]) => (
            <li key={k}>{v}</li>
          ))}
        </ul>
      ) : null}
      <div className="flex flex-wrap items-center gap-3">
        <button type="submit" disabled={pending} className={cn("inline-flex h-9 items-center rounded-md px-4 text-sm font-medium disabled:opacity-50", btn)}>
          {pending ? "Saving…" : submitLabel}
        </button>
        {state.message ? (
          <p role="status" className={cn("text-sm", state.status === "error" ? "text-danger" : "text-primary")}>
            {state.message}
          </p>
        ) : null}
      </div>
    </form>
  );
}
