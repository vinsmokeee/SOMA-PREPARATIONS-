import { describe, expect, it } from "vitest";
import { mapCsvRecord, type Lookups } from "@/lib/admin/question-csv";
import { csvToRecords, parseCsv, toCsv } from "@/lib/csv";

describe("CSV parser", () => {
  it("handles quotes, commas, escaped quotes and line breaks", () => {
    const rows = parseCsv('﻿a,b,c\r\n"x, y","He said ""hi""","line1\nline2"\n\n1,2,3');
    expect(rows).toEqual([["a", "b", "c"], ["x, y", 'He said "hi"', "line1\nline2"], ["1", "2", "3"]]);
  });
  it("normalises headers", () => {
    expect(csvToRecords(parseCsv("Option A,Correct \nx,B"))).toEqual([{ option_a: "x", correct: "B" }]);
  });
  it("round-trips through toCsv", () => {
    const data = [["a", 'q"uote', "com,ma"], ["1", "line\nbreak", ""]];
    expect(parseCsv(toCsv(data))).toEqual(data);
  });
});

const lookups: Lookups = {
  subjects: [{ id: "00000000-0000-4000-8000-000000000001", stage: "PE", slug: "data-interpretation", name: "Data interpretation ability" }],
  topics: [{ id: "00000000-0000-4000-8000-000000000002", subject_id: "00000000-0000-4000-8000-000000000001", slug: "percentages", name: "Percentages" }],
};

describe("question CSV mapping", () => {
  it("maps a valid MCQ row", () => {
    const r = mapCsvRecord({ stage: "pe", type: "MCQ", subject: "Data interpretation ability", topic: "percentages", question: "What is 25% of 200?", option_a: "25", option_b: "50", option_c: "75", option_d: "100", correct: "b", explanation: "0.25 × 200 = 50.", marks: "1" }, 2, lookups);
    expect(r.errors).toEqual([]);
    expect(r.payload?.options).toHaveLength(4);
    expect(r.payload?.options?.[1].is_correct).toBe(true);
  });
  it("reports every problem in a bad row", () => {
    const r = mapCsvRecord({ stage: "XE", type: "mcq", subject: "Nope", question: "Q?", option_a: "x", correct: "c" }, 3, lookups);
    expect(r.payload).toBeUndefined();
    expect(r.errors.join("; ")).toMatch(/stage must be PE or ME/);
    expect(r.errors.join("; ")).toMatch(/subject “Nope” not found/);
    expect(r.errors.join("; ")).toMatch(/correct answer C has no option text/);
  });
  it("maps written questions without options", () => {
    const r = mapCsvRecord({ stage: "ME", type: "essay", question: "Discuss public service in Bhutan.", model_answer: "A model.", marks: "20", word_limit: "400" }, 4, lookups);
    expect(r.errors).toEqual([]);
    expect(r.payload?.question_type).toBe("essay");
  });
});
