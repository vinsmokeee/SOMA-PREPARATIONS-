import { describe, expect, it } from "vitest";
import { buildAnalysisPrompt, buildGenerationPrompt, checkMcqDraft, checkWrittenDraft, cleanReferences, mcqDraftSchema, SYSTEM_PROMPT, type McqDraft } from "@/lib/ai/question-drafts";

const good: McqDraft = {
  stem: "A train covers 180 km in 3 hours. How long does 300 km take at the same speed?",
  options: ["4 hours", "5 hours", "5.5 hours", "6 hours"],
  correct_option: 1,
  explanation: "Speed is 60 km/h, so 300 km takes 5 hours; the other options use the wrong speed.",
  difficulty: "foundation",
  topic_suggestion: "Speed and time",
  references: [],
  fact_check_notes: "",
  confidence: "high",
};

describe("AI draft validation", () => {
  it("accepts a well-formed MCQ", () => expect(checkMcqDraft(good)).toEqual({ ok: true }));
  it("rejects malformed MCQs", () => {
    expect(checkMcqDraft({ ...good, options: ["a", "b", "c"] }).ok).toBe(false);
    expect(checkMcqDraft({ ...good, options: ["a", "b", "c", "A"] }).ok).toBe(false);
    expect(checkMcqDraft({ ...good, correct_option: 4 }).ok).toBe(false);
    expect(checkMcqDraft({ ...good, explanation: "Because." }).ok).toBe(false);
    expect(checkMcqDraft({ ...good, options: ["a", "b", "c", "All of the above"] }).ok).toBe(false);
  });
  it("checks written rubric totals", () => {
    const w = { stem: "Discuss the role of merit in public service.", question_type: "essay" as const, word_limit: 400, model_answer: "x".repeat(60), rubric: [{ label: "Content", description: "d", max_marks: 12 }, { label: "Structure", description: "d", max_marks: 8 }], references: [], fact_check_notes: "", confidence: "high" as const };
    expect(checkWrittenDraft(w, 20).ok).toBe(true);
    expect(checkWrittenDraft(w, 25)).toEqual({ ok: false, reason: "Rubric adds up to 20, not 25" });
  });
  it("keeps only safe https reference links", () => {
    expect(cleanReferences([{ citation: "Constitution of Bhutan, Article 10", url: "javascript:alert(1)" }, { citation: "", url: "https://x" }, { citation: "RCSC", url: "https://www.rcsc.gov.bt" }])).toEqual([
      { citation: "Constitution of Bhutan, Article 10", url: "" },
      { citation: "RCSC", url: "https://www.rcsc.gov.bt" },
    ]);
  });
  it("schema parses a typical model response", () => {
    expect(mcqDraftSchema.safeParse({ questions: [good] }).success).toBe(true);
  });
});

describe("prompts", () => {
  it("includes the request details, style examples and existing stems", () => {
    const p = buildGenerationPrompt({
      stage: "PE", kind: "mcq", subject: { name: "Data interpretation ability", description: null, isOfficial: true }, topic: "Percentages",
      difficulty: "standard", count: 5, marks: 1, styleExamples: [{ stem: "What is 25% of 200?", options: ["25", "50", "75", "100"], answer: "50" }], existingStems: ["What is 10% of 90?"],
      guidance: "Use Nu. amounts",
    });
    expect(p).toMatch(/Write 5 multiple-choice questions for the BCSE Preliminary Examination/);
    expect(p).toMatch(/named by the RCSC/);
    expect(p).toMatch(/Topic: Percentages/);
    expect(p).toMatch(/do not copy/);
    expect(p).toMatch(/What is 10% of 90\?/);
    expect(p).toMatch(/Use Nu\. amounts/);
  });
  it("system prompt forbids copying and predicting the real examination", () => {
    expect(SYSTEM_PROMPT).toMatch(/never reproduce questions from real past papers/);
    expect(SYSTEM_PROMPT).toMatch(/Never imply that a question predicts/);
  });
  it("analysis prompt lists years", () => {
    expect(buildAnalysisPrompt("English", [{ year: 2019, stem: "Q one" }, { year: null, stem: "Q two" }])).toMatch(/\[2019\] Q one[\s\S]*\[year unknown\] Q two/);
  });
});
