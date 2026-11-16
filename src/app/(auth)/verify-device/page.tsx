import type { Metadata } from "next";
import { AuthCard } from "../auth-ui";
import { requireUser } from "@/lib/auth/dal";
import { VerifyDeviceForm } from "./verify-form";

export const metadata: Metadata = { title: "Confirm it's you" };

export default async function VerifyDevicePage({ searchParams }: PageProps<"/verify-device">) {
  const sp = await searchParams;
  const user = await requireUser("/dashboard", { allowUnverified: true });
  const next = typeof sp.next === "string" && sp.next.startsWith("/") && !sp.next.startsWith("//") ? sp.next : "/dashboard";
  return (
    <AuthCard title="Confirm it’s you" description="We noticed sign-ins from new devices or places. To protect your account, confirm this device with a link sent to your e-mail.">
      <VerifyDeviceForm email={user.email ?? ""} next={next} />
    </AuthCard>
  );
}
