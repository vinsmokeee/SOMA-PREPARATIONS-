import { expect, test } from "@playwright/test";

test("policy pages are published and linked from the footer", async ({ page }) => {
  for (const [path, heading] of [["/refunds", "Refund and cancellation policy"], ["/subscription-terms", "Subscription terms"], ["/account-policy", "Account-sharing policy"]] as const) {
    await page.goto(path);
    await expect(page.getByRole("heading", { level: 1, name: heading })).toBeVisible();
    await expect(page.getByText("Draft for legal review")).toBeVisible();
  }
  await page.goto("/");
  await expect(page.getByRole("link", { name: "Refunds" })).toBeVisible();
});

test("payment endpoints refuse unauthenticated or unknown callers", async ({ request }) => {
  expect((await request.post("/api/payments/webhook/nobank", { data: "{}" })).status()).toBe(404);
  expect((await request.post("/api/payments/webhook/NOT-VALID!", { data: "{}" })).status()).toBe(404);
  const exp = await request.get("/admin/commerce/export?type=orders", { maxRedirects: 0 });
  expect([302, 303, 307, 403]).toContain(exp.status());   // signed-out: sent to sign-in, never data
  const ret = await request.get("/pay/return?tx=00000000-0000-4000-8000-000000000000", { maxRedirects: 0 });
  expect(ret.status()).toBeGreaterThanOrEqual(300);
});

test("checkout, subscription and security pages require sign-in", async ({ page }) => {
  for (const p of ["/dashboard/subscription", "/dashboard/subscription/checkout/pe-premium", "/dashboard/security", "/dashboard/notifications", "/admin/commerce", "/admin/security"]) {
    await page.goto(p);
    await expect(page).toHaveURL(/\/login/);
  }
});
