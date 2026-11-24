const { chromium, devices } = require('playwright');
(async () => {
  for (let i = 0; i < 30; i++) { try { await fetch('http://localhost:3123/'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  const b = await chromium.launch();
  const ctx = await b.newContext({ ...devices['iPhone 13'] });
  const p = await ctx.newPage();
  const go = async (u, name, full = true) => { await p.goto('http://localhost:3123' + u, { waitUntil: 'networkidle' }); await p.screenshot({ path: `x-${name}.png`, fullPage: full }); };
  await go('/dev/home-preview?screen=choose', 'choose');
  await go('/dev/home-preview?screen=pe-packages', 'pe-packages');
  await go('/dev/home-preview?screen=mock-free', 'free-limit', false);
  await b.close();
})();
