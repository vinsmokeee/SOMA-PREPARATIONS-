import * as React from "react";
import { AlertTriangle, CheckCircle2, Info, XCircle } from "lucide-react";
import { cn } from "@/lib/utils";

const tones = {
  info: { cls: "border-[#d6e1ec] bg-info-soft", Icon: Info, icon: "text-[#2f5a85]" },
  success: { cls: "border-[#cfe2d5] bg-primary-soft", Icon: CheckCircle2, icon: "text-primary" },
  warning: { cls: "border-[#f0e0b8] bg-warning-soft", Icon: AlertTriangle, icon: "text-warning" },
  danger: { cls: "border-[#f1cfca] bg-danger-soft", Icon: XCircle, icon: "text-danger" },
} as const;

export function Alert({
  tone = "info",
  title,
  children,
  className,
}: {
  tone?: keyof typeof tones;
  title?: React.ReactNode;
  children?: React.ReactNode;
  className?: string;
}) {
  const t = tones[tone];
  return (
    <div role={tone === "danger" ? "alert" : "status"} className={cn("flex gap-3 rounded-lg border p-4 text-sm", t.cls, className)}>
      <t.Icon className={cn("mt-0.5 size-4 shrink-0", t.icon)} aria-hidden />
      <div className="flex flex-col gap-1 leading-relaxed text-foreground">
        {title ? <p className="font-semibold text-ink">{title}</p> : null}
        {children ? <div className="text-foreground/85">{children}</div> : null}
      </div>
    </div>
  );
}
