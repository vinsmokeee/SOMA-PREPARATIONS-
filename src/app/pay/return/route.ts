import { NextResponse, type NextRequest } from "next/server";
import { getCurrentUser } from "@/lib/auth/dal";
import { settleTransaction } from "@/lib/payments/process";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Where a payment provider sends the student back. The browser's arrival here
 * proves nothing: the server asks the provider for the real status
 * (settleTransaction) and then shows the order.
 */
export async function GET(request: NextRequest) {
  const tx = request.nextUrl.searchParams.get("tx") ?? "";
  const user = await getCurrentUser();
  if (!/^[0-9a-f-]{36}$/i.test(tx) || !user) return NextResponse.redirect(new URL("/dashboard/subscription", request.url));
  const db = createAdminClient();
  const { data } = await db.from("payment_transactions").select("order_id, orders(user_id)").eq("id", tx).maybeSingle();
  const owner = (data?.orders as unknown as { user_id: string } | null)?.user_id;
  if (!data || owner !== user.id) return NextResponse.redirect(new URL("/dashboard/subscription", request.url));
  const outcome = await settleTransaction(tx).catch(() => ({ status: "pending" as const }));
  const result = outcome.status === "activated" ? "paid" : outcome.status === "failed" ? "failed" : "pending";
  return NextResponse.redirect(new URL(`/dashboard/subscription/order/${data.order_id}?result=${result}`, request.url));
}
