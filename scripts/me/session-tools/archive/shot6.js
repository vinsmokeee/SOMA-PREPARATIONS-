const { chromium, devices } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ ...devices['iPhone 13'] });
  for (let i = 0; i < 30; i++) { try { await p.goto('http://localhost:3123/dev/exam-preview?stage=ME&seconds=5400'); break; } catch { await new Promise(r => setTimeout(r, 1000)); } }
  await p.getByRole('button', { name: 'Pause' }).click();
  await p.getByRole('button', { name: 'Pause examination' }).click();
  await p.getByText("Please don't cheat").waitFor();
  await p.screenshot({ path: process.argv[2] + '/honesty.png' });
  await p.getByText('Examination paused').waitFor({ timeout: 8000 });
  await b.close();
})();
