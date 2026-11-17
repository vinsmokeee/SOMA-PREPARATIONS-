import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { CaPracticeBox } from "@/components/student/ca-practice-box";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import type { CatalogueExam } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Current affairs" };

type TodayItem = { id: string; title: string; summary: string | null; area: string; category: string | null; verification: string; event_date: string | null };
type Today = { day: string; items: TodayItem[]; question: { id: string; stem: string; ca_item_id: string } | null };
type ArchiveRow = TodayItem & { feature_date: string | null; questions: number };

export default async function CurrentAffairsTodayPage() {
  await requireUser("/dashboard/current-affairs");
  const db = await createClient();
  const [{ data: today }, { data: recent }, { data: catalogue }, { data: paid }, { data: qotd }] = await Promise.all([
    db.rpc("ca_today"),
    db.rpc("ca_archive", {}),
    db.rpc("exam_catalogue", { _stage: "PE" }),
    db.rpc("has_any_package"),
    db.rpc("my_question_of_day"),
  ]);
  const q = qotd as { answered: boolean; correct: boolean; attempt_id: string | null } | null;
  const done = q?.answered && q.attempt_id ? { correct: q.correct, attemptId: q.attempt_id } : null;
  const t = (today ?? { day: "", items: [], question: null }) as Today;
  const archive = ((recent ?? []) as ArchiveRow[]).filter((r) => !t.items.some((i) => i.id === r.id));
  // Each area shows today's stories; if there are none yet, its latest earlier stories. Empty areas are hidden.
  const shown = new Set<string>();
  const areaItems = (a: string): (TodayItem & { feature_date?: string | null })[] => {
    const today = t.items.filter((i) => i.area === a);
    const list = today.length ? today : archive.filter((r) => r.area === a).slice(0, 3);
    list.forEach((i) => shown.add(i.id));
    return list;
  };
  const areas = (["bhutan", "regional", "world"] as const).map((a) => ({ area: a, items: areaItems(a) })).filter((x) => x.items.length);
  const latest = archive.filter((r) => !shown.has(r.id)).slice(0, 6);
  const assessments = ((catalogue ?? []) as CatalogueExam[]).filter((e) => /^ca-(weekly|monthly)-/.test(e.slug)).slice(0, 4);

  return (
    <>
      <PageTitle title="Current affairs" description={`Today${t.day ? `, ${formatDate(t.day)}` : ""} (Bhutan time). Short, verified updates with sources — Bhutan, South Asia and the world.`} />
      <div className="space-y-8">
        {/* Practice first: one coloured box, news below */}
        <CaPracticeBox question={t.question} paid={Boolean(paid)} assessments={assessments} done={done} />

        <h2 className="text-xl font-extrabold text-ink">Today’s news</h2>
        {areas.length ? areas.map(({ area, items }) => (
          <section key={area} aria-labelledby={`h-${area}`}>
            <h3 id={`h-${area}`} className="text-lg font-semibold">{AREA_LABELS[area]}</h3>
            <ul className="mt-3 space-y-3">{items.map((i) => <StoryCard key={i.id} i={i} date={"feature_date" in i ? i.feature_date : null} />)}</ul>
          </section>
        )) : <p className="text-sm text-muted-foreground">New stories appear here once they are verified. Please check back later today.</p>}

        {latest.length ? (
          <section aria-labelledby="h-recent">
            <h3 id="h-recent" className="text-lg font-semibold">More recent news</h3>
            <ul className="mt-3 space-y-3">{latest.map((i) => <StoryCard key={i.id} i={i} date={i.feature_date} />)}</ul>
          </section>
        ) : null}

        <p className="text-sm"><Link href="/dashboard/current-affairs/archive" className="font-medium text-primary hover:underline">Browse the archive by month, area and topic</Link></p>
        <p className="text-xs text-muted-foreground">Notes are written by Soma with AI assistance from the linked sources and published after automatic verification checks. Practice questions are Soma questions (AI-generated), not RCSC questions.</p>
      </div>
    </>
  );
}

function StoryCard({ i, date }: { i: TodayItem; date?: string | null }) {
  const v = VERIFICATION_LABELS[i.verification];
  return (
    <li className="rounded-xl border border-border p-4">
      <div className="flex flex-wrap items-center gap-2 text-xs">
        {date ? <span className="text-muted-foreground">{formatDate(date)}</span> : null}
        {i.category ? <Badge>{i.category}</Badge> : null}
        {v ? <Badge tone={v.tone}>{v.label}</Badge> : null}
      </div>
      <Link href={`/dashboard/current-affairs/${i.id}`} className="mt-2 block font-semibold text-ink hover:text-primary">{i.title}</Link>
      {i.summary ? <p className="mt-1 line-clamp-3 text-sm leading-relaxed text-muted-foreground">{i.summary}</p> : null}
    </li>
  );
}
