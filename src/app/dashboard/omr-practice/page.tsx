import type { Metadata } from "next";
import { PageTitle } from "@/components/app/app-shell";
import { OmrPractice } from "@/components/exam/omr-practice";
import { requireUser } from "@/lib/auth/dal";

export const metadata: Metadata = { title: "OMR sketch practice" };

export default async function OmrPracticePage() {
  await requireUser("/dashboard/omr-practice");
  return (
    <>
      <PageTitle title="OMR sketch practice" description="Shade the answer circles the way a scanner needs them, before the real exam." />
      <OmrPractice />
    </>
  );
}
