import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ChevronLeft } from "lucide-react";
import { Alert } from "@/components/ui/alert";
import { Badge } from "@/components/ui/badge";
import { requireUser } from "@/lib/auth/dal";
import { formatClock } from "@/lib/exam/logic";
import { KIND_LABELS, type CatalogueExam } from "@/lib/exam/types";
import { createClient } from "@/lib/supabase/server";
import { requestTimeMs } from "@/lib/utils";
import { StartForm } from "./start-form";

export const metadata: Metadata = { title: "Examination instructions" };

export default async function ExamInstructionsPage({ params }: PageProps<"/dashboard/exams/[slug]">) {
  const { slug } = await params;
  await requireUser(`/dashboard/exams/${slug}`);
  const supabase = await createClient();
  const { data } = await supabase.rpc("exam_catalogue", { _stage: null });
  const exam = ((data ?? []) as CatalogueExam[]).find((e) => e.slug === slug);
  if (!exam) notFound();
  const resume = Boolean(exam.open_attempt_id);
  const remainingMs = exam.open_deadline_at ? new Date(exam.open_deadline_at).getTime() - requestTimeMs() : 0;
  const isPE = exam.stage === "PE";

  const rules = isPE
    ? [
        "Each question has one correct answer. Select it by tapping the option.",
        "Use “Mark for review” to flag questions you want to check again.",
        "Use the question palette to move between questions in any order.",
        exam.omr_mode ? "You can also answer on the OMR-style answer sheet to practise the marking procedure." : null,
        exam.negative_mark_per_wrong > 0
          ? `In this Soma practice examination, ${exam.negative_mark_per_wrong} mark is deducted for each wrong answer. Unanswered questions score zero.`
          : "There is no negative marking in this Soma practice examination.",
      ]
    : [
        "Write your answers in the answer boxes. Word counts are shown as a guide.",
        "Answers are saved automatically while you type.",
        "Move between questions freely and use “Mark for review” to flag answers to revisit.",
        "After submission you will see model answers and marking rubrics. Written answers are not marked automatically.",
      ];

  return (
    <div className="mx-auto max-w-3xl">
      <Link href={`/dashboard/exams?stage=${exam.stage}`} className="inline-flex items-center gap-1 text-sm font-medium text-muted-foreground hover:text-ink">
        <ChevronLeft className="size-4" aria-hidden /> All {exam.stage} examinations
      </Link>
      <div className="mt-4 flex flex-wrap gap-2">
        <Badge tone="solid">{exam.stage === "PE" ? "Preliminary Examination" : "Main Examination"}</Badge>
        <Badge tone={exam.is_free ? "green" : "neutral"}>{exam.is_free ? "Free" : KIND_LABELS[exam.kind]}</Badge>
      </div>
      <h1 className="mt-3 font-serif text-3xl font-semibold tracking-tight">{exam.title}</h1>
      {exam.description ? <p className="mt-2 text-muted-foreground">{exam.description}</p> : null}

      <dl className="mt-6 grid grid-cols-2 gap-3 sm:grid-cols-4">
        {[
          ["Duration", `${exam.duration_minutes} minutes`],
          ["Questions", String(exam.question_count)],
          ["Total marks", exam.total_marks !== null ? String(Number(exam.total_marks)) : "—"],
          ["Answer format", isPE ? (exam.omr_mode ? "Objective · OMR" : "Objective") : "Written"],
        ].map(([k, v]) => (
          <div key={k} className="rounded-lg border border-border p-3">
            <dt className="text-xs text-muted-foreground">{k}</dt>
            <dd className="mt-0.5 font-semibold text-ink">{v}</dd>
          </div>
        ))}
      </dl>

      {resume ? (
        <Alert tone="warning" title="You have an examination in progress" className="mt-6">
          Your answers have been saved. The timer kept running while you were away
          {remainingMs > 0 ? ` — about ${formatClock(Math.floor(remainingMs / 1000))} remains` : ""}.
        </Alert>
      ) : null}

      <section className="mt-8">
        <h2 className="text-lg font-semibold">Instructions</h2>
        {exam.instructions ? <p className="mt-3 whitespace-pre-wrap leading-relaxed text-foreground">{exam.instructions}</p> : null}
        <ul className="mt-3 list-disc space-y-2 pl-5 leading-relaxed text-foreground marker:text-primary">
          {rules.filter(Boolean).map((r) => <li key={r as string}>{r}</li>)}
          <li>The timer keeps running if you refresh, close the page or lose connection. Return to resume where you left off.</li>
          <li>When time runs out your answers are submitted automatically.</li>
        </ul>
      </section>

      <Alert tone="info" className="mt-6">
        This is a Soma practice simulation. Its duration and number of questions are set by Soma and may differ from the
        official RCSC examination. Soma scores are not RCSC marks.
      </Alert>

      <div className="mt-8">
        <StartForm examId={exam.id} resume={resume} />
      </div>
    </div>
  );
}
