const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ ...devices['iPhone 13'] });
  for (const [screen, out, sel] of [["me", "home-me.png", "#sec-h"], ["notebook-me", "nb-me-choose.png", null], ["notebook-me-paper", "nb-me-paper.png", null]]) {
    for (let i = 0; i < 30; i++) { try { await p.goto('http://localhost:3123/dev/home-preview?screen=' + screen); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
    if (sel) await p.locator(sel).evaluate((e) => e.scrollIntoView());
    await p.screenshot({ path: process.argv[2] + '/' + out });
  }
  await b.close();
})();
