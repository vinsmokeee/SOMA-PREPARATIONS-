"use client";

import { useActionState, useState } from "react";
import { createPermission } from "@/app/admin/papers/actions";
import type { ActionState } from "@/components/app/action-form";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Field, FieldHint, Input, Label, Textarea } from "@/components/ui/input";
import { getBrowserClient } from "@/lib/supabase/client";

export function PermissionForm() {
  const [state, action, pending] = useActionState<ActionState, FormData>(createPermission, { status: "idle" });
  const [letterPath, setLetterPath] = useState("");
  const [letterMsg, setLetterMsg] = useState<string | null>(null);

  const uploadLetter = async (file: File | undefined) => {
    if (!file) return;
    const supabase = getBrowserClient();
    if (!supabase) return;
    if (file.size > 25 * 1024 * 1024) return setLetterMsg("The file is larger than 25 MB.");
    setLetterMsg("Uploading…");
    const path = `permissions/${crypto.randomUUID()}/${file.name.replace(/[^\w.\- ]+/g, "").replace(/\s+/g, "-").slice(0, 120) || "letter.pdf"}`;
    const { error } = await supabase.storage.from("source-documents").upload(path, file, { contentType: file.type || "application/pdf" });
    if (error) return setLetterMsg(`Upload failed: ${error.message}`);
    setLetterPath(path);
    setLetterMsg("Letter attached.");
  };

  if (state.status === "success") return <Alert tone="success" title="Permission recorded">Next, apply it to the matching past papers from the list below.</Alert>;

  return (
    <form action={action} className="space-y-4">
      {state.status === "error" ? <Alert tone="danger" title={state.message}>{state.fieldErrors ? <ul className="list-disc pl-5">{Object.values(state.fieldErrors).map((m) => <li key={m}>{m}</li>)}</ul> : null}</Alert> : null}
      <div className="grid gap-4 sm:grid-cols-2">
        <Field><Label htmlFor="p-title">Title</Label><Input id="p-title" name="title" defaultValue="RCSC permission to use past BCSE papers" required className="h-10" /></Field>
        <Field><Label htmlFor="p-by">Granted by</Label><Input id="p-by" name="granted_by" defaultValue="Royal Civil Service Commission" required className="h-10" /></Field>
        <Field><Label htmlFor="p-ref">Letter reference number</Label><Input id="p-ref" name="reference_number" className="h-10" /></Field>
        <Field><Label htmlFor="p-on">Date granted</Label><Input id="p-on" name="granted_on" type="date" className="h-10" /></Field>
        <Field><Label htmlFor="p-from">Covers papers from (year)</Label><Input id="p-from" name="years_from" type="number" defaultValue="2010" className="h-10" /></Field>
        <Field><Label htmlFor="p-to">to (year)</Label><Input id="p-to" name="years_to" type="number" className="h-10" /></Field>
      </div>
      <label className="flex items-start gap-2 text-sm">
        <input type="checkbox" name="allows_reproduction" className="mt-0.5 size-4 accent-[var(--primary)]" />
        <span>Soma may show the original questions to students (reproduction is permitted)</span>
      </label>
      <Field>
        <Label htmlFor="p-scope">What the permission covers</Label>
        <Textarea id="p-scope" name="scope" rows={3} required placeholder="e.g. Use of past BCSE PE and ME question papers from 2010 onwards for practice on the Soma platform." />
      </Field>
      <Field>
        <Label htmlFor="p-cond">Conditions</Label>
        <Textarea id="p-cond" name="conditions" rows={2} placeholder="e.g. Credit the RCSC; do not alter questions." />
      </Field>
      <Field>
        <Label htmlFor="p-attr">Credit line shown to students</Label>
        <Input id="p-attr" name="attribution_text" className="h-10" placeholder="Reproduced with permission of the Royal Civil Service Commission." />
        <FieldHint>Shown on every reproduced past paper.</FieldHint>
      </Field>
      <Field>
        <Label htmlFor="p-letter">Copy of the permission letter (PDF or photo)</Label>
        <input id="p-letter" type="file" accept="application/pdf,image/png,image/jpeg" onChange={(e) => uploadLetter(e.target.files?.[0])} className="text-sm" />
        {letterMsg ? <FieldHint>{letterMsg}</FieldHint> : null}
        <input type="hidden" name="letter_storage_path" value={letterPath} />
      </Field>
      <Button type="submit" disabled={pending}>{pending ? "Saving…" : "Record permission"}</Button>
    </form>
  );
}
