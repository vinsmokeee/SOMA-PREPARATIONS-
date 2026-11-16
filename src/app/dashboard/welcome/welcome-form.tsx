"use client";

import { useActionState } from "react";
import { saveWelcomeAction } from "./actions";

export function WelcomeForm({ categories }: { categories: { id: string; name: string }[] }) {
  const [state, action, pending] = useActionState(saveWelcomeAction, {} as { error?: string });
  return (
    <form action={action} className="space-y-5">
      <fieldset>
        <legend className="text-sm font-medium text-ink">I am preparing for</legend>
        <div className="mt-2 grid gap-2 sm:grid-cols-3">
          {[["PE", "Preliminary (PE)"], ["ME", "Main (ME)"], ["both", "Both"]].map(([v, l]) => (
            <label key={v} className="flex cursor-pointer items-center gap-2 rounded-lg border border-border-strong p-3 text-sm has-[:checked]:border-primary has-[:checked]:bg-primary-soft">
              <input type="radio" name="pathway" value={v} defaultChecked={v === "both"} /> {l}
            </label>
          ))}
        </div>
      </fieldset>
      <label className="block text-sm">
        <span className="font-medium text-ink">ME entry group (if you know it)</span>
        <select name="entry_category_id" defaultValue="" className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-2">
          <option value="">Not sure yet</option>
          {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
        </select>
      </label>
      <label className="block text-sm">
        <span className="font-medium text-ink">Phone (optional)</span>
        <input name="phone" type="tel" autoComplete="tel" placeholder="e.g. 17 12 34 56" className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-3" />
      </label>
      {state.error ? <p role="alert" className="text-sm text-danger">{state.error}</p> : null}
      <button type="submit" disabled={pending} className="h-12 w-full rounded-md bg-primary font-semibold text-primary-foreground disabled:opacity-50">{pending ? "Saving…" : "Continue"}</button>
    </form>
  );
}
