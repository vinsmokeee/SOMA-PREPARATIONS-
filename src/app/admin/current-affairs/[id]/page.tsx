import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft, ExternalLink } from "lucide-react";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { Badge } from "@/components/ui/badge";
import { Field, Input, Label, Select, Textarea } from "@/components/ui/input";
import { requirePermission } from "@/lib/auth/dal";
import type { CaNote } from "@/lib/ai/current-affairs";
import { STATUS_LABELS, STATUS_TONES } from "@/lib/admin/question-lookups";
import { AREA_LABELS, VERIFICATION_LABELS } from "@/lib/ca/labels";
import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/utils";
import { saveStoryAction, storyStatusAction } from "../actions";

export const metadata: Metadata = { title: "Current-affairs story" };

export default async function AdminStoryPage({ params }: PageProps<"/admin/current-affairs/[id]">) {
  const { id } = await params;
  await requirePermission("ca.manage", `/admin/current-affairs/${id}`);
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const db = await createClient();
  const { data: s } = await db.from("ca_items").select("*").eq("id", id).maybeSingle();
  if (!s) notFound();
  const [{ data: arts }, { data: qs }, { data: cats }] = await Promise.all([
    db.from("ca_articles").select("id, title, url, snippet, published_at, triage, relevance, ca_sources(name, tier)").eq("story_id", id).order("published_at"),
    db.from("questions").select("id, stem, question_type, status, auto_published").eq("ca_item_id", id).order("created_at"),
    db.from("ca_categories").select("id, name").order("sort_order"),
  ]);
  const n = (s.note ?? null) as CaNote | null;
  const v = VERIFICATION_LABELS[s.verification];
  const articles = (arts ?? []) as unknown as { id: string; title: string; url: string; snippet: string | null; published_at: string | null; triage: { kind?: string; developing?: boolean; sensitive?: boolean } | null; relevance: number | null; ca_sources: { name: string; tier: string } }[];

  return (
    <>
      <Link href="/admin/current-affairs?tab=stories" className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink"><ChevronLeft className="size-4" aria-hidden /> Stories</Link>
      <div className="mt-3">
        <PageTitle title={s.title} description={
          <span className="inline-flex flex-wrap items-center gap-2">
            <Badge tone={s.status === "published" ? "green" : s.pipeline_status === "held" ? "warning" : "neutral"}>{s.pipeline_status}</Badge>
            {s.area ? <Badge tone="solid">{AREA_LABELS[s.area]}</Badge> : null}
            {v ? <Badge tone={v.tone}>{v.label}</Badge> : null}
            {s.confidence ? <span>AI confidence {s.confidence}</span> : null}
            {s.auto_published ? <span>· published automatically</span> : s.reviewed_at ? <span>· reviewed {formatDate(s.reviewed_at)}</span> : null}
          </span>
        } />
      </div>
      {s.hold_reason ? <p className="mb-4 rounded-lg bg-warning-soft p-3 text-sm text-warning">Held: {s.hold_reason}</p> : null}
      {s.verification_notes ? <p className="mb-4 rounded-lg bg-muted p-3 text-sm">Source conflict: {s.verification_notes}</p> : null}

      <div className="grid gap-8 xl:grid-cols-[1fr_320px]">
        <div className="space-y-8">
          <section>
            <h2 className="font-semibold text-ink">Sources ({articles.length})</h2>
            <ol className="mt-2 space-y-3 text-sm">
              {articles.map((a, i) => (
                <li key={a.id} className="rounded-lg border border-border p-3">
                  <p><span className="text-muted-foreground">[{i + 1}]</span> <a href={a.url} target="_blank" rel="noopener noreferrer" className="font-medium text-primary hover:underline">{a.title} <ExternalLink className="inline size-3" aria-hidden /></a></p>
                  <p className="text-xs text-muted-foreground">{a.ca_sources.name} ({a.ca_sources.tier}) · {formatDate(a.published_at)} · relevance {a.relevance ?? "—"} · {a.triage?.kind ?? "—"}{a.triage?.developing ? " · developing" : ""}{a.triage?.sensitive ? " · sensitive" : ""}</p>
                  {a.snippet ? <p className="mt-1 line-clamp-3 text-xs">{a.snippet}</p> : null}
                </li>
              ))}
            </ol>
          </section>

          {n?.key_facts?.length ? (
            <section>
              <h2 className="font-semibold text-ink">Key facts (with sources)</h2>
              <ul className="mt-2 list-disc space-y-1 pl-5 text-sm">{n.key_facts.map((f, i) => <li key={i}>{f.fact} <span className="text-muted-foreground">[{f.sources.join(", ")}]</span></li>)}</ul>
            </section>
          ) : null}

          <section className="rounded-xl border border-border p-5">
            <h2 className="font-semibold text-ink">Edit the note</h2>
            <ActionForm action={saveStoryAction} submitLabel="Save note" className="mt-3">
              <input type="hidden" name="id" value={s.id} />
              <Field><Label htmlFor="t">Headline</Label><Input id="t" name="title" defaultValue={s.title} className="h-10" /></Field>
              <div className="grid gap-3 sm:grid-cols-2">
                <Field><Label htmlFor="ar">Area</Label><Select id="ar" name="area" defaultValue={s.area ?? "bhutan"} className="h-10"><option value="bhutan">Bhutan</option><option value="regional">Regional</option><option value="world">World</option></Select></Field>
                <Field><Label htmlFor="cat">Category</Label><Select id="cat" name="category_id" defaultValue={s.category_id ?? ""} className="h-10"><option value="">—</option>{(cats ?? []).map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}</Select></Field>
              </div>
              <Field><Label htmlFor="sum">Summary</Label><Textarea id="sum" name="summary" rows={4} defaultValue={s.summary ?? ""} /></Field>
              <Field><Label htmlFor="bg">Background</Label><Textarea id="bg" name="background" rows={3} defaultValue={n?.background ?? ""} /></Field>
              <Field><Label htmlFor="why">Why it matters</Label><Textarea id="why" name="why_it_matters" rows={3} defaultValue={n?.why_it_matters ?? ""} /></Field>
              <Field><Label htmlFor="rel">Relevance to Bhutan</Label><Textarea id="rel" name="bhutan_relevance" rows={3} defaultValue={n?.bhutan_relevance ?? ""} /></Field>
            </ActionForm>
          </section>
        </div>

        <aside className="space-y-6 xl:sticky xl:top-8 xl:self-start">
          <section className="rounded-xl border border-border p-4">
            <h2 className="font-semibold text-ink">Decision</h2>
            <div className="mt-3 space-y-3">
              {s.status !== "published" ? (
                <ActionForm action={storyStatusAction} submitLabel="Publish (I have checked it)">
                  <input type="hidden" name="id" value={s.id} /><input type="hidden" name="action" value="publish" />
                </ActionForm>
              ) : (
                <ActionForm action={storyStatusAction} submitLabel="Unpublish" variant="secondary" confirm="Unpublish this story and its questions?">
                  <input type="hidden" name="id" value={s.id} /><input type="hidden" name="action" value="unpublish" />
                  <Input name="note" placeholder="Reason (optional)" aria-label="Reason" className="h-10" />
                </ActionForm>
              )}
              {s.pipeline_status !== "rejected" ? (
                <ActionForm action={storyStatusAction} submitLabel="Reject" variant="danger" confirm="Reject this story?">
                  <input type="hidden" name="id" value={s.id} /><input type="hidden" name="action" value="reject" />
                  <Input name="note" placeholder="Reason (optional)" aria-label="Reason for rejection" className="h-10" />
                </ActionForm>
              ) : null}
            </div>
          </section>
          <section className="rounded-xl border border-border p-4 text-sm">
            <h2 className="font-semibold text-ink">Questions ({qs?.length ?? 0})</h2>
            {(qs ?? []).length === 0 ? <p className="mt-2 text-muted-foreground">None yet.</p> : (
              <ul className="mt-2 space-y-2">
                {(qs ?? []).map((q) => (
                  <li key={q.id}>
                    <Link href={`/admin/questions/${q.id}`} className="line-clamp-2 font-medium text-ink hover:text-primary">{q.stem}</Link>
                    <span className="text-xs text-muted-foreground"><Badge tone={STATUS_TONES[q.status]}>{STATUS_LABELS[q.status]}</Badge> {q.question_type}{q.auto_published ? " · auto" : ""}</span>
                  </li>
                ))}
              </ul>
            )}
          </section>
        </aside>
      </div>
    </>
  );
}
