const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  for (const [name, opts] of [['desktop', { viewport: { width: 1280, height: 900 } }], ['phone', { ...devices['iPhone 13'] }]]) {
    const ctx = await b.newContext(opts); const p = await ctx.newPage();
    const errs = []; p.on('pageerror', e => errs.push(e.message));
    await p.goto('http://localhost:3100/dev/analytics-preview');
    await p.locator('svg rect[tabindex="0"]').nth(6).hover();
    await p.waitForTimeout(200);
    await p.screenshot({ path: `${process.argv[2]}/analytics-${name}.png`, fullPage: true });
    const overflow = await p.evaluate(() => document.documentElement.scrollWidth > window.innerWidth);
    console.log(name, overflow ? 'H-OVERFLOW' : 'ok', errs.join('|'));
    await ctx.close();
  }
  await b.close();
})();
