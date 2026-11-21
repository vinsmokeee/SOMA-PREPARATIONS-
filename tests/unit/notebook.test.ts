import { describe, expect, it } from "vitest";
import { bySubject, notebookPapers, notesForPaper, paperName, type Note } from "@/components/student/notebook";

const note = (o: Partial<Note>): Note => ({
  question_id: Math.random().toString(), kind: "mcq", paper_id: null, paper_number: null, paper_title: null,
  subject: "English", subject_order: 1, stem: "Q", image_url: null, source_year: null, answer: "A", explanation: null,
  model_answer: null, score: null, max_score: null, saved_at: "2026-11-22T00:00:00Z", ...o,
});

describe("Your notebook", () => {
  it("groups notes by subject in the order given", () => {
    const g = bySubject([note({ subject: "English" }), note({ subject: "Logic" }), note({ subject: "English" })]);
    expect(g.map((x) => [x.subject, x.notes.length])).toEqual([["English", 2], ["Logic", 1]]);
  });
  it("shows the student's own Paper I, II and III; a note sits only under its own paper", () => {
    const own = [{ id: "p3", number: 3, title: "Paper III" }, { id: "p1", number: 1, title: "Paper I" }, { id: "p2", number: 2, title: "Paper II" }];
    const notes = [note({ paper_id: "other2", paper_number: 2, paper_title: "Another entry's Paper II" }), note({ paper_id: "p2", paper_number: 2 }), note({ paper_id: "p1", paper_number: 1 })];
    const tabs = notebookPapers(own, notes);
    expect(tabs.map((p) => p.id)).toEqual(["p1", "p2", "p3"]);
    expect(paperName(tabs[1])).toBe("Paper II");
    expect(notesForPaper(notes, tabs[1])).toHaveLength(1);
    expect(notesForPaper(notes, tabs[2])).toHaveLength(0);
  });
  it("without an entry, uses the papers that have notes", () => {
    expect(notebookPapers([], [note({ paper_id: "x2", paper_number: 2, paper_title: "Paper II" })]).map((p) => p.id)).toEqual(["x2"]);
  });
});
