import "server-only";
import { cache } from "react";
import { redirect } from "next/navigation";
import { connection } from "next/server";
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
};

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
  };
});

/** Use in pages/layouts: redirects to sign-in when there is no valid session. */
export async function requireUser(next = "/dashboard"): Promise<CurrentUser> {
  const user = await getCurrentUser();
  if (!user) redirect(`/login?next=${encodeURIComponent(next)}`);
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
