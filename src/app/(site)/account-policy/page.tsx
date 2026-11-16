import type { Metadata } from "next";
import { LegalPage } from "@/components/site/legal-page";

export const metadata: Metadata = { title: "Account-sharing policy" };

export default function AccountPolicyPage() {
  return (
    <LegalPage title="Account-sharing policy" updated="16 November 2026">
      <p><b>One Soma subscription is for one student.</b> Sharing an account with friends is unfair to students who pay and makes Soma harder to sustain.</p>
      <h2>Using your own devices</h2>
      <ul>
        <li>You can use Soma on your phone, laptop and other personal devices.</li>
        <li>Your account can be signed in on a limited number of devices at the same time (currently two). Signing in on another device signs out the oldest one.</li>
        <li>You can see your devices and recent sign-ins, and sign out other devices, on your Security page.</li>
      </ul>
      <h2>Unusual activity</h2>
      <p>If we see signs of sharing — for example many new devices in a short time or sign-ins from different countries within hours — we may ask you to confirm the device with a link sent to your e-mail. This alone never closes an account.</p>
      <h2>Confirmed sharing</h2>
      <p>Repeated, confirmed sharing is reviewed by a person at Soma. After review, the account may be temporarily restricted. We will tell you why and how to resolve it. Learning history is not deleted.</p>
      <h2>What we record</h2>
      <p>For security we record devices (browser and system type), approximate country, and sign-in times. We do not use GPS location. See the <a href="/privacy">privacy notice</a>.</p>
    </LegalPage>
  );
}
