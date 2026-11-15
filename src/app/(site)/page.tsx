import Link from "next/link";
import { Suspense } from "react";
import {
  ArrowRight,
  BarChart3,
  BookOpenCheck,
  CheckCircle2,
  Clock3,
  FileCheck2,
  Flag,
  LayoutGrid,
  PenLine,
  Save,
  ShieldCheck,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Container, Eyebrow } from "@/components/ui/container";
import { siteConfig } from "@/config/site";
import { getPublicPackages } from "@/lib/data/public";
import { formatNu } from "@/lib/utils";

export default function HomePage() {
  return (
    <>
      <Hero />
      <Stages />
      <Simulation />
      <Learning />
      <Trust />
      <Suspense fallback={<PackagesTeaserSkeleton />}>
        <PackagesTeaser />
      </Suspense>
      <ClosingCta />
    </>
  );
}

function Hero() {
  return (
    <section className="border-b border-border">
      <Container className="grid items-center gap-12 py-14 sm:py-20 lg:grid-cols-[1.1fr_0.9fr] lg:py-24">
        <div>
          <Eyebrow>Bhutan Civil Service Examination preparation</Eyebrow>
          <h1 className="mt-4 font-serif text-[2.35rem] font-semibold leading-[1.1] tracking-tight sm:text-5xl lg:text-[3.4rem]">
            Prepare for the BCSE with structure, realism and clarity.
          </h1>
          <p className="mt-5 max-w-xl text-lg leading-relaxed text-muted-foreground">
            Soma prepares Bhutanese graduates for both stages of the BCSE: the Preliminary Examination (PE) and the Main
            Examination (ME). Sit realistic timed examinations, learn from clear explanations and see exactly where to
            improve.
          </p>
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Button asChild size="lg">
              <Link href="/register">
                Create a free account <ArrowRight aria-hidden />
              </Link>
            </Button>
            <Button asChild size="lg" variant="secondary">
              <Link href="/packages">View packages</Link>
            </Button>
          </div>
          <p className="mt-6 text-sm text-muted-foreground">
            {siteConfig.tagline} · Independent of the RCSC · No guaranteed results — just better preparation.
          </p>
        </div>
        <ExamPreview />
      </Container>
    </section>
  );
}

