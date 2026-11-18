export type QuestionType = "mcq" | "short_answer" | "long_answer" | "essay" | "analytical" | "descriptive" | "translation" | "passage" | "case_study";
export type AttemptStatus = "in_progress" | "submitted" | "auto_submitted" | "abandoned";

export type PaperOption = { id: string; label: string; body: string };

export type PaperQuestion = {
  exam_question_id: string;
  number: number;
  section: string | null;
  marks: number;
  type: QuestionType;
  stem: string;
  image_url?: string | null;
  word_limit: number | null;
  options: PaperOption[];
};

export type SavedAnswer = {
  exam_question_id: string;
  selected_option_id: string | null;
  /** OMR mode: how the answer circle was shaded. */
  mark_quality?: MarkQuality | null;
  text_answer: string | null;
  flagged: boolean;
  time_spent_seconds: number;
};

export type MarkQuality = "good" | "too_light" | "outside";

/** What get_attempt_paper() returns for an open attempt. */
export type AttemptPaper = {
  attempt: { id: string; status: AttemptStatus; started_at: string; deadline_at: string; server_now: string };
  exam: {
    id: string;
    title: string;
    stage: "PE" | "ME";
    kind: string;
    instructions: string | null;
    duration_minutes: number;
    omr_mode: boolean;
    negative_mark_per_wrong: number;
  };
  questions: PaperQuestion[];
  answers: SavedAnswer[];
};

export type ResultOption = PaperOption & { is_correct: boolean };

export type Evaluation = {
  method: "automated" | "ai_feedback" | "expert";
  score: number | null;
  max_score: number | null;
  feedback: string | null;
  completed_at: string | null;
};

export type ResultQuestion = {
  exam_question_id: string;
  number: number;
  section: string | null;
  marks: number;
  type: QuestionType;
  stem: string;
  image_url?: string | null;
  word_limit: number | null;
  explanation: string | null;
  model_answer: string | null;
  subject: string | null;
  topic: string | null;
  difficulty: string;
  origin?: string | null;
  source_year?: number | null;
  options: ResultOption[];
  rubric: { label: string; description: string; max_marks: number }[];
  references: { citation: string; url: string | null }[];
  answer: {
    id: string;
    selected_option_id: string | null;
    mark_quality?: MarkQuality | null;
    text_answer: string | null;
    word_count: number | null;
    flagged: boolean;
    is_correct: boolean | null;
    marks_awarded: number | null;
    time_spent_seconds: number;
    evaluations: Evaluation[];
  } | null;
};

export type AttemptResult = {
  attempt: {
    id: string;
    status: AttemptStatus;
    started_at: string;
    submitted_at: string;
    deadline_at: string;
    time_spent_seconds: number;
    score: number;
    max_score: number;
    correct_count: number;
    incorrect_count: number;
    unanswered_count: number;
  };
  exam: { id: string; slug: string; title: string; stage: "PE" | "ME"; kind: string; duration_minutes: number; negative_mark_per_wrong: number };
  questions: ResultQuestion[];
};

export type CatalogueExam = {
  id: string;
  slug: string;
  title: string;
  description: string | null;
  instructions: string | null;
  stage: "PE" | "ME";
  kind: "mock" | "sample" | "historical" | "practice" | "revision";
  duration_minutes: number;
  is_free: boolean;
  omr_mode: boolean;
  negative_mark_per_wrong: number;
  question_count: number;
  total_marks: number | null;
  has_access: boolean;
  cycle_name: string | null;
  paper_title: string | null;
  category_name: string | null;
  open_attempt_id: string | null;
  open_deadline_at: string | null;
  completed_attempts: number;
  exam_year?: number | null;
  attribution?: string | null;
};

export const KIND_LABELS: Record<CatalogueExam["kind"], string> = {
  sample: "Free sample",
  mock: "Full mock",
  historical: "Historical paper",
  practice: "Practice set",
  revision: "Revision test",
};

export const TYPE_LABELS: Record<QuestionType, string> = {
  mcq: "Multiple choice",
  short_answer: "Short answer",
  long_answer: "Long answer",
  essay: "Essay",
  analytical: "Analytical",
  descriptive: "Descriptive",
  translation: "Translation",
  passage: "Passage-based",
  case_study: "Case study",
};
