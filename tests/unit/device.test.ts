import { describe, expect, it } from "vitest";
import { deviceLabel, isValidCountry, verifiedByEmail } from "@/lib/auth/device";

describe("device helpers", () => {
  it("labels common browsers", () => {
    expect(deviceLabel("Mozilla/5.0 (Linux; Android 14; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36")).toBe("Chrome on Android");
    expect(deviceLabel("Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1")).toBe("Safari on iPhone");
    expect(deviceLabel(null)).toBe("Unknown device");
  });
  it("recognises recent e-mail-link sign-ins only", () => {
    const now = 1_800_000_000;
    expect(verifiedByEmail([{ method: "password", timestamp: now }], now)).toBe(false);
    expect(verifiedByEmail([{ method: "otp", timestamp: now - 60 }], now)).toBe(true);
    expect(verifiedByEmail([{ method: "otp", timestamp: now - 3 * 86400 }], now)).toBe(false);
    expect(verifiedByEmail("nonsense", now)).toBe(false);
  });
  it("accepts two-letter country codes only", () => {
    expect(isValidCountry("BT")).toBe(true);
    expect(isValidCountry("Bhutan")).toBe(false);
  });
});
