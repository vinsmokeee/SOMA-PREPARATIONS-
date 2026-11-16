import "server-only";
import { cache } from "react";
import { createHash } from "node:crypto";
import { cookies, headers } from "next/headers";
import { redirect } from "next/navigation";
import { connection } from "next/server";
import { DEVICE_COOKIE, deviceLabel, isValidCountry, verifiedByEmail } from "./device";
import { isSupabaseConfigured } from "@/lib/env";
import { createClient } from "@/lib/supabase/server";
import { isAppRole, type AppRole, type Permission } from "./permissions";

export type CurrentUser = {
  id: string;
  email: string | null;
  fullName: string;
  roles: AppRole[];
  permissions: Set<string>;
  isStaff: boolean;
  isSuperAdmin: boolean;
  /** Account security: the session must be confirmed by e-mail before continuing. */
  needsVerification: boolean;
  sessionId: string | null;
};

export type SessionState = "ok" | "verify" | "revoked" | "restricted" | "none";

/**
 * Account security (M8): records the device and session, applies the device
 * limit and risk rules (database function touch_session). Revoked sessions and
 * restricted accounts are treated as signed out.
 */
export function getSessionState(claims: Record<string, unknown>): Promise<SessionState> {
  const sessionId = typeof claims.session_id === "string" ? claims.session_id : null;
  if (!sessionId) return Promise.resolve("ok");
  return sessionStateFor(sessionId, verifiedByEmail(claims.amr, Math.floor(Date.now() / 1000)));
}

// Cached per request by primitive key, so the check runs once per page view.
const sessionStateFor = cache(async (sessionId: string, verified: boolean): Promise<SessionState> => {
  try {
    const [jar, h] = await Promise.all([cookies(), headers()]);
    const raw = jar.get(DEVICE_COOKIE)?.value ?? "";
    const deviceKey = createHash("sha256").update(raw || sessionId).digest("hex");
    const ua = h.get("user-agent");
    const country = h.get("x-vercel-ip-country");
    const supabase = await createClient();
    const { data, error } = await supabase.rpc("touch_session", {
      _session_id: sessionId, _device_key: deviceKey, _label: deviceLabel(ua), _country: isValidCountry(country) ? country : null,
      _user_agent: ua?.slice(0, 300) ?? null, _verified_method: verified,
    });
    if (error || !data) return "ok"; // never lock people out because of a monitoring failure
    const status = (data as { status?: string }).status;
    return status === "verify" || status === "revoked" || status === "restricted" ? status : "ok";
  } catch {
    return "ok";
  }
});

/**
 * Data Access Layer: the single place that resolves who the current user is.
 * Verifies the JWT (getClaims) rather than trusting the cookie contents.
 * Deduplicated per request with React cache().
 */
export const getCurrentUser = cache(async (): Promise<CurrentUser | null> => {
  // Always request-bound, so pages using it are never prerendered — even in a
  // build where Supabase is not configured.
  await connection();
  if (!isSupabaseConfigured()) return null;
  const supabase = await createClient();
  const { data: claimsData, error } = await supabase.auth.getClaims();
  const claims = claimsData?.claims;
  if (error || !claims?.sub) return null;

  const [profileRes, rolesRes, permsRes] = await Promise.all([
    supabase.from("profiles").select("full_name, is_active").eq("id", claims.sub).maybeSingle(),
    supabase.from("user_roles").select("role").eq("user_id", claims.sub),
    supabase.rpc("my_permissions"),
  ]);

  if (profileRes.data && profileRes.data.is_active === false) return null;
  const state = await getSessionState(claims as unknown as Record<string, unknown>);
  if (state === "revoked" || state === "restricted") return null;

  const roles = ((rolesRes.data ?? []) as { role: string }[]).map((r) => r.role).filter(isAppRole);
  const permissions = new Set(((permsRes.data ?? []) as string[]).filter((p) => typeof p === "string"));

  return {
    id: claims.sub,
    email: typeof claims.email === "string" ? claims.email : null,
    fullName: (profileRes.data?.full_name as string | undefined) ?? "",
    roles,
    permissions,
    isStaff: roles.some((r) => r !== "student"),
    isSuperAdmin: roles.includes("super_admin"),
    needsVerification: state === "verify",
    sessionId: typeof claims.session_id === "string" ? claims.session_id : null,
  };
});

/** Why there is no current user despite a valid sign-in cookie (revoked session, restricted account). */
export async function getSignedOutReason(): Promise<"revoked" | "restricted" | null> {
  if (!isSupabaseConfigured()) return null;
  const supabase = await createClient();
  const { data } = await supabase.auth.getClaims();
  if (!data?.claims?.sub) return null;
  const state = await getSessionState(data.claims as unknown as Record<string, unknown>);
  return state === "revoked" || state === "restricted" ? state : null;
}

/** Use in pages/layouts: redirects to sign-in when there is no valid session. */
export async function requireUser(next = "/dashboard", opts: { allowUnverified?: boolean } = {}): Promise<CurrentUser> {
  const user = await getCurrentUser();
  if (!user) {
    const reason = await getSignedOutReason();
    if (reason) redirect(`/auth/ended?reason=${reason}`);
    redirect(`/login?next=${encodeURIComponent(next)}`);
  }
  if (user.needsVerification && !opts.allowUnverified) redirect(`/verify-device?next=${encodeURIComponent(next)}`);
  return user;
}

export function can(user: CurrentUser | null, permission: Permission): boolean {
  return Boolean(user && (user.isSuperAdmin || user.permissions.has(permission)));
}

/** Use in pages: redirects non-holders to the student dashboard. */
export async function requirePermission(permission: Permission, next = "/admin"): Promise<CurrentUser> {
  const user = await requireUser(next);
  if (!can(user, permission)) redirect("/dashboard?notice=forbidden");
  return user;
}

export class AuthorizationError extends Error {
  constructor(message = "You do not have permission to perform this action.") {
    super(message);
    this.name = "AuthorizationError";
  }
}

/** Use in server actions: throws instead of redirecting. */
export async function assertPermission(permission: Permission): Promise<CurrentUser> {
  const user = await getCurrentUser();
  if (!user) throw new AuthorizationError("Your session has expired. Please sign in again.");
  if (!can(user, permission)) throw new AuthorizationError();
  return user;
}
