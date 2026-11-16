import { NextResponse, type NextRequest } from "next/server";
import { createServerClient } from "@supabase/ssr";
import { ACCESS_COOKIE, accessToken, isOpenPath } from "@/lib/site-access";

/**
 * Runs before protected routes:
 *  1. Refreshes the Supabase session cookie (tokens are short-lived).
 *  2. Optimistically redirects signed-out visitors away from private areas.
 *
 * This is NOT the security boundary. Every protected page and server action
 * re-verifies the user (lib/auth/dal.ts) and the database enforces RLS.
 */
const PROTECTED_PREFIXES = ["/dashboard", "/admin", "/exam"];
// Paths that need the Supabase session refreshed here (others skip the auth call).
const SESSION_PREFIXES = ["/dashboard", "/admin", "/exam", "/login", "/register", "/auth", "/reset-password", "/verify-device", "/pay"];

export async function proxy(request: NextRequest) {
  // Private preview mode (SITE_ACCESS_CODE set): everything except /access and machine endpoints needs the code.
  const code = process.env.SITE_ACCESS_CODE;
  if (code && !isOpenPath(request.nextUrl.pathname)) {
    const ok = request.cookies.get(ACCESS_COOKIE)?.value === (await accessToken(code));
    if (!ok) {
      const gate = request.nextUrl.clone();
      gate.pathname = "/access";
      gate.search = "";
      gate.searchParams.set("next", request.nextUrl.pathname + request.nextUrl.search);
      return NextResponse.redirect(gate);
    }
  }
  if (!SESSION_PREFIXES.some((p) => request.nextUrl.pathname === p || request.nextUrl.pathname.startsWith(`${p}/`))) {
    return NextResponse.next();
  }

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY;
  const { pathname, search } = request.nextUrl;
  const isProtected = PROTECTED_PREFIXES.some((p) => pathname === p || pathname.startsWith(`${p}/`));

  if (!url || !key) {
    // Not configured: protected areas cannot work; send visitors to sign-in,
    // which explains the configuration state.
    if (isProtected) return redirectToLogin(request, pathname + search);
    return NextResponse.next();
  }

  let response = NextResponse.next({ request });

  const supabase = createServerClient(url, key, {
    cookies: {
      getAll() {
        return request.cookies.getAll();
      },
      setAll(cookiesToSet, headers) {
        for (const { name, value } of cookiesToSet) request.cookies.set(name, value);
        response = NextResponse.next({ request });
        for (const { name, value, options } of cookiesToSet) response.cookies.set(name, value, options);
        if (headers) {
          for (const [h, v] of Object.entries(headers)) response.headers.set(h, v);
        }
      },
    },
  });

  // A random, http-only device identifier for account security (recognised devices).
  let newDeviceId: string | null = null;
  if (!request.cookies.get("soma_did")) {
    const bytes = crypto.getRandomValues(new Uint8Array(32));
    newDeviceId = Array.from(bytes, (b) => b.toString(16).padStart(2, "0")).join("");
    request.cookies.set("soma_did", newDeviceId);
    response = NextResponse.next({ request });
  }

  // getClaims() validates the JWT and refreshes the session when needed.
  const { data } = await supabase.auth.getClaims();
  const signedIn = Boolean(data?.claims?.sub);

  if (newDeviceId) {
    response.cookies.set("soma_did", newDeviceId, { httpOnly: true, secure: true, sameSite: "lax", path: "/", maxAge: 60 * 60 * 24 * 730 });
  }
  if (isProtected && !signedIn) {
    return redirectToLogin(request, pathname + search, response);
  }

  return response;
}

function redirectToLogin(request: NextRequest, next: string, carry?: NextResponse) {
  const loginUrl = request.nextUrl.clone();
  loginUrl.pathname = "/login";
  loginUrl.search = "";
  loginUrl.searchParams.set("next", next);
  const redirect = NextResponse.redirect(loginUrl);
  carry?.cookies.getAll().forEach((c) => redirect.cookies.set(c));
  return redirect;
}

export const config = {
  // Every page (for private preview mode); static files and images are skipped.
  matcher: ["/((?!_next/static|_next/image|favicon.ico|icon|apple-icon|.*\\.(?:svg|png|jpg|jpeg|gif|webp|ico|txt|xml|woff2?)$).*)"],
};