/** Static illustration of the examination interface (not interactive). */
function ExamPreview() {
  const palette = Array.from({ length: 20 }, (_, i) => i + 1);
  const answered = new Set([1, 2, 3, 4, 6, 7, 8, 10, 11]);
  const flagged = new Set([5, 9]);
  return (
    <figure aria-label="Illustration of the Soma examination interface" className="relative">
      <div className="rounded-2xl border border-border bg-background shadow-[0_24px_60px_-28px_rgba(14,16,15,0.35)]">
        <div className="flex items-center justify-between border-b border-border px-5 py-3">
          <div>
            <p className="text-xs font-medium uppercase tracking-wider text-muted-foreground">PE practice simulation</p>
            <p className="text-sm font-semibold text-ink">Question 12 of 20</p>
          </div>
          <div className="flex items-center gap-2 rounded-md bg-ink px-3 py-1.5 font-mono text-sm tabular-nums text-white">
            <Clock3 className="size-4" aria-hidden /> 00:41:26
          </div>
        </div>
        <div className="grid gap-5 p-5 sm:grid-cols-[1fr_auto]">
          <div>
            <p className="text-[15px] leading-relaxed text-ink">
              A train covers 180 km in 3 hours. At the same speed, how long will it take to cover 300 km?
            </p>
            <ul className="mt-4 space-y-2">
              {["4 hours", "5 hours", "5 hours 30 minutes", "6 hours"].map((o, i) => (
                <li
                  key={o}
                  className={
                    i === 1
                      ? "flex items-center gap-3 rounded-lg border border-primary bg-primary-soft px-3 py-2 text-sm text-ink"
                      : "flex items-center gap-3 rounded-lg border border-border px-3 py-2 text-sm text-foreground"
                  }
                >
                  <span
                    className={
                      i === 1
                        ? "flex size-6 items-center justify-center rounded-full bg-primary text-xs font-semibold text-white"
                        : "flex size-6 items-center justify-center rounded-full border border-border-strong text-xs font-semibold"
                    }
                  >
                    {"ABCD"[i]}
                  </span>
                  {o}
                </li>
              ))}
            </ul>
          </div>
          <div className="hidden sm:block">
            <p className="mb-2 text-xs font-medium text-muted-foreground">Questions</p>
            <div className="grid grid-cols-5 gap-1.5">
              {palette.map((n) => (
                <span
                  key={n}
                  className={
                    n === 12
                      ? "flex size-7 items-center justify-center rounded border-2 border-ink text-[11px] font-semibold"
                      : flagged.has(n)
                        ? "flex size-7 items-center justify-center rounded bg-warning-soft text-[11px] font-semibold text-warning"
                        : answered.has(n)
                          ? "flex size-7 items-center justify-center rounded bg-primary text-[11px] font-semibold text-white"
                          : "flex size-7 items-center justify-center rounded border border-border text-[11px] text-muted-foreground"
                  }
                >
                  {n}
                </span>
              ))}
            </div>
          </div>
        </div>
        <div className="flex items-center justify-between border-t border-border px-5 py-3 text-xs text-muted-foreground">
          <span className="inline-flex items-center gap-1.5">
            <Save className="size-3.5" aria-hidden /> Answers saved automatically
          </span>
          <span className="inline-flex items-center gap-1.5">
            <Flag className="size-3.5" aria-hidden /> 2 marked for review
          </span>
        </div>
      </div>
      <figcaption className="mt-3 text-center text-xs text-muted-foreground">Illustration of the Soma examination interface</figcaption>
    </figure>
  );
}

function Stages() {
  const stages = [
    {
      code: "PE",
      title: "Preliminary Examination",
      href: "/pe",
      body: "Objective-type questions common to all graduates, answered on an OMR sheet. Practise every tested area under timed conditions.",
      points: [
        "English and Dzongkha communication skills",
        "Logic, analytical ability and problem-solving",
        "Data interpretation",
        "General awareness and current affairs",
      ],
    },
    {
      code: "ME",
      title: "Main Examination",
      href: "/me",
      body: "Written papers by category. Practise answering under time pressure and compare your work with model answers and marking rubrics.",
      points: [
        "Administrative, Finance and PGDE papers",
        "Dzongkha, Technical and B.Ed. categories",
        "Short, long, essay and analytical answers",
        "Model answers, rubrics and expert feedback",
      ],
    },
  ];
  return (
    <section className="py-16 sm:py-20">
      <Container>
        <div className="max-w-2xl">
          <Eyebrow>Two stages, one plan</Eyebrow>
          <h2 className="mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">Preparation for both stages of the BCSE</h2>
          <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
            The BCSE is conducted by the Royal Civil Service Commission in two stages. Soma prepares you for each one
            differently, because they test different things.
          </p>
        </div>
        <div className="mt-10 grid gap-6 md:grid-cols-2">
          {stages.map((s) => (
            <Link
              key={s.code}
              href={s.href}
              className="group flex flex-col rounded-xl border border-border p-6 transition-colors hover:border-primary sm:p-8"
            >
              <div className="flex items-center gap-3">
                <span className="flex size-11 items-center justify-center rounded-lg bg-primary text-sm font-bold tracking-wide text-white">
                  {s.code}
                </span>
                <h3 className="font-serif text-2xl font-semibold">{s.title}</h3>
              </div>
              <p className="mt-4 leading-relaxed text-muted-foreground">{s.body}</p>
              <ul className="mt-5 space-y-2.5">
                {s.points.map((p) => (
                  <li key={p} className="flex gap-2.5 text-[15px] text-foreground">
                    <CheckCircle2 className="mt-0.5 size-4 shrink-0 text-primary" aria-hidden />
                    {p}
                  </li>
                ))}
              </ul>
              <span className="mt-6 inline-flex items-center gap-1.5 text-sm font-semibold text-primary">
                Explore {s.code} preparation <ArrowRight className="size-4 transition-transform group-hover:translate-x-0.5" aria-hidden />
              </span>
            </Link>
          ))}
        </div>
      </Container>
    </section>
  );
}

