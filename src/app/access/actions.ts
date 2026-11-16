"use server";

import { timingSafeEqual } from "node:crypto";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { ACCESS_COOKIE, accessToken, safeNext } from "@/lib/site-access";

export async function enterAccessCode(_prev: { error?: string }, formData: FormData): Promise<{ error?: string }> {
  const code = process.env.SITE_ACCESS_CODE;
  const next = safeNext(String(formData.get("next") ?? "/"));
  if (!code) redirect(next);
  const given = Buffer.from(String(formData.get("code") ?? "").trim());
  const expected = Buffer.from(code);
  if (given.length !== expected.length || !timingSafeEqual(given, expected)) {
    await new Promise((r) => setTimeout(r, 800)); // slow down guessing
    return { error: "That code is not correct." };
  }
  (await cookies()).set(ACCESS_COOKIE, await accessToken(code), { httpOnly: true, secure: true, sameSite: "lax", path: "/", maxAge: 60 * 60 * 24 * 30 });
  redirect(next);
}
