import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { requireUser } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { markNotificationsReadAction } from "../subscription/actions";

export const metadata: Metadata = { title: "Notifications" };

export default async function NotificationsPage() {
  await requireUser("/dashboard/notifications");
  const db = await createClient();
  const { data } = await db.from("notifications").select("id, title, body, link, read_at, created_at").order("created_at", { ascending: false }).limit(50);
  const unread = (data ?? []).filter((n) => !n.read_at).length;
  return (
    <>
      <PageTitle title="Notifications" description="Payments, subscription and security messages." />
      {unread ? <form action={markNotificationsReadAction} className="mb-4"><button type="submit" className="text-sm font-medium text-primary hover:underline">Mark all {unread} as read</button></form> : null}
      {(data ?? []).length === 0 ? <p className="text-sm text-muted-foreground">No notifications yet.</p> : (
        <ul className="divide-y divide-border rounded-xl border border-border">
          {(data ?? []).map((n) => (
            <li key={n.id} className={`p-4 text-sm ${n.read_at ? "" : "bg-primary-soft/40"}`}>
              <p className="font-medium text-ink">{n.title}</p>
              {n.body ? <p className="mt-0.5 text-muted-foreground">{n.body}</p> : null}
              <p className="mt-1 text-xs text-muted-foreground">{formatDate(n.created_at)}{n.link ? <> · <Link href={n.link} className="font-medium text-primary hover:underline">Open</Link></> : null}</p>
            </li>
          ))}
        </ul>
      )}
    </>
  );
}
