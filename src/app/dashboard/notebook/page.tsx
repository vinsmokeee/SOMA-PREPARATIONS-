import type { Metadata } from "next";
import { Notebook, type Note, type NotebookPaper } from "@/components/student/notebook";
import { requireUser } from "@/lib/auth/dal";
import { pageStage } from "@/lib/student/default-stage";
import { createClient } from "@/lib/supabase/server";

export const metadata: Metadata = { title: "Your notebook" };

export default async function NotebookPage({ searchParams }: PageProps<"/dashboard/notebook">) {
  const user = await requireUser("/dashboard/notebook");
  const sp = await searchParams;
  const db = await createClient();
  const stage = await pageStage(db, user.id, sp.stage);
  const [{ data: notes }, { data: progress }] = await Promise.all([
    db.rpc("my_notebook", { _stage: stage }),
    stage === "ME" ? db.rpc("my_me_progress") : Promise.resolve({ data: [] }),
  ]);
  const papers = ((progress ?? []) as { id: string; number: number | null; title: string }[]).map((p): NotebookPaper => ({ id: p.id, number: p.number, title: p.title }));
  const paperId = typeof sp.paper === "string" && /^[0-9a-f-]{36}$/i.test(sp.paper) ? sp.paper : null;
  return <Notebook stage={stage} notes={(notes ?? []) as Note[]} papers={papers} paperId={paperId} />;
}
