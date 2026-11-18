import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { AppShell } from "@/components/app/app-shell";
import { ExamCountdown } from "@/components/app/exam-countdown";
import { CoachCard } from "@/components/exam/coach-card";
import { MockCta } from "@/components/exam/mock-cta";
import { ChooserInfo } from "@/components/student/exam-info";
import { CaPracticeBox } from "@/components/student/ca-practice-box";
import { coach } from "@/lib/exam/coach";
import { ResultHero, SectionBars } from "@/components/exam/result-hero";
import { studentNav } from "@/components/app/student-nav";
import { EntryPicker, ExamArea, ExamChooser, FREE_POINTS, PackageChoice, type AreaData } from "@/components/student/exam-flow";
import type { TrainingData } from "@/lib/training/model";

export const metadata: Metadata = { title: "Student flow preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of the student flow (SOMA_PUBLIC_DATA=fixture only). ?screen=choose|pe-packages|me-entry|me-technical|pe|pe-free|pe-new|pe-premium-new|me */
export default async function FlowPreviewPage({ searchParams }: PageProps<"/dev/home-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const screen = (await searchParams).screen ?? "choose";
  const id = (n: number) => `4d000000-0000-4000-8000-00000000000${n}`;
  const training: TrainingData = {
    today: "2026-11-24",
    plan: { id: id(0), cycle_no: 1, cycle_day: 6, cycle_days: 30, phase: "foundation", stage: "PE", focus: null },
    items: [
      { id: id(1), kind: "revision", title: "Revise past mistakes", detail: null, minutes: 5, questions: 5, status: "done", attempt_id: id(9), score: 4, max_score: 5, attempt_open: false },
      { id: id(2), kind: "practice", title: "Daily practice: mixed", detail: null, minutes: 15, questions: 15, status: "pending", attempt_id: null, score: null, max_score: null, attempt_open: null },
      { id: id(3), kind: "ca", title: "Question of the Day", detail: null, minutes: 2, questions: 0, status: "pending", attempt_id: null, score: null, max_score: null, attempt_open: null },
    ],
    stats: { current_streak: 5, best_streak: 7, rest_tokens: 0, active_days: 5, mastered: 2, active_today: true },
    badges: [], revision_due: 3, revision_total: 12, week: { goal: 100, answered: 64, days_active: 5 },
    bests: { weekly_test: null, monthly_mock: null, most_in_a_day: 32 }, subjects: [], exam_date: null,
  };
  const pePkg = { slug: "pe-premium", name: "PE Premium", price: 699, accessDays: 45, available: true,
    features: ["Every practice question in all four sections (English, Dzongkha, Aptitude, Data Interpretation)", "All timed mock tests, like the real PE", "Your daily plan with revision of your mistakes", "Explanations for every answer", "Scores and progress for every section", "Current affairs: daily news and quizzes"] };
  const mePkg = { slug: "me-premium", name: "ME Premium", price: 799, accessDays: 45, available: true,
    features: ["Written questions and papers for your entry", "100 AI-marked answers: type your answer or upload photos of your handwritten pages", "AI feedback: strengths, missing points and an improved answer", "Model answers and marking guides", "Current affairs: daily news and quizzes", "Scores and progress"] };
  const area = (over: Partial<AreaData>): AreaData => ({
    stage: "PE", entryLabel: null, premium: "Premium until 30 Jan 2027", openAttempt: { id: id(7), title: "Mock test: PE paper 1" },
    training, answered: 64, accuracy: 72, written: 0, freeUsedUp: false, aiMarks: null, premiumSlug: "pe-premium", ...over,
  });
  const cats = [["administrative", "Administrative Service"], ["finance", "Finance Service"], ["pgde", "Education Service (PGDE)"], ["dzongkha", "Dzongkha"], ["bed", "Education Service (B.Ed.)"], ["technical", "Technical Service"]];
  const meOptions = {
    categories: cats.map(([code, name], i) => ({ id: id(i + 1), code, name })),
    specialisations: [
      ...["General graduate", "Dzongkha graduate"].map((name, i) => ({ id: `5d000000-0000-4000-8000-00000000000${i}`, name, category_id: id(5) })),
      ...["Agriculture", "Agriculture Engineering", "Animal Science", "Architecture", "Civil Engineering", "Dental Surgery", "Electrical Engineering", "ICT", "Nursing"].map((name, i) => ({ id: `7d000000-0000-4000-8000-00000000000${i}`, name, category_id: id(6) })),
    ],
    groups: ["Engineering", "ICT", "Bio Science", "Medical Science", "Traditional Medicine (Drungtsho)", "Statistics", "Nursing", "Conservator"].map((name, i) => ({ id: `6d000000-0000-4000-8000-00000000000${i}`, name })),
  };
  const content = {
    choose: <><ExamChooser firstName="Pema" status={{ PE: null, ME: null }} /><ChooserInfo packages={{ PE: pePkg, ME: mePkg }} /></>,
    "pe-packages": <PackageChoice stage="PE" pkg={pePkg} free={FREE_POINTS.PE} />,
    "pe-upgrade": <PackageChoice stage="PE" pkg={pePkg} free={FREE_POINTS.PE} onFree />,
    "me-packages": <PackageChoice stage="ME" entryLabel="Technical Graduates · Civil Engineering" pkg={mePkg} free={FREE_POINTS.ME} />,
    "me-entry": <EntryPicker options={meOptions} cat={null} spec={null} />,
    "me-bed": <EntryPicker options={meOptions} cat="bed" spec={null} />,
    "me-technical": <EntryPicker options={meOptions} cat="technical" spec={null} />,
    "me-group": <EntryPicker options={meOptions} cat="technical" spec="7d000000-0000-4000-8000-000000000004" />,
    pe: <ExamArea d={area({})} />,
    "ca-box": <CaPracticeBox paid question={{ stem: "Which dzongkhag hosted this year's National Day celebration?" }} assessments={[{ id: id(1), slug: "ca-weekly-1", title: "Weekly Challenge · 10–16 Nov", question_count: 15 }]} />,
    "ca-done": <CaPracticeBox question={{ stem: "At COP31 in Antalya, which measure did UN Secretary-General António Guterres urge governments to adopt?" }} assessments={[]} paid={false} done={{ correct: true, attemptId: id(9) }} />,
    "mock-free": <div className="mx-auto max-w-2xl"><MockCta premium={false} /></div>,
    "mock-premium": <div className="mx-auto max-w-2xl"><MockCta premium /></div>,
    result: (
      <div className="mx-auto max-w-2xl space-y-6">
        <ResultHero title="Mock test: PE paper 1" score={68} max={100} correct={68} incorrect={24} unanswered={8} time="2h 05m of 150 min" stage="PE" cutoff={{ year: 2026, value: 55, unit: "percent" }} />
        <div>
          <h2 className="mb-3 text-lg font-bold">Score by section</h2>
          <SectionBars rows={[{ name: "English", correct: 20, total: 25, accuracy: 80 }, { name: "Dzongkha", correct: 14, total: 25, accuracy: 56 }, { name: "Aptitude", correct: 19, total: 25, accuracy: 76 }, { name: "Data Interpretation", correct: 15, total: 25, accuracy: 60 }]} />
        </div>
      </div>
    ),
    "result-coach": (
      <div className="mx-auto max-w-2xl space-y-6">
        <ResultHero title="Mock test: PE paper 1" score={58} max={100} correct={58} incorrect={40} unanswered={2} time="32m of 150 min" stage="PE" cutoff={{ year: 2026, value: 55, unit: "percent" }} />
        <CoachCard advice={coach({
          sections: [
            { name: "English", total: 25, correct: 17, incorrect: 8, unanswered: 0, accuracy: 68, timeSeconds: 0 },
            { name: "Dzongkha", total: 25, correct: 11, incorrect: 13, unanswered: 1, accuracy: 46, timeSeconds: 0 },
            { name: "Aptitude", total: 25, correct: 18, incorrect: 7, unanswered: 0, accuracy: 72, timeSeconds: 0 },
            { name: "Data Interpretation", total: 25, correct: 12, incorrect: 12, unanswered: 1, accuracy: 50, timeSeconds: 0 },
          ],
          total: 100, correct: 58, wrong: 40, skipped: 2, timeUsedSeconds: 32 * 60, timeAllowedMinutes: 150, negativeMarking: 0, autoSubmitted: false,
        })} />
      </div>
    ),
    "me-result": (
      <div className="mx-auto max-w-2xl space-y-6">
        <ResultHero title="Practice paper: General Paper II" score={34} max={50} correct={0} incorrect={0} unanswered={0} time="1h 40m of 180 min" stage="ME" cutoff={null} />
      </div>
    ),
    "pe-free": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: true })} />,
    "countdown-ask": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    countdown: <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "pe-new": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "pe-premium-new": <ExamArea d={area({ openAttempt: null })} />,
    me: <ExamArea d={area({ stage: "ME", entryLabel: "Technical Graduates · Civil Engineering", premium: null, openAttempt: null, training: null, written: 1, aiMarks: { used: 1, limit: 3 }, premiumSlug: "me-premium" })} />,
  }[screen as string] ?? null;
  return (
    <AppShell area="student" stage={String(screen).startsWith("me") ? "ME" : "PE"} unread={3}
      countdown={screen === "countdown-ask" ? <ExamCountdown saved={null} ask defaultStage="PE" /> : screen === "countdown" ? <ExamCountdown saved={{ stage: "PE", date: "2027-03-25" }} ask={false} defaultStage="PE" /> : undefined} sections={studentNav(false)} user={{ name: "Pema", email: "pema@example.com", roleLabel: "Student" }}>
      {content}
    </AppShell>
  );
}
