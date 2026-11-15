import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Disclaimer" };

export default function DisclaimerPage() {
  return (
    <LegalPage title="Disclaimer" updated="15 November 2026">
      <p>Soma Preparations is not affiliated with, endorsed by, or part of the Royal Civil Service Commission (RCSC) or the Royal Government of Bhutan.</p>
      <p>Information about the BCSE on this website is summarised from official RCSC documents, which are cited where used. Examination rules, dates and requirements can change; the latest RCSC announcement always takes precedence.</p>
      <p>Soma practice examinations are simulations. Soma scores, AI-assisted feedback and readiness estimates are not official marks or assessments, and no part of Soma predicts the exact questions of any future examination.</p>
    </LegalPage>
  );
}
