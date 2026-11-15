import { useId } from "react";
import { Field, FieldHint, Input, Label, Select, Textarea } from "@/components/ui/input";

type Value = string | number | null | undefined;

export function TextField({ name, label, defaultValue, type = "text", step, hint, required }: { name: string; label: string; defaultValue?: Value; type?: string; step?: string; hint?: string; required?: boolean }) {
  const id = `${name}-${useId()}`;
  return (
    <Field>
      <Label htmlFor={id}>{label}</Label>
      <Input id={id} name={name} type={type} step={step} defaultValue={defaultValue ?? ""} required={required} className="h-10" />
      {hint ? <FieldHint>{hint}</FieldHint> : null}
    </Field>
  );
}

export function AreaField({ name, label, defaultValue, rows = 2, hint }: { name: string; label: string; defaultValue?: Value; rows?: number; hint?: string }) {
  const id = `${name}-${useId()}`;
  return (
    <Field>
      <Label htmlFor={id}>{label}</Label>
      <Textarea id={id} name={name} defaultValue={defaultValue ?? ""} rows={rows} className="min-h-16" />
      {hint ? <FieldHint>{hint}</FieldHint> : null}
    </Field>
  );
}

export function SelectField({ name, label, defaultValue, options }: { name: string; label: string; defaultValue?: string; options: { value: string; label: string }[] }) {
  const id = `${name}-${useId()}`;
  return (
    <Field>
      <Label htmlFor={id}>{label}</Label>
      <Select id={id} name={name} defaultValue={defaultValue} className="h-10">
        {options.map((o) => <option key={o.value} value={o.value}>{o.label}</option>)}
      </Select>
    </Field>
  );
}

export const VERIFICATION_OPTIONS = [
  { value: "official_verified", label: "Checked against RCSC source" },
  { value: "unverified", label: "Awaiting verification" },
  { value: "superseded", label: "Superseded" },
];
