import { NextResponse, type NextRequest } from "next/server";
import { getSignedOutReason } from "@/lib/auth/dal";
import { createClient } from "@/lib/supabase/server";

/**
 * Ends a session that Soma has revoked (device limit, "sign out other devices",
 * admin action) or whose account is restricted. It only signs out when the
 * server confirms the session is no longer allowed, so it cannot be abused to
 * sign people out.
 */
export async function GET(request: NextRequest) {
  const reason = await getSignedOutReason();
  if (reason) {
    const supabase = await createClient();
    await supabase.auth.signOut({ scope: "local" });
  }
  const url = new URL("/login", request.url);
  if (reason) url.searchParams.set("notice", reason);
  return NextResponse.redirect(url);
}
