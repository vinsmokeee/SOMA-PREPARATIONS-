import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { WelcomeForm } from "./welcome-form";

export const metadata: Metadata = { title: "About you" };

export default async function WelcomePage() {
  await requireUser("/dashboard/welcome");
  const db = await createClient();
  const { data: cats } = await db.from("exam_categories").select("id, name").eq("is_active", true).order("sort_order");
  return (
    <div className="mx-auto max-w-lg">
      <PageTitle title="One quick step" description="Tell us what you are preparing for, so Soma can show the right practice. You can change this later in your profile." />
      <WelcomeForm categories={cats ?? []} />
    </div>
  );
}
