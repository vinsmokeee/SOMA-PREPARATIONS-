import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { WelcomeForm } from "./welcome-form";

export const metadata: Metadata = { title: "About you" };

export default async function WelcomePage() {
  const user = await requireUser("/dashboard/welcome");
  const db = await createClient();
  const [{ data: cats }, { data: specs }, { data: profile }, { data: meAccess }] = await Promise.all([
    db.from("exam_categories").select("id, name, public_group").eq("is_active", true).eq("is_offered", true).order("sort_order"),
    db.from("specialisations").select("id, name").eq("is_active", true).order("sort_order"),
    db.from("profiles").select("pathway, entry_category_id, specialisation_id, phone, onboarded_at, entry_confirmed_at").eq("id", user.id).maybeSingle(),
    db.rpc("has_stage_access", { _stage: "ME" }),
  ]);
  const locked = Boolean(meAccess) && Boolean(profile?.entry_confirmed_at);
  return (
    <div className="mx-auto max-w-lg">
      <PageTitle
        title={profile?.onboarded_at ? "My examination" : "One quick step"}
        description="Tell us what you are preparing for, so Soma shows the right papers and questions."
      />
      <WelcomeForm
        categories={cats ?? []}
        specialisations={specs ?? []}
        locked={locked}
        defaults={{ pathway: profile?.pathway ?? "", categoryId: profile?.entry_category_id ?? "", specialisationId: profile?.specialisation_id ?? "", phone: profile?.phone ?? "" }}
      />
    </div>
  );
}
