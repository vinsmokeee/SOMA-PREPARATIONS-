import type { Metadata } from "next";
import { Container, PageHeader } from "@/components/ui/container";
import { siteConfig } from "@/config/site";
import { ContactForm } from "./contact-form";

export const metadata: Metadata = {
  title: "Contact and support",
  description: "Contact SOMA Academy for help with your account, payments or content.",
};

export default function ContactPage() {
  return (
    <>
      <PageHeader eyebrow="Contact & support" title="How can we help?" description="Send us a message and we will reply by email. For questions about official BCSE rules, registration or results, please contact the RCSC directly." />
      <Container className="grid gap-12 py-12 sm:py-16 lg:grid-cols-[1.4fr_1fr]">
        <ContactForm />
        <aside className="space-y-6 text-[15px] leading-relaxed">
          <div className="rounded-xl border border-border p-6">
            <p className="font-semibold text-ink">Before you write</p>
            <ul className="mt-3 list-disc space-y-2 pl-5 text-muted-foreground marker:text-primary">
              <li>For payment questions, include your order reference.</li>
              <li>To report a content error, include the examination name and question number.</li>
              <li>Never send passwords, PINs or banking details.</li>
            </ul>
          </div>
          {siteConfig.contact.email ? (
            <p className="text-muted-foreground">
              Email: <a className="font-medium text-primary" href={`mailto:${siteConfig.contact.email}`}>{siteConfig.contact.email}</a>
            </p>
          ) : null}
        </aside>
      </Container>
    </>
  );
}
