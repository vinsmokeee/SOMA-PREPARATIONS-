const { chromium, devices } = require('playwright');
(async () => {
  for (let i = 0; i < 40; i++) { try { await fetch('http://localhost:3123/'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  const b = await chromium.launch();
  const ctx = await b.newContext({ ...devices['iPhone 13'] });
  const p = await ctx.newPage();
  await p.goto('http://localhost:3123/dev/exam-preview?sample=past&untimed=1', { waitUntil: 'networkidle' });
  await p.screenshot({ path: 'pp-1.png', fullPage: true });
  for (const n of [2, 3]) {
    await p.getByRole('button', { name: /^Next/ }).first().click();
    await p.waitForTimeout(400);
    await p.screenshot({ path: `pp-${n}.png`, fullPage: true });
  }
  await b.close();
})();
