import { expect, test } from "@playwright/test";

test("ME mock: choose the questions first, exactly as many as each part allows", async ({ page }) => {
  await page.goto("/dev/exam-preview?sample=choose");
  await expect(page.getByRole("heading", { name: "Choose your questions first" })).toBeVisible();
  await expect(page.getByRole("timer")).toContainText("Reading");
  const start = page.getByRole("button", { name: "Start writing" });
  await expect(start).toBeDisabled();
  await expect(page.getByText("Choose 2 more questions in Part A: Bhutan and its socio-political institutions")).toBeVisible();

  const choose = page.getByRole("button", { name: "Choose this question" });
  await choose.first().click(); // Part A, question 1
  await choose.first().click(); // Part A, question 2
  // Part A is full: its other questions are locked until one is removed
  await expect(page.getByRole("button", { name: /You have chosen 2/ })).toHaveCount(2);
  await expect(page.getByText("0 of 3 chosen")).toBeVisible();
  for (let i = 0; i < 3; i++) await page.getByRole("button", { name: "Choose this question" }).first().click();
  await expect(page.getByText("Ready: you will answer your chosen questions, one part at a time.")).toBeVisible();
  await expect(start).toBeEnabled();

  // Removing one locks writing again
  await page.getByRole("button", { name: /Chosen · tap to remove/ }).first().click();
  await expect(start).toBeDisabled();
});
