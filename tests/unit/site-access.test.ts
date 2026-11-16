import { describe, expect, it } from "vitest";
import { accessToken, isOpenPath, safeNext } from "@/lib/site-access";

describe("private preview mode", () => {
  it("keeps machine endpoints and the gate open", () => {
    expect(isOpenPath("/access")).toBe(true);
    expect(isOpenPath("/api/cron/current-affairs")).toBe(true);
    expect(isOpenPath("/api/payments/webhook/sandbox")).toBe(true);
    expect(isOpenPath("/")).toBe(false);
    expect(isOpenPath("/admin")).toBe(false);
  });
  it("stores a hash, not the code", async () => {
    const t = await accessToken("secret-code");
    expect(t).toMatch(/^[0-9a-f]{64}$/);
    expect(t).not.toContain("secret");
    expect(await accessToken("secret-code")).toBe(t);
  });
  it("only redirects within the site", () => {
    expect(safeNext("/packages")).toBe("/packages");
    expect(safeNext("//evil.example")).toBe("/");
    expect(safeNext("https://evil.example")).toBe("/");
    expect(safeNext("/access")).toBe("/");
  });
});
