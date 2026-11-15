"use client";

import { useState } from "react";
import { Dialog } from "radix-ui";
import { Menu, X } from "lucide-react";
import { AppNav, type NavSection } from "./app-nav";

export function MobileAppNav({ sections, user }: { sections: NavSection[]; user: { name: string; email: string | null; roleLabel: string } }) {
  const [open, setOpen] = useState(false);
  return (
    <Dialog.Root open={open} onOpenChange={setOpen}>
      <Dialog.Trigger asChild>
        <button type="button" className="inline-flex size-10 items-center justify-center rounded-md hover:bg-muted" aria-label="Open navigation">
          <Menu className="size-5" />
        </button>
      </Dialog.Trigger>
      <Dialog.Portal>
        <Dialog.Overlay className="fixed inset-0 z-40 bg-ink/30" />
        <Dialog.Content className="fixed inset-y-0 left-0 z-50 flex w-[86%] max-w-xs flex-col bg-background shadow-xl focus:outline-none">
          <div className="flex h-16 items-center justify-between border-b border-border px-4">
            <Dialog.Title className="text-sm font-semibold text-ink">{user.name || "Navigation"}</Dialog.Title>
            <Dialog.Description className="sr-only">Dashboard navigation</Dialog.Description>
            <Dialog.Close className="inline-flex size-10 items-center justify-center rounded-md hover:bg-muted" aria-label="Close navigation">
              <X className="size-5" />
            </Dialog.Close>
          </div>
          <div className="flex-1 overflow-y-auto px-3 py-4">
            <AppNav sections={sections} onNavigate={() => setOpen(false)} />
          </div>
          <div className="border-t border-border p-4">
            <p className="text-xs text-muted-foreground">{user.email}</p>
            <form action="/auth/signout" method="post" className="mt-2">
              <button type="submit" className="text-sm font-medium text-ink">Sign out</button>
            </form>
          </div>
        </Dialog.Content>
      </Dialog.Portal>
    </Dialog.Root>
  );
}
