import { NextResponse, type NextRequest } from "next/server";
import { createServerClient } from "@supabase/ssr";

/**
 * Runs before protected routes:
 *  1. Refreshes the Supabase session cookie (tokens are short-lived).
 *  2. Optimistically redirects signed-out visitors away from private areas.
 *
 * This is NOT the security boundary. Every protected page and server action
 * re-verifies the user (lib/auth/dal.ts) and the database enforces RLS.
 */
const PROTECTED_PREFIXES = ["/dashboard", "/admin", "/exam"];

export async function proxy(request: NextRequest) {
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

  // getClaims() validates the JWT and refreshes the session when needed.
  const { data } = await supabase.auth.getClaims();
  const signedIn = Boolean(data?.claims?.sub);

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
  matcher: ["/dashboard/:path*", "/admin/:path*", "/exam/:path*", "/login", "/register", "/auth/:path*", "/reset-password"],
};
