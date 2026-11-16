import type { Metadata } from "next";
import Link from "next/link";
import { PageTitle } from "@/components/app/app-shell";
import { CaPracticeForm, QotdButton } from "@/components/student/ca-buttons";
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
  const [{ data: today }, { data: recent }, { data: catalogue }, { data: paid }] = await Promise.all([
    db.rpc("ca_today"),
    db.rpc("ca_archive", {}),
    db.rpc("exam_catalogue", { _stage: "PE" }),
    db.rpc("has_any_package"),
  ]);
  const t = (today ?? { day: "", items: [], question: null }) as Today;
  const latest = ((recent ?? []) as ArchiveRow[]).filter((r) => !t.items.some((i) => i.id === r.id)).slice(0, 6);
  const assessments = ((catalogue ?? []) as CatalogueExam[]).filter((e) => /^ca-(weekly|monthly)-/.test(e.slug)).slice(0, 4);
  const byArea = (a: string) => t.items.filter((i) => i.area === a);

  return (
    <>
      <PageTitle title="Current affairs" description={`Today${t.day ? `, ${formatDate(t.day)}` : ""} (Bhutan time). Short, verified updates with sources — Bhutan, South Asia and the world.`} />
      <div className="space-y-8">
        <section className="rounded-xl border border-primary/30 bg-primary-soft/40 p-5" aria-labelledby="qotd">
          <h2 id="qotd" className="text-sm font-semibold uppercase tracking-wide text-primary">Question of the Day</h2>
          {t.question ? (
            <>
              <p className="mt-2 text-lg leading-relaxed text-ink">{t.question.stem}</p>
              <div className="mt-3"><QotdButton /></div>
            </>
          ) : <p className="mt-2 text-sm text-muted-foreground">Today’s question appears once today’s stories are verified.</p>}
        </section>

        {(["bhutan", "regional", "world"] as const).map((area) => (
          <section key={area} aria-labelledby={`h-${area}`}>
            <h2 id={`h-${area}`} className="text-lg font-semibold">{AREA_LABELS[area]} today</h2>
            {byArea(area).length ? <ul className="mt-3 space-y-3">{byArea(area).map((i) => <StoryCard key={i.id} i={i} />)}</ul>
              : <p className="mt-2 text-sm text-muted-foreground">No verified {AREA_LABELS[area].toLowerCase()} item yet today.</p>}
          </section>
        ))}

        {latest.length ? (
          <section aria-labelledby="h-recent">
            <h2 id="h-recent" className="text-lg font-semibold">Earlier this week</h2>
            <ul className="mt-3 space-y-3">{latest.map((i) => <StoryCard key={i.id} i={i} date={i.feature_date} />)}</ul>
          </section>
        ) : null}

        <div className="grid gap-4 md:grid-cols-2">
          <section className="rounded-xl border border-border p-5">
            <h2 className="font-semibold text-ink">Practise current affairs</h2>
            <p className="mt-1 text-sm text-muted-foreground">Questions chosen for you: this week’s important stories first, then your weaker areas.</p>
            <div className="mt-3"><CaPracticeForm locked={!paid} /></div>
          </section>
          <section className="rounded-xl border border-border p-5">
            <h2 className="font-semibold text-ink">Weekly Challenge and Monthly Assessment</h2>
            {assessments.length ? (
              <ul className="mt-2 space-y-2 text-sm">{assessments.map((e) => <li key={e.id}><Link href={`/dashboard/exams/${e.slug}`} className="font-medium text-primary hover:underline">{e.title}</Link> <span className="text-muted-foreground">· {e.question_count} questions</span></li>)}</ul>
            ) : <p className="mt-2 text-sm text-muted-foreground">The first Weekly Challenge appears after a full week of verified stories.</p>}
          </section>
        </div>

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
