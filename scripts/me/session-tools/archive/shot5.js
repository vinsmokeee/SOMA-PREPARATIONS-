const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ ...devices['iPhone 13'] });
  for (let i = 0; i < 30; i++) { try { await p.goto('http://localhost:3123/dev/home-preview?screen=me'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  await p.locator('#sec-h').evaluate((e) => e.scrollIntoView());
  await p.screenshot({ path: process.argv[2] + '/home-me3.png' });
  await b.close();
})();
