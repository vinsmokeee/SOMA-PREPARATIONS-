import { expect, test } from "@playwright/test";

// Founder, 22 Nov 2026: an ME Premium student confirms their subject once; then other subjects are locked.
test("ME Premium: subject confirmation pop-up, then the subject shows as locked", async ({ page }) => {
  await page.goto("/dev/home-preview?screen=me-confirm");
  const dialog = page.getByRole("dialog", { name: "Subject confirmation" });
  await expect(dialog).toBeVisible();
  await expect(dialog.getByText("Technical Service · Civil Engineering · Engineering")).toBeVisible();
  await expect(dialog.getByText("This cannot be undone.")).toBeVisible();
  await expect(dialog.getByRole("button", { name: "Yes, this is my subject. Confirm" })).toBeVisible();
  await expect(dialog.getByRole("link", { name: "No, choose another subject" })).toHaveAttribute("href", "/dashboard/me?change=1");
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth)).toBe(true);

  await page.goto("/dev/home-preview?screen=me");
  await expect(page.getByText("Subject locked")).toBeVisible();
  await expect(page.getByRole("link", { name: "Change entry" })).toHaveCount(0);
});

// Founder, 23 Nov 2026: Today's plan shows which day it is for (it renews at midnight Bhutan time).
test("Today's plan shows today's date", async ({ page }) => {
  await page.goto("/dev/home-preview?screen=pe");
  await expect(page.getByRole("heading", { name: /Today's plan/ })).toBeVisible();
  await expect(page.getByTestId("plan-day")).toHaveText(/^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday),? \d{1,2} \w+$/);
});
