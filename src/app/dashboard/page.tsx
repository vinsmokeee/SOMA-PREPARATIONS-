import type { Metadata } from "next";
import { Alert } from "@/components/ui/alert";
import { HomeView } from "@/components/student/home-view";
import { requireUser } from "@/lib/auth/dal";
import { accuracy } from "@/lib/analytics";
import { loadLearningData } from "@/lib/analytics-server";
import { createClient } from "@/lib/supabase/server";
import type { TrainingData } from "@/lib/training/model";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Home" };

const NOTICES: Record<string, { tone: "success" | "warning"; text: string }> = {
  forbidden: { tone: "warning", text: "You do not have access to that area." },
  "password-updated": { tone: "success", text: "Your password has been updated." },
};

export default async function DashboardPage({ searchParams }: PageProps<"/dashboard">) {
  const user = await requireUser();
  const params = await searchParams;
  const notice = typeof params.notice === "string" ? NOTICES[params.notice] : undefined;
  const welcome = params.welcome === "1";

  const supabase = await createClient();
  const [entitlements, learning, profile, unread, training] = await Promise.all([
    supabase.from("entitlements").select("id, ends_at, revoked_at, status, packages(name)").is("revoked_at", null).eq("status", "active").or(`ends_at.is.null,ends_at.gt.${new Date().toISOString()}`),
    loadLearningData(),
    supabase.from("profiles").select("onboarded_at").eq("id", user.id).maybeSingle(),
    supabase.from("notifications").select("id", { count: "exact", head: true }).is("read_at", null),
    supabase.rpc("my_training"),
  ]);
  const perf = learning.performance;
  const access = (entitlements.data ?? []) as unknown as { ends_at: string | null; packages: { name: string } | null }[];
  const pe = perf?.by_subject.filter((s) => s.stage === "PE") ?? [];
  const peAnswered = pe.reduce((n, s) => n + s.answered, 0);
  const peCorrect = pe.reduce((n, s) => n + s.correct, 0);

  return (
    <div className="mx-auto max-w-2xl">
      {notice ? <Alert tone={notice.tone} className="mb-4">{notice.text}</Alert> : null}
      {welcome ? <Alert tone="success" title="Your account is ready" className="mb-4">Start with today&apos;s plan below.</Alert> : null}
      <HomeView
        d={{
          firstName: user.fullName.split(" ")[0] ?? "",
          training: (training.data ?? null) as TrainingData | null,
          unread: unread.count ?? 0,
          needsOnboarding: Boolean(profile.data && !profile.data.onboarded_at),
          access: access.length
            ? access.map((e) => `${e.packages?.name ?? "Package"}${e.ends_at ? ` until ${formatDate(e.ends_at)}` : ""}`).join(" · ")
            : null,
          pe: { answered: peAnswered, accuracy: peAnswered ? accuracy(peCorrect, peAnswered) : null },
          me: { answered: 0, written: perf?.totals.written_answers ?? 0 },
        }}
      />
    </div>
  );
}
