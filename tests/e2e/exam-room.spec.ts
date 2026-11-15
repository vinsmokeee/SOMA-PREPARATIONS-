import { expect, test, type Page } from "@playwright/test";

const calls = (page: Page) => page.evaluate(() => window.__somaExam ?? { saves: [], submits: 0, failNext: 0 });

test.describe("PE examination room", () => {
  test("answer, flag, navigate, OMR sheet, review and submit", async ({ page, isMobile }) => {
    await page.goto("/dev/exam-preview?stage=PE&seconds=1800");
    await expect(page.getByRole("timer")).toBeVisible();
    await expect(page.getByText("Question 1 of 10")).toBeVisible();

    // Answer Q1
    await page.getByText("Option B for question 1").click();
    await expect.poll(async () => (await calls(page)).saves.length).toBeGreaterThan(0);
    const firstSave = (await calls(page)).saves[0];
    expect(firstSave.selectedOptionId).toBeTruthy();

    // Flag Q1, go next, answer Q2
    await page.locator("button[aria-pressed]").click();
    await expect(page.locator("button[aria-pressed]")).toHaveAttribute("aria-pressed", "true");
    await page.getByRole("button", { name: "Next" }).click();
    await expect(page.getByText("Question 2 of 10")).toBeVisible();
    await page.getByText("Option C for question 2").click();

    // Palette (sidebar on desktop, dialog on mobile) jumps to Q5
    if (isMobile) await page.getByRole("button", { name: "All questions" }).click();
    await page.getByRole("button", { name: /^Question 5, not answered/ }).first().click();
    await expect(page.getByText("Question 5 of 10")).toBeVisible();

    // OMR sheet: fill Q3 bubble D
    if (isMobile) {
      await page.getByRole("button", { name: "All questions" }).click();
      await page.getByRole("button", { name: "Open answer sheet (OMR)" }).click();
    } else {
      await page.getByRole("button", { name: "Open answer sheet (OMR)" }).click();
    }
    await expect(page.getByRole("heading", { name: "Answer sheet" })).toBeVisible();
    await page.getByRole("radiogroup", { name: "Answer for question 3" }).getByRole("radio", { name: "Option D" }).click();
    await expect(page.getByRole("radiogroup", { name: "Answer for question 3" }).getByRole("radio", { name: "Option D" })).toHaveAttribute("aria-checked", "true");

    // Review screen shows counts
    if (isMobile) {
      await page.getByRole("button", { name: "Back to questions" }).click();
      await page.getByRole("button", { name: "All questions" }).click();
      await page.getByRole("dialog").getByRole("button", { name: "Review and submit" }).click();
    } else {
      await page.getByRole("button", { name: "Review and submit" }).click();
    }
    await expect(page.getByRole("heading", { name: "Final review" })).toBeVisible();
    const answered = page.locator("dt", { hasText: /^Answered$/ }).locator("xpath=following-sibling::dd");
    await expect(answered).toHaveText("3");
    const flagged = page.locator("dt", { hasText: /^Marked for review$/ }).locator("xpath=following-sibling::dd");
    await expect(flagged).toHaveText("1");

    // Submit with confirmation
    await page.getByRole("button", { name: "Submit examination" }).first().click();
    await expect(page.getByRole("dialog")).toContainText("You have answered 3 of 10 questions");
    await page.getByRole("dialog").getByRole("button", { name: "Submit examination" }).click();
    await expect(page.getByRole("heading", { name: "Examination submitted" })).toBeVisible();
    expect((await calls(page)).submits).toBe(1);
  });

  test("failed saves show offline status and are retried", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=PE&failSaves=2");
    await page.getByText("Option A for question 1").click();
    await expect(page.getByRole("status").filter({ hasText: "Offline" })).toBeVisible();
    await expect.poll(async () => (await calls(page)).saves.length, { timeout: 15000 }).toBeGreaterThan(0);
    await expect(page.getByRole("status").filter({ hasText: "Offline" })).toHaveCount(0, { timeout: 15000 });
  });

  test("answers survive a page reload (device backup)", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=PE");
    await page.getByText("Option C for question 1").click();
    await page.reload();
    await expect(page.getByRole("radio", { name: /Option C for question 1/ })).toBeChecked();
  });

  test("submits automatically when time runs out", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=PE&seconds=4");
    await page.getByText("Option A for question 1").click();
    await expect(page.getByRole("heading", { name: "Examination submitted" })).toBeVisible({ timeout: 15000 });
    const c = await calls(page);
    expect(c.submits).toBe(1);
    expect(c.saves.length).toBeGreaterThan(0);
  });
});

test.describe("ME written examination room", () => {
  test("written answers count words and autosave after typing pauses", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=ME");
    await expect(page.getByText("Question 1 of 2")).toBeVisible();
    const box = page.getByLabel("Your answer");
    await box.fill("Preliminary examinations shortlist candidates fairly.");
    await expect(page.getByText(/^5 words of about 100/)).toBeVisible();
    await expect.poll(async () => (await calls(page)).saves.some((s) => s.textAnswer?.includes("shortlist")), { timeout: 8000 }).toBe(true);
    await page.getByRole("button", { name: "Next" }).click();
    await expect(page.getByText("Question 2 of 2")).toBeVisible();
    await expect(page.getByRole("button", { name: "Review answers" })).toBeVisible();
  });
});

