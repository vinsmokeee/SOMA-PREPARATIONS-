"use client";

import Link from "next/link";
import { useState } from "react";
import { Dialog } from "radix-ui";
import { Menu, X } from "lucide-react";
import { mainNav } from "@/config/site";
import { AccountLink } from "./account-link";

export function MobileNav() {
  const [open, setOpen] = useState(false);
  const close = () => setOpen(false);
  return (
    <Dialog.Root open={open} onOpenChange={setOpen}>
      <Dialog.Trigger asChild>
        <button
          type="button"
          className="inline-flex size-10 items-center justify-center rounded-md text-ink hover:bg-muted lg:hidden"
          aria-label="Open menu"
        >
          <Menu className="size-5" />
        </button>
      </Dialog.Trigger>
      <Dialog.Portal>
        <Dialog.Overlay className="fixed inset-0 z-40 bg-ink/30" />
        <Dialog.Content className="fixed inset-y-0 right-0 z-50 flex w-[86%] max-w-sm flex-col bg-background shadow-xl focus:outline-none">
          <div className="flex h-16 items-center justify-between border-b border-border px-4">
            <Dialog.Title className="font-serif text-lg font-semibold text-ink">Menu</Dialog.Title>
            <Dialog.Description className="sr-only">Site navigation</Dialog.Description>
            <Dialog.Close className="inline-flex size-10 items-center justify-center rounded-md hover:bg-muted" aria-label="Close menu">
              <X className="size-5" />
            </Dialog.Close>
          </div>
          <nav className="flex flex-1 flex-col overflow-y-auto px-2 py-3" aria-label="Mobile">
            {[...mainNav, { href: "/samples", label: "Sample examinations" }, { href: "/resources", label: "Study resources" }, { href: "/about", label: "About Soma" }, { href: "/faq", label: "FAQ" }, { href: "/contact", label: "Contact & support" }].map((item) => (
              <Link key={item.href} href={item.href} onClick={close} className="rounded-md px-3 py-3 text-[15px] font-medium text-ink hover:bg-muted">
                {item.label}
              </Link>
            ))}
          </nav>
          <div className="border-t border-border p-4">
            <AccountLink onNavigate={close} stacked />
          </div>
        </Dialog.Content>
      </Dialog.Portal>
    </Dialog.Root>
  );
}
