import { beforeEach, describe, expect, it, vi } from "vitest";

// Simulated database: records calls to the payment functions.
const calls: { fn: string; args: Record<string, unknown> }[] = [];
let seenEvents = new Set<string>();
let tx: { id: string; provider: string; provider_ref: string | null; status: string; raw?: unknown; amount?: number } | null = null;

vi.mock("@/lib/supabase/admin", () => ({
  createAdminClient: () => ({
    rpc: async (fn: string, args: Record<string, unknown>) => {
      calls.push({ fn, args });
      if (fn === "record_payment_event") {
        const k = `${args._provider}:${args._event_id}`;
        const isNew = !seenEvents.has(k);
        seenEvents.add(k);
        return { data: isNew, error: null };
      }
      if (fn === "confirm_payment") { if (tx) tx.status = "succeeded"; return { data: "ent", error: null }; }
      return { data: null, error: null };
    },
    from: () => ({
      select: () => ({ eq: () => ({ maybeSingle: async () => ({ data: tx }) }) }),
    }),
  }),
}));

process.env.PAYMENT_SANDBOX_SECRET = "test-secret";
const { handleWebhook, settleTransaction } = await import("@/lib/payments/process");
const { signSandbox, sandboxProvider } = await import("@/lib/payments/providers/sandbox");

const TX = "7a000000-0000-4000-8000-000000000001";
const body = (o: object) => JSON.stringify({ event_id: "evt-1", type: "payment.succeeded", transaction_id: TX, status: "succeeded", amount: 500, ...o });
const headers = (raw: string, sig = signSandbox(raw)) => new Headers({ "x-sandbox-signature": sig });

describe("payment webhooks", () => {
  beforeEach(() => { calls.length = 0; seenEvents = new Set(); tx = { id: TX, provider: "sandbox", provider_ref: "SBX-1", status: "initiated", raw: { sandbox_outcome: "succeeded" }, amount: 500 }; });

  it("verifies with the provider before activating, then ignores duplicates", async () => {
    const raw = body({});
    const first = await handleWebhook("sandbox", headers(raw), raw);
    expect(first).toEqual({ httpStatus: 200, outcome: { status: "activated" } });
    expect(calls.map((c) => c.fn)).toEqual(["record_payment_event", "confirm_payment"]);
    const again = await handleWebhook("sandbox", headers(raw), raw);
    expect(again.outcome.status).toBe("duplicate");
    expect(calls.filter((c) => c.fn === "confirm_payment")).toHaveLength(1);
  });

  it("rejects a forged signature and never confirms", async () => {
    const raw = body({ event_id: "evt-2" });
    const r = await handleWebhook("sandbox", headers(raw, "0".repeat(64)), raw);
    expect(r.httpStatus).toBe(401);
    expect(calls.some((c) => c.fn === "confirm_payment")).toBe(false);
  });

  it("does not trust the notification's claimed status: the provider decides", async () => {
    tx!.raw = { sandbox_outcome: "pending" };
    const raw = body({ event_id: "evt-3", status: "succeeded" });
    const r = await handleWebhook("sandbox", headers(raw), raw);
    expect(r.outcome.status).toBe("pending");
    expect(calls.some((c) => c.fn === "confirm_payment")).toBe(false);
  });

  it("records failures", async () => {
    tx!.raw = { sandbox_outcome: "failed" };
    expect((await settleTransaction(TX)).status).toBe("failed");
    expect(calls.some((c) => c.fn === "fail_payment")).toBe(true);
  });

  it("refuses unknown providers and malformed bodies", async () => {
    expect((await handleWebhook("nobank", new Headers(), "{}")).httpStatus).toBe(404);
    expect((await handleWebhook("sandbox", new Headers(), "not json")).httpStatus).toBe(400);
  });

  it("sandbox parses and signs consistently", async () => {
    const raw = body({ event_id: "evt-9" });
    const p = await sandboxProvider.parseWebhook({ headers: headers(raw), rawBody: raw });
    expect(p.ok && p.signatureValid && p.event.status).toBe("succeeded");
  });
});
