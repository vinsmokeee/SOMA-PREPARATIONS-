import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { SelectField } from "@/components/app/fields";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { CONTACT_TOPICS } from "@/lib/validation/contact";
import { formatDate } from "@/lib/utils";
import { setMessageStatus } from "../actions";

export const metadata: Metadata = { title: "Support messages" };

const STATUS = [
  { value: "new", label: "New" },
  { value: "in_progress", label: "In progress" },
  { value: "resolved", label: "Resolved" },
  { value: "spam", label: "Spam" },
];

export default async function MessagesPage() {
  await requirePermission("support.manage", "/admin/messages");
  const db = await createClient();
  const { data } = await db.from("contact_messages").select("*").order("created_at", { ascending: false }).limit(100);
  const rows = data ?? [];
  return (
    <>
      <PageTitle title="Support messages" description="Messages sent through the contact form. Reply by email; update the status to keep track." />
      {rows.length === 0 ? <p className="text-sm text-muted-foreground">No messages yet.</p> : null}
      <ul className="space-y-3">
        {rows.map((m) => (
          <li key={m.id} className="rounded-lg border border-border p-4">
            <div className="flex flex-wrap items-center gap-2 text-sm">
              <span className="font-semibold text-ink">{m.name}</span>
              <a href={`mailto:${m.email}`} className="text-primary hover:underline">{m.email}</a>
              <Badge>{CONTACT_TOPICS[m.topic as keyof typeof CONTACT_TOPICS] ?? m.topic}</Badge>
              <Badge tone={m.status === "new" ? "warning" : m.status === "resolved" ? "green" : "neutral"}>{String(m.status).replace("_", " ")}</Badge>
              <span className="ml-auto text-xs text-muted-foreground">{formatDate(m.created_at)}</span>
            </div>
            <p className="mt-3 whitespace-pre-wrap text-[15px] leading-relaxed text-foreground">{m.message}</p>
            <ActionForm key={`${m.status}-${m.handled_at}`} action={setMessageStatus} submitLabel="Update" variant="secondary" className="mt-4 flex flex-wrap items-end gap-3 space-y-0">
              <input type="hidden" name="id" value={m.id} />
              <div className="w-44"><SelectField name="status" label="Status" defaultValue={m.status} options={STATUS} /></div>
            </ActionForm>
          </li>
        ))}
      </ul>
    </>
  );
}
