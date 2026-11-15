import * as React from "react";
import { cn } from "@/lib/utils";

export function Container({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) {
  return <div className={cn("mx-auto w-full max-w-6xl px-4 sm:px-6 lg:px-8", className)} {...props} />;
}

export function Eyebrow({ className, ...props }: React.HTMLAttributes<HTMLParagraphElement>) {
  return <p className={cn("text-xs font-semibold uppercase tracking-[0.14em] text-primary", className)} {...props} />;
}

export function PageHeader({
  eyebrow,
  title,
  description,
  children,
}: {
  eyebrow?: string;
  title: string;
  description?: React.ReactNode;
  children?: React.ReactNode;
}) {
  return (
    <section className="border-b border-border bg-muted/60">
      <Container className="py-12 sm:py-16">
        {eyebrow ? <Eyebrow>{eyebrow}</Eyebrow> : null}
        <h1 className="mt-3 max-w-3xl font-serif text-3xl font-semibold leading-tight tracking-tight sm:text-[2.6rem]">
          {title}
        </h1>
        {description ? (
          <div className="mt-4 max-w-2xl text-base leading-relaxed text-muted-foreground sm:text-lg">{description}</div>
        ) : null}
        {children ? <div className="mt-6">{children}</div> : null}
      </Container>
    </section>
  );
}
