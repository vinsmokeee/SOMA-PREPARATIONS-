import { describe, expect, it } from "vitest";
import { passageFolds, sharedParagraphs } from "@/lib/exam/passages";

const P = "Read the passage and answer the question.\n\n" + "A long passage about habits. ".repeat(10) + "\n\n";
const q = (n: number, question: string, group: string | null = "p1") => ({ exam_question_id: `q${n}`, number: n, stem: P + question, passage_group: group });

describe("reading passages shown once", () => {
  it("folds the passage on the second and later questions only", () => {
    const folds = passageFolds([q(1, "What is the main idea?"), q(2, "What does “remedy” mean?"), q(3, "Which title fits?"), q(4, "Unrelated", null)]);
    expect(folds.has("q1")).toBe(false);
    expect(folds.get("q2")).toEqual({ sharedLength: P.length - 2, firstNumber: 1 });
    expect(folds.get("q3")?.firstNumber).toBe(1);
    expect(folds.has("q4")).toBe(false);
  });
  it("cuts at a paragraph boundary", () => {
    expect(sharedParagraphs("Intro\n\nSame text\n\nQ one", "Intro\n\nSame text\n\nQ two")).toBe("Intro\n\nSame text".length);
  });
  it("does not fold questions that share only a short heading", () => {
    expect(passageFolds([q(1, "a", "g"), { exam_question_id: "x", number: 2, stem: "Read the passage and answer the question.\n\nOther", passage_group: "g" }]).size).toBe(0);
  });
});
