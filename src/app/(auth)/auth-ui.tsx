import type { ReactNode } from "react";

export function AuthCard({ title, description, children, footer }: { title: string; description?: ReactNode; children: ReactNode; footer?: ReactNode }) {
  return (
    <div className="rounded-2xl border border-border bg-background p-6 shadow-[0_18px_50px_-30px_rgba(14,16,15,0.35)] sm:p-8">
      <h1 className="font-serif text-2xl font-semibold tracking-tight">{title}</h1>
      {description ? <p className="mt-2 text-[15px] leading-relaxed text-muted-foreground">{description}</p> : null}
      <div className="mt-6">{children}</div>
      {footer ? <div className="mt-6 border-t border-border pt-5 text-center text-sm text-muted-foreground">{footer}</div> : null}
    </div>
  );
}