function Simulation() {
  const features = [
    { icon: Clock3, title: "Always-visible countdown", body: "A server-timed clock that keeps running if you refresh or lose connection, with automatic submission at the end." },
    { icon: LayoutGrid, title: "Question palette", body: "See answered, unanswered and flagged questions at a glance and move freely between them." },
    { icon: Flag, title: "Mark for review", body: "Flag questions to revisit and check them all on a final review screen before you submit." },
    { icon: Save, title: "Automatic saving", body: "Every answer is saved as you go. Interrupted sessions resume where you left off." },
    { icon: FileCheck2, title: "OMR-style practice", body: "Practise marking an answer sheet so the format feels familiar on examination day." },
    { icon: PenLine, title: "Written-paper mode", body: "A distraction-free writing space for ME papers with word counts and multi-question navigation." },
  ];
  return (
    <section className="border-y border-border bg-muted/60 py-16 sm:py-20">
      <Container>
        <div className="max-w-2xl">
          <Eyebrow>Realistic simulation</Eyebrow>
          <h2 className="mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">An examination room, not a quiz</h2>
          <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
            Soma&apos;s examination environment is built to feel like the real thing: clear instructions, a fixed time
            limit and a calm, focused interface.
          </p>
        </div>
        <div className="mt-10 grid gap-x-8 gap-y-8 sm:grid-cols-2 lg:grid-cols-3">
          {features.map((f) => (
            <div key={f.title}>
              <f.icon className="size-5 text-primary" aria-hidden />
              <h3 className="mt-3 text-base font-semibold">{f.title}</h3>
              <p className="mt-1.5 text-[15px] leading-relaxed text-muted-foreground">{f.body}</p>
            </div>
          ))}
        </div>
      </Container>
    </section>
  );
}

function Learning() {
  return (
    <section className="py-16 sm:py-20">
      <Container className="grid gap-12 lg:grid-cols-2 lg:items-center">
        <div>
          <Eyebrow>Learn from every attempt</Eyebrow>
          <h2 className="mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">Know exactly what to revise next</h2>
          <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
            After each examination you see your score, accuracy and time use, a full explanation for every question and a
            breakdown by subject and topic. Soma then points you to the practice that will help most.
          </p>
        </div>
        <ul className="grid gap-4 sm:grid-cols-2">
          {[
            { icon: BookOpenCheck, title: "Detailed explanations", body: "Understand why an answer is right — and why the others are not." },
            { icon: BarChart3, title: "Subject & topic analysis", body: "Spot weak areas early using your own results over time." },
            { icon: Clock3, title: "Time analysis", body: "See where you spend too long and practise pacing." },
            { icon: PenLine, title: "Model answers & rubrics", body: "For ME papers, compare your writing with clear marking criteria." },
          ].map((i) => (
            <li key={i.title} className="rounded-xl border border-border p-5">
              <i.icon className="size-5 text-primary" aria-hidden />
              <p className="mt-3 font-semibold text-ink">{i.title}</p>
              <p className="mt-1 text-sm leading-relaxed text-muted-foreground">{i.body}</p>
            </li>
          ))}
        </ul>
      </Container>
    </section>
  );
}

