import Link from "next/link";
import { ArrowRight, BarChart3, Check, ClipboardCheck, Crown, DoorOpen, Flame, Lightbulb, Lock, Newspaper, PenLine, PencilLine, PlayCircle } from "lucide-react";
import { chooseExamAction, startFreeAction, setMeEntryAction } from "@/app/dashboard/exam-actions";
import { StartButton } from "@/components/training/start-button";
import { TodayPlan } from "@/components/training/today-plan";
import { itemAction, type TrainingData } from "@/lib/training/model";
import { cn } from "@/lib/utils";
import { WhyPremium } from "./exam-info";
import { FreeLimitNote, MockCta } from "@/components/exam/mock-cta";
import { MeOverall, type MeProgressPaper } from "./paper-home";

type Stage = "PE" | "ME";
const STAGE_INFO: Record<Stage, { name: string; full: string; gradient: string; blurb: string }> = {
  PE: { name: "PE", full: "Preliminary Examination", gradient: "from-amber-400 via-orange-500 to-orange-700", blurb: "Multiple-choice practice and mock tests" },
  ME: { name: "ME", full: "Main Examination", gradient: "from-rose-500 via-[#9b2c4b] to-[#5b1530]", blurb: "Written answers and papers for your entry" },
};

// ---------------------------------------------------------------------------
// 1. Choose PE or ME
// ---------------------------------------------------------------------------
export function ExamChooser({ firstName, status }: { firstName: string; status: Record<Stage, string | null> }) {
  return (
    <div className="mx-auto max-w-lg space-y-6">
      <div>
        <p className="text-sm font-medium text-muted-foreground">Kuzuzangpo la{firstName ? `, ${firstName}` : ""}</p>
        <h1 className="text-2xl font-extrabold tracking-tight text-ink">Which exam are you preparing for?</h1>
      </div>
      <div className="grid gap-4">
        {(["PE", "ME"] as const).map((s) => (
          <form key={s} action={chooseExamAction}>
          <input type="hidden" name="stage" value={s} />
          <button type="submit"
            className={cn("relative flex min-h-40 w-full flex-col justify-between overflow-hidden rounded-3xl bg-gradient-to-br p-6 text-left text-white shadow-xl transition active:scale-[0.98]", STAGE_INFO[s].gradient)}>
            <span className="absolute -right-8 -top-8 size-36 rounded-full bg-white/10" aria-hidden />
            <span className="relative">
              <span className="block text-4xl font-black">{STAGE_INFO[s].name}</span>
              <span className="block text-base font-semibold text-white/90">{STAGE_INFO[s].full}</span>
              <span className="mt-1 block text-sm text-white/80">{STAGE_INFO[s].blurb}</span>
            </span>
            <span className="relative mt-4 flex items-center justify-between">
              <span className="rounded-full bg-white/20 px-3 py-1 text-xs font-bold">{status[s] ?? "Not started"}</span>
              <ArrowRight className="size-6" aria-hidden />
            </span>
          </button>
          </form>
        ))}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// 2. Choose Free or Premium
// ---------------------------------------------------------------------------
export type PackageInfo = { slug: string; name: string; price: number; accessDays: number | null; features: string[]; available: boolean } | null;

export function PackageChoice({ stage, entryLabel, pkg, free, onFree = false }: {
  stage: Stage; entryLabel?: string | null; pkg: PackageInfo; free: string[];
  /** The student already uses Free and came here to upgrade. */
  onFree?: boolean;
}) {
  return (
    <div data-exam={stage} className="mx-auto flex max-w-lg flex-col gap-5">
      <Header stage={stage} subtitle={entryLabel ?? STAGE_INFO[stage].full} changeEntry={stage === "ME" && !!entryLabel} />
      <h2 className="text-xl font-extrabold text-ink">{onFree ? "Upgrade to Premium" : "Choose how to start"}</h2>

      <div className={cn("rounded-3xl bg-white p-5 shadow-sm ring-1 ring-border", onFree && "order-last")}>
        <p className="text-lg font-extrabold text-ink">Free</p>
        <p className="text-sm text-muted-foreground">Try Soma at no cost</p>
        <ul className="mt-3 space-y-1.5 text-sm">
          {free.map((f) => <li key={f} className="flex gap-2"><Check className="mt-0.5 size-4 shrink-0 text-success" aria-hidden />{f}</li>)}
        </ul>
        {onFree ? (
          <Link href={`/dashboard/${stage.toLowerCase()}`} className="mt-4 flex h-12 items-center justify-center rounded-2xl bg-muted text-base font-bold text-ink">You are using Free · go back</Link>
        ) : (
          <form action={startFreeAction} className="mt-4">
            <input type="hidden" name="stage" value={stage} />
            <button type="submit" className="h-12 w-full rounded-2xl bg-muted text-base font-bold text-ink active:scale-[0.98]">Start free</button>
          </form>
        )}
      </div>

      <div className={cn("relative overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-white shadow-xl", STAGE_INFO[stage].gradient)}>
        <span className="absolute -right-6 -top-6 size-28 rounded-full bg-white/10" aria-hidden />
        <p className="relative flex items-center gap-2 text-lg font-extrabold"><Crown className="size-5 text-yellow-200" aria-hidden /> Premium</p>
        {pkg ? (
          <>
            <p className="relative mt-1 text-3xl font-black">Nu {Number(pkg.price).toLocaleString("en-IN")}</p>
            <p className="relative text-sm text-white/85">{pkg.accessDays ? `${pkg.accessDays} days of full access` : "Full access"}</p>
            <ul className="relative mt-3 space-y-1.5 text-sm">
              {pkg.features.map((f) => <li key={f} className="flex gap-2"><Check className="mt-0.5 size-4 shrink-0 text-yellow-200" aria-hidden />{f}</li>)}
            </ul>
            {pkg.available ? (
              <Link href={`/dashboard/subscription/checkout/${pkg.slug}`} className="relative mt-4 flex h-12 items-center justify-center rounded-2xl bg-white text-base font-bold text-[var(--on-white,#9a3412)] active:scale-[0.98]">
                Get Premium
              </Link>
            ) : (
              <p className="relative mt-4 rounded-2xl bg-white/20 p-3 text-center text-sm font-semibold">Opening soon. Start free today and upgrade later.</p>
            )}
          </>
        ) : (
          <p className="relative mt-2 text-sm">Premium details are coming soon.</p>
        )}
      </div>
      <div className="order-last"><WhyPremium stage={stage} /></div>
    </div>
  );
}

export type MePaper = { id: string; number: number | null; title: string };
const ROMAN = ["", "I", "II", "III", "IV", "V"];
/** Paper cards share one colour, different from the ME theme (founder, 20 Nov 2026). */
const PAPER_CARD = "from-slate-600 via-slate-700 to-slate-800";

/** Paper I, II and III for the student's entry: the last step before practice. Locked without ME Premium. */
export function PaperCards({ papers, locked = false }: { papers: MePaper[]; locked?: boolean }) {
  if (!papers.length) return null;
  return (
    <ul className="grid gap-3">
      {papers.map((p, i) => (
        <li key={p.id}>
          <Link href={locked ? "#join-me" : `/dashboard/me/paper/${p.id}`}
            className={cn("relative flex min-h-24 items-center justify-between gap-3 overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-white shadow-lg active:scale-[0.99]", PAPER_CARD, locked && "opacity-80")}>
            <span className="absolute -right-6 -top-6 size-24 rounded-full bg-white/10" aria-hidden />
            <span className="relative">
              <span className="flex flex-wrap items-center gap-x-3 gap-y-1">
                <span className="text-2xl font-black">Paper {ROMAN[p.number ?? i + 1] ?? p.number}</span>
                {/* "Exam Room" next to each paper: an exam-hall feeling (founder, 20 Nov 2026) */}
                <span className="inline-flex items-center gap-1 rounded-full border border-white/40 bg-white/10 px-2.5 py-0.5 text-[11px] font-bold uppercase tracking-wider text-white/95">
                  <DoorOpen className="size-3.5" aria-hidden /> Exam Room
                </span>
              </span>
              <span className="block text-sm text-white/85">{p.title}</span>
            </span>
            <span className="relative flex size-10 shrink-0 items-center justify-center rounded-full bg-white/20">
              {locked ? <Lock className="size-5" aria-label="Locked" /> : <ArrowRight className="size-5" aria-hidden />}
            </span>
          </Link>
        </li>
      ))}
    </ul>
  );
}

/**
 * ME is Premium only: a student without ME Premium sees their papers locked and one way in, Join ME Premium.
 * `papers` are the paper titles for the student's entry, from the database, in order.
 */
export function MeLocked({ entryLabel, papers, pkg }: { entryLabel: string | null; papers: MePaper[]; pkg: PackageInfo }) {
  return (
    <div data-exam="ME" className="mx-auto flex max-w-lg flex-col gap-5">
      <Header stage="ME" subtitle={entryLabel ?? STAGE_INFO.ME.full} changeEntry={!!entryLabel} />
      <div>
        <h2 className="text-xl font-extrabold text-ink">Your papers</h2>
        <p className="mt-1 text-sm text-muted-foreground">ME preparation comes with ME Premium. Join to open your papers.</p>
      </div>
      <PaperCards papers={papers} locked />

      <div id="join-me" className={cn("relative scroll-mt-24 overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-white shadow-xl", STAGE_INFO.ME.gradient)}>
        <span className="absolute -right-6 -top-6 size-28 rounded-full bg-white/10" aria-hidden />
        <p className="relative flex items-center gap-2 text-lg font-extrabold"><Crown className="size-5 text-yellow-200" aria-hidden /> ME Premium</p>
        {pkg ? (
          <>
            <p className="relative mt-1 text-3xl font-black">Nu {Number(pkg.price).toLocaleString("en-IN")}</p>
            <p className="relative text-sm text-white/85">{pkg.accessDays ? `${pkg.accessDays} days of full access` : "Full access"}</p>
            <ul className="relative mt-3 space-y-1.5 text-sm">
              {pkg.features.map((f) => <li key={f} className="flex gap-2"><Check className="mt-0.5 size-4 shrink-0 text-yellow-200" aria-hidden />{f}</li>)}
            </ul>
            {pkg.available ? (
              <Link href={`/dashboard/subscription/checkout/${pkg.slug}`} className="relative mt-4 flex h-12 items-center justify-center rounded-2xl bg-white text-base font-bold text-[#9b2c4b] active:scale-[0.98]">
                Join ME Premium
              </Link>
            ) : (
              <p className="relative mt-4 rounded-2xl bg-white/20 p-3 text-center text-sm font-semibold">ME Premium opens soon.</p>
            )}
          </>
        ) : (
          <p className="relative mt-2 text-sm">ME Premium details are coming soon.</p>
        )}
      </div>
      <WhyPremium stage="ME" />
    </div>
  );
}

// ---------------------------------------------------------------------------
// 3. ME: choose your entry
// ---------------------------------------------------------------------------
export type EntryOptions = {
  categories: { id: string; code: string; name: string }[];
  specialisations: { id: string; name: string; category_id: string }[];
  groups: { id: string; name: string }[];
};

/** What each ME category writes (RCSC structure). */
const CATEGORY_PAPERS: Record<string, string> = {
  administrative: "Dzongkha · English & General Knowledge · Bhutan",
  finance: "Dzongkha · English & General Knowledge · Bhutan",
  pgde: "Dzongkha · English & General Knowledge · Bhutan",
  dzongkha: "Dzongkha & GK · English & Current Affairs · Buddhist Studies",
  bed: "General / Primary · Secondary · Dzongkha",
  technical: "Languages & GK · Subject group · Your specialisation",
};

/** ME entry: one of the six categories; B.Ed. section; Technical specialisation (its Paper II group follows from it). */
/** Administrative, Finance and PGDE sit the same common papers (RCSC examination board, 20 Nov 2026): one box first. */
const SERVICES = ["administrative", "finance", "pgde"];

export function EntryPicker({ options, cat, error }: { options: EntryOptions; cat: string | null; spec: string | null; error?: string | null }) {
  const category = options.categories.find((c) => c.code === cat) ?? null;
  const specs = category ? options.specialisations.filter((s) => s.category_id === category.id) : [];
  const card = cn("relative flex min-h-20 w-full items-center justify-between overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-left text-white shadow-lg active:scale-[0.99]", STAGE_INFO.ME.gradient);
  return (
    <div data-exam="ME" className="mx-auto max-w-lg space-y-5">
      <Header stage="ME" subtitle="Main Examination" />
      {error ? <p role="alert" className="rounded-2xl bg-danger-soft p-3 text-sm text-danger">{error}</p> : null}
      {cat === "services" ? (
        <>
          <p className="text-sm font-semibold text-primary">PGDE and Services</p>
          <h2 className="-mt-4 text-xl font-extrabold text-ink">Which one are you applying for?</h2>
          <p className="text-sm text-muted-foreground">These three categories write the same common papers: {CATEGORY_PAPERS.administrative ?? "Dzongkha, English and General Knowledge"}.</p>
          <div className="grid gap-2">
            {options.categories.filter((c) => SERVICES.includes(c.code)).map((c) => <EntryButton key={c.id} label={c.name} category={c.id} />)}
          </div>
        </>
      ) : !category ? (
        <>
          <h2 className="text-xl font-extrabold text-ink">Which category are you applying for?</h2>
          <div className="grid gap-3">
            {options.categories.some((c) => SERVICES.includes(c.code)) ? (
              <Link href="/dashboard/me?cat=services" className={card}>
                <span className="absolute -right-6 -top-6 size-24 rounded-full bg-white/10" aria-hidden />
                <span className="relative">
                  <span className="block text-lg font-extrabold">PGDE and Services</span>
                  <span className="block text-sm text-white/85">Administrative · Finance · Education (PGDE) — same common papers</span>
                </span>
                <ArrowRight className="relative size-6 shrink-0" aria-hidden />
              </Link>
            ) : null}
            {options.categories.filter((c) => !SERVICES.includes(c.code)).map((c) => {
              const body = (
                <>
                  <span className="absolute -right-6 -top-6 size-24 rounded-full bg-white/10" aria-hidden />
                  <span className="relative">
                    <span className="block text-lg font-extrabold">{c.name}</span>
                    <span className="block text-sm text-white/85">{CATEGORY_PAPERS[c.code] ?? "Three written papers"}</span>
                  </span>
                  <ArrowRight className="relative size-6 shrink-0" aria-hidden />
                </>
              );
              return c.code === "bed" || c.code === "technical" ? (
                <Link key={c.id} href={`/dashboard/me?cat=${c.code}`} className={card}>{body}</Link>
              ) : (
                <form key={c.id} action={setMeEntryAction}>
                  <input type="hidden" name="category" value={c.id} />
                  <button type="submit" className={card}>{body}</button>
                </form>
              );
            })}
          </div>
        </>
      ) : category.code === "technical" ? (
        <>
          <p className="text-sm font-semibold text-primary">{category.name}</p>
          <h2 className="-mt-4 text-xl font-extrabold text-ink">Your specialisation</h2>
          <p className="text-sm text-muted-foreground">Based on RCSC&apos;s BCSE 2025 papers. Choose the specialisation of the position you are applying for; check this year&apos;s vacancy announcement.</p>
          <div className="grid gap-2">
            {specs.map((s) => <EntryButton key={s.id} label={s.name} category={category.id} specialisation={s.id} />)}
          </div>
        </>
      ) : (
        <>
          <p className="text-sm font-semibold text-primary">{category.name}</p>
          <h2 className="-mt-4 text-xl font-extrabold text-ink">Which B.Ed. section are you?</h2>
          <p className="text-sm text-muted-foreground">All three sections write the same first paper and the same Teacher Aptitude Test. The subject paper depends on your section and subject.</p>
          <div className="grid gap-2">
            {specs.map((s) => <EntryButton key={s.id} label={s.name} category={category.id} specialisation={s.id} />)}
          </div>
        </>
      )}
    </div>
  );
}

function EntryButton({ label, category, specialisation, group }: { label: string; category?: string; specialisation?: string; group?: string }) {
  if (!category) return null;
  return (
    <form action={setMeEntryAction}>
      <input type="hidden" name="category" value={category} />
      <input type="hidden" name="specialisation" value={specialisation ?? ""} />
      <input type="hidden" name="subject_group" value={group ?? ""} />
      <button type="submit" className={cn("flex w-full items-center justify-between rounded-2xl bg-gradient-to-r p-4 text-left font-bold text-white shadow-md active:scale-[0.99]", "from-[#be123c] to-[#7a1e3a]")}>
        {label} <ArrowRight className="size-5 shrink-0" aria-hidden />
      </button>
    </form>
  );
}

// ---------------------------------------------------------------------------
// 4. Inside an exam
// ---------------------------------------------------------------------------
export type AreaData = {
  stage: Stage;
  entryLabel: string | null;
  premium: string | null;          // "Premium until …" or null for free
  openAttempt: { id: string; title: string } | null;
  training: TrainingData | null;   // shown when today's plan is for this exam
  answered: number;
  accuracy: number | null;
  written: number;
  freeUsedUp: boolean;             // free questions/tests or AI marks used up
  aiMarks: { used: number; limit: number } | null; // ME: AI-marked answers
  premiumSlug: string | null;
  papers?: MePaper[];               // ME: Paper I, II, III for the entry
  progress?: MeProgressPaper[];     // ME: progress per paper, combined on the ME home
};

export function ExamArea({ d }: { d: AreaData }) {
  const t = d.training;
  const items = t?.items ?? [];
  const next = items.find((i) => i.status === "pending" || i.status === "started");
  const done = items.filter((i) => i.status === "done" || i.status === "skipped").length;
  const pe = d.stage === "PE";
  const tiles = pe
    ? [
        { href: "/dashboard/analytics?stage=PE", label: "My scores", sub: d.answered ? `${d.answered} answered` : "Your progress", icon: BarChart3, tint: "from-fuchsia-600 to-pink-500" },
        { href: "/dashboard/omr-practice", label: "OMR sketch practice", sub: "Practise your shading for the RCSC PE", icon: PencilLine, tint: "from-slate-700 to-slate-500" },
        { href: "/dashboard/current-affairs#question-of-the-day", label: "Question of the Day", sub: "One news question a day", icon: Lightbulb, tint: "from-sky-600 to-cyan-500" },
        { href: "/dashboard/current-affairs", label: "Current affairs", sub: "Bhutan and world news", icon: Newspaper, tint: "from-violet-600 to-purple-500" },
      ]
    : [
        { href: "/dashboard/written/history", label: "My answers", sub: "Marks and AI feedback", icon: PenLine, tint: "from-rose-600 to-[#7a1e3a]" },
        { href: "/dashboard/last-minute?stage=ME", label: "Last-minute summary", sub: "Your key points to revise", icon: ClipboardCheck, tint: "from-[#be123c] to-[#f43f5e]" },
        { href: "/dashboard/current-affairs", label: "Current affairs", sub: "Bhutan and world news", icon: Newspaper, tint: "from-violet-600 to-purple-500" },
        { href: "/dashboard/analytics?stage=ME", label: "My scores", sub: d.written ? `${d.written} answer${d.written === 1 ? "" : "s"} marked` : "Your progress", icon: BarChart3, tint: "from-emerald-600 to-teal-500" },
      ];

  return (
    <div data-exam={d.stage} className="mx-auto max-w-2xl space-y-6">
      <Header stage={d.stage} subtitle={d.entryLabel ?? STAGE_INFO[d.stage].full} badge={d.premium ?? "Free"} changeEntry={d.stage === "ME" && !!d.entryLabel} />

      {/* ME: Paper I, II and III come first: the last step before practice (founder, 20 Nov 2026). */}
      {!pe && d.papers?.length ? (
        <section aria-labelledby="papers-h" className="space-y-3">
          <h2 id="papers-h" className="text-lg font-bold">Your papers</h2>
          <PaperCards papers={d.papers} />
        </section>
      ) : null}
      {!pe && d.progress?.length ? <MeOverall papers={d.progress} /> : null}

      {/* PE: the mock test comes first (founder, 19 Nov 2026); an unfinished test is offered before a new one.
          ME: the paper cards are the way in, so this box only appears to continue an unfinished paper (founder, 20 Nov 2026). */}
      {pe && !d.openAttempt ? (
        d.freeUsedUp ? <FreeLimitNote title="You have taken today’s free test" /> : <MockCta premium={Boolean(d.premium)} />
      ) : !pe && !d.openAttempt ? null : (
      <section className={cn("relative overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-white shadow-xl sm:p-7", STAGE_INFO[d.stage].gradient)}>
        <span className="absolute -right-10 -top-10 size-40 rounded-full bg-white/10" aria-hidden />
        <div className="relative flex items-start justify-between gap-3">
          <div>
            <p className="text-sm font-semibold uppercase tracking-wider text-white/80">
              {d.openAttempt || done ? "Continue where you left off" : "Start here"}
            </p>
            <h2 className="mt-1 text-2xl font-extrabold text-white">
              {d.openAttempt ? d.openAttempt.title : next ? next.title : items.length ? "All done for today!" : pe ? "Your first practice" : "Your first written answer"}
            </h2>
            {t && items.length ? <p className="mt-1 text-sm text-white/85">Today: {done} of {items.length} done</p> : null}
          </div>
          {t ? (
            <div className="flex shrink-0 flex-col items-center rounded-2xl bg-white/15 px-3 py-2">
              <Flame className="size-6 text-yellow-200" aria-hidden />
              <span className="text-xl font-extrabold leading-none">{t.stats.current_streak}</span>
              <span className="text-[10px] font-semibold uppercase text-white/80">days</span>
            </div>
          ) : null}
        </div>
        <div className="relative mt-5">
          {d.openAttempt ? (
            <Link href={`/exam/${d.openAttempt.id}`} className="flex h-14 items-center justify-center gap-2 rounded-2xl bg-white text-lg font-bold text-[var(--on-white,#9a3412)] shadow-lg">
              <PlayCircle className="size-5" aria-hidden /> Continue
            </Link>
          ) : next ? (
            <StartButton itemId={next.id} label={itemAction(next)} className="bg-white text-[var(--on-white,#9a3412)]" />
          ) : (
            <Link href={pe ? (d.premium ? "/dashboard/practice?stage=PE" : "/dashboard/exams?stage=PE") : d.papers?.[0] ? `/dashboard/me/paper/${d.papers[0].id}` : "/dashboard/me"} className="flex h-14 items-center justify-center rounded-2xl bg-white text-lg font-bold text-[var(--on-white,#9a3412)] shadow-lg">
              {pe ? (d.premium ? "Start practice" : "Take today’s free test") : "Write an answer"}
            </Link>
          )}
        </div>
      </section>
      )}

      {/* Free plan note */}
      {!d.premium && !(pe && d.freeUsedUp && !d.openAttempt) ? (
        <Link href={`/dashboard/${d.stage.toLowerCase()}?plans=1`}
          className="flex items-center gap-3 rounded-2xl bg-yellow-100 p-4 text-yellow-950 ring-1 ring-yellow-300">
          <Crown className="size-6 shrink-0 text-yellow-700" aria-hidden />
          <span className="text-sm">
            {pe ? (
              <>
                <span className="block font-bold">{d.freeUsedUp ? "You have used your free practice" : "You are on Free"}</span>
                {d.freeUsedUp ? "Join Premium to unlock every question, all mock tests and your full daily plan." : "Premium unlocks every question, all mock tests and your full daily plan."}
              </>
            ) : (
              <>
                <span className="block font-bold">
                  {d.freeUsedUp ? "You have used your 3 free AI marks" : `${Math.max((d.aiMarks?.limit ?? 3) - (d.aiMarks?.used ?? 0), 0)} of ${d.aiMarks?.limit ?? 3} free AI marks left`}
                </span>
                Join Premium for 100 AI-marked answers, handwritten answer upload and AI feedback.
              </>
            )}
          </span>
          <ArrowRight className="ml-auto size-5 shrink-0" aria-hidden />
        </Link>
      ) : null}

      {/* Today's plan */}
      {t && items.length ? (
        <section aria-labelledby="plan-h">
          <div className="mb-3 flex items-baseline justify-between">
            <h2 id="plan-h" className="text-lg font-bold">Today&apos;s plan</h2>
            <Link href="/dashboard/training" className="text-sm font-semibold text-primary">Streak &amp; badges →</Link>
          </div>
          <TodayPlan data={t} />
        </section>
      ) : null}

      {/* Sections */}
      <section aria-labelledby="sec-h">
        <h2 id="sec-h" className="mb-3 text-lg font-bold">{pe ? "PE" : "ME"} sections</h2>
        <div className="grid grid-cols-2 gap-3">
          {tiles.map((s) => (
            <Link key={s.href} href={s.href} className={`flex min-h-28 flex-col justify-between rounded-2xl bg-gradient-to-br ${s.tint} p-4 text-white shadow-md active:scale-[0.98]`}>
              <s.icon className="size-7" aria-hidden />
              <span>
                <span className="block text-base font-extrabold">{s.label}</span>
                <span className="block text-xs text-white/85">{s.sub}</span>
              </span>
            </Link>
          ))}
        </div>
      </section>

      {/* Scores */}
      <div className="grid grid-cols-3 gap-3 text-center">
        {[
          [pe ? String(d.answered) : String(d.written), pe ? "answered" : d.written === 1 ? "answer" : "answers"],
          pe
            ? [d.accuracy !== null ? `${d.accuracy}%` : "—", "correct"]
            : [d.aiMarks ? String(Math.max(d.aiMarks.limit - d.aiMarks.used, 0)) : "—", "AI marks left"],
          [t ? String(t.stats.best_streak) : "0", "best streak"],
        ].map(([v, l]) => (
          <div key={l} className="rounded-2xl bg-white p-3 shadow-sm ring-1 ring-border">
            <p className="text-xl font-extrabold text-ink">{v}</p>
            <p className="text-xs text-muted-foreground">{l}</p>
          </div>
        ))}
      </div>
      <p className="text-center text-[11px] text-subtle">Soma&apos;s figures are estimates from your practice, not RCSC assessments.</p>
    </div>
  );
}

function Header({ stage, subtitle, badge, changeEntry }: { stage: Stage; subtitle: string; badge?: string; changeEntry?: boolean }) {
  return (
    <div className="flex items-start justify-between gap-3">
      <div>
        <p className="flex items-center gap-2 text-2xl font-black tracking-tight text-ink">
          {stage}
          {badge === "Free" ? (
            <Link href={`/dashboard/${stage.toLowerCase()}?plans=1`} className="rounded-full bg-muted px-2.5 py-0.5 text-xs font-bold text-muted-foreground">
              Free · <span className="text-primary">see Premium</span>
            </Link>
          ) : badge ? (
            <span className="rounded-full bg-yellow-100 px-2.5 py-0.5 text-xs font-bold text-yellow-800">
              <span className="inline-flex items-center gap-1"><Crown className="size-3" aria-hidden />{badge}</span>
            </span>
          ) : null}
        </p>
        <p className="text-sm text-muted-foreground">
          {subtitle}
          {changeEntry ? <> · <Link href="/dashboard/me?change=1" className="font-semibold text-primary underline underline-offset-2">Change entry</Link></> : null}
        </p>
      </div>

    </div>
  );
}

export const FREE_POINTS: Record<Stage, string[]> = {
  PE: ["A free 25-question test every day, in BCSE style, answered on OMR circles", "Questions from all four sections, with explanations and your coach", "OMR sketch practice", "Exam countdown and the Question of the Day"],
  ME: [], // ME is Premium only
};
