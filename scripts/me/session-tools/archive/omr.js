const { chromium, devices } = require('playwright');
const out = process.argv[2];
async function scribble(page, canvas, mode) {
  const b = await canvas.boundingBox();
  const cx = b.x + b.width / 2, cy = b.y + b.height / 2;
  await page.mouse.move(cx, cy); await page.mouse.down();
  if (mode === 'good') { for (let r = 2; r <= 17; r += 3) for (let a = 0; a <= 6.4; a += 0.3) await page.mouse.move(cx + r * Math.cos(a), cy + r * Math.sin(a)); }
  if (mode === 'light') { await page.mouse.move(cx + 6, cy + 2); await page.mouse.move(cx - 4, cy - 3); }
  if (mode === 'outside') { for (let r = 2; r <= 29; r += 3) for (let a = 0; a <= 6.4; a += 0.3) await page.mouse.move(cx + r * Math.cos(a), cy + r * Math.sin(a)); }
  await page.mouse.up();
}
(async () => {
  const b = await chromium.launch();
  const c = await b.newContext({ ...devices['iPhone 13'] });
  const p = await c.newPage();
  await p.goto('http://localhost:3123/dev/home-preview?screen=pe-new', { waitUntil: 'networkidle' });
  await p.evaluate(() => window.scrollTo(0, 650)); await p.waitForTimeout(300);
  await p.screenshot({ path: out + '/omr-tiles.png' });
  await p.goto('http://localhost:3123/dev/home-preview?screen=omr-practice', { waitUntil: 'networkidle' });
  const cv = p.locator('canvas');
  await scribble(p, cv.nth(1), 'good'); await scribble(p, cv.nth(4), 'light'); await scribble(p, cv.nth(10), 'outside');
  await p.waitForTimeout(300);
  await p.locator('ol').scrollIntoViewIfNeeded();
  await p.screenshot({ path: out + '/omr-practice.png' });
  await p.goto('http://localhost:3123/dev/exam-preview', { waitUntil: 'networkidle' });
  await scribble(p, p.locator('canvas').nth(1), 'good');
  await p.waitForTimeout(300);
  await p.screenshot({ path: out + '/omr-exam.png' });
  await b.close();
})();