function Trust() {
  return (
    <section className="bg-ink py-16 text-white sm:py-20">
      <Container className="grid gap-10 lg:grid-cols-[1fr_1.2fr]">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[#9cc7ad]">Our standards</p>
          <h2 className="mt-3 font-serif text-3xl font-semibold tracking-tight text-white sm:text-4xl">Accuracy before quantity</h2>
          <p className="mt-4 text-lg leading-relaxed text-white/70">
            We would rather give you 300 carefully checked questions than thousands of unreliable ones.
          </p>
        </div>
        <ul className="grid gap-6 sm:grid-cols-2">
          {[
            ["Sourced official information", "Examination structure, papers and weightages are taken from official RCSC documents, and every page cites its source."],
            ["Human-verified content", "Every question is reviewed before publication. AI may assist with drafting, but nothing reaches students unverified."],
            ["Original practice questions", "Soma writes its own questions. Historical papers are used for research and only reproduced where permitted."],
            ["Honest estimates", "Readiness indicators are Soma estimates, never official assessments or guarantees of selection."],
          ].map(([title, body]) => (
            <li key={title} className="border-t border-white/15 pt-4">
              <p className="flex items-center gap-2 font-semibold text-white">
                <ShieldCheck className="size-4 text-[#9cc7ad]" aria-hidden /> {title}
              </p>
              <p className="mt-2 text-sm leading-relaxed text-white/70">{body}</p>
            </li>
          ))}
        </ul>
      </Container>
    </section>
  );
}

async function PackagesTeaser() {
  const result = await getPublicPackages();
  if (!result.ok || result.data.length === 0) return null;
  return (
    <section className="py-16 sm:py-20">
      <Container>
        <div className="flex flex-col justify-between gap-4 sm:flex-row sm:items-end">
          <div className="max-w-2xl">
            <Eyebrow>Packages</Eyebrow>
            <h2 className="mt-3 font-serif text-3xl font-semibold tracking-tight sm:text-4xl">Simple, one-time pricing</h2>
          </div>
          <Button asChild variant="secondary">
            <Link href="/packages">Compare packages</Link>
          </Button>
        </div>
        <div className="mt-8 grid gap-6 md:grid-cols-2">
          {result.data.map((p) => (
            <div key={p.id} className="flex flex-col rounded-xl border border-border p-6">
              <div className="flex items-start justify-between gap-4">
                <div>
                  <p className="font-serif text-xl font-semibold text-ink">{p.name}</p>
                  {p.tagline ? <p className="mt-1 text-sm text-muted-foreground">{p.tagline}</p> : null}
                </div>
                {p.status === "coming_soon" ? (
                  <span className="rounded-full bg-muted px-2.5 py-0.5 text-xs font-medium text-muted-foreground">Coming soon</span>
                ) : null}
              </div>
              <p className="mt-5 text-3xl font-semibold tracking-tight text-ink">{formatNu(p.price)}</p>
            </div>
          ))}
        </div>
      </Container>
    </section>
  );
}

function PackagesTeaserSkeleton() {
  return (
    <section className="py-16 sm:py-20" aria-hidden>
      <Container>
        <div className="h-8 w-64 rounded bg-muted" />
        <div className="mt-8 grid gap-6 md:grid-cols-2">
          <div className="h-36 rounded-xl bg-muted" />
          <div className="h-36 rounded-xl bg-muted" />
        </div>
      </Container>
    </section>
  );
}

function ClosingCta() {
  return (
    <section className="border-t border-border bg-primary-soft py-16">
      <Container className="flex flex-col items-start justify-between gap-6 md:flex-row md:items-center">
        <div className="max-w-xl">
          <h2 className="font-serif text-3xl font-semibold tracking-tight">Start preparing today</h2>
          <p className="mt-2 text-muted-foreground">
            Create a free account now. Free practice questions and sample examinations will appear in your dashboard as soon
            as they open.
          </p>
        </div>
        <div className="flex flex-col gap-3 sm:flex-row">
          <Button asChild size="lg">
            <Link href="/register">Create a free account</Link>
          </Button>
          <Button asChild size="lg" variant="secondary">
            <Link href="/practice">About free practice</Link>
          </Button>
        </div>
      </Container>
    </section>
  );
}
