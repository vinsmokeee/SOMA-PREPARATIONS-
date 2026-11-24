const { chromium, devices } = require('playwright');
(async () => {
  const out = process.argv[2];
  const b = await chromium.launch();
  for (const [name, opts] of [['desktop', { viewport: { width: 1366, height: 860 } }], ['phone', { ...devices['iPhone 13'] }]]) {
    const ctx = await b.newContext(opts); const p = await ctx.newPage();
    await p.goto('http://localhost:3100/dev/exam-preview?stage=PE');
    await p.getByText('Option B for question 1').click();
    await p.locator('button[aria-pressed]').click();
    await p.waitForTimeout(400);
    await p.screenshot({ path: `${out}/exam-pe-${name}.png` });
    if (name === 'phone') { await p.getByRole('button', { name: 'All questions' }).click(); await p.waitForTimeout(300); await p.screenshot({ path: `${out}/exam-palette-${name}.png` }); await p.keyboard.press('Escape'); }
    await p.goto('http://localhost:3100/dev/exam-preview?stage=ME');
    await p.getByLabel('Your answer').fill('The preliminary examination shortlists candidates for the main examination and ensures a minimum standard.');
    await p.screenshot({ path: `${out}/exam-me-${name}.png` });
    await ctx.close();
  }
  await b.close();
})();
