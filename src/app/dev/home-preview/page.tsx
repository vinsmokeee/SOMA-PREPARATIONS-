import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { AppShell } from "@/components/app/app-shell";
import { ExamCountdown } from "@/components/app/exam-countdown";
import { bhutanToday } from "@/lib/student/countdown";
import { OmrPractice } from "@/components/exam/omr-practice";
import { ScoresHint } from "@/components/student/scores-hint";
import { LastMinuteSummary } from "@/components/student/last-minute-summary";
import { CoachCard } from "@/components/exam/coach-card";
import { MockCta } from "@/components/exam/mock-cta";
import { ChooserInfo } from "@/components/student/exam-info";
import { CaPracticeBox } from "@/components/student/ca-practice-box";
import { coach } from "@/lib/exam/coach";
import { ResultHero, SectionBars } from "@/components/exam/result-hero";
import { studentNav } from "@/components/app/student-nav";
import { EntryPicker, ExamArea, ExamChooser, FREE_POINTS, MeLocked, PackageChoice, type AreaData } from "@/components/student/exam-flow";
import type { TrainingData } from "@/lib/training/model";
import { PaperHome, type MeProgressPaper } from "@/components/student/paper-home";
import { MeResultPanel } from "@/components/exam/me-result-panel";
import { Notebook, type Note } from "@/components/student/notebook";

