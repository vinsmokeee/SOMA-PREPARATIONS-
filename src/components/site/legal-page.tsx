import { Alert } from "@/components/ui/alert";
import { Container, PageHeader } from "@/components/ui/container";

export function LegalPage({ title, updated, children }: { title: string; updated: string; children: React.ReactNode }) {
  return (
    <>
      <PageHeader eyebrow="Legal" title={title} description={`Last updated ${updated}`} />
      <Container className="max-w-3xl py-10 sm:py-14">
        <Alert tone="warning" title="Draft for legal review" className="mb-8">
          This text is a working draft prepared during development. It must be reviewed and approved by the business
          owner, with appropriate legal advice, before commercial launch.
        </Alert>
        <div className="space-y-6 text-[15px] leading-relaxed text-foreground [&_h2]:mt-8 [&_h2]:font-serif [&_h2]:text-xl [&_h2]:font-semibold [&_li]:ml-5 [&_li]:list-disc">
          {children}
        </div>
      </Container>
    </>
  );
}
