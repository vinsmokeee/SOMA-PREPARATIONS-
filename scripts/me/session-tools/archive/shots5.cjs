const { chromium, devices } = require('playwright');
(async () => {
  for (let i = 0; i < 30; i++) { try { await fetch('http://localhost:3123/'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  const b = await chromium.launch();
  const ctx = await b.newContext({ ...devices['iPhone 13'] });
  const p = await ctx.newPage();
  const go = async (u, name) => { await p.goto('http://localhost:3123' + u, { waitUntil: 'networkidle' }); await p.screenshot({ path: `z-${name}.png` }); };
  await go('/', 'home');
  await go('/dev/home-preview?screen=ca-box', 'ca');
  await go('/dev/home-preview?screen=pe', 'pe');
  await b.close();
})();