export const metadata: Metadata = { title: "Student flow preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of the student flow (SOMA_PUBLIC_DATA=fixture only). ?screen=choose|pe-packages|me-entry|me-technical|pe|pe-free|pe-new|pe-premium-new|me */
export default async function FlowPreviewPage({ searchParams }: PageProps<"/dev/home-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const screen = (await searchParams).screen ?? "choose";
  const today = bhutanToday();
  const tomorrow = new Date(Date.parse(`${today}T00:00:00Z`) + 86_400_000).toISOString().slice(0, 10);
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
    features: ["Written questions and papers for your entry", "100 AI-marked answers: type your answer or upload photos of your handwritten pages", "AI feedback: strengths, missing points and an improved answer", "Model answers and marking guides", "Current affairs: daily Bhutan and world news", "Scores and progress"] };
  const area = (over: Partial<AreaData>): AreaData => ({
    stage: "PE", entryLabel: null, premium: "Premium until 30 Jan 2027", openAttempt: { id: id(7), title: "Mock test: PE paper 1" },
    training, answered: 64, accuracy: 72, written: 0, freeUsedUp: false, aiMarks: null, premiumSlug: "pe-premium", ...over,
  });
  const cats = [["administrative", "Administrative Service"], ["finance", "Finance Service"], ["pgde", "Education Service (PGDE)"], ["dzongkha", "Dzongkha"], ["bed", "Education Service (B.Ed.)"], ["technical", "Technical Service"]];
  const mePapers = ["Languages and General Knowledge", "General Subject Knowledge (common to subject groups)", "Subject Specialisation (for a specific position)"]
    .map((title, i) => ({ id: `8d000000-0000-4000-8000-00000000000${i}`, number: i + 1, title }));
  let nbN = 0;
  const nb = (o: Partial<Note>): Note => ({ question_id: `nb-${++nbN}`, kind: "mcq", paper_id: null, paper_number: null, paper_title: null, subject: "English communication", subject_order: 1,
    stem: "Q", image_url: null, source_year: null, answer: null, explanation: null, model_answer: null, score: null, max_score: null, saved_at: "2027-01-03T00:00:00Z", ...o });
  const notes: Note[] = [
    nb({ stem: "Choose the word closest in meaning to PLATITUDE.", answer: "Cliché", explanation: "A platitude is a remark used too often to be interesting.", source_year: 2011 }),
    nb({ stem: "Choose the correct sentence.", answer: "Neither of the boys has finished.", explanation: "'Neither' takes a singular verb." }),
    nb({ subject: "Logic & analytical problem solving", subject_order: 3, stem: "A sum doubles in 8 years at simple interest. What is the rate per year?", answer: "12.5%", explanation: "Interest equals the principal in 8 years, so the rate is 100 ÷ 8 = 12.5%." }),
    nb({ paper_id: mePapers[0].id, paper_number: 1, paper_title: mePapers[0].title, subject: "General knowledge", stem: "Which Dzongkhag is the largest by area?", answer: "Gasa" }),
    nb({ kind: "written", paper_id: mePapers[0].id, paper_number: 1, paper_title: mePapers[0].title, subject: "Essay", stem: "Write an essay on the role of youth in nation building.", score: 14, max_score: 20, model_answer: "Introduction: youth as the largest group...\n\nBody: volunteering, entrepreneurship, civic duty...\n\nConclusion: ..." }),
  ];
  const at = (d: number) => new Date(Date.UTC(2027, 0, d)).toISOString();
  const meProgress: MeProgressPaper[] = [
    { ...mePapers[0], weight: 15, duration_minutes: null, max_marks: null, marked: 3, recent: 72, types: [{ type: "essay", count: 8 }, { type: "short_answer", count: 20 }], by_type: [], by_topic: [], mocks: [], mock_ready: false, pattern: [] },
    { ...mePapers[1], weight: 15, duration_minutes: null, max_marks: null, marked: 2, recent: 64, types: [{ type: "long_answer", count: 15 }], by_type: [], by_topic: [], mocks: [], mock_ready: false, pattern: [] },
    { ...mePapers[2], weight: 40, duration_minutes: 180, max_marks: 100, reading_minutes: 15, marked: 7, recent: 58,
      types: [{ type: "long_answer", count: 24 }, { type: "short_answer", count: 40 }, { type: "analytical", count: 12 }],
      by_type: [{ label: "short_answer", pct: 76, n: 3 }, { label: "analytical", pct: 41, n: 2 }],
      by_topic: [{ label: "Structural design", pct: 74, n: 2 }, { label: "Quantity estimation", pct: 44, n: 2 }],
      mocks: [{ at: at(5), pct: 52 }, { at: at(12), pct: 61 }, { at: at(19), pct: 66 }], mock_ready: true, pattern: [{ title: "Long answers", type: "long_answer", count: 4, marks_each: 20, answer_any: 3 }, { title: "Short answers", type: "short_answer", count: 8, marks_each: 5, answer_any: null }] },
  ];
  const meOptions = {
    categories: cats.map(([code, name], i) => ({ id: id(i + 1), code, name })),
    specialisations: [
      ...["B.Ed. General / Primary", "B.Ed. Secondary", "B.Ed. Dzongkha"].map((name, i) => ({ id: `5d000000-0000-4000-8000-00000000000${i}`, name, category_id: id(5) })),
      ...["Agriculture", "Agriculture Engineering", "Animal Science", "Architecture", "Civil Engineering", "Dental Surgery", "Electrical Engineering", "ICT", "Nursing"].map((name, i) => ({ id: `7d000000-0000-4000-8000-00000000000${i}`, name, category_id: id(6) })),
    ],
    groups: ["Engineering", "ICT", "Bio Science", "Medical Science", "Traditional Medicine (Drungtsho)", "Statistics", "Nursing", "Conservator"].map((name, i) => ({ id: `6d000000-0000-4000-8000-00000000000${i}`, name })),
  };
  const content = {
    choose: <><ExamChooser firstName="Pema" status={{ PE: null, ME: null }} /><ChooserInfo packages={{ PE: pePkg, ME: mePkg }} /></>,
    "pe-packages": <PackageChoice stage="PE" pkg={pePkg} free={FREE_POINTS.PE} />,
    "pe-upgrade": <PackageChoice stage="PE" pkg={pePkg} free={FREE_POINTS.PE} onFree />,
    "me-paper": <PaperHome p={meProgress[2]} />,
    "me-mock-result": <MeResultPanel attemptId="99999999-0000-4000-8000-000000000001" sum={{ retry: 5, skipped: 2, wrong: 1, low: 2, notMarked: 1 }} rows={[]} back="/dashboard/me" paperNumber={3} />,
    "me-retry-result": <MeResultPanel attemptId="99999999-0000-4000-8000-000000000001" sum={null} back="/dashboard/me" paperNumber={3}
      rows={[{ question_id: "a", pos: 1, before_score: 3, before_max: 10, now_score: 7, now_max: 10 }, { question_id: "b", pos: 2, before_score: null, before_max: 20, now_score: 12, now_max: 20 }, { question_id: "c", pos: 3, before_score: 0, before_max: 1, now_score: 1, now_max: 1 }, { question_id: "d", pos: 4, before_score: 4, before_max: 10, now_score: null, now_max: null }]} />,
    "me-packages": <MeLocked entryLabel="Technical Service · Civil Engineering · Engineering" papers={mePapers} pkg={mePkg} />,
    "me-entry": <EntryPicker options={meOptions} cat={null} spec={null} />,
    "me-services": <EntryPicker options={meOptions} cat="services" spec={null} />,
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
    "exam-eve": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "exam-day": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "me-countdown": <ExamArea d={area({ stage: "ME", entryLabel: "Administrative Service", premium: null, openAttempt: null, training: null, written: 0, aiMarks: { used: 0, limit: 3 }, premiumSlug: "me-premium" })} />,
    countdown: <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "omr-practice": <OmrPractice />,
    "last-minute": <LastMinuteSummary stage="PE" s={{ premium: true, answered: 64,
      sections: [{ subject: "Dzongkha communication", answered: 14, correct: 7 }, { subject: "Data interpretation", answered: 16, correct: 10 }, { subject: "English communication", answered: 18, correct: 14 }, { subject: "Logic & analytical problem solving", answered: 16, correct: 14 }],
      mistakes: [
        { stem: "Choose the word closest in meaning to the word in capitals.\n\nThe minister’s speech was full of PLATITUDES.", image_url: null, explanation: "Platitudes are remarks used too often to be interesting: clichés.", subject: "English communication", source_year: 2011, answer: "Clichés", past_paper: true },
        { stem: "A sum doubles in 8 years at simple interest. What is the rate per year?", image_url: null, explanation: "Interest = principal in 8 years, so rate = 100 ÷ 8 = 12.5%.", subject: "Logic & analytical problem solving", source_year: null, answer: "12.5%", past_paper: false },
      ],
      key_past: [{ stem: "Which word is the odd one out: apple, mango, potato, banana?", image_url: null, explanation: "Potato is a vegetable; the others are fruits.", subject: "Logic & analytical problem solving", source_year: 2010, answer: "Potato" }] }} />,
    "notebook-pe": <Notebook stage="PE" papers={[]} paperId={null} notes={notes.filter((n) => !n.paper_id)} />,
    "notebook-me": <Notebook stage="ME" papers={mePapers} paperId={null} notes={notes.filter((n) => n.paper_id)} />,
    "notebook-me-paper": <Notebook stage="ME" papers={mePapers} paperId={mePapers[0].id} notes={notes.filter((n) => n.paper_id)} />,
    "pe-scores": <><ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: true })} /><ScoresHint /></>,
    "pe-new": <ExamArea d={area({ premium: null, openAttempt: null, freeUsedUp: false })} />,
    "pe-premium-new": <ExamArea d={area({ openAttempt: null })} />,
    me: <ExamArea d={area({ stage: "ME", entryLabel: "Technical Service · Civil Engineering · Engineering", premium: "Premium until 30 Jan 2027", openAttempt: null, training: null, written: 1, aiMarks: { used: 1, limit: 100 }, premiumSlug: "me-premium", papers: mePapers })} />,
    "me-overall": <ExamArea d={area({ stage: "ME", entryLabel: "Technical Service · Civil Engineering · Engineering", premium: "Premium until 30 Jan 2027", openAttempt: null, training: null, written: 12, aiMarks: { used: 12, limit: 100 }, premiumSlug: "me-premium", papers: mePapers, progress: meProgress })} />,
  }[screen as string] ?? null;
  return (
    <AppShell area="student" stage={String(screen).startsWith("me") ? "ME" : "PE"} unread={3}
      countdown={screen === "countdown-ask" ? <ExamCountdown dates={{ PE: null, ME: null }} interest="PE" /> : screen === "countdown" ? <ExamCountdown dates={{ PE: "2027-03-25", ME: null }} interest="PE" /> : screen === "exam-eve" || screen === "exam-day" ? <ExamCountdown dates={{ PE: screen === "exam-eve" ? tomorrow : today, ME: null }} interest="PE" /> : screen === "me-countdown" ? <ExamCountdown dates={{ PE: tomorrow, ME: null }} interest="ME" /> : undefined} sections={studentNav(false)} user={{ name: "Pema", email: "pema@example.com", roleLabel: "Student" }}>
      {content}
    </AppShell>
  );
}
