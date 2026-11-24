const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ ...devices['iPhone 13'] });
  const go = async (u) => { for (let i = 0; i < 30; i++) { try { await p.goto('http://localhost:3123' + u); return; } catch { await new Promise(r => setTimeout(r, 1000)); } } };
  await go('/dev/exam-preview?stage=ME&seconds=5400');
  await p.screenshot({ path: process.argv[2] + '/pause-btn.png' });
  await p.getByRole('button', { name: 'Pause' }).click();
  await p.getByText('Pause your examination?').waitFor();
  await p.screenshot({ path: process.argv[2] + '/pause-dialog.png' });
  await p.getByRole('button', { name: 'Pause examination' }).click();
  await p.getByText('Examination paused').waitFor();
  await go('/dev/home-preview?screen=me');
  await p.locator('#sec-h').evaluate((e) => e.scrollIntoView());
  await p.screenshot({ path: process.argv[2] + '/home-me2.png' });
  await b.close();
})();
