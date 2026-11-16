import type { Metadata } from "next";
import { ExamArea, FREE_POINTS, PackageChoice } from "@/components/student/exam-flow";
import { requireUser } from "@/lib/auth/dal";
import { loadArea, loadPackage } from "@/lib/student/area";
import { loadExamState } from "@/lib/student/exam-state";

export const metadata: Metadata = { title: "PE" };

/** PE: choose Free or Premium the first time, then the PE area. */
export default async function PePage() {
  const user = await requireUser("/dashboard/pe");
  const state = await loadExamState(user.id);
  if (!state.started.PE) {
    return <PackageChoice stage="PE" pkg={await loadPackage("PE")} free={FREE_POINTS.PE} />;
  }
  return <ExamArea d={await loadArea("PE", state)} />;
}
