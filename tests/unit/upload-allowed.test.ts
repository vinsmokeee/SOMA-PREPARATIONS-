import { describe, expect, it } from "vitest";
import { uploadAllowed } from "@/lib/exam/upload";

describe("uploadAllowed (same cases as supabase/tests/99_typed_only_english.sql)", () => {
  it("ME English answers are typed only", () => {
    expect(uploadAllowed("ME", "essay", "Write an essay on climate change in Bhutan.")).toBe(false);
    expect(uploadAllowed("ME", "short_answer", "Explain the role of the National Council.")).toBe(false);
  });
  it("Dzongkha answers and translation into Dzongkha can be uploaded", () => {
    expect(uploadAllowed("ME", "essay", "འོག་ལུ་བཀོད་ཡོད་པའི་ འབྲི་རྩོམ་ དོན་ཚན་གཉིས་ལས་ གཅིག་བྲིས།")).toBe(true);
    expect(uploadAllowed("ME", "translation", "འོག་ལུ་ཨིང་སྐད་ཀྱི་ཚིག་ཚན་འདི་ རྫོང་ཁའི་ཐོག་ལུ་སྐད་སྒྱུར་འབད། The King visited Paro.")).toBe(true);
  });
  it("translation into English is typed only", () => {
    expect(uploadAllowed("ME", "translation", "Read the following passage carefully and translate it into English. འབྲུག་གི་རྒྱལ་པོ།")).toBe(false);
  });
  it("drawing and working-out questions keep the upload option", () => {
    expect(uploadAllowed("ME", "long_answer", "Draw the bending moment diagram for the beam.")).toBe(true);
    expect(uploadAllowed("ME", "short_answer", "Calculate the effective depth of the slab.")).toBe(true);
  });
  it("MCQs never; other stages unchanged", () => {
    expect(uploadAllowed("ME", "mcq", "Draw nothing.")).toBe(false);
    expect(uploadAllowed("PE", "essay", "Write an essay on climate change.")).toBe(true);
  });
});
