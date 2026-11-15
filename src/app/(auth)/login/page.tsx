import type { Metadata } from "next";
import Link from "next/link";
import { Suspense } from "react";
import { AuthCard } from "../auth-ui";
import { LoginForm } from "./login-form";

export const metadata: Metadata = { title: "Sign in" };

export default function LoginPage() {
  return (
    <AuthCard
      title="Sign in to Soma"
      description="Continue your BCSE preparation."
      footer={<>New to Soma? <Link href="/register" className="font-medium text-primary hover:underline">Create a free account</Link></>}
    >
      <Suspense>
        <LoginForm />
      </Suspense>
    </AuthCard>
  );
}
