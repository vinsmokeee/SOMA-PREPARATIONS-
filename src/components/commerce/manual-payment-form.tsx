"use client";

import { useActionState, useRef, useState } from "react";
import { submitManualPaymentAction } from "@/app/dashboard/subscription/actions";
import { getBrowserClient } from "@/lib/supabase/client";

/** Student submits the transaction number and a screenshot; access starts only after Soma verifies it. */
export function ManualPaymentForm({ orderId, amount, userId }: { orderId: string; amount: number; userId: string }) {
  const [state, action, pending] = useActionState(submitManualPaymentAction, { status: "idle" } as { status: string; message?: string });
  const [proofPath, setProofPath] = useState("");
  const [upload, setUpload] = useState<"idle" | "uploading" | "done" | "error">("idle");
  const fileRef = useRef<HTMLInputElement>(null);

  const onFile = async (f: File | undefined) => {
    if (!f) return;
    if (f.size > 5 * 1024 * 1024) { setUpload("error"); return; }
    const db = getBrowserClient();
    if (!db) { setUpload("error"); return; }
    setUpload("uploading");
    const ext = f.type === "application/pdf" ? "pdf" : f.type === "image/png" ? "png" : f.type === "image/webp" ? "webp" : "jpg";
    const path = `${userId}/${crypto.randomUUID().replace(/-/g, "")}.${ext}`;
    const { error } = await db.storage.from("payment-proofs").upload(path, f, { contentType: f.type || "image/jpeg", upsert: false });
    if (error) { setUpload("error"); return; }
    setProofPath(path);
    setUpload("done");
  };

  if (state.status === "success") return <p role="status" className="rounded-lg bg-primary-soft p-4 text-sm text-primary">{state.message}</p>;
  return (
    <form action={action} className="space-y-4">
      <input type="hidden" name="orderId" value={orderId} />
      <input type="hidden" name="proofPath" value={proofPath} />
      <label className="block text-sm">
        <span className="font-medium text-ink">Transaction (journal) number</span>
        <input name="reference" required minLength={4} maxLength={120} autoComplete="off" className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-3" />
      </label>
      <label className="block text-sm">
        <span className="font-medium text-ink">Amount you paid (Nu.)</span>
        <input name="amount" type="number" step="0.01" min="1" defaultValue={amount} required className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-3" />
      </label>
      <div className="text-sm">
        <span className="font-medium text-ink">Payment screenshot</span>
        <input ref={fileRef} type="file" accept="image/jpeg,image/png,image/webp,application/pdf" className="sr-only" onChange={(e) => onFile(e.target.files?.[0])} />
        <div className="mt-1 flex items-center gap-3">
          <button type="button" onClick={() => fileRef.current?.click()} className="h-10 rounded-md border border-border-strong px-4 font-medium hover:bg-muted">{upload === "done" ? "Change screenshot" : "Choose screenshot"}</button>
          <span className="text-muted-foreground">{upload === "uploading" ? "Uploading…" : upload === "done" ? "Attached ✓" : upload === "error" ? "Upload failed (max 5 MB). Try again." : "JPG, PNG or PDF"}</span>
        </div>
      </div>
      {state.status === "error" ? <p role="alert" className="text-sm text-danger">{state.message}</p> : null}
      <button type="submit" disabled={pending || upload === "uploading"} className="h-12 w-full rounded-md bg-primary text-base font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-50">{pending ? "Submitting…" : "Submit payment details"}</button>
      <p className="text-xs text-muted-foreground">Your access starts after Soma confirms the payment in its account. A screenshot alone does not activate access.</p>
    </form>
  );
}
