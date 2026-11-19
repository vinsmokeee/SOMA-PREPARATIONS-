/** Learning analytics shapes and the pure logic behind readiness and recommendations. */

export type SubjectPerf = { id: string; name: string; stage: "PE" | "ME"; answered: number; correct: number; avg_seconds: number | null; last_at: string | null };
export type TopicPerf = { id: string; name: string; subject_id: string; subject: string; stage: "PE" | "ME"; answered: number; correct: number };
export type TrendPoint = { id: string; title: string; kind: string; stage: "PE" | "ME"; submitted_at: string; answered: number; correct: number };
export type Coverage = { stage: "PE" | "ME"; practised: number; total: number };

export type Performance = {
  totals: { attempts: number; answered: number; correct: number; time_seconds: number; written_answers: number; distinct_questions: number };
  by_subject: SubjectPerf[];
  by_topic: TopicPerf[];
  trend: TrendPoint[];
  coverage: Coverage[];
  mistakes: number;
};

export type PracticeOptions = {
  full_access: boolean;
  total: number;
  mistakes: number;
  subjects: { id: string; name: string; available: number; topics: { id: string; name: string; available: number }[] }[];
};

export const accuracy = (correct: number, answered: number) => (answered > 0 ? Math.round((correct / answered) * 100) : null);

export type ReadinessBand = "not_enough" | "foundations" | "developing" | "strong";
export type Readiness = { band: ReadinessBand; label: string; summary: string; reasons: string[] };

export const MIN_ANSWERS_FOR_ESTIMATE = 30;

/**
 * A Soma estimate of preparation for one stage, from the student's own practice.
 * Deliberately coarse and explained — never a probability of passing the BCSE.
 */
export function readiness(stage: "PE" | "ME", perf: Performance): Readiness {
  const subjects = perf.by_subject.filter((s) => s.stage === stage);
  const answered = subjects.reduce((n, s) => n + s.answered, 0);
  const correct = subjects.reduce((n, s) => n + s.correct, 0);
  const cov = perf.coverage.find((c) => c.stage === stage);
  const coveragePct = cov && cov.total > 0 ? Math.round((cov.practised / cov.total) * 100) : 0;
  const recent = perf.trend.filter((t) => t.stage === stage).slice(-5);
  const recentAcc = accuracy(recent.reduce((n, t) => n + t.correct, 0), recent.reduce((n, t) => n + t.answered, 0));
  const acc = accuracy(correct, answered);

  if (answered < MIN_ANSWERS_FOR_ESTIMATE) {
    return {
      band: "not_enough",
      label: "Not enough practice yet",
      summary: `Answer at least ${MIN_ANSWERS_FOR_ESTIMATE} ${stage} questions for an estimate (${answered} so far).`,
      reasons: [],
    };
  }
  const reasons = [
    `Overall accuracy ${acc}% across ${answered} answers`,
    recentAcc !== null ? `Recent accuracy ${recentAcc}% (last ${recent.length} attempts)` : null,
    cov ? `${cov.practised} of ${cov.total} subject areas practised` : null,
  ].filter(Boolean) as string[];
  const basis = recentAcc ?? acc ?? 0;
  if (basis >= 70 && coveragePct >= 80) return { band: "strong", label: "Strong", summary: "Consistently accurate across almost all subject areas. Keep sitting full timed examinations.", reasons };
  if (basis >= 50) {
    return {
      band: "developing",
      label: "Developing",
      summary: coveragePct < 80 ? "Good accuracy where you have practised — widen your practice to every subject area." : "Solid progress. Focus on your weakest topics to move up.",
      reasons,
    };
  }
  return { band: "foundations", label: "Building foundations", summary: "Work through each subject with topic practice and review every explanation.", reasons };
}

export type Recommendation = {
  kind: "weak_topic" | "weak_subject" | "unpractised" | "mistakes";
  title: string;
  detail: string;
  stage: "PE" | "ME";
  subjectId?: string;
  topicId?: string;
};

/** Up to `limit` concrete next steps, weakest first. */
export function recommendations(perf: Performance, options: Partial<Record<"PE" | "ME", PracticeOptions>>, limit = 4): Recommendation[] {
  const out: Recommendation[] = [];
  for (const stage of ["PE", "ME"] as const) {
    const o = options[stage];
    if (o && o.mistakes > 0) out.push({ kind: "mistakes", stage, title: `Review ${o.mistakes} question${o.mistakes === 1 ? "" : "s"} you got wrong`, detail: "Retry them and read the explanations." });
  }
  const weakTopics = perf.by_topic
    .filter((t) => t.answered >= 5)
    .map((t) => ({ t, acc: accuracy(t.correct, t.answered) ?? 0 }))
    .filter((x) => x.acc < 60)
    .sort((a, b) => a.acc - b.acc);
  for (const { t, acc } of weakTopics) out.push({ kind: "weak_topic", stage: t.stage, subjectId: t.subject_id, topicId: t.id, title: `Practise ${t.name}`, detail: `${acc}% accuracy in ${t.subject}` });
  const weakSubjects = perf.by_subject
    .filter((s) => s.answered >= 5)
    .map((s) => ({ s, acc: accuracy(s.correct, s.answered) ?? 0 }))
    .filter((x) => x.acc < 60 && !weakTopics.some((w) => w.t.subject_id === x.s.id))
    .sort((a, b) => a.acc - b.acc);
  for (const { s, acc } of weakSubjects) out.push({ kind: "weak_subject", stage: s.stage, subjectId: s.id, title: `Practise ${s.name}`, detail: `${acc}% accuracy so far` });
  for (const stage of ["PE", "ME"] as const) {
    for (const s of options[stage]?.subjects ?? []) {
      if (!perf.by_subject.some((p) => p.id === s.id)) out.push({ kind: "unpractised", stage, subjectId: s.id, title: `Start ${s.name}`, detail: `${s.available} question${s.available === 1 ? "" : "s"} available — not practised yet` });
    }
  }
  return out.slice(0, limit);
}

/**
 * One exam's results only (founder, 20 Nov 2026: ME scores must not show PE results, and the other way round).
 * Totals are recomputed from that exam's subjects and attempts.
 */
export function forStage(perf: Performance, stage: "PE" | "ME"): Performance {
  const by_subject = perf.by_subject.filter((s) => s.stage === stage);
  const trend = perf.trend.filter((t) => t.stage === stage);
  return {
    ...perf,
    by_subject,
    by_topic: perf.by_topic.filter((t) => t.stage === stage),
    trend,
    coverage: perf.coverage.filter((c) => c.stage === stage),
    totals: {
      attempts: trend.length,
      answered: by_subject.reduce((n, s) => n + s.answered, 0),
      correct: by_subject.reduce((n, s) => n + s.correct, 0),
      time_seconds: Math.round(by_subject.reduce((n, s) => n + s.answered * (s.avg_seconds ?? 0), 0)),
      written_answers: stage === "ME" ? perf.totals.written_answers : 0,
      distinct_questions: perf.totals.distinct_questions,
    },
  };
}
