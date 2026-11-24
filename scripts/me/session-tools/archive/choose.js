const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await (await b.newContext({ ...devices['iPhone 13'] })).newPage();
  await p.goto('http://localhost:3123/dev/exam-preview?sample=choose', { waitUntil: 'networkidle' });
  await p.screenshot({ path: process.argv[2] + '/choose-1.png' });
  await p.getByRole('button', { name: 'Choose this question' }).first().click();
  await p.getByRole('button', { name: 'Choose this question' }).first().click();
  await p.locator('article').nth(2).scrollIntoViewIfNeeded();
  await p.evaluate(() => window.scrollBy(0, -250));
  await p.screenshot({ path: process.argv[2] + '/choose-2.png' });
  await b.close();
})();
