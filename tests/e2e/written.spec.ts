import { deflateSync } from "node:zlib";
import { expect, test } from "@playwright/test";

/** Minimal greyscale PNG encoder for generated answer-sheet photos. */
function png(w: number, h: number, pixel: (x: number, y: number) => number): Buffer {
  const raw = Buffer.alloc((w + 1) * h);
  for (let y = 0; y < h; y++) {
    raw[y * (w + 1)] = 0;
    for (let x = 0; x < w; x++) raw[y * (w + 1) + 1 + x] = pixel(x, y);
  }
  const crcTable = Array.from({ length: 256 }, (_, n) => { let c = n; for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1; return c >>> 0; });
  const crc = (b: Buffer) => { let c = 0xffffffff; for (const v of b) c = crcTable[(c ^ v) & 0xff] ^ (c >>> 8); return (c ^ 0xffffffff) >>> 0; };
  const chunk = (type: string, data: Buffer) => {
    const len = Buffer.alloc(4); len.writeUInt32BE(data.length);
    const td = Buffer.concat([Buffer.from(type), data]);
    const c = Buffer.alloc(4); c.writeUInt32BE(crc(td));
    return Buffer.concat([len, td, c]);
  };
  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(w, 0); ihdr.writeUInt32BE(h, 4); ihdr[8] = 8; ihdr[9] = 0; ihdr[10] = 0; ihdr[11] = 0; ihdr[12] = 0;
  return Buffer.concat([Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]), chunk("IHDR", ihdr), chunk("IDAT", deflateSync(raw)), chunk("IEND", Buffer.alloc(0))]);
}

// A sharp "handwritten" page: dark strokes on white, away from the edges.
const sharpPage = png(900, 1200, (x, y) => (y > 80 && y < 1120 && x > 60 && x < 840 && y % 24 < 3 && (x * 7 + y) % 40 < 28 ? 25 : 245));
const blankPage = png(900, 1200, () => 232);

test.describe("handwritten answers in the exam room", () => {
  test("choose method, check photo quality, upload, reorder and remove pages", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=ME");
    await expect(page.getByRole("radio", { name: "Type answer" })).toHaveAttribute("aria-checked", "true");
    await page.getByRole("radio", { name: "Upload handwritten" }).click();
    await expect(page.getByRole("button", { name: "Take photo" })).toBeVisible();

    await page.locator('input[type="file"][multiple]').setInputFiles([
      { name: "page1.png", mimeType: "image/png", buffer: sharpPage },
      { name: "blank.png", mimeType: "image/png", buffer: blankPage },
    ]);
    const staged = page.getByTestId("staged-page");
    await expect(staged).toHaveCount(2);
    await expect(staged.nth(0).getByText("Looks good.")).toBeVisible();
    await expect(staged.nth(1).getByText(/page looks empty/)).toBeVisible();

    // Rotate and crop controls work on a staged photo
    await staged.nth(0).getByRole("button", { name: "Rotate right" }).click();
    await staged.nth(0).getByRole("button", { name: "Crop" }).click();
    await expect(staged.nth(0).getByText("Trim edges (%)")).toBeVisible();

    await page.getByRole("button", { name: /Upload 2 pages/ }).click();
    const uploaded = page.getByTestId("uploaded-page");
    await expect(uploaded).toHaveCount(2);
    await expect(page.getByText(/2 of 4 pages/)).toBeVisible();

    await page.getByRole("button", { name: "Move page 2 up" }).click();
    await expect(uploaded.nth(0).getByText("⚠")).toBeVisible(); // the blank page (with a warning) is now first
    await page.getByRole("button", { name: "Remove page 1" }).click();
    await expect(uploaded).toHaveCount(1);

    // Switching back to typing shows the editor
    await page.getByRole("radio", { name: "Type answer" }).click();
    await expect(page.getByLabel("Your answer")).toBeVisible();
  });

  test("an English essay is typed only (no upload option)", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=ME");
    await page.getByRole("button", { name: /^Next/ }).first().click();
    await expect(page.getByText("Preview: write an essay on public service")).toBeVisible();
    await expect(page.getByLabel("Your answer")).toBeVisible();
    await expect(page.getByRole("radio", { name: "Upload handwritten" })).toHaveCount(0);
  });

  test("untimed practice hides the countdown", async ({ page }) => {
    await page.goto("/dev/exam-preview?stage=ME&untimed=1");
    await expect(page.getByText("Untimed practice")).toBeVisible();
    await expect(page.getByRole("timer")).toHaveCount(0);
  });
});

test.describe("AI evaluation view", () => {
  test("shows an indicative score, criteria and feedback", async ({ page }) => {
    await page.goto("/dev/written-preview");
    await expect(page.getByText("Indicative AI score — not an official RCSC mark.")).toBeVisible();
    await expect(page.getByText("Content and accuracy")).toBeVisible();
    await expect(page.getByText("Separation of powers", { exact: true })).toBeVisible();
    await expect(page.getByText("Needs relevant examples")).toBeVisible();
    await expect(page.getByRole("button", { name: "Show improved answer" })).toBeVisible();
    await page.getByRole("button", { name: /Report an incorrect/ }).click();
    await expect(page.getByLabel("What is wrong?")).toBeVisible();
  });
  test("gives feedback without a score when there is no marking guide", async ({ page }) => {
    await page.goto("/dev/written-preview?scored=0");
    await expect(page.getByText("Feedback only — no score")).toBeVisible();
    await expect(page.getByText(/does not yet have an approved marking guide/).first()).toBeVisible();
  });
});
