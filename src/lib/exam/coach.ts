import type { Breakdown } from "./logic";

/**
 * "Your coach" after an objective test: plain-language guidance from the
 * student's own result. Rule-based (instant, no AI cost).
 */
export type CoachInput = {
  sections: Breakdown[];          // per section (subject)
  total: number;                  // questions in the test
  correct: number;
  wrong: number;
  skipped: number;
  timeUsedSeconds: number;
  timeAllowedMinutes: number;
  negativeMarking: number;        // marks lost per wrong answer
  autoSubmitted: boolean;
};

export type CoachAdvice = {
  summary: string;
  gainMarks: { section: string; text: string }[];
  pace: { tone: "warn" | "good"; text: string } | null;
  skipped: string | null;
};

/** How to approach each PE section; matched loosely by name. */
export const SECTION_TIPS: { match: RegExp; tip: string }[] = [
  { match: /english/i, tip: "Read the whole sentence before choosing. For grammar, check subject–verb agreement and tense; for comprehension, find the line in the passage that proves your answer." },
  { match: /dzongkha/i, tip: "Read each word carefully. Revise spelling, grammar particles and common phrases; eliminate options that change the meaning." },
  { match: /aptitude|logic|reasoning/i, tip: "Write down what is given before solving. Look for the pattern step by step and test each option against it; do not guess the rule from one example." },
  { match: /data|interpretation/i, tip: "Read the table or chart title and units first. Do quick rough calculations, and check whether the question asks for a number, a percentage or a change." },
  { match: /current|general awareness|affairs/i, tip: "Read Soma's daily news summaries and take the Question of the Day; focus on Bhutan's institutions, plans and recent events." },
];
export const tipFor = (section: string) => SECTION_TIPS.find((t) => t.match.test(section))?.tip ?? "Review the explanations below for each question you missed, then practise this section again.";

export function coach(i: CoachInput): CoachAdvice {
  const attempted = i.correct + i.wrong;
  const lost = [...i.sections].filter((s) => s.incorrect + s.unanswered > 0)
    .sort((a, b) => (b.incorrect + b.unanswered) - (a.incorrect + a.unanswered));
  const parts = lost.slice(0, 3).map((s) => `${s.incorrect + s.unanswered} in ${s.name}`);
  const summary = i.wrong + i.skipped === 0
    ? `Excellent: all ${i.total} correct. Keep practising to stay sharp.`
    : `You lost marks on ${i.wrong + i.skipped} question${i.wrong + i.skipped === 1 ? "" : "s"}${parts.length ? `: ${parts.join(", ")}` : ""}.`;

  // Where marks are easiest to win back: most marks lost first.
  const gainMarks = lost.slice(0, 2).map((s) => ({
    section: s.name,
    text: `${s.incorrect + s.unanswered} mark${s.incorrect + s.unanswered === 1 ? "" : "s"} to gain here${s.accuracy !== null ? ` (you got ${s.accuracy}% right)` : ""}. ${tipFor(s.name)}`,
  }));

  // Pace: compare with the time allowed per question.
  const perQuestionAllowed = (i.timeAllowedMinutes * 60) / Math.max(i.total, 1);
  const perQuestionUsed = i.timeUsedSeconds / Math.max(attempted || i.total, 1);
  const minutesUsed = Math.round(i.timeUsedSeconds / 60);
  const accuracy = attempted ? (i.correct / attempted) * 100 : 0;
  let pace: CoachAdvice["pace"] = null;
  if (i.autoSubmitted || (i.skipped > i.total * 0.1 && i.timeUsedSeconds >= i.timeAllowedMinutes * 60 * 0.95)) {
    pace = { tone: "warn", text: `Time ran out. Aim for about ${Math.round(perQuestionAllowed)} seconds per question: answer the easy ones first, mark hard ones for review and come back to them.` };
  } else if (perQuestionUsed < perQuestionAllowed * 0.4 && accuracy < 75 && i.total >= 10) {
    pace = { tone: "warn", text: `You finished in ${minutesUsed} minute${minutesUsed === 1 ? "" : "s"}, much faster than the ${i.timeAllowedMinutes} allowed, and made mistakes you could avoid. Slow down: read every question and all options carefully before answering.` };
  } else if (attempted >= 10) {
    pace = { tone: "good", text: `Good pace: about ${Math.round(perQuestionUsed)} seconds per question.` };
  }

  const skipped = i.skipped === 0 ? null
    : i.negativeMarking > 0
      ? `You skipped ${i.skipped}. With negative marking, skip only when you cannot rule out any option.`
      : `You skipped ${i.skipped}. There is no negative marking in this test, so answer every question: rule out the wrong options and choose the best remaining one.`;

  return { summary, gainMarks, pace, skipped };
}
