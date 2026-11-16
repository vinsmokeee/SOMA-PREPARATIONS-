export type ExamStage = "PE" | "ME";
export type VerificationStatus = "official_verified" | "unverified" | "superseded";

export type Framework = {
  id: string;
  code: string;
  name: string;
  description: string | null;
  verification_status: VerificationStatus;
  source_document_id: string | null;
  verified_at: string | null;
};

export type Cycle = {
  id: string;
  code: string;
  name: string;
  year: number;
  status: string;
  registration_opens: string | null;
  registration_closes: string | null;
  pe_date: string | null;
  me_start_date: string | null;
  me_end_date: string | null;
  pe_cutoff_note: string | null;
  verification_status: VerificationStatus;
  source_document_id: string | null;
  notes: string | null;
};

export type Category = {
  id: string;
  code: string;
  name: string;
  description: string | null;
  eligibility_summary: string | null;
  pe_exempt: boolean;
  sort_order: number;
  public_group: "general" | "technical" | "dzongkha" | "bed" | null;
  is_offered: boolean;
  pe_rule_note: string | null;
};

export type Paper = {
  id: string;
  stage: ExamStage;
  code: string;
  paper_number: number | null;
  title: string;
  description: string | null;
  answer_format: "objective_omr" | "written" | "mixed";
  weightage_percent: number | null;
  max_marks: number | null;
  duration_minutes: number | null;
  question_count: number | null;
  params_source: "official" | "founder_brief" | "admin" | null;
  bank_scope: "common" | "subject_group" | "specialisation";
  verification_status: VerificationStatus;
  source_document_id: string | null;
  sort_order: number;
};

export type PaperCategory = { paper_id: string; category_id: string; weightage_percent: number | null };

export type MeComponent = {
  category_id: string;
  component: "academic_achievement" | "written_examination" | "viva_voce";
  weightage_percent: number;
};

export type Subject = {
  id: string;
  stage: ExamStage;
  slug: string;
  name: string;
  description: string | null;
  paper_id: string | null;
  is_official: boolean;
  sort_order: number;
};

export type Citation = {
  id: string;
  title: string;
  url: string;
  publisher: string;
  reference_number: string | null;
  published_on: string | null;
  last_retrieved_at: string | null;
};

export type ExamStructure = {
  framework: Framework | null;
  cycles: Cycle[];
  categories: Category[];
  papers: Paper[];
  paperCategories: PaperCategory[];
  meComponents: MeComponent[];
  subjects: Subject[];
  citations: Citation[];
  sections: PaperSection[];
  cutoffs: CutoffHistory[];
  specialisations: Specialisation[];
  subjectGroups: { id: string; name: string }[];
};

export type PaperSection = { id: string; paper_id: string; title: string; subject_id: string | null; question_count: number | null; marks: number | null; formats: string | null; params_source: string | null; sort_order: number };
export type CutoffHistory = { year: number; value: number; unit: "percent" | "marks"; verification_status: VerificationStatus; source_document_id: string | null };
export type Specialisation = { id: string; code: string; name: string; category_id: string; subject_group_id: string | null; pe_required: boolean | null; sort_order: number };

export type PackageSummary = {
  id: string;
  slug: string;
  name: string;
  tagline: string | null;
  description: string | null;
  price: number;
  promo_price: number | null;
  promo_starts_at: string | null;
  promo_ends_at: string | null;
  features: string[];
  includes_pe: boolean;
  includes_me: boolean;
  status: "draft" | "coming_soon" | "available" | "retired";
  access_days: number | null;
  access_ends_at: string | null;
  terms: string | null;
  cycle_name: string | null;
  sort_order: number;
};

export type DataResult<T> =
  | { ok: true; data: T; source: "database" | "fixture" }
  | { ok: false; reason: "not_configured" | "error"; message: string };
