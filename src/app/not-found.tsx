import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function NotFound() {
  return (
    <main id="main" className="flex flex-1 flex-col items-center justify-center px-4 py-24 text-center">
      <p className="text-sm font-semibold uppercase tracking-[0.14em] text-primary">404</p>
      <h1 className="mt-3 font-serif text-3xl font-semibold">Page not found</h1>
      <p className="mt-3 max-w-md text-muted-foreground">The page you are looking for does not exist or has moved.</p>
      <Button asChild className="mt-8"><Link href="/">Go to the home page</Link></Button>
    </main>
  );
}
