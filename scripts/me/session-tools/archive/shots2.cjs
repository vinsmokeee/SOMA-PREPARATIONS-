const { chromium, devices } = require('playwright');
(async () => {
  for (let i = 0; i < 30; i++) { try { await fetch('http://localhost:3123/'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  const b = await chromium.launch();
  const ctx = await b.newContext({ ...devices['iPhone 13'] });
  const p = await ctx.newPage();
  const go = async (u, name) => { await p.goto('http://localhost:3123' + u, { waitUntil: 'networkidle' }); await p.screenshot({ path: `w-${name}.png`, fullPage: true }); };
  await go('/packages', 'packages');
  await go('/dev/home-preview?screen=choose', 'choose');
  await go('/dev/home-preview?screen=pe-free', 'pe');
  await go('/dev/home-preview?screen=me-entry', 'me-entry');
  await go('/dev/home-preview?screen=me-general', 'me-general');
  await go('/dev/home-preview?screen=pe-packages', 'pe-packages');
  await b.close();
})();
