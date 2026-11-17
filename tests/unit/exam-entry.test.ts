import { describe, expect, it } from "vitest";
import { formatCutoffs, ME_RESULT_NOTE, PUBLIC_GROUP_LABELS } from "@/lib/exam/entry";
import { cutoffSchema, paperSectionSchema, paperUpdateSchema, specialisationUpdateSchema } from "@/lib/validation/admin";
import { questionPayloadSchema } from "@/lib/validation/question";

const uuid = "11111111-1111-4111-8111-111111111111";

describe("examination entries", () => {
  it("shows past cut-offs newest first as reference text", () => {
    expect(formatCutoffs([{ year: 2024, value: 50, unit: "percent" }, { year: 2025, value: 55, unit: "marks" }])).toBe("2025: 55 marks · 2024: 50%");
  });
  it("names the three offered ME pathways", () => {
    expect([PUBLIC_GROUP_LABELS.general, PUBLIC_GROUP_LABELS.technical, PUBLIC_GROUP_LABELS.dzongkha]).toEqual(["General Graduates", "Technical Graduates", "Dzongkha Graduates"]);
  });
  it("explains that ME results include academic marks and the viva", () => {
    expect(ME_RESULT_NOTE).toMatch(/written examination/);
    expect(ME_RESULT_NOTE).toMatch(/viva\/interview/);
  });
});

describe("structure validation", () => {
  it("keeps PE requirement unset unless chosen", () => {
    const base = { id: uuid, name: "Civil Engineering", subject_group_id: "", pe_rule_note: "", review_note: "", sort_order: "10", verification_status: "unverified" };
    expect(specialisationUpdateSchema.parse({ ...base, pe_required: "" }).pe_required).toBeNull();
    expect(specialisationUpdateSchema.parse({ ...base, pe_required: "no" }).pe_required).toBe(false);
    expect(specialisationUpdateSchema.parse({ ...base, pe_required: "yes" }).pe_required).toBe(true);
  });
  it("reads the BCSE years a specialisation was offered", () => {
    const base = { id: uuid, name: "Civil Engineering", subject_group_id: "", pe_rule_note: "", review_note: "", sort_order: "10", verification_status: "unverified", pe_required: "" };
    expect(specialisationUpdateSchema.parse({ ...base, offered_years: "2024, 2025 2026" }).offered_years).toEqual([2024, 2025, 2026]);
    expect(specialisationUpdateSchema.parse({ ...base, offered_years: "" }).offered_years).toEqual([]);
    expect(() => specialisationUpdateSchema.parse({ ...base, offered_years: "25" })).toThrow();
  });
  it("records where paper values come from", () => {
    const r = paperUpdateSchema.parse({ id: uuid, title: "PE", description: "", weightage_percent: "", duration_minutes: "150", question_count: "100", max_marks: "100", qualifying_marks: "", params_source: "founder_brief", params_note: "", verification_status: "unverified" });
    expect(r.params_source).toBe("founder_brief");
    expect(r.qualifying_marks).toBeNull();
    expect(r.bank_scope).toBeUndefined();
  });
  it("accepts sections with unknown counts", () => {
    const r = paperSectionSchema.parse({ id: "", paper_id: uuid, title: "Aptitude", subject_id: "", question_count: "", marks: "", formats: "MCQs", params_source: "", sort_order: "30" });
    expect(r.id).toBeNull();
    expect(r.question_count).toBeNull();
  });
  it("rejects a cut-off without a year", () => {
    expect(cutoffSchema.safeParse({ id: "", year: "", value: "55", unit: "marks", note: "", verification_status: "unverified" }).success).toBe(false);
  });
  it("accepts the new question formats and classification", () => {
    const r = questionPayloadSchema.parse({
      id: null, stage: "ME", question_type: "translation", stem: "Translate the passage into Dzongkha.", difficulty: "standard", marks: "10",
      is_free_sample: false, options: [], rubric: [], references: [], subject_id: "", topic_id: "", paper_id: "", category_id: "",
      word_limit: "", estimated_seconds: "", specialisation_id: uuid, subject_group_id: "", source_year: "2019", source_page: "3",
    });
    expect(r.source_year).toBe(2019);
    expect(r.specialisation_id).toBe(uuid);
    expect(r.subject_group_id).toBeNull();
  });
});
