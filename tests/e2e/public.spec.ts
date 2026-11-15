import { expect, test } from "@playwright/test";

const PUBLIC_PAGES = ["/", "/about", "/pe", "/me", "/packages", "/practice", "/samples", "/current-affairs", "/resources", "/contact", "/faq", "/terms", "/privacy", "/disclaimer", "/login", "/register", "/forgot-password"];

for (const path of PUBLIC_PAGES) {
  test(`${path} renders without errors or horizontal scrolling`, async ({ page }) => {
    const errors: string[] = [];
    page.on("pageerror", (e) => errors.push(e.message));
    const res = await page.goto(path);
    expect(res?.status()).toBe(200);
    await expect(page.locator("h1").first()).toBeVisible();
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth + 1);
    expect(overflow, "page scrolls horizontally").toBe(false);
    expect(errors).toEqual([]);
  });
}

test("home page communicates PE and ME preparation with clear calls to action", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { level: 1 })).toContainText("BCSE");
  await expect(page.getByRole("heading", { name: "Preliminary Examination" })).toBeVisible();
  await expect(page.getByRole("heading", { name: "Main Examination" })).toBeVisible();
  await expect(page.getByRole("link", { name: /create a free account/i }).first()).toBeVisible();
  // No guarantee claims
  await expect(page.locator("body")).not.toContainText(/guaranteed (selection|success|pass)/i);
});

test("PE page shows the official subject areas and does not invent parameters", async ({ page }) => {
  await page.goto("/pe");
  for (const s of ["English communication skills", "Dzongkha communication skills", "Logic, analytical ability and problem-solving", "Data interpretation ability", "General awareness and current affairs"]) {
    await expect(page.getByText(s, { exact: true })).toBeVisible();
  }
  await expect(page.getByText("Not stated in the recorded RCSC source")).toHaveCount(3);
  await expect(page.getByRole("link", { name: /Announcement for Bhutan Civil Service Examination \(BCSE\) 2026/ })).toHaveAttribute("href", /rcsc\.gov\.bt/);
});

test("ME page shows each category group with official weightages", async ({ page }) => {
  await page.goto("/me");
  const groups = page.locator("article");
  await expect(groups).toHaveCount(4);
  const general = groups.filter({ hasText: "Administrative Service" });
  await expect(general).toContainText("Finance Service");
  await expect(general).toContainText("Education Service (PGDE)");
  await expect(general).toContainText("40%");
  const bed = groups.filter({ hasText: "B.Ed. Graduates" });
  await expect(bed).toContainText("Teacher Aptitude Test");
  await expect(bed).toContainText("30%");
  await expect(bed).toContainText("Academic Achievement 20%");
  await expect(page.getByText("None of it is an official RCSC mark.")).toBeVisible();
});

test("packages page shows database prices and does not allow buying coming-soon packages", async ({ page }) => {
  await page.goto("/packages");
  await expect(page.getByText("Nu. 499")).toBeVisible();
  await expect(page.getByText("Nu. 799")).toBeVisible();
  const buttons = page.getByRole("button", { name: "Purchasing opens soon" });
  await expect(buttons).toHaveCount(2);
  await expect(buttons.first()).toBeDisabled();
});

test("FAQ accordion opens", async ({ page }) => {
  await page.goto("/faq");
  await page.getByRole("button", { name: "Is Soma part of the RCSC?" }).click();
  await expect(page.getByText(/independent, private preparation platform/)).toBeVisible();
});

test("unknown pages return 404", async ({ page }) => {
  const res = await page.goto("/does-not-exist");
  expect(res?.status()).toBe(404);
  await expect(page.getByRole("heading", { name: "Page not found" })).toBeVisible();
});
