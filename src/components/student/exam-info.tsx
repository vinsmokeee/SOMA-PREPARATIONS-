import { BarChart3, Brain, CalendarCheck, Camera, ClipboardCheck, Clock, CreditCard, FileText, HeartHandshake, MessageCircleHeart, Newspaper, RotateCcw, ShieldCheck, Sparkles, type LucideIcon } from "lucide-react";
import type { PackageInfo } from "./exam-flow";
import { cn } from "@/lib/utils";

type Stage = "PE" | "ME";
type Benefit = { icon: LucideIcon; title: string; text: string };

/** What each exam's preparation gives a student, in plain words. */
export const BENEFITS: Record<Stage, Benefit[]> = {
  PE: [
    { icon: ClipboardCheck, title: "Mock tests like the real PE", text: "Timed tests across English, Dzongkha, Aptitude and Data Interpretation. Premium gives a fresh test every time, built from past-paper style questions and new ones made from them." },
    { icon: MessageCircleHeart, title: "A coach after every test", text: "See where you lost marks, which sections to work on, how to approach each kind of question, and whether you are going too fast or too slow." },
    { icon: RotateCcw, title: "Your mistakes come back", text: "Questions you get wrong return in your revision and in later mock tests, so you get them right next time." },
    { icon: CalendarCheck, title: "A plan for every day", text: "Short daily practice, revision and the Question of the Day, with streaks to keep you going." },
    { icon: BarChart3, title: "Scores by section", text: "Track your accuracy in every section and compare with last year's cut-off as a guide." },
    { icon: Newspaper, title: "Current affairs", text: "Daily Bhutan and world news in short notes, with quick quizzes." },
  ],
  ME: [
    { icon: FileText, title: "Written questions for your entry", text: "Practise the kind of questions set for your category or specialisation, with model answers." },
    { icon: Camera, title: "Write by hand, like the real exam", text: "Type your answer or take photos of your handwritten pages. Soma reads them for you." },
    { icon: Brain, title: "AI marking and feedback", text: "Get an estimated mark, your strengths, the points you missed and an improved answer to learn from." },
    { icon: Clock, title: "Timed papers", text: "Practise full papers under time, so you learn to finish on the day." },
    { icon: BarChart3, title: "See your progress", text: "Every marked answer is saved, so you can see how your writing improves." },
    { icon: Newspaper, title: "Current affairs", text: "Daily news notes and quizzes to use as examples in your answers." },
  ],
};

const TRUST: Benefit[] = [
  { icon: CreditCard, title: "How paying works", text: "Pay once with a supported Bhutanese payment method. Your Premium opens as soon as your payment is checked. There is no automatic renewal." },
  { icon: Sparkles, title: "Start free first", text: "Try Soma free for as long as you like. Upgrade only when you are ready." },
  { icon: ShieldCheck, title: "An honest promise", text: "Soma helps you prepare well. No one can guarantee selection: RCSC sets the exam and the cut-off each year." },
];

function Grid({ items, stage }: { items: Benefit[]; stage?: Stage }) {
  return (
    <ul className="grid gap-3 sm:grid-cols-2">
      {items.map((b) => (
        <li key={b.title} className="flex gap-3 rounded-2xl bg-white p-4 shadow-sm ring-1 ring-border">
          <span className={cn("flex size-10 shrink-0 items-center justify-center rounded-xl",
            stage === "ME" ? "bg-rose-100 text-[#9f1239]" : stage === "PE" ? "bg-orange-100 text-orange-700" : "bg-muted text-ink")}>
            <b.icon className="size-5" aria-hidden />
          </span>
          <span>
            <span className="block font-bold text-ink">{b.title}</span>
            <span className="mt-0.5 block text-sm leading-relaxed text-muted-foreground">{b.text}</span>
          </span>
        </li>
      ))}
    </ul>
  );
}

/** Below the PE / ME boxes: what each exam includes, prices and how it works. */
export function ChooserInfo({ packages }: { packages: Record<Stage, PackageInfo> }) {
  return (
    <div className="mx-auto mt-10 max-w-lg space-y-8">
      <div className="text-center">
        <HeartHandshake className="mx-auto size-8 text-primary" aria-hidden />
        <h2 className="mt-2 text-xl font-extrabold text-ink">What you get with Soma</h2>
        <p className="mt-1 text-sm text-muted-foreground">Scroll to see what is included for each exam.</p>
      </div>
      {(["PE", "ME"] as const).map((s) => (
        <section key={s} aria-labelledby={`info-${s}`} className="space-y-3">
          <div className="flex items-baseline justify-between gap-3">
            <h3 id={`info-${s}`} className="text-lg font-extrabold text-ink">{s === "PE" ? "PE · Preliminary Examination" : "ME · Main Examination"}</h3>
            {packages[s] ? <span className="shrink-0 text-sm font-bold text-ink">Premium Nu {packages[s]!.price.toLocaleString("en-IN")}</span> : null}
          </div>
          <Grid items={BENEFITS[s]} stage={s} />
        </section>
      ))}
      <section aria-labelledby="info-how" className="space-y-3">
        <h3 id="info-how" className="text-lg font-extrabold text-ink">Good to know</h3>
        <Grid items={TRUST} />
      </section>
    </div>
  );
}

/** Below the Free / Premium boxes: why Premium is worth it, and how paying works. */
export function WhyPremium({ stage, pkg }: { stage: Stage; pkg: PackageInfo }) {
  return (
    <div className="space-y-6 pt-4">
      <section aria-labelledby="why-h" className="space-y-3">
        <h2 id="why-h" className="text-xl font-extrabold text-ink">Why go Premium?</h2>
        <p className="text-sm text-muted-foreground">
          {stage === "PE"
            ? "Free lets you try a few questions. Premium gives you everything you need to prepare for the PE properly:"
            : "Free lets you try 3 AI-marked answers. Premium gives you enough practice to really improve your writing:"}
        </p>
        <Grid items={BENEFITS[stage]} stage={stage} />
      </section>
      <section aria-labelledby="pay-h" className="space-y-3">
        <h2 id="pay-h" className="text-xl font-extrabold text-ink">Before you pay</h2>
        <Grid items={[
          ...(pkg?.accessDays ? [{ icon: CalendarCheck, title: `${pkg.accessDays} days of access`, text: `Your ${pkg.name} lasts ${pkg.accessDays} days from the day it opens.` }] : []),
          ...TRUST,
        ]} />
      </section>
    </div>
  );
}
