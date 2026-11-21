import "server-only";
import { timingSafeEqual } from "node:crypto";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Scheduled jobs (Supabase Cron) call the API with a bearer token that only the
 * database and the server key can read. Returns an error response, or null when authorised.
 */
export async function cronUnauthorised(request: Request): Promise<Response | null> {
  const header = request.headers.get("authorization") ?? "";
  const given = header.startsWith("Bearer ") ? header.slice(7) : "";
  if (!given || given.length > 200) return Response.json({ error: "unauthorised" }, { status: 401 });
  let expected = "";
  try {
    const db = createAdminClient();
    const { data } = await db.from("ca_scheduler").select("token").eq("id", 1).maybeSingle();
    expected = data?.token ?? "";
  } catch {
    return Response.json({ error: "not configured" }, { status: 503 });
  }
  const a = Buffer.from(given), b = Buffer.from(expected);
  if (!expected || a.length !== b.length || !timingSafeEqual(a, b)) return Response.json({ error: "unauthorised" }, { status: 401 });
  return null;
}
