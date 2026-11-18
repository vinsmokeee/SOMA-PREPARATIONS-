import { describe, expect, it } from "vitest";
import { bhutanToday, countdownLabel, daysUntil, isAllowedExamDate, readSavedCountdown } from "@/lib/student/countdown";

describe("exam countdown", () => {
  const jan1 = new Date("2027-01-01T06:00:00Z"); // midday in Bhutan

  it("counts whole days in Bhutan time", () => {
    expect(bhutanToday(new Date("2026-12-31T19:00:00Z"))).toBe("2027-01-01"); // already 1 Jan in Thimphu
    expect(daysUntil("2027-03-25", jan1)).toBe(83);
    expect(daysUntil("2027-01-01", jan1)).toBe(0);
    expect(daysUntil("2026-12-30", jan1)).toBe(-2);
    expect(daysUntil("25/03/2027", jan1)).toBeNull();
  });

  it("labels the chip", () => {
    expect(countdownLabel("PE", 83)).toBe("PE in 83 days");
    expect(countdownLabel("ME", 1)).toBe("ME is tomorrow");
    expect(countdownLabel("PE", 0)).toContain("today");
    expect(countdownLabel("PE", -3)).toContain("passed");
  });

  it("accepts only dates from today to three years ahead", () => {
    expect(isAllowedExamDate("2027-03-25", jan1)).toBe(true);
    expect(isAllowedExamDate("2026-12-31", jan1)).toBe(false);
    expect(isAllowedExamDate("2031-01-01", jan1)).toBe(false);
  });

  it("reads only a well-formed saved countdown", () => {
    expect(readSavedCountdown('{"stage":"PE","date":"2027-03-25"}')).toEqual({ stage: "PE", date: "2027-03-25" });
    expect(readSavedCountdown('{"stage":"XX","date":"2027-03-25"}')).toBeNull();
    expect(readSavedCountdown("not json")).toBeNull();
    expect(readSavedCountdown(null)).toBeNull();
  });
});
