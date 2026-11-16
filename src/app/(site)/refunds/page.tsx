import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Refund and cancellation policy" };

export default function RefundsPage() {
  return (
    <LegalPage title="Refund and cancellation policy" updated="16 November 2026">
      <p>This policy explains when Soma Preparations refunds a package payment. <b>The time limits below are proposals awaiting the founder&apos;s confirmation and legal review.</b></p>
      <h2>Before access starts</h2>
      <p>You can cancel an unpaid order at any time from your subscription page. If you paid but your payment has not yet been verified, contact Soma and we will return the full amount to the account it came from.</p>
      <h2>After access starts</h2>
      <ul>
        <li>You may request a full refund within <b>[7] days</b> of activation if you have completed fewer than <b>[2]</b> full examinations and have used no AI evaluations.</li>
        <li>After that, refunds are given only where Soma could not provide the service described for your package.</li>
        <li>A refund ends your paid access. Your account, learning history and results are kept.</li>
      </ul>
      <h2>How refunds are paid</h2>
      <p>Refunds are paid back to the original payment method or bank account, usually within <b>[7] working days</b> of approval. Bank or gateway charges, if any, are explained when you request the refund.</p>
      <h2>Not refundable</h2>
      <ul>
        <li>Complimentary or promotional access.</li>
        <li>Packages where the account was restricted after confirmed sharing of the account.</li>
      </ul>
      <h2>How to request</h2>
      <p>Use the contact form and choose “Payment”, quoting your order number (it starts with SOMA-).</p>
    </LegalPage>
  );
}
