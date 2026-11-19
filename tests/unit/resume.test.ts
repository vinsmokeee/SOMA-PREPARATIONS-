import { describe, expect, it } from "vitest";
import { resumeIndex } from "@/lib/exam/resume";

const ids = ["a", "b", "c", "d"];
describe("resume an unfinished test", () => {
  it("reopens the question last open on this device", () => {
    expect(resumeIndex(2, ids, () => false)).toBe(2);
  });
  it("on another device, opens the first unanswered question", () => {
    expect(resumeIndex(null, ids, (id) => id === "a" || id === "b")).toBe(2);
  });
  it("opens the last question when all are answered", () => {
    expect(resumeIndex(null, ids, () => true)).toBe(3);
  });
  it("ignores a saved position that no longer fits", () => {
    expect(resumeIndex(9, ids, (id) => id === "a")).toBe(1);
    expect(resumeIndex(-1, ids, () => false)).toBe(0);
  });
});
