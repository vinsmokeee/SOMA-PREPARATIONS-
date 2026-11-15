import { describe, expect, it } from "vitest";
import { splitInlineOptions, splitQuestions } from "@/lib/imports/parse";
import { checkImportUrl, isPrivateAddress, normalizeUrl } from "@/lib/imports/url";

describe("URL checks (SSRF protection)", () => {
  it("accepts HTTPS links on allow-listed hosts", () => {
    const r = checkImportUrl("https://www.rcsc.gov.bt/wp-content/uploads/2026/06/BCSE.pdf");
    expect(r.ok).toBe(true);
  });
  it("rejects everything else", () => {
    for (const bad of [
      "http://rcsc.gov.bt/a.pdf",
      "https://evil.example.com/a.pdf",
      "https://rcsc.gov.bt.evil.com/a.pdf",
      "https://user:pass@rcsc.gov.bt/a.pdf",
      "https://rcsc.gov.bt:8443/a.pdf",
      "https://127.0.0.1/a.pdf",
      "https://[::1]/a.pdf",
      "file:///etc/passwd",
      "not a url",
    ]) {
      expect(checkImportUrl(bad).ok, bad).toBe(false);
    }
  });
  it("detects private and special addresses", () => {
    for (const a of ["10.0.0.1", "127.0.0.1", "169.254.169.254", "172.16.5.4", "192.168.1.1", "100.64.0.1", "0.0.0.0", "::1", "fd00::1", "fe80::1", "::ffff:10.0.0.1"]) {
      expect(isPrivateAddress(a), a).toBe(true);
    }
    for (const a of ["202.144.128.10", "8.8.8.8", "2001:4860:4860::8888"]) expect(isPrivateAddress(a), a).toBe(false);
  });
  it("normalises URLs for duplicate detection", () => {
    expect(normalizeUrl("https://RCSC.gov.bt:443/Path/File.pdf?utm_source=x#top")).toBe("https://rcsc.gov.bt/path/file.pdf");
  });
});

describe("question splitter", () => {
  it("parses numbered questions with options on separate lines and an answer key", () => {
    const text = `SECTION A: ENGLISH
1. Choose the correctly spelt word.
(a) Accomodate
(b) Accommodate
(c) Acommodate
(d) Acomodate
2. Choose the synonym of "meticulous".
(a) careless
(b) very careful
and precise
(c) hurried
(d) generous
ANSWER KEY
1. B 2. B`;
    const r = splitQuestions([text]);
    expect(r.candidates).toHaveLength(2);
    expect(r.answerKeyFound).toBe(true);
    const [q1, q2] = r.candidates;
    expect(q1).toMatchObject({ number: 1, section: "SECTION A: ENGLISH", stem: "Choose the correctly spelt word.", answer_label: "B", answer_source: "official_key" });
    expect(q1.options.map((o) => o.label)).toEqual(["A", "B", "C", "D"]);
    expect(q2.options[1].body).toBe("very careful and precise");
    expect(q1.issues).toEqual([]);
  });

  it("parses inline options and inline answers, across pages", () => {
    const r = splitQuestions([
      "Q1. 2, 6, 12, 20, 30, ?  (a) 40 (b) 42 (c) 44 (d) 36\nAnswer: B",
      "Page 2 of 3\nQ2. Average of 45, 55, 60, 80?\n(a) 55 (b) 60 (c) 62.5 (d) 65\nAns. (b)",
    ]);
    expect(r.candidates.map((c) => c.number)).toEqual([1, 2]);
    expect(r.candidates[0].stem).toBe("2, 6, 12, 20, 30, ?");
    expect(r.candidates[0].options.map((o) => o.body)).toEqual(["40", "42", "44", "36"]);
    expect(r.candidates[1]).toMatchObject({ page: 2, answer_label: "B" });
  });

  it("keeps multi-line stems and flags problems instead of guessing", () => {
    const r = splitQuestions([`1. Read the passage and answer.
The committee met on 3 March.
(a) one
(b) two
3. A question after a gap
(a) x
(b) y
(c) z
(d) w
Answer: E`]);
    expect(r.candidates[0].stem).toBe("Read the passage and answer.\nThe committee met on 3 March.");
    expect(r.candidates[0].issues.join(" ")).toMatch(/Only 2 options/);
    expect(r.candidates[1].issues.join(" ")).toMatch(/jump from 1 to 3/);
    expect(r.candidates[1].answer_label).toBe("E");
    expect(r.candidates[1].issues.join(" ")).toMatch(/E, which is not one of the options/);
    expect(r.candidates[1].confidence).toBeLessThan(1);
  });

  it("treats questions without options as possible written questions", () => {
    const r = splitQuestions(["1. Discuss the role of the civil service in nation building. (20 marks)"]);
    expect(r.candidates[0].issues.join(" ")).toMatch(/No answer options/);
  });

  it("warns when nothing looks like a question paper", () => {
    expect(splitQuestions(["Annual report of the Commission"]).warnings[0]).toMatch(/No numbered questions/);
  });

  it("splits inline options only when markers are in order", () => {
    expect(splitInlineOptions("(a) x (b) y (c) z")?.map((o) => o.label)).toEqual(["A", "B", "C"]);
    expect(splitInlineOptions("(a) x (c) y")).toBeNull();
  });
});
