import { describe, expect, it } from "vitest";
import { htmlToText, parseFeed } from "@/lib/ca/feed";
import { fingerprint, groupArticles, similarity } from "@/lib/ca/group";
import { bhutanDate, publishDecision, verificationOf, type StoryEvidence } from "@/lib/ca/rules";

// Test fixtures use example.test addresses and invented TEST headlines — not real news.
const rss = `<?xml version="1.0"?><rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/"><channel><title>T</title>
<item><title>TEST: Council approves new policy &amp; plan</title><link>https://example.test/a?utm_source=x</link><pubDate>Mon, 16 Nov 2026 03:00:00 GMT</pubDate>
<description><![CDATA[<p>First <b>paragraph</b>.</p><script>alert(1)</script>]]></description><content:encoded><![CDATA[<p>Full body text.</p>]]></content:encoded></item>
<item><title></title><link>https://example.test/empty</link></item>
<item><title>TEST no link</title></item>
<item><title>TEST bad link</title><link>javascript:alert(1)</link></item>
</channel></rss>`;
const atom = `<?xml version="1.0"?><feed xmlns="http://www.w3.org/2005/Atom"><entry><title>TEST Atom entry</title><link rel="alternate" href="https://example.test/atom"/><updated>2026-11-15T10:00:00Z</updated><summary>Short</summary></entry></feed>`;

describe("feed parsing", () => {
  it("parses RSS items, cleans HTML and tracking parameters, skips invalid entries", () => {
    const e = parseFeed(rss, { keepBody: true });
    expect(e).toHaveLength(1);
    expect(e[0]).toMatchObject({ title: "TEST: Council approves new policy & plan", url: "https://example.test/a", publishedAt: "2026-11-16T03:00:00.000Z", snippet: "First paragraph .", body: "Full body text." });
  });
  it("keeps bodies only when allowed", () => expect(parseFeed(rss)[0].body).toBeNull());
  it("parses Atom", () => expect(parseFeed(atom)[0]).toMatchObject({ title: "TEST Atom entry", url: "https://example.test/atom" }));
  it("returns nothing for broken XML", () => expect(parseFeed("<rss><channel><item>")).toEqual([]));
  it("strips scripts", () => expect(htmlToText("<p>a</p><script>x()</script>b")).toBe("a\nb"));
});

describe("grouping", () => {
  it("fingerprints ignore case, punctuation and filler words", () => expect(fingerprint("The Cabinet APPROVES the new Plan!")).toBe("cabinet approves plan"));
  it("groups the same story from two outlets but not different stories", () => {
    const a = { id: "1", fingerprint: fingerprint("TEST city authority signs investment agreement with developer"), publishedAt: "2026-11-15T00:00:00Z" };
    const b = { id: "2", fingerprint: fingerprint("TEST developer signs investment agreement with city authority"), publishedAt: "2026-11-15T06:00:00Z" };
    const c = { id: "3", fingerprint: fingerprint("TEST health ministry launches vaccination drive"), publishedAt: "2026-11-15T06:00:00Z" };
    expect(similarity(a.fingerprint, b.fingerprint)).toBeGreaterThanOrEqual(0.6);
    const g = groupArticles([a, b, c], []);
    expect([...g.values()].map((v) => v.length).sort()).toEqual([1, 2]);
  });
  it("joins an existing story and respects the time window", () => {
    const existing = [{ id: "e", fingerprint: fingerprint("TEST budget passed by parliament"), publishedAt: "2026-11-10T00:00:00Z", storyId: "s1" }];
    const near = { id: "n", fingerprint: fingerprint("TEST parliament passed budget"), publishedAt: "2026-11-11T00:00:00Z" };
    const far = { id: "f", fingerprint: fingerprint("TEST parliament passed budget"), publishedAt: "2026-11-30T00:00:00Z" };
    const g = groupArticles([near, far], existing);
    expect(g.get("story:s1")).toEqual(["n"]);
  });
});

const ev = (over: Partial<StoryEvidence> = {}): StoryEvidence => ({
  articles: [{ source: "Kuensel", tier: "established", kind: "fact", developing: false, sensitive: false }, { source: "BBS", tier: "established", kind: "fact", developing: false, sensitive: false }],
  noteConfidence: "high", conflicts: false, text: "TEST budget", ...over,
});

