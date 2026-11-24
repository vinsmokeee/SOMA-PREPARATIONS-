const { chromium, devices } = require('playwright');
(async () => { const b = await chromium.launch(); const ctx = await b.newContext({ ...devices['iPhone 13'] }); const p = await ctx.newPage();
await p.goto('http://localhost:3100/dev/analytics-preview'); const el = p.locator('figure').first(); await el.screenshot({ path: process.argv[2] }); await b.close(); })();
