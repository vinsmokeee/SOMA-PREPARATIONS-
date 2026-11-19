import { describe, expect, it } from "vitest";
import { choiceProblems, choiceSections, chosenQuestions, hasChoice, sectionTitle } from "@/lib/exam/choice";
import type { PaperQuestion } from "@/lib/exam/types";

const part = (id: string, grp: string, order: number, any: number, marks = 10): PaperQuestion => ({
  exam_question_id: id, number: 0, section: `Part ${order} (answer any ${any} of the 2 questions)`, marks, type: "long_answer",
  stem: id, word_limit: null, options: [], choice_group: grp, choose_any: any, section_order: order,
});
const paper = [part("a1a", "g1", 1, 1), part("a1b", "g1", 1, 1), part("a2a", "g2", 1, 1), part("b1a", "g3", 2, 1, 20), part("b2a", "g4", 2, 1, 20)];

describe("choosing questions in an 'answer any N' paper", () => {
  it("groups parts into numbered questions per section", () => {
    const s = choiceSections(paper);
    expect(s.map((x) => [x.title, x.chooseAny, x.groups.map((g) => [g.number, g.parts.length, g.marks])])).toEqual([
      ["Part 1", 1, [[1, 2, 20], [2, 1, 10]]],
      ["Part 2", 1, [[3, 1, 20], [4, 1, 20]]],
    ]);
  });
  it("says what is missing or too many", () => {
    const s = choiceSections(paper);
    expect(choiceProblems(s, new Set(["g1"]))).toEqual(["Choose 1 more question in Part 2"]);
    expect(choiceProblems(s, new Set(["g1", "g2", "g3"]))).toEqual(["Remove 1 question in Part 1"]);
    expect(choiceProblems(s, new Set(["g1", "g4"]))).toEqual([]);
  });
  it("keeps only the chosen parts, renumbered, without the choice note", () => {
    expect(chosenQuestions(paper, ["g1", "g4"]).map((q) => [q.exam_question_id, q.number, q.section])).toEqual([["a1a", 1, "Part 1"], ["a1b", 2, "Part 1"], ["b2a", 3, "Part 2"]]);
  });
  it("recognises papers with a choice and cleans section titles", () => {
    expect(hasChoice(paper)).toBe(true);
    expect(hasChoice([{ ...paper[0], choose_any: null }])).toBe(false);
    expect(sectionTitle("Part A: X (answer any 2 of the 4 questions)")).toBe("Part A: X");
  });
});
