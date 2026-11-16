"use client";

import { useActionState, useState } from "react";
import { createOrderAction, quoteAction, type QuoteState } from "@/app/dashboard/subscription/actions";
import { formatNu } from "@/lib/utils";

export function CheckoutForm({ packageId, price }: { packageId: string; price: number }) {
  const [code, setCode] = useState("");
  const [quote, quoteFormAction, quoting] = useActionState(quoteAction, { status: "idle", subtotal: price, discount: 0, total: price } as QuoteState);
  const [order, orderAction, ordering] = useActionState(createOrderAction, {} as { error?: string });
  const applied = quote.status === "ok" && quote.code === code && (quote.discount ?? 0) > 0;
  return (
    <div className="space-y-5">
      <form action={quoteFormAction} className="flex flex-wrap items-end gap-2">
        <input type="hidden" name="packageId" value={packageId} />
        <label className="flex-1 text-sm">
          <span className="font-medium text-ink">Promotion code (optional)</span>
          <input name="code" value={code} onChange={(e) => setCode(e.target.value.toUpperCase())} maxLength={40} autoComplete="off"
            className="mt-1 block h-11 w-full rounded-md border border-border-strong bg-background px-3 uppercase tracking-wide" />
        </label>
        <button type="submit" disabled={quoting || !code.trim()} className="h-11 rounded-md border border-border-strong px-4 text-sm font-medium hover:bg-muted disabled:opacity-50">{quoting ? "Checking…" : "Apply"}</button>
      </form>
      {quote.message ? <p role="status" className={quote.status === "error" ? "text-sm text-danger" : "text-sm text-primary"}>{quote.message}</p> : null}
      <dl className="space-y-1 rounded-xl bg-muted/60 p-4 text-sm">
        <div className="flex justify-between"><dt>Price</dt><dd className="tabular-nums">{formatNu(quote.subtotal ?? price)}</dd></div>
        {applied ? <div className="flex justify-between text-primary"><dt>Discount</dt><dd className="tabular-nums">− {formatNu(quote.discount ?? 0)}</dd></div> : null}
        <div className="flex justify-between border-t border-border pt-2 text-base font-semibold text-ink"><dt>Total</dt><dd className="tabular-nums">{formatNu(applied ? quote.total ?? price : price)}</dd></div>
      </dl>
      <form action={orderAction}>
        <input type="hidden" name="packageId" value={packageId} />
        <input type="hidden" name="code" value={applied ? code : ""} />
        <button type="submit" disabled={ordering} className="h-12 w-full rounded-md bg-primary text-base font-semibold text-primary-foreground hover:bg-primary-hover disabled:opacity-50">{ordering ? "Creating order…" : "Continue to payment"}</button>
        {order.error ? <p role="alert" className="mt-2 text-sm text-danger">{order.error}</p> : null}
      </form>
    </div>
  );
}
