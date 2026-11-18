import { describe, expect, it } from "vitest";
import { triageSchema } from "@/lib/ai/current-affairs";

describe("current-affairs triage schema", () => {
  it("keeps an article whose topic is not on the list, filing it under other", () => {
    const r = triageSchema.parse({ items: [{ n: 1, relevance: 80, area: "bhutan", category: "politics", countries: ["Bhutan"], kind: "fact", developing: false, sensitive: false, event_date: "" }] });
    expect(r.items[0].category).toBe("other");
    expect(r.items[0].area).toBe("bhutan");
  });
});
