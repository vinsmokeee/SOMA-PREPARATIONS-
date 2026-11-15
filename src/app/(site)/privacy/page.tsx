import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Privacy" };

export default function PrivacyPage() {
  return (
    <LegalPage title="Privacy" updated="15 November 2026">
      <p>This notice explains what personal information Soma collects and how it is used.</p>
      <h2>What we collect</h2>
      <ul>
        <li>Account details: your name, email address and, optionally, phone number and dzongkhag.</li>
        <li>Learning data: your examination attempts, answers, scores and progress.</li>
        <li>Payment records: order references and payment verification details. We never store banking passwords or PINs.</li>
        <li>Messages you send us through the contact form.</li>
      </ul>
      <h2>How we use it</h2>
      <ul>
        <li>To provide your account, examinations, results and analytics.</li>
        <li>To verify payments and grant access to packages.</li>
        <li>To respond to support requests and improve Soma.</li>
      </ul>
      <h2>Who can see it</h2>
      <p>Your learning data is visible to you and to authorised Soma staff who need it to operate the service (for example, an evaluator marking a written answer you submitted). We do not sell personal information.</p>
      <h2>Your choices</h2>
      <p>You can update your profile at any time and ask us to delete your account through the contact page.</p>
    </LegalPage>
  );
}
