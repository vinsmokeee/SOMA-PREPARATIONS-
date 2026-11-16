import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft, ExternalLink, Lock } from "lucide-react";
import { StoryPracticeButton } from "@/components/student/ca-buttons";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import type { CaNote } from "@/lib/ai/current-affairs";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";

export const metadata: Metadata = { title: "Current affairs note" };

export default async function StoryPage({ params }: PageProps<"/dashboard/current-affairs/[id]">) {
  const { id } = await params;
  await requireUser(`/dashboard/current-affairs/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const { data: s } = await db.from("ca_items").select("id, title, summary, note, area, countries, verification, event_date, feature_date, published_on, ca_categories(name)").eq("id", id).maybeSingle();
  if (!s) {
    return (
      <div className="mx-auto max-w-xl rounded-xl border border-border p-8 text-center">
        <Lock className="mx-auto size-6 text-muted-foreground" aria-hidden />
        <p className="mt-3 font-semibold text-ink">This note is in the archive</p>
        <p className="mt-1 text-sm text-muted-foreground">The last 7 days are free. The full archive is part of the PE and PE + ME packages.</p>
        <Link href="/dashboard/current-affairs" className="mt-4 inline-block text-sm font-medium text-primary hover:underline">Back to today</Link>
      </div>
    );
  }
  const [{ data: sources }, { data: count }] = await Promise.all([
    db.rpc("ca_item_sources", { _item_id: id }),
    db.rpc("ca_question_count", { _item_id: id }),
  ]);
  const src = (sources ?? []) as { title: string; url: string; source: string; tier: string; published_at: string | null }[];
  const n = (s.note ?? null) as CaNote | null;
  const v = VERIFICATION_LABELS[s.verification];
  const cat = (s.ca_categories as unknown as { name: string } | null)?.name;

  return (
    <article className="mx-auto max-w-3xl">
      <Link href="/dashboard/current-affairs" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink"><ChevronLeft className="size-4" aria-hidden /> Current affairs</Link>
      <div className="mt-3 flex flex-wrap gap-2 text-xs">
        {s.area ? <Badge tone="solid">{AREA_LABELS[s.area]}</Badge> : null}
        {cat ? <Badge>{cat}</Badge> : null}
        {v ? <Badge tone={v.tone} title={v.help}>{v.label}</Badge> : null}
      </div>
      <h1 className="mt-3 font-serif text-3xl font-semibold leading-tight">{s.title}</h1>
      <p className="mt-2 text-sm text-muted-foreground">
        {s.feature_date ? `Published ${formatDate(s.feature_date)}` : null}{s.event_date ? ` · Event date ${formatDate(s.event_date)}` : ""}{s.countries?.length ? ` · ${s.countries.join(", ")}` : ""}
      </p>
      {s.summary ? <p className="mt-6 text-lg leading-relaxed text-ink">{s.summary}</p> : null}

      {n ? (
        <div className="mt-8 space-y-6">
          {n.key_facts.length ? (
            <section><h2 className="font-semibold text-ink">Key facts</h2>
              <ul className="mt-2 list-disc space-y-1.5 pl-5">{n.key_facts.map((f, i) => <li key={i}>{f.fact} <span className="text-xs text-muted-foreground">[{f.sources.join(", ")}]</span></li>)}</ul>
            </section>
          ) : null}
          {n.background ? <section><h2 className="font-semibold text-ink">Background</h2><p className="mt-2 leading-relaxed">{n.background}</p></section> : null}
          {n.why_it_matters ? <section><h2 className="font-semibold text-ink">Why it matters</h2><p className="mt-2 leading-relaxed">{n.why_it_matters}</p></section> : null}
          {n.bhutan_relevance ? <section><h2 className="font-semibold text-ink">Relevance to Bhutan</h2><p className="mt-2 leading-relaxed">{n.bhutan_relevance}</p></section> : null}
          {n.important_dates.length ? (
            <section><h2 className="font-semibold text-ink">Important dates</h2><ul className="mt-2 space-y-1 text-sm">{n.important_dates.map((d, i) => <li key={i}><span className="font-medium">{d.date}</span> — {d.what}</li>)}</ul></section>
          ) : null}
          {[...n.entities.organisations, ...n.entities.places, ...n.entities.people].length ? (
            <p className="text-sm text-muted-foreground"><span className="font-medium text-ink">Names to know:</span> {[...n.entities.organisations, ...n.entities.places, ...n.entities.people].join(" · ")}</p>
          ) : null}
        </div>
      ) : null}

      <div className="mt-8"><StoryPracticeButton id={s.id} count={Number(count ?? 0)} /></div>

      <section className="mt-10 rounded-xl border border-border p-5">
        <h2 className="font-semibold text-ink">Sources</h2>
        <ol className="mt-2 space-y-2 text-sm">
          {src.map((x, i) => (
            <li key={x.url}>
              <span className="text-muted-foreground">[{i + 1}]</span> <a href={x.url} target="_blank" rel="noopener noreferrer" className="font-medium text-primary hover:underline">{x.title} <ExternalLink className="inline size-3" aria-hidden /></a>
              <span className="text-muted-foreground"> — {x.source}{x.tier === "official" ? " (official)" : ""}{x.published_at ? `, ${formatDate(x.published_at)}` : ""}</span>
            </li>
          ))}
        </ol>
        <p className="mt-3 text-xs text-muted-foreground">Fact numbers refer to these sources. Soma writes its own notes; read the full reports at the original sources.</p>
      </section>
    </article>
  );
}
