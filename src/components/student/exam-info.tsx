import { BarChart3, BookOpen, Brain, CalendarCheck, CalendarClock, PencilLine, Camera, ClipboardCheck, Clock, FileText, HeartHandshake, MapPin, MessageCircleHeart, Newspaper, RotateCcw, Sparkles, type LucideIcon } from "lucide-react";
import type { PackageInfo } from "./exam-flow";
import { cn } from "@/lib/utils";

type Stage = "PE" | "ME";
type Benefit = { icon: LucideIcon; title: string; text: string };

/** What each exam's preparation gives a student, in plain words. */
export const BENEFITS: Record<Stage, Benefit[]> = {
  PE: [
    { icon: ClipboardCheck, title: "Mock tests like the real PE", text: "Timed tests across English, Dzongkha, Aptitude and Data Interpretation. Premium gives a fresh test every time, built from past-paper style questions and new ones made from them." },
    { icon: PencilLine, title: "OMR shading practice", text: "In the real PE you shade circles on an OMR sheet. Soma's mock tests use shading circles too, OMR sketch practice shows you how to shade so the scanner reads it, and your coach tells you if any answer would not have been counted." },
    { icon: CalendarClock, title: "Exam countdown and last-minute summary", text: "Enter your exam date for a daily countdown. The day before, open your last-minute summary: your weak sections and the past-paper questions you got wrong, with answers." },
    { icon: Brain, title: "AI assistance", text: "Every answer is marked instantly with an explanation. AI also helps us make new practice questions from past papers, and each one is checked before you see it." },
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
    { icon: MessageCircleHeart, title: "Guidance to improve", text: "Learn how to plan and structure your answers, what examiners look for, and where you can gain more marks." },
    { icon: Clock, title: "Timed papers", text: "Practise full papers under time, so you learn to finish on the day." },
    { icon: BarChart3, title: "See your progress", text: "Every marked answer is saved, so you can see how your writing improves." },
    { icon: Newspaper, title: "Current affairs", text: "Daily news notes and quizzes to use as examples in your answers." },
    { icon: CalendarClock, title: "Exam countdown", text: "Enter your ME date for a daily countdown, with a last-minute summary and reminders the day before." },
  ],
};

const ABOUT: Benefit[] = [
  { icon: HeartHandshake, title: "Who we are", text: "Soma Preparations is an online platform that helps graduates in Bhutan prepare for the BCSE: the Preliminary Examination (PE) and the Main Examination (ME)." },
  { icon: MapPin, title: "For every graduate, wherever you are", text: "Many graduates live in remote places without coaching classes or study materials. With Soma, all you need is your phone: practice, papers, feedback and news, anytime." },
  { icon: BookOpen, title: "What we teach", text: "English, Dzongkha, Aptitude and Data Interpretation for the PE (with OMR shading practice), and written answers for your ME entry: General, Technical and Dzongkha graduates." },
  { icon: Brain, title: "AI that helps you learn", text: "Instant marking with explanations, AI marking of your written answers (typed or handwritten) with feedback, and a coach that shows you where to gain marks." },
  { icon: Newspaper, title: "Current affairs every day", text: "Short daily notes on Bhutan and world news, with quizzes, so you stay ready for the exam." },
  { icon: Sparkles, title: "Why sign up", text: "Start free, practise every day, learn from your mistakes and see your progress. Soma helps you prepare well; RCSC sets the exam and the cut-off each year." },
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

/** Below the PE / ME boxes: what each exam includes, and about Soma. */
export function ChooserInfo({ packages }: { packages: Record<Stage, PackageInfo> }) {
  return (
    <div className="mx-auto mt-10 max-w-lg space-y-8">
      <div className="text-center">
        <HeartHandshake className="mx-auto size-8 text-primary" aria-hidden />
        <h2 className="mt-2 text-xl font-extrabold text-ink">What you get with Soma</h2>
        <p className="mt-1 text-sm text-muted-foreground">Who we are, and what is included for each exam.</p>
      </div>
      <section aria-labelledby="info-about" className="space-y-3">
        <h3 id="info-about" className="text-lg font-extrabold text-ink">About Soma Preparations</h3>
        <Grid items={ABOUT} />
      </section>
      {(["PE", "ME"] as const).map((s) => (
        <section key={s} aria-labelledby={`info-${s}`} className="space-y-3">
          <div className="flex items-baseline justify-between gap-3">
            <h3 id={`info-${s}`} className="text-lg font-extrabold text-ink">{s === "PE" ? "PE · Preliminary Examination" : "ME · Main Examination"}</h3>
            {packages[s] ? <span className="shrink-0 text-sm font-bold text-ink">Premium Nu {packages[s]!.price.toLocaleString("en-IN")}</span> : null}
          </div>
          <Grid items={BENEFITS[s]} stage={s} />
        </section>
      ))}
    </div>
  );
}

/** Below the Free / Premium boxes: why Premium is worth it. */
export function WhyPremium({ stage }: { stage: Stage }) {
  return (
    <div className="space-y-6 pt-4">
      <section aria-labelledby="why-h" className="space-y-3">
        <h2 id="why-h" className="text-xl font-extrabold text-ink">Why go Premium?</h2>
        <p className="text-sm text-muted-foreground">
          {stage === "PE"
            ? "Free lets you try a few questions. Premium gives you everything you need to prepare for the PE properly:"
            : "ME Premium gives you everything you need to prepare for your written papers:"}
        </p>
        <Grid items={BENEFITS[stage]} stage={stage} />
      </section>
    </div>
  );
}
