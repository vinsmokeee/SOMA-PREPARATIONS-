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
      <h2>Payments and subscriptions</h2>
      <p>For purchases we keep your orders, the amount paid, transaction references, any payment screenshot you upload and subscription history. Screenshots are stored privately and seen only by staff who verify payments. Card or bank-login details are handled by the bank or payment provider, never stored by Soma.</p>
      <h2>Account security</h2>
      <p>To protect your account and enforce the <a href="/account-policy">account-sharing policy</a>, we record the devices you use (browser and system type, a random device identifier), approximate country from your internet connection, and sign-in times. We do not use GPS location.</p>
      <h2>Notifications</h2>
      <p>We send account, payment, subscription and security messages inside Soma, and by e-mail where e-mail sending is set up.</p>
      <h2>Your choices</h2>
      <p>You can update your profile at any time and ask us to delete your account through the contact page.</p>
    </LegalPage>
  );
}
