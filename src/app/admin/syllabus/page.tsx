import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { ActionForm } from "@/components/app/action-form";
import { SelectField, TextField } from "@/components/app/fields";
import { Badge } from "@/components/ui/badge";
import { requirePermission } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";
import { createSubject, createTopic, setSubjectActive, setTopicActive } from "../actions";

export const metadata: Metadata = { title: "Subjects & topics" };

type Topic = { id: string; subject_id: string; parent_id: string | null; name: string; slug: string; is_active: boolean };
type Subject = { id: string; stage: "PE" | "ME"; name: string; slug: string; is_official: boolean; is_active: boolean; description: string | null };

export default async function SyllabusPage() {
  await requirePermission("syllabus.manage", "/admin/syllabus");
  const db = await createClient();
  const [subjects, topics] = await Promise.all([
    db.from("subjects").select("id, stage, name, slug, is_official, is_active, description").order("sort_order"),
    db.from("topics").select("id, subject_id, parent_id, name, slug, is_active").order("sort_order").order("name"),
  ]);
  const allTopics = (topics.data ?? []) as Topic[];

  return (
    <>
      <PageTitle
        title="Subjects & topics"
        description="Organise questions and analytics by subject, topic and subtopic. Subjects marked “Official” are named in an RCSC document; topics are Soma's own organisation."
      />
      {(["PE", "ME"] as const).map((stage) => (
        <section key={stage} className="mb-10">
          <h2 className="mb-3 text-lg font-semibold">{stage === "PE" ? "Preliminary Examination" : "Main Examination"}</h2>
          <div className="space-y-3">
            {((subjects.data ?? []) as Subject[]).filter((s) => s.stage === stage).map((s) => {
              const roots = allTopics.filter((t) => t.subject_id === s.id && !t.parent_id);
              return (
                <details key={s.id} className="group rounded-lg border border-border">
                  <summary className="flex cursor-pointer flex-wrap items-center gap-2 px-4 py-3">
                    <span className="font-semibold text-ink">{s.name}</span>
                    {s.is_official ? <Badge tone="green">Official</Badge> : <Badge>Soma</Badge>}
                    {!s.is_active ? <Badge tone="warning">Hidden</Badge> : null}
                    <span className="text-sm text-muted-foreground">{allTopics.filter((t) => t.subject_id === s.id).length} topics</span>
                  </summary>
                  <div className="space-y-5 border-t border-border p-4">
                    {roots.length === 0 ? <p className="text-sm text-muted-foreground">No topics yet.</p> : (
                      <ul className="space-y-2 text-sm">
                        {roots.map((t) => (
                          <li key={t.id}>
                            <TopicRow topic={t} />
                            <ul className="ml-5 mt-1 space-y-1 border-l border-border pl-3">
                              {allTopics.filter((c) => c.parent_id === t.id).map((c) => <li key={c.id}><TopicRow topic={c} /></li>)}
                            </ul>
                          </li>
                        ))}
                      </ul>
                    )}
                    <ActionForm action={createTopic} submitLabel="Add topic" className="rounded-md bg-muted/60 p-4">
                      <input type="hidden" name="subject_id" value={s.id} />
                      <div className="grid gap-3 sm:grid-cols-3">
                        <TextField name="name" label="Topic name" required />
                        <TextField name="slug" label="Short identifier" hint="e.g. reading-comprehension" required />
                        <SelectField name="parent_id" label="Subtopic of" defaultValue="" options={[{ value: "", label: "— Top-level topic —" }, ...roots.map((r) => ({ value: r.id, label: r.name }))]} />
                      </div>
                    </ActionForm>
                    <ActionForm key={String(s.is_active)} action={setSubjectActive} submitLabel={s.is_active ? "Hide subject" : "Show subject"} variant="secondary">
                      <input type="hidden" name="id" value={s.id} />
                      <input type="hidden" name="is_active" value={s.is_active ? "false" : "true"} />
                    </ActionForm>
                  </div>
                </details>
              );
            })}
          </div>
        </section>
      ))}
      <section className="rounded-lg border border-border p-4">
        <h2 className="mb-3 text-lg font-semibold">Add a Soma subject</h2>
        <ActionForm action={createSubject} submitLabel="Add subject">
          <div className="grid gap-3 sm:grid-cols-3">
            <SelectField name="stage" label="Stage" defaultValue="PE" options={[{ value: "PE", label: "PE" }, { value: "ME", label: "ME" }]} />
            <TextField name="name" label="Subject name" required />
            <TextField name="slug" label="Short identifier" required />
          </div>
        </ActionForm>
      </section>
    </>
  );
}

function TopicRow({ topic }: { topic: Topic }) {
  return (
    <div className="flex flex-wrap items-center gap-2">
      <span className={topic.is_active ? "text-ink" : "text-subtle line-through"}>{topic.name}</span>
      <code className="text-xs text-muted-foreground">{topic.slug}</code>
      <ActionForm key={String(topic.is_active)} action={setTopicActive} submitLabel={topic.is_active ? "Hide" : "Show"} variant="secondary" className="inline-flex space-y-0 [&_button]:h-7 [&_button]:px-2 [&_button]:text-xs">
        <input type="hidden" name="id" value={topic.id} />
        <input type="hidden" name="is_active" value={topic.is_active ? "false" : "true"} />
      </ActionForm>
    </div>
  );
}
