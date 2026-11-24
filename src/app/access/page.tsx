import type { Metadata } from "next";
import { AccessForm } from "./access-form";

export const metadata: Metadata = { title: "Private preview", robots: { index: false, follow: false } };
export const instant = false;

export default async function AccessPage({ searchParams }: PageProps<"/access">) {
  const sp = await searchParams;
  const next = typeof sp.next === "string" ? sp.next : "/";
  return (
    <main id="main" className="flex min-h-dvh items-center justify-center bg-muted/60 px-4">
      <div className="w-full max-w-sm rounded-xl border border-border bg-background p-6 shadow-sm">
        <p className="font-serif text-xl"><b>SOMA</b> Academy</p>
        <h1 className="mt-4 text-lg font-semibold">Private preview</h1>
        <p className="mt-1 text-sm text-muted-foreground">This site is not open to the public yet. Enter the access code to continue.</p>
        <AccessForm next={next} />
      </div>
    </main>
  );
}
