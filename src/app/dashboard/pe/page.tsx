import type { Metadata } from "next";
import { ExamArea, FREE_POINTS, PackageChoice } from "@/components/student/exam-flow";
import { requireUser } from "@/lib/auth/dal";
import { loadArea, loadPackage } from "@/lib/student/area";
import { loadExamState } from "@/lib/student/exam-state";
import { ScoresHint } from "@/components/student/scores-hint";

export const metadata: Metadata = { title: "PE" };

/** PE: choose Free or Premium the first time, then the PE area. */
export default async function PePage({ searchParams }: PageProps<"/dashboard/pe">) {
  const user = await requireUser("/dashboard/pe");
  const state = await loadExamState(user.id);
  const sp = await searchParams;
  const plans = sp.plans === "1";
  if (!state.started.PE || plans) {
    return <PackageChoice stage="PE" pkg={await loadPackage("PE")} free={FREE_POINTS.PE} onFree={state.started.PE} />;
  }
  return (
    <>
      <ExamArea d={await loadArea("PE", state)} />
      {sp.scores === "1" ? <ScoresHint /> : null}
    </>
  );
}