describe("verification and publishing rules", () => {
  it("publishes corroborated, high-confidence, non-sensitive stories", () => {
    expect(publishDecision(ev(), { auto_publish: true })).toMatchObject({ verification: "corroborated", publish: true });
  });
  it("treats official sources as verified", () => {
    expect(verificationOf(ev({ articles: [{ source: "UN News", tier: "official", kind: "fact", developing: false, sensitive: false }] }))).toBe("official");
  });
  it("holds single-source, developing, conflicting, opinion, low-confidence and sensitive stories", () => {
    const one = ev({ articles: [ev().articles[0]] });
    expect(publishDecision(one, {}).holdReason).toMatch(/only one source/);
    expect(publishDecision(ev({ articles: ev().articles.map((a) => ({ ...a, developing: true })) }), {}).verification).toBe("developing");
    expect(publishDecision(ev({ conflicts: true }), {}).verification).toBe("conflicting");
    expect(publishDecision(ev({ articles: ev().articles.map((a) => ({ ...a, kind: "opinion" as const })) }), {}).verification).toBe("opinion");
    expect(publishDecision(ev({ noteConfidence: "medium" }), {}).publish).toBe(false);
    expect(publishDecision(ev({ text: "TEST statement on national security" }), { sensitive_terms: ["national security"] }).holdReason).toMatch(/Sensitive/);
    expect(publishDecision(ev(), { auto_publish: false }).publish).toBe(false);
  });
  it("uses Bhutan time for the day", () => {
    expect(bhutanDate(new Date("2026-11-15T19:30:00Z"))).toBe("2026-11-16");
    expect(bhutanDate(new Date("2026-11-15T17:59:00Z"))).toBe("2026-11-15");
  });
});

import { buildNotePrompt, buildQuestionsPrompt, checkCaQuestion, NOTE_SYSTEM, type CaQuestion } from "@/lib/ai/current-affairs";

const mcq: CaQuestion = { format: "mcq", stem: "TEST: Which body approved the plan described?", options: ["Council", "Court", "Bank", "Board"], correct_option: 0, explanation: "The note states the council approved it.", model_answer: "", difficulty: "standard" };

describe("current-affairs AI checks", () => {
  it("accepts valid MCQ, true/false and written questions", () => {
    expect(checkCaQuestion(mcq)).toBeNull();
    expect(checkCaQuestion({ ...mcq, format: "true_false", options: ["True", "False"], correct_option: 1 })).toBeNull();
    expect(checkCaQuestion({ ...mcq, format: "analytical", options: [], correct_option: -1, model_answer: "x".repeat(60) })).toBeNull();
  });
  it("rejects malformed questions", () => {
    expect(checkCaQuestion({ ...mcq, options: ["a", "b", "c"] })).toMatch(/4 options/);
    expect(checkCaQuestion({ ...mcq, correct_option: 7 })).toMatch(/range/);
    expect(checkCaQuestion({ ...mcq, format: "fill_blank" })).toMatch(/no blank/);
    expect(checkCaQuestion({ ...mcq, format: "short_answer", model_answer: "" })).toMatch(/Model answer/);
  });
  it("note prompt numbers sources and forbids outside facts", () => {
    const p = buildNotePrompt([{ n: 1, outlet: "Kuensel", tier: "established", title: "TEST headline", date: "2026-11-15T00:00:00Z", url: "https://example.test", text: "TEST body" }]);
    expect(p).toMatch(/\[1\] Kuensel \(established, 2026-11-15\) — TEST headline/);
    expect(NOTE_SYSTEM).toMatch(/Use ONLY facts stated in the numbered sources/);
  });
  it("questions prompt asks for ME written questions when requested", () => {
    const note = { headline: "H", summary: "S", key_facts: [{ fact: "F", sources: [1] }], background: "", why_it_matters: "W", bhutan_relevance: "", important_dates: [], entities: { people: [], organisations: [], places: [] }, conflicts: false, conflict_note: "", confidence: "high" as const, importance: 80 };
    expect(buildQuestionsPrompt(note, 4, true)).toMatch(/short-answer and one analytical/);
  });
});

describe("feed ordering and links", () => {
  it("keeps the newest entries when a feed lists oldest first, and reads guid links", () => {
    const items = Array.from({ length: 60 }, (_, i) => `<item><title>TEST item ${i}</title><guid isPermaLink="true">https://example.test/${i}</guid><pubDate>${new Date(Date.UTC(2026, 9, 1 + i)).toUTCString()}</pubDate></item>`).join("");
    const e = parseFeed(`<rss><channel>${items}</channel></rss>`, { max: 40 });
    expect(e).toHaveLength(40);
    expect(e[0].title).toBe("TEST item 59");
    expect(e[0].url).toBe("https://example.test/59");
  });
});

import { outletOf } from "@/lib/ca/rules";
describe("aggregator outlets", () => {
  it("credits Google News items to the original outlet", () => {
    expect(outletOf("Google News — Bhutan", "TEST cabinet approves plan - Kuensel Online")).toBe("Kuensel Online");
    expect(outletOf("Google News — Bhutan", "TEST no suffix")).toBe("Google News — Bhutan");
    expect(outletOf("Kuensel", "TEST a - b")).toBe("Kuensel");
  });
});
