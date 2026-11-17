import { describe, expect, it } from "vitest";
import { stemBlocks } from "@/components/exam/question-stem";

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
