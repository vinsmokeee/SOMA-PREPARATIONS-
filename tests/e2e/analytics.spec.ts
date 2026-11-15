import { expect, test } from "@playwright/test";

test("analytics components render readably with keyboard-accessible tooltips", async ({ page }) => {
  await page.goto("/dev/analytics-preview");
  await expect(page.getByText("Developing").first()).toBeVisible();
  await expect(page.getByText("Not enough practice yet")).toBeVisible();
  await expect(page.getByText(/does not predict your result/).first()).toBeVisible();
  // Keyboard focus on a point shows its tooltip
  await page.locator('svg rect[tabindex="0"]').first().focus();
  await expect(page.getByRole("status").filter({ hasText: "accuracy" })).toBeVisible();
  // Table view exists for screen readers
  await page.getByText("Show as table").click();
  await expect(page.locator("table tbody tr")).toHaveCount(9);
  // No horizontal scrolling
  expect(await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth + 1)).toBe(false);
  // Axis labels keep a readable size on every screen
  const fontPx = await page.locator("svg text").first().evaluate((el) => (el as SVGTextElement).getBoundingClientRect().height);
  expect(fontPx).toBeGreaterThanOrEqual(10);
});

test("new student pages require sign-in", async ({ page }) => {
  for (const path of ["/dashboard/practice", "/dashboard/analytics", "/dashboard/papers"]) {
    await page.goto(path);
    await expect(page).toHaveURL(/\/login\?next=/);
  }
});
