import Link from "next/link";
import { ArrowRight, BarChart3, BookOpenCheck, Check, ClipboardCheck, Crown, Flame, Newspaper, PenLine, PlayCircle } from "lucide-react";
import { startFreeAction, setMeEntryAction } from "@/app/dashboard/exam-actions";
import { StartButton } from "@/components/training/start-button";
import { TodayPlan } from "@/components/training/today-plan";
import { itemAction, type TrainingData } from "@/lib/training/model";
import { cn } from "@/lib/utils";
import { WhyPremium } from "./exam-info";

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
          <Link key={s} href={s === "PE" ? "/dashboard/pe" : "/dashboard/me"}
            className={cn("relative flex min-h-40 flex-col justify-between overflow-hidden rounded-3xl bg-gradient-to-br p-6 text-white shadow-xl transition active:scale-[0.98]", STAGE_INFO[s].gradient)}>
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
          </Link>
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
  bed: "Dzongkha · English · Teacher Aptitude Test",
  technical: "Languages & GK · Paper II group · Your specialisation",
};

/** ME entry: one of the six categories; B.Ed. graduate type; Technical specialisation and Paper II group. */
export function EntryPicker({ options, cat, error }: { options: EntryOptions; cat: string | null; error?: string | null }) {
  const category = options.categories.find((c) => c.code === cat) ?? null;
  const specs = category ? options.specialisations.filter((s) => s.category_id === category.id) : [];
  const card = cn("relative flex min-h-20 w-full items-center justify-between overflow-hidden rounded-3xl bg-gradient-to-br p-5 text-left text-white shadow-lg active:scale-[0.99]", STAGE_INFO.ME.gradient);
  return (
    <div data-exam="ME" className="mx-auto max-w-lg space-y-5">
      <Header stage="ME" subtitle="Main Examination" />
      {error ? <p role="alert" className="rounded-2xl bg-danger-soft p-3 text-sm text-danger">{error}</p> : null}
      {!category ? (
        <>
          <h2 className="text-xl font-extrabold text-ink">Which category are you applying for?</h2>
          <div className="grid gap-3">
            {options.categories.map((c) => {
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
          <h2 className="-mt-4 text-xl font-extrabold text-ink">Your specialisation (Paper III)</h2>
          <p className="text-sm text-muted-foreground">Based on RCSC&apos;s BCSE 2025 papers. Choose the specialisation of the position you are applying for; check this year&apos;s vacancy announcement.</p>
          <div className="grid gap-2">
            {specs.map((s) => <EntryButton key={s.id} label={s.name} category={category.id} specialisation={s.id} />)}
          </div>
        </>
      ) : (
        <>
          <p className="text-sm font-semibold text-primary">{category.name}</p>
          <h2 className="-mt-4 text-xl font-extrabold text-ink">Which graduates are you?</h2>
          <p className="text-sm text-muted-foreground">General and Dzongkha graduates write different Dzongkha and English papers; the Teacher Aptitude Test is the same.</p>
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
  papers?: { id: string; number: number | null; title: string; detail: string | null; questions: number }[]; // ME: the student's three papers
};

export function ExamArea({ d }: { d: AreaData }) {
  const t = d.training;
  const items = t?.items ?? [];
  const next = items.find((i) => i.status === "pending" || i.status === "started");
  const done = items.filter((i) => i.status === "done" || i.status === "skipped").length;
  const pe = d.stage === "PE";
  const tiles = pe
    ? [
        { href: "/dashboard/practice?stage=PE", label: "Practice", sub: "By section and topic", icon: BookOpenCheck, tint: "from-orange-500 to-amber-400" },
        { href: "/dashboard/exams?stage=PE", label: "Mock tests", sub: "Timed, like the real PE", icon: ClipboardCheck, tint: "from-rose-600 to-orange-500" },
        { href: "/dashboard/current-affairs", label: "Current affairs", sub: "Bhutan and world news", icon: Newspaper, tint: "from-violet-600 to-purple-500" },
        { href: "/dashboard/analytics", label: "My scores", sub: d.answered ? `${d.answered} answered` : "Your progress", icon: BarChart3, tint: "from-emerald-600 to-teal-500" },
      ]
    : [
        { href: "/dashboard/written", label: "Written answers", sub: "Get AI feedback", icon: PenLine, tint: "from-rose-600 to-[#7a1e3a]" },
        { href: "/dashboard/exams?stage=ME", label: "Timed tests", sub: "Full papers, timed like the ME", icon: ClipboardCheck, tint: "from-[#be123c] to-[#f43f5e]" },
        { href: "/dashboard/current-affairs", label: "Current affairs", sub: "Bhutan and world news", icon: Newspaper, tint: "from-violet-600 to-purple-500" },
        { href: "/dashboard/analytics", label: "My scores", sub: d.written ? `${d.written} answer${d.written === 1 ? "" : "s"} marked` : "Your progress", icon: BarChart3, tint: "from-emerald-600 to-teal-500" },
      ];

  return (
    <div data-exam={d.stage} className="mx-auto max-w-2xl space-y-6">
      <Header stage={d.stage} subtitle={d.entryLabel ?? STAGE_INFO[d.stage].full} badge={d.premium ?? "Free"} changeEntry={d.stage === "ME" && !!d.entryLabel} />

      {/* Continue where you left off */}
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
            <Link href={pe ? "/dashboard/practice?stage=PE" : "/dashboard/written"} className="flex h-14 items-center justify-center rounded-2xl bg-white text-lg font-bold text-[var(--on-white,#9a3412)] shadow-lg">
              {pe ? "Start practice" : "Write an answer"}
            </Link>
          )}
        </div>
      </section>

      {/* Free plan note */}
      {!d.premium ? (
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

      {/* ME: the student's three papers, each in its own section */}
      {d.papers?.length ? (
        <section aria-labelledby="papers-h" className="space-y-3">
          <h2 id="papers-h" className="text-xl font-extrabold text-ink">Your papers</h2>
          {d.papers.map((p) => (
            <Link key={p.id} href={`/dashboard/written?paper=${p.id}`}
              className="flex items-center gap-4 rounded-3xl bg-white p-4 shadow-sm ring-1 ring-border active:scale-[0.99]">
              <span className={cn("flex size-14 shrink-0 flex-col items-center justify-center rounded-2xl bg-gradient-to-br text-white", STAGE_INFO.ME.gradient)}>
                <span className="text-[10px] font-semibold uppercase leading-none tracking-wider text-white/80">Paper</span>
                <span className="text-xl font-black leading-tight">{["", "I", "II", "III", "IV"][p.number ?? 0] || "–"}</span>
              </span>
              <span className="min-w-0 flex-1">
                <span className="block font-bold leading-snug text-ink">{p.title}</span>
                {p.detail ? <span className="block text-sm font-semibold text-primary">{p.detail}</span> : null}
                <span className="block text-sm text-muted-foreground">{p.questions ? `${p.questions} question${p.questions === 1 ? "" : "s"} to practise` : "Questions coming soon"}</span>
              </span>
              <ArrowRight className="size-5 shrink-0 text-primary" aria-hidden />
            </Link>
          ))}
        </section>
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
  PE: ["Free sample questions in every section", "A sample mock test", "Today's Question of the Day"],
  ME: ["3 written answers marked by AI: typed, or a photo of your handwritten answer", "AI feedback with an improved model answer", "Sample written questions for your entry", "Today's current affairs"],
};
