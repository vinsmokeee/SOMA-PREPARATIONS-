const { chromium, devices } = require('playwright');
(async () => {
  for (let i = 0; i < 30; i++) { try { await fetch('http://localhost:3123/'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  const b = await chromium.launch();
  const ctx = await b.newContext({ ...devices['iPhone 13'] });
  const p = await ctx.newPage();
  for (const s of ['pe-upgrade']) {
    await p.goto('http://localhost:3123/dev/home-preview?screen=' + s, { waitUntil: 'networkidle' });
    await p.screenshot({ path: `v-${s}.png`, fullPage: true });
  }
  await b.close();
})();
