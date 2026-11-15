import type { Metadata } from "next";
import Link from "next/link";
import { CheckCircle2, Circle } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { Alert } from "@/components/ui/alert";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Administration" };

type Counts = Record<"students" | "staff" | "questions_published" | "questions_in_review" | "source_documents" | "messages_new" | "orders_awaiting", number>;

export default async function AdminOverview() {
  const user = await requirePermission("admin.access");
  const supabase = await createClient();
  const [{ data, error }, unverified] = await Promise.all([
    supabase.rpc("admin_overview_counts"),
    supabase.from("exam_papers").select("id", { count: "exact", head: true }).eq("verification_status", "unverified"),
  ]);
  const counts = (data ?? null) as Counts | null;

  const stats: [string, number | undefined, string?][] = [
    ["Students", counts?.students, "/admin/users"],
    ["Published questions", counts?.questions_published],
    ["Questions awaiting review", counts?.questions_in_review],
    ["Recorded RCSC documents", counts?.source_documents],
    ["New support messages", counts?.messages_new, "/admin/messages"],
    ["Payments awaiting verification", counts?.orders_awaiting],
  ];

  const checklist = [
    { done: true, label: "BCSE 2026 structure recorded from the official RCSC announcement", href: "/admin/exam-structure" },
    { done: (unverified.count ?? 0) === 0, label: "All examination papers verified against an RCSC source", href: "/admin/exam-structure" },
    { done: (counts?.questions_published ?? 0) > 0, label: "Review and publish the sample questions", href: "/admin/questions?status=awaiting_review" },
    { done: false, label: "Publish the sample examinations", href: "/admin/exams" },
    { done: false, label: "Upload the official Soma logo (see README → Branding)" },
    { done: false, label: "Confirm package access periods before sales open", href: "/admin/packages" },
    { done: false, label: "Approve the draft terms, privacy notice and disclaimer" },
  ];

  return (
    <>
      <PageTitle title={`Good day${user.fullName ? `, ${user.fullName.split(" ")[0]}` : ""}`} description="Overview of the Soma platform." />
      {error ? <Alert tone="danger" className="mb-6">Overview figures could not be loaded.</Alert> : null}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {stats.map(([label, value, href]) => {
          const body = (
            <Card className="h-full transition-colors hover:border-border-strong">
              <CardHeader>
                <p className="text-sm text-muted-foreground">{label}</p>
                <p className="text-3xl font-semibold tabular-nums text-ink">{value ?? "—"}</p>
              </CardHeader>
            </Card>
          );
          return href ? <Link key={label} href={href}>{body}</Link> : <div key={label}>{body}</div>;
        })}
      </div>
      <Card className="mt-8">
        <CardHeader>
          <CardTitle>Launch checklist</CardTitle>
        </CardHeader>
        <CardContent>
          <ul className="space-y-3">
            {checklist.map((c) => (
              <li key={c.label} className="flex items-start gap-3 text-[15px]">
                {c.done ? <CheckCircle2 className="mt-0.5 size-4 shrink-0 text-primary" aria-label="Done" /> : <Circle className="mt-0.5 size-4 shrink-0 text-subtle" aria-label="To do" />}
                {c.href ? <Link href={c.href} className="hover:text-primary">{c.label}</Link> : <span>{c.label}</span>}
              </li>
            ))}
          </ul>
        </CardContent>
      </Card>
    </>
  );
}
