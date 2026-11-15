import { expect, test } from "@playwright/test";

test("protected areas redirect signed-out visitors to sign in, preserving the destination", async ({ page }) => {
  for (const path of ["/dashboard", "/dashboard/profile", "/admin", "/admin/users"]) {
    await page.goto(path);
    await expect(page).toHaveURL(new RegExp(`/login\\?next=${encodeURIComponent(path).replace(/%2F/g, "(%2F|/)")}`));
    await expect(page.getByRole("heading", { name: "Sign in to Soma" })).toBeVisible();
  }
});

test("registration validates input on the server", async ({ page }) => {
  await page.goto("/register");
  await page.getByLabel("Full name").fill("K");
  await page.getByLabel("Email").fill("not-an-email");
  await page.getByLabel("Password", { exact: true }).fill("short");
  await page.getByLabel("Confirm password").fill("different");
  await page.getByRole("button", { name: "Create free account" }).click();
  await expect(page.getByText("Enter your full name.")).toBeVisible();
  await expect(page.getByText("Enter a valid email address.")).toBeVisible();
  await expect(page.getByText(/Use at least 8 characters/)).toBeVisible();
  await expect(page.getByText("Please accept the terms of use to continue.")).toBeVisible();
});

test("valid registration explains when the auth service is not configured", async ({ page }) => {
  await page.goto("/register");
  await page.getByLabel("Full name").fill("Karma Wangmo");
  await page.getByLabel("Email").fill("karma@example.bt");
  await page.getByLabel("Password", { exact: true }).fill("dzong2026x");
  await page.getByLabel("Confirm password").fill("dzong2026x");
  await page.getByRole("checkbox").check();
  await page.getByRole("button", { name: "Create free account" }).click();
  await expect(page.getByText(/authentication service is not configured/)).toBeVisible();
});

test("sign in shows a generic message and an expired-link notice", async ({ page }) => {
  await page.goto("/login?error=link");
  await expect(page.getByText(/invalid or has expired/)).toBeVisible();
  await page.getByLabel("Email").fill("someone@example.bt");
  await page.getByLabel("Password").fill("whatever1");
  await page.getByRole("button", { name: "Sign in" }).click();
  await expect(page.getByText(/not configured/)).toBeVisible();
});

test("contact form validates and responds", async ({ page }) => {
  await page.goto("/contact");
  await page.getByRole("button", { name: "Send message" }).click();
  await expect(page.getByText("Please enter your name.")).toBeVisible();
  await page.getByLabel("Full name").fill("Sonam");
  await page.getByLabel("Email").fill("sonam@example.bt");
  await page.getByLabel("Message").fill("I would like to know when PE practice opens.");
  await page.getByRole("button", { name: "Send message" }).click();
  await expect(page.getByText(/cannot be sent from this environment/)).toBeVisible();
});

test("auth callback rejects missing or invalid links", async ({ page }) => {
  await page.goto("/auth/confirm?token_hash=x&type=bogus");
  await expect(page).toHaveURL(/\/login\?error=link/);
});

test("mobile menu opens and navigates", async ({ page, isMobile }) => {
  test.skip(!isMobile, "mobile only");
  await page.goto("/");
  await page.getByRole("button", { name: "Open menu" }).click();
  await page.getByRole("dialog").getByRole("link", { name: "ME preparation" }).click();
  await expect(page).toHaveURL(/\/me$/);
  await expect(page.getByRole("heading", { level: 1 })).toHaveText("Main Examination (ME)");
});

test("email links without a token or code are rejected", async ({ page }) => {
  await page.goto("/auth/confirm?next=/dashboard");
  await expect(page).toHaveURL(/\/login\?error=link/);
});
