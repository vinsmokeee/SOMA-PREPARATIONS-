import { describe, expect, it } from "vitest";
import { packageUpdateSchema, paperUpdateSchema, roleChangeSchema } from "@/lib/validation/admin";
import { loginSchema, registerSchema, resetSchema } from "@/lib/validation/auth";
import { contactSchema } from "@/lib/validation/contact";
import { profileSchema } from "@/lib/validation/profile";

const uuid = "00000000-0000-4000-8000-000000000401";

describe("auth validation", () => {
  const base = { fullName: "Karma Wangmo", email: " Karma@Example.BT ", password: "dzong2026", confirmPassword: "dzong2026", acceptTerms: "on" };
  it("accepts a valid registration and normalises email", () => {
    const r = registerSchema.parse(base);
    expect(r.email).toBe("karma@example.bt");
  });
  it("rejects weak or mismatched passwords and missing consent", () => {
    expect(registerSchema.safeParse({ ...base, password: "short1", confirmPassword: "short1" }).success).toBe(false);
    expect(registerSchema.safeParse({ ...base, password: "onlyletters", confirmPassword: "onlyletters" }).success).toBe(false);
    expect(registerSchema.safeParse({ ...base, confirmPassword: "different1" }).success).toBe(false);
    expect(registerSchema.safeParse({ ...base, acceptTerms: undefined }).success).toBe(false);
  });
  it("login and reset", () => {
    expect(loginSchema.safeParse({ email: "a@b.bt", password: "" }).success).toBe(false);
    expect(resetSchema.safeParse({ password: "newpass123", confirmPassword: "newpass123" }).success).toBe(true);
  });
});

describe("contact validation", () => {
  it("requires a real message and a valid topic", () => {
    expect(contactSchema.safeParse({ name: "Sonam", email: "s@x.bt", topic: "general", message: "Hello, a question about PE." }).success).toBe(true);
    expect(contactSchema.safeParse({ name: "Sonam", email: "s@x.bt", topic: "general", message: "short" }).success).toBe(false);
    expect(contactSchema.safeParse({ name: "Sonam", email: "s@x.bt", topic: "hack", message: "Hello there friend" }).success).toBe(false);
  });
});

describe("profile validation", () => {
  it("accepts empty optional fields as null and validates dzongkhag", () => {
    const r = profileSchema.parse({ fullName: "Tashi", phone: "", dzongkhag: "", targetCycle: "" });
    expect(r.phone).toBeNull();
    expect(profileSchema.safeParse({ fullName: "Tashi", phone: "", dzongkhag: "Atlantis", targetCycle: "" }).success).toBe(false);
    expect(profileSchema.safeParse({ fullName: "Tashi", phone: "", dzongkhag: "Thimphu", targetCycle: "" }).success).toBe(true);
  });
});

describe("admin validation", () => {
  const pkg = { id: uuid, name: "PE Premium", tagline: "", description: "", price: "499", promo_price: "", promo_starts_at: "", promo_ends_at: "", access_days: "", access_ends_at: "", status: "coming_soon", features: "A\n\n B \n", terms: "" };
  it("parses package edits from form data", () => {
    const r = packageUpdateSchema.parse(pkg);
    expect(r.price).toBe(499);
    expect(r.promo_price).toBeNull();
    expect(r.features).toEqual(["A", "B"]);
  });
  it("refuses to make a package available without an access period", () => {
    expect(packageUpdateSchema.safeParse({ ...pkg, status: "available" }).success).toBe(false);
    expect(packageUpdateSchema.safeParse({ ...pkg, status: "available", access_days: "180" }).success).toBe(true);
  });
  it("refuses a promotional price that is not lower", () => {
    expect(packageUpdateSchema.safeParse({ ...pkg, promo_price: "600" }).success).toBe(false);
  });
  it("keeps unknown official values empty rather than zero", () => {
    const r = paperUpdateSchema.parse({ id: uuid, title: "Preliminary Examination", description: "", weightage_percent: "", duration_minutes: "", question_count: "", max_marks: "", verification_status: "official_verified" });
    expect(r.duration_minutes).toBeNull();
    expect(r.question_count).toBeNull();
  });
  it("never allows granting super_admin from the dashboard", () => {
    expect(roleChangeSchema.safeParse({ user_id: uuid, role: "super_admin" }).success).toBe(false);
    expect(roleChangeSchema.safeParse({ user_id: uuid, role: "content_reviewer" }).success).toBe(true);
  });
});
