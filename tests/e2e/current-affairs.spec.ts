import { expect, test } from "@playwright/test";

test("public current-affairs page explains the source-linked notes", async ({ page }) => {
  await page.goto("/current-affairs");
  await expect(page.getByRole("heading", { level: 1, name: "Current affairs for the BCSE" })).toBeVisible();
  await expect(page.getByText(/Practice questions are Soma questions, not RCSC questions/)).toBeVisible();
});

test("scheduler endpoint refuses callers without the token", async ({ request }) => {
  const none = await request.post("/api/cron/current-affairs");
  expect([401, 503]).toContain(none.status());
  const wrong = await request.post("/api/cron/current-affairs", { headers: { Authorization: "Bearer wrong" } });
  expect([401, 503]).toContain(wrong.status());
  const get = await request.get("/api/cron/current-affairs");
  expect(get.status()).toBe(405);
});
