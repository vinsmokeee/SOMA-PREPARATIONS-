"use client";

import Link from "next/link";
import { useEffect, useRef } from "react";
import { useFormStatus } from "react-dom";
import { Lock } from "lucide-react";
import { confirmMeEntryAction } from "@/app/dashboard/exam-actions";

/**
 * ME Premium: a pop-up asking the student to confirm their subject before any paper opens (founder, 22 Nov 2026).
 * Once confirmed, all other ME subjects are locked for them; only Soma staff can correct a mistake.
 */
export function ConfirmSubject({ label, category, specialisation, error }: { label: string; category: string; specialisation: string; error?: string | null }) {
  const heading = useRef<HTMLHeadingElement>(null);
  useEffect(() => { heading.current?.focus(); }, []);
  return (
    <div className="fixed inset-0 z-50 flex items-end justify-center bg-black/50 p-4 sm:items-center">
      <div role="dialog" aria-modal="true" aria-labelledby="confirm-subject-h" className="w-full max-w-md rounded-3xl bg-background p-6 shadow-2xl">
        <p className="flex size-11 items-center justify-center rounded-full bg-primary/10 text-primary"><Lock className="size-5" aria-hidden /></p>
        <h2 id="confirm-subject-h" ref={heading} tabIndex={-1} className="mt-3 text-xl font-extrabold text-ink outline-none">Subject confirmation</h2>
        <p className="mt-2 text-sm text-muted-foreground">Dear student, please check that this is the subject you are applying for:</p>
        <p className="mt-3 rounded-2xl border-2 border-primary bg-primary/5 p-4 text-base font-bold text-ink">{label}</p>
        <p className="mt-3 text-sm text-ink">
          Once you confirm, <strong>all other ME subjects will be locked</strong> and you will see only this subject&apos;s papers and questions.
          <strong> This cannot be undone.</strong>
        </p>
        {error ? <p role="alert" className="mt-3 rounded-xl bg-danger-soft p-3 text-sm text-danger">{error}</p> : null}
        <form action={confirmMeEntryAction} className="mt-5">
          <input type="hidden" name="category" value={category} />
          <input type="hidden" name="specialisation" value={specialisation} />
          <ConfirmButton />
        </form>
        <Link href="/dashboard/me?change=1" className="mt-2 flex h-12 w-full items-center justify-center rounded-2xl text-sm font-semibold text-ink ring-1 ring-border-strong">
          No, choose another subject
        </Link>
      </div>
    </div>
  );
}

function ConfirmButton() {
  const { pending } = useFormStatus();
  return (
    <button type="submit" disabled={pending} className="flex h-12 w-full items-center justify-center rounded-2xl bg-primary text-sm font-bold text-primary-foreground disabled:opacity-60">
      {pending ? "Confirming…" : "Yes, this is my subject. Confirm"}
    </button>
  );
}
