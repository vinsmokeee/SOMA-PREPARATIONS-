import { handleWebhook } from "@/lib/payments/process";

/** Payment provider notifications: POST /api/payments/webhook/<provider>. */
export async function POST(request: Request, { params }: { params: Promise<{ provider: string }> }) {
  const { provider } = await params;
  if (!/^[a-z0-9_]{2,40}$/.test(provider)) return Response.json({ error: "unknown provider" }, { status: 404 });
  const raw = await request.text();
  if (raw.length > 256 * 1024) return Response.json({ error: "too large" }, { status: 413 });
  try {
    const { httpStatus, outcome } = await handleWebhook(provider, request.headers, raw);
    return Response.json({ received: true, outcome: outcome.status }, { status: httpStatus });
  } catch (e) {
    console.error("payment webhook failed", provider, e instanceof Error ? e.message : e);
    return Response.json({ error: "processing failed" }, { status: 500 });   // provider will retry
  }
}
