import { describe, expect, it } from "vitest";
import { buildCheckPrompt, buildVariationPrompt, mcqVariationSchema, reviewVerdict, VARIATION_TYPES, wordSimilarity, type DraftCheckResult } from "@/lib/ai/question-variations";
import { originLabel } from "@/lib/exam/origin";

const goodCheck: DraftCheckResult = { number: 1, chosen_option: 2, clear: true, single_correct: true, plausible_distractors: true, syllabus_fit: true, factual_concerns: "", model_answer_ok: true, difficulty: "standard" };
const source = { stage: "PE" as const, kind: "mcq" as const, origin: "historical_official", sourceYear: 2019, subject: "Data Interpretation", topic: "Percentages",
  stem: "A shop sells 40 kg of rice at Nu 60 per kg. What is the total?", options: ["Nu 2,000", "Nu 2,400", "Nu 2,600", "Nu 3,000"], answer: "Nu 2,400", marks: 1 };

describe("variation prompt", () => {
  it("lists the requested types in order and includes the source and its key", () => {
    const p = buildVariationPrompt(source, ["harder", "new_numbers"]);
    expect(p).toMatch(/1\. harder/);
    expect(p).toMatch(/2\. new_numbers/);
    expect(p).toContain(source.stem);
    expect(p).toContain("Correct answer: Nu 2,400");
    expect(p).toMatch(/past RCSC paper \(2019\)\. Do not reproduce it/);
  });
  it("never sends the answer key to the independent checker", () => {
    const p = buildCheckPrompt("Data Interpretation", "PE", [{ stem: "Q?", options: ["a", "b", "c", "d"] }]);
    expect(p).toContain("Question 1: Q?");
    expect(p).not.toMatch(/correct|answer key/i);
  });
  it("has seven distinct variation types", () => {
    expect(new Set(VARIATION_TYPES.map((v) => v.key)).size).toBe(7);
  });
  it("accepts a well-formed AI response", () => {
    const r = mcqVariationSchema.safeParse({ concept: "Multiplication", questions: [{
      stem: "A farmer sells 25 kg of chillies at Nu 120 per kg. What does he receive?", options: ["Nu 2,500", "Nu 3,000", "Nu 3,200", "Nu 2,800"], correct_option: 1,
      explanation: "25 × 120 = 3,000; the others use wrong products.", difficulty: "standard", topic_suggestion: "Percentages", references: [],
      fact_check_notes: "", confidence: "high", variation_type: "new_numbers", what_changed: "Different product, quantity and price." }] });
    expect(r.success).toBe(true);
  });
});

describe("automatic check verdict", () => {
  it("passes when the independent solver agrees and finds no issues", () => {
    expect(reviewVerdict("mcq", 2, "high", goodCheck, 0.2)).toEqual({ verdict: "pass", issues: [] });
  });
  it("flags a disagreement about the answer", () => {
    const v = reviewVerdict("mcq", 1, "high", goodCheck, 0.2);
    expect(v.verdict).toBe("flag");
    expect(v.issues[0]).toMatch(/Checker chose option C/);
  });
  it("flags ambiguity, facts to check, low confidence and closeness to the source", () => {
    const v = reviewVerdict("mcq", 2, "low", { ...goodCheck, single_correct: false, factual_concerns: "Year of event" }, 0.7);
    expect(v.issues).toEqual(expect.arrayContaining(["More than one option may be correct", "Facts to check: Year of event", "The writer had low confidence", "Close to the source wording"]));
  });
  it("flags when the check could not run", () => {
    expect(reviewVerdict("written", null, "high", undefined, 0).verdict).toBe("flag");
  });
  it("ignores the chosen option for written questions", () => {
    expect(reviewVerdict("written", null, "high", { ...goodCheck, chosen_option: -1 }, 0).verdict).toBe("pass");
  });
});

describe("near-copy guard", () => {
  it("scores reworded copies high and real variations low", () => {
    expect(wordSimilarity(source.stem, "A shop sells 40 kg of rice at Nu 60 per kg. What is the total amount?")).toBeGreaterThan(0.8);
    expect(wordSimilarity(source.stem, "A farmer sells 25 kg of chillies at Nu 120 per kg. What does he receive?")).toBeLessThan(0.5);
  });
});

describe("origin labels for students", () => {
  it("distinguishes past papers, AI variations, AI originals and Soma questions", () => {
    expect(originLabel("historical_official", 2019)).toBe("From the RCSC 2019 examination paper");
    expect(originLabel("ai_variation")).toMatch(/AI-generated practice question based on another question/);
    expect(originLabel("ai_generated")).toMatch(/AI-generated practice question, reviewed/);
    expect(originLabel("original")).toBe("Soma practice question");
    expect(originLabel(null)).toBeNull();
  });
});
