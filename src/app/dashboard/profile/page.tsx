import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { ProfileForm } from "./profile-form";

export const metadata: Metadata = { title: "Profile" };

export default async function ProfilePage() {
  const user = await requireUser("/dashboard/profile");
  const supabase = await createClient();
  const [{ data: profile }, { data: cycles }] = await Promise.all([
    supabase.from("profiles").select("full_name, phone, dzongkhag, target_cycle").eq("id", user.id).maybeSingle(),
    supabase.from("exam_cycles").select("name, year").gte("year", 2026).order("year"),
  ]);
  return (
    <>
      <PageTitle title="Profile" description="Keep your details up to date." />
      <div className="grid gap-6 lg:grid-cols-[1fr_320px]">
        <Card>
          <CardContent className="pt-6">
            <ProfileForm
              values={{
                fullName: profile?.full_name ?? "",
                phone: profile?.phone ?? "",
                dzongkhag: profile?.dzongkhag ?? "",
                targetCycle: profile?.target_cycle ?? "",
              }}
              cycles={(cycles ?? []).map((c) => c.name as string)}
            />
          </CardContent>
        </Card>
        <Card className="self-start">
          <CardHeader>
            <CardTitle>Sign-in details</CardTitle>
          </CardHeader>
          <CardContent className="space-y-2 text-sm">
            <p className="text-muted-foreground">Email</p>
            <p className="font-medium text-ink">{user.email}</p>
            <Link href="/forgot-password" className="inline-block pt-2 font-medium text-primary hover:underline">Change password</Link>
          </CardContent>
        </Card>
      </div>
    </>
  );
}
