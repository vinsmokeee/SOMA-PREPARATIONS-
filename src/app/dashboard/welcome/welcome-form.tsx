"use client";

import { useActionState, useState } from "react";
import { PUBLIC_GROUP_LABELS } from "@/lib/exam/entry";
import { saveWelcomeAction } from "./actions";

type Category = { id: string; name: string; public_group: string | null };
type Spec = { id: string; name: string };
export type EntryDefaults = { pathway: string; categoryId: string; specialisationId: string; phone: string };

const GROUP_HINTS: Record<string, string> = {
  general: "Administrative, Finance and PGDE graduates sit the same three papers.",
  technical: "Paper I is common; Paper II and III follow your specialisation.",
  dzongkha: "Dzongkha Language & GK, English & Current Affairs, Buddhist Studies.",
};

export function WelcomeForm({ categories, specialisations, defaults, locked }: { categories: Category[]; specialisations: Spec[]; defaults: EntryDefaults; locked: boolean }) {
  const [state, action, pending] = useActionState(saveWelcomeAction, {} as { error?: string });
  const [pathway, setPathway] = useState(defaults.pathway || "both");
  const initialGroup = categories.find((c) => c.id === defaults.categoryId)?.public_group ?? "";
  const [group, setGroup] = useState(initialGroup);
  const groups = [...new Set(categories.map((c) => c.public_group).filter((g): g is string => Boolean(g)))];
  const inGroup = categories.filter((c) => c.public_group === group);
  const [categoryId, setCategoryId] = useState(defaults.categoryId);
  const effectiveCategory = inGroup.length === 1 ? inGroup[0].id : categoryId;
  const wantsMe = pathway !== "PE";

  return (
    <form action={action} className="space-y-5">
      <fieldset>
        <legend className="text-sm font-medium text-ink">I am preparing for</legend>
        <div className="mt-2 grid gap-2 sm:grid-cols-3">
          {[["PE", "Preliminary (PE)"], ["ME", "Main (ME)"], ["both", "Both"]].map(([v, l]) => (
            <label key={v} className="flex cursor-pointer items-center gap-2 rounded-lg border border-border-strong p-3 text-sm has-[:checked]:border-primary has-[:checked]:bg-primary-soft">
              <input type="radio" name="pathway" value={v} checked={pathway === v} onChange={() => setPathway(v)} /> {l}
            </label>
          ))}
        </div>
      </fieldset>

      {wantsMe ? (
        <fieldset disabled={locked} className="space-y-4 disabled:opacity-60">
          <legend className="text-sm font-medium text-ink">My ME pathway</legend>
          {locked ? <p className="text-sm text-muted-foreground">Your ME entry is fixed while your ME subscription is active. Contact support to change it.</p> : null}
          <div className="grid gap-2">
            {groups.map((g) => (
              <label key={g} className="flex cursor-pointer items-start gap-2 rounded-lg border border-border-strong p-3 text-sm has-[:checked]:border-primary has-[:checked]:bg-primary-soft">
                <input type="radio" name="group" value={g} checked={group === g} onChange={() => { setGroup(g); setCategoryId(""); }} className="mt-1" />
                <span>
                  <span className="font-medium text-ink">{PUBLIC_GROUP_LABELS[g] ?? g}</span>
                  {GROUP_HINTS[g] ? <span className="block text-muted-foreground">{GROUP_HINTS[g]}</span> : null}
                </span>
              </label>
            ))}
          </div>
          {inGroup.length > 1 ? (
            <label className="block text-sm">
              <span className="font-medium text-ink">Which category?</span>
              <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-2">
                <option value="">Choose…</option>
                {inGroup.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </label>
          ) : null}
          <input type="hidden" name="entry_category_id" value={group ? effectiveCategory : ""} />
          {group === "technical" ? (
            <label className="block text-sm">
              <span className="font-medium text-ink">My specialisation</span>
              <select name="specialisation_id" defaultValue={defaults.specialisationId} className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-2">
                <option value="">Choose…</option>
                {specialisations.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
              </select>
              <span className="mt-1 block text-muted-foreground">You will only get Paper II and III questions for this specialisation.</span>
            </label>
          ) : null}
        </fieldset>
      ) : null}

      <label className="block text-sm">
        <span className="font-medium text-ink">Phone (optional)</span>
        <input name="phone" type="tel" autoComplete="tel" defaultValue={defaults.phone} placeholder="e.g. 17 12 34 56" className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-3" />
      </label>
      {state.error ? <p role="alert" className="text-sm text-danger">{state.error}</p> : null}
      <button type="submit" disabled={pending} className="h-12 w-full rounded-md bg-primary font-semibold text-primary-foreground disabled:opacity-50">{pending ? "Saving…" : "Continue"}</button>
    </form>
  );
}
