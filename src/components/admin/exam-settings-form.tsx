import { ActionForm } from "@/components/app/action-form";
import { AreaField, SelectField, TextField } from "@/components/app/fields";
import { saveExam } from "@/app/admin/exams/actions";

export type ExamSettings = {
  id: string | null;
  title: string;
  slug: string;
  description: string | null;
  instructions: string | null;
  stage: "PE" | "ME";
  kind: string;
  cycle_id: string | null;
  paper_id: string | null;
  category_id: string | null;
  duration_minutes: number;
  negative_mark_per_wrong: number;
  omr_mode: boolean;
  is_free: boolean;
  shuffle_questions: boolean;
  updated_at?: string;
};

export type ExamLookups = {
  cycles: { id: string; name: string }[];
  papers: { id: string; stage: string; title: string }[];
  categories: { id: string; name: string }[];
};

export function ExamSettingsForm({ exam, lookups }: { exam: ExamSettings; lookups: ExamLookups }) {
  return (
    <ActionForm key={exam.updated_at ?? "new"} action={saveExam} submitLabel={exam.id ? "Save settings" : "Create examination"}>
      <input type="hidden" name="id" value={exam.id ?? ""} />
      <div className="grid gap-4 sm:grid-cols-2">
        <TextField name="title" label="Title" defaultValue={exam.title} required />
        <TextField name="slug" label="Web address (slug)" defaultValue={exam.slug} hint="e.g. pe-sample-1" required />
      </div>
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <SelectField name="stage" label="Stage" defaultValue={exam.stage} options={[{ value: "PE", label: "PE" }, { value: "ME", label: "ME" }]} />
        <SelectField
          name="kind"
          label="Type"
          defaultValue={exam.kind}
          options={[
            { value: "sample", label: "Free sample" },
            { value: "mock", label: "Full mock" },
            { value: "practice", label: "Practice set" },
            { value: "revision", label: "Revision test" },
            { value: "historical", label: "Historical paper" },
          ]}
        />
        <TextField type="number" name="duration_minutes" label="Duration (minutes)" defaultValue={exam.duration_minutes} required />
        <TextField type="number" step="0.01" name="negative_mark_per_wrong" label="Negative mark per wrong answer" defaultValue={exam.negative_mark_per_wrong} hint="0 = none" />
      </div>
      <div className="grid gap-4 sm:grid-cols-3">
        <SelectField name="cycle_id" label="Exam cycle" defaultValue={exam.cycle_id ?? ""} options={[{ value: "", label: "— None —" }, ...lookups.cycles.map((c) => ({ value: c.id, label: c.name }))]} />
        <SelectField name="paper_id" label="Paper" defaultValue={exam.paper_id ?? ""} options={[{ value: "", label: "— None —" }, ...lookups.papers.map((p) => ({ value: p.id, label: `${p.stage} · ${p.title}` }))]} />
        <SelectField name="category_id" label="ME category" defaultValue={exam.category_id ?? ""} options={[{ value: "", label: "— All —" }, ...lookups.categories.map((c) => ({ value: c.id, label: c.name }))]} />
      </div>
      <AreaField name="description" label="Short description (shown in the list)" defaultValue={exam.description} />
      <AreaField name="instructions" label="Paper-specific instructions (shown before starting)" defaultValue={exam.instructions} rows={4} />
      <div className="flex flex-wrap gap-6 text-sm">
        <label className="flex items-center gap-2"><input type="checkbox" name="is_free" defaultChecked={exam.is_free} className="size-4 accent-[var(--primary)]" /> Free for all registered students</label>
        <label className="flex items-center gap-2"><input type="checkbox" name="omr_mode" defaultChecked={exam.omr_mode} className="size-4 accent-[var(--primary)]" /> OMR answer-sheet practice</label>
        <label className="flex items-center gap-2"><input type="checkbox" name="shuffle_questions" defaultChecked={exam.shuffle_questions} className="size-4 accent-[var(--primary)]" /> Shuffle question order per attempt</label>
      </div>
    </ActionForm>
  );
}
