import { expect, test } from "@playwright/test";

test("daily plan shows each item with the right action and no horizontal scroll", async ({ page }) => {
  await page.goto("/dev/training-preview");
  await expect(page.getByText("Daily practice: mixed")).toBeVisible();
  await expect(page.getByRole("button", { name: "Review" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Continue" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Start" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Do it anyway" })).toBeVisible();
  await expect(page.getByRole("button", { name: "Skip" })).toHaveCount(2);
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth)).toBe(true);
});

test("training pages require sign-in", async ({ page }) => {
  await page.goto("/dashboard/training");
  await expect(page).toHaveURL(/\/login/);
});
