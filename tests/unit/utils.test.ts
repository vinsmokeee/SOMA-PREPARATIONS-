import { describe, expect, it } from "vitest";
import { formatNu, formatPercent, safeRedirectPath, toRoman } from "@/lib/utils";

describe("formatNu", () => {
  it("formats whole and fractional Ngultrum amounts", () => {
    expect(formatNu(499)).toBe("Nu. 499");
    expect(formatNu("799")).toBe("Nu. 799");
    expect(formatNu(1250.5)).toBe("Nu. 1,250.50");
    expect(formatNu(null)).toBe("—");
    expect(formatNu("abc")).toBe("—");
  });
});

describe("safeRedirectPath", () => {
  it("allows same-origin relative paths", () => {
    expect(safeRedirectPath("/dashboard")).toBe("/dashboard");
    expect(safeRedirectPath("/admin/users?q=a")).toBe("/admin/users?q=a");
  });
  it("blocks open redirects and junk", () => {
    for (const bad of ["//evil.com", "https://evil.com", "/\\evil.com", "evil", "", null, undefined, 42, "/ok\r\nSet-Cookie:x"]) {
      expect(safeRedirectPath(bad)).toBe("/dashboard");
    }
  });
});

describe("misc formatting", () => {
  it("roman numerals and percents", () => {
    expect(toRoman(3)).toBe("III");
    expect(toRoman(null)).toBe("");
    expect(formatPercent(40)).toBe("40%");
    expect(formatPercent("15.00")).toBe("15%");
    expect(formatPercent(null)).toBe("—");
  });
});
