import Link from "next/link";
import { Bell, BookOpenCheck, ClipboardCheck, Flame, Newspaper, PenLine, Sparkles } from "lucide-react";
import { StartButton } from "@/components/training/start-button";
import { TodayPlan } from "@/components/training/today-plan";
import { itemAction, phaseLabel, type TrainingData } from "@/lib/training/model";

export type HomeData = {
  firstName: string;
  training: TrainingData | null;
  unread: number;
  needsOnboarding: boolean;
  access: string | null; // e.g. "PE Premium until 30 Jan 2027"; null = free account
  pe: { answered: number; accuracy: number | null };
  me: { answered: number; written: number };
};

/** The student home screen: one big "today" card, a tick-list and four shortcuts. */
export function HomeView({ d }: { d: HomeData }) {
  const t = d.training;
  const items = t?.items ?? [];
  const done = items.filter((i) => i.status === "done" || i.status === "skipped").length;
  const next = items.find((i) => i.status === "pending" || i.status === "started");
  const pct = items.length ? Math.round((done / items.length) * 100) : 0;

  return (
    <div className="space-y-6">
      {/* Greeting */}
      <div className="flex items-center justify-between gap-3">
        <div>
          <p className="text-sm font-medium text-muted-foreground">Kuzuzangpo la</p>
          <h1 className="text-2xl font-extrabold tracking-tight text-ink">{d.firstName || "Welcome"}</h1>
        </div>
        <Link href="/dashboard/notifications" className="relative flex size-11 items-center justify-center rounded-full bg-white shadow-sm ring-1 ring-border" aria-label={`Notifications${d.unread ? `: ${d.unread} new` : ""}`}>
          <Bell className="size-5 text-ink" aria-hidden />
          {d.unread ? <span className="absolute -right-0.5 -top-0.5 flex size-5 items-center justify-center rounded-full bg-primary text-[11px] font-bold text-white">{d.unread}</span> : null}
        </Link>
      </div>

      {d.needsOnboarding ? (
        <Link href="/dashboard/welcome" className="flex items-center gap-3 rounded-2xl bg-sky-100 p-4 text-sky-900">
          <Sparkles className="size-5 shrink-0" aria-hidden />
          <span className="text-sm"><span className="font-bold">Tell us your exam</span> so Soma can plan your practice. Takes 10 seconds →</span>
        </Link>
      ) : null}

      {/* Today hero */}
      {t ? (
        <section className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-amber-400 via-orange-600 to-[#7a1e3a] p-5 text-white shadow-xl sm:p-7" aria-labelledby="today-h">
          <div className="absolute -right-10 -top-10 size-40 rounded-full bg-white/10" aria-hidden />
          <div className="absolute -bottom-16 right-10 size-32 rounded-full bg-white/10" aria-hidden />
          <div className="relative flex items-start justify-between gap-4">
            <div>
              <p className="text-sm font-semibold uppercase tracking-wider text-white/80">Today · Day {t.plan.cycle_day} of {t.plan.cycle_days}</p>
              <h2 id="today-h" className="mt-1 text-2xl font-extrabold text-white sm:text-3xl">
                {items.length === 0 ? "Your plan is on its way" : next ? `${items.length - done} task${items.length - done === 1 ? "" : "s"} to go` : "All done today!"}
              </h2>
              <p className="mt-1 text-sm text-white/85">{phaseLabel(t.plan.phase)} phase{t.plan.focus ? ` · focus: ${t.plan.focus}` : ""}</p>
            </div>
            <div className="flex shrink-0 flex-col items-center rounded-2xl bg-white/15 px-3 py-2 backdrop-blur">
              <Flame className="size-7 text-yellow-200" aria-hidden />
              <span className="text-2xl font-extrabold leading-none">{t.stats.current_streak}</span>
              <span className="text-[11px] font-semibold uppercase tracking-wide text-white/80">day{t.stats.current_streak === 1 ? "" : "s"}</span>
            </div>
          </div>
          {items.length ? (
            <div className="relative mt-5">
              <div className="h-3 rounded-full bg-white/25" role="progressbar" aria-valuenow={pct} aria-valuemin={0} aria-valuemax={100} aria-label="Today's progress">
                <div className="h-3 rounded-full bg-yellow-200 transition-all" style={{ width: `${pct}%` }} />
              </div>
              <p className="mt-1.5 text-sm text-white/85">{done} of {items.length} done</p>
            </div>
          ) : null}
          {next ? (
            <div className="relative mt-5">
              <StartButton itemId={next.id} label={`${itemAction(next)}: ${next.title}`} className="bg-white text-[#9a3412] hover:bg-yellow-50" />
            </div>
          ) : items.length ? (
            <p className="relative mt-5 rounded-2xl bg-white/15 p-3 text-center font-semibold">Great work. Come back tomorrow to keep your streak.</p>
          ) : null}
        </section>
      ) : null}

      {/* Tasks */}
      {t && items.length ? (
        <section aria-labelledby="tasks-h">
          <div className="mb-3 flex items-baseline justify-between">
            <h2 id="tasks-h" className="text-lg font-bold">Today&apos;s tasks</h2>
            <Link href="/dashboard/training" className="text-sm font-semibold text-primary">Streak &amp; badges →</Link>
          </div>
          <TodayPlan data={t} />
        </section>
      ) : null}

      {/* Shortcuts */}
      <section aria-labelledby="go-h">
        <h2 id="go-h" className="mb-3 text-lg font-bold">Practise</h2>
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
          {[
            { href: "/dashboard/practice", label: "Practice", sub: d.pe.answered ? `${d.pe.answered} answered` : "Pick a topic", icon: BookOpenCheck, tint: "from-orange-500 to-amber-400" },
            { href: "/dashboard/exams", label: "Mock exams", sub: "Timed, like the real one", icon: ClipboardCheck, tint: "from-rose-600 to-orange-500" },
            { href: "/dashboard/written", label: "Written", sub: d.me.written ? `${d.me.written} answers` : "Get AI feedback", icon: PenLine, tint: "from-emerald-600 to-teal-500" },
            { href: "/dashboard/current-affairs", label: "News", sub: "Today in Bhutan & world", icon: Newspaper, tint: "from-sky-600 to-indigo-500" },
          ].map((s) => (
            <Link key={s.href} href={s.href} className={`flex min-h-28 flex-col justify-between rounded-2xl bg-gradient-to-br ${s.tint} p-4 text-white shadow-md transition active:scale-[0.98]`}>
              <s.icon className="size-7" aria-hidden />
              <span>
                <span className="block text-base font-extrabold">{s.label}</span>
                <span className="block text-xs text-white/85">{s.sub}</span>
              </span>
            </Link>
          ))}
        </div>
      </section>

      {/* Progress strip */}
      <Link href="/dashboard/analytics" className="flex items-center justify-between gap-3 rounded-2xl bg-white p-4 shadow-sm ring-1 ring-border">
        <span className="text-sm">
          <span className="block font-bold text-ink">Your progress</span>
          <span className="text-muted-foreground">
            PE: {d.pe.answered} answered{d.pe.accuracy !== null ? ` · ${d.pe.accuracy}% correct` : ""} · ME: {d.me.written} written
          </span>
        </span>
        <span className="text-sm font-semibold text-primary">See →</span>
      </Link>

      <p className="text-center text-xs text-muted-foreground">
        {d.access ? d.access : <>Free account · <Link href="/packages" className="font-semibold text-primary">See packages</Link></>}
      </p>
      <p className="text-center text-[11px] leading-relaxed text-subtle">
        Soma&apos;s progress figures are estimates from your practice, not RCSC assessments.
      </p>
    </div>
  );
}
