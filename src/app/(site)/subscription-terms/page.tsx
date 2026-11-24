import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Subscription terms" };

export default function SubscriptionTermsPage() {
  return (
    <LegalPage title="Subscription terms" updated="16 November 2026">
      <p>These terms describe how SOMA Academy packages work. They form part of the <a href="/terms">terms of use</a>.</p>
      <h2>What a package includes</h2>
      <p>Each package lists its features, price and access period on the packages page at the time you buy it. Prices may change for future purchases; they do not change a package you have already paid for.</p>
      <h2>When access starts and ends</h2>
      <ul>
        <li>Access starts when your payment is confirmed — automatically for online payments, or after Soma verifies a bank transfer or mobile-banking payment. A screenshot alone does not start access.</li>
        <li>Access ends on the date shown in “My subscription”. Reminders are sent before it ends.</li>
        <li>Renewing before the end date adds the new period to your current end date.</li>
      </ul>
      <h2>After access ends</h2>
      <p>Paid features stop, but your account, results, analytics and history are kept. You can renew at any time without creating a new account.</p>
      <h2>Discount codes</h2>
      <p>Codes have their own conditions (validity dates, packages and number of uses) and cannot be exchanged for cash.</p>
      <h2>Suspension</h2>
      <p>Soma may pause access while investigating misuse such as account sharing or payment problems, and will tell you why. See the <a href="/account-policy">account-sharing policy</a>.</p>
      <h2>No guarantee of results</h2>
      <p>Soma helps you prepare but cannot guarantee success or selection in the BCSE. AI marks and readiness estimates are indicative, not RCSC assessments.</p>
    </LegalPage>
  );
}
