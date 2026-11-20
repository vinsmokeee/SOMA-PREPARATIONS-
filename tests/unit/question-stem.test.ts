import { describe, expect, it } from "vitest";
import { isTitleLine, stemBlocks } from "@/components/exam/question-stem";

describe("stemBlocks", () => {
  it("keeps plain text as one block", () => {
    expect(stemBlocks("What is 2 + 2?")).toEqual([{ kind: "text", text: "What is 2 + 2?" }]);
  });
  it("turns Markdown tables into rows and drops the separator", () => {
    const b = stemBlocks("Scores:\n\n| Mock | English |\n|---|---|\n| 1 | 23 |\n| 2 | 24 |\n\nWhich is higher?");
    expect(b).toEqual([
      { kind: "text", text: "Scores:" },
      { kind: "table", rows: [["Mock", "English"], ["1", "23"], ["2", "24"]] },
      { kind: "text", text: "Which is higher?" },
    ]);
  });
});

describe("passage titles", () => {
  it("shows a short title line as a heading, not the question or sentences", () => {
    const blocks = stemBlocks("Read the passage below.\n\nBhutaneseness: Preserving Identity in a Rapidly Changing World\n\nIn today's world, cultures blend.\n\nWhat is Bhutaneseness?");
    expect(blocks.map((b) => b.kind)).toEqual(["text", "heading", "text"]);
    expect(isTitleLine("Read the following passage carefully and translate it into English. (25 marks)")).toBe(false);
    expect(isTitleLine("a  z  b  ?  c  x")).toBe(false);
    expect(isTitleLine("ཚིག་ཚན་འདི་ལྷག་སྟེ་ དྲི་བ་ལུ་ལན་བྲིས།")).toBe(false);
  });
});
