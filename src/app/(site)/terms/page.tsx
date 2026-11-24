import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Terms of use" };

export default function TermsPage() {
  return (
    <LegalPage title="Terms of use" updated="15 November 2026">
      <p>These terms govern your use of SOMA Academy (&quot;Soma&quot;). By creating an account you agree to them.</p>
      <h2>Independent service</h2>
      <p>Soma is an independent preparation service. It is not affiliated with the Royal Civil Service Commission (RCSC). Soma practice examinations, scores and readiness estimates are not official RCSC papers, marks or assessments.</p>
      <h2>Your account</h2>
      <ul>
        <li>Keep your sign-in details private. Accounts are personal and may not be shared.</li>
        <li>Provide accurate information and keep it up to date.</li>
      </ul>
      <h2>Packages and access</h2>
      <p>Each package states what it includes, the examination cycle it applies to and how long access lasts. Access begins only after payment has been verified. Soma does not promise future updates beyond what a package states.</p>
      <h2>Content</h2>
      <p>Soma&apos;s questions, explanations and notes are protected. You may use them for your own preparation but may not copy, resell or redistribute them.</p>
      <h2>No guarantee of results</h2>
      <p>Soma helps you prepare but cannot guarantee success or selection in the BCSE.</p>
    </LegalPage>
  );
}
