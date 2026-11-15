import type { Metadata } from "next";
import Link from "next/link";
import { AuthCard } from "../auth-ui";
import { RegisterForm } from "./register-form";

export const metadata: Metadata = { title: "Create a free account" };

export default function RegisterPage() {
  return (
    <AuthCard
      title="Create your free account"
      description="Save your progress, try free practice and upgrade when you are ready."
      footer={<>Already have an account? <Link href="/login" className="font-medium text-primary hover:underline">Sign in</Link></>}
    >
      <RegisterForm />
    </AuthCard>
  );
}
