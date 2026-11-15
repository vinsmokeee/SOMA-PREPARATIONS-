import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { connection } from "next/server";
import { EvaluationView, type EvaluationRow } from "@/components/written/evaluation-view";

export const metadata: Metadata = { title: "Evaluation preview", robots: { index: false } };
export const instant = false;

/** Development-only preview of the AI evaluation view (SOMA_PUBLIC_DATA=fixture only). */
export default async function WrittenPreviewPage({ searchParams }: PageProps<"/dev/written-preview">) {
  await connection();
  if (process.env.SOMA_PUBLIC_DATA !== "fixture") notFound();
  const sp = await searchParams;
  const scored = sp.scored !== "0";
  const ev: EvaluationRow = {
    id: "4b000000-0000-4000-8000-000000000001", status: "completed", score: scored ? 7 : null, max_score: 10, scored, confidence: sp.low === "1" ? "low" : "high",
    weakness_tags: ["lacks_examples", "weak_structure"], completed_at: new Date().toISOString(), improved_requested_at: null, error_message: null,
    rubric_scores: scored ? [{ criterion: "Content and accuracy", marks: 4.5, max_marks: 6, comment: "Correct on the role of the Constitution; separation of powers is thin." }, { criterion: "Structure", marks: 2.5, max_marks: 4, comment: "Clear introduction; conclusion missing." }] : [],
    details: {
      summary: "You show a reasonable understanding of constitutional monarchy and correctly identify the role of the Constitution.",
      strengths: ["Correctly identifies the role of the Constitution"], key_points_covered: ["Role of the Constitution"],
      key_points_missing: ["Separation of powers", "Relationship between the King, government and democratic institutions"],
      inaccuracies: [], structure_feedback: "Add a short conclusion that answers the question directly.",
      suggestions: ["Explain the separation of powers with an example."], uncertain_facts: "",
      notices: scored ? (sp.low === "1" ? ["The AI was not confident about parts of this evaluation. Treat it as a rough guide."] : []) : ["This question does not yet have an approved marking guide, so you receive feedback without a score."],
    },
  };
  return (
    <main id="main" className="mx-auto max-w-3xl p-6">
      <h1 className="mb-6 font-serif text-2xl font-semibold">Evaluation preview</h1>
      <EvaluationView ev={ev} answerId="5b000000-0000-4000-8000-000000000001" reported={false} />
    </main>
  );
}
